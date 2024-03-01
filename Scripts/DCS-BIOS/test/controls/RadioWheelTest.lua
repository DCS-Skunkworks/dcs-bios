local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestRadioWheel
--- @field module Module
TestRadioWheel = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestRadioWheel:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_RADIO_WHEEL"
local device_id = 1
local decrement_command = 2
local increment_command = 3
local arg_number = 4
local rel_args = { -0.1, 0.1 }
local step = 0.05
local limits = { 0.15, 0.5 }
local category = "Radio Wheels"
local description = "This is a radio wheel"

function TestRadioWheel:testAddRadioWheel()
	local output_map = { "3", "4", "5", "6", "7", "8", "9" }

	local control = self.module:defineRadioWheel(id, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)

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
	lu.assertEquals(integer_output.max_value, 6)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
	lu.assertEquals(integer_output.suffix, Suffix.int)

	local string_output = control.outputs[2] --[[@as StringOutput]]
	lu.assertEquals(string_output.type, OutputType.string)
	lu.assertEquals(string_output.max_length, 1)
	lu.assertEquals(string_output.suffix, Suffix.str)

	lu.assertEquals(string_output.address, moduleAddress + 2) -- string will require new address
end

function TestRadioWheel:testAddRadioWheelNoOutputMap()
	local output_map = nil

	local control = self.module:defineRadioWheel(id, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)

	lu.assertEquals(#control.outputs, 1)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, 6)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress)
end

function TestRadioWheel:testIntegerValue()
	local output_map = nil

	self.module:defineRadioWheel(id, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0.15))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.25))
	lu.assertEquals(alloc.value, 2)

	export_hook(MockDevice:new(0.45))
	lu.assertEquals(alloc.value, 6)
end

function TestRadioWheel:testStringValue()
	local output_map = { "3", "4", "5", "6", "7", "8", "9" }

	self.module:defineRadioWheel(id, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress + 2].allocations[1]

	export_hook(MockDevice:new(0.15))
	lu.assertEquals(alloc.value, string.byte(3))

	export_hook(MockDevice:new(0.25))
	lu.assertEquals(alloc.value, string.byte(5))

	export_hook(MockDevice:new(0.45))
	lu.assertEquals(alloc.value, string.byte(9))
end

function TestRadioWheel:testInputInc()
	local output_map = nil

	self.module:defineRadioWheel(id, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[increment_command], rel_args[2])
end

function TestRadioWheel:testInputIncOverflow()
	local output_map = nil

	self.module:defineRadioWheel(id, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.45

	input_processor("INC")
	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[increment_command], rel_args[2])
end

function TestRadioWheel:testInputDec()
	local output_map = nil

	self.module:defineRadioWheel(id, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.4
	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[decrement_command], rel_args[1])
end

function TestRadioWheel:testInputDecOverflow()
	local output_map = nil

	self.module:defineRadioWheel(id, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.15
	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[decrement_command], rel_args[1])
end
