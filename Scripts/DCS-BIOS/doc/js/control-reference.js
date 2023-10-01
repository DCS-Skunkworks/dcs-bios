function highlightThis() {
	var doc = document;
	if (doc.body.createTextRange) { // ms
		var range = doc.body.createTextRange();
		range.moveToElementText(this);
		range.select();
	} else if (window.getSelection) { // moz, opera, webkit
		var selection = window.getSelection();
		var range = doc.createRange();
		range.selectNodeContents(this);
		selection.removeAllRanges();
		selection.addRange(range);
	}
}

$(function() {
	var moduleSelect = $("<select>");
	_.each(docdata, function(value, key) {
		moduleSelect.append($("<option>").attr("value", key).text(key));
	});
	var headerDiv=$("<div style='background-color:#8EEF96; position:fixed; top:0px; left:0px; width:100%; z-index:10000'>");
	headerDiv.append($("<span>").text("Module: "));
	headerDiv.append(moduleSelect);
	$("#app").attr("style", "padding-top: 50px;");

	var viewSelect = $("<select>");
	viewSelect.append($("<option>").attr("value", "simple").text("Simple"));
	viewSelect.append($("<option>").attr("value", "advanced").text("Advanced"));
	if (typeof chrome != "undefined") {
		if (typeof chrome.sockets != "undefined") {
			if (typeof chrome.sockets.tcp != "undefined") {
				viewSelect.append($("<option>").attr("value", "livedata").text("Live Data"));
				viewSelect.val("livedata");
			}
		}
	}
	headerDiv.append($("<span>").text(" View: "));
	headerDiv.append(viewSelect);


	var categoryFilter = $("<select>");
	headerDiv.append($("<span>").text(" Category Filter: "));
	headerDiv.append(categoryFilter);

	headerDiv.append($('<span> </span>'));

	var button = $("<button>").text("Pointer Calibration Tool");
	button.on("click", function() {
		$("#pointercal").toggle(!$("#pointercal").is(':visible'));
	});
	headerDiv.append(button);

	headerDiv.append($('<span> </span>'));

 	var button2 = $("<button>").text("Refresh");
    button2.on("click", function() {
		chrome.runtime.reload()
    });
    headerDiv.append(button2);

	headerDiv.append($('<span> </span>'));

	var button3 = $("<button>").text("?");
	button3.on("click", function() {
		window.open('../Start.html');
		//chrome.browser.openTab({url: "Start.html"});
	});
	headerDiv.append(button3);

	$("#app").append(headerDiv);
	$("#app").append($('<iframe id="pointercal" style="display:none" src="pointercal.html" width="100%" height="500"></iframe>'));

	var controlsDiv = $("<div>");
	$("#app").append(controlsDiv);

	var exportStreamListeners = [];

	var init = function() {
		augmentData();

		moduleSelect.on("change", onModuleSelect);
		onModuleSelect();

		categoryFilter.on("change", redraw);
		viewSelect.on("change", redraw);

		$(document).on("dcs-bios-write", function(evt, address, data) {
			_.each(exportStreamListeners, function(listener) {
				listener(address, data);
			});
		});
	}

	var defaultSnippetPrecedence = [
		"Switch2Pos",
		"Switch3Pos",
		"SwitchMultiPos",
		"RotaryEncoder_variable_step",
		"RotaryEncoder_fixed_step",
		"ActionButton",
		"LED",
		"StringBuffer",
		"ServoOutput",
		"generic_integer_output",
		"Matrix2Pos",
		"Matrix3Pos",
		"AnalogMultiPos",
	];

	var augmentData = function() {
		// add information about example code snippets
		_.each(docdata, function(module) {
			_.each(module, function(controls) {
				_.each(controls, augmentControl);
			})
		});
	};

	var augmentControl = function(control) {
		var defaultSnippet = null;
		var io = null;
		var add_snippet = function(type) {
			var snippet_def = { "type":type, "default":false };
			io.snippets.push(snippet_def);
			if (!defaultSnippet
				|| defaultSnippetPrecedence.indexOf(type) < defaultSnippetPrecedence.indexOf(defaultSnippet.type)) {
				defaultSnippet = snippet_def;
			}
			return snippet_def;
		};
		_.each(control.inputs, function(input) {
			input.snippets = [];
			io = input;
			switch(input["interface"]) {
			case "set_state":
				if (input.max_value < 33) {
					var snippet = add_snippet("SwitchMultiPos");
					snippet.pin_template = 'PIN_0';
					for (var i=1; i <= input.max_value; i++)
						snippet.pin_template += ", PIN_" + i.toString();
				}
				if (input.max_value == 1)
					add_snippet("Switch2Pos");
				if (input.max_value == 1)
					add_snippet("Matrix2Pos");
				if (input.max_value == 2)
					add_snippet("Switch3Pos");
				if (input.max_value == 2)
					add_snippet("Matrix3Pos");
				if (input.max_value <= 20)
					add_snippet("AnalogMultiPos");
				if (input.max_value == 65535)
					add_snippet("Potentiometer");
				break;
			case "variable_step":
				add_snippet("RotaryEncoder_variable_step");
				break;
			case "fixed_step":
				add_snippet("RotaryEncoder_fixed_step");
				break;
			case "action":
				add_snippet("ActionButton");
				break;
			}
		});
		_.each(control.outputs, function(output) {
			output.snippets = [];
			io = output;
			switch(output["type"]) {
			case "integer":
				add_snippet("generic_integer_output");
				if (output.max_value == 1)
					add_snippet("LED");
				if (output.max_value == 65535)
					add_snippet("ServoOutput");
				break;

			case "float":
				add_snippet("FloatBuffer");
				break;

			case "string":
				add_snippet("StringBuffer");
				break;
			}
		});
		defaultSnippet.default = true;
		control.default_snippet = defaultSnippet;
	}

	var moduleData;

	var onModuleSelect = function() {
		moduleData = docdata[moduleSelect.val()];
		categoryFilter.empty();
		categoryFilter.append($("<option>").attr("value", "").text("Show All"));
		_.each(moduleData, function(value, key) {
			categoryFilter.append($("<option>").attr("value", key).text(key));
		});
		redraw();
	};

	var redraw = function() {
		exportStreamListeners = [];
		controlsDiv.empty();
		_.each(moduleData, function(controls, category) {
			if (categoryFilter.val().length > 0 && category != categoryFilter.val())
				return;
			controlsDiv.append($("<h2>").text(category));
			_.each(controls, function(control) {
				if (control) {
				controlsDiv.append(makeControl(control));
				}
			});
		});
	};

	var makeControl = function(control) {
		var div = $("<div>");
		div.append($("<div>")
			       .attr("class", "controlheader")
			       .append($("<span>")
                           .attr("class", "controldescription").text(control.description))
  	               .append($("<span>")
                           .attr("class", "controlidentifier").text(moduleSelect.val()+"/"+control.identifier)
                           .on("click", highlightThis))
			      );

		var bodyDiv = $("<div>").attr("class", "controlbody");
		div.append(bodyDiv);
		var inputDiv = $("<div>").attr("class", "inputs");
		var outputDiv = $("<div>").attr("class", "outputs");
		bodyDiv.append(inputDiv);
		bodyDiv.append(outputDiv);

		if (viewSelect.val() == "simple") {
			_.each(control.inputs, function(input) {
				_.each(input.snippets, function(snippet) {
					if (snippet.default)
						inputDiv.append(makeSnippet(snippet, input, control));
				});
			});
			_.each(control.outputs, function(output) {
				_.each(output.snippets, function(snippet) {
					if (snippet.default)
						outputDiv.append(makeSnippet(snippet, output, control));
				});
			});
			return div;
		}

		_.each(control.inputs, function(input) {
			inputDiv.append(makeInput(input, control));
		});


		_.each(control.outputs, function(output) {
			outputDiv.append(makeOutput(output, control));
		});

		return div;
	};

	var idCamelCase = function(input) {
		var ret = "";
		var capitalize = false;
		for (var i = 0; i < input.length; i++) {
			if (input[i] == '_') {
				capitalize = true;
			} else {
				if (capitalize) {
					ret = ret + input[i].toUpperCase();
					capitalize = false;
				} else {
					ret = ret + input[i].toLowerCase();
				}
			}
		}
		return ret;
	};
	var hex = function(input) {
		if (input === 0)
			return "0x0000";
		var padTo = 4;
        if (!input)
            return "";
		if (!padTo)
			padTo = 4;
		var hex = input.toString(16)
		while (hex.length < padTo)
			hex = "0" + hex;
		return "0x" + hex;
	};

	var makeSnippet = function(snippet, io, control) {
		var code = $("<code>");
		code.on("click", highlightThis);

		var cid = control.identifier;
		switch(snippet.type) {
			case "ActionButton":
			code.append($("<span>").text("DcsBios::ActionButton "+idCamelCase(cid+"_"+io.argument)+'("'+cid+'", "'+io.argument+'", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(");"));
			break;

			case "RotaryEncoder_fixed_step":
			code.append($("<span>").text('DcsBios::RotaryEncoder '+idCamelCase(cid)+'("'+cid+'", "DEC", "INC", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN_A"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("PIN_B"));
			code.append($("<span>").text(');'));
			break;

			case "RotaryEncoder_variable_step":
			code.append($("<span>").text('DcsBios::RotaryEncoder '+idCamelCase(cid)+'("'+cid+'", "-'+io.suggested_step.toString()+'", "+'+io.suggested_step.toString()+'", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN_A"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("PIN_B"));
			code.append($("<span>").text(');'));
			break;

			case "Switch2Pos":
			code.append($("<span>").text('DcsBios::Switch2Pos '+idCamelCase(cid)+'("'+cid+'", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(");"));
			break;

			case "Matrix2Pos":
			code.append($("<span>").text('DcsBios::Matrix2Pos '+idCamelCase(cid)+'("'+cid+'", '));
			code.append($("<i>").attr("style", "color: red;").text("ROW"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("COL"));
			code.append($("<span>").text(');'));
			break

			case "Matrix3Pos":
			code.append($("<span>").text('DcsBios::Matrix3Pos '+idCamelCase(cid)+'("'+cid+'", '));
			code.append($("<i>").attr("style", "color: red;").text("ROW_A"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("COL_A"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("ROW_B"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("COL_B"));
			code.append($("<span>").text(');'));
			break;

			case "Switch3Pos":
			code.append($("<span>").text('DcsBios::Switch3Pos '+idCamelCase(cid)+'("'+cid+'", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN_A"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("PIN_B"));
			code.append($("<span>").text(');'));
			break;

			case "Potentiometer":
			code.append($("<span>").text('DcsBios::Potentiometer '+idCamelCase(cid)+'("'+cid+'", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(");"));
			break;

			case "SwitchMultiPos":
			code.append($("<span>").text('const byte '+idCamelCase(cid+'_PINS')+'['+(io.max_value+1).toString()+'] = {'));
			code.append($("<i>").attr("style", "color: red;").text(snippet.pin_template));
			code.append($("<span>").text("};"));
			code.append($("<br>"));
			code.append($("<span>").text('DcsBios::SwitchMultiPos '+idCamelCase(cid)+'("'+cid+'", '+idCamelCase(cid+'_PINS')+', '+(io.max_value+1).toString()+');'));
			break;

			case "AnalogMultiPos":
			code.append($("<span>").text('DcsBios::AnalogMultiPos '+idCamelCase(cid)+'("'+cid+'", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("STEPS"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("(RESOLUTION/STEPS)"));
			code.append($("<span>").text(');'));
			break;

			case "generic_integer_output":
			code.append($("<span>").text('void '+idCamelCase("ON_"+cid+"_CHANGE")+'(unsigned int newValue) {'));
			code.append($("<br>"));
			code.append($("<span>").html("&nbsp;&nbsp;&nbsp;&nbsp;"));
			code.append($("<span>").text("/* your code here */"));
			code.append($("<br>"));
			code.append($("<span>").text("}"));
			code.append($("<br>"));
			code.append($("<span>").text("DcsBios::IntegerBuffer "+idCamelCase(cid+"_BUFFER")+'('+io.address_mask_shift_identifier+', '+idCamelCase("ON_"+cid+"_CHANGE")+');'));
			break;

			case "LED":
			code.append($("<span>").text('DcsBios::LED '+idCamelCase(cid)+'('+io.address_mask_identifier+', '));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(");"));
			break;

			case "ServoOutput":
			code.append($("<span>").text('DcsBios::ServoOutput '+idCamelCase(cid)+'('+io.address_identifier+', '));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("544"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("2400"));
			code.append($("<span>").text(");"));
			break;

			case "StringBuffer":
			code.append($("<span>").text('void '+idCamelCase("ON_"+cid+"_CHANGE")+'(char* newValue) {'));
			code.append($("<br>"));
			code.append($("<span>").html("&nbsp;&nbsp;&nbsp;&nbsp;"));
			code.append($("<span>").text("/* your code here */"));
			code.append($("<br>"));
			code.append($("<span>").text("}"));
			code.append($("<br>"));
			code.append($("<span>").text("DcsBios::StringBuffer<"+io.max_length.toString()+"> "+idCamelCase(cid+io.suffix+"_BUFFER")+'('+io.address_identifier+', '+idCamelCase("ON_"+cid+"_CHANGE")+');'));
			break;

			case "FloatBuffer":
			var ending = "";
			if (io.max_value == 255) ending = ", true"
			code.append($("<span>").text("DcsBios::FloatBuffer "+idCamelCase(cid+io.suffix+"_BUFFER")+'('+io.address_mask_shift_identifier+', '+io.value_range[0].toFixed()+', '+io.value_range[1]+ending+');'));
			break;

		}
		return code;
	};

	var makeInput = function(input, control) {
		var div = $("<div>").attr("class", "input");
		if (viewSelect.val() == "simple") {
			div.append(makeSnippet(input.default_snippet, input, control));
		}
		if (viewSelect.val() == "advanced") {
			div.append($("<b>Input Interface: </b>"));
			div.append($("<span>").text(input["interface"]));
			div.append($("<b> Message: </b>"));
			div.append($("<span>").text(control.identifier));
			if (input["interface"] == "action")
				div.append($("<span>").text(" "+input.argument));
			if (input["interface"] == "fixed_step")
				div.append($("<span>").text(" <DEC|INC>"));
			if (input["interface"] == "variable_step")
				div.append($("<span> &lt;new_value&gt;|-&lt;decrease_by&gt;|+&lt;increase_by&gt;</span>"));
			if (input["interface"] == "set_state") {
				div.append($("<span>").text(" <new_value>"));
				div.append($("<b>").text(" Value Range:"));
				div.append($("<span>").text(" 0 ... "+input.max_value.toString()));
			}
			div.append($("<b> Description: </b>"));
			div.append($("<span>").text(input.description));
			_.each(input.snippets, function(snippet) {
				div.append(makeSnippet(snippet, input, control));
			});
		}

		if (viewSelect.val() == "livedata") {
			div.append($("<b>Input Interface: </b>"));
			div.append($("<span>").text(input["interface"]+" "));
			function appendActionButton(argument) {
				var button = $("<button>").text(argument);
				div.append(button);
				button.on("click", function() {
					$(document).trigger("dcs-bios-send", [control.identifier+" "+argument+"\n"]);
				});
			}
			if (input["interface"] == "action") {
				appendActionButton(input.argument);
			}
			if (input["interface"] == "fixed_step") {
				appendActionButton("DEC");
				appendActionButton("INC");
			}
			if (input["interface"] == "variable_step") {
				var slider = $("<input>")
				.attr("type", "range")
				.attr("value", input.suggested_step.toString())
				.attr("min", "1")
				.attr("max", input.max_value.toString())
				.attr("style", "width: 50%;");
				var decButton = $("<button>").text("-"+input.suggested_step.toString());
				var incButton = $("<button>").text("+"+input.suggested_step.toString());
				div.append(slider);
				div.append(decButton);
				div.append(incButton);
				slider.on("change", function() {
					decButton.text("-"+slider.val().toString());
					incButton.text("+"+slider.val().toString());
				});
				decButton.on("click", function() {
					$(document).trigger("dcs-bios-send", [control.identifier+" "+decButton.text()+"\n"]);
				});
				incButton.on("click", function() {
					$(document).trigger("dcs-bios-send", [control.identifier+" "+incButton.text()+"\n"]);
				});
			}
			if (input["interface"] == "set_state") {
				var slider = $("<input>")
				.attr("type", "range")
				.attr("value", "0")
				.attr("min", "0")
				.attr("max", input.max_value.toString());
				var button = $("<button>").text("0");
				div.append(slider);
				div.append(button);
				slider.on("change", function() {
					button.text(slider.val().toString());
				});
				button.on("click", function() {
					$(document).trigger("dcs-bios-send", [control.identifier+" "+button.text()+"\n"]);
				});
			}
		}

		return div;
	};

	var makeOutput = function(output, control) {
		var div = $("<div>").attr("class", "output");
		if (viewSelect.val() == "simple") return div;

		if (viewSelect.val() == "advanced") {
			div.append($("<b>Output Type: </b>"));
			div.append($("<span>").text(output.type));
			div.append($("<b> Address: </b>"));
			div.append($("<span>").text(hex(output.address)));
			if (output.type == "integer") {
				div.append($("<b> Mask: </b>"));
				div.append($("<span>").text(hex(output.mask)));
				div.append($("<b> Shift By: </b>"));
				div.append($("<span>").text(output.shift_by));
				div.append($("<b> Max. Value: </b>"));
				div.append($("<span>").text(output.max_value));
			}
			if (output.type == "string") {
				div.append($("<b> Max. Length: </b>"));
				div.append($("<span>").text(output.max_length));
			}
			div.append($("<b> Description: </b>"));
			div.append($("<span>").text(output.description));
			_.each(output.snippets, function(snippet) {
				div.append(makeSnippet(snippet, output, control));
			});
		}

		if (viewSelect.val() == "livedata") {
			div.append($("<b>Output Type: </b>"));
			div.append($("<span>").text(output.type));

			var currentValueWrapper = $("<span>");
			div.append(currentValueWrapper);
			currentValueWrapper.append($("<b> Current Value: </b>"));
			var currentValue = $("<span>").text("unknown");
			if (output.type == "integer") {
				var currentValueRotation = $('<span class="arrow">↑</span>').css({ "display": "inline-block;" });
				var currentValuePercent = $('<span style="color: orange;">');
				currentValueWrapper.append(currentValueRotation);
				currentValueWrapper.append(currentValue);
				currentValueWrapper.append(currentValuePercent);
				exportStreamListeners.push(function(address, data) {
					if (address[0] == output.address) {
						var value = (data[0] & output.mask) >> output.shift_by;
						currentValue.text(value.toString());
						var percent = value / output.max_value * 100;
						currentValuePercent.text(" ("+parseInt(percent).toString()+"%)");
						var rotationDeg = value / (output.max_value+1) * 360;
						currentValueRotation.css({ "WebkitTransform": "rotate("+rotationDeg.toString()+"deg)" });
					}
				});
			}
			if (output.type == "string") {
				currentValue.attr("style", "font-family: monospace; white-space: pre;");
				currentValueWrapper.append(currentValue);
				var stringLengthLabel = $("<span>");
				currentValueWrapper.append(stringLengthLabel);
				var stringBuffer = new ArrayBuffer(output.max_length);
				var view = new DataView(stringBuffer);
				var stringBuffer_uint8 = new Uint8Array(stringBuffer);
				exportStreamListeners.push(function(address, data) {
					if (address[0] >= output.address && output.address + output.max_length > address[0]) {
						var data_uint8 = new Uint8Array(data.buffer);
						stringBuffer_uint8[address[0] - output.address] = data_uint8[0];
						if (output.address + output.max_length > (address[0]+1)) {
							stringBuffer_uint8[address[0] - output.address + 1] = data_uint8[1];
						}

						var str = "";
						for (var i=0; i<stringBuffer.byteLength; i++) {
							if (stringBuffer_uint8[i] == 0) break;
							str = str + String.fromCharCode(stringBuffer_uint8[i]);
						}
						currentValue.text('"'+str+'"');
						stringLengthLabel.text(" ("+str.length.toString()+")");
					}
				});
			}
		}

		return div;
	};

	init();

});