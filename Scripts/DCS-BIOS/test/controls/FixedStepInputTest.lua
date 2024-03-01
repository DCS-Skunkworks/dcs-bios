local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestFixedStepInput
--- @field module Module
TestFixedStepInput = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestFixedStepInput:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_FIXED_STEP_INPUT"
local device_id = 1
local command = 2
local rel_args_inc = 1
local rel_args_dec = -1
local rel_args = { rel_args_dec, rel_args_inc }
local category = "Fixed-step Inputs"
local description = "This is a fixed-step input"

function TestFixedStepInput:testAddFixedStepInput()
	local control = self.module:defineFixedStepInput(id, device_id, command, rel_args, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.fixed_step_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 1)
	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	lu.assertEquals(#control.outputs, 0)
end

function TestFixedStepInput:testInputInc()
	self.module:defineFixedStepInput(id, device_id, command, rel_args, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], rel_args_inc)
end

function TestFixedStepInput:testInputDec()
	self.module:defineFixedStepInput(id, device_id, command, rel_args, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("DEC")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], rel_args_dec)
end
