BIOS.protocol.beginModule("Hercules", 0x6600)
BIOS.protocol.setExportModuleAircrafts({"Hercules"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local define3PosTumb = BIOS.util.define3PosTumb
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--ICS_PANEL
defineToggleSwitch("P_ICS_VOL_BTN", 13, 13013, 1431, "ICS Panel", "PILOT ICS Volume (Pull)")
definePotentiometer("P_ICS_VOL_KNB", 13, 13012, 1430, {-0.5, 0.5}, "ICS Panel", "PILOT ICS Volume (Rotate)")
defineToggleSwitch("CP_ICS_VOL_BTN", 13, 13015, 1433, "ICS Panel", "COPILOT ICS Volume (Pull)")
definePotentiometer("CP_ICS_VOL_KNB", 13, 13014, 1432, {-0.5, 0.5}, "ICS Panel", "COPILOT ICS Volume (Rotate)")
definePotentiometer("P_ICS_UN_KNB", 13, 13016, 1434, {-0.5, 0.5}, "ICS Panel", "PILOT ICS Undefined Knob")
definePotentiometer("CP_ICS_UN_KNB", 13, 13017, 1435, {-0.5, 0.5}, "ICS Panel", "COPILOT ICS Undefined Knob")

-- ELECTRICAL_PANEL
defineToggleSwitch("BATTERY_SW", 13, 13048, 1000, "1Electric Panel", "Battery Switch")
define3PosTumb("EXT_PW_SW", 13, 13011, 1001, "Electric Panel", "External Power/OFF/APU Switch")
defineToggleSwitch("GEN1_SW", 13, 13012, 1003, "Electric Panel", "Generator 1 Switch")
defineToggleSwitch("GEN2_SW", 13, 13013, 1004, "Electric Panel", "Generator 2 Switch")
defineToggleSwitch("GEN3_SW", 13, 13014, 1005, "Electric Panel", "Generator 3 Switch")
defineToggleSwitch("GEN4_SW", 13, 13015, 1006, "Electric Panel", "Generator 4 Switch")
define3PosTumb("BATT_TEST_SW", 13, 13016, 1007, "Electric Panel", "Battery Test Switch")

defineIndicatorLight("EXT_PW_L", 1002, "Electric Panel Lights", "External Power Indicator Light (green)")
-- FIRE_HANDLES

-- ENGINE_START_PANEL
defineTumb("ENG1_START_SW", 13, 13010, 1009, 0.5, {-0.5, 1}, nil, false, "Engine Start Panel", "Engine 1 Stop/Run/Start Selector")
defineTumb("ENG2_START_SW", 13, 13011, 1012, 0.5, {-0.5, 1}, nil, false, "Engine Start Panel", "Engine 2 Stop/Run/Start Selector")
defineTumb("ENG3_START_SW", 13, 13012, 1015, 0.5, {-0.5, 1}, nil, false, "Engine Start Panel", "Engine 3 Stop/Run/Start Selector")
defineTumb("ENG4_START_SW", 13, 1301, 1018, 0.5, {-0.5, 1}, nil, false, "Engine Start Panel", "Engine 4 Stop/Run/Start Selector")

defineIndicatorLight("ENG1_START_L", 1010, "Engine Start Panel Lights", "Engine 1 Start Light (green)")
defineIndicatorLight("ENG2_START_L", 1013, "Engine Start Panel Lights", "Engine 2 Start Light (green)")
defineIndicatorLight("ENG3_START_L", 1016, "Engine Start Panel Lights", "Engine 3 Start Light (green)")
defineIndicatorLight("ENG4_START_L", 1019, "Engine Start Panel Lights", "Engine 4 Start Light (green)")

-- APU_PANEL
defineTumb("APU_START_SW", 13, 13056, 1050, 0.5, {0, 1}, nil, false, "APU Panel", "APU Stop/Run/Start Selector")

defineIndicatorLight("APU_SEL_L", 1051, "APU Panel Lights", "APU Selector Light (green)")
defineIndicatorLight("APU_BLEED_L", 1377, "APU Panel Lights", "APU Bleed Air Light (yellow)")

-- PROPELLER_CONTROL_PANEL

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKEs", function()
	return math.floor(LoGetAircraftDrawArgumentValue(1278)*65535)
end, 65535, "External Aircraft Model", "Speed Brakes")

defineIntegerFromGetter("EXT_LANDING_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(1074) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Landing Light (white)")
defineIntegerFromGetter("EXT_LANDING_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(1075) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Landing Light (white)")
defineIntegerFromGetter("EXT_LANDING_LIGHT_GEAR", function()
	if LoGetAircraftDrawArgumentValue(1079) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Gear Landing Light (white)")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()