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
local PLT_LIGHTING_PANEL = "PLT Lighting Panel"
C_130J:define3PosTumb("PLT_CC_LIGHTING_MASTER_SWITCH", devices.LIGHTING_PANELS, 3029, 1337, PLT_LIGHTING_PANEL, "Lighting Mode Master Switch")
C_130J:defineSpringloaded_3PosTumb("PLT_CC_LIGHTING_ANNUNCIATOR_BRIGHTNESS", devices.LIGHTING_PANELS, 3030, 3030, 1336, PLT_LIGHTING_PANEL, "Annunciator Light Brightness Switch") -- todo: unable to move 0 to 2 or 2 to 0
C_130J:definePotentiometer("PLT_CC_LIGHTING_DOME_BRIGHTNESS", devices.LIGHTING_PANELS, 3017, 1340, { 0, 1 }, PLT_LIGHTING_PANEL, "Cockpit Dome Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_CB_BRIGHTNESS", devices.LIGHTING_PANELS, 3018, 1341, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Circuit Breaker Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_MASTER_DISPLAY_BRIGHTNESS", devices.LIGHTING_PANELS, 3005, 1335, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Master Display Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_PANEL_BACKLIGHTING", devices.LIGHTING_PANELS, 3031, 1342, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Panel Backlighting Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_FLOOD_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3020, 1343, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Panel Flood Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_FLOOR_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3025, 1344, { 0, 1 }, PLT_LIGHTING_PANEL, "Floor Lighting Brightness Knob")

-- Copilot Lighting Panel
local CPLT_LIGHTING_PANEL = "CPLT Lighting Panel"
C_130J:definePotentiometer("CPLT_CC_LIGHTING_CB_BRIGHTNESS", devices.LIGHTING_PANELS, 3019, 1345, { 0, 1 }, CPLT_LIGHTING_PANEL, "Copilot Circuit Breaker Lighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_OVERHEAD_FLOOD_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3026, 1346, { 0, 1 }, CPLT_LIGHTING_PANEL, "Overhead Panel Flood Lighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_OVERHEAD_PANEL_BACKLIGHTING", devices.LIGHTING_PANELS, 3022, 1347, { 0, 1 }, CPLT_LIGHTING_PANEL, "Overhead Panel Backlighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_CONSOLE_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3027, 1348, { 0, 1 }, CPLT_LIGHTING_PANEL, "Center Console Backlighting Brightness Knob")
C_130J:defineSpringloaded_3PosTumb("CPLT_CC_LIGHTING_DISPLAY_LAMP_TEST", devices.LIGHTING_PANELS, 3028, 3028, 1352, CPLT_LIGHTING_PANEL, "Display/Lamp Test Switch") -- todo: unable to move 0 to 2 or 2 to 0
C_130J:definePotentiometer("CPLT_CC_LIGHTING_FLOOD_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3021, 1351, { 0, 1 }, CPLT_LIGHTING_PANEL, "Copilot Panel Flood Lighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_PANEL_BACKLIGHTING", devices.LIGHTING_PANELS, 3032, 1350, { 0, 1 }, CPLT_LIGHTING_PANEL, "Copilot Panel Backlighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_MASTER_DISPLAY_BRIGHTNESS", devices.LIGHTING_PANELS, 3024, 1349, { 0, 1 }, CPLT_LIGHTING_PANEL, "Copilot Master Display Brightness Knob")

-- Radar Control Panel

-- Pilot Intercommunications System Control Panel

-- Copilot Intercommunications System Control Panel

-- Augmented Itercommunications System Control Panel
local AUG_ICS_PANEL = "Augmented Itercommunications System Control Panel"
C_130J:definePotentiometer("AUG_ICS_VOR1_VOLUME", devices.VOLUME_MANAGER, 3098, 249, { 0, 1 }, AUG_ICS_PANEL, "Aug MonVOR 1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_VOR1_BUTTON", devices.VOLUME_MANAGER, 3108, 248, AUG_ICS_PANEL, "Aug MonVOR 1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_TACAN1_VOLUME", devices.VOLUME_MANAGER, 3100, 251, { 0, 1 }, AUG_ICS_PANEL, "Aug MonTACAN 1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_TACAN1_BUTTON", devices.VOLUME_MANAGER, 3110, 250, AUG_ICS_PANEL, "Aug MonTACAN 1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_ADF1_VOLUME", devices.VOLUME_MANAGER, 3102, 253, { 0, 1 }, AUG_ICS_PANEL, "Aug MonADF 1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_ADF1_BUTTON", devices.VOLUME_MANAGER, 3112, 252, AUG_ICS_PANEL, "Aug MonADF 1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_SAR_VOLUME", devices.VOLUME_MANAGER, 3104, 255, { 0, 1 }, AUG_ICS_PANEL, "Aug MonSAR Volume")
C_130J:defineToggleSwitch("AUG_ICS_SAR_BUTTON", devices.VOLUME_MANAGER, 3114, 254, AUG_ICS_PANEL, "Aug MonSAR Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_BCN_VOLUME", devices.VOLUME_MANAGER, 3106, 257, { 0, 1 }, AUG_ICS_PANEL, "Aug MonBCN Volume")
C_130J:defineToggleSwitch("AUG_ICS_BCN_BUTTON", devices.VOLUME_MANAGER, 3116, 256, AUG_ICS_PANEL, "Aug MonBCN Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_VOR2_VOLUME", devices.VOLUME_MANAGER, 3099, 259, { 0, 1 }, AUG_ICS_PANEL, "Aug MonVOR 2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_VOR2_BUTTON", devices.VOLUME_MANAGER, 3109, 258, AUG_ICS_PANEL, "Aug MonVOR 2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_TACAN2_VOLUME", devices.VOLUME_MANAGER, 3101, 261, { 0, 1 }, AUG_ICS_PANEL, "Aug MonTACAN 2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_TACAN2_BUTTON", devices.VOLUME_MANAGER, 3111, 260, AUG_ICS_PANEL, "Aug MonTACAN 2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_ADF2_VOLUME", devices.VOLUME_MANAGER, 3103, 263, { 0, 1 }, AUG_ICS_PANEL, "Aug MonADF 2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_ADF2_BUTTON", devices.VOLUME_MANAGER, 3113, 262, AUG_ICS_PANEL, "Aug MonADF 2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_SPARE_VOLUME", devices.VOLUME_MANAGER, 3105, 265, { 0, 1 }, AUG_ICS_PANEL, "Aug MonSpare Knob")
C_130J:defineToggleSwitch("AUG_ICS_SPARE_BUTTON", devices.VOLUME_MANAGER, 3115, 264, AUG_ICS_PANEL, "Aug MonSpare Button")
C_130J:definePotentiometer("AUG_ICS_RWR_VOLUME", devices.VOLUME_MANAGER, 3107, 267, { 0, 1 }, AUG_ICS_PANEL, "Aug MonRWR Knob")
C_130J:defineToggleSwitch("AUG_ICS_RWR_BUTTON", devices.VOLUME_MANAGER, 3117, 266, AUG_ICS_PANEL, "Aug MonRWR Button")
C_130J:definePotentiometer("AUG_ICS_INTVOLUME", devices.VOLUME_MANAGER, 3118, 269, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSInt Volume")
C_130J:defineToggleSwitch("AUG_ICS_INT_BUTTON", devices.VOLUME_MANAGER, 3132, 268, AUG_ICS_PANEL, "AUG ICSInt Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_H1_VOLUME", devices.VOLUME_MANAGER, 3119, 271, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSH1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_H1_BUTTON", devices.VOLUME_MANAGER, 3133, 270, AUG_ICS_PANEL, "AUG ICSH1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_H2_VOLUME", devices.VOLUME_MANAGER, 3120, 273, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSH2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_H2_BUTTON", devices.VOLUME_MANAGER, 3134, 272, AUG_ICS_PANEL, "AUG ICSH2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_PA_VOLUME", devices.VOLUME_MANAGER, 3121, 275, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSPA Volume")
C_130J:defineToggleSwitch("AUG_ICS_PA_BUTTON", devices.VOLUME_MANAGER, 3135, 274, AUG_ICS_PANEL, "AUG ICSPA Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_PA_GAIN", devices.VOLUME_MANAGER, 3122, 1359, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSPA Gain Knob")
C_130J:definePotentiometer("AUG_ICS_VOX_SENSITIVITY", devices.VOLUME_MANAGER, 3123, 1360, { 0, 1 }, AUG_ICS_PANEL, "Aug ICSVOX Sensitivity")
C_130J:definePotentiometer("AUG_ICS_V1_VOLUME", devices.VOLUME_MANAGER, 3124, 277, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSV1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_V1_BUTTON", devices.VOLUME_MANAGER, 3136, 276, AUG_ICS_PANEL, "AUG ICSV1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_V2_VOLUME", devices.VOLUME_MANAGER, 3125, 279, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSV2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_V2_BUTTON", devices.VOLUME_MANAGER, 3137, 278, AUG_ICS_PANEL, "AUG ICSV2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_SATCOM_VOLUME", devices.VOLUME_MANAGER, 3126, 281, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSSat Volume")
C_130J:defineToggleSwitch("AUG_ICS_SATCOM_BUTTON", devices.VOLUME_MANAGER, 3138, 280, AUG_ICS_PANEL, "AUG ICSSat Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_PVT_VOLUME", devices.VOLUME_MANAGER, 3127, 283, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSPVT Volume")
C_130J:defineToggleSwitch("AUG_ICS_PVT_BUTTON", devices.VOLUME_MANAGER, 3139, 282, AUG_ICS_PANEL, "AUG ICSPVT Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_VOXHM_VOLUME", devices.VOLUME_MANAGER, 3128, 285, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSHM Volume")
C_130J:defineToggleSwitch("AUG_ICS_VOXHM_BUTTON", devices.VOLUME_MANAGER, 3140, 284, AUG_ICS_PANEL, "AUG ICSHM Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_U1_VOLUME", devices.VOLUME_MANAGER, 3129, 287, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSU1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_U1_BUTTON", devices.VOLUME_MANAGER, 3141, 286, AUG_ICS_PANEL, "AUG ICSU1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_U2_VOLUME", devices.VOLUME_MANAGER, 3130, 289, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSU2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_U2_BUTTON", devices.VOLUME_MANAGER, 3142, 288, AUG_ICS_PANEL, "AUG ICSU2 Pull to Monitor")
C_130J:defineRockerSwitch("AUG_ICS_INT_RADIO_ROCKER", devices.VOLUME_MANAGER, 3131, 3131, 3131, 3131, 290, AUG_ICS_PANEL, "AUG ICS Intercom/Radio")
C_130J:defineMultipositionSwitch("AUG_ICS_MIC_MODE", devices.VOLUME_MANAGER, 3143, 297, 4, 0.3, AUG_ICS_PANEL, "AUG ICS Mic Mode")
C_130J:defineTumb("AUG_ICS_TRANSMISSION_SELECTOR", devices.VOLUME_MANAGER, 3144, 298, 1 / 9, { -2 / 9, 7 / 9 }, nil, false, AUG_ICS_PANEL, "AUG ICS Transmit Selector Switch")
C_130J:definePotentiometer("AUG_ICS_MASTER_VOLUME", devices.VOLUME_MANAGER, 3097, 1361, { 0, 1 }, AUG_ICS_PANEL, "Aug ICS Master Volume Knob")

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
