local ControlType = require("ControlType")
local MockDevice = require("MockDevice")
local Module = require("Module")

local lu = require("luaunit")

--- @class TestSetFrequency
--- @field module Module
TestSetFrequency = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestSetFrequency:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_SET_FREQUENCY_INPUT"
local device_id = 1
local category = "Set Frequency"

function TestSetFrequency:testAddSetFrequency()
	local control = self.module:defineSetFrequency(id, device_id)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.metadata)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.momentary_positions)
	lu.assertIsNil(control.physical_variant)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0) -- these may be added later

	lu.assertEquals(#control.outputs, 0)
end

function TestSetFrequency:testInputSetNoDecimal()
	self.module:defineSetFrequency(id, device_id)
	local input_processor = self.module.inputProcessors[id]

	input_processor("123456")

	lu.assertEquals(#Input_Processor_Device.set_frequencies, 1)
	local set_frequency = Input_Processor_Device.set_frequencies[1]
	lu.assertAlmostEquals(set_frequency, 123456000)
end

function TestSetFrequency:testInputSetWithDecimal()
	self.module:defineSetFrequency(id, device_id)
	local input_processor = self.module.inputProcessors[id]

	input_processor("123.456")

	lu.assertEquals(#Input_Processor_Device.set_frequencies, 1)
	local set_frequency = Input_Processor_Device.set_frequencies[1]
	lu.assertAlmostEquals(set_frequency, 123456000)
end

function TestSetFrequency:testInputSet4Digit()
	self.module:defineSetFrequency(id, device_id)
	local input_processor = self.module.inputProcessors[id]

	input_processor("30.00")

	lu.assertEquals(#Input_Processor_Device.set_frequencies, 1)
	local set_frequency = Input_Processor_Device.set_frequencies[1]
	lu.assertAlmostEquals(set_frequency, 3000000)
end
