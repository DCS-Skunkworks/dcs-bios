local ApiVariant = require("Scripts.DCS-BIOS.lib.modules.documentation.ApiVariant")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestRotary
--- @field module Module
TestRotary = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestRotary:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_ROTARY"
local device_id = 1
local command = 2
local arg_number = 3
local category = "Rotaries"
local description = "This is a rotary"

function TestRotary:testAddRotary()
	local control = self.module:defineRotary(id, device_id, command, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.analog_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
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

function TestRotary:testRotaryValue()
	self.module:defineRotary(id, device_id, command, arg_number, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 65535)
end

function TestRotary:testInputVariableStepPositive()
	self.module:defineRotary(id, device_id, command, arg_number, category, description)

	local input_processor = self.module.inputProcessors[id]

	input_processor("+3200")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 3200 / 65535)
end

function TestRotary:testInputVariableStepPositiveOverflow()
	self.module:defineRotary(id, device_id, command, arg_number, category, description)

	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.96

	input_processor("+3200")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 3200 / 65535)
end

function TestRotary:testInputVariableStepNegative()
	self.module:defineRotary(id, device_id, command, arg_number, category, description)

	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.2

	input_processor("-3200")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], -3200 / 65535)
end

function TestRotary:testInputVariableStepNegativeOverflow()
	self.module:defineRotary(id, device_id, command, arg_number, category, description)

	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.04

	input_processor("-3200")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], -3200 / 65535)
end
