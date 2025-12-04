module("C-130J", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class C_130J: Module
local C_130J = Module:new("C-130J", 0xB000, { "C-130J-30" })

local devices = {
	MAIN_COMPUTER = 1,
	ENGINE_APU_CTRL = 2,
	THROTTLE_SYNC = 3,
	SYNC_MACHINE = 4,
	ELECTRIC_SYSTEM = 5,
	VHF1 = 6,
	UHF1 = 7,
	VHF2 = 8,
	UHF2 = 9,
	HF1 = 10,
	HF2 = 11,
	TACAN1 = 12,
	TACAN2 = 13,
	VORILS1 = 14,
	VORILS2 = 15,
	ADF1 = 16,
	ADF2 = 17,
	WayPointMgr = 18,
	CNBP = 19,
	P_DISPLAYS = 20,
	C_DISPLAYS = 21,
	PFD = 22,
	TAWS_Device = 23,
	RWR = 24,
	P_CNI = 25,
	C_CNI = 26,
	AC_CNI = 27,
	INTERCOM = 28,
	AMU001 = 29,
	AMU002 = 30,
	AMU003 = 31,
	AMU004 = 32,
	PILOT_CPT_INTERFACE = 33,
	COPILOT_CPT_INTERFACE = 34,
	PILOT_HUD_PANEL = 35,
	COPILOT_HUD_PANEL = 36,
	PILOT_REF_MODE_PANEL = 37,
	COPILOT_REF_MODE_PANEL = 38,
	LIGHTING_PANELS = 39,
	ECM = 40,
	MWS = 41,
	CMS_DISPENSER = 42,
	CMS_MGR = 43,
	CURSOR = 44,
	IRCM = 45,
	MECH_INTERFACE = 46,
	J_WORLD = 47,
	CARGO_HANDLER = 48,
	STANDBY = 49,
	WEAPONS = 50,
	IFF = 51,
	AP_INTERFACE = 52,
	AP_MGR = 53,
	DLINK = 54,
	Autopilot = 55,
	HDD001 = 56,
	HDD002 = 57,
	HDD003 = 58,
	HDD004 = 59,
	SOUND_ENG = 60,
	HOTAS_P = 61,
	HOTAS_C = 62,
	INTERCOM_CP = 63,
	FUEL_SYSTEM = 64,
	FADEC = 65,
	APU = 66,
	NAV_RADAR = 67,
	ACAWS = 68,
	VOLUME_MANAGER = 69,
	PLANE_ATM = 70,
	BLEED_AIR = 71,
	HYDRAULICS = 72,
	CDMU = 73,
	SOUNDER = 74,
	SP_RAD = 75,
	TIMER = 76,
	GPS1 = 77,
	GPS2 = 78,
	RADALT_1 = 79,
	RADALT_2 = 80,
	GALLEY = 81,
	OXYGEN = 82,
	PHYSIO = 83,
	INS1 = 84,
	INS2 = 85,
	INS_MGR = 86,
	NVG = 87,
	MECH_GYRO = 88,
	MACROS = 89,
	HEAD = 90,
	STB_COMPASS = 91,
	ARC_210 = 92,
	CAPS = 93,
	AUX_SYNC = 94,
	KNEEBOARD = 95,
	ROUTE_SYNC = 96,
	FAILURE_MGR = 97,
}

-- Flight Station Forward

-- Pilot Side Console

-- Pilot Oxygen Regulator

-- Pilot Intercommunications System Monitor Panel

-- Pilot Side Console END

-- Copilot Side Console

-- Copilot Oxygen Regulator

-- Copilot Intercommunications System Monitor Panel

-- Get-Home Control Panel

-- Copilot Side Console END

-- Main Instrument Panel

-- Parking Brake

-- Pilot Reference Set/Mode Select Panel

-- Copilot Reference Set/Mode Select Panel

-- Left Outer Avionics Management Unit

-- Left Inner Avionics Management Unit

-- Right Inner Avionics Management Unit

-- Right Outer Avionics Management Unit

-- Communication/Navigation/Electronic Circuit Breaker Panel

-- Pilot Mode Annunciator Panel

-- Copilot Mode Annunciator Panel

-- Pilot Inclinometer

-- Copilot Inclinometer

-- Left Outer Head Down Display

-- Left Inner Head Down Display

-- Right Inner Head Down Display

-- Right Outer Head Down Display

-- Hydraulic Control Panel

-- Landing Gear/Landing Lights Panel

-- Flap and Trim Indicator Panel

-- Standby Altimeter/Airspeed Indicator

-- Standby Attitude Indicator

-- Main Instrument Panel END

-- Overhead Console

-- Oxygen Regulator

-- Pilot Reading Light Control

-- Copilot Reading Light Control

-- Augmented Reading Light Control

-- Control Boost Panel

-- Oil Cooler Flaps Panel

-- Electrical Panel

-- Pressurization Panel

-- Fuel Management Panel

-- Air Conditioning Panel

-- Pilot HUD Panel

-- Copilot HUD Panel

-- Wipers/ELT/Emergency Exit Lights Extinguish Panel

-- APU Panel

-- Engine Start Panel

-- Fire Panel

-- FADEC/Prop Control/Prop Sync/ATCS Panel

-- Exterior Lighting Panel

-- Ice Protection Panel

-- Bleed Air Panel

-- Emergency Exit Lights Extinguish

-- Standby Magnetic Compass

-- Overhead Console END

-- Center Console

-- Pilot Lighting Panel

-- Copilot Lighting Panel

-- Radar Control Panel
local RADAR_CONTROL_PANEL = "Radar Control Panel"
C_130J:defineMultipositionSwitch("PNT_RCP_MASTER_485", devices.NAV_RADAR, 3001, 485, 3, 0.4, RADAR_CONTROL_PANEL, "Radar Master Power Switch")
C_130J:definePushButton("PNT_RCP_PRCN_398", devices.NAV_RADAR, 3010, 398, RADAR_CONTROL_PANEL, "Radar PRCN Mode Switch")
C_130J:definePushButton("PNT_RCP_MAP_399", devices.NAV_RADAR, 3011, 399, RADAR_CONTROL_PANEL, "Radar MAP Mode Switch")
C_130J:definePushButton("PNT_RCP_WX_400", devices.NAV_RADAR, 3012, 400, RADAR_CONTROL_PANEL, "Radar WX Mode Switch")
C_130J:definePushButton("PNT_RCP_SP_401", devices.NAV_RADAR, 3013, 401, RADAR_CONTROL_PANEL, "Radar SP Mode Switch")
C_130J:definePushButton("PNT_RCP_MGM_402", devices.NAV_RADAR, 3014, 402, RADAR_CONTROL_PANEL, "Radar MGM Mode Switch")
C_130J:definePushButton("PNT_RCP_WS_403", devices.NAV_RADAR, 3015, 403, RADAR_CONTROL_PANEL, "Radar WS Mode Switch")
C_130J:definePushButton("PNT_RCP_BCN_404", devices.NAV_RADAR, 3016, 404, RADAR_CONTROL_PANEL, "Radar BCN Mode Switch")
C_130J:defineMultipositionSwitch("PNT_INTENSITY_SEL_486", devices.NAV_RADAR, 3002, 486, 4, 0.3, RADAR_CONTROL_PANEL, "Intensity Target Select Switch")
C_130J:definePushButton("PNT_RCP_PSEL_405", devices.NAV_RADAR, 3009, 405, RADAR_CONTROL_PANEL, "Radar PSEL Mode Switch")
C_130J:defineRockerSwitch("PNT_RCP_INTENSITY_INC_UP_410", devices.NAV_RADAR, 3003, 3003, 3003, 3003, 410, RADAR_CONTROL_PANEL, "Radar Intensity Increase")
C_130J:defineRockerSwitch("PNT_RCP_INTENSITY_INC_DN_410", devices.NAV_RADAR, 3003, 3003, 3003, 3003, 410, RADAR_CONTROL_PANEL, "Radar Intensity Decrease")
C_130J:defineRockerSwitch("PNT_RCP_GAIN_INC_UP_411", devices.NAV_RADAR, 3004, 3004, 3004, 3004, 411, RADAR_CONTROL_PANEL, "Radar Gain Increase")
C_130J:defineRockerSwitch("PNT_RCP_GAIN_INC_DN_411", devices.NAV_RADAR, 3004, 3004, 3004, 3004, 411, RADAR_CONTROL_PANEL, "Radar Gain Decrease")
C_130J:definePushButton("PNT_RCP_OFS_406", devices.NAV_RADAR, 3005, 406, RADAR_CONTROL_PANEL, "Radar OFS Mode Switch")
C_130J:definePushButton("PNT_RCP_FRZ_407", devices.NAV_RADAR, 3006, 407, RADAR_CONTROL_PANEL, "Radar FRZ Mode Switch")
C_130J:definePushButton("PNT_RCP_PEN_408", devices.NAV_RADAR, 3007, 408, RADAR_CONTROL_PANEL, "Radar PEN Mode Switch")
C_130J:definePushButton("PNT_RCP_SCTR_409", devices.NAV_RADAR, 3008, 409, RADAR_CONTROL_PANEL, "Radar SCTR Mode Switch")

-- Pilot Intercommunications System Control Panel

-- Copilot Intercommunications System Control Panel

-- Augmented Itercommunications System Control Panel

-- Pilot Communication/Navigation/Identification Management Unit

-- Copilot Communication/Navigation/Identification Management Unit

-- Augmented Communication/Navigation/Identification Management Unit

-- Pilot Remote Heading and Course Selector

-- Copilot Remote Heading and Course Selector

-- Throttle Quadrant

-- Cursor Control Panel

-- Wing Flaps Control Quadrant

-- Augmented Intercommunications System Monitor Panel

-- Trim Panel

-- Defensive Systems Panel

-- Aerial Delivery Panel

-- Automatic Flight Control System Panel

-- ARC-210

-- Center Console END

-- Nosewheel Steering

-- Pilot Yoke

-- Copilot Yoke

-- Flight Station Forward END

-- Loadmaster Station

-- TODO: panel, circuit breakers, crew door handle

-- Loadmaster Station End

-- Interior Lights

-- Interior Model

-- Exterior Lights

-- Exterior Model

-- Radios

-- Seat Position

return C_130J
