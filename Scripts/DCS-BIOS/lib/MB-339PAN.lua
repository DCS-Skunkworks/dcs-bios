BIOS.protocol.beginModule("MB-339PAN", 0x8200)
BIOS.protocol.setExportModuleAircrafts({"MB-339PAN"})

--For the mod visit: http://www.freccetricolorivirtuali.net/mod%20ftv.htm

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

defineToggleSwitch("MASTER_ARM", 26, 3014, 475,"Weapons" , "MASTER ARMAMENT Switch")
defineFloat("ACCELEROMETER", 68, {0.0, 1.0}, "Gauges", "Accelerometer")
defineFloat("ENGINE_RPM", 16, {0.0, 1.0}, "Gauges", "Engine RPM")

BIOS.protocol.endModule()