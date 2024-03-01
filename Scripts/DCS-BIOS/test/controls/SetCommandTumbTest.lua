local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestSetCommandTumb
--- @field module Module
TestSetCommandTumb = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestSetCommandTumb:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_SET_COMMAND_TUMB"
local device_id = 1
local command = 2
local arg_number = 3
local step = 0.1
local limits = { 0, 0.9 }
local category = "Tumbs"
local description = "This is a set command tumb"

function TestSetCommandTumb:testAddTumbNoCycle()
	local cycle = false
	local output_map = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }

	local control = self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 2)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	local fixed_step_input = control.inputs[2] --[[@as SetStateInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.set_state)
	lu.assertEquals(fixed_step_input.max_value, 9)

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

function TestSetCommandTumb:testAddTumbCycle()
	local cycle = true
	local output_map = nil

	local control = self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 2)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	local fixed_step_input = control.inputs[2] --[[@as SetStateInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.set_state)
	lu.assertEquals(fixed_step_input.max_value, 9)

	lu.assertEquals(#control.outputs, 1)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, 9)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestSetCommandTumb:testIntegerValue()
	local cycle = false
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.1))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(0.9))
	lu.assertEquals(alloc.value, 9)
end

function TestSetCommandTumb:testStringValue()
	local cycle = false
	local output_map = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress + 2].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, string.byte(0))

	export_hook(MockDevice:new(0.1))
	lu.assertEquals(alloc.value, string.byte(1))

	export_hook(MockDevice:new(0.9))
	lu.assertEquals(alloc.value, string.byte(9))
end

function TestSetCommandTumb:testInputInc()
	local cycle = false
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.set_commands, 1)
	local set_command = Input_Processor_Device.set_commands[1]
	lu.assertEquals(set_command[command], 0.1)

	lu.assertEquals(#Input_Processor_Device.set_arguments, 1)
	local set_arguments = Input_Processor_Device.set_arguments[1]
	lu.assertEquals(set_arguments[arg_number], 0.1)
end

function TestSetCommandTumb:testInputIncOverflow()
	local cycle = false
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.9

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.set_commands, 1)
	local set_command = Input_Processor_Device.set_commands[1]
	lu.assertEquals(set_command[command], 0.9)

	lu.assertEquals(#Input_Processor_Device.set_arguments, 1)
	local set_arguments = Input_Processor_Device.set_arguments[1]
	lu.assertEquals(set_arguments[arg_number], 0.9)
end

function TestSetCommandTumb:testInputIncOverflowCycle()
	local cycle = true
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.9

	input_processor("INC")
	lu.assertEquals(#Input_Processor_Device.set_commands, 1)
	local set_command = Input_Processor_Device.set_commands[1]
	lu.assertEquals(set_command[command], 0)

	lu.assertEquals(#Input_Processor_Device.set_arguments, 1)
	local set_arguments = Input_Processor_Device.set_arguments[1]
	lu.assertEquals(set_arguments[arg_number], 0)
end

function TestSetCommandTumb:testInputIncOverflowSkipLast()
	local cycle = "skiplast"
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.8

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.set_commands, 1)
	local set_command = Input_Processor_Device.set_commands[1]
	lu.assertEquals(set_command[command], 0)

	lu.assertEquals(#Input_Processor_Device.set_arguments, 1)
	local set_arguments = Input_Processor_Device.set_arguments[1]
	lu.assertEquals(set_arguments[arg_number], 0)
end

function TestSetCommandTumb:testInputDec()
	local cycle = false
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.4
	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.set_commands, 1)
	local set_command = Input_Processor_Device.set_commands[1]
	lu.assertAlmostEquals(set_command[command], 0.3)

	lu.assertEquals(#Input_Processor_Device.set_arguments, 1)
	local set_arguments = Input_Processor_Device.set_arguments[1]
	lu.assertAlmostEquals(set_arguments[arg_number], 0.3)
end

function TestSetCommandTumb:testInputDecOverflow()
	local cycle = false
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.set_commands, 1)
	local set_command = Input_Processor_Device.set_commands[1]
	lu.assertAlmostEquals(set_command[command], 0.0)

	lu.assertEquals(#Input_Processor_Device.set_arguments, 1)
	local set_arguments = Input_Processor_Device.set_arguments[1]
	lu.assertAlmostEquals(set_arguments[arg_number], 0.0)
end

function TestSetCommandTumb:testInputDecOverflowCycle()
	local cycle = true
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.set_commands, 1)
	local set_command = Input_Processor_Device.set_commands[1]
	lu.assertAlmostEquals(set_command[command], 0.9)

	lu.assertEquals(#Input_Processor_Device.set_arguments, 1)
	local set_arguments = Input_Processor_Device.set_arguments[1]
	lu.assertAlmostEquals(set_arguments[arg_number], 0.9)
end

function TestSetCommandTumb:testInputDecOverflowSkiplast()
	local cycle = "skiplast"
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.set_commands, 1)
	local set_command = Input_Processor_Device.set_commands[1]
	lu.assertAlmostEquals(set_command[command], 0.8)

	lu.assertEquals(#Input_Processor_Device.set_arguments, 1)
	local set_arguments = Input_Processor_Device.set_arguments[1]
	lu.assertAlmostEquals(set_arguments[arg_number], 0.8)
end

function TestSetCommandTumb:testInputN()
	local cycle = false
	local output_map = nil

	self.module:defineSetCommandTumb(id, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local input_processor = self.module.inputProcessors[id]

	for i = 1, 10, 1 do
		local input = i - 1
		input_processor(tostring(input))

		lu.assertEquals(#Input_Processor_Device.set_commands, i)
		local set_command = Input_Processor_Device.set_commands[i]
		lu.assertAlmostEquals(set_command[command], input * step, nil, "Input " .. tostring(input) .. " did not match output")

		lu.assertEquals(#Input_Processor_Device.set_arguments, i)
		local set_argument = Input_Processor_Device.set_arguments[i]
		lu.assertAlmostEquals(set_argument[arg_number], input * step, nil, "Input " .. tostring(input) .. " did not match output")
	end
end
