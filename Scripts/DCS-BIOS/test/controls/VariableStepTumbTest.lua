local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class VariableStepTumbTest
--- @field module Module
VariableStepTumbTest = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function VariableStepTumbTest:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

local id = "MY_VARIABLE_STEP_TUMB"
local category = "Step Control"
local max_value = 65535
local description = ""

function VariableStepTumbTest:testVariableStepTumb()
	local control = self.module:defineVariableStepTumb(id, 6, 3000, 100, 1, category, description)

	lu.assertEquals(control, self.module.documentation[category][id])
	lu.assertEquals(control.control_type, ControlType.metadata)
	lu.assertEquals(control.category, category)
	lu.assertEquals(control.description, description)
	lu.assertEquals(control.identifier, id)
	lu.assertIsNil(control.api_variant)

	lu.assertEquals(#control.inputs, 0)

	lu.assertEquals(#control.outputs, 1)
	local integer_output = control.outputs[1] --[[@as IntegerOutput]]
	lu.assertEquals(integer_output.type, OutputType.integer)
	lu.assertEquals(integer_output.max_value, max_value)
	lu.assertEquals(integer_output.suffix, Suffix.none)
	lu.assertEquals(integer_output.address, moduleAddress) -- first control, should be plenty of room, no need to move the address
end
