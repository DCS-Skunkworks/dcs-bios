local ActionArgument = require("Scripts.DCS-BIOS.lib.modules.documentation.ActionArgument")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestToggleSwitchToggleOnly
--- @field module Module
TestToggleSwitchToggleOnly = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestToggleSwitchToggleOnly:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_TOGGLE_ONLY_SWITCH"
local device_id = 1
local command = 2
local arg_number = 3
local category = "Toggle-Only Switches"
local description = "This is a toggle-only switch"

function TestToggleSwitchToggleOnly:testAddToggleSwitchToggleOnly()
	local control = self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.action)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
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
function TestToggleSwitchToggleOnly:testValue()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 1)
end

function TestToggleSwitchToggleOnly:testInputToggleFromOff()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("TOGGLE")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end

function TestToggleSwitchToggleOnly:testInputToggleFromOn()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1

	input_processor("TOGGLE")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end

function TestToggleSwitchToggleOnly:testInput1From0()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("1")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end

function TestToggleSwitchToggleOnly:testInput1From1()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1

	input_processor("1")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 0)
end

function TestToggleSwitchToggleOnly:testInput0From0()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("0")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 0)
end

function TestToggleSwitchToggleOnly:testInput0From1()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1

	input_processor("0")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end

function TestToggleSwitch:testInputIncFrom0()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end

function TestToggleSwitch:testInputIncFrom1()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 0)
end

function TestToggleSwitch:testInputDecFrom0()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 0)
end

function TestToggleSwitch:testInputDecFrom1()
	self.module:defineToggleSwitchToggleOnly(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end
