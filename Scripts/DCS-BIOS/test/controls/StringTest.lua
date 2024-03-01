local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestString
--- @field module Module
TestString = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestString:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

local id = "MY_STRING"
local category = "Strings"
local description = "This is a string"

function TestString:testAddString()
	local max_length = 2
	local getter = function() end
	local control = self.module:defineString(id, getter, max_length, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.display)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local string_output = control.outputs[1] --[[@as StringOutput]]
	lu.assertEquals(string_output.type, OutputType.string)
	lu.assertEquals(string_output.max_length, max_length)
	lu.assertEquals(string_output.suffix, Suffix.none)
	lu.assertEquals(string_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end

function TestString:testStringLength1Value()
	local max_length = 1
	local getter = function()
		return "h"
	end

	self.module:defineString(id, getter, max_length, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc1 = self.module.memoryMap.entries[moduleAddress].allocations[1]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc1.value, string.byte("h"))
end

function TestString:testStringLength2Value()
	local max_length = 2
	local getter = function()
		return "hi"
	end

	self.module:defineString(id, getter, max_length, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc1 = self.module.memoryMap.entries[moduleAddress].allocations[1]
	local alloc2 = self.module.memoryMap.entries[moduleAddress].allocations[2]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc1.value, string.byte("h"))
	lu.assertEquals(alloc2.value, string.byte("i"))
end

function TestString:testStringLength4Value()
	local max_length = 4
	local getter = function()
		return "yarp"
	end

	self.module:defineString(id, getter, max_length, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc1 = self.module.memoryMap.entries[moduleAddress].allocations[1]
	local alloc2 = self.module.memoryMap.entries[moduleAddress].allocations[2]
	local alloc3 = self.module.memoryMap.entries[moduleAddress + 2].allocations[1]
	local alloc4 = self.module.memoryMap.entries[moduleAddress + 2].allocations[2]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc1.value, string.byte("y"))
	lu.assertEquals(alloc2.value, string.byte("a"))
	lu.assertEquals(alloc3.value, string.byte("r"))
	lu.assertEquals(alloc4.value, string.byte("p"))
end

function TestString:testStringShortLengthValue()
	local max_length = 2
	local getter = function()
		return "h" -- intentionally return a string shorter than the max length
	end

	self.module:defineString(id, getter, max_length, category, description)

	local export_hook = self.module.exportHooks[1]

	local alloc1 = self.module.memoryMap.entries[moduleAddress].allocations[1]
	local alloc2 = self.module.memoryMap.entries[moduleAddress].allocations[2]

	export_hook(MockDevice:new(0))
	lu.assertEquals(alloc1.value, string.byte("h"))
	lu.assertEquals(alloc2.value, string.byte(" ")) -- missing length padded with spaces
end

-- behavior is expected and correct, test disabled because the lua debugger still pauses on errors when running tests
-- function TestString:testStringNilErrorValue()
-- 	local max_length = 2
-- 	local getter = function()
-- 		return nil -- intentionally return nil
-- 	end

-- 	self.module:defineString(id, getter, max_length, category, description)

-- 	local export_hook = self.module.exportHooks[1]

-- 	lu.assertError(export_hook)
-- end
