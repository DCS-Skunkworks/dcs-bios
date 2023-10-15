module("I-16", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class I_16: Module
local I_16 = Module:new("I-16", 0x4000, { "I-16" })

--by WarLord

-- ELECTRIC
I_16:defineToggleSwitch("CLOCK_HEAT", 5, 3023, 23, "Electric", "Clock Heat")
I_16:defineToggleSwitch("PITOT_HEAT", 5, 3024, 24, "Electric", "Pitot Heat")
I_16:defineToggleSwitch("NAV_LIGHT", 5, 3025, 25, "Electric", "Nav Light")
I_16:defineToggleSwitch("ACCU", 5, 3026, 26, "Electric", "Battery")
I_16:defineToggleSwitch("SHUNT", 5, 3027, 27, "Electric", "Shunt")
I_16:defineToggleSwitch("RADIO", 5, 3028, 28, "Electric", "Radio")
I_16:definePushButton("FIRE_TORCH_L", 5, 3030, 30, "Electric", "Fire Left Torch")
I_16:definePushButton("TORCH_JETT", 5, 3089, 89, "Electric", "Torches Jettison")
I_16:definePushButton("FIRE_TORCH_R", 5, 3031, 31, "Electric", "Fire Right Torch")
I_16:definePushButton("NAV_LIGHT_TEST", 5, 3032, 32, "Electric", "Nav Light Test")
I_16:definePotentiometer("SIGHT_DIM", 5, 3034, 34, { 0, 1 }, "Electric", "Sight Dimmer Rheostat")
I_16:definePotentiometer("CPT_LIGHT", 5, 3035, 35, { 0, 1 }, "Electric", "Cockpit Light Rheostat")

-- GEAR
I_16:defineToggleSwitch("GEAR_LOCK", 3, 3050, 50, "Gear", "Gear Lock")
I_16:defineToggleSwitch("GEAR_DIRCET", 3, 3051, 51, "Gear", "Gear Direction")
I_16:defineToggleSwitch("BRAKE_SPRING", 3, 3055, 55, "Gear", "Brake Spring Handle")
I_16:defineRotary("GEAR_HANDLE", 3, 3086, 86, "Gear", "Gear Handle")

-- FLAPS
I_16:defineRotary("FLAPS_HANDLE", 4, 3063, 63, "Flaps", "Flaps Handle")

-- MOTOR
I_16:defineMultipositionSwitch("MAGNETO", 2, 3022, 22, 4, 0.1, "Motor", "Magneto 0/1/2/1+2")
I_16:definePushButton("MOTOR_OFF", 2, 3029, 29, "Motor", "Motor Shutdown")
I_16:definePushButton("RATCHET", 2, 3033, 33, "Motor", "Ratchet Relay")

I_16:defineMultipositionSwitch("STARTER_HANDLE", 2, 3036, 36, 3, 0.5, "Motor", "Starter Handle")
I_16:defineMultipositionSwitch("PRI_FUEL_SW", 2, 3037, 37, 3, 0.5, "Motor", "Primary Fuel Switch")
I_16:definePotentiometer("START_PUMP_TURN", 2, 3038, 38, { 0, 1 }, "Motor", "Start Pump (Turn)")
I_16:definePotentiometer("START_PUMP_PULL", 2, 3039, 39, { 0, 1 }, "Motor", "Start Pump (Pull)")
I_16:defineRotary("WEB", 2, 3042, 42, "Motor", "War Emergency Power (WEB)")
I_16:defineRotary("RPM", 2, 3043, 43, "Motor", "RPM")
I_16:defineRotary("MIX", 2, 3044, 44, "Motor", "Mixture")
I_16:defineRotary("THROTTLE", 2, 3045, 45, "Motor", "Throttle")
I_16:defineMultipositionSwitch("SUPERCHARGER", 2, 3046, 46, 3, 0.5, "Motor", "Supercharge Speed 1/0/2")
I_16:defineRotary("ENG_COWL_FLAPS", 2, 3047, 47, "Motor", "Motor Cowl Flaps")
I_16:defineRotary("OIL_RAD", 2, 3048, 48, "Motor", "Oil Radiator")
I_16:defineToggleSwitch("FUEL_VALVE", 2, 3062, 62, "Motor", "Fuel Valve")
I_16:definePushButton("MAN_RATCHET", 2, 3064, 64, "Motor", "Manual Ratchet Relay")

-- WEAPON
I_16:definePushButton("GUN_L_RECHARG_WING", 7, 3060, 60, "Weapons", "Gun Wing Left Recharge")
I_16:definePushButton("GUN_R_RECHARG_WING", 7, 3061, 61, "Weapons", "Gun Wing Right Recharge")
I_16:definePushButton("GUN_R_RECHARG_NOSE", 7, 3070, 70, "Weapons", "Gun Nose Left Recharge")
I_16:definePushButton("GUN_L_RECHARG_NOSE", 7, 3071, 71, "Weapons", "Gun Nose Right Recharge")
I_16:defineMultipositionSwitch("ROCK_BOMB_COUNT", 7, 3087, 87, 18, 0.055, "Weapons", "Rockets/Bombs Counter")
I_16:defineToggleSwitch("ROCK_BOMB_ARM", 7, 3088, 88, "Electric", "Rockets/Bombs Master Arm")

-- COMMON
I_16:defineRotary("CRS_CAGE_KNOB", 1, 3040, 40, "Common", "Course Cage Knob")
I_16:defineMultipositionSwitch("SEAT_HEIGHT", 1, 3065, 65, 5, 0.25, "Common", "Seat Level")
I_16:definePotentiometer("PRESS_SET", 1, 3066, 66, { 0, 1 }, "Common", "Set Pressure")
I_16:defineToggleSwitch("DOOR_L", 1, 3067, 67, "Common", "Left Door")
I_16:defineToggleSwitch("DOOR_R", 1, 3068, 68, "Common", "Right Door")
I_16:defineToggleSwitch("SIGHT_MECH", 1, 3069, 69, "Common", "Mech Sight")
I_16:defineToggleSwitch("SIGHT_FILTER", 1, 3700, 700, "Common", "Sight Filter")

-- OXYGEN
I_16:defineRotary("OXY_ADJ_VALVE", 6, 3074, 74, "Oxygen", "Oxygen Adjusting Valve")
I_16:defineRotary("OXY_EMERG_VALVE", 6, 3075, 75, "Oxygen", "Oxygen Emergency Valve")
I_16:defineRotary("OXY_OFF_VALVE", 6, 3076, 76, "Oxygen", "Oxygen Shutoff Valve")

-- Gauges
I_16:defineFloat("CLOCK_H", 1, { 0, 1 }, "Gauges", "Clock Hours")
I_16:defineFloat("CLOCK_M", 2, { 0, 1 }, "Gauges", "Clock Minutes")
I_16:defineFloat("CLOCK_S", 3, { 0, 1 }, "Gauges", "Clock Seconds")
I_16:defineFloat("ENG_RPM_G", 4, { 0, 1 }, "Gauges", "Engine RPM Gauge")
I_16:defineFloat("AIRSPEED", 5, { 0, 1 }, "Gauges", "Airspeed Indicator")
I_16:defineFloat("COMP_CRS", 6, { 0, 1 }, "Gauges", "Compass Course")
I_16:defineFloat("COMP_BANK", 7, { -14563 / 65535, 14563 / 65535 }, "Gauges", "Compass Bank") -- values found by testing
I_16:defineFloat("COMP_PITCH", 8, { -14563 / 65535, 14563 / 65535 }, "Gauges", "Compass Pitch")
I_16:defineFloat("BARO_ALT_1000", 10, { 0, 1 }, "Gauges", "Altimeter 1000m")
I_16:defineFloat("BARO_ALT_100", 9, { 0, 1 }, "Gauges", "Altimeter 100m")
I_16:defineFloat("BARO_ALT_SEL", 11, { 0, 1 }, "Gauges", "Altimeter Pressure")
I_16:defineFloat("CH_TEMP", 12, { 0, 1 }, "Gauges", "Cylinder Head Temperature Gauge")
I_16:defineFloat("OIL_TEMP", 13, { 0, 1 }, "Gauges", "Oil Temperature Gauge")
I_16:defineFloat("OIL_PRESS", 14, { 0, 1 }, "Gauges", "Oil Pressure Gauge")
I_16:defineFloat("FUEL_PRESS", 15, { 0, 1 }, "Gauges", "Fuel Pressure Gauge")
I_16:defineFloat("MANIFOLD_PRESS", 16, { 0, 1 }, "Gauges", "Manifold Pressure Gauge")
I_16:defineFloat("TURN_INDICATOR", 17, { -1, 1 }, "Gauges", "Turn Indicator")
I_16:defineFloat("SLIP_INDICATOR", 18, { -1, 1 }, "Gauges", "Slip Indicator")
I_16:defineFloat("CLIMB_INDICATOR", 19, { -1, 1 }, "Gauges", "Climb Indicator")
I_16:defineFloat("FUEL_GAUGE", 20, { 0, 1 }, "Gauges", "Fuel Gauge")
I_16:defineFloat("FLAPS_INDICATOR", 21, { 0, 1 }, "Gauges", "Flaps Indicator")
I_16:defineFloat("AMPMETER", 41, { 0, 1 }, "Gauges", "Amperemeter")
I_16:defineFloat("PANEL_SHAKE_VERT", 56, { -1, 1 }, "Gauges", "Cockpit Panel Vertical Shake")
I_16:defineFloat("PANEL_SHAKE_HOR", 57, { -1, 1 }, "Gauges", "Cockpit Panel Horizontal Shake")
I_16:defineFloat("PANEL_SHAKE_FWD", 58, { -1, 1 }, "Gauges", "Cockpit Panel Forward Shake")
I_16:defineFloat("PANEL_SHAKE_CLOCK", 59, { -1, 1 }, "Gauges", "Cockpit Panel Clockwise Shake")
I_16:defineFloat("QXY_METER", 72, { 0, 1 }, "Gauges", "Oxygen Manometer")
I_16:defineFloat("QXY_FLOW", 73, { 0, 1 }, "Gauges", "Oxygen Flow Manometer")
I_16:defineFloat("GEAR_POS_L", 77, { 0, 1 }, "Gauges", "Left Gear Position Indicator")
I_16:defineFloat("GEAR_POS_R", 78, { 0, 1 }, "Gauges", "Right Gear Position Indicator")
I_16:defineFloat("DOOR_POS_L", 251, { 0, 1 }, "Gauges", "Left Door Position")
I_16:defineFloat("DOOR_POS_R", 249, { 0, 1 }, "Gauges", "Right Door Position")

-- Warning, Caution and IndicatorLights
I_16:defineIndicatorLight("PANEL_GLOW", 82, "Warning, Caution and IndicatorLights", "Panel Glow (yellow)")
I_16:defineIndicatorLight("NEEDLE_GLOW", 195, "Warning, Caution and IndicatorLights", "Panel Needle Glow (yellow)")

I_16:defineToggleSwitch("EXT_FUEL_VALVE", 2, 3102, 102, "Motor", "External Fuel Tank Valve")
I_16:definePushButton("JETT_FUEL_TANK", 7, 3103, 103, "Weapons", "Jettison Fuel Tank")

--Externals
I_16:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
I_16:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")

I_16:defineBitFromDrawArgument("EXT_WOW_TAIL", 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
I_16:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
I_16:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")
I_16:definePushButton("MIX_PUSH", 2, 3101, 101, "Motor", "Mixture Push")

I_16:defineToggleSwitch("STICK_TOGGLE", 1, 3295, 295, "Common", "Hide Stick Toggle")

return I_16
