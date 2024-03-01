local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestRockerSwitch
--- @field module Module
TestRockerSwitch = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestRockerSwitch:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_ROCKER_SWITCH"
local device_id = 1
local pos_command = 2
local pos_stop_command = 3
local neg_command = 4
local neg_stop_command = 5
local arg_number = 6
local category = "Rocker Switches"
local description = "This is a rocker switch"

function TestRockerSwitch:testAddRockerSwitch()
	local control = self.module:defineRockerSwitch(id, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 1)
	local set_state_input = control.inputs[1] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 2)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 2)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestRockerSwitch:testValue()
	self.module:defineRockerSwitch(id, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 2)
end

function TestRockerSwitch:testInput1To0()
	self.module:defineRockerSwitch(id, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1
	input_processor("1") -- mapped to 0

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[pos_stop_command], 0)
end

function TestRockerSwitch:testInput0To1()
	self.module:defineRockerSwitch(id, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0
	input_processor("2") -- mapped to 1

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[pos_command], 1)
end

function TestRockerSwitch:testInputMinus1To0()
	self.module:defineRockerSwitch(id, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = -1
	input_processor("1") -- mapped to 0

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[neg_stop_command], 0)
end

function TestRockerSwitch:testInput0ToMinus1()
	self.module:defineRockerSwitch(id, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0
	input_processor("0") -- mapped to -1

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[neg_command], -1)
end

function TestRockerSwitch:testInputMinus1To1()
	self.module:defineRockerSwitch(id, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = -1
	input_processor("2") -- mapped to 1

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 2)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[neg_stop_command], 0)
	local action1 = Input_Processor_Device.clickable_actions[2]
	lu.assertAlmostEquals(action1[pos_command], 1)
end

function TestRockerSwitch:testInput1ToMinus1()
	self.module:defineRockerSwitch(id, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1
	input_processor("0") -- mapped to -1

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 2)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[pos_stop_command], 0)
	local action1 = Input_Processor_Device.clickable_actions[2]
	lu.assertAlmostEquals(action1[neg_command], -1)
end
