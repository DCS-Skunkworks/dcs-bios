module("Bf-109K-4", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class Bf_109K_4: Module
local Bf_109K_4 = Module:new("Bf-109K-4", 0x4200, { "Bf-109K-4" })

--overhaul by WarLord v2.0

-- remove Arg# Pilot 540

--CB
Bf_109K_4:defineToggleSwitch("GEN_ON_OFF", 1, 3075, 114, "Circuit Breakers", "Generator CB On/Off")
Bf_109K_4:defineToggleSwitch("GEN_ON", 1, 3077, 114, "Circuit Breakers", "Generator CB On")
Bf_109K_4:definePushButton("GEN_OFF", 1, 3092, 151, "Circuit Breakers", "Generator CB Off")
Bf_109K_4:defineToggleSwitch("PIT_HEAT_ON_OFF", 1, 3012, 115, "Circuit Breakers", "Pitot/Windscreen Heating CB On/Off")
Bf_109K_4:defineToggleSwitch("PIT_HEAT_ON", 1, 3014, 115, "Circuit Breakers", "Pitot/Windscreen Heating CB On")
Bf_109K_4:definePushButton("PIT_HEAT_OFF", 1, 3086, 152, "Circuit Breakers", "Pitot/Windscreen Heating CB Off")
Bf_109K_4:defineToggleSwitch("NAV_LIGHTS_ON_OFF", 1, 3006, 116, "Circuit Breakers", "Nav. Lights CB On/Off")
Bf_109K_4:defineToggleSwitch("NAV_LIGHTS_ON", 1, 3008, 116, "Circuit Breakers", "Nav. Lights CB On")
Bf_109K_4:definePushButton("NAV_LIGHTS_OFF", 1, 3084, 153, "Circuit Breakers", "Nav. Lights CB Off")
Bf_109K_4:defineToggleSwitch("UV_LIGHTS_ON_OFF", 1, 3009, 117, "Circuit Breakers", "UV Lights CB On/Off")
Bf_109K_4:defineToggleSwitch("UV_LIGHTS_ON", 1, 3011, 117, "Circuit Breakers", "UV Lights CB On")
Bf_109K_4:definePushButton("UV_LIGHTS_OFF", 1, 3085, 154, "Circuit Breakers", "UV Lights CB Off")
Bf_109K_4:defineToggleSwitch("WNG_DRP_ON_OFF", 1, 3024, 118, "Circuit Breakers", "Wing / Drop Ordnance CB On/Off")
Bf_109K_4:defineToggleSwitch("WNG_DRP_ON", 1, 3026, 118, "Circuit Breakers", "Wing / Drop Ordnance CB On")
Bf_109K_4:definePushButton("WNG_DRP_OFF", 1, 3090, 155, "Circuit Breakers", "Wing / Drop Ordnance CB Off")
Bf_109K_4:defineToggleSwitch("IGN_ON_OFF", 1, 3003, 119, "Circuit Breakers", "Ignition CB On/Off")
Bf_109K_4:defineToggleSwitch("IGN_ON", 1, 3005, 119, "Circuit Breakers", "Ignition CB On")
Bf_109K_4:definePushButton("IGN_OFF", 1, 3083, 156, "Circuit Breakers", "Ignition CB Off")
Bf_109K_4:defineToggleSwitch("BAT_ON_OFF", 1, 3078, 120, "Circuit Breakers", "Battery CB On/Off")
Bf_109K_4:defineToggleSwitch("BAT_ON", 1, 3080, 120, "Circuit Breakers", "Battery CB On")
Bf_109K_4:definePushButton("BAT_OFF", 1, 3093, 157, "Circuit Breakers", "Battery CB Off")
Bf_109K_4:defineToggleSwitch("RADIO_ON_OFF", 1, 3018, 121, "Circuit Breakers", "Radio CB On/Off")
Bf_109K_4:defineToggleSwitch("RADIO_ON", 1, 3020, 121, "Circuit Breakers", "Radio CB On")
Bf_109K_4:definePushButton("RADIO_OFF", 1, 3088, 158, "Circuit Breakers", "Radio CB Off")
Bf_109K_4:defineToggleSwitch("IFF_ON_OFF", 1, 3021, 122, "Circuit Breakers", "I.F.F. Power CB On/Off")
Bf_109K_4:defineToggleSwitch("IFF_ON", 1, 3023, 122, "Circuit Breakers", "I.F.F. Power CB On")
Bf_109K_4:definePushButton("IFF_OFF", 1, 3089, 159, "Circuit Breakers", "I.F.F. Power CB Off")
Bf_109K_4:defineToggleSwitch("FUEL_ON_OFF", 1, 3015, 123, "Circuit Breakers", "Fuel Pump CB On/Off")
Bf_109K_4:defineToggleSwitch("FUEL_ON", 1, 3017, 123, "Circuit Breakers", "Fuel Pump CB On")
Bf_109K_4:definePushButton("FUEL_OFF", 1, 3087, 160, "Circuit Breakers", "Fuel Pump CB Off")

-- Control Stick Triggers and Buttons
Bf_109K_4:defineToggleSwitch("TRG_SAFETY", 1, 3073, 107, "Stick", "Trigger Safety Cover")
Bf_109K_4:definePushButton("MG_TRIGGER", 1, 3051, 108, "Stick", "Button A MG Trigger")
Bf_109K_4:definePushButton("CANNON_TRIGGER", 1, 3052, 109, "Stick", "Button B1 CANNON Trigger")
Bf_109K_4:definePushButton("BOMB_RLS", 1, 3053, 110, "Stick", "Button B2 BOMB")
Bf_109K_4:definePushButton("MK108_CHARGE", 1, 3055, 111, "Stick", "Button D MK 108")

-- Ignition Controls and Starter and Motor-Related Switches
Bf_109K_4:defineTumb("MAGNETOS", 1, 3066, 59, 0.1, { 0, 0.3 }, nil, false, "Engine", "Magnetos Off/M1/M2/M1+M2")
Bf_109K_4:defineToggleSwitch("STARTER_HNDL_CVR", 1, 3063, 51, "Engine", "Starter Handle Cover")
Bf_109K_4:definePushButton("STARTER_HNDL", 1, 3065, 52, "Engine", "Starter Turn Handle")
Bf_109K_4:defineToggleSwitch("GOV_ON_OFF", 1, 3058, 62, "Engine", "Governor Automation On/Off")
Bf_109K_4:defineToggleSwitch("KILL_SWITCH", 1, 3001, 49, "Engine", "Kill Switch")

Bf_109K_4:definePushButton("GUN_CAM_TRG", 1, 3054, 149, "Weapon Control", "Button T Gun Camera Trigger")
Bf_109K_4:defineToggleSwitch("SZKK3_CTRL_ON_OFF", 1, 3032, 37, "Weapon Control", "SZKK 3 Weapon Control Master Switch On/Off")
Bf_109K_4:defineRotary("SZKK3_AMMO_LEFT", 3, 3001, 38, "Weapon Control", "Left SZ 500 Ammo Counter Setter Pinion")
Bf_109K_4:defineRotary("SZKK3_AMMO_RIGHT", 3, 3004, 39, "Weapon Control", "Right SZ 500 Ammo Counter Setter Pinion")

Bf_109K_4:defineToggleSwitch("MW50_BOOST", 1, 3036, 60, "Engine", "MW50 Boost On/Off")
Bf_109K_4:defineToggleSwitch("WNG_CANNONS_ON_OFF", 1, 3034, 61, "Weapon Control", "Wing Cannons On/Off")
Bf_109K_4:defineToggleSwitch("MK108_R21", 1, 3081, 62, "Weapon Control", "MK 108 / R 21 Toggle")
Bf_109K_4:defineTumb("FUSING_SEL", 3, 3013, 64, 0.25, { 0, 1 }, nil, false, "Weapon Control", "Bomb Fusing Selector")

-- Illumination Controls
Bf_109K_4:definePotentiometer("L_UV_BRIGHT", 1, 3038, 80, { 0, 1 }, "Lamps", "Left UV Lamp Rheostat")
Bf_109K_4:definePotentiometer("R_UV_BRIGHT", 1, 3041, 82, { 0, 1 }, "Lamps", "Right UV Lamp Rheostat")

-- Oxygen Apparatus Controls
Bf_109K_4:definePushButton("OXYGEN_VALVE", 2, 3001, 127, "Oxygen", "Oxygen Valve")
Bf_109K_4:definePushButton("OXY_BYPASS", 2, 3003, 126, "Oxygen", "Oxygen Shower Button")

-- Main Panel Controls
Bf_109K_4:defineToggleSwitch("LG_COVER", 4, 3039, 53, "Landing Gear", "Undercarriage Controls Cover")
Bf_109K_4:defineToggleSwitch("LG_UP", 4, 3001, 54, "Landing Gear", "Raise Undercarriage")
Bf_109K_4:defineToggleSwitch("LG_DOWN", 4, 3002, 55, "Landing Gear", "Lower Undercarriage")
Bf_109K_4:definePushButton("LG_EMG_RLS", 4, 3004, 63, "Landing Gear", "Undercarriage Emergency Release")

Bf_109K_4:definePushButton("FUEL_MW_VALVE", 4, 3027, 96, "Engine", "MW / Fuel")
Bf_109K_4:definePushButton("FUEL_JETTISON", 4, 3041, 112, "Engine", "MW / Fuel Jettison")

-- Fuel and MW50 Systems Controls
Bf_109K_4:definePushButton("FUEL_PRIMER_PUMP", 4, 3012, 140, "Engine", "Fuel Priming Hand Pump")
Bf_109K_4:definePushButton("ENGINE_STOP", 5, 3006, 88, "Engine", "Engine Stop")
Bf_109K_4:defineTumb("BOOSTER_PUMPS", 4, 3023, 87, 0.1, { 0, 0.3 }, nil, false, "Engine", "Booster Pumps")

-- Coolant System Controls
Bf_109K_4:defineTumb("RADIATOR_MODE", 4, 3035, 113, 0.1, { 0, 0.3 }, nil, false, "Engine", "Radiators Mode Lever")
Bf_109K_4:definePushButton("L_RADIATOR_OFF", 4, 3043, 90, "Engine", "LH Radiator Cut-Off Pull Handle")
Bf_109K_4:definePushButton("R_RADIATOR_OFF", 4, 3045, 91, "Engine", "RH Radiator Cut-Off Pull Handle")

-- Altimeter
Bf_109K_4:defineRotary("ALT_PRESS_SET", 8, 3001, 11, "Cockpit", "Altimeter Pressure Set")

-- Artificial Horizon
Bf_109K_4:definePotentiometer("HORIZON_CAGE", 9, 3001, 7, { 0, 0.511 }, "Cockpit", "Horizon Cage")

-- Repeater Compass
Bf_109K_4:defineRotary("COURSE_SET", 10, 3001, 12, "Cockpit", "Course Set")

-- Instruments
Bf_109K_4:defineRotary("CLOCK_SCALE", 19, 3001, 21, "Cockpit", "Clock Scale Set")
Bf_109K_4:defineRotary("CLOCK_SET", 19, 3004, 22, "Cockpit", "Clock Adjusting Knob")
Bf_109K_4:defineToggleSwitch("CLOCK_TIME_LEVER", 19, 3006, 23, "Cockpit", "Time Setting Lever")
Bf_109K_4:definePushButton("CLOCK_TIMER", 19, 3008, 24, "Cockpit", "Start/Stop/Reset Chronometer")

-- Gun Sight
Bf_109K_4:definePotentiometer("SIGHT_BRIGHT", 1, 3044, 48, { 0, 1 }, "Gun Sight", "Gun Sight Brightness")
Bf_109K_4:definePushButton("SIGHT_FOLD", 3, 3007, 139, "Gun Sight", "Gun Sight Fold")
Bf_109K_4:defineToggleSwitch("SIGHT_SCREEN", 3, 3010, 47, "Gun Sight", "Gun Sight Smoked Screen Up/Down")

-- Radio Controls
Bf_109K_4:defineTumb("RADIO_MODE", 14, 3001, 128, 0.1, { 0, 0.3 }, nil, false, "Radio", "Radio Mode")
Bf_109K_4:defineRotary("FUG16_TUNING", 14, 3008, 129, "Radio", "FuG16 ZY Fine Tune")
Bf_109K_4:defineRotary("FUG16_VOLUME", 14, 3003, 130, "Radio", "FuG16 ZY Volume")
Bf_109K_4:defineToggleSwitch("FT_ZF_SWITCH", 14, 3006, 131, "Radio", "FT FT / Y ZF Homing Switch")
Bf_109K_4:defineToggleSwitch("FUG25_MODE", 14, 3012, 132, "Radio", "FuG25 Mode 1 / 2")
Bf_109K_4:definePushButton("FUG25_TEST", 14, 3014, 133, "Radio", "FuG25 Test")

-- Left Wall Controls
Bf_109K_4:definePushButton("TAIL_LOCK", 4, 3021, 97, "Tail Wheel", "Tail Wheel Lock Handle")

Bf_109K_4:defineToggleSwitch("CANOPY_OPEN", 4, 3029, 136, "Canopy", "Canopy Open/Close")
Bf_109K_4:definePushButton("JETTISON_CANOPY", 4, 3032, 83, "Canopy", "Jettison Canopy")

Bf_109K_4:definePushButton("TRIM_WHEEL_UP", 4, 3008, 141, "Trim", "Stabilizer Trim Nose Up")
Bf_109K_4:definePushButton("TRIM_WHEEL_DOWN", 4, 3009, 142, "Trim", "Stabilizer Trim Nose Down")

Bf_109K_4:definePushButton("FLAPS_EXTEND", 4, 3010, 143, "Flaps", "Extend Flaps")
Bf_109K_4:definePushButton("FLAPS_RETRACT", 4, 3011, 144, "Flaps", "Retract Flaps")

-- Notwurf / Ordinance Dump
Bf_109K_4:definePushButton("ORD_EMG_DUMP", 3, 3018, 92, "Weapon Control", "Ordinance Emergency Release")
Bf_109K_4:definePushButton("FLARE_GUN", 20, 3001, 72, "Flare Gun", "Flare Gun Trigger")

-- Throttle Lever
Bf_109K_4:define3PosTumb("DEC_RPM", 1, 3060, 85, "Engine", "Decrease/Increase RPM")
Bf_109K_4:definePushButton("MIC_ON", 14, 3005, 150, "Radio", "Microphone On")

Bf_109K_4:defineToggleSwitch("GOV_AUTO_SWITCH", 1, 3058, 89, "Engine", "Governor Automation On/Off")
Bf_109K_4:definePushButton("COLD_START", 5, 3008, 86, "Engine", "Cold Weather Start Valve Handle")

Bf_109K_4:defineFloat("MIRRORS_DRAW", 183, { 1, 0 }, "Indicator", "mirrors_draw")
Bf_109K_4:defineFloat("PANEL_SHAKE_Z", 146, { -0.8, 0.8 }, "Indicator", "Panel_Shake_Z")
Bf_109K_4:defineFloat("PANEL_SHAKE_Y", 147, { -0.8, 0.8 }, "Indicator", "Panel_Shake_Y")
Bf_109K_4:defineFloat("PANEL_ROT_X", 148, { -0.5, 0.5 }, "Indicator", "Panel_Rot_X")
Bf_109K_4:defineFloat("STICKPITCH", 105, { -1, 1 }, "Indicator", "StickPitch")
Bf_109K_4:defineFloat("STICKBANK", 106, { -1, 1 }, "Indicator", "StickBank")
Bf_109K_4:defineFloat("RUDDERPEDALS", 102, { -1, 1 }, "Indicator", "RudderPedals")
Bf_109K_4:defineFloat("CANOPY_TRUCKS", 162, { 0, 1 }, "Indicator", "Canopy_Trucks")
Bf_109K_4:defineFloat("CANOPY_VISIBILITY", 163, { 0, 1 }, "Indicator", "Canopy_Visibility")
-- Bf_109K_4:defineFloat("CANOPY_CRANK", 147, { 0, 1 }, "Indicator", "Canopy_Crank")
Bf_109K_4:reserveIntValue(65535) -- above control uses a duplicate argument to PANEL_SHAKE_Y
Bf_109K_4:defineFloat("LEFT_WHEEL_BRAKE", 103, { 0, 1 }, "Indicator", "Left_Wheel_Brake")
Bf_109K_4:defineFloat("RIGHT_WHEEL_BRAKE", 104, { 0, 1 }, "Indicator", "Right_Wheel_Brake")
Bf_109K_4:defineFloat("MW50_PRESSURE", 1, { 0, 1 }, "Indicator", "MW50_Pressure")
Bf_109K_4:defineFloat("AIRSPEEDNEEDLE", 2, { 0, 1 }, "Indicator", "AirspeedNeedle")
Bf_109K_4:defineFloat("TURNNEEDLE", 3, { -1, 1 }, "Indicator", "TurnNeedle")
Bf_109K_4:defineFloat("AHORIZON_BANK", 4, { 1.0, -1.0 }, "Indicator", "AHorizon_Bank")
Bf_109K_4:defineFloat("AHORIZON_PITCH", 5, { 1.0, -1.0 }, "Indicator", "AHorizon_Pitch")
Bf_109K_4:defineFloat("SLIPBALL", 6, { -1, 1 }, "Indicator", "Slipball")
Bf_109K_4:defineFloat("AHORIZON_CAGED", 7, { 0, 1 }, "Indicator", "AHorizon_Caged")
Bf_109K_4:defineFloat("ALTIMETER_FINEPTR", 8, { 0, 1 }, "Indicator", "Altimeter_FinePtr")
Bf_109K_4:defineFloat("ALTIMETER_COARSEPTR", 9, { 0, 1 }, "Indicator", "Altimeter_CoarsePtr")
Bf_109K_4:defineFloat("ALTIMETER_PRESSURE", 10, { 0, 1 }, "Indicator", "Altimeter_Pressure")
Bf_109K_4:defineFloat("PRESSURE_SETTER_PINION", 11, { 0, 1 }, "Indicator", "Pressure_Setter_Pinion")
Bf_109K_4:defineFloat("COMPASSHEADING", 13, { 0, 1 }, "Indicator", "CompassHeading")
Bf_109K_4:defineFloat("COMMANDEDCOURSE", 12, { 0, 1 }, "Indicator", "CommandedCourse")
Bf_109K_4:defineFloat("AFN2_HORIZONTAL_NEEDLE", 14, { -1, 1 }, "Indicator", "AFN2_Horizontal_Needle")
Bf_109K_4:defineFloat("AFN2_VERTICAL_NEEDLE", 15, { 0, 1 }, "Indicator", "AFN2_Vertical_Needle")
Bf_109K_4:defineIndicatorLight("AFN2_SIGNAL_LAMP", 16, "Indicator", "AFN2_Signal_Lamp (white)")
Bf_109K_4:defineFloat("FUEL_PRESSURE", 25, { 0, 1 }, "Indicator", "Fuel_Pressure")
Bf_109K_4:defineFloat("OIL_PRESSURE", 26, { 0, 1.0 }, "Indicator", "Oil_Pressure")
Bf_109K_4:defineFloat("COOLANT_TEMPERATURE", 27, { -1, 1 }, "Indicator", "Coolant_Temperature")
Bf_109K_4:defineFloat("OIL_TEMPERATURE", 28, { -1, 1 }, "Indicator", "Oil_Temperature")
Bf_109K_4:defineFloat("ENGINE_RPM", 29, { 0, 1 }, "Indicator", "Engine_RPM")
Bf_109K_4:defineFloat("PROPELLER_PITCH_HOUR", 30, { 0, 1 }, "Indicator", "Propeller_Pitch_Hour")
Bf_109K_4:defineFloat("PROPELLER_PITCH_MINUTE", 31, { 0, 1 }, "Indicator", "Propeller_Pitch_Minute")
Bf_109K_4:defineFloat("MANIFOLD_PRESSURE", 32, { 0, 1 }, "Indicator", "Manifold_Pressure")
Bf_109K_4:defineFloat("FUEL_TANK_FUSELAGE", 33, { -1, 1 }, "Indicator", "Fuel_Tank_Fuselage")
Bf_109K_4:defineFloat("OXYGEN_PRESSURE", 34, { 0, 1 }, "Indicator", "Oxygen_Pressure")
Bf_109K_4:defineFloat("OXYGEN_FLOW_BLINKER", 35, { 0, 1 }, "Indicator", "Oxygen_Flow_Blinker")
Bf_109K_4:defineFloat("VARIOMETERNEEDLE", 36, { -0.3, 0.3 }, "Indicator", "VariometerNeedle")
Bf_109K_4:defineFloat("MG131_0_SHELL_COUNTER", 40, { 0, 1 }, "Indicator", "MG131_0_Shell_Counter")
Bf_109K_4:defineFloat("MG131_1_SHELL_COUNTER", 41, { 0, 1 }, "Indicator", "MG131_1_Shell_Counter")
Bf_109K_4:defineFloat("MG131_0_KLAPPANKER", 42, { 0, 1 }, "Indicator", "MG131_0_Klappanker")
Bf_109K_4:defineFloat("MG131_1_KLAPPANKER", 43, { 0, 1 }, "Indicator", "MG131_1_Klappanker")
Bf_109K_4:defineIndicatorLight("LEFTWING_MG151_CONTROL_LAMP", 44, "Indicator", "LeftWing MG151 Control Lamp (yellow)")
Bf_109K_4:defineIndicatorLight("RIGHTWING_MG151_CONTROL_LAMP", 45, "Indicator", "RightWing MG151 Control Lamp (yellow)")
Bf_109K_4:defineFloat("BODYSTATE", 46, { 0, 1 }, "Indicator", "BodyState")
Bf_109K_4:defineFloat("SMOKEDSCREEN", 47, { 0, 1 }, "Indicator", "SmokedScreen")
Bf_109K_4:defineFloat("SIGHTBRIGHTNESS", 48, { 0, 1 }, "Indicator", "SightBrightness")
Bf_109K_4:defineIndicatorLight("LANDINGGEARREDLIGHT", 56, "Indicator", "LandingGearLight (red)")
Bf_109K_4:defineIndicatorLight("LANDINGGEARGREENLIGHTLEFT", 57, "Indicator", "LandingGearLightLeft (green)")
Bf_109K_4:defineIndicatorLight("LANDINGGEARGREENLIGHTRIGHT", 58, "Indicator", "LandingGearLightRight (green)")
Bf_109K_4:defineIndicatorLight("FUEL_RESERVE_LAMP", 164, "Indicator", "Fuel Reserve Lamp")

Bf_109K_4:defineGaugeValue("MANIFOLD_PRESSURE_VALUE", 32, { 10, 65 + 10 }, "Gauge Values", "Manifold Pressure kg/cm2")
Bf_109K_4:defineGaugeValue("METHANOL_WATER_PRES_VALUE", 1, { 0, 30 }, "Gauge Values", "Methanol Water Pres kg/cm2 Read as X.X")
Bf_109K_4:defineGaugeValue("PROPELLER_PITCH_DEG_VALUE", 30, { 26, 63 + 26 }, "Gauge Values", "Propeller Pitch Degrees")
Bf_109K_4:defineGaugeValue("FUEL_LEVEL_VALUE", 33, { 0, 400 }, "Gauge Values", "Fuel Level Liters")
Bf_109K_4:defineGaugeValue("FUEL_PRESSURE_VALUE", 25, { 0, 20 }, "Gauge Values", "Fuel Pres kg/cm2 Read as X.X")
Bf_109K_4:defineGaugeValue("OIL_PRESSURE_VALUE", 26, { 0, 100 }, "Gauge Values", "Oil Pressure kg/cm2 Read as X.X or XX.X")
Bf_109K_4:defineGaugeValue("OIL_TEMPERATURE_VALUE", 28, { 0, 130 }, "Gauge Values", "Oil Temp °C")
Bf_109K_4:defineGaugeValue("COOLANT_TEMPERATURE_VALUE", 27, { 0, 130 }, "Gauge Values", "Coolant Temp °C")
Bf_109K_4:defineGaugeValue("OXYGEN_PRESSURE_VALUE", 34, { 0, 250 }, "Gauge Values", "Oxygen Pressure kg/cm2")
Bf_109K_4:defineGaugeValue("AIRSPEED_VALUE", 2, { 0, 750 }, "Gauge Values", "Airspeed km/h")
Bf_109K_4:defineGaugeValue("ALTITUDE_VALUE", 9, { 0, 9999 }, "Gauge Values", "Altitude Meters")
Bf_109K_4:defineGaugeValue("TACHOMETER_VALUE", 29, { 400, 3200 + 400 }, "Gauge Values", "Tachometer RPM")
Bf_109K_4:defineGaugeValue("BAROMETRIC_PRESSURE_VALUE", 10, { 920, 920 + 120 }, "Gauge Values", "Barometric Pressure mb")
Bf_109K_4:defineGaugeValue("COMPASS_HEADING_VALUE", 13, { 0, 360 }, "Gauge Values", "Compass Heading")

--Externals
Bf_109K_4:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
Bf_109K_4:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
Bf_109K_4:defineBitFromDrawArgument("EXT_POSITION_LIGHT_TAIL", 192, "External Aircraft Model", "Tail Position Light (white)")
Bf_109K_4:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
Bf_109K_4:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
Bf_109K_4:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

Bf_109K_4:defineToggleSwitch("COCKPIT_VENT_L", 4, 3060, 98, "Cockpit", "Left Cockpit Vent")
Bf_109K_4:defineToggleSwitch("COCKPIT_VENT_R", 4, 3062, 99, "Cockpit", "Right Cockpit Vent")

Bf_109K_4:definePushButton("FLARE_GUN_GN", 20, 3003, 165, "Flare Gun", "Fire Flare Gun Green")
Bf_109K_4:definePushButton("FLARE_GUN_RD", 20, 3004, 165, "Flare Gun", "Fire Flare Gun Red")
Bf_109K_4:definePushButton("FLARE_GUN_WH", 20, 3005, 165, "Flare Gun", "Fire Flare Gun White")
Bf_109K_4:definePushButton("FLARE_GUN_YE", 20, 3006, 165, "Flare Gun", "Fire Flare Gun Yellow")

-- Rudder and Wheel Brakes
Bf_109K_4:definePotentiometer("LH_WHEELBRAKE", 4, 3015, 103, { 0, 1 }, "Cockpit", "Left Wheel Brake")
Bf_109K_4:definePotentiometer("RH_WHEELBRAKE", 4, 3018, 104, { 0, 1 }, "Cockpit", "Right Wheel Brake")

Bf_109K_4:defineFloat("CANOPY_POS", 95, { 0, 1 }, "Cockpit", "Canopy Position")

Bf_109K_4:defineIndicatorLight("BOMB_SBY_L", 65, "Indicator", "Bomb Standby Light (red)")
Bf_109K_4:defineIndicatorLight("BOMB_1_L", 66, "Indicator", "Bomb 1 Status Light (white)")
Bf_109K_4:defineIndicatorLight("BOMB_2_L", 67, "Indicator", "Bomb 2 Status Light (white)")
Bf_109K_4:defineIndicatorLight("BOMB_3_L", 68, "Indicator", "Bomb 3 Status Light (white)")
Bf_109K_4:defineIndicatorLight("BOMB_4_L", 69, "Indicator", "Bomb 4 Status Light (white)")
Bf_109K_4:defineFloat("PANEL_GLOW", 79, { 0, 1 }, "Indicator", "Gauges Glow (green)")

Bf_109K_4:defineReadWriteRadio("VHF_RADIO", 14, 6, 3, 1000, "VHF_RADIO")

return Bf_109K_4
