local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestReadOnlyRadio
--- @field module Module
TestReadOnlyRadio = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestReadOnlyRadio:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
	Input_Processor_Device = MockDevice:new(0)
end

local id = "MY_READ_ONLY_RADIO_INPUT"
local device_id = 1
local scale_factor = 1000
local category = "Radio Frequencies"
local description = "This is a read-only radio"

function TestReadOnlyRadio:testAddReadOnlyRadio()
	local max_length = 7
	local decimal_places = 3
	local control = self.module:defineReadOnlyRadio(id, device_id, max_length, decimal_places, scale_factor, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.radio)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
end

--- @private
--- @param expected string
--- @param max_length integer
function TestReadOnlyRadio:validate_string(expected, max_length)
	local value = ""
	local current_address = moduleAddress
	for i = 1, max_length, 1 do
		value = value .. string.char(self.module.memoryMap.entries[current_address].allocations[i % 2 == 0 and 2 or 1].value)
		current_address = i % 2 == 0 and current_address + 2 or current_address
	end

	lu.assertEquals(value, expected)
end

function TestReadOnlyRadio:test6Digit()
	local max_length = 7
	local decimal_places = 3
	self.module:defineReadOnlyRadio(id, device_id, max_length, decimal_places, scale_factor, description)
	lu.assertIsNil(self.module.inputProcessors[id])

	Input_Processor_Device:set_frequency(123456000)

	local export_hook = self.module.exportHooks[1]
	export_hook(Input_Processor_Device)
	self:validate_string("123.456", max_length)
end

function TestReadOnlyRadio:test4Digit()
	local max_length = 5
	local decimal_places = 2
	self.module:defineReadOnlyRadio(id, device_id, max_length, decimal_places, scale_factor, description)
	lu.assertIsNil(self.module.inputProcessors[id])

	Input_Processor_Device:set_frequency(3000000)

	local export_hook = self.module.exportHooks[1]
	export_hook(Input_Processor_Device)
	self:validate_string("30.00", max_length)
end
