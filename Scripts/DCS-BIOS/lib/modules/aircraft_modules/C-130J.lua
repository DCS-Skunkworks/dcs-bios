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
local PLT_LIGHTING_PANEL = "Pilot Lighting Panel"
C_130J:define3PosTumb("PLT_MASTER_LIGHTING_MODE", devices.LIGHTING_PANELS, 3029, 1337, PLT_LIGHTING_PANEL, "Lighting Mode Master Switch")
C_130J:defineSpringloaded_3PosTumb("PLT_ANNUNCIATOR_BRIGHTNESS", devices.LIGHTING_PANELS, 3030, 3030, 1336, PLT_LIGHTING_PANEL, "Annunciator Light Brightness Switch")
C_130J:definePotentiometer("PLT_DOME_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3017, 1340, { 0, 1 }, PLT_LIGHTING_PANEL, "Cockpit Dome Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_CB_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3018, 1341, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Circuit Breaker Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_MASTER_DISPLAY_BRIGHTNESS", devices.LIGHTING_PANELS, 3005, 1335, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Master Display Brightness Knob")
C_130J:definePotentiometer("PLT_PANEL_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3031, 1342, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Panel Backlighting Brightness Knob")
C_130J:definePotentiometer("PLT_FLOOD_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3020, 1343, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Panel Flood Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_FLOOR_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3025, 1344, { 0, 1 }, PLT_LIGHTING_PANEL, "Floor Lighting Brightness Knob")

-- Copilot Lighting Panel

-- Radar Control Panel

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
