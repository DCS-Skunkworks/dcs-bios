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

function C_130J:defineIndicatorLight(identifier, arg_number, category, description)
	self:defineGatedIndicatorLight(identifier, arg_number, 0.01, nil, category, description)
end

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
local RADAR_CONTROL_PANEL = "Radar Control Panel"
C_130J:defineMultipositionSwitch("RCP_MASTER_POWER", devices.NAV_RADAR, 3001, 485, 3, 0.4, RADAR_CONTROL_PANEL, "Radar Master Power Switch")
C_130J:definePushButton("RCP_PRCN_MODE", devices.NAV_RADAR, 3010, 398, RADAR_CONTROL_PANEL, "Radar PRCN Mode Switch")
C_130J:definePushButton("RCP_MAP_MODE", devices.NAV_RADAR, 3011, 399, RADAR_CONTROL_PANEL, "Radar MAP Mode Switch")
C_130J:definePushButton("RCP_WX_MODE", devices.NAV_RADAR, 3012, 400, RADAR_CONTROL_PANEL, "Radar WX Mode Switch")
C_130J:definePushButton("RCP_SP_MODE", devices.NAV_RADAR, 3013, 401, RADAR_CONTROL_PANEL, "Radar SP Mode Switch")
C_130J:definePushButton("RCP_MGM_MODE", devices.NAV_RADAR, 3014, 402, RADAR_CONTROL_PANEL, "Radar MGM Mode Switch")
C_130J:definePushButton("RCP_WS_MODE", devices.NAV_RADAR, 3015, 403, RADAR_CONTROL_PANEL, "Radar WS Mode Switch")
C_130J:definePushButton("RCP_BCN_MODE", devices.NAV_RADAR, 3016, 404, RADAR_CONTROL_PANEL, "Radar BCN Mode Switch")
C_130J:defineMultipositionSwitch("RCP_INTENSITY_TARGET", devices.NAV_RADAR, 3002, 486, 4, 0.3, RADAR_CONTROL_PANEL, "Intensity Target Select Switch")
C_130J:definePushButton("RCP_PSEL_MODE", devices.NAV_RADAR, 3009, 405, RADAR_CONTROL_PANEL, "Radar PSEL Mode Switch")
C_130J:defineRockerSwitch("RCP_INTENSITY_ROCKER", devices.NAV_RADAR, 3003, 3003, 3003, 3003, 410, RADAR_CONTROL_PANEL, "Radar Intensity Increase/Decrease")
C_130J:defineRockerSwitch("RCP_GAIN_ROCKER", devices.NAV_RADAR, 3004, 3004, 3004, 3004, 411, RADAR_CONTROL_PANEL, "Radar Gain Increase/Decrease")
C_130J:definePushButton("RCP_OFS_MODE", devices.NAV_RADAR, 3005, 406, RADAR_CONTROL_PANEL, "Radar OFS Mode Switch")
C_130J:definePushButton("RCP_FRZ_MODE", devices.NAV_RADAR, 3006, 407, RADAR_CONTROL_PANEL, "Radar FRZ Mode Switch")
C_130J:definePushButton("RCP_PEN_MODE", devices.NAV_RADAR, 3007, 408, RADAR_CONTROL_PANEL, "Radar PEN Mode Switch")
C_130J:definePushButton("RCP_SCTR_MODE", devices.NAV_RADAR, 3008, 409, RADAR_CONTROL_PANEL, "Radar SCTR Mode Switch")
C_130J:defineIndicatorLight("RCP_PRCN_MODE_LED", 4077, RADAR_CONTROL_PANEL, "Radar PRCN Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_MAP_MODE_LED", 4078, RADAR_CONTROL_PANEL, "Radar MAP Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_WX_MODE_LED", 4079, RADAR_CONTROL_PANEL, "Radar WX Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_SP_MODE_LED", 4080, RADAR_CONTROL_PANEL, "Radar SP Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_MGM_MODE_LED", 4081, RADAR_CONTROL_PANEL, "Radar MGM Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_WS_MODE_LED", 4082, RADAR_CONTROL_PANEL, "Radar WS Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_BCN_MODE_LED", 4083, RADAR_CONTROL_PANEL, "Radar BCN Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_PSEL_MODE_LED", 4084, RADAR_CONTROL_PANEL, "Radar PSEL Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_OFS_MODE_LED", 4085, RADAR_CONTROL_PANEL, "Radar OFS Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_FRZ_MODE_LED", 4086, RADAR_CONTROL_PANEL, "Radar FRZ Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_PEN_MODE_LED", 4087, RADAR_CONTROL_PANEL, "Radar PEN Mode Switch Led (Green)")
C_130J:defineIndicatorLight("RCP_SCTR_MODE_LED", 4088, RADAR_CONTROL_PANEL, "Radar SCTR Mode Switch Led (Green)")

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
local CPLT_ICS_PANEL = "CPLT Intercommunications System Control Panel"
C_130J:definePotentiometer("CPLT_ICS_INT_VOLUME", devices.VOLUME_MANAGER, 3030, 227, { 0, 1 }, CPLT_ICS_PANEL, "Copilot INT Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_INT_BUTTON", devices.VOLUME_MANAGER, 3044, 226, CPLT_ICS_PANEL, "Copilot INT Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_H1_VOLUME", devices.VOLUME_MANAGER, 3031, 229, { 0, 1 }, CPLT_ICS_PANEL, "Copilot HF 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_H1_BUTTON", devices.VOLUME_MANAGER, 3045, 228, CPLT_ICS_PANEL, "Copilot HF 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_H2_VOLUME", devices.VOLUME_MANAGER, 3032, 231, { 0, 1 }, CPLT_ICS_PANEL, "Copilot HF 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_H2_BUTTON", devices.VOLUME_MANAGER, 3046, 230, CPLT_ICS_PANEL, "Copilot HF 2 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_PA_VOLUME", devices.VOLUME_MANAGER, 3033, 233, { 0, 1 }, CPLT_ICS_PANEL, "Copilot PA Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_PA_BUTTON", devices.VOLUME_MANAGER, 3047, 232, CPLT_ICS_PANEL, "Copilot PA Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_PA_GAIN", devices.VOLUME_MANAGER, 3034, 1356, { 0, 1 }, CPLT_ICS_PANEL, "Copilot PA GAIN Knob")
C_130J:definePotentiometer("CPLT_ICS_VOX_SENSITIVITY", devices.VOLUME_MANAGER, 3035, 1357, { 0, 1 }, CPLT_ICS_PANEL, "Copilot VOX Sensitivity Knob")
C_130J:definePotentiometer("CPLT_ICS_V1_VOLUME", devices.VOLUME_MANAGER, 3036, 235, { 0, 1 }, CPLT_ICS_PANEL, "Copilot VHF 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_V1_BUTTON", devices.VOLUME_MANAGER, 3048, 234, CPLT_ICS_PANEL, "Copilot VHF 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_V2_VOLUME", devices.VOLUME_MANAGER, 3037, 237, { 0, 1 }, CPLT_ICS_PANEL, "Copilot VHF 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_V2_BUTTON", devices.VOLUME_MANAGER, 3049, 236, CPLT_ICS_PANEL, "Copilot VHF 2 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_SATCOM_VOLUME", devices.VOLUME_MANAGER, 3038, 239, { 0, 1 }, CPLT_ICS_PANEL, "Copilot SAT Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_SATCOM_BUTTON", devices.VOLUME_MANAGER, 3050, 238, CPLT_ICS_PANEL, "Copilot SAT Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_PVT_VOLUME", devices.VOLUME_MANAGER, 3039, 241, { 0, 1 }, CPLT_ICS_PANEL, "Copilot PVT Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_PVT_BUTTON", devices.VOLUME_MANAGER, 3051, 240, CPLT_ICS_PANEL, "Copilot PVT Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_VOXHM_VOLUME", devices.VOLUME_MANAGER, 3040, 243, { 0, 1 }, CPLT_ICS_PANEL, "Copilot VOX/HM Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_VOXHM_BUTTON", devices.VOLUME_MANAGER, 3052, 242, CPLT_ICS_PANEL, "Copilot VOX/HM Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_U1_VOLUME", devices.VOLUME_MANAGER, 3041, 245, { 0, 1 }, CPLT_ICS_PANEL, "Copilot UHF 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_U1_BUTTON", devices.VOLUME_MANAGER, 3053, 244, CPLT_ICS_PANEL, "Copilot UHF 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_U2_VOLUME", devices.VOLUME_MANAGER, 3042, 247, { 0, 1 }, CPLT_ICS_PANEL, "Copilot UHF 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_U2_BUTTON", devices.VOLUME_MANAGER, 3054, 246, CPLT_ICS_PANEL, "Copilot UHF 2 Pull to Monitor")
C_130J:defineRockerSwitch("CPLT_ICS_INT_RADIO_ROCKER", devices.VOLUME_MANAGER, 3043, 3043, 3043, 3043, 292, CPLT_ICS_PANEL, "Copilot Intercom/Radio Transmit")
C_130J:defineMultipositionSwitch("CPLT_ICS_INTERPHONE_MODE", devices.VOLUME_MANAGER, 3055, 295, 4, 0.3, CPLT_ICS_PANEL, "Copilot Interphone Mode Switch")
C_130J:defineTumb("CPLT_ICS_TRANSMISSION_SELECTOR", devices.VOLUME_MANAGER, 3056, 296, 1 / 9, { -2 / 9, 7 / 9 }, nil, false, CPLT_ICS_PANEL, "Copilot Transmission Selector Switch")
C_130J:definePotentiometer("CPLT_ICS_MASTER_VOLUME", devices.VOLUME_MANAGER, 3029, 1358, { 0, 1 }, CPLT_ICS_PANEL, "Copilot Master Volume Knob")

-- Augmented Intercommunications System Control Panel
local AUG_ICS_PANEL = "Augmented Intercommunications System Control Panel"
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
local PLT_CNI_MU = "Pilot Communication/Navigation/Identification Management Unit"
C_130J:definePushButton("PLT_CNI_LSK_L1", devices.P_CNI, 3001, 1100, PLT_CNI_MU, "Pilot CNI-MU LSK L1")
C_130J:definePushButton("PLT_CNI_LSK_L2", devices.P_CNI, 3002, 1101, PLT_CNI_MU, "Pilot CNI-MU LSK L2")
C_130J:definePushButton("PLT_CNI_LSK_L3", devices.P_CNI, 3003, 1102, PLT_CNI_MU, "Pilot CNI-MU LSK L3")
C_130J:definePushButton("PLT_CNI_LSK_L4", devices.P_CNI, 3004, 1103, PLT_CNI_MU, "Pilot CNI-MU LSK L4")
C_130J:definePushButton("PLT_CNI_LSK_L5", devices.P_CNI, 3005, 1104, PLT_CNI_MU, "Pilot CNI-MU LSK L5")
C_130J:definePushButton("PLT_CNI_LSK_L6", devices.P_CNI, 3006, 1105, PLT_CNI_MU, "Pilot CNI-MU LSK L6")
C_130J:definePushButton("PLT_CNI_LSK_R1", devices.P_CNI, 3007, 1106, PLT_CNI_MU, "Pilot CNI-MU LSK R1")
C_130J:definePushButton("PLT_CNI_LSK_R2", devices.P_CNI, 3008, 1107, PLT_CNI_MU, "Pilot CNI-MU LSK R2")
C_130J:definePushButton("PLT_CNI_LSK_R3", devices.P_CNI, 3009, 1108, PLT_CNI_MU, "Pilot CNI-MU LSK R3")
C_130J:definePushButton("PLT_CNI_LSK_R4", devices.P_CNI, 3010, 1109, PLT_CNI_MU, "Pilot CNI-MU LSK R4")
C_130J:definePushButton("PLT_CNI_LSK_R5", devices.P_CNI, 3011, 1110, PLT_CNI_MU, "Pilot CNI-MU LSK R5")
C_130J:definePushButton("PLT_CNI_LSK_R6", devices.P_CNI, 3012, 1111, PLT_CNI_MU, "Pilot CNI-MU LSK R6")
C_130J:definePushButton("PLT_CNI_COMM_TUNE", devices.P_CNI, 3013, 1112, PLT_CNI_MU, "Pilot CNI-MU COMM TUNE Key")
C_130J:definePushButton("PLT_CNI_NAV_TUNE", devices.P_CNI, 3022, 1113, PLT_CNI_MU, "Pilot CNI-MU NAV TUNE Key")
C_130J:definePushButton("PLT_CNI_IFF", devices.P_CNI, 3021, 1114, PLT_CNI_MU, "Pilot CNI-MU IFF Key")
C_130J:definePushButton("PLT_CNI_NAV_CTRL", devices.P_CNI, 3015, 1115, PLT_CNI_MU, "Pilot CNI-MU NAV CTRL Key")
C_130J:definePushButton("PLT_CNI_MSN", devices.P_CNI, 3023, 1116, PLT_CNI_MU, "Pilot CNI-MU MSN Key")
C_130J:definePushButton("PLT_CNI_DIR_INTC", devices.P_CNI, 3018, 1117, PLT_CNI_MU, "Pilot CNI-MU DIR INTC Key")
C_130J:definePushButton("PLT_CNI_TOLD", devices.P_CNI, 3014, 1118, PLT_CNI_MU, "Pilot CNI-MU TOLD Key")
C_130J:definePushButton("PLT_CNI_INDX", devices.P_CNI, 3016, 1119, PLT_CNI_MU, "Pilot CNI-MU INDX Key")
C_130J:definePushButton("PLT_CNI_MC_INDX", devices.P_CNI, 3017, 1120, PLT_CNI_MU, "Pilot CNI-MU MC INDX Key")
C_130J:definePushButton("PLT_CNI_CAPS", devices.P_CNI, 3024, 1121, PLT_CNI_MU, "Pilot CNI-MU CAPS Key")
C_130J:definePushButton("PLT_CNI_EXEC", devices.P_CNI, 3025, 1122, PLT_CNI_MU, "Pilot CNI-MU EXEC Key")
C_130J:definePushButton("PLT_CNI_LEGS", devices.P_CNI, 3019, 1123, PLT_CNI_MU, "Pilot CNI-MU LEGS Key")
C_130J:definePushButton("PLT_CNI_MARK", devices.P_CNI, 3020, 1124, PLT_CNI_MU, "Pilot CNI-MU MARK Key")
C_130J:definePushButton("PLT_CNI_PREV_PAGE", devices.P_CNI, 3027, 1125, PLT_CNI_MU, "Pilot CNI-MU PREV PAGE Key")
C_130J:definePushButton("PLT_CNI_NEXT_PAGE", devices.P_CNI, 3026, 1126, PLT_CNI_MU, "Pilot CNI-MU NEXT PAGE Key")
C_130J:defineRockerSwitch("PLT_CNI_BRT_ROCKER", devices.P_CNI, 3070, 3070, 3071, 3071, 1127, PLT_CNI_MU, "Pilot CNI-MU BRT")
C_130J:definePushButton("PLT_CNI_KBD_1", devices.P_CNI, 3031, 1128, PLT_CNI_MU, "Pilot CNI-MU 1 Key")
C_130J:definePushButton("PLT_CNI_KBD_2", devices.P_CNI, 3032, 1129, PLT_CNI_MU, "Pilot CNI-MU 2 Key")
C_130J:definePushButton("PLT_CNI_KBD_3", devices.P_CNI, 3033, 1130, PLT_CNI_MU, "Pilot CNI-MU 3 Key")
C_130J:definePushButton("PLT_CNI_KBD_4", devices.P_CNI, 3034, 1131, PLT_CNI_MU, "Pilot CNI-MU 4 Key")
C_130J:definePushButton("PLT_CNI_KBD_5", devices.P_CNI, 3035, 1132, PLT_CNI_MU, "Pilot CNI-MU 5 Key")
C_130J:definePushButton("PLT_CNI_KBD_6", devices.P_CNI, 3036, 1133, PLT_CNI_MU, "Pilot CNI-MU 6 Key")
C_130J:definePushButton("PLT_CNI_KBD_7", devices.P_CNI, 3037, 1134, PLT_CNI_MU, "Pilot CNI-MU 7 Key")
C_130J:definePushButton("PLT_CNI_KBD_8", devices.P_CNI, 3038, 1135, PLT_CNI_MU, "Pilot CNI-MU 8 Key")
C_130J:definePushButton("PLT_CNI_KBD_9", devices.P_CNI, 3039, 1136, PLT_CNI_MU, "Pilot CNI-MU 9 Key")
C_130J:definePushButton("PLT_CNI_KBD_0", devices.P_CNI, 3030, 1137, PLT_CNI_MU, "Pilot CNI-MU 0 Key")
C_130J:definePushButton("PLT_CNI_KBD_DOT", devices.P_CNI, 3040, 1138, PLT_CNI_MU, "Pilot CNI-MU . Key")
C_130J:definePushButton("PLT_CNI_KBD_PLUSMINUS", devices.P_CNI, 3041, 1139, PLT_CNI_MU, "Pilot CNI-MU +/- Key")
C_130J:definePushButton("PLT_CNI_KBD_A", devices.P_CNI, 3042, 1140, PLT_CNI_MU, "Pilot CNI-MU A Key")
C_130J:definePushButton("PLT_CNI_KBD_B", devices.P_CNI, 3043, 1141, PLT_CNI_MU, "Pilot CNI-MU B Key")
C_130J:definePushButton("PLT_CNI_KBD_C", devices.P_CNI, 3044, 1142, PLT_CNI_MU, "Pilot CNI-MU C Key")
C_130J:definePushButton("PLT_CNI_KBD_D", devices.P_CNI, 3045, 1143, PLT_CNI_MU, "Pilot CNI-MU D Key")
C_130J:definePushButton("PLT_CNI_KBD_E", devices.P_CNI, 3046, 1144, PLT_CNI_MU, "Pilot CNI-MU E Key")
C_130J:definePushButton("PLT_CNI_KBD_F", devices.P_CNI, 3047, 1145, PLT_CNI_MU, "Pilot CNI-MU F Key")
C_130J:definePushButton("PLT_CNI_KBD_G", devices.P_CNI, 3048, 1146, PLT_CNI_MU, "Pilot CNI-MU G Key")
C_130J:definePushButton("PLT_CNI_KBD_H", devices.P_CNI, 3049, 1147, PLT_CNI_MU, "Pilot CNI-MU H Key")
C_130J:definePushButton("PLT_CNI_KBD_I", devices.P_CNI, 3050, 1148, PLT_CNI_MU, "Pilot CNI-MU I Key")
C_130J:definePushButton("PLT_CNI_KBD_J", devices.P_CNI, 3051, 1149, PLT_CNI_MU, "Pilot CNI-MU J Key")
C_130J:definePushButton("PLT_CNI_KBD_K", devices.P_CNI, 3052, 1150, PLT_CNI_MU, "Pilot CNI-MU K Key")
C_130J:definePushButton("PLT_CNI_KBD_L", devices.P_CNI, 3053, 1151, PLT_CNI_MU, "Pilot CNI-MU L Key")
C_130J:definePushButton("PLT_CNI_KBD_M", devices.P_CNI, 3054, 1152, PLT_CNI_MU, "Pilot CNI-MU M Key")
C_130J:definePushButton("PLT_CNI_KBD_N", devices.P_CNI, 3055, 1153, PLT_CNI_MU, "Pilot CNI-MU N Key")
C_130J:definePushButton("PLT_CNI_KBD_O", devices.P_CNI, 3056, 1154, PLT_CNI_MU, "Pilot CNI-MU O Key")
C_130J:definePushButton("PLT_CNI_KBD_P", devices.P_CNI, 3057, 1155, PLT_CNI_MU, "Pilot CNI-MU P Key")
C_130J:definePushButton("PLT_CNI_KBD_Q", devices.P_CNI, 3058, 1156, PLT_CNI_MU, "Pilot CNI-MU Q Key")
C_130J:definePushButton("PLT_CNI_KBD_R", devices.P_CNI, 3059, 1157, PLT_CNI_MU, "Pilot CNI-MU R Key")
C_130J:definePushButton("PLT_CNI_KBD_S", devices.P_CNI, 3060, 1158, PLT_CNI_MU, "Pilot CNI-MU S Key")
C_130J:definePushButton("PLT_CNI_KBD_T", devices.P_CNI, 3061, 1159, PLT_CNI_MU, "Pilot CNI-MU T Key")
C_130J:definePushButton("PLT_CNI_KBD_U", devices.P_CNI, 3062, 1160, PLT_CNI_MU, "Pilot CNI-MU U Key")
C_130J:definePushButton("PLT_CNI_KBD_V", devices.P_CNI, 3063, 1161, PLT_CNI_MU, "Pilot CNI-MU V Key")
C_130J:definePushButton("PLT_CNI_KBD_W", devices.P_CNI, 3064, 1162, PLT_CNI_MU, "Pilot CNI-MU W Key")
C_130J:definePushButton("PLT_CNI_KBD_X", devices.P_CNI, 3065, 1163, PLT_CNI_MU, "Pilot CNI-MU X Key")
C_130J:definePushButton("PLT_CNI_KBD_Y", devices.P_CNI, 3066, 1164, PLT_CNI_MU, "Pilot CNI-MU Y Key")
C_130J:definePushButton("PLT_CNI_KBD_Z", devices.P_CNI, 3067, 1165, PLT_CNI_MU, "Pilot CNI-MU Z Key")
C_130J:definePushButton("PLT_CNI_KBD_SLASH", devices.P_CNI, 3068, 1168, PLT_CNI_MU, "Pilot CNI-MU / Key")
C_130J:definePushButton("PLT_CNI_KBD_DEL", devices.P_CNI, 3028, 1167, PLT_CNI_MU, "Pilot CNI-MU DEL Key")
C_130J:definePushButton("PLT_CNI_KBD_CLR", devices.P_CNI, 3029, 1169, PLT_CNI_MU, "Pilot CNI-MU CLR Key")
C_130J:defineIndicatorLight("PLT_CNI_DSPY_LED", 4137, PLT_CNI_MU, "Pilot CNI-MU DSPY Light (Green)")
C_130J:defineIndicatorLight("PLT_CNI_MSG_LED", 4138, PLT_CNI_MU, "Pilot CNI-MU MSG Light (Green)")
C_130J:defineIndicatorLight("PLT_CNI_FAIL_LED", 4139, PLT_CNI_MU, "Pilot CNI-MU FAIL Light (Yellow)")
C_130J:defineIndicatorLight("PLT_CNI_OFSET_LED", 4140, PLT_CNI_MU, "Pilot CNI-MU OFSET Light (Green)")
C_130J:defineFloat("PLT_CNI_EXEC_LED", 3390, { 0, 1 }, PLT_CNI_MU, "Pilot CNI-MU EXEC Light (Green)")

-- Copilot Communication/Navigation/Identification Management Unit
local CPLT_CNI_MU = "Copilot Communication/Navigation/Identification Management Unit"
C_130J:definePushButton("CPLT_CNI_LSK_L1", devices.C_CNI, 3001, 1170, CPLT_CNI_MU, "Copilot CNI-MU LSK L1")
C_130J:definePushButton("CPLT_CNI_LSK_L2", devices.C_CNI, 3002, 1171, CPLT_CNI_MU, "Copilot CNI-MU LSK L2")
C_130J:definePushButton("CPLT_CNI_LSK_L3", devices.C_CNI, 3003, 1172, CPLT_CNI_MU, "Copilot CNI-MU LSK L3")
C_130J:definePushButton("CPLT_CNI_LSK_L4", devices.C_CNI, 3004, 1173, CPLT_CNI_MU, "Copilot CNI-MU LSK L4")
C_130J:definePushButton("CPLT_CNI_LSK_L5", devices.C_CNI, 3005, 1174, CPLT_CNI_MU, "Copilot CNI-MU LSK L5")
C_130J:definePushButton("CPLT_CNI_LSK_L6", devices.C_CNI, 3006, 1175, CPLT_CNI_MU, "Copilot CNI-MU LSK L6")
C_130J:definePushButton("CPLT_CNI_LSK_R1", devices.C_CNI, 3007, 1176, CPLT_CNI_MU, "Copilot CNI-MU L1169SK R1")
C_130J:definePushButton("CPLT_CNI_LSK_R2", devices.C_CNI, 3008, 1177, CPLT_CNI_MU, "Copilot CNI-MU LSK R2")
C_130J:definePushButton("CPLT_CNI_LSK_R3", devices.C_CNI, 3009, 1178, CPLT_CNI_MU, "Copilot CNI-MU LSK R3")
C_130J:definePushButton("CPLT_CNI_LSK_R4", devices.C_CNI, 3010, 1179, CPLT_CNI_MU, "Copilot CNI-MU LSK R4")
C_130J:definePushButton("CPLT_CNI_LSK_R5", devices.C_CNI, 3011, 1180, CPLT_CNI_MU, "Copilot CNI-MU LSK R5")
C_130J:definePushButton("CPLT_CNI_LSK_R6", devices.C_CNI, 3012, 1181, CPLT_CNI_MU, "Copilot CNI-MU LSK R6")
C_130J:definePushButton("CPLT_CNI_COMM_TUNE", devices.C_CNI, 3013, 1182, CPLT_CNI_MU, "Copilot CNI-MU COMM TUNE Key")
C_130J:definePushButton("CPLT_CNI_NAV_TUNE", devices.C_CNI, 3022, 1183, CPLT_CNI_MU, "Copilot CNI-MU NAV TUNE Key")
C_130J:definePushButton("CPLT_CNI_IFF", devices.C_CNI, 3021, 1184, CPLT_CNI_MU, "Copilot CNI-MU IFF Key")
C_130J:definePushButton("CPLT_CNI_NAV_CTRL", devices.C_CNI, 3015, 1185, CPLT_CNI_MU, "Copilot CNI-MU NAV CTRL Key")
C_130J:definePushButton("CPLT_CNI_MSN", devices.C_CNI, 3023, 1186, CPLT_CNI_MU, "Copilot CNI-MU MSN Key")
C_130J:definePushButton("CPLT_CNI_DIR_INTC", devices.C_CNI, 3018, 1187, CPLT_CNI_MU, "Copilot CNI-MU DIR INTC Key")
C_130J:definePushButton("CPLT_CNI_TOLD", devices.C_CNI, 3014, 1188, CPLT_CNI_MU, "Copilot CNI-MU TOLD Key")
C_130J:definePushButton("CPLT_CNI_INDX", devices.C_CNI, 3016, 1189, CPLT_CNI_MU, "Copilot CNI-MU INDX Key")
C_130J:definePushButton("CPLT_CNI_MC_INDX", devices.C_CNI, 3017, 1190, CPLT_CNI_MU, "Copilot CNI-MU MC INDX Key")
C_130J:definePushButton("CPLT_CNI_CAPS", devices.C_CNI, 3024, 1191, CPLT_CNI_MU, "Copilot CNI-MU CAPS Key")
C_130J:definePushButton("CPLT_CNI_EXEC", devices.C_CNI, 3025, 1192, CPLT_CNI_MU, "Copilot CNI-MU EXEC Key")
C_130J:definePushButton("CPLT_CNI_LEGS", devices.C_CNI, 3019, 1193, CPLT_CNI_MU, "Copilot CNI-MU LEGS Key")
C_130J:definePushButton("CPLT_CNI_MARK", devices.C_CNI, 3020, 1194, CPLT_CNI_MU, "Copilot CNI-MU MARK Key")
C_130J:definePushButton("CPLT_CNI_PREV_PAGE", devices.C_CNI, 3027, 1195, CPLT_CNI_MU, "Copilot CNI-MU PREV PAGE Key")
C_130J:definePushButton("CPLT_CNI_NEXT_PAGE", devices.C_CNI, 3026, 1196, CPLT_CNI_MU, "Copilot CNI-MU NEXT PAGE Key")
C_130J:defineRockerSwitch("CPLT_CNI_BRT_ROCKER", devices.C_CNI, 3070, 3070, 3071, 3071, 1197, CPLT_CNI_MU, "Copilot CNI-MU BRT")
C_130J:definePushButton("CPLT_CNI_KBD_1", devices.C_CNI, 3031, 1198, CPLT_CNI_MU, "Copilot CNI-MU 1 Key")
C_130J:definePushButton("CPLT_CNI_KBD_2", devices.C_CNI, 3032, 1199, CPLT_CNI_MU, "Copilot CNI-MU 2 Key")
C_130J:definePushButton("CPLT_CNI_KBD_3", devices.C_CNI, 3033, 1200, CPLT_CNI_MU, "Copilot CNI-MU 3 Key")
C_130J:definePushButton("CPLT_CNI_KBD_4", devices.C_CNI, 3034, 1201, CPLT_CNI_MU, "Copilot CNI-MU 4 Key")
C_130J:definePushButton("CPLT_CNI_KBD_5", devices.C_CNI, 3035, 1202, CPLT_CNI_MU, "Copilot CNI-MU 5 Key")
C_130J:definePushButton("CPLT_CNI_KBD_6", devices.C_CNI, 3036, 1203, CPLT_CNI_MU, "Copilot CNI-MU 6 Key")
C_130J:definePushButton("CPLT_CNI_KBD_7", devices.C_CNI, 3037, 1204, CPLT_CNI_MU, "Copilot CNI-MU 7 Key")
C_130J:definePushButton("CPLT_CNI_KBD_8", devices.C_CNI, 3038, 1205, CPLT_CNI_MU, "Copilot CNI-MU 8 Key")
C_130J:definePushButton("CPLT_CNI_KBD_9", devices.C_CNI, 3039, 1206, CPLT_CNI_MU, "Copilot CNI-MU 9 Key")
C_130J:definePushButton("CPLT_CNI_KBD_0", devices.C_CNI, 3030, 1207, CPLT_CNI_MU, "Copilot CNI-MU 0 Key")
C_130J:definePushButton("CPLT_CNI_KBD_DOT", devices.C_CNI, 3040, 1208, CPLT_CNI_MU, "Copilot CNI-MU . Key")
C_130J:definePushButton("CPLT_CNI_KBD_PLUSMINUS", devices.C_CNI, 3041, 1209, CPLT_CNI_MU, "Copilot CNI-MU +/- Key")
C_130J:definePushButton("CPLT_CNI_KBD_A", devices.C_CNI, 3042, 1210, CPLT_CNI_MU, "Copilot CNI-MU A Key")
C_130J:definePushButton("CPLT_CNI_KBD_B", devices.C_CNI, 3043, 1211, CPLT_CNI_MU, "Copilot CNI-MU B Key")
C_130J:definePushButton("CPLT_CNI_KBD_C", devices.C_CNI, 3044, 1212, CPLT_CNI_MU, "Copilot CNI-MU C Key")
C_130J:definePushButton("CPLT_CNI_KBD_D", devices.C_CNI, 3045, 1213, CPLT_CNI_MU, "Copilot CNI-MU D Key")
C_130J:definePushButton("CPLT_CNI_KBD_E", devices.C_CNI, 3046, 1214, CPLT_CNI_MU, "Copilot CNI-MU E Key")
C_130J:definePushButton("CPLT_CNI_KBD_F", devices.C_CNI, 3047, 1215, CPLT_CNI_MU, "Copilot CNI-MU F Key")
C_130J:definePushButton("CPLT_CNI_KBD_G", devices.C_CNI, 3048, 1216, CPLT_CNI_MU, "Copilot CNI-MU G Key")
C_130J:definePushButton("CPLT_CNI_KBD_H", devices.C_CNI, 3049, 1217, CPLT_CNI_MU, "Copilot CNI-MU H Key")
C_130J:definePushButton("CPLT_CNI_KBD_I", devices.C_CNI, 3050, 1218, CPLT_CNI_MU, "Copilot CNI-MU I Key")
C_130J:definePushButton("CPLT_CNI_KBD_J", devices.C_CNI, 3051, 1219, CPLT_CNI_MU, "Copilot CNI-MU J Key")
C_130J:definePushButton("CPLT_CNI_KBD_K", devices.C_CNI, 3052, 1220, CPLT_CNI_MU, "Copilot CNI-MU K Key")
C_130J:definePushButton("CPLT_CNI_KBD_L", devices.C_CNI, 3053, 1221, CPLT_CNI_MU, "Copilot CNI-MU L Key")
C_130J:definePushButton("CPLT_CNI_KBD_M", devices.C_CNI, 3054, 1222, CPLT_CNI_MU, "Copilot CNI-MU M Key")
C_130J:definePushButton("CPLT_CNI_KBD_N", devices.C_CNI, 3055, 1223, CPLT_CNI_MU, "Copilot CNI-MU N Key")
C_130J:definePushButton("CPLT_CNI_KBD_O", devices.C_CNI, 3056, 1224, CPLT_CNI_MU, "Copilot CNI-MU O Key")
C_130J:definePushButton("CPLT_CNI_KBD_P", devices.C_CNI, 3057, 1225, CPLT_CNI_MU, "Copilot CNI-MU P Key")
C_130J:definePushButton("CPLT_CNI_KBD_Q", devices.C_CNI, 3058, 1226, CPLT_CNI_MU, "Copilot CNI-MU Q Key")
C_130J:definePushButton("CPLT_CNI_KBD_R", devices.C_CNI, 3059, 1227, CPLT_CNI_MU, "Copilot CNI-MU R Key")
C_130J:definePushButton("CPLT_CNI_KBD_S", devices.C_CNI, 3060, 1228, CPLT_CNI_MU, "Copilot CNI-MU S Key")
C_130J:definePushButton("CPLT_CNI_KBD_T", devices.C_CNI, 3061, 1229, CPLT_CNI_MU, "Copilot CNI-MU T Key")
C_130J:definePushButton("CPLT_CNI_KBD_U", devices.C_CNI, 3062, 1230, CPLT_CNI_MU, "Copilot CNI-MU U Key")
C_130J:definePushButton("CPLT_CNI_KBD_V", devices.C_CNI, 3063, 1231, CPLT_CNI_MU, "Copilot CNI-MU V Key")
C_130J:definePushButton("CPLT_CNI_KBD_W", devices.C_CNI, 3064, 1232, CPLT_CNI_MU, "Copilot CNI-MU W Key")
C_130J:definePushButton("CPLT_CNI_KBD_X", devices.C_CNI, 3065, 1233, CPLT_CNI_MU, "Copilot CNI-MU X Key")
C_130J:definePushButton("CPLT_CNI_KBD_Y", devices.C_CNI, 3066, 1234, CPLT_CNI_MU, "Copilot CNI-MU Y Key")
C_130J:definePushButton("CPLT_CNI_KBD_Z", devices.C_CNI, 3067, 1235, CPLT_CNI_MU, "Copilot CNI-MU Z Key")
C_130J:definePushButton("CPLT_CNI_KBD_SLASH", devices.C_CNI, 3068, 1238, CPLT_CNI_MU, "Copilot CNI-MU / Key")
C_130J:definePushButton("CPLT_CNI_KBD_DEL", devices.C_CNI, 3028, 1237, CPLT_CNI_MU, "Copilot CNI-MU DEL Key")
C_130J:definePushButton("CPLT_CNI_KBD_CLR", devices.C_CNI, 3029, 1239, CPLT_CNI_MU, "Copilot CNI-MU CLR Key")
C_130J:defineIndicatorLight("CPLT_CNI_DSPY_LED", 4141, CPLT_CNI_MU, "Copilot CNI-MU DSPY Light (Green)")
C_130J:defineIndicatorLight("CPLT_CNI_MSG_LED", 4142, CPLT_CNI_MU, "Copilot CNI-MU MSG Light (Green)")
C_130J:defineIndicatorLight("CPLT_CNI_FAIL_LED", 4143, CPLT_CNI_MU, "Copilot CNI-MU FAIL Light (Yellow)")
C_130J:defineIndicatorLight("CPLT_CNI_OFSET_LED", 4144, CPLT_CNI_MU, "Copilot CNI-MU OFSET Light (Green)")
C_130J:defineFloat("CPLT_CNI_EXEC_LED", 3392, { 0, 1 }, CPLT_CNI_MU, "Copilot CNI-MU EXEC Light (Green)")

-- Augmented Communication/Navigation/Identification Management Unit
local AUG_CNI_MU = "Augmented Communication/Navigation/Identification Management Unit"
C_130J:definePushButton("AUG_CNI_LSK_L1", devices.AC_CNI, 3001, 1240, AUG_CNI_MU, "Aug Crew CNI-MU LSK L1")
C_130J:definePushButton("AUG_CNI_LSK_L2", devices.AC_CNI, 3002, 1241, AUG_CNI_MU, "Aug Crew CNI-MU LSK L2")
C_130J:definePushButton("AUG_CNI_LSK_L3", devices.AC_CNI, 3003, 1242, AUG_CNI_MU, "Aug Crew CNI-MU LSK L3")
C_130J:definePushButton("AUG_CNI_LSK_L4", devices.AC_CNI, 3004, 1243, AUG_CNI_MU, "Aug Crew CNI-MU LSK L4")
C_130J:definePushButton("AUG_CNI_LSK_L5", devices.AC_CNI, 3005, 1244, AUG_CNI_MU, "Aug Crew CNI-MU LSK L5")
C_130J:definePushButton("AUG_CNI_LSK_L6", devices.AC_CNI, 3006, 1245, AUG_CNI_MU, "Aug Crew CNI-MU LSK L6")
C_130J:definePushButton("AUG_CNI_LSK_R1", devices.AC_CNI, 3007, 1246, AUG_CNI_MU, "Aug Crew CNI-MU LSK R1")
C_130J:definePushButton("AUG_CNI_LSK_R2", devices.AC_CNI, 3008, 1247, AUG_CNI_MU, "Aug Crew CNI-MU LSK R2")
C_130J:definePushButton("AUG_CNI_LSK_R3", devices.AC_CNI, 3009, 1248, AUG_CNI_MU, "Aug Crew CNI-MU LSK R3")
C_130J:definePushButton("AUG_CNI_LSK_R4", devices.AC_CNI, 3010, 1249, AUG_CNI_MU, "Aug Crew CNI-MU LSK R4")
C_130J:definePushButton("AUG_CNI_LSK_R5", devices.AC_CNI, 3011, 1250, AUG_CNI_MU, "Aug Crew CNI-MU LSK R5")
C_130J:definePushButton("AUG_CNI_LSK_R6", devices.AC_CNI, 3012, 1251, AUG_CNI_MU, "Aug Crew CNI-MU LSK R6")
C_130J:definePushButton("AUG_CNI_COMM_TUNE", devices.AC_CNI, 3013, 1252, AUG_CNI_MU, "Aug Crew CNI-MU COMM TUNE Key")
C_130J:definePushButton("AUG_CNI_NAV_TUNE", devices.AC_CNI, 3022, 1253, AUG_CNI_MU, "Aug Crew CNI-MU NAV TUNE Key")
C_130J:definePushButton("AUG_CNI_IFF", devices.AC_CNI, 3021, 1254, AUG_CNI_MU, "Aug Crew CNI-MU IFF Key")
C_130J:definePushButton("AUG_CNI_NAV_CTRL", devices.AC_CNI, 3015, 1255, AUG_CNI_MU, "Aug Crew CNI-MU NAV CTRL Key")
C_130J:definePushButton("AUG_CNI_MSN", devices.AC_CNI, 3023, 1256, AUG_CNI_MU, "Aug Crew CNI-MU MSN Key")
C_130J:definePushButton("AUG_CNI_DIR_INTC", devices.AC_CNI, 3018, 1257, AUG_CNI_MU, "Aug Crew CNI-MU DIR INTC Key")
C_130J:definePushButton("AUG_CNI_TOLD", devices.AC_CNI, 3014, 1258, AUG_CNI_MU, "Aug Crew CNI-MU TOLD Key")
C_130J:definePushButton("AUG_CNI_INDX", devices.AC_CNI, 3016, 1259, AUG_CNI_MU, "Aug Crew CNI-MU INDX Key")
C_130J:definePushButton("AUG_CNI_MC_INDX", devices.AC_CNI, 3017, 1260, AUG_CNI_MU, "Aug Crew CNI-MU MC INDX Key")
C_130J:definePushButton("AUG_CNI_CAPS", devices.AC_CNI, 3024, 1261, AUG_CNI_MU, "Aug Crew CNI-MU CAPS Key")
C_130J:definePushButton("AUG_CNI_EXEC", devices.AC_CNI, 3025, 1262, AUG_CNI_MU, "Aug Crew CNI-MU EXEC Key")
C_130J:definePushButton("AUG_CNI_LEGS", devices.AC_CNI, 3019, 1263, AUG_CNI_MU, "Aug Crew CNI-MU LEGS Key")
C_130J:definePushButton("AUG_CNI_MARK", devices.AC_CNI, 3020, 1264, AUG_CNI_MU, "Aug Crew CNI-MU MARK Key")
C_130J:definePushButton("AUG_CNI_PREV_PAGE", devices.AC_CNI, 3027, 1265, AUG_CNI_MU, "Aug Crew CNI-MU PREV PAGE Key")
C_130J:definePushButton("AUG_CNI_NEXT_PAGE", devices.AC_CNI, 3026, 1266, AUG_CNI_MU, "Aug Crew CNI-MU NEXT PAGE Key")
C_130J:defineRockerSwitch("AUG_CNI_BRT_ROCKER", devices.AC_CNI, 3070, 3070, 3071, 3071, 1267, AUG_CNI_MU, "Aug Crew CNI-MU BRT")
C_130J:definePushButton("AUG_CNI_KBD_1", devices.AC_CNI, 3031, 1268, AUG_CNI_MU, "Aug Crew CNI-MU 1 Key")
C_130J:definePushButton("AUG_CNI_KBD_2", devices.AC_CNI, 3032, 1269, AUG_CNI_MU, "Aug Crew CNI-MU 2 Key")
C_130J:definePushButton("AUG_CNI_KBD_3", devices.AC_CNI, 3033, 1270, AUG_CNI_MU, "Aug Crew CNI-MU 3 Key")
C_130J:definePushButton("AUG_CNI_KBD_4", devices.AC_CNI, 3034, 1271, AUG_CNI_MU, "Aug Crew CNI-MU 4 Key")
C_130J:definePushButton("AUG_CNI_KBD_5", devices.AC_CNI, 3035, 1272, AUG_CNI_MU, "Aug Crew CNI-MU 5 Key")
C_130J:definePushButton("AUG_CNI_KBD_6", devices.AC_CNI, 3036, 1273, AUG_CNI_MU, "Aug Crew CNI-MU 6 Key")
C_130J:definePushButton("AUG_CNI_KBD_7", devices.AC_CNI, 3037, 1274, AUG_CNI_MU, "Aug Crew CNI-MU 7 Key")
C_130J:definePushButton("AUG_CNI_KBD_8", devices.AC_CNI, 3038, 1275, AUG_CNI_MU, "Aug Crew CNI-MU 8 Key")
C_130J:definePushButton("AUG_CNI_KBD_9", devices.AC_CNI, 3039, 1276, AUG_CNI_MU, "Aug Crew CNI-MU 9 Key")
C_130J:definePushButton("AUG_CNI_KBD_0", devices.AC_CNI, 3030, 1277, AUG_CNI_MU, "Aug Crew CNI-MU 0 Key")
C_130J:definePushButton("AUG_CNI_KBD_DOT", devices.AC_CNI, 3040, 1278, AUG_CNI_MU, "Aug Crew CNI-MU . Key")
C_130J:definePushButton("AUG_CNI_KBD_PLUSMINUS", devices.AC_CNI, 3041, 1279, AUG_CNI_MU, "Aug Crew CNI-MU +/- Key")
C_130J:definePushButton("AUG_CNI_KBD_A", devices.AC_CNI, 3042, 1280, AUG_CNI_MU, "Aug Crew CNI-MU A Key")
C_130J:definePushButton("AUG_CNI_KBD_B", devices.AC_CNI, 3043, 1281, AUG_CNI_MU, "Aug Crew CNI-MU B Key")
C_130J:definePushButton("AUG_CNI_KBD_C", devices.AC_CNI, 3044, 1282, AUG_CNI_MU, "Aug Crew CNI-MU C Key")
C_130J:definePushButton("AUG_CNI_KBD_D", devices.AC_CNI, 3045, 1283, AUG_CNI_MU, "Aug Crew CNI-MU D Key")
C_130J:definePushButton("AUG_CNI_KBD_E", devices.AC_CNI, 3046, 1284, AUG_CNI_MU, "Aug Crew CNI-MU E Key")
C_130J:definePushButton("AUG_CNI_KBD_F", devices.AC_CNI, 3047, 1285, AUG_CNI_MU, "Aug Crew CNI-MU F Key")
C_130J:definePushButton("AUG_CNI_KBD_G", devices.AC_CNI, 3048, 1286, AUG_CNI_MU, "Aug Crew CNI-MU G Key")
C_130J:definePushButton("AUG_CNI_KBD_H", devices.AC_CNI, 3049, 1287, AUG_CNI_MU, "Aug Crew CNI-MU H Key")
C_130J:definePushButton("AUG_CNI_KBD_I", devices.AC_CNI, 3050, 1288, AUG_CNI_MU, "Aug Crew CNI-MU I Key")
C_130J:definePushButton("AUG_CNI_KBD_J", devices.AC_CNI, 3051, 1289, AUG_CNI_MU, "Aug Crew CNI-MU J Key")
C_130J:definePushButton("AUG_CNI_KBD_K", devices.AC_CNI, 3052, 1290, AUG_CNI_MU, "Aug Crew CNI-MU K Key")
C_130J:definePushButton("AUG_CNI_KBD_L", devices.AC_CNI, 3053, 1291, AUG_CNI_MU, "Aug Crew CNI-MU L Key")
C_130J:definePushButton("AUG_CNI_KBD_M", devices.AC_CNI, 3054, 1292, AUG_CNI_MU, "Aug Crew CNI-MU M Key")
C_130J:definePushButton("AUG_CNI_KBD_N", devices.AC_CNI, 3055, 1293, AUG_CNI_MU, "Aug Crew CNI-MU N Key")
C_130J:definePushButton("AUG_CNI_KBD_O", devices.AC_CNI, 3056, 1294, AUG_CNI_MU, "Aug Crew CNI-MU O Key")
C_130J:definePushButton("AUG_CNI_KBD_P", devices.AC_CNI, 3057, 1295, AUG_CNI_MU, "Aug Crew CNI-MU P Key")
C_130J:definePushButton("AUG_CNI_KBD_Q", devices.AC_CNI, 3058, 1296, AUG_CNI_MU, "Aug Crew CNI-MU Q Key")
C_130J:definePushButton("AUG_CNI_KBD_R", devices.AC_CNI, 3059, 1297, AUG_CNI_MU, "Aug Crew CNI-MU R Key")
C_130J:definePushButton("AUG_CNI_KBD_S", devices.AC_CNI, 3060, 1298, AUG_CNI_MU, "Aug Crew CNI-MU S Key")
C_130J:definePushButton("AUG_CNI_KBD_T", devices.AC_CNI, 3061, 1299, AUG_CNI_MU, "Aug Crew CNI-MU T Key")
C_130J:definePushButton("AUG_CNI_KBD_U", devices.AC_CNI, 3062, 1300, AUG_CNI_MU, "Aug Crew CNI-MU U Key")
C_130J:definePushButton("AUG_CNI_KBD_V", devices.AC_CNI, 3063, 1301, AUG_CNI_MU, "Aug Crew CNI-MU V Key")
C_130J:definePushButton("AUG_CNI_KBD_W", devices.AC_CNI, 3064, 1302, AUG_CNI_MU, "Aug Crew CNI-MU W Key")
C_130J:definePushButton("AUG_CNI_KBD_X", devices.AC_CNI, 3065, 1303, AUG_CNI_MU, "Aug Crew CNI-MU X Key")
C_130J:definePushButton("AUG_CNI_KBD_Y", devices.AC_CNI, 3066, 1304, AUG_CNI_MU, "Aug Crew CNI-MU Y Key")
C_130J:definePushButton("AUG_CNI_KBD_Z", devices.AC_CNI, 3067, 1305, AUG_CNI_MU, "Aug Crew CNI-MU Z Key")
C_130J:definePushButton("AUG_CNI_KBD_SLASH", devices.AC_CNI, 3068, 1308, AUG_CNI_MU, "Aug Crew CNI-MU / Key")
C_130J:definePushButton("AUG_CNI_KBD_DEL", devices.AC_CNI, 3028, 1307, AUG_CNI_MU, "Aug Crew CNI-MU DEL Key")
C_130J:definePushButton("AUG_CNI_KBD_CLR", devices.AC_CNI, 3029, 1309, AUG_CNI_MU, "Aug Crew CNI-MU CLR Key")
C_130J:defineIndicatorLight("AUG_CNI_DSPY_LED", 4145, AUG_CNI_MU, "Aug Crew CNI-MU DSPY Light (Green)")
C_130J:defineIndicatorLight("AUG_CNI_MSG_LED", 4146, AUG_CNI_MU, "Aug Crew CNI-MU MSG Light (Green)")
C_130J:defineIndicatorLight("AUG_CNI_FAIL_LED", 4147, AUG_CNI_MU, "Aug Crew CNI-MU FAIL Light (Yellow)")
C_130J:defineIndicatorLight("AUG_CNI_OFSET_LED", 4148, AUG_CNI_MU, "Aug Crew CNI-MU OFSET Light (Green)")
C_130J:defineFloat("AUG_CNI_EXEC_LED", 3394, { 0, 1 }, AUG_CNI_MU, "Aug Crew CNI-MU EXEC Light (Green)")

-- Pilot Remote Heading and Course Selector
local PLT_HEAD_COURSE = "PLT Remote Heading and Course Selector"
C_130J:defineRotary("PLT_HEADING_ADJUST", devices.PILOT_CPT_INTERFACE, 3001, 490, PLT_HEAD_COURSE, "Pilot Heading Adjust")
C_130J:defineToggleSwitch("PLT_HEADING_SYNC", devices.PILOT_CPT_INTERFACE, 3003, 562, PLT_HEAD_COURSE, "Pilot Heading Push to Sync")
C_130J:defineRotary("PLT_COURSE_ADJUST", devices.PILOT_CPT_INTERFACE, 3002, 491, PLT_HEAD_COURSE, "Pilot Course Adjust")
C_130J:defineToggleSwitch("PLT_COURSE_SYNC", devices.PILOT_CPT_INTERFACE, 3004, 563, PLT_HEAD_COURSE, "Pilot Course Push to Sync")

-- Copilot Remote Heading and Course Selector
local CPLT_HEAD_COURSE = "CPLT Remote Heading and Course Selector"
C_130J:defineRotary("CPLT_HEADING_ADJUST", devices.COPILOT_CPT_INTERFACE, 3001, 492, CPLT_HEAD_COURSE, "Copilot Heading Adjust")
C_130J:defineToggleSwitch("CPLT_HEADING_SYNC", devices.COPILOT_CPT_INTERFACE, 3003, 564, CPLT_HEAD_COURSE, "Copilot Heading Push to Sync")
C_130J:defineRotary("CPLT_COURSE_ADJUST", devices.COPILOT_CPT_INTERFACE, 3002, 493, CPLT_HEAD_COURSE, "Copilot Course Adjust")
C_130J:defineToggleSwitch("CPLT_COURSE_SYNC", devices.COPILOT_CPT_INTERFACE, 3004, 565, CPLT_HEAD_COURSE, "Copilot Course Push to Sync")

-- Throttle Quadrant
local THROTTLE_QUADRANT = "Throttle Quadrant"
C_130J:definePushButton("CC_LSGI_ENGINE_1_SWITCH", devices.MECH_INTERFACE, 3004, 46, THROTTLE_QUADRANT, "Engine 1 LSGI Select Switch")
C_130J:definePushButton("CC_LSGI_ENGINE_2_SWITCH", devices.MECH_INTERFACE, 3005, 47, THROTTLE_QUADRANT, "Engine 2 LSGI Select Switch")
C_130J:definePushButton("CC_LSGI_ENGINE_3_SWITCH", devices.MECH_INTERFACE, 3006, 48, THROTTLE_QUADRANT, "Engine 3 LSGI Select Switch")
C_130J:definePushButton("CC_LSGI_ENGINE_4_SWITCH", devices.MECH_INTERFACE, 3007, 49, THROTTLE_QUADRANT, "Engine 4 LSGI Select Switch")
C_130J:definePushButton("CC_L_ATHROTTLE_DISC", devices.AP_INTERFACE, 3035, 19, THROTTLE_QUADRANT, "Left Autothrottle Disconnect Button")
C_130J:definePushButton("CC_R_ATHROTTLE_DISC", devices.AP_INTERFACE, 3036, 20, THROTTLE_QUADRANT, "Right Autothrottle Disconnect Button")
C_130J:defineIndicatorLight("CC_LSGI_ENGINE_1_LED", 4091, THROTTLE_QUADRANT, "Engine 1 LSGI Switch Low Led (Green)")
C_130J:defineIndicatorLight("CC_LSGI_ENGINE_2_LED", 4092, THROTTLE_QUADRANT, "Engine 2 LSGI Switch Low Led (Green)")
C_130J:defineIndicatorLight("CC_LSGI_ENGINE_3_LED", 4093, THROTTLE_QUADRANT, "Engine 3 LSGI Switch Low Led (Green)")
C_130J:defineIndicatorLight("CC_LSGI_ENGINE_4_LED", 4094, THROTTLE_QUADRANT, "Engine 4 LSGI Switch Low Led (Green)")

-- Cursor Control Panel
local CURSOR_CONTROL_PANEL = "Cursor Control Panel"
C_130J:defineMultipositionSwitch("CCP_CURSOR_PRIORITY", devices.MECH_INTERFACE, 3003, 65, 3, 0.5, CURSOR_CONTROL_PANEL, "Cursor Priority Switch")
C_130J:definePushButton("CCP_CURSOR_RESET", devices.MECH_INTERFACE, 3010, 68, CURSOR_CONTROL_PANEL, "Cursor Reset Switch")
C_130J:definePushButton("CCP_HUD_CURSOR", devices.MECH_INTERFACE, 3014, 69, CURSOR_CONTROL_PANEL, "HUD Cursor Off/On Switch")
C_130J:defineRockerSwitch("CCP_DISPLAY_RANGE", devices.MECH_INTERFACE, 3015, 3015, 3015, 3015, 66, CURSOR_CONTROL_PANEL, "Display Range Increase/Decrease")
C_130J:defineRockerSwitch("CCP_DISPLAY_ZOOM", devices.MECH_INTERFACE, 3016, 3016, 3016, 3016, 67, CURSOR_CONTROL_PANEL, "Display Zoom Increase/Decrease")
C_130J:defineTumb("CCP_CURSOR_SELECT", devices.MECH_INTERFACE, 3030, 72, 1 / 6, { -1 / 6, 5 / 6 }, nil, false, CURSOR_CONTROL_PANEL, "Cursor Display Select Switch")
C_130J:defineRockerSwitch("CCP_CURSOR_TILT", devices.MECH_INTERFACE, 3096, 3096, 3096, 3096, 483, CURSOR_CONTROL_PANEL, "Cursor - Tilt")

-- Wing Flaps Control Quadrant
local FLAPS_CONTROL = "Wing Flaps Control Quadrant"
C_130J:definePotentiometer("CC_FLAP_LEVER", devices.MECH_INTERFACE, 3002, 16, { 0, 1 }, FLAPS_CONTROL, "Flap Control Lever")

-- Trim Panel
local TRIM_PANEL = "Trim Panel"
C_130J:defineSpringloaded_3PosTumb("TRIM_ELEV_TAB_PWR", devices.MECH_INTERFACE, 3038, 3038, 1334, TRIM_PANEL, "Elevator Trim Tab Power Switch: NORM/OFF/EMER")
C_130J:defineRockerSwitch("TRIM_RUDDER_SWITCH", devices.MECH_INTERFACE, 3036, 3036, 3036, 3036, 75, TRIM_PANEL, "Rudder Trim Switch")
C_130J:defineRockerSwitch("TRIM_NOSE_UP_DOWN", devices.MECH_INTERFACE, 3089, 3089, 3088, 3088, 1364, TRIM_PANEL, "Elevator Trim Nose Up/Down")
C_130J:defineRockerSwitch("TRIM_WING_RIGHT_LEFT", devices.MECH_INTERFACE, 3091, 3091, 3090, 3090, 1365, TRIM_PANEL, "Aileron Trim Right/Left Wing Down")

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
