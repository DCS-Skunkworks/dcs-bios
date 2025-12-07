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

-- Radar Control Panel

-- Pilot Intercommunications System Control Panel
local PLT_ICS_PANEL = "PLT Intercommunications System Control Panel"
C_130J:definePotentiometer("PLT_ICS_INT_VOLUME", devices.VOLUME_MANAGER, 3002, 205, { 0, 1 }, PLT_ICS_PANEL, "Pilot INT Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_INT_BUTTON", devices.VOLUME_MANAGER, 3016, 204, PLT_ICS_PANEL, "Pilot INT Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_H1_VOLUME", devices.VOLUME_MANAGER, 3003, 207, { 0, 1 }, PLT_ICS_PANEL, "Pilot HF 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_H1_BUTTON", devices.VOLUME_MANAGER, 3017, 206, PLT_ICS_PANEL, "Pilot HF 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_H2_VOLUME", devices.VOLUME_MANAGER, 3004, 209, { 0, 1 }, PLT_ICS_PANEL, "Pilot HF 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_H2_BUTTON", devices.VOLUME_MANAGER, 3018, 208, PLT_ICS_PANEL, "Pilot HF 2 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_PA_VOLUME", devices.VOLUME_MANAGER, 3005, 211, { 0, 1 }, PLT_ICS_PANEL, "Pilot PA Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_PA_BUTTON", devices.VOLUME_MANAGER, 3019, 210, PLT_ICS_PANEL, "Pilot PA Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_PA_GAIN", devices.VOLUME_MANAGER, 3006, 1353, { 0, 1 }, PLT_ICS_PANEL, "Pilot PA GAIN Knob")
C_130J:definePotentiometer("PLT_ICS_VOX_SENSITIVITY", devices.VOLUME_MANAGER, 3007, 1354, { 0, 1 }, PLT_ICS_PANEL, "Pilot VOX Sensitivity Knob")
C_130J:definePotentiometer("PLT_ICS_V1_VOLUME", devices.VOLUME_MANAGER, 3008, 213, { 0, 1 }, PLT_ICS_PANEL, "Pilot VHF 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_V1_BUTTON", devices.VOLUME_MANAGER, 3020, 212, PLT_ICS_PANEL, "Pilot VHF 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_V2_VOLUME", devices.VOLUME_MANAGER, 3009, 215, { 0, 1 }, PLT_ICS_PANEL, "Pilot VHF 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_V2_BUTTON", devices.VOLUME_MANAGER, 3021, 214, PLT_ICS_PANEL, "Pilot VHF 2 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_SATCOM_VOLUME", devices.VOLUME_MANAGER, 3010, 217, { 0, 1 }, PLT_ICS_PANEL, "Pilot SAT Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_SATCOM_BUTTON", devices.VOLUME_MANAGER, 3022, 216, PLT_ICS_PANEL, "Pilot SAT Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_PVT_VOLUME", devices.VOLUME_MANAGER, 3011, 219, { 0, 1 }, PLT_ICS_PANEL, "Pilot PVT Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_PVT_BUTTON", devices.VOLUME_MANAGER, 3023, 218, PLT_ICS_PANEL, "Pilot PVT Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_VOXHM_VOLUME", devices.VOLUME_MANAGER, 3012, 221, { 0, 1 }, PLT_ICS_PANEL, "Pilot VOX/HM Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_VOXHM_BUTTON", devices.VOLUME_MANAGER, 3024, 220, PLT_ICS_PANEL, "Pilot VOX/HM Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_U1_VOLUME", devices.VOLUME_MANAGER, 3013, 223, { 0, 1 }, PLT_ICS_PANEL, "Pilot UHF 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_U1_BUTTON", devices.VOLUME_MANAGER, 3025, 222, PLT_ICS_PANEL, "Pilot UHF 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_U2_VOLUME", devices.VOLUME_MANAGER, 3014, 225, { 0, 1 }, PLT_ICS_PANEL, "Pilot UHF 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_U2_BUTTON", devices.VOLUME_MANAGER, 3026, 224, PLT_ICS_PANEL, "Pilot UHF 2 Pull to Monitor")
C_130J:defineRockerSwitch("PLT_ICS_INT_RADIO_ROCKER", devices.VOLUME_MANAGER, 3015, 3015, 3015, 3015, 291, PLT_ICS_PANEL, "Pilot Intercom/Radio Transmit")
C_130J:defineMultipositionSwitch("PLT_ICS_INTERPHONE_MODE", devices.VOLUME_MANAGER, 3027, 293, 4, 0.3, PLT_ICS_PANEL, "Pilot Interphone Mode Switch")
C_130J:defineTumb("PLT_ICS_TRANSMISSION_SELECTOR", devices.VOLUME_MANAGER, 3028, 294, 1 / 9, { -2 / 9, 7 / 9 }, nil, false, PLT_ICS_PANEL, "Pilot Transmission Selector Switch")
C_130J:definePotentiometer("PLT_ICS_MASTER_VOLUME", devices.VOLUME_MANAGER, 3001, 1355, { 0, 1 }, PLT_ICS_PANEL, "Pilot Master Volume Knob")

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
