BIOS.protocol.beginModule("SpitfireLFMkIX", 0x5400)
BIOS.protocol.setExportModuleAircrafts({"SpitfireLFMkIX", "SpitfireLFMkIXCW"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePotentiometer = BIOS.util.definePotentiometer
local define3Pos2CommandSwitchWW2 = BIOS.util.define3Pos2CommandSwitchWW2
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local definePushButton = BIOS.util.definePushButton
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- remove Arg# Pilot 165

--Oxygen Apparatus Controls
defineTumb("OXY_VALVE", 3, 3003, 13, 1, {0,1}, nil, false, "Cockpit", "Oxygen Valve")  
defineTumb("SAFETY",5, 3001, 3, 1, {0,1}, nil, false, "Weapons", "Safety Lever")
definePushButton("BUTTON_MG",5, 3003, 4, "Weapons", "MG Trigger")
definePushButton("BUTTON_CAN",5, 3004, 5, "Weapons", "Cannons Trigger")
definePushButton("BUTTON_LINKED",5, 3005, 6, "Weapons", "MG+Cannons Trigger")
definePotentiometer("WHEEL_BRAKES",1, 3002, 9, {0,1}, "Undercarriage", "Wheel Brakes Lever")

-- Main Panel
defineRotary("ALT_MBAR",1, 3037, 30, "Cockpit", "Altimeter Pressure Set")
defineRotary("DI",1, 3041, 32, "Cockpit", "Directional Gyro Adjust")
definePushButton("FUEL_GAUGE",1, 3005, 44, "Cockpit", "Show Fuel Contents")
defineTumb("NAV_LIGHTS",1, 3007, 46, 1, {0,1}, nil, false, "Lights", "Nav. Lights On/Off")
defineTumb("FLAPS", 1, 3009, 47, 1, {0,1}, nil, false, "Cockpit", "Landing Flaps Up/Down")  
defineTumb("UC_BLIND", 1, 3011, 50, 1, {0,1}, nil, false, "Cockpit", "U/C Indicator Blind Up/Down")  
definePushButton("CLK_PINION_PULL", 17, 3006, 54, "Cockpit", "Winding/Adjustment Clock Pull out.")  
defineRotary("CLK_PINION", 17, 3004, 55, "Cockpit", "Winding/Adjustment Clock")  
defineTumb("MAGNETO0",2, 3015, 56, 1, {0,1}, nil, false, "Engine", "No. 1 Magneto On/Off")
defineTumb("MAGNETO1",2, 3017, 57, 1, {0,1}, nil, false, "Engine", "No. 2 Magneto On/Off")
defineTumb("BLOWER",2, 3019, 58, 1, {0,1}, nil, false, "Engine", "Supercharger Mode Auto/M.S.")
definePotentiometer("PITLITE_LH",4, 3001, 60, {0,1}, "Lights", "Port Flood Lamp Brightness")
definePotentiometer("PITLITE_RH",4, 3004, 61, {0,1}, "Lights", "Stbd. Flood Lamp Brightness")
defineTumb("STARTER_COVER",2, 3021, 64, 1, {0,1}, nil, false, "Engine", "Starter Button Cover")
definePushButton("STARTER",2, 3023, 65, "Engine", "Starter")
defineTumb("BOOSTER_COVER",2, 3025, 66, 1, {0,1}, nil, false, "Engine", "Booster Coil Button Cover")
defineTumb("BOOSTER",2, 3027, 67, 1, {0,1}, nil, false, "Engine", "Booster Coil")
definePotentiometer("PRIMER_TURN",2, 3029, 68, {0,1}, "Engine", "Primer Pump Turn")
definePushButton("PRIMER_PULL",2, 3030, 69, "Engine", "Primer Pump Pull")
defineTumb("TANK_PRS",2, 3033, 70, 1, {0,1}, nil, false, "Engine", "Fuel Tank Pressure On/Off")
defineFixedStepTumb("COMPASS_RING", 1, 3017, 74, 0.00333, {0, 1}, {-0.00333, 0.00333}, nil, "Cockpit", "Compass Course Setter Ring")

-- Gun Sight and Tertiary Weapons Controls
definePotentiometer("GUNSIGHT_RANGE", 5, 3007, 77, {0.0, 1.0},"Weapons", "Gunsight Range")
definePotentiometer("GUNSIGHT_BASE", 5, 3010, 78, {0.0, 1.0},"Weapons", "Gunsight Base")
defineTumb("GUNSIGHT_TINT", 5, 3016, 79, 1, {0,1}, nil, false, "Weapons", "Gunsight Tint Screen Up/Down")
defineTumb("GUNSIGHT_SWITCH",5, 3018, 80, 1, {0,1}, nil, false, "Weapons", "Gunsight Master On/Off")
definePotentiometer("GUNSIGHT_DIMMER",5, 3020, 81, {0.0, 1.0}, "Weapons", "Gun Sight Light")

-- Port Wall
definePotentiometer("TRIM_WHEEL",1,3029, 145, {-1.0, 1.0},"Controls", "Elevator Trim")
definePotentiometer("RTRIM_WHEEL",1,3044, 146, {-1.0, 1.0},"Controls", "Rudder Trim")

-- Radio Remote Channel Switcher
defineTumb("RCTRL_OFF", 15, 3001, 115, 1, {0,1}, nil, false, "Radio", "Radio Power OFF")
defineTumb("RCTRL_A", 15, 3002, 116, 1, {0,1}, nil, false, "Radio", "Radio Channel A")
defineTumb("RCTRL_B", 15, 3003, 117, 1, {0,1}, nil, false, "Radio", "Radio Channel B")
defineTumb("RCTRL_C", 15, 3004, 118, 1, {0,1}, nil, false, "Radio", "Radio Channel C")
defineTumb("RCTRL_D", 15, 3005, 119, 1, {0,1}, nil, false, "Radio", "Radio Channel D")
defineTumb("RCTRL_DIM",15, 3006, 125, 1, {0,1}, nil, false, "Radio", "Radio Channel Dimmer")
defineTumb("RCTRL_TLOCK",15, 3017, 155, 1, {0,1}, nil, false, "Radio", "Switch Locking Lever")
define3Pos2CommandSwitchWW2("RCTRL_T_MODE", 15, 3008, 3007, 156, "Radio", "Radio Mode Switch")

-- Throttle Quadrant
definePushButton("BUTTON_BOMB",5, 3015, 128, "Weapons", "Drop Bombs")
definePotentiometer("PROP", 2, 3006, 129, {-1.0, 1.0},"Engine", "Propeller RPM")
defineTumb("MIX", 2, 3009, 130, 1, {0,1}, nil, false, "Engine", "Mixture Control Select IDLE CUT OFF/RUN")
defineTumb("UC_DOWN_C",2, 3099, 131, 1, {0,1}, nil, false, "Undercarriage", "U/C Indicator Cut-Off On/Off")
defineTumb("RADIATOR",1, 3033, 133, 1, {0,1}, nil, false, "Engine", "Radiator Flap Open/Auto")
defineTumb("PITOT",1, 3035, 134, 1, {0,1}, nil, false, "Engine", "Pitot Heating On/Off")
defineTumb("FUEL_PUMP",2, 3043, 135, 1, {0,1}, nil, false, "Engine", "Fuel Pump On/Off")
defineTumb("CARB_AIR", 2, 3045, 137, 1, {0,1}, nil, false, "Engine", "Carburettor Air Control")
defineTumb("DILUTER_COVER",2, 3051, 157, 1, {0,1}, nil, false, "Engine", "Oil Dilution Button Cover")
definePushButton("DILUTER",2, 3053, 158, "Engine", "Oil Dilution")
defineTumb("MS_TEST_COVER",2, 3055, 159, 1, {0,1}, nil, false, "Engine", "Supercharger Test Button Cover")
definePushButton("MS_TEST",2, 3057, 160, "Engine", "Supercharger Test")
defineTumb("RAD_TEST_COVER",2, 3059, 161, 1, {0,1}, nil, false, "Engine", "Radiator Test Button Cover")
definePushButton("RAD_TEST",2, 3061, 162, "Engine", "Radiator Test")

-- Stbd. Wall
defineTumb("DEICER", 1, 3021, 87, 1, {0,1}, nil, false, "Cockpit", "Windscreen De-Ice On/Off")
defineTumb("UC_EMER", 1, 3023, 88, 1, {0,1}, nil, false, "Undercarriage", "Undercarriage Emergency Release")
defineTumb("WOBBLE_PUMP", 2, 3035, 90, 1, {0,1}, nil, false, "Engine", "Wobble Type Fuel Pump")
defineTumb("UC",1, 3025, 148, 1, {0,1}, nil, false, "Undercarriage", "Undercarriage Raise/Lower")

-- Morse Key & Apparatus
defineTumb("MORSE_UP_MODE", 4, 3007, 92, 0.5, {0,1}, nil, false, "Lights", "Upward Lamp Mode")
defineTumb("MORSE_DN_MODE", 4, 3011, 93,  0.5, {0,1}, nil, false, "Lights", "Downward Lamp Mode")
defineTumb("MORSE_KEY",4, 3015, 94, 1, {0,1}, nil, false, "Lights", "Morse Key")

-- I.F.F. Control Box
defineTumb("IFF_B",4, 3017, 106, 1, {0,1}, nil, false, "Radio", "I.F.F. Circuit B")
defineTumb("IFF_D",4, 3019, 107, 1, {0,1}, nil, false, "Radio", "I.F.F. Circuit D")
defineTumb("IFF_COVER",4, 3021, 108, 1, {0,1}, nil, false, "Radio", "I.F.F. Cover Open/Close")
definePushButton("IFF_0",4, 3023, 109, "Radio", "I.F.F. Detonate Button 1")
definePushButton("IFF_1",4, 3025, 110, "Radio", "I.F.F. Detonate Button 2")

-- Fuel Cocks & Tertiary
defineTumb("FUEL_COCK", 2, 3037, 100, 1, {0,1}, nil, false, "Engine", "Main Tank On/Off")
defineTumb("DROPTANK_COCK", 2, 3041, 98, 1, {0,1}, nil, false, "Engine", "Drop Tank On/Off")
defineTumb("DROPTANK_JETT", 5, 3041, 99, 1, {0,1}, nil, false, "Engine", "Drop Tank Release Handle")

-- Canopy Controls
defineTumb("HATCH",1, 3051, 149, 1, {0,1}, nil, false, "Cockpit", "Canopy Open/Close Control")
defineTumb("HATCH_JETTISON", 1, 3057, 140, 1, {0,1}, nil, false, "Cockpit", "Jettison Canopy Pull Ball")
defineTumb("SIDE_DOOR",1, 3059, 147, 1, {0,1}, nil, false, "Cockpit", "Side Door Open/Close Control")

-- Indicators
defineFloat("CANOPY_TRUCKS", 162, {0, 1}, "Indicator", "Canopy Trucks") --not Working
defineFloat("CANOPY_VISIBILITY", 163, {0, 1}, "Indicator", "Canopy Visibility") --not Working
defineFloat("CANOPY_CRANK", 147, {0, 1}, "Indicator", "Canopy Crank") --not Working
defineFloat("OXYGENDELIVERYGAUGE", 11, {0.0, 0.4}, "Indicator", "Oxygen Delivery Gauge")
defineFloat("OXYGENSUPPLYGAUGE", 12, {0.0, 1.0}, "Indicator", "Oxygen Supply Gauge")
defineFloat("TRIMGAUGE", 17, {-1.0, 1.0}, "Indicator", "Trim Gauge")
defineFloat("PNEUMATICPRESSUREGAUGE", 18, {0.0, 1.0}, "Indicator", "PneumaticPressureGauge")
defineFloat("LEFTWHEELBRAKEGAUGE", 19, {0.0, 1.0}, "Indicator", "Left Wheel Brake Gauge")
defineFloat("RIGHTWHEELBRAKEGAUGE", 20, {0.0, 1.0}, "Indicator", "Right Wheel Brake Gauge")
defineFloat("AIRSPEEDGAUGE", 21, {0.0, 0.5}, "Indicator", "Airspeed Gauge")
defineFloat("AHORIZONBANK", 23, {-1.0, 1.0}, "Indicator", "AHorizon Bank")
defineFloat("AHORIZONPITCH", 24, {-1.0, 1.0}, "Indicator", "AHorizon Pitch")
defineFloat("VARIOMETERGAUGE", 25, {-1.0, 1.0}, "Indicator", "Variometer Gauge")
defineFloat("ALTIMETERHUNDREDS", 26, {0.0, 1.0}, "Indicator", "Altimeter 100")
defineFloat("ALTIMETERTHOUSANDS", 27, {0.0, 1.0}, "Indicator", "Altimeter 1000")
defineFloat("ALTIMETERTENSTHOUSANDS", 28, {0.0, 1.0}, "Indicator", "Altimeter 10000")
defineFloat("ALTIMETERSETPRESSURE", 29, {0.0, 1.0}, "Indicator", "Altimeter Set Pressure")
defineFloat("DIGAUGE", 31, {0.0, 1.0}, "Indicator", "DI Gauge")
defineFloat("SIDESLIPGAUGE", 33, {-1.0, 1.0}, "Indicator", "Sideslip Gauge")
defineFloat("TURNGAUGE", 34, {-1.0, 1.0}, "Indicator", "Turn Gauge")
defineFloat("VOLTMETERGAUGE", 35, {0.0, 1.0}, "Indicator", "Voltmeter Gauge")
defineFloat("TACHOMETERGAUGE", 37, {0.0, 0.5}, "Indicator", "Tachometer Gauge")
defineFloat("BOOSTGAUGE", 39, {0.0, 1.0}, "Indicator", "Boost Gauge")
defineFloat("OILPRESSUREGAUGE", 40, {0.0, 1.0}, "Indicator", "Oil Pressure Gauge")
defineFloat("OILTEMPERATUREGAUGE", 41, {0.0, 1.0}, "Indicator", "Oil Temperature Gauge")
defineFloat("RADIATORTEMPERATUREGAUGE", 42, {0.0, 0.7}, "Indicator", "Radiator Temperature Gauge")
defineFloat("FUELRESERVEGAUGE", 43, {0.0, 1.0}, "Indicator", "Fuel Reserve Gauge")

-- Warning, Caution and IndicatorLights
defineIndicatorLight("FUEL_PRESS_LIGHT", 45, "Warning, Caution and IndicatorLights","Fuel Pressure Warning Light (red)")
defineIndicatorLight("GEAR_UP", 48, "Warning, Caution and IndicatorLights","Gear UP Lamp (red)")
defineIndicatorLight("GEAR_DOWN", 49, "Warning, Caution and IndicatorLights","Gear DOWN Lamp (green)")
defineIndicatorLight("CHARGER_SEC_GEAR_LIGHT", 59, "Warning, Caution and IndicatorLights","Supercharger Second Gear Warning Light (yellow)")
defineIndicatorLight("CONSOLE_R_LIGHT", 62, "Warning, Caution and IndicatorLights","Right Console Light (white)")
defineIndicatorLight("CONSOLE_L_LIGHT", 63, "Warning, Caution and IndicatorLights","Left Console Light (white)")
defineIndicatorLight("PANEL_BACKLIGHT", 163, "Warning, Caution and IndicatorLights","Main Panel Backlight (white)")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Position Light (White)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_TOP", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Position Light (White)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_BOTTOM", function()
	if LoGetAircraftDrawArgumentValue(194) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Bottom Position Light (White)")

defineIntegerFromGetter("EXT_WOW_TAIL", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

defineFloat("CANOPY_POS", 138, {0, 1}, "Indicator", "Canopy Position")
defineFloat("PANEL_SHAKE_Z", 142, {-0.8, 0.8}, "Indicator", "Common Panel Shaker (Z Axis)")
defineFloat("PANEL_SHAKE_Y", 143, {-0.8, 0.8}, "Indicator", "Common Panel Shaker (Y Axis)")
defineFloat("PANEL_SHAKE_X", 144, {-0.8, 0.8}, "Indicator", "Common Panel Shaker (X Axis)")
defineFloat("COMPASS_PITCH", 71, {-1, 1}, "Indicator", "Compass Pitch")
defineFloat("COMPASS_BANK", 72, {-1, 1}, "Indicator", "Compass Bank")
defineFloat("COMPASS_HDG", 73, {-1, 1}, "Indicator", "Compass Heading")
defineIndicatorLight("RADIO_A_LIGHT", 120, "Radio", "Radio A Light (white)")
defineIndicatorLight("RADIO_B_LIGHT", 121, "Radio", "Radio B Light (white)")
defineIndicatorLight("RADIO_C_LIGHT", 122, "Radio", "Radio C Light (white)")
defineIndicatorLight("RADIO_D_LIGHT", 123, "Radio", "Radio D Light (white)")
defineIndicatorLight("RADIO_TX_LIGHT", 124, "Radio", "Radio TX Light (white)")

BIOS.protocol.endModule()