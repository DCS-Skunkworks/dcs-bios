local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestModule
--- @field module Module
TestModule = {}
local moduleName = "MyModule"
local moduleAddress = 0x4200

function TestModule:setUp()
	self.module = Module:new(moduleName, moduleAddress, {})
end

function TestModule:testCreateModule()
	lu.assertEquals(self.module.name, moduleName)
	lu.assertEquals(self.module.memoryMap.baseAddress, moduleAddress)
end

Input_Processor_Device = MockDevice:new(0)

function GetDevice()
	return Input_Processor_Device
end

function LoGetAircraftDrawArgumentValue()
	return GetDevice().value
end

require("Scripts.DCS-BIOS.test.controls.GaugeValueTest")
require("Scripts.DCS-BIOS.test.controls.FloatTest")
require("Scripts.DCS-BIOS.test.controls.IndicatorLightTest")
require("Scripts.DCS-BIOS.test.controls.IndicatorLightInvertedTest")
require("Scripts.DCS-BIOS.test.controls.GatedIndicatorLightTest")
require("Scripts.DCS-BIOS.test.controls.PushButtonTest")
require("Scripts.DCS-BIOS.test.controls.PotentiometerTest")
require("Scripts.DCS-BIOS.test.controls.ToggleSwitchTest")
require("Scripts.DCS-BIOS.test.controls.ToggleSwitchToggleOnlyTest")
require("Scripts.DCS-BIOS.test.controls.MultipositionSwitchTest")
require("Scripts.DCS-BIOS.test.controls.RotaryTest")
require("Scripts.DCS-BIOS.test.controls.ThreePosTumbTest")
require("Scripts.DCS-BIOS.test.controls.FixedStepTumbTest")
require("Scripts.DCS-BIOS.test.controls.FixedStepInputTest")
require("Scripts.DCS-BIOS.test.controls.StringTest")
require("Scripts.DCS-BIOS.test.controls.RockerSwitchTest")
require("Scripts.DCS-BIOS.test.controls.RadioWheelTest")
require("Scripts.DCS-BIOS.test.controls.BitFromDrawArgumentTest")
require("Scripts.DCS-BIOS.test.controls.FloatFromDrawArgumentTest")
require("Scripts.DCS-BIOS.test.controls.FloatFromExternalDrawArgumentTest")
require("Scripts.DCS-BIOS.test.controls.FullRangeFloatFromExternalDrawArgumentTest")
require("Scripts.DCS-BIOS.test.controls.IntegerFromGetterTest")
require("Scripts.DCS-BIOS.test.controls.Float8BitFromGetterTest")
require("Scripts.DCS-BIOS.test.controls.TumbTest")
require("Scripts.DCS-BIOS.test.controls.SpringLoadedThreePosTumbTest")
require("Scripts.DCS-BIOS.test.controls.VariableStepTumbTest")
require("Scripts.DCS-BIOS.test.controls.Float8BitTest")
require("Scripts.DCS-BIOS.test.controls.EjectionHandleSwitchTest")
require("Scripts.DCS-BIOS.test.controls.SetCommandTumbTest")
require("Scripts.DCS-BIOS.test.controls.ReadOnlyRadioTest")
require("Scripts.DCS-BIOS.test.controls.ReadWriteRadioTest")
require("Scripts.DCS-BIOS.test.controls.InputOnlyPushButtonTest")
require("Scripts.DCS-BIOS.test.controls.InputOnlySetStatePushButtonTest")
require("Scripts.DCS-BIOS.test.controls.LoSetCommandTest")
require("Scripts.DCS-BIOS.test.controls.LoSetCommand2PosTest")
