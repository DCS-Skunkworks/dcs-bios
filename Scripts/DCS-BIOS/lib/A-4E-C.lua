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

-- Control System
--defineToggleSwitch("YAW_DAMPER", 2, 3001, 323,"Control Interface" , "Yaw Damper Switch, YAW/OFF")
defineFloat("ENGINE_RPM", 520, {0.0, 1.0}, "Gauges", "Engine RPM")
definePotentiometer("SET_ALT", 20, 10827, 827, {0, 1}, "Main Panel", "Altimeter Setting")
define3PosTumb("APC_ON", 25, 10135, 135, "Electric", "APC Enable/Stby/Off")

BIOS.protocol.endModule()