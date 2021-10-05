BIOS.protocol.beginModule("Mosquito", 0x7000)
BIOS.protocol.setExportModuleAircrafts({"MosquitoFBMkVI"})
--v1.1 by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local define3PosTumb = BIOS.util.define3PosTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3Pos2CommandSwitchWW2 = BIOS.util.define3Pos2CommandSwitchWW2
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch

-- remove Arg# Pilot 500

--Main Pit
definePushButton("STICK_BTN_A", 5, 3005, 245, "Stick", "Stick Button A - MG Trigger")
definePushButton("STICK_BTN_B1", 5, 3006, 246, "Stick", "Stick Button B1 - Cannon Trigger")	
definePushButton("STICK_BTN_B2", 5, 3007, 244, "Stick", "Stick Button B2 - Secondary & Drop Ordnance Trigger")
definePotentiometer("STICK_WH_BRK", 2, 3001, 248, {0, 1}, "Stick", "Stick Wheel Brakes Lever")
definePushButton("STICK_WH_BRK_LOCK", 2, 3004, 291, "Stick", "Stick Wheel Brakes Lever Lock")
defineToggleSwitch("WINDOW_CONTROL_L", 2, 3022, 251, "Cockpit", "Left Side Window Open/Close Control")
defineToggleSwitch("WINDOW_CONTROL_R", 2, 3063, 253, "Cockpit", "Right Side Window Open/Close Control")
definePushButton("ARMOR_HEADREST", 2, 3071, 312, "Cockpit", "Armor Headrest Lock")
definePotentiometer("GUNSIGHT_RANGE", 5, 3045, 107, {0, 1}, "Reflector Sight", "Reflector Sight Setter Rings Range")
definePotentiometer("GUNSIGHT_SPAN", 5, 3048, 108, {0, 1}, "Reflector Sight", "Reflector Sight Setter Rings Span")
definePotentiometer("GUNSIGHT_L_DIM", 4, 3009, 13, {0, 1}, "Reflector Sight" , "Reflector Sight Dimmer")

--J.B.A.
defineToggleSwitch("MASTER_SWITCH", 3, 3009, 124, "JBA", "Master Gate Switch")
defineToggleSwitch("PORT_MAGNETO_1", 3, 3001, 125, "JBA", "Magneto Switch Port 1")
defineToggleSwitch("PORT_MAGNETO_2", 3, 3003, 126, "JBA", "Magneto Switch Port 2")
defineToggleSwitch("PORT_START_CVR", 3, 3052, 129, "JBA", "Starter Switch Cover Port")
definePushButton("PORT_START_SW", 3, 3054, 131, "JBA", "Starter Switch Port")
defineToggleSwitch("PORT_BOOST_CVR", 3, 3058, 133, "JBA", "Booster Switch Cover Port")
definePushButton("PORT_BOOST_SW", 3, 3060, 135, "JBA", "Booster Switch Port")
defineToggleSwitch("PORT_AIRSCREW", 3, 3081, 354, "JBA", "Feathering Switch Port")
defineToggleSwitch("PORT_RAD_FLAP", 4, 3062, 112, "JBA", "Radiator Flap Switch Port")
defineToggleSwitch("STBD_RAD_FLAP", 4, 3064, 113, "JBA", "Radiator Flap Switch Starboard")
defineToggleSwitch("STBD_AIRSCREW", 3, 3082, 355, "JBA", "Feathering Switch Starboard")
defineToggleSwitch("STBD_BOOST_CVR", 3, 3061, 134, "JBA", "Booster Switch Cover Starboard")
definePushButton("STBD_BOOST_SW", 3, 3063, 136, "JBA", "Booster Switch Starboard")
defineToggleSwitch("STBD_START_CVR", 3, 3055, 130, "JBA", "Starter Switch Cover Starboard")
definePushButton("STBD_START_SW", 3, 3057, 132, "JBA", "Starter Switch Starboard")
defineToggleSwitch("STBD_MAGNETO_1", 3, 3005, 127, "JBA", "Magneto Switch Starboard 1")
defineToggleSwitch("STBD_MAGNETO_2", 3, 3007, 128, "JBA", "Magneto Switch Starboard 2")
definePotentiometer("FLOOD_L_DIM_R", 4, 3053, 14, {0, 1}, "JBA", "Right Flood Light Dimmer")
definePotentiometer("BOX_B_L_DIM", 4, 3056, 15, {0, 1}, "JBA", "J.B.B. Flood Light Dimmer")
defineToggleSwitch("AIR_FILTER", 4, 3066, 114, "JBA", "Tropical Air Filter Switch")
defineToggleSwitch("FUEL_PUMP_L_CVR", 2, 3065, 282, "JBA", "Fuel Pump Light Cover")

defineIndicatorLight("FUEL_PUMP_L", 281, "JBA Lights", "Fuel Pump Light (yellow)")

--Main Panel
defineRotary("REP_COMP", 8, 3001, 49, "Main Panel", "Repeater Compass Course Set")
defineRotary("ALT_SET", 2, 3010, 72, "Main Panel", "Altimeter Set")
defineRotary("DI_SET", 2, 3013, 74, "Main Panel", "Directional Gyro Set")
defineRotary("UC_BLIND", 2, 3018, 304, "Main Panel", "U/C Indicator Blind Up/Down")
defineToggleSwitch("PORT_OXY_VALVE", 15, 3003, 84, "Main Panel", "Oxygen Regulator Port")
definePushButton("BOOST_CUT_OFF", 3, 3049, 292, "Main Panel", "Boost Cut-Off T-Handle")
defineToggleSwitch("PORT_LAND_L_SW", 4, 3018, 62, "Main Panel", "Landing Light Switch Port")
defineToggleSwitch("STBD_LAND_L_SW", 4, 3020, 63, "Main Panel", "Landing Light Switch Starboard")
defineTumb("BOMB_DOORS_LVR", 17, 3001, 115, 1, {-1, 1}, nil, false, "Main Panel", "Bomb Doors Lever")
defineTumb("CHASSIS_LVR", 17, 3002, 116, 1, {-1, 1}, nil, false, "Main Panel", "Chassis Lever")
defineTumb("FLAPS_LVR", 17, 3003, 118, 1, {-1, 1}, nil, false, "Main Panel", "Flaps Lever")
defineToggleSwitch("CHASSIS_GATE", 17, 3004, 117, "Main Panel", "Chassis Lever Gate")
defineToggleSwitch("FLAPS_GATE", 17, 3006, 119, "Main Panel", "Flaps Lever Gate")
defineToggleSwitch("GUN_MASTER_CVR", 5, 3001, 120, "Main Panel", "Gun Firing Master Switch Cover")
defineTumb("GUN_MASTER", 5, 3003, 121, 2, {-1, 1}, nil, false, "Main Panel", "Gun Firing Master Switch")
defineToggleSwitch("DE_ICE_PUMP", 23, 3001, 370, "Main Panel", "De-Ice Glycol Pump Handle")
defineRotary("RUDDER_TRIM", 2, 3053, 111, "Main Panel", "Rudder Trim")
defineRotary("AILERON_TRIM", 2, 3051, 280, "Main Panel", "Aileron Trim")
definePotentiometer("BOMB_PANEL_L_DIM", 4, 3059, 16, {0, 1}, "Main Panel", "Bomb Panel Flood Dimmer")
defineToggleSwitch("BOMB_DOOR_L_CVR", 2, 3067, 284, "Main Panel", "Bomb Door Light Cover")
defineToggleSwitch("JETT_CONT_CVR", 5, 3056, 144, "Main Panel", "Container Jettison Cover")
definePushButton("JETT_CONT", 5, 3058, 145, "Main Panel", "Container Jettison Button")
defineToggleSwitch("BOMB_PANEL_CVR", 5, 3059, 311, "Main Panel", "Bomb Panel Cover")
defineToggleSwitch("CINE_CAM", 5, 3061, 143, "Main Panel", "Cine Camera Changeover Switch")
defineToggleSwitch("WING_ORD_1", 5, 3063, 148, "Main Panel", "Wing Ordnance 1 Switch")
defineToggleSwitch("WING_ORD_2", 5, 3065, 149, "Main Panel", "Wing Ordnance 2 Switch")
defineToggleSwitch("FUSELAGE_BOMB_3", 5, 3067, 150, "Main Panel", "Fuselage Bombs 3 Switch")
defineToggleSwitch("FUSELAGE_BOMB_4", 5, 3069, 151, "Main Panel", "Fuselage Bombs 4 Switch")
defineToggleSwitch("NOSE_BOMBS", 5, 3071, 152, "Main Panel", "All Nose Bombs Switch")
defineToggleSwitch("TAIL_BOMBS", 5, 3073, 153, "Main Panel", "All Tail Bombs Switch")
defineRotary("FOOTAGE_SCALE", 18, 3003, 90, "Main Panel", "Footage Indicator Scale")
defineToggleSwitch("FOOTAGE_EXPOSURE", 18, 3001, 91, "Main Panel", "Footage Indicator Exposure Switch")

defineFloat("REP_COMP_HDG_G", 47, {0, 1}, "Main Panel Gauges", "Repeater Compass Heading")
defineFloat("REP_COMP_CRS_G", 48, {0, 1}, "Main Panel Gauges", "Repeater Compass Set Course")
defineFloat("ALT_METER_100_G", 68, {0, 1}, "Main Panel Gauges", "Altimeter 100")
defineFloat("ALT_METER_1000_G", 69, {0, 1}, "Main Panel Gauges", "Altimeter 1000")
defineFloat("ALT_METER_10000_G", 70, {0, 1}, "Main Panel Gauges", "Altimeter 10000")
defineFloat("ALT_METER_SET_PRESS_G", 71, {0, 1}, "Main Panel Gauges", "Altimeter Set Pressure")
defineFloat("VARIOMETER_100_G", 67, {-1, 1}, "Main Panel Gauges", "Variometer Gauge")
defineFloat("AIRSPEED_G", 64, {0.0, 0.5}, "Main Panel Gauges", "Airspeed Gauge")
defineFloat("AHORIZON_BANK_G", 65, {-1, 1}, "Main Panel Gauges", "AHorizon Bank")
defineFloat("AHORIZON_PITCH_G", 66, {-1, 1}, "Main Panel Gauges", "AHorizon Pitch")
defineFloat("DI_G", 73, {0, 1}, "Main Panel Gauges", "DI Gauge")
defineFloat("SIDESLIP_G", 75, {-1, 1}, "Main Panel Gauges", "Sideslip Gauge")
defineFloat("TURN_G", 76, {-1, 1}, "Main Panel Gauges", "Turn Gauge")
defineFloat("PORT_TACHO_1000_G", 50, {0, 1}, "Main Panel Gauges", "Tacho 1000 Port")
defineFloat("PORT_TACHO_100_G", 51, {0, 1}, "Main Panel Gauges", "Tacho 100 Port")
defineFloat("STBD_TACHO_1000_G", 52, {0, 1}, "Main Panel Gauges", "Tacho 1000 Starboard")
defineFloat("STBD_TACHO_100_G", 53, {0, 1}, "Main Panel Gauges", "Tacho 100 Starboard")
defineFloat("PORT_BOOST_G", 54, {0, 1}, "Main Panel Gauges", "Boost Gauge Port")
defineFloat("STBD_BOOST_G", 55, {0, 1}, "Main Panel Gauges", "Boost Gauge Starboard")
defineFloat("PORT_OIL_TEMP_G", 56, {-1, 1}, "Main Panel Gauges", "Oil Temperature Gauge Port")
defineFloat("STBD_OIL_TEMP_G", 57, {-1, 1}, "Main Panel Gauges", "Oil Temperature Gauge Starboard")
defineFloat("PORT_OIL_PRESS_G", 58, {0, 1}, "Main Panel Gauges", "Oil Pressure Gauge Port")
defineFloat("STBD_OIL_PRESS_G", 59, {0, 1}, "Main Panel Gauges", "Oil Pressure Gauge Starboard")
defineFloat("PORT_RAD_TEMP_G", 60, {-1, 1}, "Main Panel Gauges", "Radiator Temperature Gauge Port")
defineFloat("STBD_RAD_TEMP_G", 61, {-1, 1}, "Main Panel Gauges", "Radiator Temperature Gauge Starboard")
defineFloat("PORT_FUEL_IN_G", 92, {-1, 1}, "Main Panel Gauges", "Inner Fuel Gauge Port")
defineFloat("STBD_FUEL_IN_G", 93, {-1, 1}, "Main Panel Gauges", "Inner Fuel Gauge Starboard")
defineFloat("PORT_FUEL_OUT_G", 96, {-1, 1}, "Main Panel Gauges", "Outer Fuel Gauge Port")
defineFloat("STBD_FUEL_OUT_G", 97, {-1, 1}, "Main Panel Gauges", "Outer Fuel Gauge Starboard")
defineFloat("CENTR_FUEL_G", 94, {-1, 1}, "Main Panel Gauges", "Fuel Gauge Central")
defineFloat("LONG_FUEL_G", 95, {-1, 1}, "Main Panel Gauges", "Fuel Gauge Long Range")
defineFloat("PORT_OXY_DEV_G", 82, {0, 1}, "Main Panel Gauges", "Oxygen Delivery Gauge Port")
defineFloat("PORT_OXY_SUPPLY_G", 83, {0, 1}, "Main Panel Gauges", "Oxygen Supply Gauge Port")
defineFloat("STBD_OXY_DEV_G", 155, {0, 1}, "Main Panel Gauges", "Oxygen Delivery Gauge Starboard")
defineFloat("STBD_OXY_SUPPLY_G", 156, {0, 1}, "Main Panel Gauges", "Oxygen Supply Gauge Starboard")
defineFloat("FLAPS_G", 81, {0.0, 0.7}, "Main Panel Gauges", "Flaps Gauge")
defineFloat("PNEU_PRESS_G", 85, {0, 1}, "Main Panel Gauges", "Pneumatic Pressure Gauge")
defineFloat("WHEEL_BRK_L_G", 86, {0, 1}, "Main Panel Gauges", "Left Wheel Brake Gauge")
defineFloat("WHEEL_BRK_R_G", 87, {0, 1}, "Main Panel Gauges", "Right Wheel Brake Gauge")
defineFloat("AIR_TEMP_G", 314, {-1, 1}, "Main Panel Gauges", "Air Temperature Gauge")
defineFloat("VOLTMETER_G", 103, {0, 1}, "Main Panel Gauges", "Voltmeter Gauge")

defineIndicatorLight("BOMB_DOOR_L", 283, "Main Panel Lights", "Bomb Door Light (yellow)")
defineIndicatorLight("MAIN_PANEL_C_LAMP_L", 271, "Main Panel Lights", "Main Panel Center Lamp (white)")
defineIndicatorLight("MAIN_PANEL_L_LAMP_L", 270, "Main Panel Lights", "Main Panel Left Lamp (white)")

--Clock
definePushButton("CLOCK_PIN_PULL", 19, 3003, 101, "Clock", "Clock Set (Pull)")  
defineRotary("CLOCK_PIN_TURN", 19, 3001, 102, "Clock", "Clock Set (Turn)")
defineRotary("CLOCK_REF_H", 19, 3005, 375, "Clock", "Clock Reference Hours")
defineRotary("CLOCK_REF_M", 19, 3007, 376, "Clock", "Clock Reference Minutes")

defineFloat("CLOCK_H_G", 98, {-1, 1}, "Clock Gauges", "Clock Hours Gauge")
defineFloat("CLOCK_M_G", 99, {-1, 1}, "Clock Gauges", "Clock Minutes Gauge")
defineFloat("CLOCK_S_G", 100, {-1, 1}, "Clock Gauges", "Clock Seconds Gauge")

--Port Wall
defineRotary("COMPASS_RING", 2, 3007, 28, "Port Wall", "Magnetic Compass")
definePotentiometer("EMERG_L_DIM", 4, 3006, 10, {0, 1}, "Port Wall", "Emergency Light Rheostat")
definePotentiometer("COMPASS_L_DIM", 4, 3012, 11, {0, 1}, "Port Wall", "Compass Flood Light Dimmer")
definePotentiometer("L_SIDE_L_DIM", 4, 3015, 12, {0, 1}, "Port Wall", "L.H. Flood Light Dimmer")
defineToggleSwitch("JETT_W_TANK_CVR", 5, 3008, 8, "Port Wall", "Wing Tank Jettison Cover")
definePushButton("JETT_W_TANK", 5, 3010, 9, "Port Wall", "Wing Tank Jettison Button")
definePushButton("UV_EXCITER", 4, 3024, 294, "Port Wall", "UV Exciter Button")
definePotentiometer("LH_UV_CAP", 20, 3001, 295, {0, 1}, "Port Wall", "LH UV Lamp Cap")
definePotentiometer("RH_UV_CAP", 21, 3001, 296, {0, 1}, "Port Wall", "RH UV Lamp Cap")
definePotentiometer("BA_VOLUME", 30, 3003, 7, {0, 1}, "Port Wall", "Beam Approach Volume Rheostat")
defineToggleSwitch("REP_COMPASS_SW1", 4, 3001, 1, "Port Wall", "R.I. Compass Switch")
defineToggleSwitch("REP_COMPASS_SW2", 4, 3002, 2, "Port Wall", "R.I. Compass De-ground Switch")
defineToggleSwitch("BEAM_SW", 4, 3004, 3, "Port Wall", "Beam Approach Switch")
defineToggleSwitch("SCR_PTT", 24, 3099, 4, "Port Wall", "SCR-522 PTT Button")
defineRotary("ELEVATOR_TRIM", 2, 3016, 279, "Port Wall", "Elevator Trim")

defineIndicatorLight("UV_L_L", 325, "Port Wall Lights", "Left UV Light (multi)")
defineIndicatorLight("UV_R_L", 326, "Port Wall Lights", "Right UV Light (multi)")

--Radio
definePushButton("RADIO_OFF", 24, 3001, 32, "Radio", "Radio OFF Button")
definePushButton("RADIO_A", 24, 3002, 33, "Radio", "Radio A Button")
definePushButton("RADIO_B", 24, 3003, 34, "Radio", "Radio B Button")
definePushButton("RADIO_C", 24, 3004, 35, "Radio", "Radio C Button")
definePushButton("RADIO_D", 24, 3005, 36, "Radio", "Radio D Button")
defineToggleSwitch("RADIO_L_DIM", 24, 3006, 42, "Radio", "Radio Dimmer Toggle")
defineToggleSwitch("RADIO_TLOCK", 24, 3017, 43, "Radio", "Radio Transmit Lock Toggle")
define3Pos2CommandSwitchWW2("RADIO_T_MODE", 24, 3008, 3007, 44, "Radio", "Radio Mode Switch")
definePotentiometer("RADIO_VOL", 24, 3015, 364, {0, 1}, "Radio", "Radio Volume")

defineIndicatorLight("RADIO_A_L", 37, "Radio Lights", "Radio A Light (white)")
defineIndicatorLight("RADIO_B_L", 38, "Radio Lights", "Radio B Light (white)")
defineIndicatorLight("RADIO_C_L", 39, "Radio Lights", "Radio C Light (white)")
defineIndicatorLight("RADIO_D_L", 40, "Radio Lights", "Radio D Light (white)")
defineIndicatorLight("RADIO_TX_L", 41, "Radio Lights", "Radio TX Light (white)")

--Throttle Quadrant
definePotentiometer("THROTTLE_FRICTION", 3, 3030, 25, {0, 1}, "Throttle Quadrant", "Throttle Friction")
definePotentiometer("THROTTLE_CONTROL_L", 3, 3020, 288, {0, 1}, "Throttle Quadrant", "Throttles Control L")
definePotentiometer("THROTTLE_TRANSIT_L", 3, 3016, 18, {0, 1}, "Throttle Quadrant", "Throttles Transit L")
defineRotary("THROTTLE_CONTROL_L_TRIG", 3, 3014, 20, "Throttle Quadrant", "Throttles Control L Trigger")
definePotentiometer("THROTTLE_CONTROL_R", 3, 3023, 289, {0, 1}, "Throttle Quadrant", "Throttles Control R")
definePotentiometer("THROTTLE_TRANSIT_R", 3, 3017, 19, {0, 1}, "Throttle Quadrant", "Throttles Transit R")
defineRotary("THROTTLE_CONTROL_R_TRIG", 3, 3015, 21, "Throttle Quadrant", "Throttles Control R Trigger")
definePotentiometer("PROP_FRICTION", 3, 3033, 24, {0, 1}, "Throttle Quadrant", "Propeller Friction")
definePotentiometer("PROP_CONTROL_L", 3, 3036, 22, {0, 1}, "Throttle Quadrant", "Propeller Control L")
definePotentiometer("PROP_CONTROL_R", 3, 3039, 23, {0, 1}, "Throttle Quadrant", "Propeller Control R")
defineToggleSwitch("MIXTURE", 3, 3086, 27, "Throttle Quadrant", "Mixture Control")
defineToggleSwitch("SUPERCHARGER", 4, 3022, 26, "Throttle Quadrant", "Supercharger Gear Change Switch")

--Starboard Wall
definePushButton("DOOR_LOCK", 2, 3072, 254, "Starboard Wall", "Door Handle")
defineToggleSwitch("DOOR_JETT", 2, 3073, 324, "Starboard Wall", "Door Jettison Handle")
defineTumb("DN_IDENT_L_SW", 4, 3075, 160, 0.5, {0, 1}, nil, false, "Starboard Wall", "Down Ident Lights Switch")
defineToggleSwitch("CAM_GUN_SW", 4, 3078, 161, "Starboard Wall", "Camera Gun Switch")
defineToggleSwitch("NAV_L_SW", 4, 3080, 162, "Starboard Wall", "Nav Lights Switch")
defineToggleSwitch("UV_L_SW", 4, 3082, 163, "Starboard Wall", "UV Lighting Switch")
defineToggleSwitch("PITOT_SW", 4, 3084, 164, "Starboard Wall", "Pitot Head Switch")
defineToggleSwitch("FUEL_PUMP_SW", 4, 3086, 165, "Starboard Wall", "Fuel Pump Switch")
defineToggleSwitch("REFLECTOR_SIGHT_SW", 4, 3051, 166, "Starboard Wall", "Reflector Sight Switch")
defineTumb("NAV_HEAD_L_SW", 4, 3048, 167, 0.5, {0, 1}, nil, false, "Starboard Wall", "Nav. Head Lamp Switch")
defineToggleSwitch("IFF_SW", 4, 3088, 168, "Starboard Wall", "IFF Switch")
defineToggleSwitch("IFF_DESRUCT_CVR", 4, 3036, 169, "Starboard Wall", "IFF Detonator Cover")
definePushButton("IFF_DESRUCT_L_BTN", 4, 3038, 170, "Starboard Wall", "IFF Detonator Left Switch")
definePushButton("IFF_DESRUCT_R_BTN", 4, 3039, 171, "Starboard Wall", "IFF Detonator Right Switch")
defineToggleSwitch("PORT_EXTG_CVR", 4, 3040, 172, "Starboard Wall", "Extinguisher Switch Cover Port")
definePushButton("PORT_EXTG_BTN", 4, 3042, 173, "Starboard Wall", "Extinguisher Switch Port")
defineToggleSwitch("STBD_EXTG_CVR", 4, 3043, 174, "Starboard Wall", "Extinguisher Switch Cover Starboard")
definePushButton("STBD_EXTG_BTN", 4, 3045, 175, "Starboard Wall", "Extinguisher Switch Starboard")
definePotentiometer("WIPER_RT", 4, 3033, 176, {0, 1}, "Starboard Wall", "Windscreen Wiper Rheostat")
defineToggleSwitch("RESIN_L_SW", 4, 3046, 178, "Starboard Wall", "Resin Lights Switch")
definePushButton("MORSE_KEY", 4, 3068, 157, "Starboard Wall", "Morse Key")
defineTumb("DOWNWARD_LVR", 4, 3069, 158, 0.5, {0, 1}, nil, false, "Starboard Wall", "Downward Lamp Mode Selector")
defineTumb("UPWARD_LVR", 4, 3072, 159, 0.5, {0, 1}, nil, false, "Starboard Wall", "Upward Lamp Mode Selector")
defineToggleSwitch("OXY_H_PRESS_VALVE", 2, 3055, 293, "Starboard Wall", "Oxygen High Pressure Valve")
defineToggleSwitch("STBD_OXY_VALVE", 16, 3003, 187, "Starboard Wall", "Oxygen Regulator Starboard")
definePotentiometer("CHART_L_DIM", 4, 3095, 303, {0, 1}, "Port Wall", "Chart Table Flood Light Dimmer")
defineToggleSwitch("AERIAL_BRAKE", 31, 3001, 202, "Starboard Wall", "Aerial Winch  Brake Lever")
defineRotary("AERIAL_WINCH", 31, 3004, 356, "Starboard Wall", "Aerial Winch Rotary Handle")
definePushButton("AERIAL_REEL", 31, 3005, 357, "Starboard Wall", "Aerial Winch Reel Lock")
defineToggleSwitch("TRANS_TYPF_SW", 4, 3113, 307, "Starboard Wall", "Transmitter TypeF Switch")	
defineToggleSwitch("LT_T1154_PW", 28, 3001, 305, "Starboard Wall", "T.1154 R.1155 L.T. Power Unit Switch")
defineToggleSwitch("HT_T1154_PW", 28, 3003, 306, "Starboard Wall", "T.1154 R.1155 H.T. Power Unit Switch")

defineIndicatorLight("GEN_WARN_L", 177, "Starboard Wall Lights", "Generator Warning Light (red)")

--Lower Fuselage Part
defineToggleSwitch("PORT_CUT-OUT", 3, 3071, 192, "Lower Fuselage Part", "Engine Cut-Out Handle Port")
defineToggleSwitch("STBD_CUT-OUT", 3, 3095, 191, "Lower Fuselage Part", "Engine Cut-Out Handle Starboard")
define3PosTumb("PORT_FUEL_COCK", 3, 3073, 193, "Lower Fuselage Part", "Fuel Cock Port")
define3PosTumb("STBD_FUEL_COCK", 3, 3076, 194, "Lower Fuselage Part", "Fuel Cock Starboard")
defineToggleSwitch("TRANSFER_COCK-OUT", 3, 3079, 195, "Lower Fuselage Part", "Transfer Fuel Cock")
definePushButton("PORT_OIL_DILUTION", 3, 3050, 197, "Lower Fuselage Part", "Oil Dilution Switch Port")
definePushButton("STBD_OIL_DILUTION", 3, 3051, 198, "Lower Fuselage Part", "Oil Dilution Switch Starboard")      
defineToggleSwitch("TANK_PRESS", 3, 3089, 196, "Lower Fuselage Part", "Tank Pressurizing Lever")   
defineToggleSwitch("PORT_OIL_SUPPLY", 3, 3091, 200, "Lower Fuselage Part", "Auxiliary Oil Supply Lever Port")
defineToggleSwitch("STBD_OIL_SUPPLY", 3, 3093, 199, "Lower Fuselage Part", "Auxiliary Oil Supply Lever Starboard")
defineToggleSwitch("CABIN_HEATER_LVR", 2, 3057, 203, "Lower Fuselage Part", "Cabin Heater Control")
defineToggleSwitch("GUN_HEATER_LVR", 2, 3059, 204, "Lower Fuselage Part", "Gun Heater Control")	       	
defineToggleSwitch("PORT_ARMREST", 2, 3020, 256, "Lower Fuselage Part", "Arm Rest Port")
defineToggleSwitch("STBD_ARMREST", 2, 3061, 257, "Lower Fuselage Part", "Arm Rest Starboard")				
defineToggleSwitch("HARNESS_LVR", 5, 3043, 323, "Lower Fuselage Part", "Arm Rest Port")
defineToggleSwitch("HYDR_SEL", 2, 3069, 333, "Lower Fuselage Part", "Arm Rest Starboard")

--Quarter
definePotentiometer("DOME_L_DIM", 4, 3101, 302, {0, 1}, "Quarter", "Roof Dome Light Dimmer")
definePotentiometer("LOOP_ANT_L_DIM", 4, 3092, 17, {0, 1}, "Quarter", "Loop Antenna Flood Light Dimmer")
defineTumb("TYPE_J_SEL", 25, 3059, 224, 0.5, {-1, 1}, nil, false, "Quarter", "Aerial Selector Switch Type J")
defineToggleSwitch("LOOP_ANT_LOCK", 25, 3107, 363, "Quarter", "Loop Antenna Lock")
defineRotary("LOOP_ANT_SCALE", 25, 3094, 240, "Quarter", "Loop Antenna Scale")
defineTumb("IFF_CHAN", 4, 3059, 224, 0.2, {0, 1}, nil, false, "Quarter", "IFF Channel Switch")
defineToggleSwitch("IFF_DETONATE_CVR", 4, 3107, 363, "Quarter", "IFF Detonate Switch Cover")
defineToggleSwitch("IFF_DETONATE", 4, 3109, 189, "Quarter", "IFF Detonate Switch")
defineToggleSwitch("IFF_PW", 4, 3111, 190, "Quarter", "IFF Power Switch")

defineIndicatorLight("DOME_LAMP_L", 276, "Quarter Lights", "Dome Lamp (white)")
defineIndicatorLight("LOOP_ANT_LAMP_L", 275, "Quarter Lights", "Antenna Lamp (white)")

--T.1154
definePushButton("T1154_KEY", 25, 3001, 365, "T1154", "T.1154 Key")
defineRotary("T1154_C2", 25, 3002, 358, "T1154", "T.1154 Master Oscillator Tuning Condenser C2")
defineRotary("T1154_C4", 25, 3005, 359, "T1154", "T.1154 Master Oscillator Tuning Condenser C4")
defineRotary("T1154_C15", 25, 3008, 360, "T1154", "T.1154 Output Tuning Condenser C15")
defineRotary("T1154_C16", 25, 3011, 361, "T1154", "T.1154 Output Tuning Condenser C16")
defineRotary("T1154_C17", 25, 3014, 362, "T1154", "T.1154 Master Oscillator Tuning Condenser C17")
defineTumb("T1154_C2_B", 25, 3017, 212, 0.1, {0.0, 0.7}, nil, true, "T1154", "T.1154 Condenser C2 Presets Knob")
defineTumb("T1154_C4_B", 25, 3020, 211, 0.1, {0.0, 0.7}, nil, true, "T1154", "T.1154 Condenser C4 Presets Knob")
defineTumb("T1154_C15_B", 25, 3023, 213, 0.1, {0.0, 0.7}, nil, true, "T1154", "T.1154 Condenser C15 Presets Knob")
defineTumb("T1154_C16_B", 25, 3026, 214, 0.1, {0.0, 0.7}, nil, true, "T1154", "T.1154 Condenser C16 Presets Knob")
defineTumb("T1154_C17_B", 25, 3029, 210, 0.1, {0.0, 0.7}, nil, true, "T1154", "T.1154 Condenser C17 Presets Knob")
definePotentiometer("T1154_C2_V", 25, 3032, 223, {-1, 1}, "T1154", "T.1154 Master Oscillator C2 Vernier")--
definePotentiometer("T1154_C4_V", 25, 3035, 222, {-1, 1}, "T1154", "T.1154 Master Oscillator C4 Vernier")--
defineMultipositionSwitch("T1154_FREQ_RANGE", 25, 3038, 215, 3, 0.1, "T1154", "T.1154 Frequency Range Switch S1 S2")
defineMultipositionSwitch("T1154_S3", 25, 3041, 216, 9, 0.1, "T1154", "T.1154 Inductance Tapping Switch S3")
defineMultipositionSwitch("T1154_S4", 25, 3044, 217, 9, 0.1, "T1154", "T.1154 Inductance Tapping Switch S4")
defineMultipositionSwitch("T1154_S5", 25, 3047, 218, 6, 0.1, "T1154", "T.1154 Master Switch S5")
defineMultipositionSwitch("T1154_S6", 25, 3050, 219, 17, 0.05, "T1154", "T.1154 Inductance Tapping Switch S6")
defineMultipositionSwitch("T1154_S7", 25, 3053, 220, 17, 0.05, "T1154", "T.1154 Inductance Tapping Switch S7")
definePotentiometer("T1154_L6", 25, 3056, 221, {0, 1}, "T1154", "T.1154 Output Inductance Control L6")

defineFloat("T1154_C2_G", 207, {0.0, 0.937}, "T1154 Gauges", "T.1154 C2 Gauge")
defineFloat("T1154_C4_G", 206, {0.0, 0.912}, "T1154 Gauges", "T.1154 C4 Gauge")
defineFloat("T1154_C15_G", 208, {0.0, 0.937}, "T1154 Gauges", "T.1154 C15 Gauge")
defineFloat("T1154_C16_G", 209, {0.0, 0.912}, "T1154 Gauges", "T.1154 C16 Gauge")
defineFloat("T1154_C17_G", 205, {0.0, 0.912}, "T1154 Gauges", "T.1154 C17 Gauge")
defineFloat("T1154_M1_G", 104, {0, 1}, "T1154 Gauges", "T.1154 M1 Gauge")
defineFloat("T1154_M2_G", 105, {0, 1}, "T1154 Gauges", "T.1154 M2 Gauge")
defineFloat("T1154_M3_G", 106, {0, 1}, "T1154 Gauges", "T.1154 M3 Gauge")

--R.1155
defineMultipositionSwitch("R1155_MASTER", 25, 3062, 238, 5, 0.1, "R1155", "R.1155 Master Selector Switch")
defineMultipositionSwitch("R1155_FREQ", 25, 3065, 231, 5, 0.1, "R1155", "R.1155 Frequency Range Switch")
definePotentiometer("R1155_VOL", 25, 3068, 229, {0, 1}, "R1155", "R.1155 Volume Knob")
definePotentiometer("R1155_RANGE_HIGH", 25, 3071, 233, {0, 1}, "R1155", "R.1155 Tuning (Fine)")
definePotentiometer("R1155_RANGE_LOW", 25, 3074, 234, {0, 1}, "R1155", "R.1155 Tuning (Coarse)")
defineToggleSwitch("R1155_HETI", 25, 3077, 230, "R1155", "R.1155 Heterodyne Switch")
definePotentiometer("R1155_METER_BAL", 25, 3079, 225, {-1, 1}, "R1155", "R.1155 Meter Balance Knob")	--
defineToggleSwitch("R1155_FILTER", 25, 3082, 226, "R1155", "R.1155 Filter Switch")
definePotentiometer("R1155_METER_AMP", 25, 3084, 227, {0, 1}, "R1155", "R.1155 Meter Amplitude Knob")			
defineToggleSwitch("R1155_METER_DEF", 25, 3087, 235, "R1155", "R.1155 Meter Deflection Sensitivity Switch")
define3PosTumb("R1155_AURAL_SENSE", 25, 3089, 236, "R1155", "R.1155 Aural Sense Switch")
defineToggleSwitch("R1155_SW_SPEED", 25, 3090, 237, "R1155", "R.1155 Meter Frequency Switch")

defineFloat("R1155_TUNER_G", 232, {0, 1}, "R1155 Gauges", "R.1155 Tuner Gauge")
defineFloat("R1155_TUNE_CAT_G", 239, {0, 1}, "R1155 Gauges", "R.1155 Tuning Cathode Gauge")
defineFloat("R1155_TUNE_ANO_G", 228, {0, 1}, "R1155 Gauges", "R.1155 Tuning Anode Gauge")
defineFloat("R1155_DFLH_G", 88, {-1, 1}, "R1155 Gauges", "R.1155 DFLH Gauge")
defineFloat("R1155_DFRH_G", 89, {-1, 1}, "R1155 Gauges", "R.1155 DFRH Gauge")

--Gauges
defineFloat("COCKPIT_HATCH", 255, {0, 1}, "Cockpit", "Cockpit Hatch Position")

--Lights
defineIndicatorLight("TRANS_TYPF_L", 308, "Cockpit Lights", "Transmitter TypeF Light (yellow)")
defineIndicatorLight("RED_LAMP_L_L", 379, "Cockpit Lights", "Left Red Lamp (red)")
defineIndicatorLight("WH_LAMP_R_L", 301, "Cockpit Lights", "Right White Lamp (white)")
defineIndicatorLight("WH_LAMP_F_L", 300, "Cockpit Lights", "Front White Lamp (white)")
defineIndicatorLight("WH_LAMP_L_L", 299, "Cockpit Lights", "Left White Lamp (white)")
defineIndicatorLight("GAUGES_GLOW_L", 297, "Cockpit Lights", "Gauges Glow (green)")

defineIndicatorLight("GEAR_UP_L_L", 77, "Main Panel Lights", "Under Carriage Left UP Light (red)")
defineIndicatorLight("GEAR_UP_R_L", 79, "Main Panel Lights", "Under Carriage Right UP Light (red)")
defineIndicatorLight("GEAR_DN_L_L", 78, "Main Panel Lights", "Under Carriage Left DOWN Light (green)")
defineIndicatorLight("GEAR_DN_R_L", 80, "Main Panel Lights", "Under Carriage Right DOWN Light (green)")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Position Light (white)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_NOSE", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Nose Light (white)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_WINGS", function()
	if LoGetAircraftDrawArgumentValue(196) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Wing Lights (white)")
defineIntegerFromGetter("EXT_BOTTOM_LIGHT_RED", function()
	if LoGetAircraftDrawArgumentValue(200) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Red Bottom Light (red)")
defineIntegerFromGetter("EXT_BOTTOM_LIGHT_YEL", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Yellow Bottom Light (yellow)")
defineIntegerFromGetter("EXT_BOTTOM_LIGHT_GRN", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Green Bottom Light (green)")
defineIntegerFromGetter("EXT_LAND_LIGHT_L", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Landing Light (white)")
defineIntegerFromGetter("EXT_LAND_LIGHT_R", function()
	if LoGetAircraftDrawArgumentValue(209) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Landing Light (white)")

defineIntegerFromGetter("EXT_WOW_TAIL", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()