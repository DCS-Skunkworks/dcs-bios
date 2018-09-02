BIOS.protocol.beginModule("AV8BNA", 0x7800)
BIOS.protocol.setExportModuleAircrafts({"AV8BNA"})

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
	defineTumb(msg, device_id, command, arg_number, 0.1, {0.0, 0.2}, nil, false, category, description)
end


-- Master Modes Panel (MSC)
definePushButton("NAV_SEL", 12, 3282, 282,"Master Modes" , "NAV Master Mode Selector")
definePushButton("VSTOL_SEL", 12, 3284, 284,"Master Modes" , "VSTOL Master Mode Selector")
definePushButton("AG_SEL", 12, 3280, 280,"Master Modes" , "AG Master Mode Selector")

-- Engine Display Panel


BIOS.protocol.endModule()