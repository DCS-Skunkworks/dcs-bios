module("SpitfireLFMkIX", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class SpitfireLFMkIX: Module
local SpitfireLFMkIX = Module:new("SpitfireLFMkIX", 0x5400, { "SpitfireLFMkIX", "SpitfireLFMkIXCW" })
-- remove Arg# Pilot 165

--Oxygen Apparatus Controls
SpitfireLFMkIX:defineToggleSwitch("OXY_VALVE", 3, 3003, 13, "Cockpit", "Oxygen Valve")
SpitfireLFMkIX:defineToggleSwitch("SAFETY", 5, 3001, 3, "Weapons", "Safety Lever")
SpitfireLFMkIX:definePushButton("BUTTON_MG", 5, 3003, 4, "Weapons", "MG Trigger")
SpitfireLFMkIX:definePushButton("BUTTON_CAN", 5, 3004, 5, "Weapons", "Cannons Trigger")
SpitfireLFMkIX:definePushButton("BUTTON_LINKED", 5, 3005, 6, "Weapons", "MG+Cannons Trigger")
SpitfireLFMkIX:definePotentiometer("WHEEL_BRAKES", 1, 3002, 9, { 0, 1 }, "Undercarriage", "Wheel Brakes Lever")

-- Main Panel
SpitfireLFMkIX:defineRotary("ALT_MBAR", 1, 3037, 30, "Cockpit", "Altimeter Pressure Set")
SpitfireLFMkIX:defineRotary("DI", 1, 3041, 32, "Cockpit", "Directional Gyro Adjust")
SpitfireLFMkIX:definePushButton("FUEL_GAUGE", 1, 3005, 44, "Cockpit", "Show Fuel Contents")
SpitfireLFMkIX:defineToggleSwitch("NAV_LIGHTS", 1, 3007, 46, "Lights", "Nav. Lights On/Off")
SpitfireLFMkIX:defineToggleSwitch("FLAPS", 1, 3009, 47, "Cockpit", "Landing Flaps Up/Down")
SpitfireLFMkIX:defineToggleSwitch("UC_BLIND", 1, 3011, 50, "Cockpit", "U/C Indicator Blind Up/Down")
SpitfireLFMkIX:definePushButton("CLK_PINION_PULL", 17, 3006, 54, "Cockpit", "Winding/Adjustment Clock Pull out.")
SpitfireLFMkIX:defineRotary("CLK_PINION", 17, 3004, 55, "Cockpit", "Winding/Adjustment Clock")
SpitfireLFMkIX:defineToggleSwitch("MAGNETO0", 2, 3015, 56, "Engine", "No. 1 Magneto On/Off")
SpitfireLFMkIX:defineToggleSwitch("MAGNETO1", 2, 3017, 57, "Engine", "No. 2 Magneto On/Off")
SpitfireLFMkIX:defineToggleSwitch("BLOWER", 2, 3019, 58, "Engine", "Supercharger Mode Auto/M.S.")
SpitfireLFMkIX:definePotentiometer("PITLITE_LH", 4, 3001, 60, { 0, 1 }, "Lights", "Port Flood Lamp Brightness")
SpitfireLFMkIX:definePotentiometer("PITLITE_RH", 4, 3004, 61, { 0, 1 }, "Lights", "Stbd. Flood Lamp Brightness")
SpitfireLFMkIX:defineToggleSwitch("STARTER_COVER", 2, 3021, 64, "Engine", "Starter Button Cover")
SpitfireLFMkIX:definePushButton("STARTER", 2, 3023, 65, "Engine", "Starter")
SpitfireLFMkIX:defineToggleSwitch("BOOSTER_COVER", 2, 3025, 66, "Engine", "Booster Coil Button Cover")
SpitfireLFMkIX:definePushButton("BOOSTER", 2, 3027, 67, "Engine", "Booster Coil")
SpitfireLFMkIX:definePotentiometer("PRIMER_TURN", 2, 3029, 68, { 0, 1 }, "Engine", "Primer Pump Turn")
SpitfireLFMkIX:definePushButton("PRIMER_PULL", 2, 3030, 69, "Engine", "Primer Pump Pull")
SpitfireLFMkIX:defineToggleSwitch("TANK_PRS", 2, 3033, 70, "Engine", "Fuel Tank Pressure On/Off")
SpitfireLFMkIX:defineFixedStepTumb("COMPASS_RING", 1, 3017, 74, 0.00333, { 0, 1 }, { -0.00333, 0.00333 }, nil, "Cockpit", "Compass Course Setter Ring")

-- Gun Sight and Tertiary Weapons Controls
SpitfireLFMkIX:definePotentiometer("GUNSIGHT_RANGE", 5, 3007, 77, { 0, 1 }, "Weapons", "Gunsight Range")
SpitfireLFMkIX:definePotentiometer("GUNSIGHT_BASE", 5, 3010, 78, { 0, 1 }, "Weapons", "Gunsight Base")
SpitfireLFMkIX:defineToggleSwitch("GUNSIGHT_TINT", 5, 3016, 79, "Weapons", "Gunsight Tint Screen Up/Down")
SpitfireLFMkIX:defineToggleSwitch("GUNSIGHT_SWITCH", 5, 3018, 80, "Weapons", "Gunsight Master On/Off")
SpitfireLFMkIX:definePotentiometer("GUNSIGHT_DIMMER", 5, 3020, 81, { 0, 1 }, "Weapons", "Gun Sight Light")

-- Port Wall
SpitfireLFMkIX:definePotentiometer("TRIM_WHEEL", 1, 3029, 145, { -1, 1 }, "Controls", "Elevator Trim")
SpitfireLFMkIX:definePotentiometer("RTRIM_WHEEL", 1, 3044, 146, { -1, 1 }, "Controls", "Rudder Trim")

-- Radio Remote Channel Switcher
SpitfireLFMkIX:defineToggleSwitch("RCTRL_OFF", 15, 3001, 115, "Radio", "Radio Power OFF")
SpitfireLFMkIX:defineToggleSwitch("RCTRL_A", 15, 3002, 116, "Radio", "Radio Channel A")
SpitfireLFMkIX:defineToggleSwitch("RCTRL_B", 15, 3003, 117, "Radio", "Radio Channel B")
SpitfireLFMkIX:defineToggleSwitch("RCTRL_C", 15, 3004, 118, "Radio", "Radio Channel C")
SpitfireLFMkIX:defineToggleSwitch("RCTRL_D", 15, 3005, 119, "Radio", "Radio Channel D")
SpitfireLFMkIX:defineToggleSwitch("RCTRL_DIM", 15, 3006, 125, "Radio", "Radio Channel Dimmer")
SpitfireLFMkIX:defineToggleSwitch("RCTRL_TLOCK", 15, 3017, 155, "Radio", "Switch Locking Lever")
SpitfireLFMkIX:defineSpringloaded_3PosTumb("RCTRL_T_MODE", 15, 3008, 3007, 156, "Radio", "Radio Mode Switch")

-- Throttle Quadrant
SpitfireLFMkIX:definePushButton("BUTTON_BOMB", 5, 3015, 128, "Weapons", "Drop Bombs")
SpitfireLFMkIX:definePotentiometer("PROP", 2, 3006, 129, { -1, 1 }, "Engine", "Propeller RPM")
SpitfireLFMkIX:defineToggleSwitch("MIX", 2, 3009, 130, "Engine", "Mixture Control Select IDLE CUT OFF/RUN")
SpitfireLFMkIX:defineToggleSwitch("UC_DOWN_C", 2, 3099, 131, "Undercarriage", "U/C Indicator Cut-Off On/Off")
SpitfireLFMkIX:defineToggleSwitch("RADIATOR", 1, 3033, 133, "Engine", "Radiator Flap Open/Auto")
SpitfireLFMkIX:defineToggleSwitch("PITOT", 1, 3035, 134, "Engine", "Pitot Heating On/Off")
SpitfireLFMkIX:defineToggleSwitch("FUEL_PUMP", 2, 3043, 135, "Engine", "Fuel Pump On/Off")
SpitfireLFMkIX:defineToggleSwitch("CARB_AIR", 2, 3045, 137, "Engine", "Carburettor Air Control")
SpitfireLFMkIX:defineToggleSwitch("DILUTER_COVER", 2, 3051, 157, "Engine", "Oil Dilution Button Cover")
SpitfireLFMkIX:definePushButton("DILUTER", 2, 3053, 158, "Engine", "Oil Dilution")
SpitfireLFMkIX:defineToggleSwitch("MS_TEST_COVER", 2, 3055, 159, "Engine", "Supercharger Test Button Cover")
SpitfireLFMkIX:definePushButton("MS_TEST", 2, 3057, 160, "Engine", "Supercharger Test")
SpitfireLFMkIX:defineToggleSwitch("RAD_TEST_COVER", 2, 3059, 161, "Engine", "Radiator Test Button Cover")
SpitfireLFMkIX:definePushButton("RAD_TEST", 2, 3061, 162, "Engine", "Radiator Test")

-- Stbd. Wall
SpitfireLFMkIX:defineToggleSwitch("DEICER", 1, 3021, 87, "Cockpit", "Windscreen De-Ice On/Off")
SpitfireLFMkIX:defineToggleSwitch("UC_EMER", 1, 3023, 88, "Undercarriage", "Undercarriage Emergency Release")
SpitfireLFMkIX:defineToggleSwitch("WOBBLE_PUMP", 2, 3035, 90, "Engine", "Wobble Type Fuel Pump")
SpitfireLFMkIX:defineToggleSwitch("UC", 1, 3025, 148, "Undercarriage", "Undercarriage Raise/Lower")

-- Morse Key & Apparatus
SpitfireLFMkIX:defineTumb("MORSE_UP_MODE", 4, 3007, 92, 0.5, { 0, 1 }, nil, false, "Lights", "Upward Lamp Mode")
SpitfireLFMkIX:defineTumb("MORSE_DN_MODE", 4, 3011, 93, 0.5, { 0, 1 }, nil, false, "Lights", "Downward Lamp Mode")
SpitfireLFMkIX:definePushButton("MORSE_KEY", 4, 3015, 94, "Lights", "Morse Key")

-- I.F.F. Control Box
SpitfireLFMkIX:defineToggleSwitch("IFF_B", 4, 3017, 106, "Radio", "I.F.F. Circuit B")
SpitfireLFMkIX:defineToggleSwitch("IFF_D", 4, 3019, 107, "Radio", "I.F.F. Circuit D")
SpitfireLFMkIX:defineToggleSwitch("IFF_COVER", 4, 3021, 108, "Radio", "I.F.F. Cover Open/Close")
SpitfireLFMkIX:definePushButton("IFF_0", 4, 3023, 109, "Radio", "I.F.F. Detonate Button 1")
SpitfireLFMkIX:definePushButton("IFF_1", 4, 3025, 110, "Radio", "I.F.F. Detonate Button 2")

-- Fuel Cocks & Tertiary
SpitfireLFMkIX:defineToggleSwitch("FUEL_COCK", 2, 3037, 100, "Engine", "Main Tank On/Off")
SpitfireLFMkIX:defineToggleSwitch("DROPTANK_COCK", 2, 3041, 98, "Engine", "Drop Tank On/Off")
SpitfireLFMkIX:defineToggleSwitch("DROPTANK_JETT", 5, 3013, 99, "Engine", "Drop Tank Release Handle")

-- Canopy Controls
SpitfireLFMkIX:defineToggleSwitch("HATCH", 1, 3051, 149, "Cockpit", "Canopy Open/Close Control")
SpitfireLFMkIX:defineToggleSwitch("HATCH_JETTISON", 1, 3057, 140, "Cockpit", "Jettison Canopy Pull Ball")
SpitfireLFMkIX:defineToggleSwitch("SIDE_DOOR", 1, 3059, 147, "Cockpit", "Side Door Open/Close Control")

-- Indicators
-- SpitfireLFMkIX:defineFloat("CANOPY_TRUCKS", 162, { 0, 1 }, "Indicator", "Canopy Trucks") --not Working
SpitfireLFMkIX:reserveIntValue(65535) -- these three items were commented out in the dcs luas
-- SpitfireLFMkIX:defineFloat("CANOPY_VISIBILITY", 163, { 0, 1 }, "Indicator", "Canopy Visibility") --not Working
SpitfireLFMkIX:reserveIntValue(65535)
-- SpitfireLFMkIX:defineFloat("CANOPY_CRANK", 147, { 0, 1 }, "Indicator", "Canopy Crank") --not Working
SpitfireLFMkIX:reserveIntValue(65535)
SpitfireLFMkIX:defineFloat("OXYGENDELIVERYGAUGE", 11, { 0, 0.4 }, "Indicator", "Oxygen Delivery Gauge")
SpitfireLFMkIX:defineFloat("OXYGENSUPPLYGAUGE", 12, { 0, 1 }, "Indicator", "Oxygen Supply Gauge")
SpitfireLFMkIX:defineFloat("TRIMGAUGE", 17, { -1, 1 }, "Indicator", "Trim Gauge")
SpitfireLFMkIX:defineFloat("PNEUMATICPRESSUREGAUGE", 18, { 0, 1 }, "Indicator", "PneumaticPressureGauge")
SpitfireLFMkIX:defineFloat("LEFTWHEELBRAKEGAUGE", 19, { 0, 1 }, "Indicator", "Left Wheel Brake Gauge")
SpitfireLFMkIX:defineFloat("RIGHTWHEELBRAKEGAUGE", 20, { 0, 1 }, "Indicator", "Right Wheel Brake Gauge")
SpitfireLFMkIX:defineFloat("AIRSPEEDGAUGE", 21, { 0.0, 0.5 }, "Indicator", "Airspeed Gauge")
SpitfireLFMkIX:defineFloat("AHORIZONBANK", 23, { -1, 1 }, "Indicator", "AHorizon Bank")
SpitfireLFMkIX:defineFloat("AHORIZONPITCH", 24, { -1, 1 }, "Indicator", "AHorizon Pitch")
SpitfireLFMkIX:defineFloat("VARIOMETERGAUGE", 25, { -1, 1 }, "Indicator", "Variometer Gauge")
SpitfireLFMkIX:defineFloat("ALTIMETERHUNDREDS", 26, { 0, 1 }, "Indicator", "Altimeter 100")
SpitfireLFMkIX:defineFloat("ALTIMETERTHOUSANDS", 27, { 0, 1 }, "Indicator", "Altimeter 1000")
SpitfireLFMkIX:defineFloat("ALTIMETERTENSTHOUSANDS", 28, { 0, 1 }, "Indicator", "Altimeter 10000")
SpitfireLFMkIX:defineFloat("ALTIMETERSETPRESSURE", 29, { 0, 1 }, "Indicator", "Altimeter Set Pressure")
SpitfireLFMkIX:defineFloat("DIGAUGE", 31, { 0, 1 }, "Indicator", "DI Gauge")
SpitfireLFMkIX:defineFloat("SIDESLIPGAUGE", 33, { -1, 1 }, "Indicator", "Sideslip Gauge")
SpitfireLFMkIX:defineFloat("TURNGAUGE", 34, { -1, 1 }, "Indicator", "Turn Gauge")
SpitfireLFMkIX:defineFloat("VOLTMETERGAUGE", 35, { 0, 1 }, "Indicator", "Voltmeter Gauge")
SpitfireLFMkIX:defineFloat("TACHOMETERGAUGE", 37, { 0.0, 0.5 }, "Indicator", "Tachometer Gauge")
SpitfireLFMkIX:defineFloat("BOOSTGAUGE", 39, { 0, 1 }, "Indicator", "Boost Gauge")
SpitfireLFMkIX:defineFloat("OILPRESSUREGAUGE", 40, { 0, 1 }, "Indicator", "Oil Pressure Gauge")
SpitfireLFMkIX:defineFloat("OILTEMPERATUREGAUGE", 41, { 0, 1 }, "Indicator", "Oil Temperature Gauge")
SpitfireLFMkIX:defineFloat("RADIATORTEMPERATUREGAUGE", 42, { 0, 0.7 }, "Indicator", "Radiator Temperature Gauge")
SpitfireLFMkIX:defineFloat("FUELRESERVEGAUGE", 43, { 0, 1 }, "Indicator", "Fuel Reserve Gauge")

-- Warning, Caution and IndicatorLights
SpitfireLFMkIX:defineIndicatorLight("FUEL_PRESS_LIGHT", 45, "Warning, Caution and IndicatorLights", "Fuel Pressure Warning Light (red)")
SpitfireLFMkIX:defineIndicatorLight("GEAR_UP", 48, "Warning, Caution and IndicatorLights", "Gear UP Lamp (red)")
SpitfireLFMkIX:defineIndicatorLight("GEAR_DOWN", 49, "Warning, Caution and IndicatorLights", "Gear DOWN Lamp (green)")
SpitfireLFMkIX:defineIndicatorLight("CHARGER_SEC_GEAR_LIGHT", 59, "Warning, Caution and IndicatorLights", "Supercharger Second Gear Warning Light (yellow)")
SpitfireLFMkIX:defineIndicatorLight("CONSOLE_R_LIGHT", 62, "Warning, Caution and IndicatorLights", "Right Console Light (red)")
SpitfireLFMkIX:defineIndicatorLight("CONSOLE_L_LIGHT", 63, "Warning, Caution and IndicatorLights", "Left Console Light (red)")
SpitfireLFMkIX:defineIndicatorLight("PANEL_BACKLIGHT", 163, "Warning, Caution and IndicatorLights", "Main Panel Backlight (white)")

--Externals
SpitfireLFMkIX:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
SpitfireLFMkIX:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
SpitfireLFMkIX:defineBitFromDrawArgument("EXT_POSITION_LIGHT_TAIL", 192, "External Aircraft Model", "Tail Position Light (White)")
SpitfireLFMkIX:defineBitFromDrawArgument("EXT_POSITION_LIGHT_TOP", 193, "External Aircraft Model", "Top Position Light (White)")
SpitfireLFMkIX:defineBitFromDrawArgument("EXT_POSITION_LIGHT_BOTTOM", 194, "External Aircraft Model", "Bottom Position Light (White)")

SpitfireLFMkIX:defineBitFromDrawArgument("EXT_WOW_TAIL", 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
SpitfireLFMkIX:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
SpitfireLFMkIX:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

SpitfireLFMkIX:defineFloat("CANOPY_POS", 138, { 0, 1 }, "Indicator", "Canopy Position")
SpitfireLFMkIX:defineFloat("PANEL_SHAKE_Z", 142, { -0.8, 0.8 }, "Indicator", "Common Panel Shaker (Z Axis)")
SpitfireLFMkIX:defineFloat("PANEL_SHAKE_Y", 143, { -0.8, 0.8 }, "Indicator", "Common Panel Shaker (Y Axis)")
SpitfireLFMkIX:defineFloat("PANEL_SHAKE_X", 144, { -0.8, 0.8 }, "Indicator", "Common Panel Shaker (X Axis)")
SpitfireLFMkIX:defineFloat("COMPASS_PITCH", 71, { -1, 1 }, "Indicator", "Compass Pitch")
SpitfireLFMkIX:defineFloat("COMPASS_BANK", 72, { -1, 1 }, "Indicator", "Compass Bank")
SpitfireLFMkIX:defineFloat("COMPASS_HDG", 73, { -1, 1 }, "Indicator", "Compass Heading")
SpitfireLFMkIX:defineIndicatorLight("RADIO_A_LIGHT", 120, "Radio Lights", "Radio A Light (white)")
SpitfireLFMkIX:defineIndicatorLight("RADIO_B_LIGHT", 121, "Radio Lights", "Radio B Light (white)")
SpitfireLFMkIX:defineIndicatorLight("RADIO_C_LIGHT", 122, "Radio Lights", "Radio C Light (white)")
SpitfireLFMkIX:defineIndicatorLight("RADIO_D_LIGHT", 123, "Radio Lights", "Radio D Light (white)")
SpitfireLFMkIX:defineIndicatorLight("RADIO_TX_LIGHT", 124, "Radio Lights", "Radio TX Light (white)")

SpitfireLFMkIX:defineReadWriteRadio("VHF_RADIO", 15, 7, 3, 1000, "VHF RADIO")

return SpitfireLFMkIX
