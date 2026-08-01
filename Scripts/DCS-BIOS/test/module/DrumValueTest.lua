local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

function testDrumValue()
	lu.assertEquals(Module.drum_value(MockDevice:new(0), 0), 0)
	lu.assertEquals(Module.drum_value(MockDevice:new(0.1), 0), 1)
	lu.assertEquals(Module.drum_value(MockDevice:new(0.9), 0), 9)
	lu.assertEquals(Module.drum_value(MockDevice:new(1), 0), 0)
end

function testInvertedDrumValue()
	lu.assertEquals(Module.drum_value(MockDevice:new(0), 0, true), 0)
	lu.assertEquals(Module.drum_value(MockDevice:new(0.1), 0, true), 9)
	lu.assertEquals(Module.drum_value(MockDevice:new(0.9), 0, true), 1)
	lu.assertEquals(Module.drum_value(MockDevice:new(1), 0, true), 0)
end

function testCappedDrumValue()
	lu.assertEquals(Module.drum_value(MockDevice:new(0), 0, false, 8), 0)
	lu.assertEquals(Module.drum_value(MockDevice:new(0.125), 0, false, 8), 1)
	lu.assertEquals(Module.drum_value(MockDevice:new(0.875), 0, false, 8), 7)
	lu.assertEquals(Module.drum_value(MockDevice:new(1), 0, false, 8), 0)
end

function testInvertedCappedDrumValue()
	lu.assertEquals(Module.drum_value(MockDevice:new(0), 0, true, 8), 0)
	lu.assertEquals(Module.drum_value(MockDevice:new(0.125), 0, true, 8), 7)
	lu.assertEquals(Module.drum_value(MockDevice:new(0.875), 0, true, 8), 1)
	lu.assertEquals(Module.drum_value(MockDevice:new(1), 0, true, 8), 0)
end
