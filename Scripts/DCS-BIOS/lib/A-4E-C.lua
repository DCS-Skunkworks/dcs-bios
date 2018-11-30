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

-- Gauges
defineFloat("ENGINE_RPM", 520, {0.0, 1.0}, "Gauges", "Engine RPM")
defineFloat("AOA", 840, {0.0, 1.0}, "Gauges", "Angle of Attack")
----------------------------------------------------------------------------------------------------------------
-- APPROACH POWER COMPENSATOR PANEL #17A
define3PosTumb("APC_ON", 25, 10135, 135, "Electric", "APC Enable/Stby/Off")
-- ALTIMETER PANEL #41
definePotentiometer("SET_ALT", 20, 10827, 827, {0, 1}, "Main Panel", "Altimeter Setting")
-- RADAR CONTROL PANEL #6
defineMultipositionSwitch("RADAR_MODE", 6, 10073, 120, 5, 0.1,"Radar" ,"Radar Mode Switch")

BIOS.protocol.endModule()