local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestPotentiometer
--- @field module Module
TestPotentiometer = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestPotentiometer:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_POTENTIOMETER"
local device_id = 1
local command = 2
local arg_number = 3
local category = "Potentiometers"
local description = "This is a potentiometer"

function TestPotentiometer:testAddPotentiometer()
	local limits = { 0, 1 }

	local control = self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.limited_dial)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 2)

	local set_state_input = control.inputs[1] --[[@as SetStateInput]]
	lu.assertEquals(set_state_input.interface, InputType.set_state)
	lu.assertEquals(set_state_input.max_value, 65535)

	local variable_step_input = control.inputs[2] --[[@as VariableStepInput]]
	lu.assertEquals(variable_step_input.interface, InputType.variable_step)
	lu.assertEquals(variable_step_input.max_value, 65535)
	lu.assertEquals(variable_step_input.suggested_step, 3200)

	lu.assertEquals(#control.outputs, 1)
	local output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(output.type, OutputType.integer)
	lu.assertEquals(output.max_value, 65535)
	lu.assertEquals(output.suffix, Suffix.none)
	lu.assertEquals(output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestPotentiometer:testPotentiometerZeroMinValue()
	local limits = { 0, 1 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 65535)
end

function TestPotentiometer:testPotentiometerNegativeMinValue()
	local limits = { -1, 1 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 65535)
end

function TestPotentiometer:testPotentiometerPositiveMinValue()
	local limits = { 1, -1 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(-1))
	lu.assertEquals(alloc.value, 65535)
end

function TestPotentiometer:testPotentiometerDecimalValue()
	local limits = { 0, 0.5 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.25))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 65535)
end

function TestPotentiometer:testPotentiometerNilLimitsValue()
	local limits = nil

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc.value, 0)

	export_hook(MockDevice:new(0.5))
	lu.assertEquals(alloc.value, 32767)

	export_hook(MockDevice:new(1))
	lu.assertEquals(alloc.value, 65535)
end

function TestPotentiometer:testInputVariableStepPositive()
	local limits = { 0, 1 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local input_processor = self.module.inputProcessors[id]

	input_processor("+3200")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 3200 / 65535)
end

function TestPotentiometer:testInputVariableStepPositiveOverflow()
	local limits = { 0, 1 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.96

	input_processor("+3200")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 1)
end

function TestPotentiometer:testInputVariableStepNegative()
	local limits = { 0, 1 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.2

	input_processor("-3200")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 9907 / 65535)
end

function TestPotentiometer:testInputVariableStepNegativeOverflow()
	local limits = { 0, 1 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local input_processor = self.module.inputProcessors[id]

	Input_Processor_Device.value = 0.04

	input_processor("-3200")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 0)
end

function TestPotentiometer:testInputSetState()
	local limits = { 0, 1 }

	self.module:definePotentiometer(id, device_id, command, arg_number, limits, category, description)

	local input_processor = self.module.inputProcessors[id]

	input_processor("5000")

	lu.assertEquals(#Input_Processor_Device.clickable_actions, 1)
	local action = Input_Processor_Device.clickable_actions[1]
	lu.assertAlmostEquals(action[command], 5000 / 65535)
end
