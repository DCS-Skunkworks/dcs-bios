module("Alphajet", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class Alphajet: Module
local Alphajet = Module:new("Alphajet", 0x6400, { "Alphajet" })

--Plane System
Alphajet:definePushButton("GMETER_SET", 7, 3001, 74, "Accelerometer", "Push to set G-Meter")

Alphajet:definePushButton("FLAPS_UP", 8, 3001, 200, "Avionics", "Flaps Up")
Alphajet:definePushButton("FLAPS_MID", 8, 3002, 201, "Avionics", "Flaps Mid")
Alphajet:definePushButton("FLAPS_DN", 8, 3003, 203, "Avionics", "Flaps Full Down")
Alphajet:definePushButton("GEAR_DN", 8, 3004, 219, "Avionics", "Gear Down")
Alphajet:definePushButton("GEAR_UP", 8, 3005, 220, "Avionics", "Gear UP")

Alphajet:definePushButton("ALT_RESET", 6, 3001, 73, "Altimeter", "Altimeter Reset 10000ft")
Alphajet:defineRotary("ALT_PRESS_SET", 6, 3002, 300, "Altimeter", "Altimeter Pressure Setting")
Alphajet:defineRotary("IAS_SET", 6, 3003, 301, "Altimeter", "IAS Index Setting")
Alphajet:defineRotary("HDG_SET", 6, 3004, 304, "Altimeter", "Set Heading Bug")
Alphajet:defineRotary("HRZ_STBY_SET", 6, 3005, 305, "Altimeter", "Reset Standby Horizon")
Alphajet:defineRotary("HRZ_SET", 6, 3006, 306, "Altimeter", "Horizon Plane Set")
Alphajet:defineToggleSwitch("HRZ_CAGE", 14, 3003, 314, "Altimeter", "Cache Horizon Hide/Show")

Alphajet:definePotentiometer("UHF_VOL", 6, 3007, 302, { 0, 1 }, "Radio", "UHF Volume")
Alphajet:definePotentiometer("VHF_VOL", 6, 3008, 303, { 0, 1 }, "Radio", "VHF Volume")

Alphajet:define3PosTumb("LIGHTS_NAV", 12, 3001, 280, "Light System", "Navigation Lights, FLASH/OFF/STEADY")
Alphajet:defineToggleSwitch("LIGHTS_FORMATION", 12, 3002, 281, "Light System", "Formation Lights, ON/OFF")
Alphajet:defineToggleSwitch("LIGHTS_ITENT", 12, 3003, 282, "Light System", "Intensity, STRONG/LOWVIS")
Alphajet:defineToggleSwitch("LIGHTS_ANTICOL", 12, 3004, 283, "Light System", "Anticollision Lights, ON/OFF")
Alphajet:define3PosTumb("LIGHTS_LAND", 12, 3006, 311, "Light System", "Lights, OFF/TAXI/LANDING")
Alphajet:define3PosTumb("LIGHTS_A_ALARM", 12, 3005, 295, "Light System", "High Alpha Alarm, HIDRAG/OFF/LOWDRAG")

Alphajet:defineToggleSwitch("ALARM_SONORE", 12, 3007, 284, "Control Panel", "Alarme Sonore, ON/OFF")
Alphajet:defineToggleSwitch("PITOT_HEAT", 12, 3008, 285, "Control Panel", "Pitot Heat, ON/OFF")
Alphajet:defineToggleSwitch("CENT_GYRO", 14, 3001, 286, "Control Panel", "Centrale Gyroscopique, ON/OFF")
Alphajet:defineToggleSwitch("HRZ_SECOURS", 14, 3002, 287, "Control Panel", "Horizon Secours, ON/OFF")
Alphajet:defineToggleSwitch("ELC_PUMP", 9, 3010, 288, "Control Panel", "Electropompe, ON/OFF")
Alphajet:defineToggleSwitch("SMOKE_SIDE_SW", 11, 3001, 317, "Control Panel", "Side Smoke System Right/Left")
Alphajet:defineToggleSwitch("CANOPY_SW", 19, 3001, 318, "Control Panel", "Cockpit Lever Open/Close")

Alphajet:defineToggleSwitch("MASTER_BAT_SW", 3, 3011, 289, "Electric System", "Master Battery Switch")
Alphajet:defineToggleSwitch("GEN_L_SW", 3, 3012, 290, "Electric System", "Left Generator Switch")
Alphajet:defineToggleSwitch("GEN_R_SW", 3, 3013, 291, "Electric System", "Right Generator Switch")
Alphajet:defineToggleSwitch("INVERT_L_SW", 3, 3014, 292, "Electric System", "Left Inverter Switch")
Alphajet:defineToggleSwitch("INVERT_R_SW", 3, 3015, 293, "Electric System", "Right Inverter Switch")
Alphajet:defineToggleSwitch("CRASH_BAR", 3, 3016, 315, "Electric System", "Crash Bar Switch")
Alphajet:definePushButton("WARN_L_TEST", 3, 3017, 294, "Electric System", "Warning Light Test")
Alphajet:defineToggleSwitch("DELESTAGE", 3, 3018, 316, "Electric System", "Delestage")

Alphajet:define3PosTumb("ENG_START_L", 15, 3020, 296, "Engine Panel", "Left Engine Start, START/VENT/OFF")
Alphajet:define3PosTumb("ENG_START_R", 15, 3021, 297, "Engine Panel", "Right Engine Start, START/VENT/OFF")
Alphajet:defineToggleSwitch("LOW_PRESS_PUMP_BPG", 15, 3022, 298, "Engine Panel", "Low Pressure Pump, BPG")
Alphajet:defineToggleSwitch("LOW_PRESS_PUMP_BPD", 15, 3023, 299, "Engine Panel", "Low Pressure Pump, BPD")
Alphajet:defineToggleSwitch("PROTECT_COVER_BPG", 15, 3024, 307, "Engine Panel", "Protective Cover, BPG")
Alphajet:defineToggleSwitch("PROTECT_COVER_BPD", 15, 3025, 308, "Engine Panel", "Protective Cover, BPD")
Alphajet:defineToggleSwitch("FUEL_CUT_L", 15, 3026, 309, "Engine Panel", "Fuel Cutoff Left")
Alphajet:defineToggleSwitch("FUEL_CUT_R", 15, 3027, 310, "Engine Panel", "Fuel Cutoff Right")

Alphajet:defineToggleSwitch("QXY_NORM_SW", 12, 3011, 312, "Oxygen System", "Oxygen Switch Normal/100%")
Alphajet:defineToggleSwitch("QXY_ON_SW", 12, 3012, 313, "Oxygen System", "Oxygen Switch Open/Close")

--Gauges
Alphajet:defineFloat("CANOPY_POS", 181, { 0, 1 }, "Gauges", "Canopy Position")
Alphajet:defineFloat("MANCHE", 114, { 0, 1 }, "Gauges", "Manche")
Alphajet:defineFloat("ENG_RPM_L", 16, { 0, 1 }, "Gauges", "Engine RPM Left")
Alphajet:defineFloat("ENG_FF_L", 60, { 0, 1 }, "Gauges", "Engine FF Left")
Alphajet:defineFloat("ENG_TEMP_L", 52, { 0, 1 }, "Gauges", "Engine Temperature Left")
Alphajet:defineFloat("ENG_RPM_R", 17, { 0, 1 }, "Gauges", "Engine RPM Right")
Alphajet:defineFloat("ENG_FF_R", 61, { 0, 1 }, "Gauges", "Engine FF Right")
Alphajet:defineFloat("ENG_TEMP_R", 51, { 0, 1 }, "Gauges", "Engine Temperature Right")
Alphajet:defineFloat("CLOCK_H", 500, { 0, 1 }, "Gauges", "Clock Hour")
Alphajet:defineFloat("CLOCK_M", 501, { 0, 1 }, "Gauges", "Clock Minute")
Alphajet:defineFloat("CLOCK_S", 502, { 0, 1 }, "Gauges", "Clock Second")
Alphajet:defineFloat("JOUR", 503, { 0, 1 }, "Gauges", "Jour")
Alphajet:defineFloat("CHRONO_H", 504, { 0, 1 }, "Gauges", "Chrono Hour")
Alphajet:defineFloat("CHRONO_M", 505, { 0, 1 }, "Gauges", "Chrono Minute")
Alphajet:defineFloat("CHRONO_S", 506, { 0, 1 }, "Gauges", "Chrono Second")
Alphajet:defineFloat("IAS_GAUGE", 100, { 0, 1 }, "Gauges", "IAS Gauge")
Alphajet:defineFloat("VERT_VELO", 24, { -0.6, 0.6 }, "Gauges", "Vertical Velocity")
Alphajet:defineFloat("G_LOAD", 7, { -1, 1 }, "Gauges", "G-Load")
Alphajet:defineFloat("G_MAX", 71, { -1, 1 }, "Gauges", "G-Load Maximum")
Alphajet:defineFloat("G_MIN", 72, { -1, 1 }, "Gauges", "G-Load Minimum")
Alphajet:defineFloat("AOA_UNITS", 10, { 0, 0.3 }, "Gauges", "AOA_Units")
Alphajet:defineFloat("AHRZ_ROLL", 26, { -1, 1 }, "Gauges", "Artificial Horizon Roll")
Alphajet:defineFloat("AHRZ_PITCH", 27, { -1, 1 }, "Gauges", "Artificial Horizon Pitch")
Alphajet:defineFloat("TRIM_PITCH", 498, { -1, 1 }, "Gauges", "Trim Pitch")
Alphajet:defineFloat("ALT_NEEDLE_1K", 18, { 0, 1 }, "Gauges", "Altimeter 1000ft Needle")
Alphajet:defineFloat("ALT_DRUM_10K", 19, { 0, 1 }, "Gauges", "Altimeter 10000ft Drum")
Alphajet:defineFloat("COMP_ROSE", 28, { 0, 1 }, "Gauges", "Compass Rose")
Alphajet:defineFloat("FUEL_TOTAL", 25, { 0, 1 }, "Gauges", "Total Fuel")
Alphajet:defineFloat("MACH_METER", 9, { 0, 1 }, "Gauges", "Mach Meter")
Alphajet:defineFloat("HYD_PRESS1", 55, { 0, 0.3 }, "Gauges", "Hydraulic Pressure Gauge 1")
Alphajet:defineFloat("HYD_PRESS2", 56, { 0, 0.3 }, "Gauges", "Hydraulic Pressure Gauge 2")
Alphajet:defineFloat("FLAP_POS", 58, { 0, 1 }, "Gauges", "FLAP Position Gauge")

Alphajet:defineIndicatorLight("GEAR_BAY_L", 53, "Warning, Caution and IndicatorLights", "Gear Baydoor Light (red)")
Alphajet:defineIndicatorLight("GEAR_L", 54, "Warning, Caution and IndicatorLights", "Gear Lights (green)")
Alphajet:defineIndicatorLight("AF_L", 45, "Warning, Caution and IndicatorLights", "AF Lamp (yellow)")
Alphajet:defineIndicatorLight("LIGHT_10K_FT", 57, "Warning, Caution and IndicatorLights", "Warning Lamp 10000ft (yellow)")
Alphajet:defineIndicatorLight("GEAR_HND_L", 63, "Warning, Caution and IndicatorLights", "Gear Handle Light (red)")
Alphajet:defineIndicatorLight("SMOKE_L", 62, "Warning, Caution and IndicatorLights", "Smoke Light (green)")
Alphajet:defineIndicatorLight("BRAKE_L", 15, "Warning, Caution and IndicatorLights", "Brake Lamp (yellow)")
Alphajet:defineIndicatorLight("FUEL_250_L", 20, "Warning, Caution and IndicatorLights", "Fuel 250L Light (red)")
Alphajet:defineIndicatorLight("FUEL_LWING_L", 21, "Warning, Caution and IndicatorLights", "Left Wing Fuel Lamp (yellow)")
Alphajet:defineIndicatorLight("FUEL_RWING_L", 22, "Warning, Caution and IndicatorLights", "Right Wing Fuel Lamp (yellow)")
Alphajet:defineIndicatorLight("FLAP_L", 64, "Warning, Caution and IndicatorLights", "FLAP Lamp (yellow)")
Alphajet:defineIndicatorLight("TEMP_L_L", 65, "Warning, Caution and IndicatorLights", "Left Temperature Lamp (yellow)")
Alphajet:defineIndicatorLight("TEMP_R_L", 66, "Warning, Caution and IndicatorLights", "Right Temperature Lamp (yellow)")

--Externals
Alphajet:defineFloatFromDrawArgument("EXT_SPEED_BRAKE", 21, "External Aircraft Model", "Speed Brake")

Alphajet:defineBitFromDrawArgument("EXT_POSITION_LIGHTS", 190, "External Aircraft Model", "Position Lights (green/red)")

Alphajet:defineBitFromDrawArgument("EXT_STROBE_LIGHTS", 192, "External Aircraft Model", "Strobe Lights (white)")

Alphajet:defineBitFromDrawArgument("EXT_GEAR_LIGHTS", 208, "External Aircraft Model", "Left Gear Light (white)")

Alphajet:defineBitFromDrawArgument("EXT_NOSE_LIGHTS", 130, "External Aircraft Model", "Nose and Right Gear Lights (white)")

Alphajet:defineBitFromDrawArgument("EXT_BOT_TAIL_LIGHTS", 202, "External Aircraft Model", "Bottom Tail Lights (red)")

Alphajet:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
Alphajet:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
Alphajet:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

return Alphajet
