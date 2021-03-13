BIOS.protocol.beginModule("A-29B", 0x8800)
BIOS.protocol.setExportModuleAircrafts({"A-29B"})
--v 1.0 by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local define3PosTumb = BIOS.util.define3PosTumb
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineRotary = BIOS.util.defineRotary
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

defineToggleSwitch("CANOPY_LVR", 15, 71, 129, "Cockpit Mechanics", "Canopy Lever")
definePotentiometer("RIO_TCS_TRIM_AZI", 16, 3015, 132, {0, 1}, "Cockpit Mechanics", "Flaps Control Handle")

--ELECTRICAL
define3PosTumb("BATTERY_SW", 1, 3178, 961, "Electric System", "Battery (Reset/On/Off)")
defineToggleSwitch("GENERATOR_SW", 1, 3179, 962, "Electric System", "Generator (On/Off-Reset)")
defineToggleSwitch("EXT_PW_SW", 1, 3181, 963, "Electric System", "External Power (ON/Off)")
defineToggleSwitch("BACKUP_SW", 1, 3182, 964, "Electric System", "Backup (Auto/Off)")
define3PosTumb("EMERG_OVER_SW", 1, 3183, 965, "Electric System", "Emergency Override (Emergency/Auto/Auto)")
define3PosTumb("AIR_INTERCON_SW", 1, 3184, 966, "Electric System", "Aircraft Interconnect (On/Off/Off)")

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