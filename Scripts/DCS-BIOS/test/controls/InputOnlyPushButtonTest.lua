local ActionArgument = require("Scripts.DCS-BIOS.lib.modules.documentation.ActionArgument")
local ApiVariant = require("Scripts.DCS-BIOS.lib.modules.documentation.ApiVariant")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestInputOnlyPushButton
--- @field module Module
TestInputOnlyPushButton = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestInputOnlyPushButton:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_INPUT_ONLY_PUSH_BUTTON"
local device_id = 1
local command = 2
local category = "Input-Only Push Buttons"
local description = "This is an input-only push button"

function TestInputOnlyPushButton:testAddPushButton()
	local control = self.module:defineInputOnlyPushButton(id, device_id, command, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.selector)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertEquals(control.api_variant, ApiVariant.momentary_last_position)

	lu.assertEquals(#control.inputs, 1)

	local action_input = control.inputs[1] --[[@as ActionInput]]
	lu.assertEquals(action_input.interface, InputType.action)
	lu.assertEquals(action_input.argument, ActionArgument.toggle)

	lu.assertEquals(#control.outputs, 0)
end

function TestInputOnlyPushButton:testInputToggle()
	self.module:defineInputOnlyPushButton(id, device_id, command, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("TOGGLE")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 2)
	local action_press = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action_press[command], 1)
	local action_release = Input_Processor_Device.clickable_actions[2]
	lu.assertAlmostEquals(action_release[command], 0)
end
