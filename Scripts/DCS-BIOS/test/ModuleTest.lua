local MockDevice = require("MockDevice")
local Module = require("Module")

local lu = require("luaunit")

--- @class TestModule
--- @field module Module
TestModule = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestModule:setUp() self.module = Module:new(moduleName, moduleAddress, {}) end

function TestModule:testCreateModule()
	lu.assertEquals(self.module.name, moduleName)
	lu.assertEquals(self.module.memoryMap.baseAddress, moduleAddress)
end

Input_Processor_Device = MockDevice:new(0)

function GetDevice() return Input_Processor_Device end

function LoGetAircraftDrawArgumentValue() return GetDevice().value end

require("GaugeValueTest")
require("FloatTest")
require("IndicatorLightTest")
require("GatedIndicatorLightTest")
require("PushButtonTest")
require("PotentiometerTest")
require("ToggleSwitchTest")
require("MultipositionSwitchTest")
require("RotaryTest")
require("ThreePosTumbTest")
require("FixedStepTumbTest")
require("FixedStepInputTest")
require("StringTest")
require("RockerSwitchTest")
require("RadioWheelTest")
require("BitFromDrawArgumentTest")
require("FloatFromDrawArgumentTest")
require("IntegerFromGetterTest")
require("TumbTest")
require("SpringLoadedThreePosTumbTest")
