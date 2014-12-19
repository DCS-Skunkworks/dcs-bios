var app = angular.module("docApp", []);
app.filter("hex", function() {
	return function(input, padTo) {
        if (!input)
            return "";
		if (!padTo)
			padTo = 4;
		hex = input.toString(16)
		while (hex.length < padTo)
			hex = "0" + hex;
		return "0x" + hex;
	};
});
app.filter("idCamelCase", function() {
	return function(input) {
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
});
app.filter("range", function() {
	return function(input, num) {
		if (num > 32)
			return [];
		var ret = [];
		for (var i=0; i<num; i++)
			ret.push(i);
		return ret;
	};
});
app.controller("DocController", function($scope) {
	$scope.getNumber = function(n) { return new Array(n); };
	$scope.view = "simple";
    $scope.categoryFilter = "";
	$scope.modules = {}
	$scope.moduleNames = Object.keys(docdata);
	$scope.moduleNames.forEach(function(moduleName) {
		$scope.modules[moduleName] = {
			name: moduleName,
			categories: []
		};
		Object.keys(docdata[moduleName]).forEach(function(cat_name) {
			cat = {
				name: cat_name,
				controls: []
			};
			$scope.modules[moduleName].categories.push(cat);
			Object.keys(docdata[moduleName][cat_name]).forEach(function(id) {
				cat.controls.push(docdata[moduleName][cat_name][id]);
			});
		});
	});
	$scope.selectedModule = $scope.moduleNames[0];
});
app.directive("control", function($parse, $compile) {
    return {
        scope: {
            control: "=",
        },
        templateUrl: "control.html",
        link: function(scope, lElement, attrs) {
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
            var defaultSnippet = null;

            var new_io;
            var add_snippet = function(type) {
                var snippet_def = { "type":type, "default":false };
                new_io.snippets.push(snippet_def);
                if (!defaultSnippet
                    || defaultSnippetPrecedence.indexOf(type) < defaultSnippetPrecedence.indexOf(defaultSnippet.type)) {
                    defaultSnippet = snippet_def;
                }
                return snippet_def;
            };
            scope.inputs = [];
            (scope.control.inputs || []).forEach(function(input) {
                new_io = {
                    "interface": input["interface"],
                    argument: input.argument,
                    suggested_step: input.suggested_step,
                    max_value: input.max_value,
                    description: input.description,
                    snippets: [],
                };
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
                scope.inputs.push(new_io);
            });

            scope.outputs = [];
            (scope.control.outputs || []).forEach(function(output) {
                new_io = {
                    "type": output.type,
                    address: output.address,
                    mask: output.mask,
                    shift_by: output.shift_by,
                    max_value: output.max_value,
                    max_length: output.max_length,
                    description: output.description,
                    snippets: [],
                };
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
                scope.outputs.push(new_io);
            });

            if (defaultSnippet)
                defaultSnippet["default"] = true;

            scope.show_all_snippets = false;
			scope.$parent.$watch('view', function(val) {
				scope.show_all_snippets = val == 'advanced';
			});
        }
    };
});
app.directive("code", function($parse) {
    return {
		restrict: "E",
        link: function(scope, element, attrs) {
			element.on("click", function() {
				// http://stackoverflow.com/questions/11128130/select-text-in-javascript
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
			});
        }
    };
});
