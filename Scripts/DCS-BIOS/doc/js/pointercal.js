var lastDCSValue = 0;

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

function map_value(value, from_min, from_max, to_min, to_max) {
	value = value - from_min;
	value = value / (from_max - from_min);
	value = value * (to_max - to_min);
	value = value + to_min;
	return Math.floor(value);
    //return (value - from_min) / (from_max - from_min) * (to_max - to_min) + to_min;
}

function setRotation(id, deg) {
	$("#"+id).css({ "WebkitTransform": "rotate("+deg.toString()+"deg)" });
}

function getInt(id) {
	return parseInt($("#"+id).val());
}

function getFloat(id) {
	return parseFloat($("#"+id).val());
}

$(function() {
	var exportAddress = -1;

	var update = function() {
		exportAddress = parseInt($("#address").val());
		if (!exportAddress) $("#dcs_value").text("?");
		$("#dcs_value").text(lastDCSValue.toString());

		// update user pointer
		var degPerStep = parseFloat($("#stepper_deg_per_step").val());
		var zeroPos = parseFloat($("#stepper_zero_pos").val());

		var upSteps = getInt("user_pointer_steps");
		var upStepsPerRotation = 360/degPerStep;
		while (upSteps < 0) upSteps += upStepsPerRotation;
		while (upSteps >= upStepsPerRotation) upSteps -= upStepsPerRotation;
		$("#user_pointer_steps").val(upSteps.toFixed());

		var upRotation = upSteps * degPerStep + zeroPos;
		setRotation("user_pointer", upRotation);

		// update sim pointer
		var point1_dcs = parseFloat($("#point1_dcs").val());
		var point1_steps = parseFloat($("#point1_steps").val());
		var point2_dcs = parseFloat($("#point2_dcs").val());
		var point2_steps = parseFloat($("#point2_steps").val());

		var steps = map_value(lastDCSValue, point1_dcs, point2_dcs, point1_steps, point2_steps);
		var capped_steps = steps;
		if (capped_steps < 0) capped_steps = 0;
		var max_steps = getInt("stepper_max_steps");
		if (max_steps) {
			if (capped_steps > max_steps) capped_steps = max_steps;
		}
		$("#capped_steps").text(capped_steps.toString());
		var pointerRotationDeg = (capped_steps * degPerStep);
		setRotation("pointer", pointerRotationDeg + zeroPos);
		$("#mapped_deg").text(pointerRotationDeg.toFixed(4));
		$("#mapped_steps").text(steps.toString());
	}


	function tryParseControlId() {
		/* check if the string in the export address field is a known
		   DCS-BIOS control identifier */
		var identifier = $("#address").val();
		try {
			var acft = identifier.split("/")[0];
			var cid = identifier.split("/")[1];
			var module = docdata[acft];
			_.map(module, function(cat) {
				if (cat.hasOwnProperty(cid)) {
					$("#address").val(hex(cat[cid].outputs[0].address));
					return;
				}
			});
		} catch(e) {

		}
	}

	function tryLookupExportAddress() {
		/* check if the export address matches a known DCS-BIOS
		   control and display the control ID */

		var cid = "";
		var address = getInt("address");
		_.map(docdata, function(module, module_name) {
			_.map(module, function(cat) {
				_.map(cat, function(control) {
					if (control.outputs.length > 0) {
						if (control.outputs[0].address == address) {
							cid = module_name+"/"+control.identifier;
						}
					}
				});
			});
		});
		$("#control_id").text(cid);
	}

	function onAddressInput() {
		tryParseControlId();
		tryLookupExportAddress();
		update();
	}

	var init = function() {
		$(document).on("dcs-bios-write", function(evt, address, data) {
			$("#connection_status").text("receiving data");
			$("#connection_status").css({"backgroundColor":"lightgreen", "color":"black"});
			if (address[0] == exportAddress) {
				lastDCSValue = data[0];
				update();
			}
		});


		$("#gaugeclick").on("click", function(evt) {
			var w = $("#gaugeclick").width();
			var h = $("#gaugeclick").height();

			var x = evt.offsetX - (w/2);
			var y = evt.offsetY - (w/2);

			var deg = (Math.atan2(y, x) / (2*Math.PI) * 360) + 90;
			deg = deg - getInt("stepper_zero_pos");
			if (deg < 0) deg = deg + 360;
			var steps = deg / getFloat("stepper_deg_per_step");
			$("#user_pointer_steps").val(steps.toFixed());
			update();
		});

		$("#address").on("input", onAddressInput);
		$("#point1_dcs").on("input", update);
		$("#point1_steps").on("input", update);
		$("#point2_dcs").on("input", update);
		$("#point2_steps").on("input", update);
		$("#stepper_zero_pos").on("input", update);
		$("#stepper_deg_per_step").on("input", update);
		$("#user_pointer_steps").on("input", update);

		$("#set_point_1").on("click", function() {
			$("#point1_dcs").val(lastDCSValue.toString());
			$("#point1_steps").val($("#user_pointer_steps").val());
			update();
		});

		$("#set_point_2").on("click", function() {
			$("#point2_dcs").val(lastDCSValue.toString());
			$("#point2_steps").val($("#user_pointer_steps").val());
			update();
		});

		$("#set_zero_pos").on("click", function() {
			var deg = getInt("user_pointer_steps") * getFloat("stepper_deg_per_step") + getInt("stepper_zero_pos");
			$("#user_pointer_steps").val("0");
			$("#stepper_zero_pos").val(deg.toFixed(2));
			update();
		});

		$("#gauge_img").on("change", function() {
			$("#gauge").attr("src", URL.createObjectURL($("#gauge_img")[0].files[0]));
		});

	}


	init();
	update();

});
