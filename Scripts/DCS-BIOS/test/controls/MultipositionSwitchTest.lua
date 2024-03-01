local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestMultipositionSwitch
--- @field module Module
TestMultipositionSwitch = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestMultipositionSwitch:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_MULTIPOSITION_SWITCH"
local device_id = 1
local command = 2
local arg_number = 3
local num_positions = 5
local increment = 0.1
local category = "Multiposition Switches"
local description = "This is a multiposition switch"

function TestMultipositionSwitch:testAddMultipositionSwitch()
	local control = self.module:defineMultipositionSwitch(id, device_id, command, arg_number, num_positions, increment, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
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

function TestMultipositionSwitch:testValue()
	self.module:defineMultipositionSwitch(id, device_id, command, arg_number, num_positions, increment, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.1))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(0.4))
	lu.assertEquals(alloc.value, 4)
end

function TestMultipositionSwitch:testInputInc()
	self.module:defineMultipositionSwitch(id, device_id, command, arg_number, num_positions, increment, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 0.1)
end

function TestMultipositionSwitch:testInputIncOverflow()
	self.module:defineMultipositionSwitch(id, device_id, command, arg_number, num_positions, increment, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.4

	input_processor("INC")
	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 0.4)
end

function TestMultipositionSwitch:testInputDec()
	self.module:defineMultipositionSwitch(id, device_id, command, arg_number, num_positions, increment, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.4
	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 0.3)
end

function TestMultipositionSwitch:testInputDecOverflow()
	self.module:defineMultipositionSwitch(id, device_id, command, arg_number, num_positions, increment, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 0)
end

function TestMultipositionSwitch:testInputN()
	self.module:defineMultipositionSwitch(id, device_id, command, arg_number, num_positions, increment, category, description)
	local input_processor = self.module.inputProcessors[id]

	for i = 1, num_positions, 1 do
		local input = i - 1
		input_processor(tostring(input))

		lu.assertEquals(#Input_Processor_Device.clickable_actions, i)
		local action = Input_Processor_Device.clickable_actions[i]
		lu.assertAlmostEquals(action[command], input * increment, nil, "Input " .. tostring(input) .. " did not match output")
	end
end
