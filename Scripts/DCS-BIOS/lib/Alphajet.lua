BIOS.protocol.beginModule("Alphajet", 0x6400)
BIOS.protocol.setExportModuleAircrafts({"Alphajet"})
--by WarLord (aka BlackLibrary)
--for Alphajet 2.5.5

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3PosTumb = BIOS.util.define3PosTumb

--Gauges
defineFloat("ADI_BALL", 31, {-1, 1}, "Gauges", "ADI Heading")
defineFloat("ADI_PITCH", 109, {-1, 1}, "Gauges", "ADI Pitch")
defineFloat("ADI_BANK", 108, {-1, 1}, "Gauges", "ADI Bank")
defineFloat("CANOPY_POS", 181, {0, 1}, "Gauges", "Canopy Position")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE", function()
	return math.floor(LoGetAircraftDrawArgumentValue(21)*65535)
end, 65535, "External Aircraft Model", "Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (green/red)")

defineIntegerFromGetter("EXT_STROBE_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Lights (white)")

defineIntegerFromGetter("EXT_GEAR_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Gear Light (white)")

defineIntegerFromGetter("EXT_NOSE_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(130) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Nose and Right Gear Lights (white)")

defineIntegerFromGetter("EXT_BOT_TAIL_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(202) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Bottom Tail Lights (red)")

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