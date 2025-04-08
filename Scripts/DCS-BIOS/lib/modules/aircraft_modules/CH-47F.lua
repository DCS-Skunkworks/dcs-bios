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
	self:defineRockerSwitch(identifier, device_id, command, command, command, command, arg_number, category, description)
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
-- local PILOT_CDU = "PLT CDU"

-- Copilot CDU
-- local COPILOT_CDU = "CPLT CDU"

-- Miscellaneous Switch Control Panel
-- local CANTED_MISC_SWITCH_PANEL = "Canted Console Misc Switch Control Panel"

-- Emergency/Auxiliary Control Panel
-- local EMERGENCY_AUX_PANEL = "Emergency/Auxiliary Control Panel"

-- DAFCS Panel
-- local DAFCS_PANEL = "DAFCS Panel"

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
