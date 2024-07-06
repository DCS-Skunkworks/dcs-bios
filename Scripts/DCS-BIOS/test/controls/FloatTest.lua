local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestFloat
--- @field module Module
TestFloat = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestFloat:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

local id = "MY_FLOAT"
local arg_number = 1
local category = "Floats"
local description = "This is a float"

function TestFloat:testAddFloat()
	local limits = { 0, 1 }

	local control = self.module:defineFloat(id, arg_number, limits, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.analog_gauge)
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
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestFloat:testFloatZeroMinValue()
	local limits = { 0, 1 }

	self.module:defineFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 65535)
end

function TestFloat:testFloatNegativeMinValue()
	local limits = { -1, 1 }

	self.module:defineFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 65535)
end

function TestFloat:testFloatPositiveMinValue()
	local limits = { 1, -1 }

	self.module:defineFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 65535)
end

function TestFloat:testFloatDecimalValue()
	local limits = { 0, 0.5 }

	self.module:defineFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.25))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 65535)
end

function TestFloat:testFloatSmallRangeValue()
	local limits = { 0.822, 0.75 }

	self.module:defineFloat(id, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0.82205))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.74995))
	lu.assertEquals(alloc.value, 65535)

	export_hook(MockDevice:new(0.822))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.75))
	lu.assertEquals(alloc.value, 65535)
end
