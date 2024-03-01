local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestFixedStepTumb
--- @field module Module
TestFixedStepTumb = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestFixedStepTumb:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_FIXED_STEP_TUMB"
local device_id = 1
local command = 2
local arg_number = 3
local step = 0.1
local limits = { 0, 0.9 }
local rel_args_inc = 1
local rel_args_dec = -1
local rel_args = { rel_args_dec, rel_args_inc }
local category = "Fixed-step Tumbs"
local description = "This is a fixed-step tumb"

function TestFixedStepTumb:testAddFixedStepTumb()
	local output_map = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }

	local control = self.module:defineFixedStepTumb(id, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.discrete_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 1)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	lu.assertEquals(#control.outputs, 2)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, 9)
	lu.assertEquals(integer_output.suffix, Suffix.int)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address

	local string_output = control.outputs[2] --[[@as StringOutput]]
	lu.assertEquals(string_output.type, OutputType.string)
	lu.assertEquals(string_output.max_length, 1)
	lu.assertEquals(string_output.suffix, Suffix.str)

	lu.assertEquals(string_output.address, moduleAddress + 2) -- string will require new address
end

function TestFixedStepTumb:testAddFixedStepTumbNoOutputMap()
	local output_map = nil

	local control = self.module:defineFixedStepTumb(id, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)

	lu.assertEquals(#control.outputs, 1)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, 9)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress)
end

function TestFixedStepTumb:testIntegerValue()
	local output_map = nil

	self.module:defineFixedStepTumb(id, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.1))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(0.9))
	lu.assertEquals(alloc.value, 9)
end

function TestFixedStepTumb:testStringValue()
	local output_map = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }

	self.module:defineFixedStepTumb(id, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress + 2].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, string.byte(0))

	export_hook(MockDevice:new(0.1))
	lu.assertEquals(alloc.value, string.byte(1))

	export_hook(MockDevice:new(0.9))
	lu.assertEquals(alloc.value, string.byte(9))
end

function TestFixedStepTumb:testInputInc()
	local output_map = nil

	self.module:defineFixedStepTumb(id, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], rel_args_inc)
end

function TestFixedStepTumb:testInputIncOverflow()
	local output_map = nil

	self.module:defineFixedStepTumb(id, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.9

	input_processor("INC")
	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], rel_args_inc)
end

function TestFixedStepTumb:testInputDec()
	local output_map = nil

	self.module:defineFixedStepTumb(id, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.4
	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], rel_args_dec)
end

function TestFixedStepTumb:testInputDecOverflow()
	local output_map = nil

	self.module:defineFixedStepTumb(id, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], rel_args_dec)
end
