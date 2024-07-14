local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestParseCockpitParams
TestParseCockpitParams = {}

function TestParseCockpitParams:testSample()
	local test_string = [[
PARAM1:1.000000
PARAM2:PARAM3:Foo
PARAM2:PARAM4:2.123456
]]

	function list_cockpit_params()
		return test_string
	end

	local data = Module.parse_cockpit_params()

	lu.assertEquals("1.000000", data["PARAM1"])
	lu.assertEquals("Foo", data["PARAM2:PARAM3"])
	lu.assertEquals("2.123456", data["PARAM2:PARAM4"])
end
