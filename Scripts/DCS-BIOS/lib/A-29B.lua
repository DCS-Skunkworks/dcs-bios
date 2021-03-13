BIOS.protocol.beginModule("A-29B", 0x8800)
BIOS.protocol.setExportModuleAircrafts({"A-29B"})
--v 1.0 by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineRotary = BIOS.util.defineRotary
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

defineFloat("CANOPY_VALUE", 26, {0.0, 1.0}, "Gauges", "Canopy Position")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(49) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (red,green, White)")

defineIntegerFromGetter("EXT_LANDING_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(51) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Lights (yellow)")

defineIntegerFromGetter("EXT_STROBE_TOP", function()
	if LoGetAircraftDrawArgumentValue(83) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Strobe Light (white)")

defineIntegerFromGetter("EXT_TOP_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(802) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Light (white)")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_REAR", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Rear Gear")

BIOS.protocol.endModule()