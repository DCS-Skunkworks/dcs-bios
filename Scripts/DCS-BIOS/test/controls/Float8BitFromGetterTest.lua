local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class Test8BitFloatFromGetterTest
--- @field module Module
Test8BitFloatFromGetterTest = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function Test8BitFloatFromGetterTest:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

local id = "MY_8BIT_FLOAT_GETTER"
local category = "Float Getters"
local max_value = 255
local description = "This is an float getter"

function Test8BitFloatFromGetterTest:testAddFloatFromGetter()
	local getter = function() end
	local control = self.module:define8BitFloatFromGetter(id, getter, { -1, 1 }, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.metadata)
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

function Test8BitFloatFromGetterTest:testFloatFromGetter1Value()
	local getter = function()
		return 1
	end

	self.module:define8BitFloatFromGetter(id, getter, { -1, 1 }, category, description)
	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 255)
end

function Test8BitFloatFromGetterTest:testFloatFromGetter0Value()
	local getter = function()
		return 0
	end

	self.module:define8BitFloatFromGetter(id, getter, { -1, 1 }, category, description)
	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 127)
end

function Test8BitFloatFromGetterTest:testFloatFromGetterM1Value()
	local getter = function()
		return -1
	end

	self.module:define8BitFloatFromGetter(id, getter, { -1, 1 }, category, description)
	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)
end
