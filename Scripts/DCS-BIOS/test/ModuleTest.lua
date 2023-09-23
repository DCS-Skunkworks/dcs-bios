local ActionArgument = require("ActionArgument")
local ApiVariant = require("ApiVariant")
local ControlType = require("ControlType")
local InputType = require("InputType")
local Module = require("Module")
local OutputType = require("OutputType")
local PhysicalVariant = require("PhysicalVariant")
local Suffix = require("Suffix")

local lu = require("luaunit")

--- @class TestModule
--- @field module Module
TestModule = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestModule:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

function TestModule:testCreateModule()
	lu.assertEquals(self.module.name, moduleName)
	lu.assertEquals(self.module.memoryMap.baseAddress, moduleAddress)
end

function TestModule:testAddFloat()
	local id = "MY_FLOAT"
	local arg_number = 1
	local limits = { 0, 1 }
	local category = "Floats"
	local description = "This is a float"

	local control = self.module:defineFloat(id, arg_number, limits, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.analog_gauge)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.physical_variant)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 65535)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddIndicatorLight()
	local id = "MY_LIGHT"
	local arg_number = 1
	local category = "Lights"
	local description = "This is a light"

	local control = self.module:defineIndicatorLight(id, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.led)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.physical_variant)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 1)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddPushButton()
	local id = "MY_PUSH_BUTTON"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local category = "Push Buttons"
	local description = "This is a push button"

	local control = self.module:definePushButton(id, device_id, command, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.physical_variant, PhysicalVariant.push_button)
	lu.assertEquals(control.api_variant, ApiVariant.momentary_last_position)

	lu.assertEquals(#control.inputs, 3)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	local set_state_input = control.inputs[2] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 1)

	local action_input = control.inputs[3] --[[@as ActionInput]]
	lu.assertEquals(action_input.interface, InputType.action)
	lu.assertEquals(action_input.argument, ActionArgument.toggle)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 1)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddPotentiometer()
	local id = "MY_POTENTIOMETER"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local limits = { 0, 1 }
	local category = "Potentiometers"
	local description = "This is a potentiometer"

	local control = self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.limited_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.physical_variant)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 2)

	local set_state_input = control.inputs[1] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 65535)

	local variable_step_input = control.inputs[2] --[[@as VariableStepInput]]
	lu.assertEquals(variable_step_input.interface, InputType.variable_step)
	lu.assertEquals(variable_step_input.max_value, 65535)
	lu.assertEquals(variable_step_input.suggested_step, 3200)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 65535)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddToggleSwitch()
	local id = "MY_TOGGLE_SWITCH"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local category = "Toggle Switches"
	local description = "This is a toggle switch"

	local control = self.module:defineToggleSwitch(id, device_id, command, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.physical_variant, PhysicalVariant.toggle_switch)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 3)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	local set_state_input = control.inputs[2] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 1)

	local action_input = control.inputs[3] --[[@as ActionInput]]
	lu.assertEquals(action_input.interface, InputType.action)
	lu.assertEquals(action_input.argument, ActionArgument.toggle)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 1)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddMultipositionSwitch()
	local id = "MY_MULTIPOSITION_SWITCH"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local num_positions = 5
	local increment = 0.1
	local category = "Multiposition Switches"
	local description = "This is a multiposition switch"

	local control = self.module:defineMultipositionSwitch(
		id,
		device_id,
		command,
		arg_number,
		num_positions,
		increment,
		category,
		description
	)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.physical_variant, PhysicalVariant.toggle_switch)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 2)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	local set_state_input = control.inputs[2] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, num_positions - 1)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, num_positions - 1)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddRotary()
	local id = "MY_ROTARY"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local category = "Rotaries"
	local description = "This is a rotary"

	local control = self.module:defineRotary(id, device_id, command, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.analog_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.physical_variant)
	lu.assertEquals(control.api_variant, ApiVariant.multiturn)
	lu.assertEquals(#control.inputs, 1)

	local variable_step_input = control.inputs[1] --[[@as VariableStepInput]]
	lu.assertEquals(variable_step_input.interface, InputType.variable_step)
	lu.assertEquals(variable_step_input.max_value, 65535)
	lu.assertEquals(variable_step_input.suggested_step, 3200)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 65535)
	lu.assertEquals(output.suffix, Suffix.knob_pos)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAdd3PosTumb()
	local id = "MY_3POS_TUMB"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local category = "Three-Position tumbs"
	local description = "This is a 3-pos tumb"

	local control = self.module:define3PosTumb(id, device_id, command, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.physical_variant, PhysicalVariant.three_position_switch)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 2)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	local set_state_input = control.inputs[2] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 2)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 2)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddFixedStepTumb()
	local id = "MY_FIXED_STEP_TUMB"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local step = 0.1
	local limits = { 0, 0.9 }
	local rel_args = { -0.1, 0.1 }
	local output_map = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }
	local category = "Fixed-step Tumbs"
	local description = "This is a fixed-step tumb"

	local control = self.module:defineFixedStepTumb(
		id,
		device_id,
		command,
		arg_number,
		step,
		limits,
		rel_args,
		output_map,
		category,
		description
	)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.discrete_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.physical_variant, PhysicalVariant.infinite_rotary)
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
	lu.assertEquals(string_output.maxLength, 1)
	lu.assertEquals(string_output.suffix, Suffix.str)

	lu.assertEquals(string_output.address, moduleAddress + 2) -- string will require new address
end

function TestModule:testAddFixedStepInput()
	local id = "MY_FIXED_STEP_INPUT"
	local device_id = 1
	local command = 2
	local rel_args = { -0.1, 0.1 }
	local category = "Fixed-step Inputs"
	local description = "This is a fixed-step input"

	local control = self.module:defineFixedStepInput(id, device_id, command, rel_args, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.fixed_step_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.physical_variant)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 1)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	lu.assertEquals(#control.outputs, 0)
end

function TestModule:testAddRadioWheel()
	local id = "MY_RADIO_WHEEL"
	local device_id = 1
	local decrement_command = 2
	local increment_command = 3
	local arg_number = 4
	local rel_args = { -0.1, 0.1 }
	local step = 0.05
	local limits = { 0.15, 0.80 }
	local output_map = { " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15" }
	local category = "Radio Wheels"
	local description = "This is a radio wheel"

	local control = self.module:defineRadioWheel(
		id,
		device_id,
		decrement_command,
		increment_command,
		rel_args,
		arg_number,
		step,
		limits,
		output_map,
		category,
		description
	)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.discrete_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.physical_variant, PhysicalVariant.infinite_rotary)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 1)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	lu.assertEquals(#control.outputs, 2)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, 12)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
	lu.assertEquals(integer_output.suffix, Suffix.int)

	local string_output = control.outputs[2] --[[@as StringOutput]]
	lu.assertEquals(string_output.type, OutputType.string)
	lu.assertEquals(string_output.maxLength, 2)
	lu.assertEquals(string_output.suffix, Suffix.str)

	lu.assertEquals(string_output.address, moduleAddress + 2) -- string will require new address
end

function TestModule:testAddBitFromDrawArgument()
	local id = "MY_BIT_DRAW"
	local draw_arg_id = 1
	local category = "Bit Draw Arguments"
	local description = "This is a bit draw argument"

	local control = self.module:defineBitFromDrawArgument(id, draw_arg_id, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.metadata)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.physical_variant)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, 1)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddFloatFromDrawArgument()
	local id = "MY_FLOAT_DRAW"
	local draw_arg_id = 1
	local category = "Float Draw Arguments"
	local description = "This is a float draw argument"

	local control = self.module:defineFloatFromDrawArgument(id, draw_arg_id, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.metadata)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.physical_variant)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, 65535)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddIntegerFromGetter()
	local id = "MY_INT_GETTER"
	local getter = function(dev0) end
	local max_value = 255
	local category = "Integer Getters"
	local description = "This is an integer getter"

	local control = self.module:defineIntegerFromGetter(id, getter, max_value, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.metadata)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.physical_variant)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, max_value)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestModule:testAddTumbNoCycle()
	local id = "MY_TUMB"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local step = 0.1
	local limits = { 0, 0.9 }
	local cycle = false
	local output_map = { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9" }
	local category = "Tumbs"
	local description = "This is a tumb"

	local control = self.module:defineTumb(
		id,
		device_id,
		command,
		arg_number,
		step,
		limits,
		output_map,
		cycle,
		category,
		description
	)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.physical_variant, PhysicalVariant.limited_rotary)
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
	lu.assertEquals(string_output.maxLength, 1)
	lu.assertEquals(string_output.suffix, Suffix.str)

	lu.assertEquals(string_output.address, moduleAddress + 2) -- string will require new address
end

function TestModule:testAddTumbCycle()
	local id = "MY_TUMB"
	local device_id = 1
	local command = 2
	local arg_number = 3
	local step = 0.1
	local limits = { 0, 0.9 }
	local cycle = true
	local category = "Tumbs"
	local description = "This is a tumb"

	local control =
		self.module:defineTumb(id, device_id, command, arg_number, step, limits, nil, cycle, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.physical_variant, PhysicalVariant.infinite_rotary)
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

-- todo: add tests for adding multiple controls
