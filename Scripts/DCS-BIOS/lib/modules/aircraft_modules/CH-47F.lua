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
	ADC = 9,
	DTU = 10,
	CAAS = 11,
	FADEC1 = 12,
	FADEC2 = 13,
	FM_PROXY = 14,
	CONTROLS = 15,
	GUNNER_STATIONS = 16,
	PDP1 = 17,
	PDP2 = 18,
	OVERHEAD_CONSOLE = 19,
	CENTRAL_CONSOLE = 20,
	CANTED_CONSOLE = 21,
	SFD1 = 22,
	SFD2 = 23,
	MAINTENANCE_PANEL = 24,
	CHRONOMETER = 25,
	COMPASS = 26,
	EXTERNAL_CARGO_EQUIPMENT = 27,
	EXTERNAL_CARGO_SPEECH = 28,
	GRIPS = 29,
	HEATER = 30,
	EMERGENCY_PANEL = 31,
	LIGHTING_REFLECTS = 32,
	TERTIARY_REFLECTS = 33,
	FD = 34,
	TURN = 35,
	GPS1 = 36,
	GPS2 = 37,
	EGI1 = 38,
	EGI2 = 39,
	TACAN = 40,
	ILS = 41,
	MLS = 42,
	MARKER_BEACON = 43,
	ARN_147 = 44,
	ARN_149 = 45,
	APN_209 = 46,
	ANV_241A = 47,
	ARC_164 = 48,
	ARC_186 = 49,
	ARC_201 = 50,
	ARC_220 = 51,
	COMM_PANEL_LEFT = 52,
	COMM_PANEL_RIGHT = 53,
	COMM_PANEL_TROOP_COMMANDER = 54,
	COMM_PANEL_LH_GUNNER = 55,
	COMM_PANEL_RH_GUNNER = 56,
	COMM_PANEL_AFT_ENGINEER = 57,
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
-- local STEERING_PANEL = "Steering Control Panel"

-- Pilot Low Profile Control Audio Panel
-- local PILOT_AUDIO_PANEL = "PLT Low Profile Audio Panel"

-- Copilot Low Profile Control Audio Panel
-- local COPILOT_AUDIO_PANEL = "CPLT Low Profile Audio Panel"

-- Troop Commander Low Profile Control Audio Panel
-- local TC_AUDIO_PANEL = "TC Low Profile Audio Panel"

-- Left Gunner Low Profile Control Audio Panel
-- local LG_AUDIO_PANEL = "Gunner (L) Low Profile Audio Panel"

-- Right Gunner Low Profile Control Audio Panel
-- local RG_AUDIO_PANEL = "Gunner (R) Low Profile Audio Panel"

-- Aft Engineer Low Profile Control Audio Panel
-- local AE_AUDIO_PANEL = "Ramp Low Profile Audio Panel"

-- Pilot Cyclic
-- local PILOT_CYCLIC = "PLT Cyclic"

-- Copilot Cyclic
-- local COPILOT_CYCLIC = "CPLT Cyclic"

-- Pilot Thrust Lever
-- local PILOT_THRUST = "PLT Thrust Lever"

-- Copilot Thrust Lever
-- local COPILOT_THRUST = "CPLT Thrust Lever"

-- Pilot Multi-Function Control Unit
-- local PILOT_MF_UNIT = "PLT Multi-Function Control Unit"

-- Copilot Multi-Function Control Unit
-- local COPILOT_MF_UNIT = "CPLT Multi-Function Control Unit"

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
