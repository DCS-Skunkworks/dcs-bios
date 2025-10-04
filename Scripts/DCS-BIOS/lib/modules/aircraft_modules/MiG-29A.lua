module("MiG-29A", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class MiG_29A: Module
local MiG_29A = Module:new("MiG-29A", 0x3c00, { "MiG-29A" })

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

-- Flight controls

-- Control & Test pannel

-- Electrical power pannel

-- System power pannel

-- Engine & APU start pannel

-- Illumination controls (internal)

-- Lights controls (external)

-- RHAW SPO-15 RWR

-- Caution/Warning light pannel

-- A-323 Navigation control pannel

-- Indicators & Instruments

-- Oxygen system

-- Air conditionning

-- Emergency control pannel

-- Flaps controls

-- R-862 VHF / UHF control pannel

-- ADF control pannel

-- Engine emergency pannel

-- PSR-31 Weapon controls panel

-- AFCS Autopilot control pannel

-- PUR-31 Radar control pannel

-- HUD control pannel

-- HDD control pannel

-- Countermeasures control panel

-- Canopy controls

-- Refueling pannel

-- AEKRAN warning system

-- Voice information and warning system (VIWAS) controls

-- Guidance system panel (Not available)

-- IFF transponder (Not available)

-- KD system panel (Not available)

return MiG_29A
