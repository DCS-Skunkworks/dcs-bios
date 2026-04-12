local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local ICommand = require("Scripts.DCS-BIOS.lib.modules.ICommand")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestLoSetCommand2PosToggle
--- @field module Module
TestLoSetCommand2PosToggle = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestLoSetCommand2PosToggle:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_LO_SET_COMMAND_2_POS"
local iCommand_off = ICommand.left_engine_stop
local iCommand_on = ICommand.left_engine_start
local arg_number = 3
local category = "LoSetCommands2Pos"
local description = "This is a LoSetCommand2Pos"

function TestLoSetCommand2PosToggle:testAddLoSetCommand()
	local control = self.module:defineLoSetCommand2PosToggle(id, iCommand_off, iCommand_on, arg_number, category, description)

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

	local toggle_input = control.inputs[3] --[[@as ActionInput]]
	lu.assertEquals(toggle_input.interface, InputType.action)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 1)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function LoSetCommand(iCommand)
	lu.assertEquals(ICommand.left_engine_start, iCommand)
end

function TestLoSetCommand2PosToggle:testLoSetCommand2PosInc()
	self.module:defineLoSetCommand2PosToggle(id, iCommand_off, iCommand_on, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("INC")
end

function TestLoSetCommand2PosToggle:testLoSetCommand2PosSetState()
	self.module:defineLoSetCommand2PosToggle(id, iCommand_off, iCommand_on, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("1")
end

function TestLoSetCommand2PosToggle:testLoSetCommand2PosToggle()
	self.module:defineLoSetCommand2PosToggle(id, iCommand_off, iCommand_on, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("TOGGLE")
end
