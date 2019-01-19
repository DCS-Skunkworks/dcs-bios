BIOS.protocol.beginModule("A-4E-C", 0x8400)
BIOS.protocol.setExportModuleAircrafts({"A-4E-C"})

--For the mod visit: https://forums.eagle.ru/showthread.php?t=224989

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication


local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineElectricallyHeldSwitch = BIOS.util.defineElectricallyHeldSwitch
local defineFloat = BIOS.util.defineFloat
local define8BitFloat = BIOS.util.define8BitFloat

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

-- Indicator Lights
defineIndicatorLight("OIL_LIGHT", 150, "Warning, Caution and IndicatorLights","Oil Light")
defineIndicatorLight("AOA_GREEN", 850, "Warning, Caution and IndicatorLights","AoA Green")
defineIndicatorLight("AOA_YELLOW", 851, "Warning, Caution and IndicatorLights","AoA Yellow")
defineIndicatorLight("AOA_RED", 852, "Warning, Caution and IndicatorLights","AoA Red")
defineIndicatorLight("APC_LIGHT", 147, "Warning, Caution and IndicatorLights","APC Light")


-- Gauges
defineFloat("ENGINE_RPM", 520, {0.0, 1.0}, "Gauges", "Engine RPM")
defineFloat("AOA", 840, {0.0, 1.0}, "Gauges", "Angle of Attack")
----------------------------------------------------------------------------------------------------------------
--ELECTRIC SYSTEM
defineToggleSwitch("MASTER_ARM", 3, 3002, 709,"Electric System" , "Master Armament")
defineToggleSwitch("EMERG_GEN_BY", 3, 3022, 1061,"Electric System" , "Emergency Generator Bypass")
defineToggleSwitch("EMERG_GEN_DEPL", 3, 3023, 1243,"Electric System" , "Emergency Generator Deploy")

--CLOCK
definePushButton("STOPWATCH_BTN", 5, 3104, 146, "Clock" , "Stopwatch Button")

-- GEAR
defineToggleSwitch("GEAR_HANDLE", 12, 3020, 8,"Gear" , "Landing Gear Handle")
--defineToggleSwitch("HOOK_HANDLE", 12, 10032, 10,"Gear" , "Landing Hook Handle")
defineToggleSwitch("EMERG_GEAR_HANDLE", 12, 3036, 1240,"Gear" , "Emergency Gear Release")

--AIRBRAKES
defineToggleSwitch("SPEED_B_SW", 10, 3024, 85, "Airbrake" , "Speedbrake switch")
define3PosTumb("SPEED_B_EMERG", 10, 3035, 128, "Airbrake", "Speedbrake emergency")

--FLAPS


--SPOILERS
defineToggleSwitch("SPOILER_ARM", 13, 3017, 84,"Spoiler" , "Spoiler Arm Switch")

--CANOPY
--defineToggleSwitch("CANOPY", 14, --, 0,"Canopy" , "Canopy")

--ENGINE
define3PosTumb("THROTTLE", 17, 3087, 80, "Engine", "Throttle")
defineToggleSwitch("STARTER", 17, 3013, 100,"Engine" , "Starter switch")

-- APPROACH POWER COMPENSATOR PANEL (AFCS)
define3PosTumb("APC_ON", 26, 10121, 135, "AFCS", "APC Enable/Stby/Off")
defineToggleSwitch("AFCS_SBY", 26, 3088, 160,"AFCS" , "AFCS Standby")
defineToggleSwitch("AFCS_ENGAGE", 26, 3089, 161,"AFCS" , "AFCS Engage")


-- AVIONICS
definePotentiometer("SET_ALT", 21, 3019, 827, {0, 1}, "Avionics", "Altimeter Setting")

-- RADAR
defineTumb("RADAR_MODE", 7, 3063, 120, 0.1, {0.0, 0.4}, nil, false, "Radar" ,"Radar Mode Switch")

--EXT_LIGHTS
define3PosTumb("MASTER_LIGHT", 24, 3073, 83, "External Lights", "Master Lighting ON/OFF/Momentary")

BIOS.protocol.endModule()