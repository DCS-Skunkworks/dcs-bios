var app = angular.module("docApp", []);
app.filter("hex", function() {
	return function(input, padTo) {
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
