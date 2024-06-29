module("OH-58D", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class OH_58D: Module
local OH_58D = Module:new("OH-58D", 0x8A00, { "OH58D" })

local CONTROLS_DEVICE_ID = 1
local FUEL_DEVICE_ID = 2
local SENSORS_DEVICE_ID = 3
local FLIGHT_MODEL_DEVICE_ID = 4
local ENGINE_DEVICE_ID = 5
local RADIOALTIMETER_DEVICE_ID = 6
local ELECTRIC_DEVICE_ID = 7
local COCKPIT_DEVICE_ID = 8
local MISSION_DEVICE_ID = 9
local MPD_DEVICE_ID = 10
local RMFD_DEVICE_ID = 11
local SCAS_DEVICE_ID = 12
local HYDRAULIC_DEVICE_ID = 13
local MFK_DEVICE_ID = 14
local COMMON_DEVICE_ID = 15
local CLOCK_DEVICE_ID = 16
local FADEC_DEVICE_ID = 17
local AI_DEVICE_ID = 18
local PILOT_DEVICE_ID = 19
local COPILOT_DEVICE_ID = 20
local WEAPONS_DEVICE_ID = 21
local MMS_DEVICE_ID = 22
local LMFD_DEVICE_ID = 23
local RANGEFINDER_DEVICE_ID = 24
local IR_SEEKER_DEVICE_ID = 25
local SOUNDHOLDER_DEVICE_ID = 26
local RFD_DEVICE_ID = 27
local CSC_PILOT_DEVICE_ID = 28
local VFM1_DEVICE_ID = 29
local UAM_DEVICE_ID = 30
local VAM_DEVICE_ID = 31
local VFM2_DEVICE_ID = 32
local WCAS_DEVICE_ID = 33
local CSC_COPILOT_DEVICE_ID = 34
local RWR_DEVICE_ID = 35
local CI_DEVICE_ID = 36
local CMWS_DEVICE_ID = 37
local NVG_DEVICE_ID = 38
local M3P_LASER_DEVICE_ID = 39
local SYNC_DEVICE_DEVICE_ID = 40
local SYNC_MACHINE_DEVICE_ID = 41
local SYNC_CONTROLS_DEVICE_ID = 42
local ODA_LEFT_DEVICE_ID = 43
local ODA_RIGHT_DEVICE_ID = 44
local L2_MUMS_DEVICE_ID = 45
local SYNC_MACHINE2_DEVICE_ID = 46
local JVMF_DEVICE_ID = 47
local PDU_DEVICE_ID = 48
local AVR2_DEVICE_ID = 49
local MACROS_DEVICE_ID = 50
local KNEEBOARD_DEVICE_ID = 51

-- Center post console (behind crew, between seats)
local CENTER_POST_CONSOLE = "Center Post Console"

-- row 1
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_HF", ELECTRIC_DEVICE_ID, 3008, 268, CENTER_POST_CONSOLE, "HF Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_FM", ELECTRIC_DEVICE_ID, 3118, 640, CENTER_POST_CONSOLE, "FM AMP Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_FM2", ELECTRIC_DEVICE_ID, 3119, 641, CENTER_POST_CONSOLE, "FM2 Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_VHF", ELECTRIC_DEVICE_ID, 3120, 642, CENTER_POST_CONSOLE, "VHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_UHF", ELECTRIC_DEVICE_ID, 3121, 643, CENTER_POST_CONSOLE, "UHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SATCOM_RT", ELECTRIC_DEVICE_ID, 3122, 644, CENTER_POST_CONSOLE, "SATCOM R/T Circuit Breaker")

-- row 2
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_ENG_ANTI_ICE", ELECTRIC_DEVICE_ID, 3113, 635, CENTER_POST_CONSOLE, "Engine Anti-ice Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_HF", ELECTRIC_DEVICE_ID, 3114, 636, CENTER_POST_CONSOLE, "SCTY HF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_UHF", ELECTRIC_DEVICE_ID, 3115, 637, CENTER_POST_CONSOLE, "SCTY UHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_VHF", ELECTRIC_DEVICE_ID, 3116, 638, CENTER_POST_CONSOLE, "SCTY VHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_IFF", ELECTRIC_DEVICE_ID, 3007, 269, CENTER_POST_CONSOLE, "IFF Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_IFF_CMPTR", ELECTRIC_DEVICE_ID, 3117, 639, CENTER_POST_CONSOLE, "IFF Computer Circuit Breaker")

-- row 3
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_RADAR_DETR", ELECTRIC_DEVICE_ID, 3005, 270, CENTER_POST_CONSOLE, "Radar Detector Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_RADAR_WARN", ELECTRIC_DEVICE_ID, 3006, 271, CENTER_POST_CONSOLE, "Radar Warning Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_RADAR_ALT", ELECTRIC_DEVICE_ID, 3110, 632, CENTER_POST_CONSOLE, "Radar Altimeter Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_BLOWER_COMPT", ELECTRIC_DEVICE_ID, 3111, 633, CENTER_POST_CONSOLE, "Blower Computer Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_CABIN_HTR", ELECTRIC_DEVICE_ID, 3112, 634, CENTER_POST_CONSOLE, "Cabin Heater Circuit Breaker")

-- row 4
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_IDM", ELECTRIC_DEVICE_ID, 3105, 627, CENTER_POST_CONSOLE, "IDM Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_ARMT_CONTR", ELECTRIC_DEVICE_ID, 3106, 628, CENTER_POST_CONSOLE, "Armament Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_SIGHT", ELECTRIC_DEVICE_ID, 3107, 629, CENTER_POST_CONSOLE, "Power Sight Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_LGUN", ELECTRIC_DEVICE_ID, 3108, 630, CENTER_POST_CONSOLE, "Power Left Gun Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_RKT", ELECTRIC_DEVICE_ID, 3109, 631, CENTER_POST_CONSOLE, "Power Rocket Circuit Breaker")

-- row 5
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_ARM", ELECTRIC_DEVICE_ID, 3099, 621, CENTER_POST_CONSOLE, "Hellfire Arm Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_CONTR", ELECTRIC_DEVICE_ID, 3100, 622, CENTER_POST_CONSOLE, "Hellfire Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_PWR", ELECTRIC_DEVICE_ID, 3101, 623, CENTER_POST_CONSOLE, "Hellfire Power Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_AC", ELECTRIC_DEVICE_ID, 3102, 624, CENTER_POST_CONSOLE, "Hellfire AC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_TAMS", ELECTRIC_DEVICE_ID, 3103, 625, CENTER_POST_CONSOLE, "TAMS Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SATCOM_AMP", ELECTRIC_DEVICE_ID, 3104, 626, CENTER_POST_CONSOLE, "SATCOM AMP Circuit Breaker")

-- row 6
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HUMS_28_VDC", ELECTRIC_DEVICE_ID, 3095, 617, CENTER_POST_CONSOLE, "HUMS 28 VDC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HDG_HOLD", ELECTRIC_DEVICE_ID, 3096, 618, CENTER_POST_CONSOLE, "Heading Hold Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_EL_LT", ELECTRIC_DEVICE_ID, 3097, 619, CENTER_POST_CONSOLE, "EL LT Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_L2MUM", ELECTRIC_DEVICE_ID, 3004, 272, CENTER_POST_CONSOLE, "L2MUM Power Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_26_VAC", ELECTRIC_DEVICE_ID, 3098, 620, CENTER_POST_CONSOLE, "26 VAC Circuit Breaker")

-- row 7
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCAS_28_VAC", ELECTRIC_DEVICE_ID, 3092, 614, CENTER_POST_CONSOLE, "SCAS 28 VAC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_STBY_ATT", ELECTRIC_DEVICE_ID, 3093, 615, CENTER_POST_CONSOLE, "Standby Attitude Indicator Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MCPU_BLWR", ELECTRIC_DEVICE_ID, 3094, 616, CENTER_POST_CONSOLE, "MCPU Blower Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PART_SEP", ELECTRIC_DEVICE_ID, 3001, 273, CENTER_POST_CONSOLE, "Particle Separator Circuit Breaker")

-- row 8
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_26_VAC", ELECTRIC_DEVICE_ID, 3088, 610, CENTER_POST_CONSOLE, "MMS 26 VAC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_DC_PWR", ELECTRIC_DEVICE_ID, 3089, 611, CENTER_POST_CONSOLE, "MMS DC Power Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_DC_CONTR", ELECTRIC_DEVICE_ID, 3090, 612, CENTER_POST_CONSOLE, "MMS DC Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_AC", ELECTRIC_DEVICE_ID, 3091, 613, CENTER_POST_CONSOLE, "MMS AC Circuit Breaker")

-- Overhead console (small detachment above the pilot)
local OVERHEAD_CONSOLE_PILOT = "Overhead Console (Pilot)"

-- Overhead console (above crew, towards the rear)
local OVERHEAD_CONSOLE_REAR = "Overhead Console (Rear)"

-- Overhead console (above crew, towards the front)
local OVERHEAD_CONSOLE_FRONT = "Overhead Console (Front)"

-- Cyclic (Pilot)
local CYCLIC_PILOT = "Cyclic (Pilot)"

-- Cyclic (Copilot)
local CYCLIC_COPILOT = "Cyclic (Copilot)"

-- Collective (Pilot)
local COLLECTIVE_PILOT = "Collective (Pilot)"

-- Ignition Panel
local IGNITION_PANEL = "Ignition Panel"

-- CMWS Panel
local CMWS_PANEL = "CMWS Panel"

-- CSC (Pilot)
local CSC_PILOT = "CSC (Pilot)"

-- CSC (Copilot)
local CSC_COPILOT = "CSC (Copilot)"

-- Remote ICS Panel
local REMOTE_ICS_PANEL = "Remote ICS Panel"

-- Armament Control Panel
local ARMAMENT_PANEL = "Armament Control Panel"

-- Fuel Control Panel
local FUEL_CONTROL_PANEL = "Fuel Control Panel"

-- Multifunction Keyboard (MFK)
local MFK = "Multifunction Keyboard"

-- SCAS Control Panel
local SCAS_PANEL = "SCAS Control Panel"

-- Multiparameter Display (MPD)
local MPD = "MPD"

-- Air Vent Control
local AIR_VENT_CONTROL = "Air Vent Control"

-- Standby Attitude Indicator
local SAI = "Standby Attitude Indicator"

-- RPM Vertical Scale Instrument
local RPM_SCALE = "RPM Vertical Scale Instrument"

-- TGT/TRQ Indicator
local TGT_TRQ = "TGT/TRQ Indicator"

-- Pilot MPD
local MPD_PILOT = "MPD (Pilot)"

-- Copilot MPD
local MPD_COPILOT = "MPD (Copilot)"

-- Pilot MPD Auxiliary Control Panel
local MPD_AUX_PANEL_PILOT = "MPD Auxiliary Panel (Pilot)"

-- Copilot MPD Auxiliary Control Panel
local MPD_AUX_PANEL_COPILOT = "MPD Auxiliary Panel (Copilot)"

-- Clock
local CLOCK = "Clock"

-- Standby Magnetic Compass
local STANDBY_COMPASS = "Standby Magnetic Compass"

-- AN/APR-39 Radar Indicator
local RWR = "AN/APR-39 Radar Indicator"

-- Standby Altimeter
local STANDBY_ALTIMETER = "Standby Altimeter"

-- Standby Airspeed Indicator
local STANDBY_AIRSPEED_INDICATOR = "Standby Airspeed Indicator"

-- Remote Frequency Indicator
local REMOTE_FREQUENCY_INDICATOR = "Remote Frequency Indicator"

-- Dashboard Buttons (buttons on the dash without an associated panel)
local DASHBOARD_BUTTONS = "Dashboard Buttons"
-- FADEC AUTO/MAN
-- EFB Filter Bypass

-- Channel Select Switch
local CHANNEL_SELECT_SWITCH = "Channel Select Switch"

-- MMS Control Panel
local MMS_CONTROL_PANEL = "MMS Control Panel"

-- CMWS
local CMWS = "CMWS"

-- Floodlights
local FLOODLIGHTS = "Floodlights"

-- Free Air Temperature Gauge
local FREE_AIR_TEMP = "Free Air Temperature Gauge"

-- Exterior Lights
local EXTERIOR_LIGHTS = "Exterior Lights"

-- Cockpit
local COCKPIT = "Cockpit"
-- left/right armor panels

return OH_58D
