module("La7", package.seeall)

local CommonPositions = require("Scripts.DCS-BIOS.lib.modules.CommonPositions")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class La7: Module
local La7 = Module:new("La-7", 0x4E00, { "La-7" })

local devices = {
	COMMON_SYSTEM = 1,
	MOTOR_SYSTEM = 2,
	WEAPON_SYSTEM = 3,
	ELECTRIC_SYSTEM = 4,
	OXYGEN_SYSTEM = 5,
	SIGHT_PBP1 = 6,
	RADIO = 7,
	INTERCOM = 8,
	MACROS = 9,
}

-- hide pilot #540

-- Left Wall

local LEFT_WALL = "Left Wall"

La7:defineToggleSwitch("COMPRESSED_AIR_VALVE", devices.COMMON_SYSTEM, 3001, 1, LEFT_WALL, "Compressed Air Valve")

La7:defineToggleSwitch("SUPERCHARGER_SPEED", devices.MOTOR_SYSTEM, 3005, 5, LEFT_WALL, "Supercharger Speed", { positions = { "STAGE I", "STAGE II" } })

La7:definePotentiometer("OIL_RADIATOR", devices.MOTOR_SYSTEM, 3007, 7, { 0, 1 }, LEFT_WALL, "Oil Radiator")

local BOMB_HANDLE = "Bomb Release Handle"

La7:definePotentiometer("BOMB_RELEASE_LEVER", devices.WEAPON_SYSTEM, 3002, 2, { 0, 1 }, BOMB_HANDLE, "Bomb Release Lever")
La7:definePushButton("BOMB_RELEASE_HANDLE", devices.WEAPON_SYSTEM, 3003, 3, BOMB_HANDLE, "Bomb Release Handle")
La7:defineToggleSwitch("BOMB_RELEASE_COTTER_PIN", devices.WEAPON_SYSTEM, 3104, 104, BOMB_HANDLE, "Bomb Release Cotter Pin", { positions = { "IN", "OUT" } })

local TRIM = "Trim"

La7:definePotentiometer("TRIM_RUDDER", devices.COMMON_SYSTEM, 3009, 9, { -1, 1 }, TRIM, "Rudder Trim")
La7:definePotentiometer("TRIM_ELEVATOR", devices.COMMON_SYSTEM, 3010, 10, { -1, 1 }, TRIM, "Elevator Trim")

local CANOPY = "Canopy"

La7:definePotentiometer("CANOPY", devices.COMMON_SYSTEM, 3077, 77, { 0, 0.9 }, CANOPY, "Canopy Rail")
La7:defineToggleSwitch("CANOPY_HANDLE", devices.COMMON_SYSTEM, 3076, 76, CANOPY, "Canopy Handle")
La7:defineToggleSwitch("CANOPY_EMERGENCY", devices.COMMON_SYSTEM, 3085, 85, CANOPY, "Canopy Emergency Handle")

local THROTTLE = "Throttle Quadrant"

La7:defineToggleSwitch("THROTTLE_MOTOR_SHUTDOWN", devices.MOTOR_SYSTEM, 3011, 11, LEFT_WALL, "Motor Shutdown")
La7:definePotentiometer("THROTTLE_LEVER", devices.MOTOR_SYSTEM, 3012, 12, { 0, 1 }, THROTTLE, "Throttle")
La7:definePotentiometer("THROTTLE_RPM", devices.MOTOR_SYSTEM, 3014, 14, { 0, 1 }, THROTTLE, "RPM")
La7:definePotentiometer("THROTTLE_LOCK", devices.MOTOR_SYSTEM, 3015, 15, { 0, 1 }, THROTTLE, "Locking Nut")
La7:reserveIntValue(1) -- radio, draw arg 13

-- Instrument Panel

local INSTRUMENT_PANEL = "Instrument Panel"

-- left panel

local COMPRESSED_AIR = "Compressed Air Pressure Gauge"

La7:defineFloat("COMPRESSED_AIR_PRESSURE_NEEDLE", 22, { 0, 1 }, COMPRESSED_AIR, "Compressed Air Pressure Gauge Needle")

local HYDRAULIC = "Hydraulic System Pressure Gauge"

La7:defineFloat("HYDRAULIC_PRESSURE_NEEDLE", 16, { 0, 1 }, HYDRAULIC, "Hydraulic Pressure Gauge Needle")

local FLAPS = "Flaps"

La7:define3PosTumb("FLAPS", devices.COMMON_SYSTEM, 3018, 18, FLAPS, "Flaps Lever", { positions = { "UP", "OFF", "DOWN" } })
La7:defineFloat("FLAPS_DEFLECTION", 17, { 0, 1 }, FLAPS, "Mechanical Flap Deflection Indicator")

local BRAKES = "Brake System Pressure Gauge"

La7:defineFloat("BRAKE_PRESSURE_L", 19, { 0, 1 }, BRAKES, "Left Wheel Brake Pressure Needle")
La7:defineFloat("BRAKE_PRESSURE_R", 20, { 0, 1 }, BRAKES, "Right Wheel Brake Pressure Needle")

local GEAR = "Gear"

La7:define3PosTumb("GEAR_LEVER", devices.COMMON_SYSTEM, 3021, 21, GEAR, "Gear Lever", { positions = { "DOWN", "OFF", "UP" } })
La7:defineGatedIndicatorLight("GEAR_RETRACTED_L", 30, 0.1, nil, GEAR, "Left Gear Retracted Light", { color = "red" })
La7:defineGatedIndicatorLight("GEAR_RETRACTED_R", 31, 0.1, nil, GEAR, "Right Gear Retracted Light", { color = "red" })
La7:defineGatedIndicatorLight("GEAR_EXTENDED_TAIL", 32, 0.1, nil, GEAR, "Tail Gear Extended Light", { color = "green" })
La7:defineGatedIndicatorLight("GEAR_EXTENDED_L", 33, 0.1, nil, GEAR, "Left Gear Extended Light", { color = "green" })
La7:defineGatedIndicatorLight("GEAR_EXTENDED_R", 34, 0.1, nil, GEAR, "Right Gear Extended Light", { color = "green" })

-- left switches

local ELECTRICAL = "Electrical Switches"

La7:defineToggleSwitch("ELEC_LANDING_LIGHT", devices.ELECTRIC_SYSTEM, 3023, 23, ELECTRICAL, "Landing Light")
La7:defineToggleSwitch("ELEC_PITOT_HEAT", devices.ELECTRIC_SYSTEM, 3024, 24, ELECTRICAL, "Pitot Heat")
La7:defineToggleSwitch("ELEC_GEAR_INDICATOR", devices.ELECTRIC_SYSTEM, 3025, 25, ELECTRICAL, "Gear Indicator")
La7:defineToggleSwitch("ELEC_RADIO", devices.ELECTRIC_SYSTEM, 3026, 26, ELECTRICAL, "Radio")
La7:defineToggleSwitch("ELEC_NAV_LIGHTS", devices.ELECTRIC_SYSTEM, 3027, 27, ELECTRICAL, "Navigation Lights")
La7:defineToggleSwitch("ELEC_UV_LIGHTS", devices.ELECTRIC_SYSTEM, 3028, 28, ELECTRICAL, "Cockpit U/V Panel Lights")
La7:defineToggleSwitch("ELEC_BATTERY", devices.ELECTRIC_SYSTEM, 3029, 29, ELECTRICAL, "Battery")

local STARTER = "Starter"

La7:defineToggleSwitch("START_BUTTONS_COVER", devices.MOTOR_SYSTEM, 3035, 35, STARTER, "Start Buttons Cover", { positions = CommonPositions.COVER })
La7:definePushButton("START_BUTTONS", devices.MOTOR_SYSTEM, 3036, 36, STARTER, "Start Buttons")
La7:defineMultipositionSwitch("MAGNETOS", devices.MOTOR_SYSTEM, 3037, 37, 4, 0.1, STARTER, "Magnetos", { positions = { "0", "1", "2", "1+2" } })

local CLOCK = "AVR Clock"

La7:defineToggleSwitch("CLOCK_BEZEL", devices.COMMON_SYSTEM, 3110, 110, CLOCK, "Pull Bezel")
La7:defineRotary("CLOCK_WIND", devices.COMMON_SYSTEM, 3109, 109, CLOCK, "Wind Clock")
La7:defineFloat("CLOCK_HOURS", 78, { 0, 1 }, CLOCK, "Hour Hand")
La7:defineFloat("CLOCK_MINUTES", 79, { 0, 1 }, CLOCK, "Minute Hand")
La7:defineFloat("CLOCK_SECONDS", 80, { 0, 1 }, CLOCK, "Second Hand")

-- center

local COMPASS = "KI-11 Compass"

La7:defineFloat("COMPASS_HEADING", 73, { 0, 1 }, COMPASS, "Compass Heading")
La7:defineFloat("COMPASS_ROLL", 74, { -1, 1 }, COMPASS, "Compass Roll")
La7:defineFloat("COMPASS_PITCH", 75, { -1, 1 }, COMPASS, "Compass Pitch")

local ALTIMETER = "V-12 Altimeter"

La7:definePotentiometer("ALTIMETER_PRESSURE_SET", devices.COMMON_SYSTEM, 3041, 41, { 0, 1 }, ALTIMETER, "Set Altimeter Pressure")
La7:defineFloat("ALTIMETER_NEEDLE_HUNDREDS", 38, { 0, 1 }, ALTIMETER, "Altimeter Hundreds Needle")
La7:defineFloat("ALTIMETER_NEEDLE_THOUSANDS", 39, { 0, 1 }, ALTIMETER, "Altimeter Thousands Needle")
La7:defineFloat("ALTIMETER_PRESSURE", 10, { 0, 1 }, ALTIMETER, "Altimeter Pressure")

local ASI = "US-800 Airspeed Indicator"

La7:defineFloat("ASI_NEEDLE", 42, { 0, 1 }, ASI, "Airspeed Needle")

local MANIFOLD_PRESSURE = "M-160 Manifold Pressure Gauge"

La7:defineFloat("MANIFOLD_NEEDLE", 43, { 0, 1 }, MANIFOLD_PRESSURE, "Manifold Pressure Needle")

local TACH = "TE-22 Tachometer"

La7:defineFloat("TACH_NEEDLE_HUNDREDS", 44, { 0, 1 }, TACH, "Tachometer Hundreds Needle")
La7:defineFloat("TACH_NEEDLE_THOUSANDS", 45, { 0, 1 }, TACH, "Tachometer Thousands Needle")

local VSI = "VR-30 Variometer"

La7:defineFloat("VSI_NEEDLE", 46, { -1, 1 }, VSI, "VSI Needle")

local TPI = "Triple Pointer Indicator"

La7:defineFloat("TPI_OIL_PRESSURE", 47, { 0, 1 }, TPI, "Oil Pressure Gauge")
La7:defineFloat("TPI_OIL_TEMP", 48, { 0, 1 }, TPI, "Oil Temperature Gauge")
La7:defineFloat("TPI_FUEL_PRESSURE", 49, { 0, 1 }, TPI, "Fuel Pressure Gauge")

local TURN_SLIP = "UP-37 Turn and Slip Indicator"

La7:defineFloat("UP37_TURN", 90, { -1, 1 }, TURN_SLIP, "Turn Indicator")
La7:defineFloat("UP37_SLIP", 91, { -1, 1 }, TURN_SLIP, "Slip Ball")

-- right switches

local FUEL = "BE-590 Fuel Gauge"

La7:defineFloat("FUEL_NEEDLE", 50, { 0, 1 }, FUEL, "Fuel Needle")
La7:defineToggleSwitch("FUEL_POWER", devices.ELECTRIC_SYSTEM, 3055, 55, FUEL, "Fuel Gauge Power")

local THT = "TCT-9 Thermocouple"

La7:defineFloat("TCT_NEEDLE", 51, { 0, 1 }, THT, "TCT Needle")

local VA = "VA-140 Volt-Amperemeter"

La7:defineFloat("VA_NEEDLE", 81, { -1, 1 }, VA, "Voltmeter Needle")
La7:definePushButton("VA_MODE", devices.ELECTRIC_SYSTEM, 3092, 92, VA, "Volt-Amperemeter Mode")

local BOMB_INDICATORS = "Bomb Release Indicator Lights"

La7:defineGatedIndicatorLight("BOMB_RELEASED_L", 82, 0.1, nil, BOMB_INDICATORS, "Left Bomb Released Light", { color = "red" })
La7:defineGatedIndicatorLight("BOMB_RELEASED_R", 83, 0.1, nil, BOMB_INDICATORS, "Right Bomb Released Light", { color = "red" })

local ARTIFICAL_HORIZON = "AGP-2 Artifical Horizon"

La7:defineFloat("HORIZON_BANK", 95, { -1, 1 }, ARTIFICAL_HORIZON, "Artifical Horizon Bank")
La7:defineFloat("HORIZON_PITCH", 96, { -1, 1 }, ARTIFICAL_HORIZON, "Artifical Horizon Pitch")

La7:definePotentiometer("INST_PANEL_COCKPIT_LIGHTS", devices.ELECTRIC_SYSTEM, 3006, 6, { 0, 1 }, INSTRUMENT_PANEL, "Cockpit Light Rheostat")
La7:definePotentiometer("INST_PANEL_SIGHT_COMPASS_LIGHTS", devices.ELECTRIC_SYSTEM, 3008, 8, { 0, 1 }, INSTRUMENT_PANEL, "Sight and Compass Light Rheostat")

-- right panel

-- right wall

local RIGHT_WALL = "Right Wall"

La7:defineToggleSwitch("GEAR_LOCK_EMERGENCY", devices.COMMON_SYSTEM, 3062, 62, RIGHT_WALL, "Gear Lock Emergency Rope")
La7:defineToggleSwitch("INERT_GAS_FILL", devices.COMMON_SYSTEM, 3056, 56, RIGHT_WALL, "Inert Gas Fill Valve")
La7:defineToggleSwitch("GEAR_EMERGENCY_EXTEND", devices.COMMON_SYSTEM, 3057, 57, RIGHT_WALL, "Emergency Landing Gear Extension Valve")

La7:defineToggleSwitch("FUEL_SHUTOFF", devices.MOTOR_SYSTEM, 3061, 61, RIGHT_WALL, "Fuel System Shutoff Valve")
La7:definePotentiometer("HAND_FUEL_PUMP", devices.MOTOR_SYSTEM, 3065, 65, { 0, 1 }, RIGHT_WALL, "Hand Fuel Pump")

La7:defineToggleSwitch("OIL_DILUTION", devices.MOTOR_SYSTEM, 3097, 97, RIGHT_WALL, "Oil Dilution")

local PRIMER = "Primer Pump"

La7:definePotentiometer("PRIMER_PUMP", devices.MOTOR_SYSTEM, 3058, 58, { 0, 1 }, PRIMER, "Primer Pump")
La7:defineToggleSwitch("PRIMER_PUMP_DISTRIBUTION", devices.MOTOR_SYSTEM, 3059, 59, PRIMER, "Primer Pump Distribution Valve")
La7:defineToggleSwitch("PRIMER_PUMP_AIR", devices.MOTOR_SYSTEM, 3060, 60, PRIMER, "Primer Pump Compressed Air Supply Valve")

local COWL_FLAPS = "Cowl Flaps"

La7:defineToggleSwitch("COWL_FLAPS_FWD", devices.MOTOR_SYSTEM, 3063, 63, COWL_FLAPS, "Forward Cowl Flaps")
La7:definePotentiometer("COWL_FLAPS_SIDE", devices.MOTOR_SYSTEM, 3064, 64, { 0, 1 }, COWL_FLAPS, "Side Cowl Flaps")

local OXYGEN = "Oxygen System"

La7:defineToggleSwitch("OXYGEN_VALVE", devices.OXYGEN_SYSTEM, 3105, 105, OXYGEN, "Oxygen Cylinder Valve")
La7:defineToggleSwitch("OXYGEN_AIR_MIX", devices.OXYGEN_SYSTEM, 3106, 106, OXYGEN, "Air Mix Handle")
La7:defineToggleSwitch("OXYGEN_EMERGENCY", devices.OXYGEN_SYSTEM, 3107, 107, OXYGEN, "Emergency Oxygen Button")
La7:defineFloat("OXYGEN_CYLINDER_PRESSURE_GAUGE", 93, { 0, 1 }, OXYGEN, "Cylinder Pressure Gauge")
La7:defineFloat("OXYGEN_INDICATOR", 94, { 0, 1 }, OXYGEN, "Oxygen Indicator")

-- Guns

local GUNS = "Gun Recharge Handles"

La7:defineToggleSwitch("GUNS_RECHARGE_SAFETY_L", devices.WEAPON_SYSTEM, 3069, 69, GUNS, "Left Gun Recharge/Safety Handle")
La7:defineToggleSwitch("GUNS_HAMMER_L", devices.WEAPON_SYSTEM, 3067, 67, GUNS, "Left Gun Recharge/Safety Handle")
La7:defineToggleSwitch("GUNS_PNEUMO_RECHARGE_L", devices.WEAPON_SYSTEM, 3068, 68, GUNS, "Left Gun Recharge/Safety Handle")

La7:defineToggleSwitch("GUNS_RECHARGE_SAFETY_R", devices.WEAPON_SYSTEM, 3066, 66, GUNS, "Right Gun Recharge/Safety Handle")
La7:defineToggleSwitch("GUNS_HAMMER_R", devices.WEAPON_SYSTEM, 3070, 70, GUNS, "Right Gun Recharge/Safety Handle")
La7:defineToggleSwitch("GUNS_PNEUMO_RECHARGE_R", devices.WEAPON_SYSTEM, 3071, 71, GUNS, "Right Gun Recharge/Safety Handle")

La7:defineToggleSwitch("GUNS_PNEUMO_SAFETY", devices.WEAPON_SYSTEM, 3072, 72, GUNS, "Guns Pneumo Safety Handle")

-- Sight

local SIGHT = "Sight"

La7:definePotentiometer("SIGHT_DEPRESSION", devices.ELECTRIC_SYSTEM, 3108, 108, { -1, 1 }, SIGHT, "Sight Depression Knob")

-- Stick

local STICK = "Stick"

La7:defineToggleSwitch("STICK_SAFETY", devices.WEAPON_SYSTEM, 3099, 99, STICK, "Safety Guard", { positions = CommonPositions.COVER })
La7:definePushButton("STICK_BOMB_RELEASE", devices.WEAPON_SYSTEM, 3100, 100, STICK, "Bomb Release")
La7:definePotentiometer("STICK_BRAKE_LEVER", devices.COMMON_SYSTEM, 3098, 98, { 0, 1 }, STICK, "Brake Lever")

La7:defineFloat("STICK_Y", 52, { -1, 1 }, STICK, "Stick Yaw")
La7:defineFloat("STICK_X", 53, { -1, 1 }, STICK, "Stick Roll")

-- Rudder

local RUDDER = "Rudder"

La7:defineFloat("RUDDER", 54, { -1, 1 }, RUDDER, "Rudder Position")

-- Interior Lights

local INTERIOR_LIGHTS = "Interior Lights"

La7:defineFloat("INDICATOR_LIGHT_BRIGHTNESS", 84, { 0, 1 }, INTERIOR_LIGHTS, "Indicator Light Brightness")
La7:defineFloat("UV_LIGHT_BRIGHTNESS", 102, { 0, 1 }, INTERIOR_LIGHTS, "U/V Light Brightness")
La7:defineFloat("COMPASS_LIGHT_BRIGHTNESS", 103, { 0, 1 }, INTERIOR_LIGHTS, "Compass Light Brightness")

-- Interior Model

local INTERIOR_MODEL = "Interior Model"

La7:defineFloat("INTERIOR_MODEL_PANEL_SHAKE_X", 86, { -1, 1 }, INTERIOR_MODEL, "Instrument Panel Shake (X)")
La7:defineFloat("INTERIOR_MODEL_PANEL_SHAKE_Y", 87, { -1, 1 }, INTERIOR_MODEL, "Instrument Panel Shake (Y)")
La7:defineFloat("INTERIOR_MODEL_PANEL_SHAKE_Z", 88, { -1, 1 }, INTERIOR_MODEL, "Instrument Panel Shake (Z)")
La7:defineFloat("INTERIOR_MODEL_PANEL_SHAKE_ROT", 89, { -1, 1 }, INTERIOR_MODEL, "Instrument Panel Shake (Rotate)")
La7:defineGatedIndicatorLight("INTERIOR_MODEL_MIRROR", 572, 0.6, nil, INTERIOR_MODEL, "Mirror")

-- Exterior Lights

local EXTERIOR_LIGHTS = "Exterior Lights"

La7:defineBitFromDrawArgument("EXT_LIGHT_NAV_L", 190, EXTERIOR_LIGHTS, "Left Navigation Light (red)")
La7:defineBitFromDrawArgument("EXT_LIGHT_NAV_R", 191, EXTERIOR_LIGHTS, "Right Navigation Light (green)")
La7:defineBitFromDrawArgument("EXT_LIGHT_NAV_REAR", 192, EXTERIOR_LIGHTS, "Rear Navigation Light (white)")

-- Exterior Model

local EXTERIOR_MODEL = "Exterior Model"

La7:defineFloatFromDrawArgument("EXT_GEAR_TAIL_EXTEND", 0, EXTERIOR_MODEL, "Tail Wheel Extended Position")
La7:defineFloatFromDrawArgument("EXT_GEAR_TAIL_SUSPENSION", 1, EXTERIOR_MODEL, "Tail Wheel Suspension Compression")
La7:defineFullRangeFloatFromExternalDrawArgument("EXT_GEAR_TAIL_ROT", 2, EXTERIOR_MODEL, "Tail Wheel Rotation")

La7:defineFloatFromDrawArgument("EXT_GEAR_RIGHT_EXTEND", 3, EXTERIOR_MODEL, "Right Main Gear Extended Position")
La7:defineFloatFromDrawArgument("EXT_GEAR_RIGHT_SUSPENSION", 4, EXTERIOR_MODEL, "Right Main Gear Suspension Compression")

La7:defineFloatFromDrawArgument("EXT_GEAR_LEFT_EXTEND", 5, EXTERIOR_MODEL, "Left Main Gear Extended Position")
La7:defineFloatFromDrawArgument("EXT_GEAR_LEFT_SUSPENSION", 6, EXTERIOR_MODEL, "Left Main Gear Suspension Compression")

La7:defineFloatFromDrawArgument("EXT_FLAP_R", 9, EXTERIOR_MODEL, "Right Flap")
La7:defineFloatFromDrawArgument("EXT_FLAP_L", 10, EXTERIOR_MODEL, "Left Flap")
La7:defineFullRangeFloatFromExternalDrawArgument("EXT_AILERON_R", 11, EXTERIOR_MODEL, "Right Aileron")
La7:defineFullRangeFloatFromExternalDrawArgument("EXT_AILERON_L", 12, EXTERIOR_MODEL, "Left Aileron")
La7:defineFloatFromDrawArgument("EXT_SLAT_R", 13, EXTERIOR_MODEL, "Right Slat")
La7:defineFloatFromDrawArgument("EXT_SLAT_L", 14, EXTERIOR_MODEL, "Left Slat")
La7:defineFullRangeFloatFromExternalDrawArgument("EXT_ELEVATOR", 15, EXTERIOR_MODEL, "Elevator")
La7:defineFullRangeFloatFromExternalDrawArgument("EXT_RUDDER", 17, EXTERIOR_MODEL, "Rudder")

La7:defineBitFromDrawArgument("EXT_CHOCKS", 23, EXTERIOR_MODEL, "Chocks")

La7:defineFloatFromDrawArgument("EXT_COWL_FLAPS_FWD", 278, EXTERIOR_MODEL, "Forward Cowl Flaps")
La7:defineFloatFromDrawArgument("EXT_COWL_FLAPS_SIDE", 280, EXTERIOR_MODEL, "Side Cowl Flaps")
La7:defineFloatFromDrawArgument("EXT_OIL_RADIATOR", 279, EXTERIOR_MODEL, "Oil Radiator Door")

La7:defineFullRangeFloatFromExternalDrawArgument("EXT_ELEVATOR_TRIM", 355, EXTERIOR_MODEL, "Elevator Trim")
La7:defineFullRangeFloatFromExternalDrawArgument("EXT_RUDDER_TRIM", 357, EXTERIOR_MODEL, "Rudder Trim")

La7:defineFloatFromDrawArgument("EXT_PROP_ROTATION", 407, EXTERIOR_MODEL, "Prop Rotation")
La7:defineFloatFromDrawArgument("EXT_PROP_PITCH", 413, EXTERIOR_MODEL, "Prop Pitch")

return La7
