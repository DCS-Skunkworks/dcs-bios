BIOS.protocol.beginModule("Hercules", 0x6600)
BIOS.protocol.setExportModuleAircrafts({"Hercules"})
--by WarLord (aka BlackLibrary)

local inputProcessors = moduleBeingDefined.inputProcessors
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
defineToggleSwitch("P_ICS_VOL_BTN", 1, 13039, 1431, "ICS Panel", "PILOT ICS Volume (Pull)")
definePotentiometer("P_ICS_VOL_KNB", 1, 13038, 1430, {-0.5, 0.5}, "ICS Panel", "PILOT ICS Volume (Rotate)")
defineToggleSwitch("CP_ICS_VOL_BTN", 1, 13040, 1433, "ICS Panel", "COPILOT ICS Volume (Pull)")
definePotentiometer("CP_ICS_VOL_KNB", 1, 13041, 1432, {-0.5, 0.5}, "ICS Panel", "COPILOT ICS Volume (Rotate)")
definePotentiometer("P_ICS_UN_KNB", 1, 13041, 1434, {-0.5, 0.5}, "ICS Panel", "PILOT ICS Undefined Knob")
definePotentiometer("CP_ICS_UN_KNB", 1, 13042, 1435, {-0.5, 0.5}, "ICS Panel", "COPILOT ICS Undefined Knob")

-- ELECTRICAL_PANEL
defineToggleSwitch("BATTERY_SW", 1, 13046, 1000, "Electric Panel", "Battery Switch")
define3PosTumb("EXT_PW_SW", 1, 13047, 1001, "Electric Panel", "External Power/OFF/APU Switch")
defineToggleSwitch("GEN1_SW", 1, 13048, 1003, "Electric Panel", "Generator 1 Switch")
defineToggleSwitch("GEN2_SW", 1, 13049, 1004, "Electric Panel", "Generator 2 Switch")
defineToggleSwitch("GEN3_SW", 1, 13050, 1005, "Electric Panel", "Generator 3 Switch")
defineToggleSwitch("GEN4_SW", 1, 13051, 1006, "Electric Panel", "Generator 4 Switch")
define3PosTumb("BATT_TEST_SW", 1, 13052, 1007, "Electric Panel", "Battery Test Switch")

-- FIRE_HANDLES

-- ENGINE_START_PANEL
defineTumb("ENG1_START_SW", 1, 13053, 1009, 0.5, {-0.5, 1}, nil, false, "Engine Start Panel", "Engine 1 Stop/Run/Start Selector")
defineTumb("ENG2_START_SW", 1, 13054, 1012, 0.5, {-0.5, 1}, nil, false, "Engine Start Panel", "Engine 2 Stop/Run/Start Selector")
defineTumb("ENG3_START_SW", 1, 13055, 1015, 0.5, {-0.5, 1}, nil, false, "Engine Start Panel", "Engine 3 Stop/Run/Start Selector")
defineTumb("ENG4_START_SW", 1, 13056, 1018, 0.5, {-0.5, 1}, nil, false, "Engine Start Panel", "Engine 4 Stop/Run/Start Selector")

-- APU_PANEL
defineTumb("APU_START_SW", 1, 13056, 1050, 0.5, {0, 1}, nil, false, "APU Panel", "APU Stop/Run/Start Selector")

-- PROPELLER_CONTROL_PANEL

-- LIGHTS
defineIndicatorLight("EXT_PW_L", 1002, "Warning, Caution and IndicatorLights", "External Power Indicator Light (green)")
defineIndicatorLight("APU_SEL_L", 1051, "Warning, Caution and IndicatorLights", "APU Selector Light (green)")
defineIndicatorLight("APU_BLEED_L", 1377, "Warning, Caution and IndicatorLights", "APU Bleed Air Light (yellow)")
defineIndicatorLight("ENG1_START_L", 1010, "Warning, Caution and IndicatorLights", "Engine 1 Start Light (green)")
defineIndicatorLight("ENG2_START_L", 1013, "Warning, Caution and IndicatorLights", "Engine 2 Start Light (green)")
defineIndicatorLight("ENG3_START_L", 1016, "Warning, Caution and IndicatorLights", "Engine 3 Start Light (green)")
defineIndicatorLight("ENG4_START_L", 1019, "Warning, Caution and IndicatorLights", "Engine 4 Start Light (green)")

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