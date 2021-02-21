-- AVIONICS
-- ELECTRICAL_SYSTEM
-- ENGINE_SYSTEM
-- WEAPON_SYSTEM
-- MFD_SYSTEM
-- PMFD_SYSTEM
-- ICP_SYSTEM
-- FCS

BIOS.protocol.beginModule("F-22A", 0x6600)
BIOS.protocol.setExportModuleAircrafts({"F-22A"})
--v1.0 by WarLord (aka BlackLibrary)

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
local define3PosTumb = BIOS.util.define3PosTumb
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineString = BIOS.util.defineString

defineToggleSwitch("BATT_SW", 3, 3001, 700, "Engine System", "Battery Switch")
define3PosTumb("APU_SW", 3, 3002, 701, "Engine System", "APU Switch")
defineToggleSwitch("GEN_L_SW", 3, 3003, 702, "Engine System", "Left Generator Switch")
defineToggleSwitch("GEN_R_SW", 3, 3004, 703, "Engine System", "Right Generator Switch")


--Externals
-- defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(402)*65535)
-- end, 65535, "External Aircraft Model", "Bottom Right Speed Brake")

-- defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(401)*65535)
-- end, 65535, "External Aircraft Model", "Bottom Left Speed Brake")

-- defineIntegerFromGetter("EXT_SPEED_BRAKE_TOP", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(400)*65535)
-- end, 65535, "External Aircraft Model", "Top Speed Brake")

-- defineIntegerFromGetter("EXT_REFUEL_PROBE", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(22)*65535)
-- end, 65535, "External Aircraft Model", "Fuel Probe")

-- defineIntegerFromGetter("EXT_REFUEL_PROBE_LIGHT", function()
	-- if LoGetAircraftDrawArgumentValue(610) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Refuel Probe Light (red)")

-- defineIntegerFromGetter("EXT_POSITION_LIGHTS_WINGS", function()
	-- if LoGetAircraftDrawArgumentValue(611) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Position Lights Wings (red/green)")

-- defineIntegerFromGetter("EXT_POSITION_LIGHTS_BODY", function()
	-- if LoGetAircraftDrawArgumentValue(612) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Position Lights Body (red/green)")

-- defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	-- if LoGetAircraftDrawArgumentValue(613) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Tail Position Light (white)")

-- defineIntegerFromGetter("EXT_POSITION_LIGHT_CHIN", function()
	-- if LoGetAircraftDrawArgumentValue(614) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Chinpod Position Light (red)")

-- defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
-- end, 65535, "External Aircraft Model", "Formation Lights (yellow green)")

-- defineIntegerFromGetter("EXT_ANTI_COL", function()
	-- if LoGetAircraftDrawArgumentValue(620) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Anticollision Lights")

-- defineIntegerFromGetter("EXT_WOW_NOSE", function()
	-- if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
-- defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	-- if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
-- defineIntegerFromGetter("EXT_WOW_LEFT", function()
	-- if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

-- defineIntegerFromGetter("EXT_YAW_STRING_LR", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(2500)*65535)
-- end, 65535, "External Aircraft Model", "YAW String Left/Right")
-- defineIntegerFromGetter("EXT_YAW_STRING_UD", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(2501)*65535)
-- end, 65535, "External Aircraft Model", "YAW String Up/Down")

BIOS.protocol.endModule()