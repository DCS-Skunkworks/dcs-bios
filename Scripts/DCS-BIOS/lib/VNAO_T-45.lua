BIOS.protocol.beginModule("VNAO_T-45", 0x9000)
BIOS.protocol.setExportModuleAircrafts({"T-45"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local define3PosTumb = BIOS.util.define3PosTumb
local defineTumb = BIOS.util.defineTumb
local defineFloat = BIOS.util.defineFloat
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineToggleSwitch = BIOS.util.defineToggleSwitch

defineTumb("FLAPS_LVR", 19, 3013, 7, 0.5, {0, 1}, nil, false, "General", "Flaps Lever, UP/ 1/2 /DOWN")
defineToggleSwitch("EMERG_FLAP_SW", 19, 3027, 184, "General", "EMER FLAPS Switch, NORM/DOWN")

--Gauges
--defineFloat("FAN1", 380, {0, 1}, "Gauges", "Fan 1 Spin")
defineFloat("CANOPY_VALUE", 1, {0, 1}, "Gauges", "Canopy Position")

defineIntegerFromGetter("EXT_HOOK", function()
	return math.floor(LoGetAircraftDrawArgumentValue(25)*65535)
end, 65535, "External Aircraft Model", "Hook")
defineIntegerFromGetter("EXT_TOP_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Light (white)")
defineIntegerFromGetter("EXT_STROBE", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Lights (red)")
defineIntegerFromGetter("EXT_TAIL_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Light (white)")
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (green,red)")
defineIntegerFromGetter("EXT_NAV_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(195) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Navigation Lights (yellow)")
defineIntegerFromGetter("EXT_TAXI_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(189) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Taxi Light (white)")
defineIntegerFromGetter("EXT_SPEED_BRAKES", function()
	return math.floor(LoGetAircraftDrawArgumentValue(500)*65535)
end, 65535, "External Aircraft Model", "Speed Brakes")
defineIntegerFromGetter("EXT_FAN", function()
	if LoGetAircraftDrawArgumentValue(60) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Fan")
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