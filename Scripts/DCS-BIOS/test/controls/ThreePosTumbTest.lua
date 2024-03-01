local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestThreePosTumb
--- @field module Module
TestThreePosTumb = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestThreePosTumb:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_3_POS_TUMB"
local device_id = 1
local command = 2
local arg_number = 3
local category = "3 Position Tumbs"
local description = "This is a 3-position tumb"

function TestThreePosTumb:testAdd3PosTumb()
	local control = self.module:define3PosTumb(id, device_id, command, arg_number, category, description)

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
	lu.assertEquals(set_state_input.max_value, 2)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 2)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestThreePosTumb:testValue()
	self.module:define3PosTumb(id, device_id, command, arg_number, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 2)
end

function TestThreePosTumb:testInputInc()
	self.module:define3PosTumb(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end

function TestThreePosTumb:testInputIncOverflow()
	self.module:define3PosTumb(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end

function TestThreePosTumb:testInputDec()
	self.module:define3PosTumb(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], -1)
end

function TestThreePosTumb:testInputDecOverflow()
	self.module:define3PosTumb(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = -1

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], -1)
end

function TestThreePosTumb:testInputN()
	self.module:define3PosTumb(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	for i = 1, 3, 1 do
		local input = i - 1
		input_processor(tostring(input))

		lu.assertEquals(#Input_Processor_Device.clickable_actions, i)
		local action = Input_Processor_Device.clickable_actions[i]
		lu.assertAlmostEquals(action[command], input - 1, nil, "Input " .. tostring(input) .. " did not match output")
	end
end
