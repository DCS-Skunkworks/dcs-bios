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


--Externals
-- defineIntegerFromGetter("EXT_SPEED_BRAKE", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(21)*65535)
-- end, 65535, "External Aircraft Model", "Speed Brake")
-- defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	-- if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Position Lights")

-- defineIntegerFromGetter("EXT_STROBE_LIGHTS", function()
	-- if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Strobe Lights")

-- defineIntegerFromGetter("EXT_WOW_NOSE", function()
	-- if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
-- defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	-- if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
-- defineIntegerFromGetter("EXT_WOW_LEFT", function()
	-- if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()