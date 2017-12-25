BIOS.protocol.beginModule("SpitfireLFMkIX", 0x5400)
BIOS.protocol.setExportModuleAircrafts({"SpitfireLFMkIX"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineFixedStepInput = BIOS.util.defineFixedStepInput
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- Oxygen Apparatus Controls
defineTumb("OXY_VALVE", 3, 3003, 13, 1, {0,1}, nil, false, "Cockpit", "Oxygen Valve")  
-- Safety Lever
defineTumb("SAFETY",5, 3001, 3, 1, {0,1}, nil, false, "Weapons", "Safety")
--Triggers
defineTumb("BUTTON_MG",5, 3003, 4, 1, {0,1}, nil, false, "Weapons", "MG Trigger")
defineTumb("BUTTON_CAN",5, 3004, 5, 1, {0,1}, nil, false, "Weapons", "Cannons Trigger")
defineTumb("BUTTON_LINKED",5, 3005, 6, 1, {0,1}, nil, false, "Weapons", "MG+Cannons Trigger")
-- Wheel Brakes Lever
defineTumb("WHEEL_BRAKES",1, 3002, 9, 1, {0,1}, nil, false, "Undercarriage", "Wheel Brakes")
-- Main Panel
-- Altimeter
defineRotary("ALT_MBAR",1, 3037, 30, "Cockpit", "Altimeter Pressure Set")
-- DI
defineRotary("DI",1, 3041, 32, "Cockpit", "Directional Gyro Adjust")
-- Fuel Gauge Button
defineTumb("FUEL_GAUGE",1, 3005, 44, 1, {0,1}, nil, false, "Cockpit", "Show Fuel Contents")
-- Nav. Lights Toggle
defineTumb("NAV_LIGHTS",1, 3007, 46, 1, {0,1}, nil, false, "Lights", "Nav. Lights On/Off")
-- Flaps Lever
defineTumb("FLAPS", 1, 3009, 47, 1, {0,1}, nil, false, "Cockpit", "Landing Flaps Up/Down")  
-- U/C Indicator Blind
defineTumb("UC_BLIND", 1, 3011, 50, 1, {0,1}, nil, false, "Cockpit", "U/C Indicator Blind Up/Down")  
-- Clock Setter Pinion
defineTumb("CLK_PINION_PULL", 1, 3013, 54, 1, {0,1}, nil, false, "Cockpit", "Winding/Adjustment Clock Pull out.")  
defineRotary("CLK_PINION", 1, 3014, 55, "Cockpit", "Winding/Adjustment Clock")  
-- Magnetos Toggles
defineTumb("MAGNETO0",2, 3015, 56, 1, {0,1}, nil, false, "Engine", "No. 1 Magneto On/Off")
defineTumb("MAGNETO1",2, 3017, 57, 1, {0,1}, nil, false, "Engine", "No. 2 Magneto On/Off")
-- Supercharger Mode Toggle
defineTumb("BLOWER",2, 3019, 58, 1, {0,1}, nil, false, "Engine", "Supercharger Mode Auto/M.S.")
-- Illumination Controls
definePotentiometer("PITLITE_LH",4, 3001, 60, {0,1}, "Lights", "Port Flood Lamp Brightness")
definePotentiometer("PITLITE_RH",4, 3004, 61, {0,1}, "Lights", "Stbd. Flood Lamp Brightness")
-- Starter Button Cover
defineTumb("STARTER_COVER",2, 3021, 64, 1, {0,1}, nil, false, "Engine", "Starter Button Cover")
-- Starter Button
defineTumb("STARTER",2, 3023, 65, 1, {0,1}, nil, false, "Engine", "Starter")
-- Booster Coil Button Cover
defineTumb("BOOSTER_COVER",2, 3025, 66, 1, {0,1}, nil, false, "Engine", "Booster Coil Button Cover")
-- Booster Coil Button
defineTumb("BOOSTER",2, 3027, 67, 1, {0,1}, nil, false, "Engine", "Booster Coil")
-- Primer Pump
--TODO definePotentiometer("PRIMER",1, 3030, 69, {0,1}, "Engine", "Primer")
-- Tank Pressurizer Lever
defineTumb("TANK_PRS",2, 3033, 70, 1, {0,1}, nil, false, "Engine", "Fuel Tank Pressure On/Off")
-- Magnetic Compass
defineFixedStepTumb("COMPASS_RING", 1, 3017, 74, 0.00333, {0, 1}, {-0.00333, 0.00333}, nil, "Cockpit", "Compass Course Setter Ring")
-- Gun Sight and Tertiary Weapons Controls
-- Gun Sight Setter Rings
definePotentiometer("GUNSIGHT_RANGE",5,3007, 77, {0.0, 1.0},"Weapons", "Gunsight Range")
definePotentiometer("GUNSIGHT_BASE",5,3010, 78, {0.0, 1.0},"Weapons", "Gunsight Base")
-- Gun Sight Tint Screen
defineTumb("GUNSIGHT_TINT", 5, 3016, 79, 1, {0,1}, nil, false, "Weapons", "Gunsight Tint Screen Up/Down")
-- Gun Sight Master Switch
defineTumb("GUNSIGHT_SWITCH",5, 3018, 80, 1, {0,1}, nil, false, "Weapons", "Gunsight Master On/Off")
-- Gun Sight Dimmer
definePotentiometer("GUNSIGHT_DIMMER",5, 3020, 81, {0.0, 1.0}, "Weapons", "Gun Sight Light")
-- Port Wall
-- Elevator Trim Wheel
definePotentiometer("TRIM_WHEEL",1,3029, 145, {-1.0, 1.0},"Controls", "Elevator Trim")
-- Rudder Trim Wheel
definePotentiometer("RTRIM_WHEEL",1,3044, 146, {-1.0, 1.0},"Controls", "Rudder Trim")
-- Radio Remote Channel Switcher
-- Off Button
defineTumb("RCTRL_OFF", 15, 3001, 115, 1, {0,1}, nil, false, "Radio", "Radio Power OFF")
-- A Button
defineTumb("RCTRL_A", 15, 3002, 116, 1, {0,1}, nil, false, "Radio", "Radio Channel A")
-- B Button
defineTumb("RCTRL_B", 15, 3003, 117, 1, {0,1}, nil, false, "Radio", "Radio Channel B")
-- C Button
defineTumb("RCTRL_C", 15, 3004, 118, 1, {0,1}, nil, false, "Radio", "Radio Channel C")
-- D Button
defineTumb("RCTRL_D", 15, 3005, 119, 1, {0,1}, nil, false, "Radio", "Radio Channel D")
-- Dimmer Toggle
defineTumb("RCTRL_DIM",15, 3006, 125, 1, {0,1}, nil, false, "Radio", "Radio Channel Dimmer")
-- Transmit Lock Toggle
defineTumb("RCTRL_TLOCK",15, 3017, 155, 1, {0,1}, nil, false, "Radio", "Switch Locking Lever")
-- Mode Selector
--TODO NOT WORKING PROPERLY
defineTumb("RCTRL_T_MODE1",15, 3007, 156, 1, {0,1}, nil, false, "Radio", "Radio Mode 1")
defineTumb("RCTRL_T_MODE2",15, 3008, 156, 1, {-1,0}, nil, false, "Radio", "Radio Mode 2")
-- Throttle Quadrant
-- Throttle Lever
--TODO elements["THTL"] = default_movable_axis(_("Throttle"), devices.ENGINE_CONTROLS, device_commands.Button_3, 126, 0.0, 0.1, true, false)
-- Bomb Drop Button
defineTumb("BUTTON_BOMB",5, 3015, 128, 1, {0,1}, nil, false, "Weapons", "Drop Bombs")
-- Airscrew Lever
definePotentiometer("PROP", 2, 3006, 129, {-1.0, 1.0},"Engine", "Propeller RPM")
-- Mix Cut-Off Lever
defineTumb("MIX", 2, 3009, 130, 1, {0,1}, nil, false, "Engine", "Mixture Control Select IDLE CUT OFF/RUN")
defineTumb("UC_DOWN_C",2, 3099, 131, 1, {0,1}, nil, false, "Undercarriage", "Undercarriage Indicator On/Off")
defineTumb("UC_DOWN_C",2, 3099, 131, 1, {0,1}, nil, false, "Undercarriage", "Undercarriage Raise/Lower_down_indication")
-- Radiator Control Toggle
defineTumb("RADIATOR",1, 3033, 133, 1, {0,1}, nil, false, "Engine", "Radiator Flap Open/Auto")
-- Pitot Heater Toggle
defineTumb("PITOT",1, 3035, 134, 1, {0,1}, nil, false, "Engine", "Pitot Heating On/Off")
-- Fuel Pump Toggle
defineTumb("FUEL_PUMP",2, 3043, 135, 1, {0,1}, nil, false, "Engine", "Fuel Pump On/Off")
-- Carb. Air Control Lever
defineTumb("CARB_AIR", 2, 3045, 137, 1, {0,1}, nil, false, "Engine", "Carburettor Air Control")
-- Oil Diluter Button Cover
defineTumb("DILUTER_COVER",2, 3051, 157, 1, {0,1}, nil, false, "Engine", "Oil Dilution Button Cover")
-- Oil Diluter Button
defineTumb("DILUTER",2, 3053, 158, 1, {0,1}, nil, false, "Engine", "Oil Dilution")
-- Supercharger Mode Test Button Cover
defineTumb("MS_TEST_COVER",2, 3055, 159, 1, {0,1}, nil, false, "Engine", "Supercharger Test Button Cover")
-- Supercharger Mode Test Button
defineTumb("MS_TEST",2, 3057, 160, 1, {0,1}, nil, false, "Engine", "Supercharger Test")
-- Radiator Flap Test Button Cover
defineTumb("RAD_TEST_COVER",2, 3059, 161, 1, {0,1}, nil, false, "Engine", "Radiator Test Button Cover")
-- Radiator Flap Test Button
defineTumb("RAD_TEST",2, 3061, 162, 1, {0,1}, nil, false, "Engine", "Radiator Test")
-- Stbd. Wall
-- De-Icer Lever
defineTumb("DEICER", 1, 3021, 87, 1, {0,1}, nil, false, "Cockpit", "Windscreen De-Icer On/Off")
-- U/C Emergency Release Lever
defineTumb("UC_EMER", 1, 3023, 88, 1, {0,1}, nil, false, "Undercarriage", "Undercarriage Emergency Release")
-- Wobble Type Fuel Pump
defineTumb("WOBBLE_PUMP", 2, 3035, 90, 1, {0,1}, nil, false, "Engine", "Wobble Type Fuel Pump")
-- Morse Key & Apparatus
-- Upward Lamp Mode Selector
defineTumb("MORSE_UP_MODE", 4, 3007, 92, 0.5, {0,1}, nil, false, "Lights", "Upward Lamp Mode")
-- Downward Lamp Mode Selector
defineTumb("MORSE_DN_MODE", 4, 3011, 93,  0.5, {0,1}, nil, false, "Lights", "Downward Lamp Mode")
-- Morse Key
defineTumb("MORSE_KEY",4, 3015, 94, 1, {0,1}, nil, false, "Lights", "Morse Key")
-- U/C Lever
defineTumb("UC",1, 3025, 148, 1, {0,1}, nil, false, "Undercarriage", "Undercarriage Raise/Lower")
-- I.F.F. Control Box
-- I.F.F. Upper Toggle (Type B)
defineTumb("IFF_B",4, 3017, 106, 1, {0,1}, nil, false, "Radio", "I.F.F. Circuit B")
-- I.F.F. Lower Toggle (Type D)
defineTumb("IFF_D",4, 3019, 107, 1, {0,1}, nil, false, "Radio", "I.F.F. Circuit D")
-- I.F.F. Protective Cover
defineTumb("IFF_COVER",4, 3021, 108, 1, {0,1}, nil, false, "Radio", "I.F.F. Cover Open/Close")
-- I.F.F. Fore Button (0)
defineTumb("IFF_0",4, 3023, 109, 1, {0,1}, nil, false, "Radio", "I.F.F. Detonate Button 1")
-- I.F.F. Aft Button (1)
defineTumb("IFF_1",4, 3025, 110, 1, {0,1}, nil, false, "Radio", "I.F.F. Detonate Button 2")
-- Fuel Cocks & Tertiary
-- Fuel Cock
defineTumb("FUEL_COCK", 2, 3037, 100, 1, {0,1}, nil, false, "Engine", "Main Tank On/Off")
-- Droptank Cock
defineTumb("DROPTANK_COCK", 2, 3041, 98, 1, {0,1}, nil, false, "Engine", "Drop Tank On/Off")
-- Droptank Release Handle
defineTumb("DROPTANK_JETT", 5, 3041, 99, 1, {0,1}, nil, false, "Engine", "Drop Tank Release")
-- Canopy Controls
-- Cockpit Open/Close Control
defineTumb("HATCH",1, 3051, 149, 1, {0,1}, nil, false, "Cockpit", "Canopy Open/Close")
-- Cockpit Jettison Pull Ball
defineTumb("HATCH_JETTISON", 1, 3057, 140, 1, {0,1}, nil, false, "Cockpit", "Jettison Canopy")
-- Cockpit Side Door Open/Close Control
defineTumb("SIDE_DOOR",1, 3059, 147, 1, {0,1}, nil, false, "Cockpit", "Side Door Open/Close")

defineFloat("CANOPY_TRUCKS", 162, {0, 1}, "Indicator", "Canopy_Trucks")
defineFloat("CANOPY_VISIBILITY", 163, {0, 1}, "Indicator", "Canopy_Visibility")
defineFloat("CANOPY_CRANK", 147, {0.0, 1.0}, "Indicator", "Canopy_Crank")
defineFloat("OXYGENDELIVERYGAUGE", 11, {0.0, 0.4}, "Indicator", "OxygenDeliveryGauge")
defineFloat("OXYGENSUPPLYGAUGE", 12, {0.0, 1.0}, "Indicator", "OxygenSupplyGauge")
defineFloat("TRIMGAUGE", 17, {-1.0, 1.0}, "Indicator", "TrimGauge")
defineFloat("PNEUMATICPRESSUREGAUGE", 18, {0.0, 1.0}, "Indicator", "PneumaticPressureGauge")
defineFloat("LEFTWHEELBRAKEGAUGE", 19, {0.0, 1.0}, "Indicator", "LeftWheelBrakeGauge")
defineFloat("RIGHTWHEELBRAKEGAUGE", 20, {0.0, 1.0}, "Indicator", "RightWheelBrakeGauge")
defineFloat("AIRSPEEDGAUGE", 21, {0.0, 0.5}, "Indicator", "AirspeedGauge")
defineFloat("AHORIZONBANK", 23, {-1.0, 1.0}, "Indicator", "AHorizonBank")
defineFloat("AHORIZONPITCH", 24, {-1.0, 1.0}, "Indicator", "AHorizonPitch")
defineFloat("VARIOMETERGAUGE", 25, {-1.0, 1.0}, "Indicator", "VariometerGauge")
defineFloat("ALTIMETERHUNDREDS", 26, {0.0, 1.0}, "Indicator", "AltimeterHundreds")
defineFloat("ALTIMETERTHOUSANDS", 27, {0.0, 1.0}, "Indicator", "AltimeterThousands")
defineFloat("ALTIMETERTENSTHOUSANDS", 28, {0.0, 1.0}, "Indicator", "AltimeterTensThousands")
defineFloat("ALTIMETERSETPRESSURE", 29, {0.0, 1.0}, "Indicator", "AltimeterSetPressure")
defineFloat("DIGAUGE", 31, {0.0, 1.0}, "Indicator", "DIGauge")
defineFloat("SIDESLIPGAUGE", 33, {-1.0, 1.0}, "Indicator", "SideslipGauge")
defineFloat("TURNGAUGE", 34, {-1.0, 1.0}, "Indicator", "TurnGauge")
defineFloat("VOLTMETERGAUGE", 35, {0.0, 1.0}, "Indicator", "VoltmeterGauge")
defineFloat("TACHOMETERGAUGE", 37, {0.0, 0.5}, "Indicator", "TachometerGauge")
defineFloat("BOOSTGAUGE", 39, {0.0, 1.0}, "Indicator", "BoostGauge")
defineFloat("OILPRESSUREGAUGE", 40, {0.0, 1.0}, "Indicator", "OilPressureGauge")
defineFloat("OILTEMPERATUREGAUGE", 41, {0.0, 1.0}, "Indicator", "OilTemperatureGauge")
defineFloat("RADIATORTEMPERATUREGAUGE", 42, {0.0, 0.7}, "Indicator", "RadiatorTemperatureGauge")
defineFloat("FUELRESERVEGAUGE", 43, {0.0, 1.0}, "Indicator", "FuelReserveGauge")

BIOS.protocol.endModule()
