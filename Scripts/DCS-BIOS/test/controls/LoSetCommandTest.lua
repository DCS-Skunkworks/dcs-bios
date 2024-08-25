local ActionArgument = require("Scripts.DCS-BIOS.lib.modules.documentation.ActionArgument")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local ICommand = require("Scripts.DCS-BIOS.lib.modules.ICommand")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestLoSetCommand
--- @field module Module
TestLoSetCommand = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestLoSetCommand:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_LO_SET_COMMAND"
local iCommand = ICommand.left_engine_start
local category = "LoSetCommands"
local description = "This is a LoSetCommand"

function TestLoSetCommand:testAddLoSetCommand()
	local control = self.module:defineLoSetCommand(id, iCommand, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.action)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 1)

	local action_input = control.inputs[1] --[[@as ActionInput]]
	lu.assertEquals(action_input.interface, InputType.action)
	lu.assertEquals(action_input.argument, ActionArgument.toggle)

	lu.assertEquals(#control.outputs, 0)
end

function LoSetCommand(iCommand)
	lu.assertEquals(ICommand.left_engine_start, iCommand)
end

function TestLoSetCommand:testLoSetCommand()
	self.module:defineLoSetCommand(id, iCommand, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("TOGGLE")
end
