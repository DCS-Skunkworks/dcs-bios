module("MiG-29A", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class MiG_29A: Module
local MiG_29A = Module:new("MiG-29 Fulcrum", 0x3c00, { "MiG-29 Fulcrum" })

local devices = {
	FM_PROXY = 1,
	SNSR_SYS_INTERFACE = 2,
	ELEC_INTERFACE = 3,
	CONTROL_INTERFACE = 4,
	FUEL_INTERFACE = 5,
	POWER_PLANT_INTERFACE = 6,
	OXYGEN_INTERFACE = 7,
	HEARING_SENS = 8,
	AIR_INTERFACE = 9,
	HYDRO_INTERFACE = 10,
	AFCS_INTERFACE = 11,
	EXTLIGHTS_SYSTEM = 12,
	INTLIGHTS_SYSTEM = 13,
	EKRAN = 14,
	INPUT_PANEL = 15,
	CLOCK = 16,
	BAROMETRIC_ALTIMETER = 17,
	VVI_TURN_SLIP = 18,
	IAS = 19,
	TAS = 20,
	AOA_G_METER = 21,
	HSI = 22,
	ADI = 23,
	COMBINED_PRESSURE = 24,
	BRAKE_PRESSURE = 25,
	FUEL_INDICATOR = 26,
	RPM_INDICATOR = 27,
	EXHAUST_GAS_LEFT = 28,
	EXHAUST_GAS_RIGHT = 29,
	RAMP_POS_INDICATOR = 30,
	VOLTMETER = 31,
	STANDBY_COMPASS = 32,
	RADALT = 33,
	INS = 34,
	HOTAS = 35,
	CPT_MECH = 36,
	HEAD_WRAPPER = 37,
	MUX = 38,
	NAV = 39,
	CP = 40,
	WP = 41,
	DP = 42,
	HMS = 43,
	QOLS = 44,
	RADAR = 45,
	WEAPONS = 46,
	L006LM = 47,
	HMD = 48,
	HUD = 49,
	HDD = 50,
	VHF_UHF_R862 = 51,
	VHF_R855UM = 52,
	MRP = 53,
	ARK = 54,
	RSBN = 55,
	VIWAS = 56,
	INTERCOM = 57,
	MACROS = 58,
	KNEEBOARD = 59,
	CREW_ANIMATION = 60,
	VISOR = 61,
	TRANSPONDER = 62,
	INTERROGATOR = 63,
	SO69 = 64,
}

-- Stick

-- Throttle

-- Pedals

-- Control & Test pannel

-- Electrical power pannel

-- System power pannel

-- Engine & APU start pannel

-- AFT lightning control panel

-- FWD lightning control pane

-- Lights controls (external)

-- AOA

-- Master caution

-- Air speed

-- Altimiter

-- Flaps / Landing gear indicator

-- ADI

-- HSI

-- Combined indicator (VVI/Turn/Slip indicator)

-- TAS indicator

-- Clock

-- ADF mode toggle switch

-- Nose wheel brake

-- Radar altimiter

-- Counter measure pannel

-- Gas temperature meters

-- Fuel flow indicator

-- Combined oxygen indicator

-- Combined pressure indicator

-- Air duct ramp indicator

-- RPM indicator

-- Voltmeter

-- Hydrolique pressure

-- SPO-15 RWR

-- Canopy jettison

-- Canopy indicator

-- Cabine air controls

-- Tally light pannel

-- A-323 Navigation control pannel

-- Lower center console

-- Oxygen system
local O2_SYSTEM = "Oxygen System"

MiG_29A:defineToggleSwitch("OXYGEN_FLOW_VALVE", devices.AIR_INTERFACE, 3017, 106, O2_SYSTEM, "Oxygen Flow Valve")
MiG_29A:defineToggleSwitch("OXYGEN_MIX_SWITCH", devices.AIR_INTERFACE, 3018, 115, O2_SYSTEM, "Oxygen Mixture Switch")
MiG_29A:defineToggleSwitch("OXYGEN_EMERGENCY_SWITCH", devices.AIR_INTERFACE, 3020, 117, O2_SYSTEM, "Oxygen Emergency Switch")
MiG_29A:defineToggleSwitch("OXYGEN_VENT_HELMET_SWITCH", devices.AIR_INTERFACE, 3022, 119, O2_SYSTEM, "Oxygen Vent Helmet Switch")
MiG_29A:defineToggleSwitch("OXYGEN_CABIN_EMERGENCY_DECOMPRESSION_SWITCH", devices.AIR_INTERFACE, 3014, 247, O2_SYSTEM, "Cabin Emergency Decompression Switch")

-- Air conditionning

-- Emergency control pannel

-- Flaps controls

-- R-862 VHF / UHF control pannel

-- ADF control pannel

-- Engine emergency pannel

-- PSR-31 Weapon controls panel
local WEAPONS_CONTROL = "PSR-31 Weapon Control Panel"

MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_MASTER_ARM", devices.INPUT_PANEL, 3011, 526, WEAPONS_CONTROL, "Master Arm Switch")
MiG_29A:define3PosTumb("WEAPONS_CONTROL_RADAR_ZONE_SWITCH", devices.INPUT_PANEL, 3006, 525, WEAPONS_CONTROL, "Radar Operating Zone Wwitch (LEFT/CENTER/RIGHT)")
MiG_29A:definePotentiometer("WEAPONS_CONTROL_IR_GAIN_HEML_BRIGHT_KNOB", devices.INPUT_PANEL, 3008, 524, { 0, 1 }, WEAPONS_CONTROL, "IR Gain / Helmet Brightness Knob")
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_MISSILE_PREPARE_SWITCH", devices.INPUT_PANEL, 3013, 527, WEAPONS_CONTROL, "Missile Launch Preparation Mode (AUTO/MAN)")
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_BURST_MODE_SWITCH", devices.WP, 3012, 521, WEAPONS_CONTROL, "Burst Mode Switch (ALL/SINGLE 0.5 ALL)")
MiG_29A:definePotentiometer("WEAPONS_CONTROL_WING_SPAN_KNOB", devices.INPUT_PANEL, 3001, 520, { 0, 1 }, WEAPONS_CONTROL, "Target Wing Span Knob")
MiG_29A:defineMultipositionSwitch("WEAPONS_CONTROL_WCS_MODES_SELECTOR", devices.INPUT_PANEL, 3004, 523, 8, 0.1, WEAPONS_CONTROL, "WCS Modes Selector Knob (TOSS/NAV/RAD/IR/CC/HELM/OPT/BS)")

-- AFCS Autopilot control pannel

-- PUR-31 Radar control pannel

-- HUD control pannel (With sun visor controls)

-- HDD control pannel

-- Canopy controls

-- Refueling pannel

-- EKRAN warning system

-- Voice information and warning system (VIWAS) controls

-- Left wall

-- Chut controls

-- Mirrors

-- Emergency landing gear

-- Weapon settings pannel

-- Ejection handle

-- Interior Lights

-- Interior Model

-- Exterior Lights

-- Exterior Model

-- Radios

return MiG_29A
