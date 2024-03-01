local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestEjectionHandleSwitch
--- @field module Module
TestEjectionHandleSwitch = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestEjectionHandleSwitch:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_EJECTION_HANDLE_SWITCH"
local device_id = 1
local command = 2
local arg_number = 3
local category = "Ejection Handle Switches"
local description = "This is an ejection handle switch"

function TestEjectionHandleSwitch:testAddEjectionHandleSwitch()
	local control = self.module:defineEjectionHandleSwitch(id, device_id, command, arg_number, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.toggle_switch)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 1)
	local set_state_input = control.inputs[1] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 1)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 1)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestEjectionHandleSwitch:testValue()
	self.module:defineEjectionHandleSwitch(id, device_id, command, arg_number, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 1)
end

function TestEjectionHandleSwitch:testInput0From0()
	self.module:defineEjectionHandleSwitch(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("0")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 0)
end

function TestEjectionHandleSwitch:testInput0From1()
	self.module:defineEjectionHandleSwitch(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1

	input_processor("0")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 0)
end

function TestEjectionHandleSwitch:testInput1From0()
	self.module:defineEjectionHandleSwitch(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	input_processor("1")

	-- going from 0- to 1, we should trigger three clickable actions
	lu.assertEquals(#Input_Processor_Device.clickable_actions, 3)
	lu.assertEquals(Input_Processor_Device.clickable_actions[1][command], 1)
	lu.assertEquals(Input_Processor_Device.clickable_actions[2][command], 1)
	lu.assertEquals(Input_Processor_Device.clickable_actions[3][command], 1)
end

function TestEjectionHandleSwitch:testInput1From1()
	self.module:defineEjectionHandleSwitch(id, device_id, command, arg_number, category, description)
	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 1

	input_processor("1")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 0)
end
