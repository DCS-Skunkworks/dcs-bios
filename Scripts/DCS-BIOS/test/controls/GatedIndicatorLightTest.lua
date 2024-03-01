local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestGatedIndicatorLight
--- @field module Module
TestGatedIndicatorLight = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestGatedIndicatorLight:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

local id = "MY_GATED_LIGHT"
local arg_number = 1
local category = "Gated Lights"
local description = "This is a gated light"

function TestGatedIndicatorLight:testAddGatedIndicatorLight()
	local min_value = 0.5
	local max_value = nil
	local control = self.module:defineGatedIndicatorLight(id, arg_number, min_value, max_value, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.led)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 1)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestGatedIndicatorLight:testGatedIndicatorLightNilMinValue()
	local min_value = nil
	local max_value = 0.5
	self.module:defineGatedIndicatorLight(id, arg_number, min_value, max_value, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(0.49))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 0)
end

function TestGatedIndicatorLight:testGatedIndicatorLightNilMaxValue()
	local min_value = 0.5
	local max_value = nil
	self.module:defineGatedIndicatorLight(id, arg_number, min_value, max_value, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.49))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 1)
end

function TestGatedIndicatorLight:testGatedIndicatorLightNoNilValue()
	local min_value = 0.5
	local max_value = 0.75
	self.module:defineGatedIndicatorLight(id, arg_number, min_value, max_value, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.49))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(0.74))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(0.75))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 0)
end

function TestGatedIndicatorLight:testGatedIndicatorLightOnlyNilValue()
	local min_value = nil
	local max_value = nil
	self.module:defineGatedIndicatorLight(id, arg_number, min_value, max_value, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 1)
end
