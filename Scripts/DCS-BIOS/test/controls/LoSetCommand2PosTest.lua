local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local ICommand = require("Scripts.DCS-BIOS.lib.modules.ICommand")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestLoSetCommand2Pos
--- @field module Module
TestLoSetCommand2Pos = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestLoSetCommand2Pos:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_LO_SET_COMMAND_2_POS"
local iCommand_off = ICommand.left_engine_stop
local iCommand_on = ICommand.left_engine_start
local category = "LoSetCommands2Pos"
local description = "This is a LoSetCommand2Pos"

function TestLoSetCommand2Pos:testAddLoSetCommand()
	local control = self.module:defineLoSetCommand2Pos(id, iCommand_off, iCommand_on, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.action)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 2)

	local fixed_step_input = control.inputs[1] --[[@as FixedStepInput]]
	lu.assertEquals(fixed_step_input.interface, InputType.fixed_step)

	local set_state_input = control.inputs[2] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 1)

	lu.assertEquals(#control.outputs, 0)
end

function LoSetCommand(iCommand)
	lu.assertEquals(ICommand.left_engine_start, iCommand)
end

function TestLoSetCommand2Pos:testLoSetCommand2PosInc()
	self.module:defineLoSetCommand2Pos(id, iCommand_off, iCommand_on, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")
end

function TestLoSetCommand2Pos:testLoSetCommand2PosSetState()
	self.module:defineLoSetCommand2Pos(id, iCommand_off, iCommand_on, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("1")
end
