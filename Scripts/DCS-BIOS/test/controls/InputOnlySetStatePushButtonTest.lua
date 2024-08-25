local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestInputOnlySetStatePushButton
--- @field module Module
TestInputOnlySetStatePushButton = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestInputOnlySetStatePushButton:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_INPUT_ONLY_SET_STATE_PUSH_BUTTON"
local device_id = 1
local command = 2
local category = "Input-Only Set State Push Buttons"
local description = "This is an input-only set state push button"

function TestInputOnlySetStatePushButton:testAddPushButton()
	local control = self.module:defineInputOnlySetStatePushButton(id, device_id, command, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.action)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 1)

	local set_state_input = control.inputs[1] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 1)

	lu.assertEquals(#control.outputs, 0)
end

function TestInputOnlySetStatePushButton:testInput0()
	self.module:defineInputOnlySetStatePushButton(id, device_id, command, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("0")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action_press = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action_press[command], 0)
end

function TestInputOnlySetStatePushButton:testInput1()
	self.module:defineInputOnlySetStatePushButton(id, device_id, command, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("1")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action_press = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action_press[command], 1)
end
