module("CH-47F", package.seeall)

local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class CH_47F: Module
local CH_47F = Module:new("CH-47F", 0x9C00, { "CH-47Fbl1" })

local devices = {
	MCPU = 1,
	CDU_LEFT = 2,
	CDU_RIGHT = 3,
	MFD_COPILOT_OUTBOARD = 4,
	MFD_COPILOT_INBOARD = 5,
	MFD_CENTER = 6,
	MFD_PILOT_INBOARD = 7,
	MFD_PILOT_OUTBOARD = 8,
	FD = 9,
	ADC = 10,
	DTU = 11,
	CAAS = 12,
	FADEC1 = 13,
	FADEC2 = 14,
	FM_PROXY = 15,
	CONTROLS = 16,
	GUNNER_STATIONS = 17,
	PDP1 = 18,
	PDP2 = 19,
	OVERHEAD_CONSOLE = 20,
	CENTRAL_CONSOLE = 21,
	CANTED_CONSOLE = 22,
	SFD1 = 23,
	SFD2 = 24,
	MAINTENANCE_PANEL = 25,
	CHRONOMETER = 26,
	COMPASS = 27,
	EXTERNAL_CARGO_EQUIPMENT = 28,
	EXTERNAL_CARGO_SPEECH = 29,
	GRIPS = 30,
	HEATER = 31,
	EMERGENCY_PANEL = 32,
	LIGHTING_REFLECTS = 33,
	TERTIARY_REFLECTS = 34,
	GPS1 = 35,
	GPS2 = 36,
	EGI1 = 37,
	EGI2 = 38,
	TACAN = 39,
	ILS = 40,
	MLS = 41,
	MARKER_BEACON = 42,
	ARN_147 = 43,
	ARN_149 = 44,
	APN_209 = 45,
	ANV_241A = 46,
	ARC_164 = 47,
	ARC_186 = 48,
	ARC_201 = 49,
	ARC_220 = 50,
	COMM_PANEL_LEFT = 51,
	COMM_PANEL_RIGHT = 52,
	COMM_PANEL_TROOP_COMMANDER = 53,
	COMM_PANEL_LH_GUNNER = 54,
	COMM_PANEL_RH_GUNNER = 55,
	COMM_PANEL_AFT_ENGINEER = 56,
	TURN_IND = 57,
	INTERCOM = 58,
	CREWE = 59,
	WORKSTATIONS = 60,
	AFT_WORKSTATION = 61,
	HELMET_DEVICE = 62,
	MACROS = 63,
	ARCADE = 64,
	KNEEBOARD = 65,
	AN_APR39 = 66,
	AN_AAR57 = 67,
	AN_ALE47 = 68,
	VPM1 = 69,
	VPM2 = 70,
	ACPC = 71,
	FPC = 72,
	CREW_ANIMATION = 73,
	VISOR = 74,
}

--- Adds a rocker switch with momentary on and off positions controlled by a single command
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control
function CH_47F:defineSingleCommandRocker(identifier, device_id, command, arg_number, category, description)
	return self:defineRockerSwitch(identifier, device_id, command, command, command, command, arg_number, category, description)
end

-- Center Console
-- Miscellaneous Switch Control Panel
local CENTER_MISC_SWITCH_PANEL = "Center Console Misc Switch Control Panel"

CH_47F:defineSingleCommandRocker("MISC_CENTER_CGI_TEST", devices.CENTRAL_CONSOLE, 3025, 1465, CENTER_MISC_SWITCH_PANEL, "CGI Test")
CH_47F:defineToggleSwitch("MISC_CENTER_BACKUP_RADIO", devices.CENTRAL_CONSOLE, 3026, 1466, CENTER_MISC_SWITCH_PANEL, "Backup Radio Select")
CH_47F:defineToggleSwitch("MISC_CENTER_ANTENNAE_SELECT", devices.CENTRAL_CONSOLE, 3028, 1467, CENTER_MISC_SWITCH_PANEL, "Antennae Select")

CH_47F:defineFloat("MISC_CENTER_ANT_FM1_VHF", 1395, { 0, 1 }, CENTER_MISC_SWITCH_PANEL, "FM1 (Top) / VHF (Bot) Lamp (Green)")
CH_47F:defineFloat("MISC_CENTER_ANT_VHF_FM1", 1396, { 0, 1 }, CENTER_MISC_SWITCH_PANEL, "VHF (Top) / FM1 (Bot) Lamp (Green)")

-- ASE Control Panel
local ASE_PANEL = "ASE Control Panel"

CH_47F:defineToggleSwitch("ASE_JETTISON_COVER", devices.AN_ALE47, 3001, 1444, ASE_PANEL, "Jettison Switch Cover")
CH_47F:defineToggleSwitch("ASE_JETTISON", devices.AN_ALE47, 3003, 1445, ASE_PANEL, "Jettison Switch")
CH_47F:defineToggleSwitch("ASE_ARM", devices.AN_ALE47, 3005, 1446, ASE_PANEL, "Arm Switch")
CH_47F:defineToggleSwitch("ASE_BYPASS", devices.AN_ALE47, 3007, 1447, ASE_PANEL, "Bypass Switch")
CH_47F:definePotentiometer("ASE_RWR_VOLUME", devices.AN_ALE47, 3009, 1448, { 0, 1 }, ASE_PANEL, "RWR Volume Knob")

CH_47F:defineFloat("ASE_ARM_LAMP", 1449, { 0, 1 }, ASE_PANEL, "Arm Lamp (Green)")

-- ARC-186 Control Panel
local ARC_186 = "ARC-186"

CH_47F:defineRadioWheel("ARC_186_PRESET", devices.ARC_186, 3001, 3001, { -0.01, 0.01 }, 1223, 0.01, { 0, 0.2 }, { " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20" }, ARC_186, "Preset Channel Selector")
CH_47F:defineMultipositionSwitch("ARC_186_FREQUENCY_MODE", devices.ARC_186, 3003, 1224, 3, 0.1, ARC_186, "Frequency Mode Dial")
CH_47F:defineMultipositionSwitch("ARC_186_FREQUENCY_SELECTION", devices.ARC_186, 3004, 1221, 4, 0.1, ARC_186, "Frequency Selection Dial")
CH_47F:definePotentiometer("ARC_186_VOLUME", devices.ARC_186, 3005, 1219, { 0, 1 }, ARC_186, "Volume")
CH_47F:definePushButton("ARC_186_LOAD", devices.ARC_186, 3006, 1222, ARC_186, "Load")
CH_47F:defineSpringloaded_3PosTumb("ARC_186_SQUELCH", devices.ARC_186, 3007, 3008, 1220, ARC_186, "Squelch / TONE") --  as of 2.9.7.59263, this control just doesn't work
CH_47F:defineRadioWheel("ARC_186_FREQ_TENS", devices.ARC_186, 3009, 3010, { -0.1, 0.1 }, 1225, 0.1, { 0, 1 }, nil, ARC_186, "Tens Frequency Selector")
CH_47F:defineRadioWheel("ARC_186_FREQ_ONES", devices.ARC_186, 3011, 3012, { -0.1, 0.1 }, 1226, 0.1, { 0, 1 }, nil, ARC_186, "Ones Frequency Selector")
CH_47F:defineRadioWheel("ARC_186_FREQ_TENTHS", devices.ARC_186, 3013, 3014, { -0.1, 0.1 }, 1227, 0.1, { 0, 1 }, nil, ARC_186, "Tenths Frequency Selector")
CH_47F:defineRadioWheel("ARC_186_FREQ_HUNDREDTHS", devices.ARC_186, 3015, 3016, { -0.25, 0.25 }, 1228, 0.25, { 0, 1 }, nil, ARC_186, "Hundredths Frequency Selector")

-- todo: sometimes this gets slightly out of sync with the model
CH_47F:defineString("ARC_186_FREQ_TENS_VALUE", function(dev0)
	local val = dev0:get_argument_value(1229)
	local output = Module.round(Module.valueConvert(val, { 0.125, 0.775 }, { 0, 13 }))
	output = (output % 13) + 3
	return Functions.pad_left(tostring(output), 2)
end, 2, ARC_186, "Tens Frequency")
CH_47F:defineString("ARC_186_FREQ_ONES_VALUE", function(dev0)
	local val = dev0:get_argument_value(1230)
	return tostring(Module.round(val * 10) % 10)
end, 1, ARC_186, "Ones Frequency")
CH_47F:defineString("ARC_186_FREQ_TENTHS_VALUE", function(dev0)
	local val = dev0:get_argument_value(1231)
	return string.format(".%d", Module.round(val * 10) % 10)
end, 2, ARC_186, "Tenths Frequency")
CH_47F:defineString("ARC_186_FREQ_HUNDREDTHS_VALUE", function(dev0)
	local val = dev0:get_argument_value(1232)
	local step = Module.round(val * 4) % 4
	return string.format("%02d", step * 25)
end, 2, ARC_186, "Hundredths Frequency")

-- Steering Control Panel
local STEERING_PANEL = "Steering Control Panel"

CH_47F:defineMultipositionSwitch("SCP_SWIVEL", devices.CENTRAL_CONSOLE, 3005, 587, 3, 0.1, STEERING_PANEL, "Swivel Switch")
CH_47F:definePotentiometer("SCP_STEER_KNOB", devices.CENTRAL_CONSOLE, 3001, 589, { -1, 1 }, STEERING_PANEL, "Steer Knob")

-- Pilot Low Profile Control Audio Panel
local PILOT_AUDIO_PANEL = "PLT Low Profile Audio Panel"

CH_47F:defineToggleSwitch("PLT_LPCAP_R1_PUSH", devices.COMM_PANEL_RIGHT, 3001, 592, PILOT_AUDIO_PANEL, "FM1 Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_R1_KNOB", devices.COMM_PANEL_RIGHT, 3003, 591, { 0, 1 }, PILOT_AUDIO_PANEL, "FM1 Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_R2_PUSH", devices.COMM_PANEL_RIGHT, 3006, 594, PILOT_AUDIO_PANEL, "UHF Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_R2_KNOB", devices.COMM_PANEL_RIGHT, 3008, 593, { 0, 1 }, PILOT_AUDIO_PANEL, "UHF Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_R3_PUSH", devices.COMM_PANEL_RIGHT, 3011, 596, PILOT_AUDIO_PANEL, "VHF Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_R3_KNOB", devices.COMM_PANEL_RIGHT, 3013, 595, { 0, 1 }, PILOT_AUDIO_PANEL, "VHF Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_R4_PUSH", devices.COMM_PANEL_RIGHT, 3016, 598, PILOT_AUDIO_PANEL, "HF Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_R4_KNOB", devices.COMM_PANEL_RIGHT, 3018, 597, { 0, 1 }, PILOT_AUDIO_PANEL, "HF Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_R5_PUSH", devices.COMM_PANEL_RIGHT, 3021, 600, PILOT_AUDIO_PANEL, "FM2 Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_R5_KNOB", devices.COMM_PANEL_RIGHT, 3023, 599, { 0, 1 }, PILOT_AUDIO_PANEL, "FM2 Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_R6_PUSH", devices.COMM_PANEL_RIGHT, 3026, 602, PILOT_AUDIO_PANEL, "Spare Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_R6_KNOB", devices.COMM_PANEL_RIGHT, 3028, 601, { 0, 1 }, PILOT_AUDIO_PANEL, "Spare Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_R7_PUSH", devices.COMM_PANEL_RIGHT, 3031, 604, PILOT_AUDIO_PANEL, "RWR Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_R7_KNOB", devices.COMM_PANEL_RIGHT, 3033, 603, { 0, 1 }, PILOT_AUDIO_PANEL, "RWR Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_N1_PUSH", devices.COMM_PANEL_RIGHT, 3036, 606, PILOT_AUDIO_PANEL, "VOR Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_N1_KNOB", devices.COMM_PANEL_RIGHT, 3038, 605, { 0, 1 }, PILOT_AUDIO_PANEL, "VOR Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_N2_PUSH", devices.COMM_PANEL_RIGHT, 3041, 608, PILOT_AUDIO_PANEL, "TACAN Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_N2_KNOB", devices.COMM_PANEL_RIGHT, 3043, 607, { 0, 1 }, PILOT_AUDIO_PANEL, "TACAN Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_N3_PUSH", devices.COMM_PANEL_RIGHT, 3046, 610, PILOT_AUDIO_PANEL, "ADF Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_N3_KNOB", devices.COMM_PANEL_RIGHT, 3048, 609, { 0, 1 }, PILOT_AUDIO_PANEL, "ADF Volume")
CH_47F:defineToggleSwitch("PLT_LPCAP_N4_PUSH", devices.COMM_PANEL_RIGHT, 3051, 612, PILOT_AUDIO_PANEL, "MB Mute/Monitor")
CH_47F:definePotentiometer("PLT_LPCAP_N4_KNOB", devices.COMM_PANEL_RIGHT, 3053, 611, { 0, 1 }, PILOT_AUDIO_PANEL, "MB Volume")
CH_47F:definePotentiometer("PLT_LPCAP_MASTER_VOLUME", devices.COMM_PANEL_RIGHT, 3056, 614, { 0, 1 }, PILOT_AUDIO_PANEL, "Master Volume")
CH_47F:definePushButton("PLT_LPCAP_ICS_BUTTON", devices.COMM_PANEL_RIGHT, 3059, 615, PILOT_AUDIO_PANEL, "ICS Button")
CH_47F:definePushButton("PLT_LPCAP_VOX_BUTTON", devices.COMM_PANEL_RIGHT, 3060, 616, PILOT_AUDIO_PANEL, "VOX Button")
CH_47F:definePushButton("PLT_LPCAP_HOT_MIC_BUTTON", devices.COMM_PANEL_RIGHT, 3061, 617, PILOT_AUDIO_PANEL, "Hot Mic Button")
CH_47F:definePushButton("PLT_LPCAP_CALL_BUTTON", devices.COMM_PANEL_RIGHT, 3062, 618, PILOT_AUDIO_PANEL, "Call Button")
CH_47F:defineMultipositionSwitch("PLT_LPCAP_TX_SELECTOR", devices.COMM_PANEL_RIGHT, 3063, 613, 11, 0.05, PILOT_AUDIO_PANEL, "TX Selector Switch")

CH_47F:defineIndicatorLight("PLT_LPCAP_ICU_LIGHT", 619, PILOT_AUDIO_PANEL, "ICU Light (Orange)")
CH_47F:defineIndicatorLight("PLT_LPCAP_ICS_LIGHT", 620, PILOT_AUDIO_PANEL, "ICS Button Light (Yellow)")
CH_47F:defineIndicatorLight("PLT_LPCAP_VOX_LIGHT", 621, PILOT_AUDIO_PANEL, "VOX Button Light (Yellow)")
CH_47F:defineIndicatorLight("PLT_LPCAP_HOT_MIC_LIGHT", 622, PILOT_AUDIO_PANEL, "Hot Mic Button Light (Yellow)")
CH_47F:defineIndicatorLight("PLT_LPCAP_CALL_LIGHT", 623, PILOT_AUDIO_PANEL, "Call Button Light (Yellow)")

-- Copilot Low Profile Control Audio Panel
local COPILOT_AUDIO_PANEL = "CPLT Low Profile Audio Panel"

CH_47F:defineToggleSwitch("CPLT_LPCAP_R1_PUSH", devices.COMM_PANEL_LEFT, 3001, 625, COPILOT_AUDIO_PANEL, "FM1 Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_R1_KNOB", devices.COMM_PANEL_LEFT, 3003, 624, { 0, 1 }, COPILOT_AUDIO_PANEL, "FM1 Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_R2_PUSH", devices.COMM_PANEL_LEFT, 3006, 627, COPILOT_AUDIO_PANEL, "UHF Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_R2_KNOB", devices.COMM_PANEL_LEFT, 3008, 626, { 0, 1 }, COPILOT_AUDIO_PANEL, "UHF Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_R3_PUSH", devices.COMM_PANEL_LEFT, 3011, 629, COPILOT_AUDIO_PANEL, "VHF Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_R3_KNOB", devices.COMM_PANEL_LEFT, 3013, 628, { 0, 1 }, COPILOT_AUDIO_PANEL, "VHF Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_R4_PUSH", devices.COMM_PANEL_LEFT, 3016, 631, COPILOT_AUDIO_PANEL, "HF Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_R4_KNOB", devices.COMM_PANEL_LEFT, 3018, 630, { 0, 1 }, COPILOT_AUDIO_PANEL, "HF Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_R5_PUSH", devices.COMM_PANEL_LEFT, 3021, 633, COPILOT_AUDIO_PANEL, "FM2 Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_R5_KNOB", devices.COMM_PANEL_LEFT, 3023, 632, { 0, 1 }, COPILOT_AUDIO_PANEL, "FM2 Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_R6_PUSH", devices.COMM_PANEL_LEFT, 3026, 635, COPILOT_AUDIO_PANEL, "Spare Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_R6_KNOB", devices.COMM_PANEL_LEFT, 3028, 634, { 0, 1 }, COPILOT_AUDIO_PANEL, "Spare Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_R7_PUSH", devices.COMM_PANEL_LEFT, 3031, 637, COPILOT_AUDIO_PANEL, "RWR Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_R7_KNOB", devices.COMM_PANEL_LEFT, 3033, 636, { 0, 1 }, COPILOT_AUDIO_PANEL, "RWR Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_N1_PUSH", devices.COMM_PANEL_LEFT, 3036, 639, COPILOT_AUDIO_PANEL, "VOR Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_N1_KNOB", devices.COMM_PANEL_LEFT, 3038, 638, { 0, 1 }, COPILOT_AUDIO_PANEL, "VOR Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_N2_PUSH", devices.COMM_PANEL_LEFT, 3041, 641, COPILOT_AUDIO_PANEL, "TACAN Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_N2_KNOB", devices.COMM_PANEL_LEFT, 3043, 640, { 0, 1 }, COPILOT_AUDIO_PANEL, "TACAN Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_N3_PUSH", devices.COMM_PANEL_LEFT, 3046, 643, COPILOT_AUDIO_PANEL, "ADF Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_N3_KNOB", devices.COMM_PANEL_LEFT, 3048, 642, { 0, 1 }, COPILOT_AUDIO_PANEL, "ADF Volume")
CH_47F:defineToggleSwitch("CPLT_LPCAP_N4_PUSH", devices.COMM_PANEL_LEFT, 3051, 645, COPILOT_AUDIO_PANEL, "MB Mute/Monitor")
CH_47F:definePotentiometer("CPLT_LPCAP_N4_KNOB", devices.COMM_PANEL_LEFT, 3053, 644, { 0, 1 }, COPILOT_AUDIO_PANEL, "MB Volume")
CH_47F:definePotentiometer("CPLT_LPCAP_MASTER_VOLUME", devices.COMM_PANEL_LEFT, 3056, 647, { 0, 1 }, COPILOT_AUDIO_PANEL, "Master Volume")
CH_47F:definePushButton("CPLT_LPCAP_ICS_BUTTON", devices.COMM_PANEL_LEFT, 3059, 648, COPILOT_AUDIO_PANEL, "ICS Button")
CH_47F:definePushButton("CPLT_LPCAP_VOX_BUTTON", devices.COMM_PANEL_LEFT, 3060, 649, COPILOT_AUDIO_PANEL, "VOX Button")
CH_47F:definePushButton("CPLT_LPCAP_HOT_MIC_BUTTON", devices.COMM_PANEL_LEFT, 3061, 650, COPILOT_AUDIO_PANEL, "Hot Mic Button")
CH_47F:definePushButton("CPLT_LPCAP_CALL_BUTTON", devices.COMM_PANEL_LEFT, 3062, 651, COPILOT_AUDIO_PANEL, "Call Button")
CH_47F:defineMultipositionSwitch("CPLT_LPCAP_TX_SELECTOR", devices.COMM_PANEL_LEFT, 3063, 646, 11, 0.05, COPILOT_AUDIO_PANEL, "TX Selector Switch")

CH_47F:defineIndicatorLight("CPLT_LPCAP_ICU_LIGHT", 652, COPILOT_AUDIO_PANEL, "ICU Light (Orange)")
CH_47F:defineIndicatorLight("CPLT_LPCAP_ICS_LIGHT", 653, COPILOT_AUDIO_PANEL, "ICS Button Light (Yellow)")
CH_47F:defineIndicatorLight("CPLT_LPCAP_VOX_LIGHT", 654, COPILOT_AUDIO_PANEL, "VOX Button Light (Yellow)")
CH_47F:defineIndicatorLight("CPLT_LPCAP_HOT_MIC_LIGHT", 655, COPILOT_AUDIO_PANEL, "Hot Mic Button Light (Yellow)")
CH_47F:defineIndicatorLight("CPLT_LPCAP_CALL_LIGHT", 656, COPILOT_AUDIO_PANEL, "Call Button Light (Yellow)")

-- Troop Commander Low Profile Control Audio Panel
local TC_AUDIO_PANEL = "TC Low Profile Audio Panel"

CH_47F:defineToggleSwitch("TC_LPCAP_R1_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3001, 658, TC_AUDIO_PANEL, "FM1 Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_R1_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3003, 657, { 0, 1 }, TC_AUDIO_PANEL, "FM1 Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_R2_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3006, 660, TC_AUDIO_PANEL, "UHF Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_R2_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3008, 659, { 0, 1 }, TC_AUDIO_PANEL, "UHF Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_R3_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3011, 662, TC_AUDIO_PANEL, "VHF Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_R3_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3013, 661, { 0, 1 }, TC_AUDIO_PANEL, "VHF Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_R4_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3016, 664, TC_AUDIO_PANEL, "HF Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_R4_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3018, 663, { 0, 1 }, TC_AUDIO_PANEL, "HF Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_R5_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3021, 666, TC_AUDIO_PANEL, "FM2 Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_R5_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3023, 665, { 0, 1 }, TC_AUDIO_PANEL, "FM2 Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_R6_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3026, 668, TC_AUDIO_PANEL, "Spare Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_R6_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3028, 667, { 0, 1 }, TC_AUDIO_PANEL, "Spare Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_R7_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3031, 670, TC_AUDIO_PANEL, "RWR Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_R7_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3033, 669, { 0, 1 }, TC_AUDIO_PANEL, "RWR Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_N1_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3036, 672, TC_AUDIO_PANEL, "VOR Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_N1_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3038, 671, { 0, 1 }, TC_AUDIO_PANEL, "VOR Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_N2_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3041, 674, TC_AUDIO_PANEL, "TACAN Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_N2_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3043, 673, { 0, 1 }, TC_AUDIO_PANEL, "TACAN Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_N3_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3046, 676, TC_AUDIO_PANEL, "ADF Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_N3_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3048, 675, { 0, 1 }, TC_AUDIO_PANEL, "ADF Volume")
CH_47F:defineToggleSwitch("TC_LPCAP_N4_PUSH", devices.COMM_PANEL_TROOP_COMMANDER, 3051, 678, TC_AUDIO_PANEL, "MB Mute/Monitor")
CH_47F:definePotentiometer("TC_LPCAP_N4_KNOB", devices.COMM_PANEL_TROOP_COMMANDER, 3053, 677, { 0, 1 }, TC_AUDIO_PANEL, "MB Volume")
CH_47F:definePotentiometer("TC_LPCAP_MASTER_VOLUME", devices.COMM_PANEL_TROOP_COMMANDER, 3056, 680, { 0, 1 }, TC_AUDIO_PANEL, "Master Volume")
CH_47F:definePushButton("TC_LPCAP_ICS_BUTTON", devices.COMM_PANEL_TROOP_COMMANDER, 3059, 681, TC_AUDIO_PANEL, "ICS Button")
CH_47F:definePushButton("TC_LPCAP_VOX_BUTTON", devices.COMM_PANEL_TROOP_COMMANDER, 3060, 682, TC_AUDIO_PANEL, "VOX Button")
CH_47F:definePushButton("TC_LPCAP_HOT_MIC_BUTTON", devices.COMM_PANEL_TROOP_COMMANDER, 3061, 683, TC_AUDIO_PANEL, "Hot Mic Button")
CH_47F:definePushButton("TC_LPCAP_CALL_BUTTON", devices.COMM_PANEL_TROOP_COMMANDER, 3062, 684, TC_AUDIO_PANEL, "Call Button")
CH_47F:defineMultipositionSwitch("TC_LPCAP_TX_SELECTOR", devices.COMM_PANEL_TROOP_COMMANDER, 3063, 679, 11, 0.05, TC_AUDIO_PANEL, "TX Selector Switch")

CH_47F:defineIndicatorLight("TC_LPCAP_ICU_LIGHT", 685, TC_AUDIO_PANEL, "ICU Light (Orange)")
CH_47F:defineIndicatorLight("TC_LPCAP_ICS_LIGHT", 686, TC_AUDIO_PANEL, "ICS Button Light (Yellow)")
CH_47F:defineIndicatorLight("TC_LPCAP_VOX_LIGHT", 687, TC_AUDIO_PANEL, "VOX Button Light (Yellow)")
CH_47F:defineIndicatorLight("TC_LPCAP_HOT_MIC_LIGHT", 688, TC_AUDIO_PANEL, "Hot Mic Button Light (Yellow)")
CH_47F:defineIndicatorLight("TC_LPCAP_CALL_LIGHT", 689, TC_AUDIO_PANEL, "Call Button Light (Yellow)")

-- Left Gunner Low Profile Control Audio Panel
local LG_AUDIO_PANEL = "Gunner (L) Low Profile Audio Panel"

CH_47F:defineToggleSwitch("LG_LPCAP_R1_PUSH", devices.COMM_PANEL_LH_GUNNER, 3001, 1067, LG_AUDIO_PANEL, "FM1 Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_R1_KNOB", devices.COMM_PANEL_LH_GUNNER, 3003, 1066, { 0, 1 }, LG_AUDIO_PANEL, "FM1 Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_R2_PUSH", devices.COMM_PANEL_LH_GUNNER, 3006, 1069, LG_AUDIO_PANEL, "UHF Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_R2_KNOB", devices.COMM_PANEL_LH_GUNNER, 3008, 1068, { 0, 1 }, LG_AUDIO_PANEL, "UHF Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_R3_PUSH", devices.COMM_PANEL_LH_GUNNER, 3011, 1071, LG_AUDIO_PANEL, "VHF Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_R3_KNOB", devices.COMM_PANEL_LH_GUNNER, 3013, 1070, { 0, 1 }, LG_AUDIO_PANEL, "VHF Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_R4_PUSH", devices.COMM_PANEL_LH_GUNNER, 3016, 1073, LG_AUDIO_PANEL, "HF Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_R4_KNOB", devices.COMM_PANEL_LH_GUNNER, 3018, 1072, { 0, 1 }, LG_AUDIO_PANEL, "HF Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_R5_PUSH", devices.COMM_PANEL_LH_GUNNER, 3021, 1075, LG_AUDIO_PANEL, "FM2 Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_R5_KNOB", devices.COMM_PANEL_LH_GUNNER, 3023, 1074, { 0, 1 }, LG_AUDIO_PANEL, "FM2 Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_R6_PUSH", devices.COMM_PANEL_LH_GUNNER, 3026, 1077, LG_AUDIO_PANEL, "Spare Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_R6_KNOB", devices.COMM_PANEL_LH_GUNNER, 3028, 1076, { 0, 1 }, LG_AUDIO_PANEL, "Spare Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_R7_PUSH", devices.COMM_PANEL_LH_GUNNER, 3031, 1079, LG_AUDIO_PANEL, "RWR Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_R7_KNOB", devices.COMM_PANEL_LH_GUNNER, 3033, 1078, { 0, 1 }, LG_AUDIO_PANEL, "RWR Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_N1_PUSH", devices.COMM_PANEL_LH_GUNNER, 3036, 1081, LG_AUDIO_PANEL, "VOR Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_N1_KNOB", devices.COMM_PANEL_LH_GUNNER, 3038, 1080, { 0, 1 }, LG_AUDIO_PANEL, "VOR Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_N2_PUSH", devices.COMM_PANEL_LH_GUNNER, 3041, 1083, LG_AUDIO_PANEL, "TACAN Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_N2_KNOB", devices.COMM_PANEL_LH_GUNNER, 3043, 1082, { 0, 1 }, LG_AUDIO_PANEL, "TACAN Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_N3_PUSH", devices.COMM_PANEL_LH_GUNNER, 3046, 1085, LG_AUDIO_PANEL, "ADF Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_N3_KNOB", devices.COMM_PANEL_LH_GUNNER, 3048, 1084, { 0, 1 }, LG_AUDIO_PANEL, "ADF Volume")
CH_47F:defineToggleSwitch("LG_LPCAP_N4_PUSH", devices.COMM_PANEL_LH_GUNNER, 3051, 1087, LG_AUDIO_PANEL, "MB Mute/Monitor")
CH_47F:definePotentiometer("LG_LPCAP_N4_KNOB", devices.COMM_PANEL_LH_GUNNER, 3053, 1086, { 0, 1 }, LG_AUDIO_PANEL, "MB Volume")
CH_47F:definePotentiometer("LG_LPCAP_MASTER_VOLUME", devices.COMM_PANEL_LH_GUNNER, 3056, 1089, { 0, 1 }, LG_AUDIO_PANEL, "Master Volume")
CH_47F:definePushButton("LG_LPCAP_ICS_BUTTON", devices.COMM_PANEL_LH_GUNNER, 3059, 1090, LG_AUDIO_PANEL, "ICS Button")
CH_47F:definePushButton("LG_LPCAP_VOX_BUTTON", devices.COMM_PANEL_LH_GUNNER, 3060, 1091, LG_AUDIO_PANEL, "VOX Button")
CH_47F:definePushButton("LG_LPCAP_HOT_MIC_BUTTON", devices.COMM_PANEL_LH_GUNNER, 3061, 1092, LG_AUDIO_PANEL, "Hot Mic Button")
CH_47F:definePushButton("LG_LPCAP_CALL_BUTTON", devices.COMM_PANEL_LH_GUNNER, 3062, 1093, LG_AUDIO_PANEL, "Call Button")
CH_47F:defineMultipositionSwitch("LG_LPCAP_TX_SELECTOR", devices.COMM_PANEL_LH_GUNNER, 3063, 1088, 11, 0.05, LG_AUDIO_PANEL, "TX Selector Switch")

CH_47F:defineIndicatorLight("LG_LPCAP_ICU_LIGHT", 1094, LG_AUDIO_PANEL, "ICU Light (Orange)")
CH_47F:defineIndicatorLight("LG_LPCAP_ICS_LIGHT", 1095, LG_AUDIO_PANEL, "ICS Button Light (Yellow)")
CH_47F:defineIndicatorLight("LG_LPCAP_VOX_LIGHT", 1096, LG_AUDIO_PANEL, "VOX Button Light (Yellow)")
CH_47F:defineIndicatorLight("LG_LPCAP_HOT_MIC_LIGHT", 1097, LG_AUDIO_PANEL, "Hot Mic Button Light (Yellow)")
CH_47F:defineIndicatorLight("LG_LPCAP_CALL_LIGHT", 1098, LG_AUDIO_PANEL, "Call Button Light (Yellow)")

-- Right Gunner Low Profile Control Audio Panel
local RG_AUDIO_PANEL = "Gunner (R) Low Profile Audio Panel"
CH_47F:defineToggleSwitch("RG_LPCAP_R1_PUSH", devices.COMM_PANEL_RH_GUNNER, 3001, 1100, RG_AUDIO_PANEL, "FM1 Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_R1_KNOB", devices.COMM_PANEL_RH_GUNNER, 3003, 1099, { 0, 1 }, RG_AUDIO_PANEL, "FM1 Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_R2_PUSH", devices.COMM_PANEL_RH_GUNNER, 3006, 1102, RG_AUDIO_PANEL, "UHF Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_R2_KNOB", devices.COMM_PANEL_RH_GUNNER, 3008, 1101, { 0, 1 }, RG_AUDIO_PANEL, "UHF Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_R3_PUSH", devices.COMM_PANEL_RH_GUNNER, 3011, 1104, RG_AUDIO_PANEL, "VHF Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_R3_KNOB", devices.COMM_PANEL_RH_GUNNER, 3013, 1103, { 0, 1 }, RG_AUDIO_PANEL, "VHF Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_R4_PUSH", devices.COMM_PANEL_RH_GUNNER, 3016, 1106, RG_AUDIO_PANEL, "HF Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_R4_KNOB", devices.COMM_PANEL_RH_GUNNER, 3018, 1105, { 0, 1 }, RG_AUDIO_PANEL, "HF Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_R5_PUSH", devices.COMM_PANEL_RH_GUNNER, 3021, 1108, RG_AUDIO_PANEL, "FM2 Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_R5_KNOB", devices.COMM_PANEL_RH_GUNNER, 3023, 1107, { 0, 1 }, RG_AUDIO_PANEL, "FM2 Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_R6_PUSH", devices.COMM_PANEL_RH_GUNNER, 3026, 1110, RG_AUDIO_PANEL, "Spare Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_R6_KNOB", devices.COMM_PANEL_RH_GUNNER, 3028, 1109, { 0, 1 }, RG_AUDIO_PANEL, "Spare Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_R7_PUSH", devices.COMM_PANEL_RH_GUNNER, 3031, 1112, RG_AUDIO_PANEL, "RWR Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_R7_KNOB", devices.COMM_PANEL_RH_GUNNER, 3033, 1111, { 0, 1 }, RG_AUDIO_PANEL, "RWR Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_N1_PUSH", devices.COMM_PANEL_RH_GUNNER, 3036, 1114, RG_AUDIO_PANEL, "VOR Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_N1_KNOB", devices.COMM_PANEL_RH_GUNNER, 3038, 1113, { 0, 1 }, RG_AUDIO_PANEL, "VOR Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_N2_PUSH", devices.COMM_PANEL_RH_GUNNER, 3041, 1116, RG_AUDIO_PANEL, "TACAN Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_N2_KNOB", devices.COMM_PANEL_RH_GUNNER, 3043, 1115, { 0, 1 }, RG_AUDIO_PANEL, "TACAN Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_N3_PUSH", devices.COMM_PANEL_RH_GUNNER, 3046, 1118, RG_AUDIO_PANEL, "ADF Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_N3_KNOB", devices.COMM_PANEL_RH_GUNNER, 3048, 1117, { 0, 1 }, RG_AUDIO_PANEL, "ADF Volume")
CH_47F:defineToggleSwitch("RG_LPCAP_N4_PUSH", devices.COMM_PANEL_RH_GUNNER, 3051, 1120, RG_AUDIO_PANEL, "MB Mute/Monitor")
CH_47F:definePotentiometer("RG_LPCAP_N4_KNOB", devices.COMM_PANEL_RH_GUNNER, 3053, 1119, { 0, 1 }, RG_AUDIO_PANEL, "MB Volume")
CH_47F:definePotentiometer("RG_LPCAP_MASTER_VOLUME", devices.COMM_PANEL_RH_GUNNER, 3056, 1122, { 0, 1 }, RG_AUDIO_PANEL, "Master Volume")
CH_47F:definePushButton("RG_LPCAP_ICS_BUTTON", devices.COMM_PANEL_RH_GUNNER, 3059, 1123, RG_AUDIO_PANEL, "ICS Button")
CH_47F:definePushButton("RG_LPCAP_VOX_BUTTON", devices.COMM_PANEL_RH_GUNNER, 3060, 1124, RG_AUDIO_PANEL, "VOX Button")
CH_47F:definePushButton("RG_LPCAP_HOT_MIC_BUTTON", devices.COMM_PANEL_RH_GUNNER, 3061, 1125, RG_AUDIO_PANEL, "Hot Mic Button")
CH_47F:definePushButton("RG_LPCAP_CALL_BUTTON", devices.COMM_PANEL_RH_GUNNER, 3062, 1126, RG_AUDIO_PANEL, "Call Button")
CH_47F:defineMultipositionSwitch("RG_LPCAP_TX_SELECTOR", devices.COMM_PANEL_RH_GUNNER, 3063, 1121, 11, 0.05, RG_AUDIO_PANEL, "TX Selector Switch")

CH_47F:defineIndicatorLight("RG_LPCAP_ICU_LIGHT", 1127, RG_AUDIO_PANEL, "ICU Light (Orange)")
CH_47F:defineIndicatorLight("RG_LPCAP_ICS_LIGHT", 1128, RG_AUDIO_PANEL, "ICS Button Light (Yellow)")
CH_47F:defineIndicatorLight("RG_LPCAP_VOX_LIGHT", 1129, RG_AUDIO_PANEL, "VOX Button Light (Yellow)")
CH_47F:defineIndicatorLight("RG_LPCAP_HOT_MIC_LIGHT", 1130, RG_AUDIO_PANEL, "Hot Mic Button Light (Yellow)")
CH_47F:defineIndicatorLight("RG_LPCAP_CALL_LIGHT", 1131, RG_AUDIO_PANEL, "Call Button Light (Yellow)")

-- Aft Engineer Low Profile Control Audio Panel
local AE_AUDIO_PANEL = "Ramp Low Profile Audio Panel"

CH_47F:defineToggleSwitch("AE_LPCAP_R1_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3001, 691, AE_AUDIO_PANEL, "FM1 Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_R1_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3003, 690, { 0, 1 }, AE_AUDIO_PANEL, "FM1 Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_R2_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3006, 693, AE_AUDIO_PANEL, "UHF Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_R2_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3008, 692, { 0, 1 }, AE_AUDIO_PANEL, "UHF Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_R3_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3011, 695, AE_AUDIO_PANEL, "VHF Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_R3_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3013, 694, { 0, 1 }, AE_AUDIO_PANEL, "VHF Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_R4_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3016, 697, AE_AUDIO_PANEL, "HF Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_R4_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3018, 696, { 0, 1 }, AE_AUDIO_PANEL, "HF Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_R5_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3021, 699, AE_AUDIO_PANEL, "FM2 Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_R5_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3023, 698, { 0, 1 }, AE_AUDIO_PANEL, "FM2 Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_R6_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3026, 701, AE_AUDIO_PANEL, "Spare Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_R6_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3028, 700, { 0, 1 }, AE_AUDIO_PANEL, "Spare Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_R7_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3031, 703, AE_AUDIO_PANEL, "RWR Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_R7_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3033, 702, { 0, 1 }, AE_AUDIO_PANEL, "RWR Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_N1_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3036, 705, AE_AUDIO_PANEL, "VOR Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_N1_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3038, 704, { 0, 1 }, AE_AUDIO_PANEL, "VOR Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_N2_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3041, 707, AE_AUDIO_PANEL, "TACAN Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_N2_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3043, 706, { 0, 1 }, AE_AUDIO_PANEL, "TACAN Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_N3_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3046, 709, AE_AUDIO_PANEL, "ADF Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_N3_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3048, 708, { 0, 1 }, AE_AUDIO_PANEL, "ADF Volume")
CH_47F:defineToggleSwitch("AE_LPCAP_N4_PUSH", devices.COMM_PANEL_AFT_ENGINEER, 3051, 711, AE_AUDIO_PANEL, "MB Mute/Monitor")
CH_47F:definePotentiometer("AE_LPCAP_N4_KNOB", devices.COMM_PANEL_AFT_ENGINEER, 3053, 710, { 0, 1 }, AE_AUDIO_PANEL, "MB Volume")
CH_47F:definePotentiometer("AE_LPCAP_MASTER_VOLUME", devices.COMM_PANEL_AFT_ENGINEER, 3056, 713, { 0, 1 }, AE_AUDIO_PANEL, "Master Volume")
CH_47F:definePushButton("AE_LPCAP_ICS_BUTTON", devices.COMM_PANEL_AFT_ENGINEER, 3059, 714, AE_AUDIO_PANEL, "ICS Button")
CH_47F:definePushButton("AE_LPCAP_VOX_BUTTON", devices.COMM_PANEL_AFT_ENGINEER, 3060, 715, AE_AUDIO_PANEL, "VOX Button")
CH_47F:definePushButton("AE_LPCAP_HOT_MIC_BUTTON", devices.COMM_PANEL_AFT_ENGINEER, 3061, 716, AE_AUDIO_PANEL, "Hot Mic Button")
CH_47F:definePushButton("AE_LPCAP_CALL_BUTTON", devices.COMM_PANEL_AFT_ENGINEER, 3062, 717, AE_AUDIO_PANEL, "Call Button")
CH_47F:defineMultipositionSwitch("AE_LPCAP_TX_SELECTOR", devices.COMM_PANEL_AFT_ENGINEER, 3063, 712, 11, 0.05, AE_AUDIO_PANEL, "TX Selector Switch")

CH_47F:defineIndicatorLight("AE_LPCAP_ICU_LIGHT", 718, AE_AUDIO_PANEL, "ICU Light (Orange)")
CH_47F:defineIndicatorLight("AE_LPCAP_ICS_LIGHT", 719, AE_AUDIO_PANEL, "ICS Button Light (Yellow)")
CH_47F:defineIndicatorLight("AE_LPCAP_VOX_LIGHT", 720, AE_AUDIO_PANEL, "VOX Button Light (Yellow)")
CH_47F:defineIndicatorLight("AE_LPCAP_HOT_MIC_LIGHT", 721, AE_AUDIO_PANEL, "Hot Mic Button Light (Yellow)")
CH_47F:defineIndicatorLight("AE_LPCAP_CALL_LIGHT", 722, AE_AUDIO_PANEL, "Call Button Light (Yellow)")

-- Pilot Cyclic
local PILOT_CYCLIC = "PLT Cyclic"

CH_47F:defineMultipositionSwitch("PLT_CYCLIC_XMIT", devices.GRIPS, 3016, 1271, 3, 0.5, PILOT_CYCLIC, "Radio/ICS Transmit Trigger")
CH_47F:definePushButton("PLT_CYCLIC_CURSOR_ACTIVATION", devices.GRIPS, 3017, 1272, PILOT_CYCLIC, "Cursor Activation")
CH_47F:defineSingleCommandRocker("PLT_CYCLIC_CURSOR_POS_X", devices.GRIPS, 3018, 1273, PILOT_CYCLIC, "Cursor Position Hat (X Axis)")
CH_47F:defineSingleCommandRocker("PLT_CYCLIC_CURSOR_POS_Y", devices.GRIPS, 3019, 1274, PILOT_CYCLIC, "Cursor Position Hat (Y Axis)")
CH_47F:defineSingleCommandRocker("PLT_CYCLIC_AFCS_TRIM_X", devices.GRIPS, 3020, 1275, PILOT_CYCLIC, "AFCS Trim Hat (X Axis)")
CH_47F:defineSingleCommandRocker("PLT_CYCLIC_AFCS_TRIM_Y", devices.GRIPS, 3021, 1276, PILOT_CYCLIC, "AFCS Trim Hat (Y Axis)")
CH_47F:definePushButton("PLT_CYCLIC_FD_DECOUPLE", devices.GRIPS, 3022, 1277, PILOT_CYCLIC, "Flight Director Decoupler")
CH_47F:defineSingleCommandRocker("PLT_CYCLIC_CM_DISPENSE", devices.GRIPS, 3023, 1278, PILOT_CYCLIC, "Flare/Chaff Dispense")
CH_47F:definePushButton("PLT_CYCLIC_ACK", devices.GRIPS, 3024, 1279, PILOT_CYCLIC, "Acknowledge Button")
CH_47F:definePushButton("PLT_CYCLIC_CD_RELEASE", devices.GRIPS, 3025, 1280, PILOT_CYCLIC, "Centering Device Release")
CH_47F:defineToggleSwitch("PLT_CYCLIC_HOOK_RELEASE_COVER", devices.EXTERNAL_CARGO_EQUIPMENT, 3005, 1281, PILOT_CYCLIC, "Cargo Hook Release Cover")
CH_47F:definePushButton("PLT_CYCLIC_HOOK_RELEASE", devices.EXTERNAL_CARGO_EQUIPMENT, 3007, 1282, PILOT_CYCLIC, "Cargo Hook Release")
CH_47F:reserveIntValue(1) -- CM DISP CONT

-- Copilot Cyclic
local COPILOT_CYCLIC = "CPLT Cyclic"

CH_47F:defineMultipositionSwitch("CPLT_CYCLIC_XMIT", devices.GRIPS, 3096, 1283, 3, 0.5, COPILOT_CYCLIC, "Radio/ICS Transmit Trigger")
CH_47F:definePushButton("CPLT_CYCLIC_CURSOR_ACTIVATION", devices.GRIPS, 3097, 1284, COPILOT_CYCLIC, "Cursor Activation")
CH_47F:defineSingleCommandRocker("CPLT_CYCLIC_CURSOR_POS_X", devices.GRIPS, 3098, 1285, COPILOT_CYCLIC, "Cursor Position Hat (X Axis)")
CH_47F:defineSingleCommandRocker("CPLT_CYCLIC_CURSOR_POS_Y", devices.GRIPS, 3099, 1286, COPILOT_CYCLIC, "Cursor Position Hat (Y Axis)")
CH_47F:defineSingleCommandRocker("CPLT_CYCLIC_AFCS_TRIM_X", devices.GRIPS, 3100, 1287, COPILOT_CYCLIC, "AFCS Trim Hat (X Axis)")
CH_47F:defineSingleCommandRocker("CPLT_CYCLIC_AFCS_TRIM_Y", devices.GRIPS, 3101, 1288, COPILOT_CYCLIC, "AFCS Trim Hat (Y Axis)")
CH_47F:definePushButton("CPLT_CYCLIC_FD_DECOUPLE", devices.GRIPS, 3102, 1289, COPILOT_CYCLIC, "Flight Director Decoupler")
CH_47F:defineSingleCommandRocker("CPLT_CYCLIC_CM_DISPENSE", devices.GRIPS, 3103, 1290, COPILOT_CYCLIC, "Flare/Chaff Dispense")
CH_47F:definePushButton("CPLT_CYCLIC_ACK", devices.GRIPS, 3104, 1291, COPILOT_CYCLIC, "Acknowledge Button")
CH_47F:definePushButton("CPLT_CYCLIC_CD_RELEASE", devices.GRIPS, 3105, 1292, COPILOT_CYCLIC, "Centering Device Release")
CH_47F:defineToggleSwitch("CPLT_CYCLIC_HOOK_RELEASE_COVER", devices.EXTERNAL_CARGO_EQUIPMENT, 3009, 1293, COPILOT_CYCLIC, "Cargo Hook Release Cover")
CH_47F:definePushButton("CPLT_CYCLIC_HOOK_RELEASE", devices.EXTERNAL_CARGO_EQUIPMENT, 3011, 1294, COPILOT_CYCLIC, "Cargo Hook Release")
CH_47F:reserveIntValue(1) -- CM DISP CONT

-- Pilot Thrust Lever
local PILOT_THRUST = "PLT Thrust Lever"

CH_47F:definePushButton("PLT_THRUST_BRAKE", devices.GRIPS, 3007, 748, PILOT_THRUST, "Thrust Brake")
CH_47F:definePushButton("PLT_THRUST_MARK", devices.GRIPS, 3001, 1299, PILOT_THRUST, "MARK Button")
CH_47F:defineToggleSwitch("PLT_THRUST_SEARCH_LAMP", devices.GRIPS, 3002, 1295, PILOT_THRUST, "Searchlight IR/White Lamp")
CH_47F:definePushButton("PLT_THRUST_SEARCH_BRT_DIM", devices.GRIPS, 3004, 1296, PILOT_THRUST, "Searchlight Bright/Dim")
CH_47F:defineSingleCommandRocker("PLT_THRUST_SEARCH_X", devices.GRIPS, 3005, 1297, PILOT_THRUST, "Searchlight Position (X Axis)")
CH_47F:defineSingleCommandRocker("PLT_THRUST_SEARCH_Y", devices.GRIPS, 3006, 1298, PILOT_THRUST, "Searchlight Position (Y Axis)")
CH_47F:defineSingleCommandRocker("PLT_THRUST_HOVER_ALT", devices.GRIPS, 3008, 1300, PILOT_THRUST, "Hover Altitude Up/Down")
CH_47F:definePushButton("PLT_THRUST_GO_AROUND", devices.GRIPS, 3009, 1301, PILOT_THRUST, "Go Around")
CH_47F:defineSingleCommandRocker("PLT_THRUST_RADIO_FREQ_X", devices.GRIPS, 3010, 1302, PILOT_THRUST, "Radio Frequency (X Axis)")
CH_47F:defineSingleCommandRocker("PLT_THRUST_RADIO_FREQ_Y", devices.GRIPS, 3011, 1303, PILOT_THRUST, "Radio Frequency (Y Axis)")
CH_47F:defineSingleCommandRocker("PLT_THRUST_HUD_MODE_X", devices.GRIPS, 3012, 1304, PILOT_THRUST, "HUD Mode (X Axis)")
CH_47F:defineSingleCommandRocker("PLT_THRUST_HUD_MODE_Y", devices.GRIPS, 3013, 1305, PILOT_THRUST, "HUD Mode (Y Axis)")
CH_47F:defineSingleCommandRocker("PLT_THRUST_DAFCS_MODE_X", devices.GRIPS, 3014, 1306, PILOT_THRUST, "DAFCS Mode (X Axis)")
CH_47F:defineSingleCommandRocker("PLT_THRUST_DAFCS_MODE_Y", devices.GRIPS, 3015, 1307, PILOT_THRUST, "DAFCS Mode (Y Axis)")

-- Copilot Thrust Lever
local COPILOT_THRUST = "CPLT Thrust Lever"

CH_47F:definePushButton("CPLT_THRUST_BRAKE", devices.GRIPS, 3087, 750, COPILOT_THRUST, "Thrust Brake")
CH_47F:definePushButton("CPLT_THRUST_MARK", devices.GRIPS, 3081, 1312, COPILOT_THRUST, "MARK Button")
CH_47F:defineToggleSwitch("CPLT_THRUST_SEARCH_LAMP", devices.GRIPS, 3082, 1308, COPILOT_THRUST, "Searchlight IR/White Lamp")
CH_47F:definePushButton("CPLT_THRUST_SEARCH_BRT_DIM", devices.GRIPS, 3084, 1309, COPILOT_THRUST, "Searchlight Bright/Dim")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_SEARCH_X", devices.GRIPS, 3085, 1310, COPILOT_THRUST, "Searchlight Position (X Axis)")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_SEARCH_Y", devices.GRIPS, 3086, 1311, COPILOT_THRUST, "Searchlight Position (Y Axis)")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_HOVER_ALT", devices.GRIPS, 3088, 1313, COPILOT_THRUST, "Hover Altitude Up/Down")
CH_47F:definePushButton("CPLT_THRUST_GO_AROUND", devices.GRIPS, 3089, 1314, COPILOT_THRUST, "Go Around")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_RADIO_FREQ_X", devices.GRIPS, 3090, 1315, COPILOT_THRUST, "Radio Frequency (X Axis)")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_RADIO_FREQ_Y", devices.GRIPS, 3091, 1316, COPILOT_THRUST, "Radio Frequency (Y Axis)")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_HUD_MODE_X", devices.GRIPS, 3092, 1317, COPILOT_THRUST, "HUD Mode (X Axis)")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_HUD_MODE_Y", devices.GRIPS, 3093, 1318, COPILOT_THRUST, "HUD Mode (Y Axis)")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_DAFCS_MODE_X", devices.GRIPS, 3094, 1319, COPILOT_THRUST, "DAFCS Mode (X Axis)")
CH_47F:defineSingleCommandRocker("CPLT_THRUST_DAFCS_MODE_Y", devices.GRIPS, 3095, 1320, COPILOT_THRUST, "DAFCS Mode (Y Axis)")

-- Pilot Multi-Function Control Unit
local PILOT_MFCU = "PLT Multi-Function Control Unit"

CH_47F:definePotentiometer("PLT_MFCU_S1_X", devices.GRIPS, 3051, 1414, { 0, 1 }, PILOT_MFCU, "S1 Transducer Hat (X Axis)")
CH_47F:definePotentiometer("PLT_MFCU_S1_Y", devices.GRIPS, 3055, 1415, { 0, 1 }, PILOT_MFCU, "S1 Transducer Hat (Y Axis)")
CH_47F:definePushButton("PLT_MFCU_S1_PRESS", devices.GRIPS, 3059, 1416, PILOT_MFCU, "S1 Transducer Hat (Press)")
CH_47F:defineSingleCommandRocker("PLT_MFCU_S2_X", devices.GRIPS, 3060, 1417, PILOT_MFCU, "S2 Hat (X Axis)")
CH_47F:defineSingleCommandRocker("PLT_MFCU_S2_Y", devices.GRIPS, 3061, 1418, PILOT_MFCU, "S2 Hat (Y Axis)")
CH_47F:defineSingleCommandRocker("PLT_MFCU_S3_X", devices.GRIPS, 3062, 1419, PILOT_MFCU, "S3 Hat (X Axis)")
CH_47F:defineSingleCommandRocker("PLT_MFCU_S3_Y", devices.GRIPS, 3063, 1420, PILOT_MFCU, "S3 Hat (Y Axis)")
CH_47F:definePushButton("PLT_MFCU_S4", devices.GRIPS, 3064, 1421, PILOT_MFCU, "S4 Button")
CH_47F:definePushButton("PLT_MFCU_S5", devices.GRIPS, 3065, 1422, PILOT_MFCU, "S5 Trigger")
CH_47F:definePushButton("PLT_MFCU_S6", devices.GRIPS, 3066, 1423, PILOT_MFCU, "S6 Button")
CH_47F:defineSingleCommandRocker("PLT_MFCU_R1", devices.GRIPS, 3067, 1425, PILOT_MFCU, "R1 Rocker Switch")

-- Copilot Multi-Function Control Unit
local COPILOT_MFCU = "CPLT Multi-Function Control Unit"

CH_47F:definePotentiometer("CPLT_MFCU_S1_X", devices.GRIPS, 3131, 1426, { 0, 1 }, COPILOT_MFCU, "S1 Transducer Hat (X Axis)")
CH_47F:definePotentiometer("CPLT_MFCU_S1_Y", devices.GRIPS, 3135, 1427, { 0, 1 }, COPILOT_MFCU, "S1 Transducer Hat (Y Axis)")
CH_47F:definePushButton("CPLT_MFCU_S1_PRESS", devices.GRIPS, 3139, 1428, COPILOT_MFCU, "S1 Transducer Hat (Press)")
CH_47F:defineSingleCommandRocker("CPLT_MFCU_S2_X", devices.GRIPS, 3140, 1429, COPILOT_MFCU, "S2 Hat (X Axis)")
CH_47F:defineSingleCommandRocker("CPLT_MFCU_S2_Y", devices.GRIPS, 3141, 1430, COPILOT_MFCU, "S2 Hat (Y Axis)")
CH_47F:defineSingleCommandRocker("CPLT_MFCU_S3_X", devices.GRIPS, 3142, 1431, COPILOT_MFCU, "S3 Hat (X Axis)")
CH_47F:defineSingleCommandRocker("CPLT_MFCU_S3_Y", devices.GRIPS, 3143, 1432, COPILOT_MFCU, "S3 Hat (Y Axis)")
CH_47F:definePushButton("CPLT_MFCU_S4", devices.GRIPS, 3144, 1433, COPILOT_MFCU, "S4 Button")
CH_47F:definePushButton("CPLT_MFCU_S5", devices.GRIPS, 3145, 1434, COPILOT_MFCU, "S5 Trigger")
CH_47F:definePushButton("CPLT_MFCU_S6", devices.GRIPS, 3146, 1435, COPILOT_MFCU, "S6 Button")
CH_47F:defineSingleCommandRocker("CPLT_MFCU_R1", devices.GRIPS, 3147, 1437, COPILOT_MFCU, "R1 Rocker Switch")

-- Canted Console
-- Pilot CDU
local PILOT_CDU = "PLT CDU"

CH_47F:definePushButton("PLT_CDU_MSN", devices.CDU_RIGHT, 3070, 417, PILOT_CDU, "MSN")
CH_47F:definePushButton("PLT_CDU_FPLN", devices.CDU_RIGHT, 3071, 418, PILOT_CDU, "FPLN")
CH_47F:definePushButton("PLT_CDU_FD", devices.CDU_RIGHT, 3072, 419, PILOT_CDU, "FD")
CH_47F:definePushButton("PLT_CDU_IDX", devices.CDU_RIGHT, 3064, 420, PILOT_CDU, "IDX")
CH_47F:definePushButton("PLT_CDU_DIR", devices.CDU_RIGHT, 3073, 421, PILOT_CDU, "DIR")
CH_47F:definePushButton("PLT_CDU_SNSR", devices.CDU_RIGHT, 3074, 422, PILOT_CDU, "SNSR")
CH_47F:definePushButton("PLT_CDU_MFD_DATA", devices.CDU_RIGHT, 3075, 423, PILOT_CDU, "MFD DATA")
CH_47F:definePushButton("PLT_CDU_LSK_L1", devices.CDU_RIGHT, 3050, 424, PILOT_CDU, "LSK L1")
CH_47F:definePushButton("PLT_CDU_LSK_L2", devices.CDU_RIGHT, 3051, 425, PILOT_CDU, "LSK L2")
CH_47F:definePushButton("PLT_CDU_LSK_L3", devices.CDU_RIGHT, 3052, 426, PILOT_CDU, "LSK L3")
CH_47F:definePushButton("PLT_CDU_LSK_L4", devices.CDU_RIGHT, 3053, 427, PILOT_CDU, "LSK L4")
CH_47F:definePushButton("PLT_CDU_LSK_L5", devices.CDU_RIGHT, 3054, 428, PILOT_CDU, "LSK L5")
CH_47F:definePushButton("PLT_CDU_LSK_L6", devices.CDU_RIGHT, 3055, 429, PILOT_CDU, "LSK L6")
CH_47F:definePushButton("PLT_CDU_LSK_R1", devices.CDU_RIGHT, 3056, 430, PILOT_CDU, "LSK R1")
CH_47F:definePushButton("PLT_CDU_LSK_R2", devices.CDU_RIGHT, 3057, 431, PILOT_CDU, "LSK R2")
CH_47F:definePushButton("PLT_CDU_LSK_R3", devices.CDU_RIGHT, 3058, 432, PILOT_CDU, "LSK R3")
CH_47F:definePushButton("PLT_CDU_LSK_R4", devices.CDU_RIGHT, 3059, 433, PILOT_CDU, "LSK R4")
CH_47F:definePushButton("PLT_CDU_LSK_R5", devices.CDU_RIGHT, 3060, 434, PILOT_CDU, "LSK R5")
CH_47F:definePushButton("PLT_CDU_LSK_R6", devices.CDU_RIGHT, 3061, 435, PILOT_CDU, "LSK R6")
CH_47F:definePushButton("PLT_CDU_BRT", devices.CDU_RIGHT, 3062, 436, PILOT_CDU, "BRT")
CH_47F:definePushButton("PLT_CDU_DIM", devices.CDU_RIGHT, 3063, 437, PILOT_CDU, "DIM")
CH_47F:definePushButton("PLT_CDU_CNI", devices.CDU_RIGHT, 3076, 438, PILOT_CDU, "CNI")
CH_47F:definePushButton("PLT_CDU_PAD", devices.CDU_RIGHT, 3077, 439, PILOT_CDU, "PAD")
CH_47F:definePushButton("PLT_CDU_LEFT", devices.CDU_RIGHT, 3004, 440, PILOT_CDU, "Left Arrow")
CH_47F:definePushButton("PLT_CDU_RIGHT", devices.CDU_RIGHT, 3005, 441, PILOT_CDU, "Right Arrow")
CH_47F:definePushButton("PLT_CDU_UP", devices.CDU_RIGHT, 3006, 442, PILOT_CDU, "Up Arrow")
CH_47F:definePushButton("PLT_CDU_DOWN", devices.CDU_RIGHT, 3007, 443, PILOT_CDU, "Down Arrow")
CH_47F:definePushButton("PLT_CDU_CLR", devices.CDU_RIGHT, 3008, 444, PILOT_CDU, "CLR")
CH_47F:definePushButton("PLT_CDU_WPN", devices.CDU_RIGHT, 3078, 445, PILOT_CDU, "WPN")
CH_47F:definePushButton("PLT_CDU_1", devices.CDU_RIGHT, 3011, 446, PILOT_CDU, "1")
CH_47F:definePushButton("PLT_CDU_2", devices.CDU_RIGHT, 3012, 447, PILOT_CDU, "2")
CH_47F:definePushButton("PLT_CDU_3", devices.CDU_RIGHT, 3013, 448, PILOT_CDU, "3")
CH_47F:definePushButton("PLT_CDU_4", devices.CDU_RIGHT, 3014, 449, PILOT_CDU, "4")
CH_47F:definePushButton("PLT_CDU_5", devices.CDU_RIGHT, 3015, 450, PILOT_CDU, "5")
CH_47F:definePushButton("PLT_CDU_6", devices.CDU_RIGHT, 3016, 451, PILOT_CDU, "6")
CH_47F:definePushButton("PLT_CDU_7", devices.CDU_RIGHT, 3017, 452, PILOT_CDU, "7")
CH_47F:definePushButton("PLT_CDU_8", devices.CDU_RIGHT, 3018, 453, PILOT_CDU, "8")
CH_47F:definePushButton("PLT_CDU_9", devices.CDU_RIGHT, 3019, 454, PILOT_CDU, "9")
CH_47F:definePushButton("PLT_CDU_0", devices.CDU_RIGHT, 3010, 455, PILOT_CDU, "0")
CH_47F:definePushButton("PLT_CDU_DOT", devices.CDU_RIGHT, 3020, 456, PILOT_CDU, "Dot (.)")
CH_47F:definePushButton("PLT_CDU_MARK", devices.CDU_RIGHT, 3065, 457, PILOT_CDU, "MARK")
CH_47F:definePushButton("PLT_CDU_SLASH", devices.CDU_RIGHT, 3021, 458, PILOT_CDU, "Slash (/)")
CH_47F:definePushButton("PLT_CDU_A", devices.CDU_RIGHT, 3023, 459, PILOT_CDU, "A")
CH_47F:definePushButton("PLT_CDU_B", devices.CDU_RIGHT, 3024, 460, PILOT_CDU, "B")
CH_47F:definePushButton("PLT_CDU_C", devices.CDU_RIGHT, 3025, 461, PILOT_CDU, "C")
CH_47F:definePushButton("PLT_CDU_D", devices.CDU_RIGHT, 3026, 462, PILOT_CDU, "D")
CH_47F:definePushButton("PLT_CDU_E", devices.CDU_RIGHT, 3027, 463, PILOT_CDU, "E")
CH_47F:definePushButton("PLT_CDU_F", devices.CDU_RIGHT, 3028, 464, PILOT_CDU, "F")
CH_47F:definePushButton("PLT_CDU_G", devices.CDU_RIGHT, 3029, 465, PILOT_CDU, "G")
CH_47F:definePushButton("PLT_CDU_H", devices.CDU_RIGHT, 3030, 466, PILOT_CDU, "H")
CH_47F:definePushButton("PLT_CDU_I", devices.CDU_RIGHT, 3031, 467, PILOT_CDU, "I")
CH_47F:definePushButton("PLT_CDU_J", devices.CDU_RIGHT, 3032, 468, PILOT_CDU, "J")
CH_47F:definePushButton("PLT_CDU_K", devices.CDU_RIGHT, 3033, 469, PILOT_CDU, "K")
CH_47F:definePushButton("PLT_CDU_L", devices.CDU_RIGHT, 3034, 470, PILOT_CDU, "L")
CH_47F:definePushButton("PLT_CDU_M", devices.CDU_RIGHT, 3035, 471, PILOT_CDU, "M")
CH_47F:definePushButton("PLT_CDU_N", devices.CDU_RIGHT, 3036, 472, PILOT_CDU, "N")
CH_47F:definePushButton("PLT_CDU_O", devices.CDU_RIGHT, 3037, 473, PILOT_CDU, "O")
CH_47F:definePushButton("PLT_CDU_P", devices.CDU_RIGHT, 3038, 474, PILOT_CDU, "P")
CH_47F:definePushButton("PLT_CDU_Q", devices.CDU_RIGHT, 3039, 475, PILOT_CDU, "Q")
CH_47F:definePushButton("PLT_CDU_R", devices.CDU_RIGHT, 3040, 476, PILOT_CDU, "R")
CH_47F:definePushButton("PLT_CDU_S", devices.CDU_RIGHT, 3041, 477, PILOT_CDU, "S")
CH_47F:definePushButton("PLT_CDU_T", devices.CDU_RIGHT, 3042, 478, PILOT_CDU, "T")
CH_47F:definePushButton("PLT_CDU_U", devices.CDU_RIGHT, 3043, 479, PILOT_CDU, "U")
CH_47F:definePushButton("PLT_CDU_V", devices.CDU_RIGHT, 3044, 480, PILOT_CDU, "V")
CH_47F:definePushButton("PLT_CDU_W", devices.CDU_RIGHT, 3045, 481, PILOT_CDU, "W")
CH_47F:definePushButton("PLT_CDU_X", devices.CDU_RIGHT, 3046, 482, PILOT_CDU, "X")
CH_47F:definePushButton("PLT_CDU_Y", devices.CDU_RIGHT, 3047, 483, PILOT_CDU, "Y")
CH_47F:definePushButton("PLT_CDU_Z", devices.CDU_RIGHT, 3048, 484, PILOT_CDU, "Z")
CH_47F:definePushButton("PLT_CDU_SP", devices.CDU_RIGHT, 3009, 485, PILOT_CDU, "SP")
CH_47F:definePushButton("PLT_CDU_DASH", devices.CDU_RIGHT, 3022, 486, PILOT_CDU, "Dash (-)")
CH_47F:definePushButton("PLT_CDU_TDL", devices.CDU_RIGHT, 3079, 487, PILOT_CDU, "TDL")
CH_47F:definePushButton("PLT_CDU_ASE", devices.CDU_RIGHT, 3080, 488, PILOT_CDU, "ASE")
CH_47F:definePushButton("PLT_CDU_BLANK", devices.CDU_RIGHT, 3066, 489, PILOT_CDU, "Blank")
CH_47F:definePushButton("PLT_CDU_DATA", devices.CDU_RIGHT, 3081, 490, PILOT_CDU, "DATA")
CH_47F:definePushButton("PLT_CDU_STAT", devices.CDU_RIGHT, 3082, 492, PILOT_CDU, "STAT")

CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24) -- todo: this would just be for underscore, since it overlaps on last character. unclear if necessary

-- Copilot CDU
local COPILOT_CDU = "CPLT CDU"

CH_47F:definePushButton("CPLT_CDU_MSN", devices.CDU_LEFT, 3070, 342, COPILOT_CDU, "MSN")
CH_47F:definePushButton("CPLT_CDU_FPLN", devices.CDU_LEFT, 3071, 343, COPILOT_CDU, "FPLN")
CH_47F:definePushButton("CPLT_CDU_FD", devices.CDU_LEFT, 3072, 344, COPILOT_CDU, "FD")
CH_47F:definePushButton("CPLT_CDU_IDX", devices.CDU_LEFT, 3064, 345, COPILOT_CDU, "IDX")
CH_47F:definePushButton("CPLT_CDU_DIR", devices.CDU_LEFT, 3073, 346, COPILOT_CDU, "DIR")
CH_47F:definePushButton("CPLT_CDU_SNSR", devices.CDU_LEFT, 3074, 347, COPILOT_CDU, "SNSR")
CH_47F:definePushButton("CPLT_CDU_MFD_DATA", devices.CDU_LEFT, 3075, 348, COPILOT_CDU, "MFD DATA")
CH_47F:definePushButton("CPLT_CDU_LSK_L1", devices.CDU_LEFT, 3050, 349, COPILOT_CDU, "LSK L1")
CH_47F:definePushButton("CPLT_CDU_LSK_L2", devices.CDU_LEFT, 3051, 350, COPILOT_CDU, "LSK L2")
CH_47F:definePushButton("CPLT_CDU_LSK_L3", devices.CDU_LEFT, 3052, 351, COPILOT_CDU, "LSK L3")
CH_47F:definePushButton("CPLT_CDU_LSK_L4", devices.CDU_LEFT, 3053, 352, COPILOT_CDU, "LSK L4")
CH_47F:definePushButton("CPLT_CDU_LSK_L5", devices.CDU_LEFT, 3054, 353, COPILOT_CDU, "LSK L5")
CH_47F:definePushButton("CPLT_CDU_LSK_L6", devices.CDU_LEFT, 3055, 354, COPILOT_CDU, "LSK L6")
CH_47F:definePushButton("CPLT_CDU_LSK_R1", devices.CDU_LEFT, 3056, 355, COPILOT_CDU, "LSK R1")
CH_47F:definePushButton("CPLT_CDU_LSK_R2", devices.CDU_LEFT, 3057, 356, COPILOT_CDU, "LSK R2")
CH_47F:definePushButton("CPLT_CDU_LSK_R3", devices.CDU_LEFT, 3058, 357, COPILOT_CDU, "LSK R3")
CH_47F:definePushButton("CPLT_CDU_LSK_R4", devices.CDU_LEFT, 3059, 358, COPILOT_CDU, "LSK R4")
CH_47F:definePushButton("CPLT_CDU_LSK_R5", devices.CDU_LEFT, 3060, 359, COPILOT_CDU, "LSK R5")
CH_47F:definePushButton("CPLT_CDU_LSK_R6", devices.CDU_LEFT, 3061, 360, COPILOT_CDU, "LSK R6")
CH_47F:definePushButton("CPLT_CDU_BRT", devices.CDU_LEFT, 3062, 361, COPILOT_CDU, "BRT")
CH_47F:definePushButton("CPLT_CDU_DIM", devices.CDU_LEFT, 3063, 362, COPILOT_CDU, "DIM")
CH_47F:definePushButton("CPLT_CDU_CNI", devices.CDU_LEFT, 3076, 363, COPILOT_CDU, "CNI")
CH_47F:definePushButton("CPLT_CDU_PAD", devices.CDU_LEFT, 3077, 364, COPILOT_CDU, "PAD")
CH_47F:definePushButton("CPLT_CDU_LEFT", devices.CDU_LEFT, 3004, 365, COPILOT_CDU, "Left Arrow")
CH_47F:definePushButton("CPLT_CDU_RIGHT", devices.CDU_LEFT, 3005, 366, COPILOT_CDU, "Right Arrow")
CH_47F:definePushButton("CPLT_CDU_UP", devices.CDU_LEFT, 3006, 367, COPILOT_CDU, "Up Arrow")
CH_47F:definePushButton("CPLT_CDU_DOWN", devices.CDU_LEFT, 3007, 368, COPILOT_CDU, "Down Arrow")
CH_47F:definePushButton("CPLT_CDU_CLR", devices.CDU_LEFT, 3008, 369, COPILOT_CDU, "CLR")
CH_47F:definePushButton("CPLT_CDU_WPN", devices.CDU_LEFT, 3078, 370, COPILOT_CDU, "WPN")
CH_47F:definePushButton("CPLT_CDU_1", devices.CDU_LEFT, 3011, 371, COPILOT_CDU, "1")
CH_47F:definePushButton("CPLT_CDU_2", devices.CDU_LEFT, 3012, 372, COPILOT_CDU, "2")
CH_47F:definePushButton("CPLT_CDU_3", devices.CDU_LEFT, 3013, 373, COPILOT_CDU, "3")
CH_47F:definePushButton("CPLT_CDU_4", devices.CDU_LEFT, 3014, 374, COPILOT_CDU, "4")
CH_47F:definePushButton("CPLT_CDU_5", devices.CDU_LEFT, 3015, 375, COPILOT_CDU, "5")
CH_47F:definePushButton("CPLT_CDU_6", devices.CDU_LEFT, 3016, 376, COPILOT_CDU, "6")
CH_47F:definePushButton("CPLT_CDU_7", devices.CDU_LEFT, 3017, 377, COPILOT_CDU, "7")
CH_47F:definePushButton("CPLT_CDU_8", devices.CDU_LEFT, 3018, 378, COPILOT_CDU, "8")
CH_47F:definePushButton("CPLT_CDU_9", devices.CDU_LEFT, 3019, 379, COPILOT_CDU, "9")
CH_47F:definePushButton("CPLT_CDU_0", devices.CDU_LEFT, 3010, 380, COPILOT_CDU, "0")
CH_47F:definePushButton("CPLT_CDU_DOT", devices.CDU_LEFT, 3020, 381, COPILOT_CDU, "Dot (.)")
CH_47F:definePushButton("CPLT_CDU_MARK", devices.CDU_LEFT, 3065, 382, COPILOT_CDU, "MARK")
CH_47F:definePushButton("CPLT_CDU_SLASH", devices.CDU_LEFT, 3021, 383, COPILOT_CDU, "Slash (/)")
CH_47F:definePushButton("CPLT_CDU_A", devices.CDU_LEFT, 3023, 384, COPILOT_CDU, "A")
CH_47F:definePushButton("CPLT_CDU_B", devices.CDU_LEFT, 3024, 385, COPILOT_CDU, "B")
CH_47F:definePushButton("CPLT_CDU_C", devices.CDU_LEFT, 3025, 386, COPILOT_CDU, "C")
CH_47F:definePushButton("CPLT_CDU_D", devices.CDU_LEFT, 3026, 387, COPILOT_CDU, "D")
CH_47F:definePushButton("CPLT_CDU_E", devices.CDU_LEFT, 3027, 388, COPILOT_CDU, "E")
CH_47F:definePushButton("CPLT_CDU_F", devices.CDU_LEFT, 3028, 389, COPILOT_CDU, "F")
CH_47F:definePushButton("CPLT_CDU_G", devices.CDU_LEFT, 3029, 390, COPILOT_CDU, "G")
CH_47F:definePushButton("CPLT_CDU_H", devices.CDU_LEFT, 3030, 391, COPILOT_CDU, "H")
CH_47F:definePushButton("CPLT_CDU_I", devices.CDU_LEFT, 3031, 392, COPILOT_CDU, "I")
CH_47F:definePushButton("CPLT_CDU_J", devices.CDU_LEFT, 3032, 393, COPILOT_CDU, "J")
CH_47F:definePushButton("CPLT_CDU_K", devices.CDU_LEFT, 3033, 394, COPILOT_CDU, "K")
CH_47F:definePushButton("CPLT_CDU_L", devices.CDU_LEFT, 3034, 395, COPILOT_CDU, "L")
CH_47F:definePushButton("CPLT_CDU_M", devices.CDU_LEFT, 3035, 396, COPILOT_CDU, "M")
CH_47F:definePushButton("CPLT_CDU_N", devices.CDU_LEFT, 3036, 397, COPILOT_CDU, "N")
CH_47F:definePushButton("CPLT_CDU_O", devices.CDU_LEFT, 3037, 398, COPILOT_CDU, "O")
CH_47F:definePushButton("CPLT_CDU_P", devices.CDU_LEFT, 3038, 399, COPILOT_CDU, "P")
CH_47F:definePushButton("CPLT_CDU_Q", devices.CDU_LEFT, 3039, 400, COPILOT_CDU, "Q")
CH_47F:definePushButton("CPLT_CDU_R", devices.CDU_LEFT, 3040, 401, COPILOT_CDU, "R")
CH_47F:definePushButton("CPLT_CDU_S", devices.CDU_LEFT, 3041, 402, COPILOT_CDU, "S")
CH_47F:definePushButton("CPLT_CDU_T", devices.CDU_LEFT, 3042, 403, COPILOT_CDU, "T")
CH_47F:definePushButton("CPLT_CDU_U", devices.CDU_LEFT, 3043, 404, COPILOT_CDU, "U")
CH_47F:definePushButton("CPLT_CDU_V", devices.CDU_LEFT, 3044, 405, COPILOT_CDU, "V")
CH_47F:definePushButton("CPLT_CDU_W", devices.CDU_LEFT, 3045, 406, COPILOT_CDU, "W")
CH_47F:definePushButton("CPLT_CDU_X", devices.CDU_LEFT, 3046, 407, COPILOT_CDU, "X")
CH_47F:definePushButton("CPLT_CDU_Y", devices.CDU_LEFT, 3047, 408, COPILOT_CDU, "Y")
CH_47F:definePushButton("CPLT_CDU_Z", devices.CDU_LEFT, 3048, 409, COPILOT_CDU, "Z")
CH_47F:definePushButton("CPLT_CDU_SP", devices.CDU_LEFT, 3009, 410, COPILOT_CDU, "SP")
CH_47F:definePushButton("CPLT_CDU_DASH", devices.CDU_LEFT, 3022, 411, COPILOT_CDU, "Dash (-)")
CH_47F:definePushButton("CPLT_CDU_TDL", devices.CDU_LEFT, 3079, 412, COPILOT_CDU, "TDL")
CH_47F:definePushButton("CPLT_CDU_ASE", devices.CDU_LEFT, 3080, 413, COPILOT_CDU, "ASE")
CH_47F:definePushButton("CPLT_CDU_BLANK", devices.CDU_LEFT, 3066, 414, COPILOT_CDU, "Blank")
CH_47F:definePushButton("CPLT_CDU_DATA", devices.CDU_LEFT, 3081, 415, COPILOT_CDU, "DATA")
CH_47F:definePushButton("CPLT_CDU_STAT", devices.CDU_LEFT, 3082, 416, COPILOT_CDU, "STAT")

CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24)
CH_47F:reserveStringValue(24) -- todo: this would just be for underscore, since it overlaps on last character. unclear if necessary

-- Pilot Multi-Function Control Knob Panel
local PILOT_MFK_PANEL = "PLT Multi-Function Control Knob Panel"

CH_47F:defineRotary("PLT_MFK_INNER_KNOB", devices.CDU_RIGHT, 3001, 983, PILOT_MFK_PANEL, "Inner Knob (Rotate)")
CH_47F:definePushButton("PLT_MFK_INNER_PRESS", devices.CDU_RIGHT, 3003, 984, PILOT_MFK_PANEL, "Inner Knob (Press)")
CH_47F:defineRotary("PLT_MFK_OUTER_KNOB", devices.CDU_RIGHT, 3002, 982, PILOT_MFK_PANEL, "Outer Knob (Rotate)")

-- Copilot Multi-Function Control Knob Panel
local COPILOT_MFK_PANEL = "CPLT Multi-Function Control Knob Panel"

CH_47F:defineRotary("CPLT_MFK_INNER_KNOB", devices.CDU_LEFT, 3001, 986, COPILOT_MFK_PANEL, "Inner Knob (Rotate)")
CH_47F:definePushButton("CPLT_MFK_INNER_PRESS", devices.CDU_LEFT, 3003, 987, COPILOT_MFK_PANEL, "Inner Knob (Press)")
CH_47F:defineRotary("CPLT_MFK_OUTER_KNOB", devices.CDU_LEFT, 3002, 985, COPILOT_MFK_PANEL, "Outer Knob (Rotate)")

-- Miscellaneous Switch Control Panel
local CANTED_MISC_SWITCH_PANEL = "Canted Console Misc Switch Control Panel"

CH_47F:definePotentiometer("MISC_CANTED_CDU_1_BRT", devices.CANTED_CONSOLE, 3038, 580, { 0, 1 }, CANTED_MISC_SWITCH_PANEL, "CDU 1 Brightness")
CH_47F:definePotentiometer("MISC_CANTED_CDU_2_BRT", devices.CANTED_CONSOLE, 3041, 581, { 0, 1 }, CANTED_MISC_SWITCH_PANEL, "CDU 2 Brightness")
CH_47F:definePushButton("MISC_CANTED_LAMP_TEST", devices.CANTED_CONSOLE, 3044, 582, CANTED_MISC_SWITCH_PANEL, "Lamp Test Button")

-- Emergency/Auxiliary Control Panel
local EMERGENCY_AUX_PANEL = "Emergency/Auxiliary Control Panel"

CH_47F:defineMultipositionSwitch("EMERG_AUX_RADIO_MODE", devices.EMERGENCY_PANEL, 3001, 583, 3, 0.1, EMERGENCY_AUX_PANEL, "Radio Mode (MAN/NORM/GUARD)")
CH_47F:defineToggleSwitch("EMERG_AUX_IDENT", devices.EMERGENCY_PANEL, 3002, 584, EMERGENCY_AUX_PANEL, "Ident Switch")
CH_47F:defineMultipositionSwitch("EMERG_AUX_IFF", devices.EMERGENCY_PANEL, 3003, 585, 3, 0.1, EMERGENCY_AUX_PANEL, "IFF Mode (HOLD/OFF/EMER)")
CH_47F:defineToggleSwitch("EMERG_AUX_ZEROIZE", devices.EMERGENCY_PANEL, 3004, 586, EMERGENCY_AUX_PANEL, "Zeroize Switch")

-- DAFCS Panel
local DAFCS_PANEL = "DAFCS Panel"

CH_47F:definePushButton("DAFCS_FLT_DIR", devices.CANTED_CONSOLE, 3030, 574, DAFCS_PANEL, "FLT DIR Button")
CH_47F:defineSingleCommandRocker("DAFS_TRIM_FWD", devices.CANTED_CONSOLE, 3031, 576, DAFCS_PANEL, "FWD Trim Switch")
CH_47F:defineSingleCommandRocker("DAFS_TRIM_AFT", devices.CANTED_CONSOLE, 3032, 577, DAFCS_PANEL, "AFT Trim Switch")
CH_47F:defineToggleSwitch("DAFCS_MODE", devices.CANTED_CONSOLE, 3033, 578, DAFCS_PANEL, "DAFCS Mode (Manual/Auto)")
CH_47F:defineMultipositionSwitch("DAFCS_SYSTEM", devices.CANTED_CONSOLE, 3035, 579, 5, 0.1, DAFCS_PANEL, "System Select")

CH_47F:defineFloat("DAFCS_CPLR_LIGHT", 575, { 0, 1 }, DAFCS_PANEL, "CPLR Lamp (Green)")

-- Pilot Instrument Panel
-- local PILOT_INSTRUMENT_PANEL = "PLT Instrument Panel"
-- master caution, cabin air pull

-- Copilot Instrument Panel
-- local COPILOT_INSTRUMENT_PANEL = "CPLT Instrument Panel"
-- master caution, cabin air pull

-- Center Instrument Panel
-- local CENTER_INSTRUMENT_PANEL = "Center Instrument Panel"
-- battery low light

-- Pilot Inboard MFD
-- local PILOT_MFD_INNER = "PLT Inboard MFD"

-- Copilot Inboard MFD
-- local COPILOT_MFD_INNER = "CPLT Inboard MFD"

-- Pilot Outboard MFD
-- local PILOT_MFD_OUTER = "PLT Outboard MFD"

-- Copilot Outboard MFD
-- local COPILOT_MFD_OUTER = "CPLT Outboard MFD"

-- Center MFD
-- local CENTER_MFD = "Center MFD"

-- Fire handles
-- local FIRE_PANEL = "Fire Handle Panel"

-- Pilot Standby Flight Display
-- local PILOT_STANDBY_FLIGHT_DISPLAY = "PLT Standby Flight Display"

-- Copilot Standby Flight Display
-- local COPILOT_STANDBY_FLIGHT_DISPLAY = "CPLT Standby Flight Display"

-- Pilot Inclinometer
-- local PILOT_INCLINOMETER = "PLT Inclinometer"

-- Copilot Inclinometer
-- local COPILOT_INCLINOMETER = "CPLT Inclinometer"

-- Radar Altimeter
-- local RADAR_ALTIMETER = "Radar Altimeter"

-- Longitudinal Stick Position Indicator
-- local LONG_STICK_INDICATOR = "Longitudinal Stick Position Indicator"

-- Chronometer
-- local CHRONOMETER = "Chronometer"

-- AN/APR-39
-- local RWR = "AN/APR-39"

-- Magnetic Compass
-- local COMPASS = "Magnetic Compass"

-- Overhead Switch Panel
-- EAPS Control Panel
-- local EAPS_PANEL = "EAPS Control Panel"

-- Exterior Light Panel
-- local EXTERIOR_LIGHT_PANEL = "Exterior Light Panel"

-- Interior Light Panel
-- local INTERIOR_LIGHT_PANEL = "Interior Light Panel"

-- Light Panel
-- local LIGHT_PANEL = "Light Panel"

-- Pilot Light Panel
-- local PILOT_LIGHT_PANEL = "PLT Light Panel"

-- Copilot Light Panel
-- local COPILOT_LIGHT_PANEL = "CPLT Light Panel"

-- Fuel Control Panel
-- local FUEL_PANEL = "Fuel Control Panel"

-- Anti-Ice Panel
-- local ANTI_ICE_PANEL = "Anti-Ice Panel"

-- Eng Cond Panel
-- local ENGINE_COND_PANEL = "Engine Cond Panel"

-- Hoist Control Panel
-- local HOIST_PANEL = "Hoist Control Panel"

-- Troop Warn/Heating Control Panel
-- local TROOP_WARN_HEATING_PANEL = "Troop Warn/Heating Control Panel"

-- Electrical Power Panel
-- local ELECTRICAL_POWER_PANEL = "Electrical Power Panel"

-- FADEC Panel
-- local FADEC_PANEL = "FADEC Panel"

-- Hydraulic Control Panel
-- local HYDRAULIC_PANEL = "Hydraulic Control Panel"

-- Interior Lights
-- local INTERIOR_LIGHTS = "Interior Lights"
-- includes utility light controls, jump light, etc

-- Free Air Temperature Gauge
-- local FREE_AIR_TEMP = "Free Air Temperature Gauge"

-- Pilot Circuit Breakers
-- local PILOT_CIRCUIT_BREAKERS = "PLT Circuit Breakers"

-- Copilot Circuit Breakers
-- local COPILOT_CIRCUIT_BREAKERS = "CPLT Circuit Breakers"

-- Ramp Controls
-- local RAMP_CONTROLS = "Ramp Controls"
-- includes misc controls around the ramp

-- Ramp Maintenance Panel
-- local RAMP_MAINTENANCE_PANEL = "Ramp Maintenance Panel"

-- Interior Model
-- local INTERIOR_MODEL = "Interior Model"
-- seats, hatches, etc

-- Exterior Lights
-- local EXTERIOR_LIGHTS = "Exterior Lights"

-- Exterior Model
-- local EXTERIOR_MODEL = "Exterior Model"

-- Radios

return CH_47F
