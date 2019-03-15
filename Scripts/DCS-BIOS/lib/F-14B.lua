BIOS.protocol.beginModule("F-14B", 0x1200)
BIOS.protocol.setExportModuleAircrafts({"F-14B"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
--local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
--local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
--local defineString = BIOS.util.defineString
--local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
--local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

-- Hydraulics
defineToggleSwitch("P_HYD_TRANS_PUMP_SW", 12, 3001, 629, "Hydraulics", "Pilot Hydraulic Transfer Pump Switch")
defineToggleSwitch("P_HYD_TRANS_PUMP_COVER", 12, 3002, 630, "Hydraulics", "Pilot Hydraulic Transfer Pump Switch Cover")
defineToggleSwitch("P_HYD_ISOL_SW", 12, 3005, 631, "Hydraulics", "Pilot Hydraulic Isolation Switch")
defineToggleSwitch("P_HYD_EMERG_FCONTR_SW", 12, 3003, 928, "Hydraulics", "Pilot Hydraulic Emergency Flight Control Switch")
defineToggleSwitch("P_HYD_EMERG_FCONTR_COVER", 12, 3004, 615, "Hydraulics", "Pilot Hydraulic Emergency Flight Control Switch Cover")
defineToggleSwitch("P_HYD_HAND_PUMP", 12, 3006, 632, "Hydraulics", "Pilot Hydraulic Hand Pump")

-- Master Reset
definePushButton("P_MASTER RESET", 22, 3058, 1071, "Master Reset", "Pilot MASTER RESET")

-- AICS
defineToggleSwitch("P_INLET_RAMPS_L", 13, 3007, 2100, "AICS", "Pilot Stow Inlet Ramps Left Switch")
defineToggleSwitch("P_INLET_RAMPS_R", 13, 3008, 2101, "AICS", "Pilot Stow Inlet Ramps Right Switch")

-- Wing Sweep
defineToggleSwitch("P_EMERG_WING_SWEEP_COVER", 16, 3029, 317, "Wing Sweep", "Pilot Emergency Wing Sweep Handle Cover")
definePotentiometer("P_EMERG_WING_SWEEP_LEVER", 16, 3031, 384, {0, 1}, "Wing Sweep", "Emergency Wing Sweep Handle")
defineToggleSwitch("P_EMERG_WING_SWEEP_POP", 12, 3030, 15096, "Wing Sweep", "Emergency Wing Sweep Handle Pop out")

--Radar Altimeter
definePushButton("P_RADAR_ALT_BIT", 29, 3489, 16020, "Radar Altimeter", "Pilot Radar Altimeter BIT Test Button")
defineRotary("P_RADAR_ALT_KNOB", 29, 3490, 308, "Radar Altimeter", "Pilot Radar Altimeter Control Knob")

BIOS.protocol.endModule()