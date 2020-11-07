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

defineToggleSwitch("BATTERY_SW", 4, 13046, 1000, "Electric Panel", "Battery Switch")
define3PosTumb("APU_SW", 1, 13047, 1001, "Electric Panel", "External Power/OFF/APU Switch")
defineToggleSwitch("GEN1_SW", 1, 13048, 1003, "Electric Panel", "Generator 1 Switch")
defineToggleSwitch("GEN2_SW", 1, 13049, 1004, "Electric Panel", "Generator 2 Switch")
defineToggleSwitch("GEN3_SW", 1, 13050, 1005, "Electric Panel", "Generator 3 Switch")
defineToggleSwitch("GEN4_SW", 1, 13051, 1006, "Electric Panel", "Generator 4 Switch")
define3PosTumb("BATT_TEST_SW", 1, 13052, 1007, "Electric Panel", "Battery Test Switch")

defineIndicatorLight("EXT_PW_L", 1002, "Warning, Caution and IndicatorLights", "External Power Indicator Light (green)")
defineIndicatorLight("APU_SEL_L", 1051, "Warning, Caution and IndicatorLights", "APU Selector Light (yellow)")
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