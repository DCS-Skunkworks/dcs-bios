local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestSpringLoadedThreePosTumb
--- @field module Module
TestSpringLoadedThreePosTumb = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestSpringLoadedThreePosTumb:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_SPRING_LOADED3_POS_TUMB"
local device_id = 1
local down_switch = 2
local up_switch = 3
local arg_number = 4
local category = "Spring-loaded 3 Position Tumbs"
local description = "This is a spring-loaded 3-position tumb"

function TestSpringLoadedThreePosTumb:testAdd3PosTumb()
	local control = self.module:defineSpringloaded_3PosTumb(id, device_id, down_switch, up_switch, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.three_pos_two_command_switch_open_close)
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

function TestSpringLoadedThreePosTumb:testValue()
	self.module:defineSpringloaded_3PosTumb(id, device_id, down_switch, up_switch, arg_number, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 1)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 2)
end

function TestSpringLoadedThreePosTumb:testInput0()
	self.module:defineSpringloaded_3PosTumb(id, device_id, down_switch, up_switch, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("0")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 3)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[down_switch], 0)
	local action2 = Input_Processor_Device.clickable_actions[2]
	lu.assertAlmostEquals(action2[up_switch], 0)
	local action3 = Input_Processor_Device.clickable_actions[3]
	lu.assertAlmostEquals(action3[down_switch], -1)
end

function TestSpringLoadedThreePosTumb:testInput1()
	self.module:defineSpringloaded_3PosTumb(id, device_id, down_switch, up_switch, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("1")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 2)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[down_switch], 0)
	local action2 = Input_Processor_Device.clickable_actions[2]
	lu.assertAlmostEquals(action2[up_switch], 0)
end

function TestSpringLoadedThreePosTumb:testInput2()
	self.module:defineSpringloaded_3PosTumb(id, device_id, down_switch, up_switch, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("2")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 3)
	local action1 = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action1[down_switch], 0)
	local action2 = Input_Processor_Device.clickable_actions[2]
	lu.assertAlmostEquals(action2[up_switch], 0)
	local action3 = Input_Processor_Device.clickable_actions[3]
	lu.assertAlmostEquals(action3[up_switch], 1)
end
