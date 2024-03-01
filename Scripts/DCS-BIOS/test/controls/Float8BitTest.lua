local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class Test8BitFloat
--- @field module Module
Test8BitFloat = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function Test8BitFloat:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

local id = "MY_8BIT_FLOAT"
local category = "Float Getters"
local max_value = 255
local description = "This is an float getter"
local arg_number = 100

function Test8BitFloat:testAddFloat()
	local limits = { 0, 1 }
	local control = self.module:define8BitFloat(id, arg_number, limits, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.analog_gauge)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, max_value)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function Test8BitFloat:testFloatZeroMinValue()
	local limits = { 0, 1 }

	self.module:define8BitFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 127)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 255)
end

function Test8BitFloat:testFloatNegativeMinValue()
	local limits = { -1, 1 }

	self.module:define8BitFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 127)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 255)
end

function Test8BitFloat:testFloatPositiveMinValue()
	local limits = { 1, -1 }

	self.module:define8BitFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 127)

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 255)
end

function Test8BitFloat:testFloatDecimalValue()
	local limits = { 0, 0.5 }

	self.module:define8BitFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.25))
	lu.assertEquals(alloc.value, 127)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 255)
end
