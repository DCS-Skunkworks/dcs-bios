module("CH-47F", package.seeall)

local CH_47F_CDU = require("Scripts.DCS-BIOS.lib.modules.displays.CH_47F_CDU")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local Log = require("Scripts.DCS-BIOS.lib.common.Log")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local TextDisplay = require("Scripts.DCS-BIOS.lib.modules.TextDisplay")

--- @class CH_47F: Module
local CH_47F = Module:new("CH-47F", 0x9C00, { "CH-47Fbl1" })

local devices = {
	MCPU = 1,
	CDU_LEFT = 2,
	CDU_RIGHT = 3,
	MFD_KEYS = 4,
	MFD_COPILOT_OUTBOARD = 5,
	MFD_COPILOT_INBOARD = 6,
	MFD_CENTER = 7,
	MFD_PILOT_INBOARD = 8,
	MFD_PILOT_OUTBOARD = 9,
	FD = 10,
	ADC = 11,
	DTU = 12,
	CAAS = 13,
	FPM = 14,
	FADEC1 = 15,
	FADEC2 = 16,
	FM_PROXY = 17,
	CONTROLS = 18,
	GUNNER_STATIONS = 19,
	PDP1 = 20,
	PDP2 = 21,
	OVERHEAD_CONSOLE = 22,
	CENTRAL_CONSOLE = 23,
	CANTED_CONSOLE = 24,
	SFD1 = 25,
	SFD2 = 26,
	MAINTENANCE_PANEL = 27,
	CHRONOMETER = 28,
	COMPASS = 29,
	EXTERNAL_CARGO_EQUIPMENT = 30,
	EXTERNAL_CARGO_SPEECH = 31,
	GRIPS = 32,
	HEATER = 33,
	EMERGENCY_PANEL = 34,
	LIGHTING_REFLECTS = 35,
	TERTIARY_REFLECTS = 36,
	GPS1 = 37,
	GPS2 = 38,
	EGI1 = 39,
	EGI2 = 40,
	TACAN = 41,
	ILS = 42,
	MLS = 43,
	MARKER_BEACON = 44,
	ARN_147 = 45,
	ARN_149 = 46,
	APN_209 = 47,
	ANV_241A = 48,
	ARC_164 = 49,
	ARC_186 = 50,
	ARC_201 = 51,
	ARC_220 = 52,
	COMM_PANEL_LEFT = 53,
	COMM_PANEL_RIGHT = 54,
	COMM_PANEL_TROOP_COMMANDER = 55,
	COMM_PANEL_LH_GUNNER = 56,
	COMM_PANEL_RH_GUNNER = 57,
	COMM_PANEL_AFT_ENGINEER = 58,
	TURN_IND = 59,
	INTERCOM = 60,
	CREWE = 61,
	WORKSTATIONS = 62,
	AFT_WORKSTATION = 63,
	HELMET_DEVICE = 64,
	MACROS = 65,
	ARCADE = 66,
	KNEEBOARD = 67,
	AN_APR39 = 68,
	AN_AAR57 = 69,
	AN_ALE47 = 70,
	VPM1 = 71,
	VPM2 = 72,
	ACPC = 73,
	FPC = 74,
	CREW_ANIMATION = 75,
	VISOR = 76,
	AN_APX_118 = 77,
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

local plt_cdu_lines = { "", "", "", "", "", "", "", "", "", "", "", "", "", "" }
local cplt_cdu_lines = { "", "", "", "", "", "", "", "", "", "", "", "", "", "" }
local plt_cdu_colors = { "", "", "", "", "", "", "", "", "", "", "", "", "", "" }
local cplt_cdu_colors = { "", "", "", "", "", "", "", "", "", "", "", "", "", "" }

-- ¡ == ✓
-- { == ↑
-- } == ↓
-- < == Δ
-- > == Ṫ (or something similar)
local cdu_replace_map = {
	[string.char(26)] = string.char(0xBB), -- →
	[string.char(27)] = string.char(0xAB), -- ←
	[string.char(18)] = string.char(0xAE), -- ↕
	[string.char(20)] = string.char(0xA1), -- ✓
}

--- Guesses the current CDU page. This is the best we can do, as the CDU page name isn't actually exposed anywehre.
--- @param cdu { [string|integer]: string } the actual cdu data
--- @param reference { [string]: TextDisplayItem[] } the reference used to determine which strings are shown where
--- @return string page_name the name of the current CDU page
local function guess_cdu_page_name(cdu, reference)
	for key, _ in pairs(cdu) do
		local ref = reference[key]

		-- first, find a control that only has one variation
		if ref ~= nil and #ref == 1 then
			local pages = ref[1].pages
			-- then, ensure that control only occurs on one page
			if pages ~= nil and #pages == 1 then
				return pages[1] -- if so, this must be the right page
			end
		end
	end

	Log:log_warn("unable to get CDU page name")
	return ""
end

local CDU_LINE_LEN = 24

CH_47F:addExportHook(function()
	local cdu = Module.parse_indication(1)

	local scratch_string = cdu["scratch_text"]
	if scratch_string ~= nil then
		CH_47F_CDU["scratch_cursor"][1].x = 3 + scratch_string:len()
	end

	local display_page = guess_cdu_page_name(cdu, CH_47F_CDU)
	plt_cdu_lines, plt_cdu_colors = TextDisplay.GetDisplayLinesWithColor(cdu, CDU_LINE_LEN, 14, CH_47F_CDU, display_page, cdu_replace_map, nil, false)
end)

CH_47F:addExportHook(function()
	local cdu = Module.parse_indication(0)

	local scratch_string = cdu["scratch_text"]
	if scratch_string ~= nil then
		CH_47F_CDU["scratch_cursor"][1].x = 3 + scratch_string:len()
	end

	local display_page = guess_cdu_page_name(cdu, CH_47F_CDU)
	cplt_cdu_lines, cplt_cdu_colors = TextDisplay.GetDisplayLinesWithColor(cdu, CDU_LINE_LEN, 14, CH_47F_CDU, display_page, cdu_replace_map, nil, false)
end)

-- Canted Console
-- Pilot CDU
local PILOT_CDU = "PLT CDU Buttons"

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

local PILOT_CDU_DISPLAY = "PLT CDU Display"

CH_47F:defineString("PLT_CDU_LINE1", function()
	return plt_cdu_lines[1]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 1")
CH_47F:defineString("PLT_CDU_LINE2", function()
	return plt_cdu_lines[2]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 2")
CH_47F:defineString("PLT_CDU_LINE3", function()
	return plt_cdu_lines[3]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 3")
CH_47F:defineString("PLT_CDU_LINE4", function()
	return plt_cdu_lines[4]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 4")
CH_47F:defineString("PLT_CDU_LINE5", function()
	return plt_cdu_lines[5]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 5")
CH_47F:defineString("PLT_CDU_LINE6", function()
	return plt_cdu_lines[6]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 6")
CH_47F:defineString("PLT_CDU_LINE7", function()
	return plt_cdu_lines[7]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 7")
CH_47F:defineString("PLT_CDU_LINE8", function()
	return plt_cdu_lines[8]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 8")
CH_47F:defineString("PLT_CDU_LINE9", function()
	return plt_cdu_lines[9]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 9")
CH_47F:defineString("PLT_CDU_LINE10", function()
	return plt_cdu_lines[10]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 10")
CH_47F:defineString("PLT_CDU_LINE11", function()
	return plt_cdu_lines[11]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 11")
CH_47F:defineString("PLT_CDU_LINE12", function()
	return plt_cdu_lines[12]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 12")
CH_47F:defineString("PLT_CDU_LINE13", function()
	return plt_cdu_lines[13]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 13")
CH_47F:defineString("PLT_CDU_LINE14", function()
	return plt_cdu_lines[14]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 14")
CH_47F:reserveStringValue(24)

-- Copilot CDU
local COPILOT_CDU = "CPLT CDU Buttons"

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

local COPILOT_CDU_DISPLAY = "CPLT CDU Display"

CH_47F:defineString("CPLT_CDU_LINE1", function()
	return cplt_cdu_lines[1]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 1")
CH_47F:defineString("CPLT_CDU_LINE2", function()
	return cplt_cdu_lines[2]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 2")
CH_47F:defineString("CPLT_CDU_LINE3", function()
	return cplt_cdu_lines[3]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 3")
CH_47F:defineString("CPLT_CDU_LINE4", function()
	return cplt_cdu_lines[4]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 4")
CH_47F:defineString("CPLT_CDU_LINE5", function()
	return cplt_cdu_lines[5]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 5")
CH_47F:defineString("CPLT_CDU_LINE6", function()
	return cplt_cdu_lines[6]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 6")
CH_47F:defineString("CPLT_CDU_LINE7", function()
	return cplt_cdu_lines[7]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 7")
CH_47F:defineString("CPLT_CDU_LINE8", function()
	return cplt_cdu_lines[8]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 8")
CH_47F:defineString("CPLT_CDU_LINE9", function()
	return cplt_cdu_lines[9]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 9")
CH_47F:defineString("CPLT_CDU_LINE10", function()
	return cplt_cdu_lines[10]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 10")
CH_47F:defineString("CPLT_CDU_LINE11", function()
	return cplt_cdu_lines[11]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 11")
CH_47F:defineString("CPLT_CDU_LINE12", function()
	return cplt_cdu_lines[12]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 12")
CH_47F:defineString("CPLT_CDU_LINE13", function()
	return cplt_cdu_lines[13]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 13")
CH_47F:defineString("CPLT_CDU_LINE14", function()
	return cplt_cdu_lines[14]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 14")
CH_47F:reserveStringValue(24)

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

-- Parking Brake
local PARKING_BRAKE = "Parking Brake"

CH_47F:definePushButton("PARKING_BRAKE", devices.CENTRAL_CONSOLE, 3100, 740, PARKING_BRAKE, "Parking Brake")
CH_47F:reserveIntValue(65535) -- reserved in case parking brake gets an axis control

-- Pilot Instrument Panel
local PILOT_INSTRUMENT_PANEL = "PLT Instrument Panel"

CH_47F:definePushButton("PLT_MASTER_CAUTION", devices.GRIPS, 3026, 1393, PILOT_INSTRUMENT_PANEL, "Master Caution Button")
CH_47F:defineFloat("PLT_MASTER_CAUTION_LIGHT", 1394, { 0, 1 }, PILOT_INSTRUMENT_PANEL, "Master Caution Lamp (Yellow)")
CH_47F:reserveIntValue(65535) -- cabin air pull inop

-- Copilot Instrument Panel
local COPILOT_INSTRUMENT_PANEL = "CPLT Instrument Panel"

CH_47F:definePushButton("CPLT_MASTER_CAUTION", devices.GRIPS, 3106, 1391, COPILOT_INSTRUMENT_PANEL, "Master Caution Button")
CH_47F:defineFloat("CPLT_MASTER_CAUTION_LIGHT", 1392, { 0, 1 }, COPILOT_INSTRUMENT_PANEL, "Master Caution Lamp (Yellow)")
CH_47F:reserveIntValue(65535) -- cabin air pull inop

-- Center Instrument Panel
local CENTER_INSTRUMENT_PANEL = "Center Instrument Panel"

CH_47F:definePushButton("BATT_LOW_TEST", devices.CANTED_CONSOLE, 3009, 724, CENTER_INSTRUMENT_PANEL, "Battery Low (Press to test)")
CH_47F:definePotentiometer("BATT_LOW_DIM", devices.CANTED_CONSOLE, 3010, 725, { 0, 1 }, CENTER_INSTRUMENT_PANEL, "Battery Low (Rotate to dim)")
CH_47F:defineFloat("BATT_LOW_LIGHT", 723, { 0, 1 }, CENTER_INSTRUMENT_PANEL, "Battery Low Lamp (Green)")

-- Pilot Inboard MFD
local PILOT_MFD_INNER = "PLT Inboard MFD"

CH_47F:definePushButton("PLT_MFD_IB_T1", devices.MFD_PILOT_INBOARD, 3001, 906, PILOT_MFD_INNER, "T1")
CH_47F:definePushButton("PLT_MFD_IB_T2", devices.MFD_PILOT_INBOARD, 3002, 907, PILOT_MFD_INNER, "T2")
CH_47F:definePushButton("PLT_MFD_IB_T3", devices.MFD_PILOT_INBOARD, 3003, 908, PILOT_MFD_INNER, "T3")
CH_47F:definePushButton("PLT_MFD_IB_T4", devices.MFD_PILOT_INBOARD, 3004, 909, PILOT_MFD_INNER, "T4")
CH_47F:definePushButton("PLT_MFD_IB_T5", devices.MFD_PILOT_INBOARD, 3005, 910, PILOT_MFD_INNER, "T5")
CH_47F:definePushButton("PLT_MFD_IB_T6", devices.MFD_PILOT_INBOARD, 3006, 911, PILOT_MFD_INNER, "T6")
CH_47F:definePushButton("PLT_MFD_IB_T7", devices.MFD_PILOT_INBOARD, 3007, 912, PILOT_MFD_INNER, "T7")
CH_47F:definePushButton("PLT_MFD_IB_R1", devices.MFD_PILOT_INBOARD, 3008, 913, PILOT_MFD_INNER, "R1")
CH_47F:definePushButton("PLT_MFD_IB_R2", devices.MFD_PILOT_INBOARD, 3009, 914, PILOT_MFD_INNER, "R2")
CH_47F:definePushButton("PLT_MFD_IB_R3", devices.MFD_PILOT_INBOARD, 3010, 915, PILOT_MFD_INNER, "R3")
CH_47F:definePushButton("PLT_MFD_IB_R4", devices.MFD_PILOT_INBOARD, 3011, 916, PILOT_MFD_INNER, "R4")
CH_47F:definePushButton("PLT_MFD_IB_R5", devices.MFD_PILOT_INBOARD, 3012, 917, PILOT_MFD_INNER, "R5")
CH_47F:definePushButton("PLT_MFD_IB_R6", devices.MFD_PILOT_INBOARD, 3013, 918, PILOT_MFD_INNER, "R6")
CH_47F:definePushButton("PLT_MFD_IB_R7", devices.MFD_PILOT_INBOARD, 3014, 919, PILOT_MFD_INNER, "R7")
CH_47F:definePushButton("PLT_MFD_IB_R8", devices.MFD_PILOT_INBOARD, 3015, 920, PILOT_MFD_INNER, "R8")
CH_47F:definePushButton("PLT_MFD_IB_R9", devices.MFD_PILOT_INBOARD, 3016, 921, PILOT_MFD_INNER, "R9")
CH_47F:definePushButton("PLT_MFD_IB_B1", devices.MFD_PILOT_INBOARD, 3017, 922, PILOT_MFD_INNER, "B1")
CH_47F:definePushButton("PLT_MFD_IB_B2", devices.MFD_PILOT_INBOARD, 3018, 923, PILOT_MFD_INNER, "B2")
CH_47F:definePushButton("PLT_MFD_IB_B3", devices.MFD_PILOT_INBOARD, 3019, 924, PILOT_MFD_INNER, "B3")
CH_47F:definePushButton("PLT_MFD_IB_B4", devices.MFD_PILOT_INBOARD, 3020, 925, PILOT_MFD_INNER, "B4")
CH_47F:definePushButton("PLT_MFD_IB_B5", devices.MFD_PILOT_INBOARD, 3021, 926, PILOT_MFD_INNER, "B5")
CH_47F:definePushButton("PLT_MFD_IB_B6", devices.MFD_PILOT_INBOARD, 3022, 927, PILOT_MFD_INNER, "B6")
CH_47F:definePushButton("PLT_MFD_IB_B7", devices.MFD_PILOT_INBOARD, 3023, 928, PILOT_MFD_INNER, "B7")
CH_47F:definePushButton("PLT_MFD_IB_L1", devices.MFD_PILOT_INBOARD, 3024, 929, PILOT_MFD_INNER, "L1")
CH_47F:definePushButton("PLT_MFD_IB_L2", devices.MFD_PILOT_INBOARD, 3025, 930, PILOT_MFD_INNER, "L2")
CH_47F:definePushButton("PLT_MFD_IB_L3", devices.MFD_PILOT_INBOARD, 3026, 931, PILOT_MFD_INNER, "L3")
CH_47F:definePushButton("PLT_MFD_IB_L4", devices.MFD_PILOT_INBOARD, 3027, 932, PILOT_MFD_INNER, "L4")
CH_47F:definePushButton("PLT_MFD_IB_L5", devices.MFD_PILOT_INBOARD, 3028, 933, PILOT_MFD_INNER, "L5")
CH_47F:definePushButton("PLT_MFD_IB_L6", devices.MFD_PILOT_INBOARD, 3029, 934, PILOT_MFD_INNER, "L6")
CH_47F:definePushButton("PLT_MFD_IB_L7", devices.MFD_PILOT_INBOARD, 3030, 935, PILOT_MFD_INNER, "L7")
CH_47F:definePushButton("PLT_MFD_IB_L8", devices.MFD_PILOT_INBOARD, 3031, 936, PILOT_MFD_INNER, "L8")
CH_47F:definePushButton("PLT_MFD_IB_L9", devices.MFD_PILOT_INBOARD, 3032, 937, PILOT_MFD_INNER, "L9")

CH_47F:defineMultipositionSwitch("PLT_MFD_IB_PWR", devices.MFD_PILOT_INBOARD, 3033, 902, 3, 0.5, PILOT_MFD_INNER, "Power Switch (OFF/NVG/NORM)")

CH_47F:defineRockerSwitch("PLT_MFD_IB_VID_BRT", devices.MFD_PILOT_INBOARD, 3034, 3036, 3035, 3036, 903, PILOT_MFD_INNER, "Video Brightness Rocker")
CH_47F:defineRockerSwitch("PLT_MFD_IB_VID_CON", devices.MFD_PILOT_INBOARD, 3037, 3039, 3038, 3039, 904, PILOT_MFD_INNER, "Video Contrast Rocker")
CH_47F:defineRockerSwitch("PLT_MFD_IB_BKLT_BRT", devices.MFD_PILOT_INBOARD, 3040, 3042, 3041, 3042, 905, PILOT_MFD_INNER, "Backlight Brightness Rocker")

-- Copilot Inboard MFD
local COPILOT_MFD_INNER = "CPLT Inboard MFD"

CH_47F:definePushButton("CPLT_MFD_IB_T1", devices.MFD_COPILOT_INBOARD, 3001, 834, COPILOT_MFD_INNER, "T1")
CH_47F:definePushButton("CPLT_MFD_IB_T2", devices.MFD_COPILOT_INBOARD, 3002, 835, COPILOT_MFD_INNER, "T2")
CH_47F:definePushButton("CPLT_MFD_IB_T3", devices.MFD_COPILOT_INBOARD, 3003, 836, COPILOT_MFD_INNER, "T3")
CH_47F:definePushButton("CPLT_MFD_IB_T4", devices.MFD_COPILOT_INBOARD, 3004, 837, COPILOT_MFD_INNER, "T4")
CH_47F:definePushButton("CPLT_MFD_IB_T5", devices.MFD_COPILOT_INBOARD, 3005, 838, COPILOT_MFD_INNER, "T5")
CH_47F:definePushButton("CPLT_MFD_IB_T6", devices.MFD_COPILOT_INBOARD, 3006, 839, COPILOT_MFD_INNER, "T6")
CH_47F:definePushButton("CPLT_MFD_IB_T7", devices.MFD_COPILOT_INBOARD, 3007, 840, COPILOT_MFD_INNER, "T7")
CH_47F:definePushButton("CPLT_MFD_IB_R1", devices.MFD_COPILOT_INBOARD, 3008, 841, COPILOT_MFD_INNER, "R1")
CH_47F:definePushButton("CPLT_MFD_IB_R2", devices.MFD_COPILOT_INBOARD, 3009, 842, COPILOT_MFD_INNER, "R2")
CH_47F:definePushButton("CPLT_MFD_IB_R3", devices.MFD_COPILOT_INBOARD, 3010, 843, COPILOT_MFD_INNER, "R3")
CH_47F:definePushButton("CPLT_MFD_IB_R4", devices.MFD_COPILOT_INBOARD, 3011, 844, COPILOT_MFD_INNER, "R4")
CH_47F:definePushButton("CPLT_MFD_IB_R5", devices.MFD_COPILOT_INBOARD, 3012, 845, COPILOT_MFD_INNER, "R5")
CH_47F:definePushButton("CPLT_MFD_IB_R6", devices.MFD_COPILOT_INBOARD, 3013, 846, COPILOT_MFD_INNER, "R6")
CH_47F:definePushButton("CPLT_MFD_IB_R7", devices.MFD_COPILOT_INBOARD, 3014, 847, COPILOT_MFD_INNER, "R7")
CH_47F:definePushButton("CPLT_MFD_IB_R8", devices.MFD_COPILOT_INBOARD, 3015, 848, COPILOT_MFD_INNER, "R8")
CH_47F:definePushButton("CPLT_MFD_IB_R9", devices.MFD_COPILOT_INBOARD, 3016, 849, COPILOT_MFD_INNER, "R9")
CH_47F:definePushButton("CPLT_MFD_IB_B1", devices.MFD_COPILOT_INBOARD, 3017, 850, COPILOT_MFD_INNER, "B1")
CH_47F:definePushButton("CPLT_MFD_IB_B2", devices.MFD_COPILOT_INBOARD, 3018, 851, COPILOT_MFD_INNER, "B2")
CH_47F:definePushButton("CPLT_MFD_IB_B3", devices.MFD_COPILOT_INBOARD, 3019, 852, COPILOT_MFD_INNER, "B3")
CH_47F:definePushButton("CPLT_MFD_IB_B4", devices.MFD_COPILOT_INBOARD, 3020, 853, COPILOT_MFD_INNER, "B4")
CH_47F:definePushButton("CPLT_MFD_IB_B5", devices.MFD_COPILOT_INBOARD, 3021, 854, COPILOT_MFD_INNER, "B5")
CH_47F:definePushButton("CPLT_MFD_IB_B6", devices.MFD_COPILOT_INBOARD, 3022, 855, COPILOT_MFD_INNER, "B6")
CH_47F:definePushButton("CPLT_MFD_IB_B7", devices.MFD_COPILOT_INBOARD, 3023, 856, COPILOT_MFD_INNER, "B7")
CH_47F:definePushButton("CPLT_MFD_IB_L1", devices.MFD_COPILOT_INBOARD, 3024, 857, COPILOT_MFD_INNER, "L1")
CH_47F:definePushButton("CPLT_MFD_IB_L2", devices.MFD_COPILOT_INBOARD, 3025, 858, COPILOT_MFD_INNER, "L2")
CH_47F:definePushButton("CPLT_MFD_IB_L3", devices.MFD_COPILOT_INBOARD, 3026, 859, COPILOT_MFD_INNER, "L3")
CH_47F:definePushButton("CPLT_MFD_IB_L4", devices.MFD_COPILOT_INBOARD, 3027, 860, COPILOT_MFD_INNER, "L4")
CH_47F:definePushButton("CPLT_MFD_IB_L5", devices.MFD_COPILOT_INBOARD, 3028, 861, COPILOT_MFD_INNER, "L5")
CH_47F:definePushButton("CPLT_MFD_IB_L6", devices.MFD_COPILOT_INBOARD, 3029, 862, COPILOT_MFD_INNER, "L6")
CH_47F:definePushButton("CPLT_MFD_IB_L7", devices.MFD_COPILOT_INBOARD, 3030, 863, COPILOT_MFD_INNER, "L7")
CH_47F:definePushButton("CPLT_MFD_IB_L8", devices.MFD_COPILOT_INBOARD, 3031, 864, COPILOT_MFD_INNER, "L8")
CH_47F:definePushButton("CPLT_MFD_IB_L9", devices.MFD_COPILOT_INBOARD, 3032, 865, COPILOT_MFD_INNER, "L9")

CH_47F:defineMultipositionSwitch("CPLT_MFD_IB_PWR", devices.MFD_COPILOT_INBOARD, 3033, 830, 3, 0.5, COPILOT_MFD_INNER, "Power Switch (OFF/NVG/NORM)")

CH_47F:defineRockerSwitch("CPLT_MFD_IB_VID_BRT", devices.MFD_COPILOT_INBOARD, 3034, 3036, 3035, 3036, 831, COPILOT_MFD_INNER, "Video Brightness Rocker")
CH_47F:defineRockerSwitch("CPLT_MFD_IB_VID_CON", devices.MFD_COPILOT_INBOARD, 3037, 3039, 3038, 3039, 832, COPILOT_MFD_INNER, "Video Contrast Rocker")
CH_47F:defineRockerSwitch("CPLT_MFD_IB_BKLT_BRT", devices.MFD_COPILOT_INBOARD, 3040, 3042, 3041, 3042, 833, COPILOT_MFD_INNER, "Backlight Brightness Rocker")

-- Pilot Outboard MFD
local PILOT_MFD_OUTER = "PLT Outboard MFD"

CH_47F:definePushButton("PLT_MFD_OB_T1", devices.MFD_PILOT_OUTBOARD, 3001, 942, PILOT_MFD_OUTER, "T1")
CH_47F:definePushButton("PLT_MFD_OB_T2", devices.MFD_PILOT_OUTBOARD, 3002, 943, PILOT_MFD_OUTER, "T2")
CH_47F:definePushButton("PLT_MFD_OB_T3", devices.MFD_PILOT_OUTBOARD, 3003, 944, PILOT_MFD_OUTER, "T3")
CH_47F:definePushButton("PLT_MFD_OB_T4", devices.MFD_PILOT_OUTBOARD, 3004, 945, PILOT_MFD_OUTER, "T4")
CH_47F:definePushButton("PLT_MFD_OB_T5", devices.MFD_PILOT_OUTBOARD, 3005, 946, PILOT_MFD_OUTER, "T5")
CH_47F:definePushButton("PLT_MFD_OB_T6", devices.MFD_PILOT_OUTBOARD, 3006, 947, PILOT_MFD_OUTER, "T6")
CH_47F:definePushButton("PLT_MFD_OB_T7", devices.MFD_PILOT_OUTBOARD, 3007, 948, PILOT_MFD_OUTER, "T7")
CH_47F:definePushButton("PLT_MFD_OB_R1", devices.MFD_PILOT_OUTBOARD, 3008, 949, PILOT_MFD_OUTER, "R1")
CH_47F:definePushButton("PLT_MFD_OB_R2", devices.MFD_PILOT_OUTBOARD, 3009, 950, PILOT_MFD_OUTER, "R2")
CH_47F:definePushButton("PLT_MFD_OB_R3", devices.MFD_PILOT_OUTBOARD, 3010, 951, PILOT_MFD_OUTER, "R3")
CH_47F:definePushButton("PLT_MFD_OB_R4", devices.MFD_PILOT_OUTBOARD, 3011, 952, PILOT_MFD_OUTER, "R4")
CH_47F:definePushButton("PLT_MFD_OB_R5", devices.MFD_PILOT_OUTBOARD, 3012, 953, PILOT_MFD_OUTER, "R5")
CH_47F:definePushButton("PLT_MFD_OB_R6", devices.MFD_PILOT_OUTBOARD, 3013, 954, PILOT_MFD_OUTER, "R6")
CH_47F:definePushButton("PLT_MFD_OB_R7", devices.MFD_PILOT_OUTBOARD, 3014, 955, PILOT_MFD_OUTER, "R7")
CH_47F:definePushButton("PLT_MFD_OB_R8", devices.MFD_PILOT_OUTBOARD, 3015, 956, PILOT_MFD_OUTER, "R8")
CH_47F:definePushButton("PLT_MFD_OB_R9", devices.MFD_PILOT_OUTBOARD, 3016, 957, PILOT_MFD_OUTER, "R9")
CH_47F:definePushButton("PLT_MFD_OB_B1", devices.MFD_PILOT_OUTBOARD, 3017, 958, PILOT_MFD_OUTER, "B1")
CH_47F:definePushButton("PLT_MFD_OB_B2", devices.MFD_PILOT_OUTBOARD, 3018, 959, PILOT_MFD_OUTER, "B2")
CH_47F:definePushButton("PLT_MFD_OB_B3", devices.MFD_PILOT_OUTBOARD, 3019, 960, PILOT_MFD_OUTER, "B3")
CH_47F:definePushButton("PLT_MFD_OB_B4", devices.MFD_PILOT_OUTBOARD, 3020, 961, PILOT_MFD_OUTER, "B4")
CH_47F:definePushButton("PLT_MFD_OB_B5", devices.MFD_PILOT_OUTBOARD, 3021, 962, PILOT_MFD_OUTER, "B5")
CH_47F:definePushButton("PLT_MFD_OB_B6", devices.MFD_PILOT_OUTBOARD, 3022, 963, PILOT_MFD_OUTER, "B6")
CH_47F:definePushButton("PLT_MFD_OB_B7", devices.MFD_PILOT_OUTBOARD, 3023, 964, PILOT_MFD_OUTER, "B7")
CH_47F:definePushButton("PLT_MFD_OB_L1", devices.MFD_PILOT_OUTBOARD, 3024, 965, PILOT_MFD_OUTER, "L1")
CH_47F:definePushButton("PLT_MFD_OB_L2", devices.MFD_PILOT_OUTBOARD, 3025, 966, PILOT_MFD_OUTER, "L2")
CH_47F:definePushButton("PLT_MFD_OB_L3", devices.MFD_PILOT_OUTBOARD, 3026, 967, PILOT_MFD_OUTER, "L3")
CH_47F:definePushButton("PLT_MFD_OB_L4", devices.MFD_PILOT_OUTBOARD, 3027, 968, PILOT_MFD_OUTER, "L4")
CH_47F:definePushButton("PLT_MFD_OB_L5", devices.MFD_PILOT_OUTBOARD, 3028, 969, PILOT_MFD_OUTER, "L5")
CH_47F:definePushButton("PLT_MFD_OB_L6", devices.MFD_PILOT_OUTBOARD, 3029, 970, PILOT_MFD_OUTER, "L6")
CH_47F:definePushButton("PLT_MFD_OB_L7", devices.MFD_PILOT_OUTBOARD, 3030, 971, PILOT_MFD_OUTER, "L7")
CH_47F:definePushButton("PLT_MFD_OB_L8", devices.MFD_PILOT_OUTBOARD, 3031, 972, PILOT_MFD_OUTER, "L8")
CH_47F:definePushButton("PLT_MFD_OB_L9", devices.MFD_PILOT_OUTBOARD, 3032, 973, PILOT_MFD_OUTER, "L9")

CH_47F:defineMultipositionSwitch("PLT_MFD_OB_PWR", devices.MFD_PILOT_OUTBOARD, 3033, 938, 3, 0.5, PILOT_MFD_OUTER, "Power Switch (OFF/NVG/NORM)")

CH_47F:defineRockerSwitch("PLT_MFD_OB_VID_BRT", devices.MFD_PILOT_OUTBOARD, 3034, 3036, 3035, 3036, 939, PILOT_MFD_OUTER, "Video Brightness Rocker")
CH_47F:defineRockerSwitch("PLT_MFD_OB_VID_CON", devices.MFD_PILOT_OUTBOARD, 3037, 3039, 3038, 3039, 940, PILOT_MFD_OUTER, "Video Contrast Rocker")
CH_47F:defineRockerSwitch("PLT_MFD_OB_BKLT_BRT", devices.MFD_PILOT_OUTBOARD, 3040, 3042, 3041, 3042, 941, PILOT_MFD_OUTER, "Backlight Brightness Rocker")

-- Copilot Outboard MFD
local COPILOT_MFD_OUTER = "CPLT Outboard MFD"

CH_47F:definePushButton("CPLT_MFD_OB_T1", devices.MFD_COPILOT_OUTBOARD, 3001, 798, COPILOT_MFD_OUTER, "T1")
CH_47F:definePushButton("CPLT_MFD_OB_T2", devices.MFD_COPILOT_OUTBOARD, 3002, 799, COPILOT_MFD_OUTER, "T2")
CH_47F:definePushButton("CPLT_MFD_OB_T3", devices.MFD_COPILOT_OUTBOARD, 3003, 800, COPILOT_MFD_OUTER, "T3")
CH_47F:definePushButton("CPLT_MFD_OB_T4", devices.MFD_COPILOT_OUTBOARD, 3004, 801, COPILOT_MFD_OUTER, "T4")
CH_47F:definePushButton("CPLT_MFD_OB_T5", devices.MFD_COPILOT_OUTBOARD, 3005, 802, COPILOT_MFD_OUTER, "T5")
CH_47F:definePushButton("CPLT_MFD_OB_T6", devices.MFD_COPILOT_OUTBOARD, 3006, 803, COPILOT_MFD_OUTER, "T6")
CH_47F:definePushButton("CPLT_MFD_OB_T7", devices.MFD_COPILOT_OUTBOARD, 3007, 804, COPILOT_MFD_OUTER, "T7")
CH_47F:definePushButton("CPLT_MFD_OB_R1", devices.MFD_COPILOT_OUTBOARD, 3008, 805, COPILOT_MFD_OUTER, "R1")
CH_47F:definePushButton("CPLT_MFD_OB_R2", devices.MFD_COPILOT_OUTBOARD, 3009, 806, COPILOT_MFD_OUTER, "R2")
CH_47F:definePushButton("CPLT_MFD_OB_R3", devices.MFD_COPILOT_OUTBOARD, 3010, 807, COPILOT_MFD_OUTER, "R3")
CH_47F:definePushButton("CPLT_MFD_OB_R4", devices.MFD_COPILOT_OUTBOARD, 3011, 808, COPILOT_MFD_OUTER, "R4")
CH_47F:definePushButton("CPLT_MFD_OB_R5", devices.MFD_COPILOT_OUTBOARD, 3012, 809, COPILOT_MFD_OUTER, "R5")
CH_47F:definePushButton("CPLT_MFD_OB_R6", devices.MFD_COPILOT_OUTBOARD, 3013, 810, COPILOT_MFD_OUTER, "R6")
CH_47F:definePushButton("CPLT_MFD_OB_R7", devices.MFD_COPILOT_OUTBOARD, 3014, 811, COPILOT_MFD_OUTER, "R7")
CH_47F:definePushButton("CPLT_MFD_OB_R8", devices.MFD_COPILOT_OUTBOARD, 3015, 812, COPILOT_MFD_OUTER, "R8")
CH_47F:definePushButton("CPLT_MFD_OB_R9", devices.MFD_COPILOT_OUTBOARD, 3016, 813, COPILOT_MFD_OUTER, "R9")
CH_47F:definePushButton("CPLT_MFD_OB_B1", devices.MFD_COPILOT_OUTBOARD, 3017, 814, COPILOT_MFD_OUTER, "B1")
CH_47F:definePushButton("CPLT_MFD_OB_B2", devices.MFD_COPILOT_OUTBOARD, 3018, 815, COPILOT_MFD_OUTER, "B2")
CH_47F:definePushButton("CPLT_MFD_OB_B3", devices.MFD_COPILOT_OUTBOARD, 3019, 816, COPILOT_MFD_OUTER, "B3")
CH_47F:definePushButton("CPLT_MFD_OB_B4", devices.MFD_COPILOT_OUTBOARD, 3020, 817, COPILOT_MFD_OUTER, "B4")
CH_47F:definePushButton("CPLT_MFD_OB_B5", devices.MFD_COPILOT_OUTBOARD, 3021, 818, COPILOT_MFD_OUTER, "B5")
CH_47F:definePushButton("CPLT_MFD_OB_B6", devices.MFD_COPILOT_OUTBOARD, 3022, 819, COPILOT_MFD_OUTER, "B6")
CH_47F:definePushButton("CPLT_MFD_OB_B7", devices.MFD_COPILOT_OUTBOARD, 3023, 820, COPILOT_MFD_OUTER, "B7")
CH_47F:definePushButton("CPLT_MFD_OB_L1", devices.MFD_COPILOT_OUTBOARD, 3024, 821, COPILOT_MFD_OUTER, "L1")
CH_47F:definePushButton("CPLT_MFD_OB_L2", devices.MFD_COPILOT_OUTBOARD, 3025, 822, COPILOT_MFD_OUTER, "L2")
CH_47F:definePushButton("CPLT_MFD_OB_L3", devices.MFD_COPILOT_OUTBOARD, 3026, 823, COPILOT_MFD_OUTER, "L3")
CH_47F:definePushButton("CPLT_MFD_OB_L4", devices.MFD_COPILOT_OUTBOARD, 3027, 824, COPILOT_MFD_OUTER, "L4")
CH_47F:definePushButton("CPLT_MFD_OB_L5", devices.MFD_COPILOT_OUTBOARD, 3028, 825, COPILOT_MFD_OUTER, "L5")
CH_47F:definePushButton("CPLT_MFD_OB_L6", devices.MFD_COPILOT_OUTBOARD, 3029, 826, COPILOT_MFD_OUTER, "L6")
CH_47F:definePushButton("CPLT_MFD_OB_L7", devices.MFD_COPILOT_OUTBOARD, 3030, 827, COPILOT_MFD_OUTER, "L7")
CH_47F:definePushButton("CPLT_MFD_OB_L8", devices.MFD_COPILOT_OUTBOARD, 3031, 828, COPILOT_MFD_OUTER, "L8")
CH_47F:definePushButton("CPLT_MFD_OB_L9", devices.MFD_COPILOT_OUTBOARD, 3032, 829, COPILOT_MFD_OUTER, "L9")

CH_47F:defineMultipositionSwitch("CPLT_MFD_OB_PWR", devices.MFD_COPILOT_OUTBOARD, 3033, 794, 3, 0.5, COPILOT_MFD_OUTER, "Power Switch (OFF/NVG/NORM)")

CH_47F:defineRockerSwitch("CPLT_MFD_OB_VID_BRT", devices.MFD_COPILOT_OUTBOARD, 3034, 3036, 3035, 3036, 795, COPILOT_MFD_OUTER, "Video Brightness Rocker")
CH_47F:defineRockerSwitch("CPLT_MFD_OB_VID_CON", devices.MFD_COPILOT_OUTBOARD, 3037, 3039, 3038, 3039, 796, COPILOT_MFD_OUTER, "Video Contrast Rocker")
CH_47F:defineRockerSwitch("CPLT_MFD_OB_BKLT_BRT", devices.MFD_COPILOT_OUTBOARD, 3040, 3042, 3041, 3042, 797, COPILOT_MFD_OUTER, "Backlight Brightness Rocker")

-- Center MFD
local CENTER_MFD = "Center MFD"

CH_47F:definePushButton("MFD_CENTER_T1", devices.MFD_CENTER, 3001, 870, CENTER_MFD, "T1")
CH_47F:definePushButton("MFD_CENTER_T2", devices.MFD_CENTER, 3002, 871, CENTER_MFD, "T2")
CH_47F:definePushButton("MFD_CENTER_T3", devices.MFD_CENTER, 3003, 872, CENTER_MFD, "T3")
CH_47F:definePushButton("MFD_CENTER_T4", devices.MFD_CENTER, 3004, 873, CENTER_MFD, "T4")
CH_47F:definePushButton("MFD_CENTER_T5", devices.MFD_CENTER, 3005, 874, CENTER_MFD, "T5")
CH_47F:definePushButton("MFD_CENTER_T6", devices.MFD_CENTER, 3006, 875, CENTER_MFD, "T6")
CH_47F:definePushButton("MFD_CENTER_T7", devices.MFD_CENTER, 3007, 876, CENTER_MFD, "T7")
CH_47F:definePushButton("MFD_CENTER_R1", devices.MFD_CENTER, 3008, 877, CENTER_MFD, "R1")
CH_47F:definePushButton("MFD_CENTER_R2", devices.MFD_CENTER, 3009, 878, CENTER_MFD, "R2")
CH_47F:definePushButton("MFD_CENTER_R3", devices.MFD_CENTER, 3010, 879, CENTER_MFD, "R3")
CH_47F:definePushButton("MFD_CENTER_R4", devices.MFD_CENTER, 3011, 880, CENTER_MFD, "R4")
CH_47F:definePushButton("MFD_CENTER_R5", devices.MFD_CENTER, 3012, 881, CENTER_MFD, "R5")
CH_47F:definePushButton("MFD_CENTER_R6", devices.MFD_CENTER, 3013, 882, CENTER_MFD, "R6")
CH_47F:definePushButton("MFD_CENTER_R7", devices.MFD_CENTER, 3014, 883, CENTER_MFD, "R7")
CH_47F:definePushButton("MFD_CENTER_R8", devices.MFD_CENTER, 3015, 884, CENTER_MFD, "R8")
CH_47F:definePushButton("MFD_CENTER_R9", devices.MFD_CENTER, 3016, 885, CENTER_MFD, "R9")
CH_47F:definePushButton("MFD_CENTER_B1", devices.MFD_CENTER, 3017, 886, CENTER_MFD, "B1")
CH_47F:definePushButton("MFD_CENTER_B2", devices.MFD_CENTER, 3018, 887, CENTER_MFD, "B2")
CH_47F:definePushButton("MFD_CENTER_B3", devices.MFD_CENTER, 3019, 888, CENTER_MFD, "B3")
CH_47F:definePushButton("MFD_CENTER_B4", devices.MFD_CENTER, 3020, 889, CENTER_MFD, "B4")
CH_47F:definePushButton("MFD_CENTER_B5", devices.MFD_CENTER, 3021, 890, CENTER_MFD, "B5")
CH_47F:definePushButton("MFD_CENTER_B6", devices.MFD_CENTER, 3022, 891, CENTER_MFD, "B6")
CH_47F:definePushButton("MFD_CENTER_B7", devices.MFD_CENTER, 3023, 892, CENTER_MFD, "B7")
CH_47F:definePushButton("MFD_CENTER_L1", devices.MFD_CENTER, 3024, 893, CENTER_MFD, "L1")
CH_47F:definePushButton("MFD_CENTER_L2", devices.MFD_CENTER, 3025, 894, CENTER_MFD, "L2")
CH_47F:definePushButton("MFD_CENTER_L3", devices.MFD_CENTER, 3026, 895, CENTER_MFD, "L3")
CH_47F:definePushButton("MFD_CENTER_L4", devices.MFD_CENTER, 3027, 896, CENTER_MFD, "L4")
CH_47F:definePushButton("MFD_CENTER_L5", devices.MFD_CENTER, 3028, 897, CENTER_MFD, "L5")
CH_47F:definePushButton("MFD_CENTER_L6", devices.MFD_CENTER, 3029, 898, CENTER_MFD, "L6")
CH_47F:definePushButton("MFD_CENTER_L7", devices.MFD_CENTER, 3030, 899, CENTER_MFD, "L7")
CH_47F:definePushButton("MFD_CENTER_L8", devices.MFD_CENTER, 3031, 900, CENTER_MFD, "L8")
CH_47F:definePushButton("MFD_CENTER_L9", devices.MFD_CENTER, 3032, 901, CENTER_MFD, "L9")

CH_47F:defineMultipositionSwitch("MFD_CENTER_PWR", devices.MFD_CENTER, 3033, 866, 3, 0.5, CENTER_MFD, "Power Switch (OFF/NVG/NORM)")

CH_47F:defineRockerSwitch("MFD_CENTER_VID_BRT", devices.MFD_CENTER, 3034, 3036, 3035, 3036, 867, CENTER_MFD, "Video Brightness Rocker")
CH_47F:defineRockerSwitch("MFD_CENTER_VID_CON", devices.MFD_CENTER, 3037, 3039, 3038, 3039, 868, CENTER_MFD, "Video Contrast Rocker")
CH_47F:defineRockerSwitch("MFD_CENTER_BKLT_BRT", devices.MFD_CENTER, 3040, 3042, 3041, 3042, 869, CENTER_MFD, "Backlight Brightness Rocker")

-- Fire handles
local FIRE_PANEL = "Fire Handle Panel"

CH_47F:defineSingleCommandRocker("FIRE_HANDLE_ENG1_PULL", devices.CANTED_CONSOLE, 3001, 731, FIRE_PANEL, "Engine 1 Fire Handle (Pull)")
CH_47F:definePotentiometer("FIRE_HANDLE_ENG1_TWIST", devices.CANTED_CONSOLE, 3002, 732, { 0, 1 }, FIRE_PANEL, "Engine 1 Fire Handle (Twist)")
CH_47F:defineSingleCommandRocker("FIRE_HANDLE_ENG2_PULL", devices.CANTED_CONSOLE, 3005, 735, FIRE_PANEL, "Engine 2 Fire Handle (Pull)")
CH_47F:definePotentiometer("FIRE_HANDLE_ENG2_TWIST", devices.CANTED_CONSOLE, 3006, 736, { 0, 1 }, FIRE_PANEL, "Engine 2 Fire Handle (Twist)")

CH_47F:defineFloat("FIRE_HANDLE_ENG1_LIGHT", 737, { 0, 1 }, FIRE_PANEL, "Engine 1 Fire Handle Lamp (Red)")
CH_47F:defineFloat("FIRE_HANDLE_ENG2_LIGHT", 738, { 0, 1 }, FIRE_PANEL, "Engine 2 Fire Handle Lamp (Red)")

-- Pilot Standby Flight Display
-- local PILOT_STANDBY_FLIGHT_DISPLAY = "PLT Standby Flight Display"

CH_47F:reserveIntValue(1) -- push button
CH_47F:reserveIntValue(65535) -- knob

-- Copilot Standby Flight Display
-- local COPILOT_STANDBY_FLIGHT_DISPLAY = "CPLT Standby Flight Display"

CH_47F:reserveIntValue(1) -- push button
CH_47F:reserveIntValue(65535) -- knob

-- Pilot Inclinometer
local PILOT_INCLINOMETER = "PLT Inclinometer"

CH_47F:defineFloat("PLT_INCLINOMETER", 1218, { -1, 1 }, PILOT_INCLINOMETER, "Inclinometer")

-- Copilot Inclinometer
local COPILOT_INCLINOMETER = "CPLT Inclinometer"

CH_47F:defineFloat("CPLT_INCLINOMETER", 1217, { -1, 1 }, COPILOT_INCLINOMETER, "Inclinometer")

-- Radar Altimeter
local RADAR_ALTIMETER = "Radar Altimeter"

CH_47F:definePotentiometer("RAD_ALT_DIMMER", devices.CANTED_CONSOLE, 3016, 739, { 0, 1 }, RADAR_ALTIMETER, "Dimmer Knob")
CH_47F:defineRotary("RAD_ALT_SET_LO", devices.APN_209, 3002, 1193, RADAR_ALTIMETER, "Low Altitude Setting Knob")
CH_47F:defineRotary("RAD_ALT_SET_HI", devices.APN_209, 3003, 1194, RADAR_ALTIMETER, "High Altitude Setting Knob (Rotate to set)")
CH_47F:definePushButton("RAD_ALT_SET_HI_TEST", devices.APN_209, 3001, 1195, RADAR_ALTIMETER, "High Altitude Setting Knob (Push to test)")

CH_47F:defineFloat("RAD_ALT_NEEDLE", 1191, { 0, 1 }, RADAR_ALTIMETER, "Altitude Needle")
CH_47F:defineFloat("RAD_ALT_BUG_LO", 1196, { 0, 1 }, RADAR_ALTIMETER, "Low Altitude Bug")
CH_47F:defineFloat("RAD_ALT_BUG_HI", 1197, { 0, 1 }, RADAR_ALTIMETER, "High Altitude Bug")
CH_47F:defineFloat("RAD_ALT_FLAG_OFF", 1198, { 0, 1 }, RADAR_ALTIMETER, "OFF Flag")

local function get_display_char(dev0, arg_number)
	local v = dev0:get_argument_value(arg_number)
	if v < 0 or v >= 1 then
		return " "
	else
		return tostring(math.floor(v / 0.09999)) -- for 9 we actually get a value just *below* 0.9 - probably a floating point error in dcs
	end
end

CH_47F:defineString("RAD_ALT_DISPLAY", function(dev0)
	local thousands = get_display_char(dev0, 1200)
	local hundreds = get_display_char(dev0, 1201)
	local tens = get_display_char(dev0, 1202)
	local ones = get_display_char(dev0, 1203)
	return thousands .. hundreds .. tens .. ones
end, 4, RADAR_ALTIMETER, "Display")

CH_47F:defineIndicatorLight("RAD_ALT_LO_LIGHT", 1199, RADAR_ALTIMETER, "LO Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAD_ALT_HI_LIGHT", 1192, RADAR_ALTIMETER, "HI Lamp (Yellow)")
CH_47F:defineFloat("RAD_ALT_BRIGHTNESS", 1204, { 0, 1 }, RADAR_ALTIMETER, "Display Brightness")

-- Longitudinal Stick Position Indicator
local LONG_STICK_INDICATOR = "Longitudinal Stick Position Indicator"

CH_47F:defineFloat("LONG_STICK_INDICATOR", 1460, { 0, 1 }, LONG_STICK_INDICATOR, "Longitudinal Stick Position Indicator")

-- Chronometer
local CHRONOMETER = "Chronometer"

CH_47F:definePushButton("CHRONOMETER_SELECT", devices.TERTIARY_REFLECTS, 3001, 1209, CHRONOMETER, "SELECT Button")
CH_47F:definePushButton("CHRONOMETER_CONTROL", devices.TERTIARY_REFLECTS, 3002, 1210, CHRONOMETER, "CONTROL Button")
CH_47F:definePotentiometer("CHRONOMETER_DIM", devices.TERTIARY_REFLECTS, 3003, 1208, { 0, 1 }, CHRONOMETER, "DIM Knob")

-- todo (https://github.com/DCS-Skunkworks/dcs-bios/issues/1139): Add chronometer display
-- indicator 23
CH_47F:reserveIntValue(1) -- TAG_0 -> GMT tick
CH_47F:reserveIntValue(1) -- TAG_1 -> LT tick
CH_47F:reserveIntValue(1) -- TAG_3 -> ET tick
-- DIGIT_6 - 11 -> top value
CH_47F:reserveStringValue(6)
-- DIGIT_0 -  3 -> bottom value
CH_47F:reserveIntValue(4)

-- AN/APR-39
local RWR = "AN/APR-39"

CH_47F:defineToggleSwitch("RWR_DAY_NIGHT", devices.CANTED_CONSOLE, 3071, 1331, RWR, "Day/Night Switch")
CH_47F:definePotentiometer("RWR_DIM", devices.CANTED_CONSOLE, 3073, 1332, { 0, 1 }, RWR, "Dimmer Knob")

-- Magnetic Compass
local COMPASS = "Magnetic Compass"

CH_47F:definePotentiometer("COMPASS_BRIGHTNESS", devices.TERTIARY_REFLECTS, 3006, 1216, { 0, 1 }, COMPASS, "Brightness Knob")
CH_47F:defineFloat("COMPASS_LIGHT", 1215, { 0, 1 }, COMPASS, "Compass Light (Green)")
CH_47F:defineFloat("COMPASS_YAW", 1214, { 0, 1 }, COMPASS, "Compass Rotation")
CH_47F:defineFloat("COMPASS_PITCH", 1213, { -1, 1 }, COMPASS, "Compass Pitch")
CH_47F:defineFloat("COMPASS_ROLL", 1212, { -1, 1 }, COMPASS, "Compass Roll")

-- Overhead Switch Panel
-- EAPS Control Panel
local EAPS_PANEL = "EAPS Control Panel"

CH_47F:defineToggleSwitch("EAPS_ENG1_FAN", devices.OVERHEAD_CONSOLE, 3040, 501, EAPS_PANEL, "Engine 1 Fan (OFF/ON)")
CH_47F:defineToggleSwitch("EAPS_ENG1_DOORS", devices.OVERHEAD_CONSOLE, 3042, 502, EAPS_PANEL, "Engine 1 Doors (CLOSE/OPEN)")
CH_47F:defineToggleSwitch("EAPS_ENG2_FAN", devices.OVERHEAD_CONSOLE, 3044, 503, EAPS_PANEL, "Engine 2 Fan (OFF/ON)")
CH_47F:defineToggleSwitch("EAPS_ENG2_DOORS", devices.OVERHEAD_CONSOLE, 3046, 504, EAPS_PANEL, "Engine 2 Doors (CLOSE/OPEN)")

-- Exterior Light Panel
local EXTERIOR_LIGHT_PANEL = "Exterior Lighting Panel"

CH_47F:defineMultipositionSwitch("EXT_LIGHT_ANTICOLLISION_MODE", devices.OVERHEAD_CONSOLE, 3067, 512, 7, 0.1, EXTERIOR_LIGHT_PANEL, "Anticollision Mode")
CH_47F:defineMultipositionSwitch("EXT_LIGHT_ANTICOLLISION_IR_PATTERN", devices.OVERHEAD_CONSOLE, 3070, 513, 5, 0.1, EXTERIOR_LIGHT_PANEL, "Anticollision IR Pattern")
CH_47F:definePotentiometer("EXT_LIGHT_ANTICOLLISION_IR_DIM", devices.OVERHEAD_CONSOLE, 3073, 514, { 0, 1 }, EXTERIOR_LIGHT_PANEL, "Anticollision IR Dimmer")
CH_47F:defineMultipositionSwitch("EXT_LIGHT_FORM_MODE", devices.OVERHEAD_CONSOLE, 3076, 515, 3, 0.1, EXTERIOR_LIGHT_PANEL, "Formation Lights Mode (NVG/OFF/NORM)")
CH_47F:defineToggleSwitch("EXT_LIGHT_FORM_PATTERN", devices.OVERHEAD_CONSOLE, 3079, 516, EXTERIOR_LIGHT_PANEL, "Formation Lights Pattern (FLASH/STDY)")
CH_47F:definePotentiometer("EXT_LIGHT_FORM_DIM", devices.OVERHEAD_CONSOLE, 3081, 517, { 0, 1 }, EXTERIOR_LIGHT_PANEL, "Formation Lights Dimmer")
CH_47F:defineMultipositionSwitch("EXT_LIGHT_POSITION_BRIGHTNESS", devices.OVERHEAD_CONSOLE, 3084, 518, 3, 0.1, EXTERIOR_LIGHT_PANEL, "Position Lights Brightness (DIM/OFF/BRT)")
CH_47F:defineToggleSwitch("EXT_LIGHT_POSITION_PATTERN", devices.OVERHEAD_CONSOLE, 3087, 519, EXTERIOR_LIGHT_PANEL, "Position Lights Pattern (FLASH/STDY)")

-- Interior Light Panel
local INTERIOR_LIGHT_PANEL = "Interior Lighting Panel"

CH_47F:defineToggleSwitch("INT_LIGHT_INST", devices.OVERHEAD_CONSOLE, 3054, 507, INTERIOR_LIGHT_PANEL, "Instrument Flood Light")
CH_47F:defineToggleSwitch("INT_LIGHT_OVHD", devices.OVERHEAD_CONSOLE, 3056, 508, INTERIOR_LIGHT_PANEL, "Overhead Flood Light")
CH_47F:defineMultipositionSwitch("INT_LIGHT_EMER_EXIT", devices.OVERHEAD_CONSOLE, 3058, 509, 3, 0.1, INTERIOR_LIGHT_PANEL, "Emergency Exit Light (DISARM/TEST/ARM)")
CH_47F:defineMultipositionSwitch("INT_LIGHT_DOME", devices.OVERHEAD_CONSOLE, 3061, 510, 3, 0.1, INTERIOR_LIGHT_PANEL, "Dome Light (WHT/OFF/NVG)")
CH_47F:definePotentiometer("INT_LIGHT_DIM", devices.OVERHEAD_CONSOLE, 3064, 511, { 0, 1 }, INTERIOR_LIGHT_PANEL, "Flood Light Dimmer")

-- Light Panel
local LIGHT_PANEL = "Lighting Panel"

CH_47F:definePotentiometer("LIGHT_CENTER_CONSOLE_DIM", devices.OVERHEAD_CONSOLE, 3048, 505, { 0, 1 }, LIGHT_PANEL, "Center Console Light Dimmer")
CH_47F:definePotentiometer("LIGHT_STICK_POSITION_DIM", devices.OVERHEAD_CONSOLE, 3051, 506, { 0, 1 }, LIGHT_PANEL, "Stick Position Light Dimmer")

-- Pilot Light Panel
local PILOT_LIGHT_PANEL = "PLT Lighting Panel"

CH_47F:defineToggleSwitch("PLT_LIGHT_SEARCHLIGHT", devices.OVERHEAD_CONSOLE, 3089, 520, PILOT_LIGHT_PANEL, "Searchlight (RET/ON)")
CH_47F:defineMultipositionSwitch("PLT_LIGHT_MODE", devices.OVERHEAD_CONSOLE, 3091, 521, 3, 0.1, PILOT_LIGHT_PANEL, "Mode Select (DAY/NIGHT/NVG)")
CH_47F:definePotentiometer("PLT_LIGHT_CENTER_DIM", devices.OVERHEAD_CONSOLE, 3094, 522, { 0, 1 }, PILOT_LIGHT_PANEL, "Center Light Dimmer")
CH_47F:definePotentiometer("PLT_LIGHT_INSTRUMENT_DIM", devices.OVERHEAD_CONSOLE, 3097, 523, { 0, 1 }, PILOT_LIGHT_PANEL, "Instrument Light Dimmer")

-- Copilot Light Panel
local COPILOT_LIGHT_PANEL = "CPLT Lighting Panel"

CH_47F:defineToggleSwitch("CPLT_LIGHT_SEARCHLIGHT", devices.OVERHEAD_CONSOLE, 3100, 524, COPILOT_LIGHT_PANEL, "Searchlight (RET/ON)")
CH_47F:definePotentiometer("CPLT_LIGHT_OVERHEAD_DIM", devices.OVERHEAD_CONSOLE, 3102, 525, { 0, 1 }, COPILOT_LIGHT_PANEL, "Overhead Light Dimmer")
CH_47F:definePotentiometer("CPLT_LIGHT_INSTRUMENT_DIM", devices.OVERHEAD_CONSOLE, 3105, 526, { 0, 1 }, COPILOT_LIGHT_PANEL, "Instrument Light Dimmer")

-- Fuel Control Panel
local FUEL_PANEL = "Fuel Control Panel"

CH_47F:defineToggleSwitch("FUEL_LH_AUX_FWD", devices.OVERHEAD_CONSOLE, 3001, 1, FUEL_PANEL, "Forward Left Aux Pump")
CH_47F:defineToggleSwitch("FUEL_LH_MAIN_FWD", devices.OVERHEAD_CONSOLE, 3003, 2, FUEL_PANEL, "Forward Left Main Pump")
CH_47F:defineToggleSwitch("FUEL_LH_MAIN_AFT", devices.OVERHEAD_CONSOLE, 3005, 3, FUEL_PANEL, "Aft Left Main Pump")
CH_47F:defineToggleSwitch("FUEL_LH_AUX_AFT", devices.OVERHEAD_CONSOLE, 3007, 4, FUEL_PANEL, "Aft Left Aux Pump")
CH_47F:defineToggleSwitch("FUEL_RH_AUX_FWD", devices.OVERHEAD_CONSOLE, 3009, 5, FUEL_PANEL, "Forward Right Aux Pump")
CH_47F:defineToggleSwitch("FUEL_RH_MAIN_FWD", devices.OVERHEAD_CONSOLE, 3011, 6, FUEL_PANEL, "Forward Right Main Pump")
CH_47F:defineToggleSwitch("FUEL_RH_MAIN_AFT", devices.OVERHEAD_CONSOLE, 3013, 7, FUEL_PANEL, "Aft Right Main Pump")
CH_47F:defineToggleSwitch("FUEL_RH_AUX_AFT", devices.OVERHEAD_CONSOLE, 3015, 8, FUEL_PANEL, "Aft Right Aux Pump")
CH_47F:defineToggleSwitch("FUEL_REFUEL_STATION", devices.OVERHEAD_CONSOLE, 3017, 9, FUEL_PANEL, "Refueling Station")
CH_47F:defineToggleSwitch("FUEL_CROSSFEED", devices.OVERHEAD_CONSOLE, 3019, 10, FUEL_PANEL, "Crossfeed")

-- Anti-Ice Panel
local ANTI_ICE_PANEL = "Anti-Ice Panel"

CH_47F:defineToggleSwitch("ANTI_ICE_WINDSHIELD_HEAT_CPLT", devices.OVERHEAD_CONSOLE, 3108, 527, ANTI_ICE_PANEL, "Copilot Windshield Heat")
CH_47F:defineToggleSwitch("ANTI_ICE_WINDSHIELD_HEAT_CENTER", devices.OVERHEAD_CONSOLE, 3110, 528, ANTI_ICE_PANEL, "Center Windshield Heat")
CH_47F:defineToggleSwitch("ANTI_ICE_WINDSHIELD_HEAT_PLT", devices.OVERHEAD_CONSOLE, 3112, 529, ANTI_ICE_PANEL, "Pilot Windshield Heat")
CH_47F:defineToggleSwitch("ANTI_ICE_PITOT_HEAT", devices.OVERHEAD_CONSOLE, 3114, 530, ANTI_ICE_PANEL, "Pitot Heat")

-- Eng Cond Panel
local ENGINE_COND_PANEL = "Engine Condition Panel"

CH_47F:definePotentiometer("ENG_COND_ENG1", devices.OVERHEAD_CONSOLE, 3116, 534, { 0, 1 }, ENGINE_COND_PANEL, "Engine 1 Lever")
CH_47F:definePushButton("ENG_COND_ENG1_STEP", devices.OVERHEAD_CONSOLE, 3122, 536, ENGINE_COND_PANEL, "Engine 1 Lever (Step in)")
CH_47F:definePotentiometer("ENG_COND_ENG2", devices.OVERHEAD_CONSOLE, 3119, 535, { 0, 1 }, ENGINE_COND_PANEL, "Engine 2 Lever")
CH_47F:definePushButton("ENG_COND_ENG2_STEP", devices.OVERHEAD_CONSOLE, 3123, 537, ENGINE_COND_PANEL, "Engine 2 Lever (Step in)")

-- Hoist Control Panel
local HOIST_PANEL = "Hoist Control Panel"

CH_47F:defineToggleSwitch("HOIST_CABLE_CUT_COVER", devices.OVERHEAD_CONSOLE, 3147, 546, HOIST_PANEL, "Cable Cut Cover")
CH_47F:defineToggleSwitch("HOIST_CABLE_CUT", devices.OVERHEAD_CONSOLE, 3149, 547, HOIST_PANEL, "Cable Cut")
CH_47F:definePotentiometer("HOIST_CONTROL_KNOB", devices.OVERHEAD_CONSOLE, 3151, 548, { -1, 1 }, HOIST_PANEL, "OUT/IN Knob")
CH_47F:defineMultipositionSwitch("HOIST_CONTROL", devices.OVERHEAD_CONSOLE, 3156, 551, 3, 0.1, HOIST_PANEL, "Hoist Control (REMOTE/OFF/PLT)")
CH_47F:defineMultipositionSwitch("HOIST_HOOK_CONTROL", devices.OVERHEAD_CONSOLE, 3159, 552, 3, 0.1, HOIST_PANEL, "Hook Control (RESET/OFF/ARM)")
CH_47F:defineMultipositionSwitch("HOIST_HOOK_SELECT", devices.OVERHEAD_CONSOLE, 3162, 553, 5, 0.1, HOIST_PANEL, "Hook Select (FWD/MID/AFT/TANDEM/ALL)")
CH_47F:defineToggleSwitch("HOIST_EMERGENCY_RELEASE_COVER", devices.OVERHEAD_CONSOLE, 3165, 554, HOIST_PANEL, "Emergency Release Cover")
CH_47F:defineToggleSwitch("HOIST_EMERGENCY_RELEASE", devices.OVERHEAD_CONSOLE, 3167, 555, HOIST_PANEL, "Emergency Release")

-- Troop Warn/Heating Control Panel
local TROOP_WARN_HEATING_PANEL = "Troop Warn/Heating/Wiper Control Panel"

CH_47F:defineMultipositionSwitch("TROOP_JUMP_LIGHT", devices.OVERHEAD_CONSOLE, 3131, 541, 3, 0.1, TROOP_WARN_HEATING_PANEL, "Jump Light (GREEN/OFF/RED)")
CH_47F:defineToggleSwitch("TROOP_JUMP_ALARM", devices.OVERHEAD_CONSOLE, 3134, 542, TROOP_WARN_HEATING_PANEL, "Jump Alarm")
CH_47F:defineFloat("TROOP_JUMP_LIGHT_GREEN", 539, { 0, 1 }, TROOP_WARN_HEATING_PANEL, "Jump Light GREEN Lamp (Green)")
CH_47F:defineFloat("TROOP_JUMP_LIGHT_RED", 540, { 0, 1 }, TROOP_WARN_HEATING_PANEL, "Jump Light RED Lamp (Green)")

CH_47F:definePotentiometer("HEAT_CABIN_TEMP", devices.OVERHEAD_CONSOLE, 3136, 543, { 0, 1 }, TROOP_WARN_HEATING_PANEL, "Cabin Temperature (COOL/WARM)")
CH_47F:defineMultipositionSwitch("HEAT_MODE", devices.OVERHEAD_CONSOLE, 3139, 544, 3, 0.1, TROOP_WARN_HEATING_PANEL, "Heat Mode (BLWR ONLY/OFF/HTR ON)")
CH_47F:definePushButton("HEAT_START", devices.OVERHEAD_CONSOLE, 3142, 545, TROOP_WARN_HEATING_PANEL, "Heater Start")
CH_47F:defineMultipositionSwitch("WIPER_MODE", devices.OVERHEAD_CONSOLE, 3143, 756, 5, 0.1, TROOP_WARN_HEATING_PANEL, "Wiper Mode (PARK/OFF/SLOW/MED/FAST)")

-- Electrical Power Panel
local ELECTRICAL_POWER_PANEL = "Electrical Power Panel"

CH_47F:defineMultipositionSwitch("ELECTRICAL_GEN_1", devices.OVERHEAD_CONSOLE, 3169, 556, 3, 0.1, ELECTRICAL_POWER_PANEL, "Generator 1 Switch (TEST/OFF RESET/ON)")
CH_47F:defineMultipositionSwitch("ELECTRICAL_GEN_2", devices.OVERHEAD_CONSOLE, 3172, 557, 3, 0.1, ELECTRICAL_POWER_PANEL, "Generator 2 Switch (TEST/OFF RESET/ON)")
CH_47F:defineMultipositionSwitch("ELECTRICAL_GEN_APU", devices.OVERHEAD_CONSOLE, 3175, 558, 3, 0.1, ELECTRICAL_POWER_PANEL, "APU Generator Switch (TEST/OFF RESET/ON)")
CH_47F:defineToggleSwitch("ELECTRICAL_BATTERY", devices.OVERHEAD_CONSOLE, 3178, 559, ELECTRICAL_POWER_PANEL, "Battery")
CH_47F:defineMultipositionSwitch("ELECTRICAL_APU", devices.OVERHEAD_CONSOLE, 3181, 560, 3, 0.1, ELECTRICAL_POWER_PANEL, "APU (OFF/RUN/START)")
CH_47F:defineFloat("ELECTRICAL_UTILITY_PRESSURE", 562, { 0, 1 }, ELECTRICAL_POWER_PANEL, "UTIL PRES Lamp (Red)")
CH_47F:defineFloat("ELECTRICAL_APU_READY", 563, { 0, 1 }, ELECTRICAL_POWER_PANEL, "APU RDY Lamp (Green)")

-- FADEC Panel
local FADEC_PANEL = "FADEC Panel"

CH_47F:defineToggleSwitch("FADEC_ENG1_MODE", devices.OVERHEAD_CONSOLE, 3184, 564, FADEC_PANEL, "Engine 1 Mode (REV/PRI)")
CH_47F:defineToggleSwitch("FADEC_ENG2_MODE", devices.OVERHEAD_CONSOLE, 3186, 565, FADEC_PANEL, "Engine 2 Mode (REV/PRI)")
CH_47F:defineSingleCommandRocker("FADEC_ENG1_NR", devices.OVERHEAD_CONSOLE, 3188, 566, FADEC_PANEL, "Engine 1 NR (DEC/INC)")
CH_47F:defineSingleCommandRocker("FADEC_ENG2_NR", devices.OVERHEAD_CONSOLE, 3189, 567, FADEC_PANEL, "Engine 2 NR (DEC/INC)")
CH_47F:defineToggleSwitch("FADEC_BU_POWER", devices.OVERHEAD_CONSOLE, 3190, 568, FADEC_PANEL, "Backup Power")
CH_47F:defineSingleCommandRocker("FADEC_OSPD", devices.OVERHEAD_CONSOLE, 3192, 569, FADEC_PANEL, "Overspeed Test (1/2)")
CH_47F:defineToggleSwitch("FADEC_LOAD_SHARE", devices.OVERHEAD_CONSOLE, 3193, 570, FADEC_PANEL, "Load Share (PTIT/TRQ)")
CH_47F:defineSingleCommandRocker("FADEC_ENGINE_START", devices.OVERHEAD_CONSOLE, 3195, 571, FADEC_PANEL, "Engine Start (1/2)")
CH_47F:definePotentiometer("FADEC_NR", devices.OVERHEAD_CONSOLE, 3196, 572, { 0, 1 }, FADEC_PANEL, "NR% Selector")

-- Hydraulic Control Panel
local HYDRAULIC_PANEL = "Hydraulic Control Panel"

CH_47F:defineMultipositionSwitch("HYD_FLT_CONT", devices.OVERHEAD_CONSOLE, 3021, 493, 3, 0.1, HYDRAULIC_PANEL, "Flight Control (2 ON/BOTH/1 ON)")
CH_47F:defineToggleSwitch("HYD_PWR_XFER_1", devices.OVERHEAD_CONSOLE, 3024, 494, HYDRAULIC_PANEL, "Power Transfer 1")
CH_47F:defineToggleSwitch("HYD_PWR_XFER_2", devices.OVERHEAD_CONSOLE, 3026, 495, HYDRAULIC_PANEL, "Power Transfer 2")
CH_47F:defineToggleSwitch("HYD_PWR_STEER_COVER", devices.OVERHEAD_CONSOLE, 3028, 496, HYDRAULIC_PANEL, "Power Steering Cover")
CH_47F:defineToggleSwitch("HYD_PWR_STEER", devices.OVERHEAD_CONSOLE, 3030, 497, HYDRAULIC_PANEL, "Power Steering")
CH_47F:defineMultipositionSwitch("HYD_RAMP_PWR", devices.OVERHEAD_CONSOLE, 3032, 498, 3, 0.1, HYDRAULIC_PANEL, "Ramp Power (OFF/ON/EMERG)")
CH_47F:defineToggleSwitch("HYD_RAMP_EMER_COVER", devices.OVERHEAD_CONSOLE, 3035, 499, HYDRAULIC_PANEL, "Ramp Emergency Cover")
CH_47F:defineMultipositionSwitch("HYD_RAMP_EMER", devices.OVERHEAD_CONSOLE, 3037, 500, 3, 0.1, HYDRAULIC_PANEL, "Ramp Emergency (UP/HOLD/DOWN)")

-- Oil Level Check Switch
local OIL_LEVEL_CHECK = "Oil Level Check Switch"

CH_47F:defineToggleSwitch("OIL_LEVEL_CHECK", devices.OVERHEAD_CONSOLE, 3205, 1413, OIL_LEVEL_CHECK, "Oil Level Check")

-- Pilot Interior Lights
local PILOT_INTERIOR_LIGHTS = "PLT Interior Lights"

CH_47F:definePotentiometer("PLT_INT_LIGHT_STALK_DASH_BRT", devices.OVERHEAD_CONSOLE, 3239, 1382, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Dash Stalk Light Brightness Knob")
CH_47F:defineFloat("PLT_INT_LIGHT_STALK_DASH", 1383, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Dash Stalk Lamp (Green)")
CH_47F:defineToggleSwitch("PLT_INT_LIGHT_STALK_CB_UNLOCK", devices.OVERHEAD_CONSOLE, 3253, 1464, PILOT_INTERIOR_LIGHTS, "Circuit Breaker Stalk Lamp (Lock/Unlock)")
CH_47F:definePotentiometer("PLT_INT_LIGHT_STALK_CB_BRT", devices.OVERHEAD_CONSOLE, 3248, 1388, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Circuit Breaker Stalk Light Brightness Knob")
CH_47F:defineFloat("PLT_INT_LIGHT_STALK_CB", 1389, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Circuit Breaker Stalk Lamp (Green)")
CH_47F:definePotentiometer("PLT_INT_LIGHT_UTIL_BRT", devices.OVERHEAD_CONSOLE, 3207, 1348, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Utility Light Brightness Knob")
CH_47F:defineToggleSwitch("PLT_INT_LIGHT_UTIL_COLOR", devices.OVERHEAD_CONSOLE, 3216, 1351, PILOT_INTERIOR_LIGHTS, "Utility Light Color Selector (WHITE/GREEN)")
CH_47F:defineFloat("PLT_INT_LIGHT_UTIL_WHITE", 1352, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Utility Lamp (White)")
CH_47F:defineFloat("PLT_INT_LIGHT_UTIL_GREEN", 1353, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Utility Lamp (Green)")

-- Copilot Interior Lights
local COPILOT_INTERIOR_LIGHTS = "CPLT Interior Lights"

CH_47F:definePotentiometer("CPLT_INT_LIGHT_STALK_DASH_BRT", devices.OVERHEAD_CONSOLE, 3236, 1380, { 0, 1 }, COPILOT_INTERIOR_LIGHTS, "Dash Stalk Light Brightness Knob")
CH_47F:defineFloat("CPLT_INT_LIGHT_STALK_DASH", 1381, { 0, 1 }, COPILOT_INTERIOR_LIGHTS, "Dash Stalk Lamp (Green)")
CH_47F:defineToggleSwitch("CPLT_INT_LIGHT_STALK_CB_UNLOCK", devices.OVERHEAD_CONSOLE, 3251, 1462, COPILOT_INTERIOR_LIGHTS, "Circuit Breaker Stalk Lamp (Lock/Unlock)")
CH_47F:definePotentiometer("CPLT_INT_LIGHT_STALK_CB_BRT", devices.OVERHEAD_CONSOLE, 3245, 1386, { 0, 1 }, COPILOT_INTERIOR_LIGHTS, "Circuit Breaker Stalk Light Brightness Knob")
CH_47F:defineFloat("CPLT_INT_LIGHT_STALK_CB", 1387, { 0, 1 }, COPILOT_INTERIOR_LIGHTS, "Circuit Breaker Stalk Lamp (Green)")
CH_47F:definePotentiometer("CPLT_INT_LIGHT_UTIL_BRT", devices.OVERHEAD_CONSOLE, 3222, 1356, { 0, 1 }, COPILOT_INTERIOR_LIGHTS, "Utility Light Brightness Knob")
CH_47F:defineToggleSwitch("CPLT_INT_LIGHT_UTIL_COLOR", devices.OVERHEAD_CONSOLE, 3230, 1359, COPILOT_INTERIOR_LIGHTS, "Utility Light Color Selector (WHITE/GREEN)")
CH_47F:defineFloat("CPLT_INT_LIGHT_UTIL_WHITE", 1360, { 0, 1 }, COPILOT_INTERIOR_LIGHTS, "Utility Lamp (White)")
CH_47F:defineFloat("CPLT_INT_LIGHT_UTIL_GREEN", 1361, { 0, 1 }, COPILOT_INTERIOR_LIGHTS, "Utility Lamp (Green)")

-- Troop Commander Interior Lights
local TC_INTERIOR_LIGHTS = "TC Interior Lights"

CH_47F:definePotentiometer("TC_INT_LIGHT_STALK_BRT", devices.OVERHEAD_CONSOLE, 3242, 1384, { 0, 1 }, TC_INTERIOR_LIGHTS, "Stalk Light Brightness Knob")
CH_47F:defineFloat("TC_INT_LIGHT_STALK", 1385, { 0, 1 }, TC_INTERIOR_LIGHTS, "Stalk Lamp (Green)")

-- Free Air Temperature Gauge
local FREE_AIR_TEMP = "Free Air Temperature Gauge"

CH_47F:defineFloat("FREE_AIR_TEMP", 1211, { 0, 1 }, FREE_AIR_TEMP, "Free Air Temperature")

-- todo (https://github.com/DCS-Skunkworks/dcs-bios/issues/1126): circuit breakers could still use some work. Specifically, the collar may not prevent actioning via dcs-bios. The collar also reports being on when the circuit breaker is depressed.

--- defines a circuit breaker control and a corresponding collar control
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function CH_47F:defineCircuitBreaker(identifier, device_id, command, arg_number, category, description)
	self:defineToggleSwitchManualRange(identifier, device_id, command, arg_number, { 1, 0.6 }, category, description)
	self:defineToggleSwitchManualRange(identifier .. "_COLLAR", device_id, command, arg_number, { 1, 0.8 }, category, description .. " (Collar)")
end

-- Pilot Circuit Breakers
local PILOT_CIRCUIT_BREAKERS = "PLT Circuit Breakers"

CH_47F:defineCircuitBreaker("PLT_CB_FUEL_L_QTY_LO_LVL", devices.PDP2, 3008, 184, PILOT_CIRCUIT_BREAKERS, "FUEL L QTY LO LVL")
CH_47F:defineCircuitBreaker("PLT_CB_FUEL_R_QTY", devices.PDP2, 3009, 185, PILOT_CIRCUIT_BREAKERS, "FUEL R QTY")
CH_47F:defineCircuitBreaker("PLT_CB_R_FUEL_PUMP_CONTR_AUX_AFT", devices.PDP2, 3010, 186, PILOT_CIRCUIT_BREAKERS, "R FUEL PUMP CONTR AUX AFT")
CH_47F:defineCircuitBreaker("PLT_CB_R_FUEL_PUMP_CONTR_MAIN_AFT", devices.PDP2, 3011, 187, PILOT_CIRCUIT_BREAKERS, "R FUEL PUMP CONTR MAIN AFT")
CH_47F:defineCircuitBreaker("PLT_CB_R_FUEL_PUMP_CONTR_MAIN_FWD", devices.PDP2, 3012, 188, PILOT_CIRCUIT_BREAKERS, "R FUEL PUMP CONTR MAIN FWD")
CH_47F:defineCircuitBreaker("PLT_CB_R_FUEL_PUMP_CONTR_AUX_FWD", devices.PDP2, 3013, 189, PILOT_CIRCUIT_BREAKERS, "R FUEL PUMP CONTR AUX FWD")
CH_47F:defineCircuitBreaker("PLT_CB_FADEC_NO_2_PRI_PWR", devices.PDP2, 3014, 190, PILOT_CIRCUIT_BREAKERS, "FADEC NO 2 PRI PWR")
CH_47F:defineCircuitBreaker("PLT_CB_FADEC_NO_2_REV_PWR", devices.PDP2, 3015, 191, PILOT_CIRCUIT_BREAKERS, "FADEC NO 2 REV PWR")
CH_47F:defineCircuitBreaker("PLT_CB_FADEC_NO_2_START_AND_IGN", devices.PDP2, 3016, 192, PILOT_CIRCUIT_BREAKERS, "FADEC NO 2 START AND IGN")
CH_47F:defineCircuitBreaker("PLT_CB_ENGINE_NO_2_FUEL_SHUT_OFF", devices.PDP2, 3017, 193, PILOT_CIRCUIT_BREAKERS, "ENGINE NO 2 FUEL SHUT OFF")
CH_47F:defineCircuitBreaker("PLT_CB_ENGINE_NO_2_FIRE_EXT", devices.PDP2, 3018, 194, PILOT_CIRCUIT_BREAKERS, "ENGINE NO 2 FIRE EXT")
CH_47F:defineCircuitBreaker("PLT_CB_ENGINE_NO_2_FIRE_DET", devices.PDP2, 3019, 195, PILOT_CIRCUIT_BREAKERS, "ENGINE NO 2 FIRE DET")
CH_47F:defineCircuitBreaker("PLT_CB_ENGINE_NO_2_TORQUE", devices.PDP2, 3020, 196, PILOT_CIRCUIT_BREAKERS, "ENGINE NO 2 TORQUE")
CH_47F:defineCircuitBreaker("PLT_CB_ENGINE_NO_2_FUEL_FLOW", devices.PDP2, 3021, 197, PILOT_CIRCUIT_BREAKERS, "ENGINE NO 2 FUEL FLOW")
CH_47F:defineCircuitBreaker("PLT_CB_ENGINE_NO_2_OIL_PRESS", devices.PDP2, 3022, 198, PILOT_CIRCUIT_BREAKERS, "ENGINE NO 2 OIL PRESS")
CH_47F:defineCircuitBreaker("PLT_CB_DCU_2_26VAC", devices.PDP2, 3023, 199, PILOT_CIRCUIT_BREAKERS, "DCU 2 26VAC")
CH_47F:defineCircuitBreaker("PLT_CB_R_FUEL_PUMP_MAIN_AFT", devices.PDP2, 3026, 202, PILOT_CIRCUIT_BREAKERS, "R FUEL PUMP MAIN AFT")
CH_47F:defineCircuitBreaker("PLT_CB_R_FUEL_PUMP_MAIN_FWD", devices.PDP2, 3029, 205, PILOT_CIRCUIT_BREAKERS, "R FUEL PUMP MAIN FWD")
CH_47F:defineCircuitBreaker("PLT_CB_NO_2_XFMR_RECT", devices.PDP2, 3031, 207, PILOT_CIRCUIT_BREAKERS, "NO 2 XFMR RECT")
CH_47F:defineCircuitBreaker("PLT_CB_ELECT_CKPT_UTIL_RCPT_2", devices.PDP2, 3037, 213, PILOT_CIRCUIT_BREAKERS, "ELECT CKPT UTIL RCPT 2")
CH_47F:defineCircuitBreaker("PLT_CB_ELECT_DC_2_BUS_CONTR", devices.PDP2, 3038, 214, PILOT_CIRCUIT_BREAKERS, "ELECT DC 2 BUS CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_ELECT_DC_2_BUS_CURR_XDCR", devices.PDP2, 3039, 215, PILOT_CIRCUIT_BREAKERS, "ELECT DC 2 BUS CURR XDCR")
CH_47F:defineCircuitBreaker("PLT_CB_ELECT_AC_2_BUS_CURR_XDCR", devices.PDP2, 3040, 216, PILOT_CIRCUIT_BREAKERS, "ELECT AC 2 BUS CURR XDCR")
CH_47F:defineCircuitBreaker("PLT_CB_ELECT_BATT_CHRG_2_RCCO_CONTR", devices.PDP2, 3041, 217, PILOT_CIRCUIT_BREAKERS, "ELECT BATT CHRG 2 RCCO CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_ELECT_BATT_CHRG_2_CONTR", devices.PDP2, 3042, 218, PILOT_CIRCUIT_BREAKERS, "ELECT BATT CHRG 2 CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_ELECT_DC_2_ESS_BUS_CONTR", devices.PDP2, 3043, 219, PILOT_CIRCUIT_BREAKERS, "ELECT DC 2 ESS BUS CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_ELECT_NO_2_RVS_CUR_CUTOUT", devices.PDP2, 3044, 220, PILOT_CIRCUIT_BREAKERS, "ELECT NO 2 RVS CUR CUTOUT")
CH_47F:defineCircuitBreaker("PLT_CB_AIR_WAR_MCU_3_PLT", devices.PDP2, 3046, 222, PILOT_CIRCUIT_BREAKERS, "AIR WAR MCU 3 PLT")
CH_47F:defineCircuitBreaker("PLT_CB_CARGO_HOOK_NORM_REL_PWR", devices.PDP2, 3047, 223, PILOT_CIRCUIT_BREAKERS, "CARGO HOOK NORM REL PWR")
CH_47F:defineCircuitBreaker("PLT_CB_CARGO_HOOK_NORM_REL_CONTR", devices.PDP2, 3048, 224, PILOT_CIRCUIT_BREAKERS, "CARGO HOOK NORM REL CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_BLADE_TRACK", devices.PDP2, 3049, 225, PILOT_CIRCUIT_BREAKERS, "BLADE TRACK")
CH_47F:defineCircuitBreaker("PLT_CB_CRUISE_GUIDE", devices.PDP2, 3050, 226, PILOT_CIRCUIT_BREAKERS, "CRUISE GUIDE")
CH_47F:defineCircuitBreaker("PLT_CB_AFCS_CYC_TRIM_AFT_ACTR", devices.PDP2, 3051, 227, PILOT_CIRCUIT_BREAKERS, "AFCS CYC TRIM AFT ACTR")
CH_47F:defineCircuitBreaker("PLT_CB_AFCS_LONG_DRVR_ACTR_DC", devices.PDP2, 3052, 228, PILOT_CIRCUIT_BREAKERS, "AFCS LONG DRVR ACTR (DC)")
CH_47F:defineCircuitBreaker("PLT_CB_AFCS_FCC_2_DC", devices.PDP2, 3053, 229, PILOT_CIRCUIT_BREAKERS, "AFCS FCC 2 (DC)")
CH_47F:defineCircuitBreaker("PLT_CB_AFCS_FCC_2_AC", devices.PDP2, 3054, 230, PILOT_CIRCUIT_BREAKERS, "AFCS FCC 2 (AC)")
CH_47F:defineCircuitBreaker("PLT_CB_AFCS_LONG_DRVR_ACTR_AC", devices.PDP2, 3055, 231, PILOT_CIRCUIT_BREAKERS, "AFCS LONG DRVR ACTR (AC)")
CH_47F:defineCircuitBreaker("PLT_CB_VIB_ABSORB_R", devices.PDP2, 3056, 232, PILOT_CIRCUIT_BREAKERS, "VIB ABSORB R")
CH_47F:defineCircuitBreaker("PLT_CB_VIB_ABSORB_L", devices.PDP2, 3057, 233, PILOT_CIRCUIT_BREAKERS, "VIB ABSORB L")
CH_47F:defineCircuitBreaker("PLT_CB_R_FUEL_PUMP_AUX_AFT", devices.PDP2, 3059, 235, PILOT_CIRCUIT_BREAKERS, "R FUEL PUMP AUX AFT")
CH_47F:defineCircuitBreaker("PLT_CB_R_FUEL_PUMP_AUX_FWD", devices.PDP2, 3062, 238, PILOT_CIRCUIT_BREAKERS, "R FUEL PUMP AUX FWD")
CH_47F:defineCircuitBreaker("PLT_CB_NO_2_EAPS_FAN", devices.PDP2, 3064, 240, PILOT_CIRCUIT_BREAKERS, "NO 2 EAPS FAN")
CH_47F:defineCircuitBreaker("PLT_CB_NO_2_DC_AUX_PDP_FEED", devices.PDP2, 3065, 241, PILOT_CIRCUIT_BREAKERS, "NO 2 DC AUX PDP FEED")
CH_47F:defineCircuitBreaker("PLT_CB_NO_2_DC_CROSS_TIE", devices.PDP2, 3066, 242, PILOT_CIRCUIT_BREAKERS, "NO 2 DC CROSS TIE")
CH_47F:defineCircuitBreaker("PLT_CB_CAAS_MFCU_2", devices.PDP2, 3074, 250, PILOT_CIRCUIT_BREAKERS, "CAAS MFCU 2")
CH_47F:defineCircuitBreaker("PLT_CB_CAAS_CDU_2", devices.PDP2, 3075, 251, PILOT_CIRCUIT_BREAKERS, "CAAS CDU 2")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_CVR_FDR", devices.PDP2, 3076, 252, PILOT_CIRCUIT_BREAKERS, "NAV CVR FDR")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_EGI_2_BACKUP_PWR", devices.PDP2, 3077, 253, PILOT_CIRCUIT_BREAKERS, "NAV EGI 2 BACKUP PWR")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_SFD_2", devices.PDP2, 3078, 254, PILOT_CIRCUIT_BREAKERS, "NAV SFD 2")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_RDR_ALT", devices.PDP2, 3079, 255, PILOT_CIRCUIT_BREAKERS, "NAV RDR ALT")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_VOR", devices.PDP2, 3080, 256, PILOT_CIRCUIT_BREAKERS, "NAV VOR")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_TACAN", devices.PDP2, 3081, 257, PILOT_CIRCUIT_BREAKERS, "NAV TACAN")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_STORM_SCOPE", devices.PDP2, 3082, 258, PILOT_CIRCUIT_BREAKERS, "NAV STORM SCOPE")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_EGI_2", devices.PDP2, 3083, 259, PILOT_CIRCUIT_BREAKERS, "NAV EGI 2")
CH_47F:defineCircuitBreaker("PLT_CB_NAV_ADC_2", devices.PDP2, 3084, 260, PILOT_CIRCUIT_BREAKERS, "NAV ADC 2")
CH_47F:defineCircuitBreaker("PLT_CB_ASE_RDR_WARN", devices.PDP2, 3085, 261, PILOT_CIRCUIT_BREAKERS, "ASE RDR WARN")
CH_47F:defineCircuitBreaker("PLT_CB_ASE_MWS_CONTR", devices.PDP2, 3086, 262, PILOT_CIRCUIT_BREAKERS, "ASE MWS CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_ASE_MWS_PWR", devices.PDP2, 3088, 264, PILOT_CIRCUIT_BREAKERS, "ASE MWS PWR")
CH_47F:defineCircuitBreaker("PLT_CB_CAAS_GPPU_2", devices.PDP2, 3092, 268, PILOT_CIRCUIT_BREAKERS, "CAAS GPPU 2")
CH_47F:defineCircuitBreaker("PLT_CB_CAAS_DCU_2", devices.PDP2, 3095, 271, PILOT_CIRCUIT_BREAKERS, "CAAS DCU 2")
CH_47F:defineCircuitBreaker("PLT_CB_CABIN_HEATER_BLOWER", devices.PDP2, 3097, 273, PILOT_CIRCUIT_BREAKERS, "CABIN HEATER BLOWER")
CH_47F:defineCircuitBreaker("PLT_CB_HYDRAULICS_NO_2_BLO_CONTR", devices.PDP2, 3101, 277, PILOT_CIRCUIT_BREAKERS, "HYDRAULICS NO 2 BLO CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_HYDRAULICS_PWR_XFER", devices.PDP2, 3102, 278, PILOT_CIRCUIT_BREAKERS, "HYDRAULICS PWR XFER")
CH_47F:defineCircuitBreaker("PLT_CB_HYDRAULICS_PRESS_IND", devices.PDP2, 3103, 279, PILOT_CIRCUIT_BREAKERS, "HYDRAULICS PRESS IND")
CH_47F:defineCircuitBreaker("PLT_CB_HYDRAULICS_FLUID_TEMP", devices.PDP2, 3104, 280, PILOT_CIRCUIT_BREAKERS, "HYDRAULICS FLUID TEMP")
CH_47F:defineCircuitBreaker("PLT_CB_HYDRAULICS_FLT_CONTR", devices.PDP2, 3105, 281, PILOT_CIRCUIT_BREAKERS, "HYDRAULICS FLT CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_HYDRAULICS_MAINT_PNL_LTS", devices.PDP2, 3106, 282, PILOT_CIRCUIT_BREAKERS, "HYDRAULICS MAINT PNL LTS")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_R_ICS", devices.PDP2, 3107, 283, PILOT_CIRCUIT_BREAKERS, "COMM R ICS")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_VHF_ANT_SW", devices.PDP2, 3108, 284, PILOT_CIRCUIT_BREAKERS, "COMM VHF ANT SW")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_VHF_RT", devices.PDP2, 3109, 285, PILOT_CIRCUIT_BREAKERS, "COMM VHF RT")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_VHF_SCTY_SET", devices.PDP2, 3110, 286, PILOT_CIRCUIT_BREAKERS, "COMM VHF SCTY SET")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_IFF", devices.PDP2, 3111, 287, PILOT_CIRCUIT_BREAKERS, "COMM IFF")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_HF_PA_CLR", devices.PDP2, 3112, 288, PILOT_CIRCUIT_BREAKERS, "COMM HF PA CLR")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_HF_KY_100", devices.PDP2, 3113, 289, PILOT_CIRCUIT_BREAKERS, "COMM HF KY-100")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_SINCGARS_2_RT", devices.PDP2, 3114, 290, PILOT_CIRCUIT_BREAKERS, "COMM SINCGARS 2 RT")
CH_47F:defineCircuitBreaker("PLT_CB_COMM_SINCGARS_2_PWR_AMP", devices.PDP2, 3115, 291, PILOT_CIRCUIT_BREAKERS, "COMM SINCGARS 2 PWR AMP")
CH_47F:defineCircuitBreaker("PLT_CB_WSHLD_WIPER", devices.PDP2, 3116, 292, PILOT_CIRCUIT_BREAKERS, "WSHLD WIPER")
CH_47F:defineCircuitBreaker("PLT_CB_ANTI_ICE_PITOT_3_HTR", devices.PDP2, 3117, 293, PILOT_CIRCUIT_BREAKERS, "ANTI-ICE PITOT 3 HTR")
CH_47F:defineCircuitBreaker("PLT_CB_ANTI_ICE_WSHLD_PLT_CONTR", devices.PDP2, 3118, 294, PILOT_CIRCUIT_BREAKERS, "ANTI-ICE WSHLD PLT CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_ANTI_ICE_WSHLD_CTR_CONTR", devices.PDP2, 3119, 295, PILOT_CIRCUIT_BREAKERS, "ANTI-ICE WSHLD CTR CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_ANTI_ICE_WSHLD_PLT_HTR", devices.PDP2, 3120, 296, PILOT_CIRCUIT_BREAKERS, "ANTI-ICE WSHLD PLT HTR")
CH_47F:defineCircuitBreaker("PLT_CB_ANTI_ICE_WSHLD_CTR_HTR", devices.PDP2, 3121, 297, PILOT_CIRCUIT_BREAKERS, "ANTI-ICE WSHLD CTR HTR")
CH_47F:defineCircuitBreaker("PLT_CB_ANTI_ICE_PITOT_2_HTR", devices.PDP2, 3122, 298, PILOT_CIRCUIT_BREAKERS, "ANTI-ICE PITOT 2 HTR")
CH_47F:defineCircuitBreaker("PLT_CB_ANTI_ICE_STATIC_PORT_HTR", devices.PDP2, 3123, 299, PILOT_CIRCUIT_BREAKERS, "ANTI-ICE STATIC PORT HTR")
CH_47F:defineCircuitBreaker("PLT_CB_CAAS_MFD_3", devices.PDP2, 3125, 301, PILOT_CIRCUIT_BREAKERS, "CAAS MFD 3")
CH_47F:defineCircuitBreaker("PLT_CB_CAAS_MFD_4", devices.PDP2, 3128, 304, PILOT_CIRCUIT_BREAKERS, "CAAS MFD 4")
CH_47F:defineCircuitBreaker("PLT_CB_R_PROX_SW", devices.PDP2, 3134, 310, PILOT_CIRCUIT_BREAKERS, "R PROX SW")
CH_47F:defineCircuitBreaker("PLT_CB_TROOP_ALARM_JUMP_LT", devices.PDP2, 3135, 311, PILOT_CIRCUIT_BREAKERS, "TROOP ALARM JUMP LT")
CH_47F:defineCircuitBreaker("PLT_CB_TROOP_ALARM_BELL", devices.PDP2, 3136, 312, PILOT_CIRCUIT_BREAKERS, "TROOP ALARM BELL")
CH_47F:defineCircuitBreaker("PLT_CB_CLOCK", devices.PDP2, 3137, 313, PILOT_CIRCUIT_BREAKERS, "CLOCK")
CH_47F:defineCircuitBreaker("PLT_CB_CABIN_HTR_CONTR", devices.PDP2, 3138, 314, PILOT_CIRCUIT_BREAKERS, "CABIN HTR CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_NO_2_EAPS_BYPASS_DOORS", devices.PDP2, 3139, 315, PILOT_CIRCUIT_BREAKERS, "NO 2 EAPS BYPASS DOORS")
CH_47F:defineCircuitBreaker("PLT_CB_NO_2_EAPS_FAN_CONTR", devices.PDP2, 3140, 316, PILOT_CIRCUIT_BREAKERS, "NO 2 EAPS FAN CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_PLT_SLT_CONTR", devices.PDP2, 3142, 318, PILOT_CIRCUIT_BREAKERS, "LIGHTING PLT SLT CONTR")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_PLT_SLT_FIL", devices.PDP2, 3143, 319, PILOT_CIRCUIT_BREAKERS, "LIGHTING PLT SLT FIL")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_PDP_MAP", devices.PDP2, 3144, 320, PILOT_CIRCUIT_BREAKERS, "LIGHTING PDP MAP")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_LAMP_TEST", devices.PDP2, 3145, 321, PILOT_CIRCUIT_BREAKERS, "LIGHTING LAMP TEST")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_INSTR_FLOOD", devices.PDP2, 3146, 322, PILOT_CIRCUIT_BREAKERS, "LIGHTING INSTR FLOOD")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_STBY_CMPS", devices.PDP2, 3147, 323, PILOT_CIRCUIT_BREAKERS, "LIGHTING STBY CMPS")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_MODE_SEL", devices.PDP2, 3148, 324, PILOT_CIRCUIT_BREAKERS, "LIGHTING MODE SEL")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_CKPT_DOME", devices.PDP2, 3149, 325, PILOT_CIRCUIT_BREAKERS, "LIGHTING CKPT DOME")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_POSN", devices.PDP2, 3150, 326, PILOT_CIRCUIT_BREAKERS, "LIGHTING POSN")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_BOT_ANTI_COL", devices.PDP2, 3151, 327, PILOT_CIRCUIT_BREAKERS, "LIGHTING BOT ANTI COL")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_TOP_ANTI_COL", devices.PDP2, 3152, 328, PILOT_CIRCUIT_BREAKERS, "LIGHTING TOP ANTI COL")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_PLT_INSTR", devices.PDP2, 3154, 330, PILOT_CIRCUIT_BREAKERS, "LIGHTING PLT INSTR")
CH_47F:defineCircuitBreaker("PLT_CB_LIGHTING_CTR_INSTR", devices.PDP2, 3155, 331, PILOT_CIRCUIT_BREAKERS, "LIGHTING CTR INSTR")
CH_47F:defineCircuitBreaker("PLT_CB_NO_2_INSTR_XMFR", devices.PDP2, 3156, 332, PILOT_CIRCUIT_BREAKERS, "NO 2 INSTR XMFR")
CH_47F:defineCircuitBreaker("PLT_CB_CAAS_MFD_5", devices.PDP2, 3158, 334, PILOT_CIRCUIT_BREAKERS, "CAAS MFD 5")
CH_47F:defineCircuitBreaker("PLT_CB_HYDRAULICS_NO_2_COOLING_BLOWER", devices.PDP2, 3161, 337, PILOT_CIRCUIT_BREAKERS, "HYDRAULICS NO 2 COOLING BLOWER")
CH_47F:defineCircuitBreaker("PLT_CB_BATT_CHRG_2_RCCO", devices.PDP2, 3164, 340, PILOT_CIRCUIT_BREAKERS, "BATT CHRG 2 RCCO")
CH_47F:defineCircuitBreaker("PLT_CB_DC_ESS_2_BUS_FEED", devices.PDP2, 3165, 341, PILOT_CIRCUIT_BREAKERS, "DC ESS 2 BUS FEED")

-- Copilot Circuit Breakers
local COPILOT_CIRCUIT_BREAKERS = "CPLT Circuit Breakers"

CH_47F:defineCircuitBreaker("CPLT_CB_FUEL_REFUEL", devices.PDP1, 3006, 17, COPILOT_CIRCUIT_BREAKERS, "FUEL REFUEL")
CH_47F:defineCircuitBreaker("CPLT_CB_FUEL_XFEED_CONTR", devices.PDP1, 3007, 18, COPILOT_CIRCUIT_BREAKERS, "FUEL XFEED CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_FUEL_R_QTY_LO_LVL", devices.PDP1, 3008, 19, COPILOT_CIRCUIT_BREAKERS, "FUEL R QTY LO LVL")
CH_47F:defineCircuitBreaker("CPLT_CB_FUEL_L_QTY", devices.PDP1, 3009, 20, COPILOT_CIRCUIT_BREAKERS, "FUEL L QTY")
CH_47F:defineCircuitBreaker("CPLT_CB_L_FUEL_PUMP_CONTR_AUX_AFT", devices.PDP1, 3010, 21, COPILOT_CIRCUIT_BREAKERS, "L FUEL PUMP CONTR AUX AFT")
CH_47F:defineCircuitBreaker("CPLT_CB_L_FUEL_PUMP_CONTR_MAIN_AFT", devices.PDP1, 3011, 22, COPILOT_CIRCUIT_BREAKERS, "L FUEL PUMP CONTR MAIN AFT")
CH_47F:defineCircuitBreaker("CPLT_CB_L_FUEL_PUMP_CONTR_MAIN_FWD", devices.PDP1, 3012, 23, COPILOT_CIRCUIT_BREAKERS, "L FUEL PUMP CONTR MAIN FWD")
CH_47F:defineCircuitBreaker("CPLT_CB_L_FUEL_PUMP_CONTR_AUX_FWD", devices.PDP1, 3013, 24, COPILOT_CIRCUIT_BREAKERS, "L FUEL PUMP CONTR AUX FWD")
CH_47F:defineCircuitBreaker("CPLT_CB_FADEC_NO_1_PRI_PWR", devices.PDP1, 3014, 25, COPILOT_CIRCUIT_BREAKERS, "FADEC NO 1 PRI PWR")
CH_47F:defineCircuitBreaker("CPLT_CB_FADEC_NO_1_REV_PWR", devices.PDP1, 3015, 26, COPILOT_CIRCUIT_BREAKERS, "FADEC NO 1 REV PWR")
CH_47F:defineCircuitBreaker("CPLT_CB_FADEC_NO_1_START_AND_IGN", devices.PDP1, 3016, 27, COPILOT_CIRCUIT_BREAKERS, "FADEC NO 1 START AND IGN")
CH_47F:defineCircuitBreaker("CPLT_CB_ENGINE_NO_1_FUEL_SHUT_OFF", devices.PDP1, 3017, 28, COPILOT_CIRCUIT_BREAKERS, "ENGINE NO 1 FUEL SHUT OFF")
CH_47F:defineCircuitBreaker("CPLT_CB_ENGINE_NO_1_FIRE_EXT", devices.PDP1, 3018, 29, COPILOT_CIRCUIT_BREAKERS, "ENGINE NO 1 FIRE EXT")
CH_47F:defineCircuitBreaker("CPLT_CB_ENGINE_NO_1_FIRE_DET", devices.PDP1, 3019, 30, COPILOT_CIRCUIT_BREAKERS, "ENGINE NO 1 FIRE DET")
CH_47F:defineCircuitBreaker("CPLT_CB_ENGINE_NO_1_TORQUE", devices.PDP1, 3020, 31, COPILOT_CIRCUIT_BREAKERS, "ENGINE NO 1 TORQUE")
CH_47F:defineCircuitBreaker("CPLT_CB_ENGINE_NO_1_FUEL_FLOW", devices.PDP1, 3021, 32, COPILOT_CIRCUIT_BREAKERS, "ENGINE NO 1 FUEL FLOW")
CH_47F:defineCircuitBreaker("CPLT_CB_ENGINE_NO_1_OIL_PRESS", devices.PDP1, 3022, 33, COPILOT_CIRCUIT_BREAKERS, "ENGINE NO 1 OIL PRESS")
CH_47F:defineCircuitBreaker("CPLT_CB_DCU_1_26VAC", devices.PDP1, 3023, 34, COPILOT_CIRCUIT_BREAKERS, "DCU 1 26VAC")
CH_47F:defineCircuitBreaker("CPLT_CB_COLL_PONS", devices.PDP1, 3024, 35, COPILOT_CIRCUIT_BREAKERS, "COLL PONS")
CH_47F:defineCircuitBreaker("CPLT_CB_L_FUEL_PUMP_MAIN_AFT", devices.PDP1, 3026, 37, COPILOT_CIRCUIT_BREAKERS, "L FUEL PUMP MAIN AFT")
CH_47F:defineCircuitBreaker("CPLT_CB_L_FUEL_PUMP_MAIN_FWD", devices.PDP1, 3029, 40, COPILOT_CIRCUIT_BREAKERS, "L FUEL PUMP MAIN FWD")
CH_47F:defineCircuitBreaker("CPLT_CB_NO_1_EAPS_FAN", devices.PDP1, 3031, 42, COPILOT_CIRCUIT_BREAKERS, "NO 1 EAPS FAN")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_BATT_TEST_LOW", devices.PDP1, 3034, 45, COPILOT_CIRCUIT_BREAKERS, "ELECT BATT TEST LOW")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_CKPT_UTIL_RCPT_1", devices.PDP1, 3035, 46, COPILOT_CIRCUIT_BREAKERS, "ELECT CKPT UTIL RCPT 1")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_DC_1_BUS_CONTR", devices.PDP1, 3036, 47, COPILOT_CIRCUIT_BREAKERS, "ELECT DC 1 BUS CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_DC_1_BUS_CURR_XDCR", devices.PDP1, 3037, 48, COPILOT_CIRCUIT_BREAKERS, "ELECT DC 1 BUS CURR XDCR")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_AC_1_BUS_CURR_XDCR", devices.PDP1, 3038, 49, COPILOT_CIRCUIT_BREAKERS, "ELECT AC 1 BUS CURR XDCR")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_BATT_CHRG_1_RCCO_CONTR", devices.PDP1, 3039, 50, COPILOT_CIRCUIT_BREAKERS, "ELECT BATT CHRG 1 RCCO CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_BATT_CHRG_1_CONTR", devices.PDP1, 3040, 51, COPILOT_CIRCUIT_BREAKERS, "ELECT BATT CHRG 1 CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_DC_1_ESS_BUS_CONTR", devices.PDP1, 3041, 52, COPILOT_CIRCUIT_BREAKERS, "ELECT DC 1 ESS BUS CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_NO_1_RVS_CUR_CUTOUT", devices.PDP1, 3042, 53, COPILOT_CIRCUIT_BREAKERS, "ELECT NO 1 RVS CUR CUTOUT")
CH_47F:defineCircuitBreaker("CPLT_CB_ELECT_EXT_PWR_CONTR", devices.PDP1, 3043, 54, COPILOT_CIRCUIT_BREAKERS, "ELECT EXT PWR CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_HOIST_CONTR", devices.PDP1, 3044, 55, COPILOT_CIRCUIT_BREAKERS, "HOIST CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_HOIST_CABLE_CUT", devices.PDP1, 3045, 56, COPILOT_CIRCUIT_BREAKERS, "HOIST CABLE CUT")
CH_47F:defineCircuitBreaker("CPLT_CB_CARGO_HOOK_EMER_REL_PWR", devices.PDP1, 3046, 57, COPILOT_CIRCUIT_BREAKERS, "CARGO HOOK EMER REL PWR")
CH_47F:defineCircuitBreaker("CPLT_CB_CARGO_HOOK_EMER_REL_CONTR", devices.PDP1, 3047, 58, COPILOT_CIRCUIT_BREAKERS, "CARGO HOOK EMER REL CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_AFCS_THRUST_BRAKE", devices.PDP1, 3048, 59, COPILOT_CIRCUIT_BREAKERS, "AFCS THRUST BRAKE")
CH_47F:defineCircuitBreaker("CPLT_CB_AFCS_CONTR_CTR", devices.PDP1, 3049, 60, COPILOT_CIRCUIT_BREAKERS, "AFCS CONTR CTR")
CH_47F:defineCircuitBreaker("CPLT_CB_AFCS_CYC_TRIM_FWD_ACTR", devices.PDP1, 3050, 61, COPILOT_CIRCUIT_BREAKERS, "AFCS CYC TRIM FWD ACTR")
CH_47F:defineCircuitBreaker("CPLT_CB_AFCS_CYC_TRIM_MAN", devices.PDP1, 3051, 62, COPILOT_CIRCUIT_BREAKERS, "AFCS CYC TRIM MAN")
CH_47F:defineCircuitBreaker("CPLT_CB_AFCS_CLTV_DRIVER_ACTR_DC", devices.PDP1, 3052, 63, COPILOT_CIRCUIT_BREAKERS, "AFCS CLTV DRIVER ACTR (DC)")
CH_47F:defineCircuitBreaker("CPLT_CB_AFCS_FCC_1_DC", devices.PDP1, 3053, 64, COPILOT_CIRCUIT_BREAKERS, "AFCS FCC 1 (DC)")
CH_47F:defineCircuitBreaker("CPLT_CB_AFCS_FCC_1_AC", devices.PDP1, 3054, 65, COPILOT_CIRCUIT_BREAKERS, "AFCS FCC 1 (AC)")
CH_47F:defineCircuitBreaker("CPLT_CB_AFCS_CLTV_DRIVER_ACTR_AC", devices.PDP1, 3055, 66, COPILOT_CIRCUIT_BREAKERS, "AFCS CLTV DRIVER ACTR (AC)")
CH_47F:defineCircuitBreaker("CPLT_CB_L_FUEL_PUMP_AUX_AFT", devices.PDP1, 3059, 70, COPILOT_CIRCUIT_BREAKERS, "L FUEL PUMP AUX AFT")
CH_47F:defineCircuitBreaker("CPLT_CB_L_FUEL_PUMP_AUX_FWD", devices.PDP1, 3062, 73, COPILOT_CIRCUIT_BREAKERS, "L FUEL PUMP AUX FWD")
CH_47F:defineCircuitBreaker("CPLT_CB_NO_1_XFMR_RECT", devices.PDP1, 3064, 75, COPILOT_CIRCUIT_BREAKERS, "NO 1 XFMR RECT")
CH_47F:defineCircuitBreaker("CPLT_CB_DC_ESS_1_BUS_FEED", devices.PDP1, 3065, 76, COPILOT_CIRCUIT_BREAKERS, "DC ESS 1 BUS FEED")
CH_47F:defineCircuitBreaker("CPLT_CB_BATT_BUS_FEED", devices.PDP1, 3066, 77, COPILOT_CIRCUIT_BREAKERS, "BATT BUS FEED")
CH_47F:defineCircuitBreaker("CPLT_CB_AIR_WAR_MASK_BLWR", devices.PDP1, 3074, 85, COPILOT_CIRCUIT_BREAKERS, "AIR WAR MASK BLWR")
CH_47F:defineCircuitBreaker("CPLT_CB_AIR_WAR_MCU_1_CPLT", devices.PDP1, 3075, 86, COPILOT_CIRCUIT_BREAKERS, "AIR WAR MCU 1 CPLT")
CH_47F:defineCircuitBreaker("CPLT_CB_CAAS_MFCU_1", devices.PDP1, 3076, 87, COPILOT_CIRCUIT_BREAKERS, "CAAS MFCU 1")
CH_47F:defineCircuitBreaker("CPLT_CB_CAAS_CDU_1", devices.PDP1, 3077, 88, COPILOT_CIRCUIT_BREAKERS, "CAAS CDU 1")
CH_47F:defineCircuitBreaker("CPLT_CB_CAAS_ZEROIZE", devices.PDP1, 3078, 89, COPILOT_CIRCUIT_BREAKERS, "CAAS ZEROIZE")
CH_47F:defineCircuitBreaker("CPLT_CB_NAV_EGI_1_BACKUP_PWR", devices.PDP1, 3079, 90, COPILOT_CIRCUIT_BREAKERS, "NAV EGI 1 BACKUP PWR")
CH_47F:defineCircuitBreaker("CPLT_CB_NAV_SFD_1", devices.PDP1, 3080, 91, COPILOT_CIRCUIT_BREAKERS, "NAV SFD 1")
CH_47F:defineCircuitBreaker("CPLT_CB_NAV_ADC_1", devices.PDP1, 3081, 92, COPILOT_CIRCUIT_BREAKERS, "NAV ADC 1")
CH_47F:defineCircuitBreaker("CPLT_CB_NAV_ADF", devices.PDP1, 3082, 93, COPILOT_CIRCUIT_BREAKERS, "NAV ADF")
CH_47F:defineCircuitBreaker("CPLT_CB_NAV_EGI_1", devices.PDP1, 3083, 94, COPILOT_CIRCUIT_BREAKERS, "NAV EGI 1")
CH_47F:defineCircuitBreaker("CPLT_CB_NAV_DR_200", devices.PDP1, 3084, 95, COPILOT_CIRCUIT_BREAKERS, "NAV DR-200")
CH_47F:defineCircuitBreaker("CPLT_CB_NAV_ASG_HUD", devices.PDP1, 3085, 96, COPILOT_CIRCUIT_BREAKERS, "NAV ASG HUD")
CH_47F:defineCircuitBreaker("CPLT_CB_ASE_CMDS_CONTR", devices.PDP1, 3086, 97, COPILOT_CIRCUIT_BREAKERS, "ASE CMDS CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_NAV_MMS", devices.PDP1, 3087, 98, COPILOT_CIRCUIT_BREAKERS, "NAV MMS")
CH_47F:defineCircuitBreaker("CPLT_CB_XMSN_OIL_PRESS", devices.PDP1, 3088, 99, COPILOT_CIRCUIT_BREAKERS, "XMSN OIL PRESS")
CH_47F:defineCircuitBreaker("CPLT_CB_CAAS_GPPU_1", devices.PDP1, 3092, 103, COPILOT_CIRCUIT_BREAKERS, "CAAS GPPU 1")
CH_47F:defineCircuitBreaker("CPLT_CB_CAAS_DCU_1", devices.PDP1, 3095, 106, COPILOT_CIRCUIT_BREAKERS, "CAAS DCU 1")
CH_47F:defineCircuitBreaker("CPLT_CB_UTIL_HYD_COOLING_BLOWER", devices.PDP1, 3097, 108, COPILOT_CIRCUIT_BREAKERS, "UTIL HYD COOLING BLOWER")
CH_47F:defineCircuitBreaker("CPLT_CB_NO_1_DC_CROSS_TIE", devices.PDP1, 3098, 109, COPILOT_CIRCUIT_BREAKERS, "NO 1 DC CROSS TIE")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_ACC_PUMP", devices.PDP1, 3103, 114, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS ACC PUMP")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_OIL_LVL", devices.PDP1, 3104, 115, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS OIL LVL")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_MAINT_PNL_LTG", devices.PDP1, 3105, 116, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS MAINT PNL LTG")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_NO_1_BLO_CONTR", devices.PDP1, 3106, 117, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS NO 1 BLO CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_UTIL_BLO_CONTR", devices.PDP1, 3107, 118, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS UTIL BLO CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_SYS_CONTR", devices.PDP1, 3108, 119, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS SYS CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_BRAKE_STEER", devices.PDP1, 3109, 120, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS BRAKE STEER")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_RAMP_EMER_CONTR", devices.PDP1, 3110, 121, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS RAMP EMER CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_COMM_ICU", devices.PDP1, 3111, 122, COPILOT_CIRCUIT_BREAKERS, "COMM ICU")
CH_47F:defineCircuitBreaker("CPLT_CB_COMM_L_ICS", devices.PDP1, 3112, 123, COPILOT_CIRCUIT_BREAKERS, "COMM L ICS")
CH_47F:defineCircuitBreaker("CPLT_CB_COMM_UHF_RT", devices.PDP1, 3113, 124, COPILOT_CIRCUIT_BREAKERS, "COMM UHF RT")
CH_47F:defineCircuitBreaker("CPLT_CB_COMM_UHF_SCTY_SET", devices.PDP1, 3114, 125, COPILOT_CIRCUIT_BREAKERS, "COMM UHF SCTY SET")
CH_47F:defineCircuitBreaker("CPLT_CB_COMM_SINCGARS_1_RT", devices.PDP1, 3115, 126, COPILOT_CIRCUIT_BREAKERS, "COMM SINCGARS 1 RT")
CH_47F:defineCircuitBreaker("CPLT_CB_COMM_SINCGARS_1_PWR_AMP", devices.PDP1, 3116, 127, COPILOT_CIRCUIT_BREAKERS, "COMM SINCGARS 1 PWR AMP")
CH_47F:defineCircuitBreaker("CPLT_CB_COMM_IDM", devices.PDP1, 3117, 128, COPILOT_CIRCUIT_BREAKERS, "COMM IDM")
CH_47F:defineCircuitBreaker("CPLT_CB_COMM_BFT", devices.PDP1, 3118, 129, COPILOT_CIRCUIT_BREAKERS, "COMM BFT")
CH_47F:defineCircuitBreaker("CPLT_CB_ANTI_ICE_WSHLD_CPLT_CONTR", devices.PDP1, 3119, 130, COPILOT_CIRCUIT_BREAKERS, "ANTI-ICE WSHLD CPLT CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_ANTI_ICE_WSHLD_CPLT_HTR", devices.PDP1, 3120, 131, COPILOT_CIRCUIT_BREAKERS, "ANTI-ICE WSHLD CPLT HTR")
CH_47F:defineCircuitBreaker("CPLT_CB_ANTI_ICE_PITOT_1_HTR", devices.PDP1, 3121, 132, COPILOT_CIRCUIT_BREAKERS, "ANTI-ICE PITOT 1 HTR")
CH_47F:defineCircuitBreaker("CPLT_CB_NO_1_INSTR_XFMR", devices.PDP1, 3122, 133, COPILOT_CIRCUIT_BREAKERS, "NO 1 INSTR XFMR")
CH_47F:defineCircuitBreaker("CPLT_CB_NO_2_INSTR_XFMR", devices.PDP1, 3123, 134, COPILOT_CIRCUIT_BREAKERS, "NO 2 INSTR XFMR")
CH_47F:defineCircuitBreaker("CPLT_CB_CAAS_MFD_2", devices.PDP1, 3125, 136, COPILOT_CIRCUIT_BREAKERS, "CAAS MFD 2")
CH_47F:defineCircuitBreaker("CPLT_CB_CAAS_MFD_1", devices.PDP1, 3128, 139, COPILOT_CIRCUIT_BREAKERS, "CAAS MFD 1")
CH_47F:defineCircuitBreaker("CPLT_CB_L_PROX_SW", devices.PDP1, 3136, 147, COPILOT_CIRCUIT_BREAKERS, "L PROX SW")
CH_47F:defineCircuitBreaker("CPLT_CB_APU_CONTR_NORM", devices.PDP1, 3137, 148, COPILOT_CIRCUIT_BREAKERS, "APU CONTR NORM")
CH_47F:defineCircuitBreaker("CPLT_CB_APU_CONTR_EMER", devices.PDP1, 3138, 149, COPILOT_CIRCUIT_BREAKERS, "APU CONTR EMER")
CH_47F:defineCircuitBreaker("CPLT_CB_NO_1_EAPS_BYPASS_DOORS", devices.PDP1, 3139, 150, COPILOT_CIRCUIT_BREAKERS, "NO 1 EAPS BYPASS DOORS")
CH_47F:defineCircuitBreaker("CPLT_CB_NO_1_EAPS_FAN_CONTR", devices.PDP1, 3140, 151, COPILOT_CIRCUIT_BREAKERS, "NO 1 EAPS FAN CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_CARGO_HOOK", devices.PDP1, 3146, 157, COPILOT_CIRCUIT_BREAKERS, "LIGHTING CARGO HOOK")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_EMER_EXIT", devices.PDP1, 3147, 158, COPILOT_CIRCUIT_BREAKERS, "LIGHTING EMER EXIT")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_OIL_LVL_CHK", devices.PDP1, 3148, 159, COPILOT_CIRCUIT_BREAKERS, "LIGHTING OIL LVL CHK")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_CABIN_AND_RAMP", devices.PDP1, 3149, 160, COPILOT_CIRCUIT_BREAKERS, "LIGHTING CABIN AND RAMP")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_NVG_FORM", devices.PDP1, 3150, 161, COPILOT_CIRCUIT_BREAKERS, "LIGHTING NVG FORM")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_CPLT_SLT_CONTR", devices.PDP1, 3151, 162, COPILOT_CIRCUIT_BREAKERS, "LIGHTING CPLT SLT CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_CPLT_SLT_FIL", devices.PDP1, 3152, 163, COPILOT_CIRCUIT_BREAKERS, "LIGHTING CPLT SLT FIL")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_CPLT_INSTR", devices.PDP1, 3154, 165, COPILOT_CIRCUIT_BREAKERS, "LIGHTING CPLT INSTR")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_CONSOLE", devices.PDP1, 3155, 166, COPILOT_CIRCUIT_BREAKERS, "LIGHTING CONSOLE")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_OVHD_PNL", devices.PDP1, 3156, 167, COPILOT_CIRCUIT_BREAKERS, "LIGHTING OVHD PNL")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_ILL_SW", devices.PDP1, 3157, 168, COPILOT_CIRCUIT_BREAKERS, "LIGHTING ILL SW")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_FORM", devices.PDP1, 3158, 169, COPILOT_CIRCUIT_BREAKERS, "LIGHTING FORM")
CH_47F:defineCircuitBreaker("CPLT_CB_LIGHTING_SEC_CKPT_LTG_CONTR", devices.PDP1, 3159, 170, COPILOT_CIRCUIT_BREAKERS, "LIGHTING SEC CKPT LTG CONTR")
CH_47F:defineCircuitBreaker("CPLT_CB_HYDRAULICS_NO_1_COOLING_BLOWER", devices.PDP1, 3161, 172, COPILOT_CIRCUIT_BREAKERS, "HYDRAULICS NO 1 COOLING BLOWER")
CH_47F:defineCircuitBreaker("CPLT_CB_BATT_CHRG_1_RCCO", devices.PDP1, 3164, 175, COPILOT_CIRCUIT_BREAKERS, "BATT CHRG 1 RCCO")
CH_47F:defineCircuitBreaker("CPLT_CB_NO_1_DC_AUX_PDP_FEED", devices.PDP1, 3165, 176, COPILOT_CIRCUIT_BREAKERS, "NO 1 DC AUX PDP FEED")

-- Cabin and Ramp Lights Control
local CABIN_RAMP_LIGHTS = "Cabin and Ramp Lights Control"

CH_47F:defineMultipositionSwitch("CABIN_RAMP_LIGHTS_MODE", devices.AFT_WORKSTATION, 3001, 1399, 3, 0.1, CABIN_RAMP_LIGHTS, "Light Mode (NVG/OFF/WHITE)")
CH_47F:definePotentiometer("CABIN_RAMP_LIGHTS_DIM", devices.AFT_WORKSTATION, 3004, 1400, { 0, 1 }, CABIN_RAMP_LIGHTS, "Cabin/Ramp Light Dimmer")

-- Ramp Maintenance Panel
local RAMP_MAINTENANCE_PANEL = "Ramp Maintenance Panel"

CH_47F:defineToggleSwitch("RAMP_MAINT_FLT_CONT", devices.MAINTENANCE_PANEL, 3001, 1034, RAMP_MAINTENANCE_PANEL, "FLT CONT Reservoir (1/2)")
CH_47F:defineMultipositionSwitch("RAMP_MAINT_PWR_ASSR", devices.MAINTENANCE_PANEL, 3003, 1035, 3, 0.1, RAMP_MAINTENANCE_PANEL, "PWR ASSR Test")
CH_47F:defineMultipositionSwitch("RAMP_MAINT_LIGHT_MODE", devices.MAINTENANCE_PANEL, 3007, 1036, 3, 0.1, RAMP_MAINTENANCE_PANEL, "Light Mode (DAY/NIGHT BRT/NIGHT DIM)")
CH_47F:definePushButton("RAMP_MAINT_LEVEL_CHECK", devices.MAINTENANCE_PANEL, 3010, 1037, RAMP_MAINTENANCE_PANEL, "Level Check")
CH_47F:defineSingleCommandRocker("RAMP_MAINT_FAULT_IND", devices.MAINTENANCE_PANEL, 3011, 1038, RAMP_MAINTENANCE_PANEL, "FAULT IND Test")

CH_47F:defineIndicatorLight("RAMP_MAINT_FWD_XMSN_CHIPS", 988, RAMP_MAINTENANCE_PANEL, "Forward Transmission Chips Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_FWD_XMSN_DEBRIS", 989, RAMP_MAINTENANCE_PANEL, "Forward Transmission Debris Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_FWD_XMSN_MAIN_PRESS_LO", 990, RAMP_MAINTENANCE_PANEL, "Forward Transmission Main Pressure Low Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_FWD_XMSN_AUX_PRESS_LO", 991, RAMP_MAINTENANCE_PANEL, "Forward Transmission Auxiliary Pressure Low Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_FWD_XMSN_TEMP_HI", 992, RAMP_MAINTENANCE_PANEL, "Forward Transmission Temperature High Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_ENG1_XMSN_CHIPS", 993, RAMP_MAINTENANCE_PANEL, "Engine 1 Transmission Chips Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_ENG1_XMSN_DEBRIS", 994, RAMP_MAINTENANCE_PANEL, "Engine 1 Transmission Debris Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_ENG1_XMSN_PRESS_LO", 995, RAMP_MAINTENANCE_PANEL, "Engine 1 Transmission Pressure Low Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_ENG1_XMSN_TEMP_HI", 996, RAMP_MAINTENANCE_PANEL, "Engine 1 Transmission Temperature High Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_ENG2_XMSN_CHIPS", 997, RAMP_MAINTENANCE_PANEL, "Engine 2 Transmission Chips Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_ENG2_XMSN_DEBRIS", 998, RAMP_MAINTENANCE_PANEL, "Engine 2 Transmission Debris Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_ENG2_XMSN_PRESS_LO", 999, RAMP_MAINTENANCE_PANEL, "Engine 2 Transmission Pressure Low Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_ENG2_XMSN_TEMP_HI", 1000, RAMP_MAINTENANCE_PANEL, "Engine 2 Transmission Temperature High Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_COMB_XMSN_CHIPS", 1001, RAMP_MAINTENANCE_PANEL, "Combined Transmission Chips Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_COMB_XMSN_L_DEBRIS", 1002, RAMP_MAINTENANCE_PANEL, "Combined Transmission Left Debris Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_COMB_XMSN_R_DEBRIS", 1003, RAMP_MAINTENANCE_PANEL, "Combined Transmission Right Debris Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_COMB_XMSN_MAIN_PRESS_LO", 1004, RAMP_MAINTENANCE_PANEL, "Combined Transmission Main Pressure Low Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_COMB_XMSN_AUX_PRESS_LO", 1005, RAMP_MAINTENANCE_PANEL, "Combined Transmission Auxiliary Pressure Low Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_COMB_XMSN_TEMP_HI", 1006, RAMP_MAINTENANCE_PANEL, "Combined Transmission Temperature High Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_ENG1_CHIPS", 1007, RAMP_MAINTENANCE_PANEL, "Engine 1 Chips Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_ENG2_CHIPS", 1008, RAMP_MAINTENANCE_PANEL, "Engine 2 Chips Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_AFT_XMSN_CHIPS", 1009, RAMP_MAINTENANCE_PANEL, "Aft Transmission Chips Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_AFT_XMSN_DEBRIS", 1010, RAMP_MAINTENANCE_PANEL, "Aft Transmission Debris Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_AFT_XMSN_MAIN_PRESS_LO", 1011, RAMP_MAINTENANCE_PANEL, "Aft Transmission Main Pressure Low Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_AFT_XMSN_AUX_PRESS_LO", 1012, RAMP_MAINTENANCE_PANEL, "Aft Transmission Auxiliary Pressure Low Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_AFT_XMSN_TEMP_HI", 1013, RAMP_MAINTENANCE_PANEL, "Aft Transmission Temperature High Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_AFT_SHAFT_CHIPS", 1014, RAMP_MAINTENANCE_PANEL, "Aft Shaft Chips Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_AFT_SHAFT_PRESS_LO", 1015, RAMP_MAINTENANCE_PANEL, "Aft Shaft Pressure Low Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_L_GND_CONT", 1016, RAMP_MAINTENANCE_PANEL, "Left Ground Contact Lamp (Green)")
CH_47F:defineIndicatorLight("RAMP_MAINT_R_GND_CONT", 1017, RAMP_MAINTENANCE_PANEL, "Right Ground Contact Lamp (Green)")

CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_1_FLTR_CHNG_PRESS", 1018, RAMP_MAINTENANCE_PANEL, "Flight Control 1 FLTR CHNG PRESS Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_1_FLTR_CHNG_RTN", 1019, RAMP_MAINTENANCE_PANEL, "Flight Control 1 FLTR CHNG RTN Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_1_PUMP_FAIL", 1020, RAMP_MAINTENANCE_PANEL, "Flight Control 1 Pump Fail Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_2_FLTR_CHNG_PRESS", 1021, RAMP_MAINTENANCE_PANEL, "Flight Control 2 FLTR CHNG PRESS Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_2_FLTR_CHNG_RTN", 1022, RAMP_MAINTENANCE_PANEL, "Flight Control 2 FLTR CHNG RTN Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_2_PUMP_FAIL", 1023, RAMP_MAINTENANCE_PANEL, "Flight Control 2 Pump Fail Lamp (Yellow)")

CH_47F:defineIndicatorLight("RAMP_MAINT_UTILITY_FLTR_CHNG_PRESS", 1024, RAMP_MAINTENANCE_PANEL, "Utility FLTR CHNG PRESS Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_UTILITY_FLTR_CHNG_RTN", 1025, RAMP_MAINTENANCE_PANEL, "Utility FLTR CHNG RTN Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_UTILITY_APU_PUMP_FAIL", 1026, RAMP_MAINTENANCE_PANEL, "Utility APU Pump Fail Lamp (Yellow)")
CH_47F:defineIndicatorLight("RAMP_MAINT_UTILITY_UTIL_PUMP_FAIL", 1027, RAMP_MAINTENANCE_PANEL, "Utility Pump Fail Lamp (Yellow)")

local function maintenance_panel_gauge_char(dev0, arg_number)
	local value = Module.round(dev0:get_argument_value(arg_number) * 10) - 1
	return value >= 0 and tostring(value) or " "
end

local function maintenance_panel_gauge(dev0, hundreds_arg, tens_arg, ones_arg)
	local hundreds = maintenance_panel_gauge_char(dev0, hundreds_arg)
	local tens = maintenance_panel_gauge_char(dev0, tens_arg)
	local ones = maintenance_panel_gauge_char(dev0, ones_arg)

	return hundreds .. tens .. ones
end

CH_47F:defineFloat("RAMP_MAINT_HYD_GAUGE_BRT", 1039, { 0, 1 }, RAMP_MAINTENANCE_PANEL, "Hydraulic Gauges Display Brightness")

CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_1_PRESS_LIMIT", 1028, RAMP_MAINTENANCE_PANEL, "Flight Control 1 Pressure Limit Lamp (Yellow)")
CH_47F:defineFloat("RAMP_MAINT_FLT_CONT_1_PRESS", 1040, { 0, 0.4 }, RAMP_MAINTENANCE_PANEL, "Flight Control 1 Pressure Gauge")
CH_47F:defineString("RAMP_MAINT_FLT_CONT_1_PRESS_DISPLAY", function(dev0)
	return maintenance_panel_gauge(dev0, 1041, 1042, 1043)
end, 3, RAMP_MAINTENANCE_PANEL, "Flight Control 1 Pressure Readout")

CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_2_PRESS_LIMIT", 1029, RAMP_MAINTENANCE_PANEL, "Flight Control 2 Pressure Limit Lamp (Yellow)")
CH_47F:defineFloat("RAMP_MAINT_FLT_CONT_2_PRESS", 1044, { 0, 0.4 }, RAMP_MAINTENANCE_PANEL, "Flight Control 2 Pressure Gauge")
CH_47F:defineString("RAMP_MAINT_FLT_CONT_2_PRESS_DISPLAY", function(dev0)
	return maintenance_panel_gauge(dev0, 1045, 1046, 1047)
end, 3, RAMP_MAINTENANCE_PANEL, "Flight Control 2 Pressure Readout")

CH_47F:defineIndicatorLight("RAMP_MAINT_UTILITY_PRESS_LIMIT", 1030, RAMP_MAINTENANCE_PANEL, "Utility Pressure Limit Lamp (Yellow)")
CH_47F:defineFloat("RAMP_MAINT_UTILITY_PRESS", 1048, { 0, 0.4 }, RAMP_MAINTENANCE_PANEL, "Utility Pressure Gauge")
CH_47F:defineString("RAMP_MAINT_UTILITY_PRESS_DISPLAY", function(dev0)
	return maintenance_panel_gauge(dev0, 1049, 1050, 1051)
end, 3, RAMP_MAINTENANCE_PANEL, "Utility Pressure Readout")

CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_1_TEMP_LIMIT", 1031, RAMP_MAINTENANCE_PANEL, "Flight Control 1 Temperature Limit Lamp (Yellow)")
CH_47F:defineFloat("RAMP_MAINT_FLT_CONT_1_TEMP", 1052, { 0, 0.4 }, RAMP_MAINTENANCE_PANEL, "Flight Control 1 Temperature Gauge")
CH_47F:defineString("RAMP_MAINT_FLT_CONT_1_TEMP_DISPLAY", function(dev0)
	return maintenance_panel_gauge(dev0, 1053, 1054, 1055)
end, 3, RAMP_MAINTENANCE_PANEL, "Flight Control 1 Temperature Readout")

CH_47F:defineIndicatorLight("RAMP_MAINT_FLT_CONT_2_TEMP_LIMIT", 1032, RAMP_MAINTENANCE_PANEL, "Flight Control 2 Temperature Limit Lamp (Yellow)")
CH_47F:defineFloat("RAMP_MAINT_FLT_CONT_2_TEMP", 1056, { 0, 0.4 }, RAMP_MAINTENANCE_PANEL, "Flight Control 2 Temperature Gauge")
CH_47F:defineString("RAMP_MAINT_FLT_CONT_2_TEMP_DISPLAY", function(dev0)
	return maintenance_panel_gauge(dev0, 1057, 1058, 1059)
end, 3, RAMP_MAINTENANCE_PANEL, "Flight Control 2 Temperature Readout")

CH_47F:defineIndicatorLight("RAMP_MAINT_UTILITY_TEMP_LIMIT", 1033, RAMP_MAINTENANCE_PANEL, "Utility Temperature Limit Lamp (Yellow)")
CH_47F:defineFloat("RAMP_MAINT_UTILITY_TEMP", 1060, { 0, 0.4 }, RAMP_MAINTENANCE_PANEL, "Utility Temperature Gauge")
CH_47F:defineString("RAMP_MAINT_UTILITY_TEMP_DISPLAY", function(dev0)
	return maintenance_panel_gauge(dev0, 1061, 1062, 1063)
end, 3, RAMP_MAINTENANCE_PANEL, "Utility Temperature Readout")

CH_47F:defineFloat("RAMP_MAINT_FLT_CONT_RSVR", 1064, { 0, 0.4 }, RAMP_MAINTENANCE_PANEL, "Flight Control Reservoir Gauge")
CH_47F:defineFloat("RAMP_MAINT_UTILITY_RSVR", 1065, { 0, 0.4 }, RAMP_MAINTENANCE_PANEL, "Utility Reservoir Gauge")

-- Interior Lights
local INTERIOR_LIGHTS = "Interior Lights"

CH_47F:defineFloat("PLT_INT_LIGHT_FLOOD_WHITE", 1346, { 0, 1 }, INTERIOR_LIGHTS, "Pilot Flood Light (White)")
CH_47F:defineFloat("PLT_INT_LIGHT_FLOOD_GREEN", 1347, { 0, 1 }, INTERIOR_LIGHTS, "Pilot Flood Light (Green)")
CH_47F:defineFloat("CPLT_INT_LIGHT_FLOOD_WHITE", 1344, { 0, 1 }, INTERIOR_LIGHTS, "Copilot Flood Light (White)")
CH_47F:defineFloat("CPLT_INT_LIGHT_FLOOD_GREEN", 1345, { 0, 1 }, INTERIOR_LIGHTS, "Copilot Flood Light (Green)")

CH_47F:defineFloat("PLT_INT_LIGHT_OVERHEAD_FLOOD", 1379, { 0, 1 }, INTERIOR_LIGHTS, "Pilot Overhead Console Flood Light (Green)")
CH_47F:defineFloat("CPLT_INT_LIGHT_OVERHEAD_FLOOD", 1378, { 0, 1 }, INTERIOR_LIGHTS, "Copilot Overhead Console Flood Light (Green)")

CH_47F:defineFloat("PLT_INT_LIGHT_DASH_INSTRUMENT", 1372, { 0, 1 }, INTERIOR_LIGHTS, "Pilot Dash Instrument Flood Light (Green)")
CH_47F:defineFloat("PLT_INT_LIGHT_DASH_MFD_IB", 1374, { 0, 1 }, INTERIOR_LIGHTS, "Pilot Dash Inboard MFD Flood Light (Green)")
CH_47F:defineFloat("PLT_INT_LIGHT_DASH_MFD_OB", 1376, { 0, 1 }, INTERIOR_LIGHTS, "Pilot Dash Outboard MFD Flood Light (Green)")

CH_47F:defineFloat("INT_LIGHT_DASH_MFD_CENTER", 1370, { 0, 1 }, INTERIOR_LIGHTS, "Dash Center MFD Flood Light (Green)")

CH_47F:defineFloat("CPLT_INT_LIGHT_DASH_INSTRUMENT", 1368, { 0, 1 }, INTERIOR_LIGHTS, "Copilot Dash Instrument Flood Light (Green)")
CH_47F:defineFloat("CPLT_INT_LIGHT_DASH_MFD_IB", 1366, { 0, 1 }, INTERIOR_LIGHTS, "Copilot Dash Inboard MFD Flood Light (Green)")
CH_47F:defineFloat("CPLT_INT_LIGHT_DASH_MFD_OB", 1364, { 0, 1 }, INTERIOR_LIGHTS, "Copilot Dash Outboard MFD Flood Light (Green)")

CH_47F:defineFloat("LG_INT_LIGHT_EMERGENCY", 1401, { 0, 1 }, INTERIOR_LIGHTS, "Left Gunner Emergency Light (White)")
CH_47F:defineFloat("RG_INT_LIGHT_EMERGENCY", 1405, { 0, 1 }, INTERIOR_LIGHTS, "Right Gunner Emergency Light (White)")
CH_47F:defineFloat("AE_INT_LIGHT_EMERGENCY", 1409, { 0, 1 }, INTERIOR_LIGHTS, "Aft Engineer Emergency Light (White)")

CH_47F:defineFloat("INT_LIGHT_JUMP_FRONT_GREEN", 1440, { 0, 1 }, INTERIOR_LIGHTS, "Front Jump Light (Green)")
CH_47F:defineFloat("INT_LIGHT_JUMP_FRONT_RED", 1441, { 0, 1 }, INTERIOR_LIGHTS, "Front Jump Light (Red)")
CH_47F:defineFloat("INT_LIGHT_JUMP_AFT_GREEN", 1442, { 0, 1 }, INTERIOR_LIGHTS, "Aft Jump Light (Green)")
CH_47F:defineFloat("INT_LIGHT_JUMP_AFT_RED", 1443, { 0, 1 }, INTERIOR_LIGHTS, "Aft Jump Light (Red)")

CH_47F:defineFloat("INT_LIGHT_CARGO_WHITE", 1397, { 0, 1 }, INTERIOR_LIGHTS, "Cargo Hold Lights (White)")
CH_47F:defineFloat("INT_LIGHT_CARGO_GREEN", 1398, { 0, 1 }, INTERIOR_LIGHTS, "Cargo Hold Lights (Green)")

CH_47F:defineFloat("INT_LIGHT_STICK_INDICATOR", 1343, { 0, 1 }, INTERIOR_LIGHTS, "Longitudinal Stick Position Indicator Backlight (Green)")
CH_47F:defineFloat("INT_LIGHT_CENTER_CONSOLE_LPCAP", 1438, { 0, 1 }, INTERIOR_LIGHTS, "PLT/CPLT/TC LPCAP Backlight (Green)")
CH_47F:defineFloat("INT_LIGHT_CANTED_CONSOLE_STEER", 1342, { 0, 1 }, INTERIOR_LIGHTS, "Canted Console/Steer Swivel Backlight (Green)")
CH_47F:defineFloat("INT_LIGHT_OVERHEAD_CONSOLE", 1341, { 0, 1 }, INTERIOR_LIGHTS, "Overhead Console Backlight (Green)")
CH_47F:defineFloat("PLT_INT_LIGHT_MFDS", 1340, { 0, 1 }, INTERIOR_LIGHTS, "Pilot MFDs Backlight (Green)")
CH_47F:defineFloat("INT_LIGHT_CENTER_DASH", 1339, { 0, 1 }, INTERIOR_LIGHTS, "Center MFD/Instruments/Fire Extinguisher Backlight (Green)")
CH_47F:defineFloat("CPLT_INT_LIGHT_MFDS", 1338, { 0, 1 }, INTERIOR_LIGHTS, "Copilot MFDs Backlight (Green)")
CH_47F:defineFloat("PLT_INT_LIGHT_CDU", 1337, { 0, 1 }, INTERIOR_LIGHTS, "Pilot CDU Backlight (Green)")
CH_47F:defineFloat("CPLT_INT_LIGHT_CDU", 1336, { 0, 1 }, INTERIOR_LIGHTS, "Copilot CDU Backlight (Green)")

-- Interior Model
local INTERIOR_MODEL = "Interior Model"

CH_47F:defineFloat("RG_INT_MODEL_DOOR", 1206, { 0, 1 }, INTERIOR_MODEL, "Right Gunner Door Open")
CH_47F:defineFloat("RG_INT_MODEL_STEP", 1207, { 0, 1 }, INTERIOR_MODEL, "Right Gunner Step Open")

CH_47F:defineIndicatorLight("LG_INT_MODEL_WINDOW", 1205, INTERIOR_MODEL, "Left Gunner Window Open")

CH_47F:defineIntegerFromGetter("INT_MODEL_CARGO_SEAT_POSITION", function(dev0)
	local value = dev0:get_argument_value(1330)

	if value < 0.1 then
		return 0
	end

	if value < 0.11 then
		return 1
	end

	if value < 0.2 then
		return 2
	end

	return 3
end, 3, INTERIOR_MODEL, "Cargo Seat Position (OUT/HIDDEN/FOLDING/FOLDED)")

CH_47F:defineFloat("INT_MODEL_HOIST_PANEL_DOOR", 1165, { 0, 1 }, INTERIOR_MODEL, "Hoist Panel Door Open")
CH_47F:defineFloat("INT_MODEL_HOIST_PANEL_LATCHES", 1166, { 0, 1 }, INTERIOR_MODEL, "Hoist Panel Latches Open")

CH_47F:defineFloat("INT_MODEL_RAMP_SKIDS_OUT", 1190, { 0, 1 }, INTERIOR_MODEL, "Ramp Skids Out")
CH_47F:defineFloat("INT_MODEL_RAMP_DOOR", 1188, { 0, 1 }, INTERIOR_MODEL, "Ramp Door")
CH_47F:defineFloat("INT_MODEL_RAMP_DOOR_TOP", 1189, { 0, 1 }, INTERIOR_MODEL, "Ramp Door Top Half (Slide)")
CH_47F:defineIndicatorLightInverted("INT_MODEL_RAMP_CENTER_SKID", 1479, INTERIOR_MODEL, "Ramp Center Skid Present")

-- Exterior Lights
local EXTERIOR_LIGHTS = "Exterior Lights"

CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_NAV_L", 190, EXTERIOR_LIGHTS, "Left Nav Light (Red)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_NAV_R", 191, EXTERIOR_LIGHTS, "Right Nav Light (Green)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_NAV_AFT", 192, EXTERIOR_LIGHTS, "Aft Nav Light (White)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_IR", 193, EXTERIOR_LIGHTS, "IR Lights (Red)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_BOTTOM_FRONT", 194, EXTERIOR_LIGHTS, "Front Undercarriage Light (White)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_BOTTOM_MID", 195, EXTERIOR_LIGHTS, "Middle Undercarriage Light (White)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_BOTTOM_REAR", 196, EXTERIOR_LIGHTS, "Rear Undercarriage Light (White)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_TOP_BEACON", 197, EXTERIOR_LIGHTS, "Top Beacon Light (Red)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_BOTTOM_BEACON", 198, EXTERIOR_LIGHTS, "Bottom Beacon Light (Red)")
CH_47F:defineFloatFromDrawArgument("EXT_LIGHT_TOP_FORMATION", 200, EXTERIOR_LIGHTS, "Top Formation Lights (Blue)")
CH_47F:defineFloatFromDrawArgument("PLT_EXT_LIGHT_SEARCHLIGHT", 209, EXTERIOR_LIGHTS, "Pilot Searchlight (White)")
CH_47F:defineFloatFromDrawArgument("CPLT_EXT_LIGHT_SEARCHLIGHT", 208, EXTERIOR_LIGHTS, "Copilot Searchlight (White)")

-- Exterior Model
local EXTERIOR_MODEL = "Exterior Model"

CH_47F:defineFloatFromDrawArgument("EXT_GEAR_AL_COMPRESS", 1, EXTERIOR_LIGHTS, "Aft Left Gear Strut Compression")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_GEAR_AL_ROT", 2, EXTERIOR_MODEL, "Aft Left Gear Rotation")
CH_47F:defineFloatFromDrawArgument("EXT_GEAR_AR_COMPRESS", 343, EXTERIOR_LIGHTS, "Aft Right Gear Strut Compression")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_GEAR_AR_ROT", 344, EXTERIOR_MODEL, "Aft Right Gear Rotation")
CH_47F:defineFloatFromDrawArgument("EXT_GEAR_FR_COMPRESS", 4, EXTERIOR_LIGHTS, "Forward Right Gear Strut Compression")
CH_47F:defineFloatFromDrawArgument("EXT_GEAR_FL_COMPRESS", 6, EXTERIOR_LIGHTS, "Forward Left Gear Strut Compression")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_SPIN", 40, EXTERIOR_MODEL, "Rotor Position")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_PITCH_COLLECTIVE_FRONT", 274, EXTERIOR_MODEL, "Front Blade Pitch (collective)")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_PITCH_COLLECTIVE_AFT", 275, EXTERIOR_MODEL, "Aft Blade Pitch (collective)")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_FLEX_FRONT_1", 326, EXTERIOR_MODEL, "Front Rotor Blade 1 Flex")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_FLEX_FRONT_2", 327, EXTERIOR_MODEL, "Front Rotor Blade 2 Flex")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_FLEX_FRONT_3", 328, EXTERIOR_MODEL, "Front Rotor Blade 3 Flex")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_FLEX_AFT_1", 329, EXTERIOR_MODEL, "Aft Rotor Blade 1 Flex")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_FLEX_AFT_2", 330, EXTERIOR_MODEL, "Aft Rotor Blade 2 Flex")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_FLEX_AFT_3", 331, EXTERIOR_MODEL, "Aft Rotor Blade 3 Flex")
CH_47F:defineFloatFromDrawArgument("PLT_EXT_SEARCH_LIGHT_PITCH", 423, EXTERIOR_MODEL, "Pilot Search Light Pitch")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("PLT_EXT_SEARCH_LIGHT_ROTATION", 424, EXTERIOR_MODEL, "Pilot Search Light Rotation")
CH_47F:defineFloatFromDrawArgument("CPLT_EXT_SEARCH_LIGHT_PITCH", 425, EXTERIOR_MODEL, "Copilot Search Light Pitch")
CH_47F:defineFullRangeFloatFromExternalDrawArgument("CPLT_EXT_SEARCH_LIGHT_ROTATION", 426, EXTERIOR_MODEL, "Copilot Search Light Rotation")

-- Radios

CH_47F:defineReadWriteRadio("RADIO_ARC_164", devices.ARC_164, 7, 3, 1000, "ARC-164 (UHF)")
CH_47F:defineReadWriteRadio("RADIO_ARC_186", devices.ARC_186, 6, 3, 1000, "ARC-186 (FM1)")
CH_47F:defineReadWriteRadio("RADIO_ARC_201", devices.ARC_201, 6, 3, 1000, "ARC-201 (FM2)")
CH_47F:defineReadWriteRadio("RADIO_ARC_220", devices.ARC_220, 7, 4, 100, "ARC-220 (HF)")

-- CDU Color Colors

CH_47F:defineString("PLT_CDU_LINE1_COLOR", function()
	return plt_cdu_colors[1]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 1 Color")
CH_47F:defineString("PLT_CDU_LINE2_COLOR", function()
	return plt_cdu_colors[2]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 2 Color")
CH_47F:defineString("PLT_CDU_LINE3_COLOR", function()
	return plt_cdu_colors[3]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 3 Color")
CH_47F:defineString("PLT_CDU_LINE4_COLOR", function()
	return plt_cdu_colors[4]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 4 Color")
CH_47F:defineString("PLT_CDU_LINE5_COLOR", function()
	return plt_cdu_colors[5]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 5 Color")
CH_47F:defineString("PLT_CDU_LINE6_COLOR", function()
	return plt_cdu_colors[6]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 6 Color")
CH_47F:defineString("PLT_CDU_LINE7_COLOR", function()
	return plt_cdu_colors[7]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 7 Color")
CH_47F:defineString("PLT_CDU_LINE8_COLOR", function()
	return plt_cdu_colors[8]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 8 Color")
CH_47F:defineString("PLT_CDU_LINE9_COLOR", function()
	return plt_cdu_colors[9]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 9 Color")
CH_47F:defineString("PLT_CDU_LINE10_COLOR", function()
	return plt_cdu_colors[10]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 10 Color")
CH_47F:defineString("PLT_CDU_LINE11_COLOR", function()
	return plt_cdu_colors[11]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 11 Color")
CH_47F:defineString("PLT_CDU_LINE12_COLOR", function()
	return plt_cdu_colors[12]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 12 Color")
CH_47F:defineString("PLT_CDU_LINE13_COLOR", function()
	return plt_cdu_colors[13]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 13 Color")
CH_47F:defineString("PLT_CDU_LINE14_COLOR", function()
	return plt_cdu_colors[14]
end, CDU_LINE_LEN, PILOT_CDU_DISPLAY, "CDU Line 14 Color")

CH_47F:defineString("CPLT_CDU_LINE1_COLOR", function()
	return cplt_cdu_colors[1]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 1 Color")
CH_47F:defineString("CPLT_CDU_LINE2_COLOR", function()
	return cplt_cdu_colors[2]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 2 Color")
CH_47F:defineString("CPLT_CDU_LINE3_COLOR", function()
	return cplt_cdu_colors[3]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 3 Color")
CH_47F:defineString("CPLT_CDU_LINE4_COLOR", function()
	return cplt_cdu_colors[4]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 4 Color")
CH_47F:defineString("CPLT_CDU_LINE5_COLOR", function()
	return cplt_cdu_colors[5]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 5 Color")
CH_47F:defineString("CPLT_CDU_LINE6_COLOR", function()
	return cplt_cdu_colors[6]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 6 Color")
CH_47F:defineString("CPLT_CDU_LINE7_COLOR", function()
	return cplt_cdu_colors[7]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 7 Color")
CH_47F:defineString("CPLT_CDU_LINE8_COLOR", function()
	return cplt_cdu_colors[8]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 8 Color")
CH_47F:defineString("CPLT_CDU_LINE9_COLOR", function()
	return cplt_cdu_colors[9]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 9 Color")
CH_47F:defineString("CPLT_CDU_LINE10_COLOR", function()
	return cplt_cdu_colors[10]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 10 Color")
CH_47F:defineString("CPLT_CDU_LINE11_COLOR", function()
	return cplt_cdu_colors[11]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 11 Color")
CH_47F:defineString("CPLT_CDU_LINE12_COLOR", function()
	return cplt_cdu_colors[12]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 12 Color")
CH_47F:defineString("CPLT_CDU_LINE13_COLOR", function()
	return cplt_cdu_colors[13]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 13 Color")
CH_47F:defineString("CPLT_CDU_LINE14_COLOR", function()
	return cplt_cdu_colors[14]
end, CDU_LINE_LEN, COPILOT_CDU_DISPLAY, "CDU Line 14 Color")

return CH_47F
