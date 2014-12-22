$(function() {
	var moduleSelect = $("<select>");
	_.each(docdata, function(value, key) {
		moduleSelect.append($("<option>").attr("value", key).text(key));
	});
	$("#app").append($("<span>").text("Module: "));
	$("#app").append(moduleSelect);
	
	var viewSelect = $("<select>");
	viewSelect.append($("<option>").attr("value", "simple").text("Simple"));
	viewSelect.append($("<option>").attr("value", "Advanced").text("Advanced"));
	$("#app").append($("<span>").text(" View: "));
	$("#app").append(viewSelect);
	
	var categoryFilter = $("<select>");
	$("#app").append($("<span>").text(" Category Filter: "));
	$("#app").append(categoryFilter);
	
	var controlsDiv = $("<div>");
	$("#app").append(controlsDiv);
	
	var init = function() {
		augmentData();
		
		moduleSelect.on("change", onModuleSelect);
		onModuleSelect();
		
		categoryFilter.on("change", redraw);
		viewSelect.on("change", redraw);
	}
	
	var defaultSnippetPrecedence = [
		"Switch2",
		"Switch3",
		"RotarySwitch",
		"RotaryEncoder_variable_step",
		"RotaryEncoder_fixed_step",
		"ActionButton",
		"LED",
		"StringBuffer",
		"generic_integer_output",
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
					var snippet = add_snippet("RotarySwitch");
					snippet.pin_template = 'PIN_0';
					for (var i=1; i <= input.max_value; i++)
						snippet.pin_template += ", PIN_" + i.toString();
				}
				if (input.max_value == 1)
					add_snippet("Switch2");
				if (input.max_value == 2)
					add_snippet("Switch3");
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
			.append($("<span>").attr("class", "controldescription").text(control.description))
			.append($("<span>").text(" / "))
			.append($("<span>").attr("class", "controlidentifier").text(control.identifier))
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
			code.append($("<span>").text('DcsBios::RotaryEncoder '+idCamelCase(cid)+'("'+cid+'", "-'+io.suggested_step.toString()+'", "+'+io.suggested_step.toString()+', '));
			code.append($("<i>").attr("style", "color: red;").text("PIN_A"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("PIN_B"));
			code.append($("<span>").text(');'));
			break;
			
			case "Switch2":
			code.append($("<span>").text('DcsBios::Switch2 '+idCamelCase(cid)+'("'+cid+'", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(");"));
			break;
			
			case "Switch3":
			code.append($("<span>").text('DcsBios::Switch2 '+idCamelCase(cid)+'("'+cid+'", '));
			code.append($("<i>").attr("style", "color: red;").text("PIN_A"));
			code.append($("<span>").text(", "));
			code.append($("<i>").attr("style", "color: red;").text("PIN_B"));
			code.append($("<span>").text(');'));
			break;
			
			case "Potentiometer":
			code.append($("<span>").text('DcsBios::Potentiometer '+idCamelCase(cid)+'("'+cid+'", "'));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(");"));
			break;
			
			case "RotarySwitch":
			code.append($("<span>").text('const byte '+idCamelCase(cid+'_PINS')+'['+(io.max_value+1).toString()+'] = {'));
			code.append($("<i>").attr("style", "color: red;").text(snippet.pin_template));
			code.append($("<span>").text("};"));
			code.append($("<br>"));
			code.append($("<span>").text('DcsBios::RotarySwitch '+idCamelCase(cid)+'("'+cid+'", '+idCamelCase(cid+'_PINS')+', '+(io.max_value+1).toString()+');'));
			break;
			
			case "generic_integer_output":
			code.append($("<span>").text("if (address == "+hex(io.address)+") {"));
			code.append($("<br>"));
			code.append($("<span>").html("&nbsp;&nbsp;&nbsp;&nbsp;"));
			code.append($("<span>").text("unsigned int "+idCamelCase(cid+io.suffix)+"Value = (value & "+hex(io.mask)+" >> "+io.shift_by.toString()+");"));
			code.append($("<br>"));
			code.append($("<span>").html("&nbsp;&nbsp;&nbsp;&nbsp;"));
			code.append($("<span>").text("/* your code here */"));
			code.append($("<br>"));
			code.append($("<span>").text("}"));
			break;
			
			case "LED":
			code.append($("<span>").text('DcsBios::LED '+idCamelCase(cid)+'('+hex(io.address)+', '+hex(io.mask)+', '));
			code.append($("<i>").attr("style", "color: red;").text("PIN"));
			code.append($("<span>").text(");"));
			break;
			
			case "ServoOutput":
			code.append($("<span>").text('DcsBios::ServoOutput '+idCamelCase(cid)+'('+hex(io.address)+', '));
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
			code.append($("<span>").text("DcsBios::StringBuffer<"+io.max_length.toString()+"> "+idCamelCase(cid+io.suffix+"_BUFFER")+'('+hex(io.address)+', '+idCamelCase("ON_"+cid+"_CHANGE")+');'));
			break;
			
		}
		return code;
	};
	
	var makeInput = function(input, control) {
		var div = $("<div>").attr("class", "input");
		if (viewSelect.val() == "simple") {
			div.append(makeSnippet(input.default_snippet, input, control));
			return div;
		}
		div.append($("<b>Input Interface: </b>"));
		div.append($("<span>").text(input["interface"]));
		_.each(input.snippets, function(snippet) {
			div.append(makeSnippet(snippet, input, control));
		});
		return div;
	};
	
	var makeOutput = function(output, control) {
		var div = $("<div>").attr("class", "output");
		if (viewSelect.val() == "simple") return div;
		
		div.append($("<b>Output Type: </b>"));
		div.append($("<span>").text(output.type));
		_.each(output.snippets, function(snippet) {
			div.append(makeSnippet(snippet, output, control));
		});
		
		return div;
	};
	
	init();
	
});