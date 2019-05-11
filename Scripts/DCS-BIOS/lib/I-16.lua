BIOS.protocol.beginModule("I-16", 0x3400)
BIOS.protocol.setExportModuleAircrafts({"I-16"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineString = BIOS.util.defineString
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local define3PosTumb = BIOS.util.define3PosTumb
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- ELECTRIC
defineToggleSwitch("CLOCK_HEAT",  5,3023, 23,"Electric", "Clock Heat")
defineToggleSwitch("PITOT_HEAT",  5,3024, 24,"Electric", "Pitot Heat")
defineToggleSwitch("NAV_LIGHT",  5,3025, 25,"Electric", "Nav Light") 
defineToggleSwitch("ACCU",  5,3026, 26,"Electric", "Accumulator")
defineToggleSwitch("SHUNT",  5,3027, 27,"Electric", "Shunt")
defineToggleSwitch("RADIO",  5,3028, 28,"Electric", "Radio")
definePushButton("FIRE_TORCH_L", 5, 3030, 30,"Electric" , "Fire Left Torch")
definePushButton("TORCH_JETT", 5, 3089, 89,"Electric" , "Torches Jettison")
definePushButton("FIRE_TORCH_R", 5, 3031, 31,"Electric" , "Fire Right Torch")
definePushButton("NAV_LIGHT_TEST", 5, 3032, 32,"Electric" , "Nav Light Test")
definePotentiometer("SIGHT_DIM", 5, 3034, 34, {0, 1}, "Electric", "Sight Dimmer Rheostat")
definePotentiometer("CPT_LIGHT", 5, 3035, 35, {0, 1}, "Electric", "Cockpit Light Rheostat")

-- GEAR
defineToggleSwitch("GEAR_LOCK",  3, 3050, 50,"Gear", "Gear Lock")
defineToggleSwitch("GEAR_DIRCET",  3, 3051, 51,"Gear", "Gear Direction")
defineToggleSwitch("BRAKE_SPRING",  3, 3055, 55,"Gear", "Brake Spring Handle")
defineRotary("GEAR_HANDLE", 3, 3086, 86,"Gear", "Gear Handle")

-- FLAPS
defineRotary("FLAPS_HANDLE", 4, 3063, 63,"Flaps", "Flaps Handle")

-- MOTOR
defineMultipositionSwitch("MAGNETO",  2, 3022, 22, 4, 0.334,"Motor", "Magneto 0/1/2/1+2")
definePushButton("MOTOR_OFF",2, 3029, 29,"Motor" , "Motor Shutdown")
definePushButton("RATCHET",2, 3033, 33,"Motor" , "Ratchet Relay")
defineTumb("STARTER_HANDLE", 2, 3036, 36, 0.5, {0.0,1.0}, nil, false, "Motor", "Starter Handle")
defineMultipositionSwitch("PRI_FUEL_SW",  2, 3037, 37, 3, 0.5, "Motor", "Primary Fuel Switch")
definePotentiometer("START_PUMP_TURN", 2, 3038, 38, {0, 1}, "Motor", "Start Pump (Turn)")
definePotentiometer("START_PUMP_PULL", 2, 3039, 39, {0, 1}, "Motor", "Start Pump (Pull)")
defineRotary("WEB", 2, 3042, 42,"Motor", "War Emergency Power (WEB)")
defineRotary("RPM", 2, 3043, 43,"Motor", "RPM")
defineRotary("MIX", 2, 3044, 44,"Motor", "Mixture")
defineRotary("THROTTLE", 2, 3045, 45,"Motor", "Throttle")
defineMultipositionSwitch("SUPERCHARGER",  2, 3046, 46, 3, 0.5, "Motor", "Supercharge Speed 1/0/2")
defineRotary("ENG_COWL_FLAPS", 2, 3047, 47,"Motor", "Motor Cowl Flaps")
defineRotary("OIL_RAD", 2, 3048, 48,"Motor", "Oil Radiator")
defineToggleSwitch("FUEL_VALVE",  2, 3062, 62,"Motor", "Fuel Valve")
definePushButton("MAN_RATCHET",2, 3064, 64,"Motor" , "Manual Ratchet Relay")

-- WEAPON 
definePushButton("GUN_L_RECHARG_WING", 7, 3060, 60,"Weapons" , "Gun Wing Left Recharge")
definePushButton("GUN_R_RECHARG_WING", 7, 3061, 61,"Weapons" , "Gun Wing Right Recharge")
definePushButton("GUN_R_RECHARG_NOSE", 7, 3070, 70,"Weapons" , "Gun Nose Left Recharge")
definePushButton("GUN_L_RECHARG_NOSE", 7, 3071, 71,"Weapons" , "Gun Nose Right Recharge")
defineMultipositionSwitch("ROCK_BOMB_COUNT",  7, 3087, 87, 18, 0.055,"Weapons", "Rockets/Bombs Counter")
defineToggleSwitch("ROCK_BOMB_ARM",  7, 3088, 88,"Electric", "Rockets/Bombs Master Arm")
-- COMMON
defineRotary("CRS_CAGE_KNOB", 1, 3040, 40,"Common", "Course Cage Knob")
defineMultipositionSwitch("SEAT_HEIGHT",  1, 3065, 65, 5, 0.25,"Common", "Seat Level")
definePotentiometer("PRESS_SET", 1, 3066, 66, {0, 1}, "Common", "Set Pressure")
defineToggleSwitch("DOOR_L",  1, 3067, 67,"Common", "Left Door")
defineToggleSwitch("DOOR_R",  1, 3068, 68,"Common", "Right Door")
defineToggleSwitch("SIGHT_MECH",  1, 3069, 69,"Common", "Mech Sight")
defineToggleSwitch("SIGHT_FILTER",  1, 3700, 700,"Common", "Sight Filter")

-- OXYGEN
defineRotary("OXY_ADJ_VALVE", 6, 3074, 74,"Oxygen", "Oxygen Adjusting Valve")
defineRotary("OXY_EMERG_VALVE", 6, 3075, 75,"Oxygen", "Oxygen Emergency Valve")
defineRotary("OXY_OFF_VALVE", 6, 3076, 76,"Oxygen", "Oxygen Shutoff Valve")

-- Gauges 
--defineFloat("ARK5_FREQ_SCALE", 354, {-1, 1}, "Gauges", "ARK5 Frequency Scale")

-- Warning, Caution and IndicatorLights
--defineIndicatorLight("IFF_SELFDESTRUCT_LAMP", 205, "Warning, Caution and IndicatorLights","SRO-2 Self-destruction Lamp (red)")


BIOS.protocol.endModule()
