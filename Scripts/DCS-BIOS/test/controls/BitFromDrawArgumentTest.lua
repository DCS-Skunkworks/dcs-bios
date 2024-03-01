local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestBitFromDrawArgument
--- @field module Module
TestBitFromDrawArgument = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestBitFromDrawArgument:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

local id = "MY_BIT_DRAW"
local draw_arg_id = 1
local category = "Bit Draw Arguments"
local description = "This is a bit draw argument"

function TestBitFromDrawArgument:testAddBitFromDrawArgument()
	local control = self.module:defineBitFromDrawArgument(id, draw_arg_id, category, description)

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
	lu.assertEquals(integer_output.max_value, 1)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestBitFromDrawArgument:testBitFromDrawArgumentValue()
	self.module:defineBitFromDrawArgument(id, draw_arg_id, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	Input_Processor_Device.value = 0
	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	Input_Processor_Device.value = 1 -- function call is mocked to return this
	export_hook(MockDevice:new(0)) -- draw argument doesn't read dev0
	lu.assertEquals(alloc.value, 1)
end
