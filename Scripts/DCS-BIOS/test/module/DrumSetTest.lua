local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

-- the test fixture doesn't support returning different values for different arg ids currently, so we'll just test the length
function testDrumSet()
	lu.assertEquals(Module.drum_set(MockDevice:new(0), 0), "0")
	lu.assertEquals(Module.drum_set(MockDevice:new(0.1), 0, 0), "11")
	lu.assertEquals(Module.drum_set(MockDevice:new(0.9), 0, 0, 0), "999")
	lu.assertEquals(Module.drum_set(MockDevice:new(1), 0, 0, 0, 0), "0000")
end
