local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestGaugeValue
--- @field module Module
TestGaugeValue = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestGaugeValue:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

local id = "MY_GAUGE_VALUE"
local arg_number = 1
local category = "Gauge Values"
local description = "This is a gauge value"

function TestGaugeValue:testAddGaugeValue()
	local limits = { 0, 1 }

	local control = self.module:defineGaugeValue(id, arg_number, limits, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.metadata)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 65535)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.description, description)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestGaugeValue:testGaugeValueZeroMinValue()
	local limits = { 0, 500 }

	self.module:defineGaugeValue(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 250)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 500)
end

function TestGaugeValue:testGaugeValuePositiveMinValue()
	local limits = { 10, 75 }

	self.module:defineGaugeValue(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 10)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 42)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 75)
end
