module("F4U-1D", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F4U_1D: Module
local F4U_1D = Module:new("F4U-1D", 0x3a00, { "F4U-1D", "F4U-1D_CW" })

local devices = {
	ELECTRO = 1,
	HYDRO = 2,
	ENGINE = 3,
	PITOT = 4,
	NAV = 5,
	OXYGENE = 6,
	CONTROL = 7,
	RADIO = 8,
	RADIONAV = 9,
	INTERCOM = 10,
	LIGHTS = 11,
	KNEEBOARD = 12,
	WEAPON = 13,
	UTILITY = 14,
	SENSORS = 15,
	RECORDER = 16,
	CLOCK = 17,
	AUTOPILOT = 18,
	AUTOSTART = 19,
	BREAKERS = 20,
	BATBOMB = 21,
}

--- Defines a 0-max_value output from a 0-1 input
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F4U_1D:defineIntegerFromArg(identifier, arg_number, max_value, category, description)
	self:defineIntegerFromGetter(identifier, function(dev0)
		return Module.round(dev0:get_argument_value(arg_number) * max_value)
	end, max_value, category, description)
end

-- Wing Fold Controls
local WING_FOLD = "Wing Fold"

F4U_1D:defineToggleSwitch("WING_LOCK", devices.CONTROL, 3510, 200, WING_FOLD, "Wing Lock Lever")
F4U_1D:defineMultipositionSwitch("WING_FOLD", devices.CONTROL, 3502, 201, 3, 0.5, WING_FOLD, "Wing Fold (SPREAD/NEUTRAL/FOLD)")

-- Drop Tank/Bomb Release Controls
local DROP_TANK_BOMB = "Drop Tank/Bomb Release"

F4U_1D:defineToggleSwitch("DROP_LEFT", devices.WEAPON, 3944, 203, DROP_TANK_BOMB, "Left Wing Emergency Manual Release")
F4U_1D:defineToggleSwitch("DROP_RIGHT", devices.WEAPON, 3945, 204, DROP_TANK_BOMB, "Right Wing Emergency Manual Release")

-- Trim/Tail Wheel Controls
local TRIM_TAIL_WHEEL = "Trim/Tail Wheel"

F4U_1D:defineToggleSwitch("TAIL_WHEEL_LOCK", devices.CONTROL, 3503, 159, TRIM_TAIL_WHEEL, "Tail Wheel Lock")

-- the needle is tied to the rotary for these controls
F4U_1D:definePotentiometer("TRIM_RUDDER", devices.CONTROL, 3504, 161, { -0.645, 0.645 }, TRIM_TAIL_WHEEL, "Rudder Trim Knob + Indicator")
F4U_1D:definePotentiometer("TRIM_AILERON", devices.CONTROL, 3505, 160, { -1, 1 }, TRIM_TAIL_WHEEL, "Aileron Trim Knob + Indicator")
F4U_1D:definePotentiometer("TRIM_ELEVATOR", devices.CONTROL, 3506, 162, { -1, 0.5 }, TRIM_TAIL_WHEEL, "Elevator Trim Wheel + Indicator")

-- Emergency Landing Gear Deployment
local CO2_GEAR = "Emergency Landing Gear Deployment"

F4U_1D:definePushButton("HYD_HAND_PUMP", devices.HYDRO, 3101, 49, CO2_GEAR, "Emergency Hydraulic Hand Pump")

-- Fuel Selector
local FUEL_SELECTOR = "Fuel Selector"

F4U_1D:defineMultipositionSwitchWithCycle("FUEL_SELECTOR", devices.ENGINE, 3201, 59, 6, 0.2, true, FUEL_SELECTOR, "Fuel Selector (OFF/MAIN/RESERVE/RIGHT/LEFT/CENTER)")

-- Engine Control Unit
local ECU = "Engine Control Unit"

F4U_1D:definePotentiometer("ECU_THROTTLE", devices.ENGINE, 3213, 43, { 0, 1 }, ECU, "Throttle")
F4U_1D:definePotentiometer("ECU_RPM", devices.ENGINE, 3202, 47, { 0, 1 }, ECU, "RPM Governor")
F4U_1D:reserveIntValue(1) -- push-button on throttle
F4U_1D:defineMultipositionSwitch("ECU_MIXTURE", devices.ENGINE, 3203, 46, 4, 1 / 3, ECU, "Mixture (CUTOFF/AUTO LEAN/AUTO RICH/FULL RICH)")
F4U_1D:defineMultipositionSwitch("ECU_SUPERCHARGER", devices.ENGINE, 3204, 44, 3, 0.5, ECU, "Supercharger (NEUTRAL/LOW/HIGH)")

-- Landing Gear and Dive Brake Control
local GEAR_DIVE_BRAKE = "Landing Gear/Dive Brake"

F4U_1D:define3PosTumb("GEAR_BRAKE_HANDLE", devices.CONTROL, 3507, 57, GEAR_DIVE_BRAKE, "Landing Gear/Dive Brake Handle (GEAR DOWN/GEAR UP BRAKES UP/BRAKES DOWN)")
F4U_1D:defineFloat("GEAR_TAIL_POS_IND", 257, { 0, 1 }, GEAR_DIVE_BRAKE, "Tail Wheel Position Indicator")
F4U_1D:defineFloat("GEAR_L_POS_IND", 457, { 0, 1 }, GEAR_DIVE_BRAKE, "Left Main Gear Position Indicator")
F4U_1D:defineFloat("GEAR_R_POS_IND", 357, { 0, 1 }, GEAR_DIVE_BRAKE, "Right Main Gear Position Indicator")

-- Forward Left Circuit Breaker Panel
local LEFT_CB = "Forward Left Circuit Breaker Panel"

F4U_1D:defineToggleSwitch("CB_L_GUN_RO", devices.BREAKERS, 3850, 60, LEFT_CB, "Guns Right Outer")
F4U_1D:defineToggleSwitch("CB_L_GUN_RC", devices.BREAKERS, 3851, 61, LEFT_CB, "Guns Right Center")
F4U_1D:defineToggleSwitch("CB_L_GUN_RI", devices.BREAKERS, 3852, 62, LEFT_CB, "Guns Right Inner")
F4U_1D:defineToggleSwitch("CB_L_GUN_LO", devices.BREAKERS, 3853, 63, LEFT_CB, "Guns Left Outer")
F4U_1D:defineToggleSwitch("CB_L_GUN_LC", devices.BREAKERS, 3854, 64, LEFT_CB, "Guns Left Center")
F4U_1D:defineToggleSwitch("CB_L_GUN_LI", devices.BREAKERS, 3855, 65, LEFT_CB, "Guns Left Inner")
F4U_1D:defineToggleSwitch("CB_L_GUN_HEATER", devices.BREAKERS, 3865, 66, LEFT_CB, "Gun Heater")
F4U_1D:defineToggleSwitch("CB_L_SUN_SIGHT", devices.BREAKERS, 3856, 67, LEFT_CB, "Gun Sight")
F4U_1D:defineToggleSwitch("CB_L_GUN_CAM_HEATER", devices.BREAKERS, 3857, 68, LEFT_CB, "Gun Camera Heater")
F4U_1D:defineToggleSwitch("CB_L_GUN_CAM_MOTOR", devices.BREAKERS, 3858, 69, LEFT_CB, "Gun Camera Motor")
F4U_1D:defineToggleSwitch("CB_L_WATER_PUMP", devices.BREAKERS, 3859, 70, LEFT_CB, "Water Pump")
F4U_1D:defineToggleSwitch("CB_L_ROCKETS_BUTTON", devices.BREAKERS, 3872, 71, LEFT_CB, "Rockets Button")
F4U_1D:defineToggleSwitch("CB_L_ROCKETS_PANEL", devices.BREAKERS, 3873, 72, LEFT_CB, "Rockets Panel")
F4U_1D:defineToggleSwitch("CB_L_RELEASE_L", devices.BREAKERS, 3862, 73, LEFT_CB, "Left Bomb Release")
F4U_1D:defineToggleSwitch("CB_L_RELEASE_R", devices.BREAKERS, 3863, 74, LEFT_CB, "Right Bomb Release")
F4U_1D:defineToggleSwitch("CB_L_BOMB_ARM", devices.BREAKERS, 3864, 75, LEFT_CB, "Bomb Arming")
F4U_1D:defineToggleSwitch("CB_L_RELEASE_C", devices.BREAKERS, 3860, 76, LEFT_CB, "Center Pylon release")

-- Rocket Launching Switch
local ROCKETS = "Rocket Launching Switch"

F4U_1D:definePushButton("ROCKETS_FIRE", devices.WEAPON, 3956, 174, ROCKETS, "Fire Rockets")

-- Ignition Switch
local IGNITION = "Ignition Switch"

F4U_1D:defineMultipositionSwitch("IGNITION_MAGS", devices.ENGINE, 3206, 105, 4, 1 / 3, IGNITION, "Ignition Switch (OFF/RIGHT/LEFT/BOTH)")

-- Wing Flaps Control
local FLAPS = "Wing Flaps"

F4U_1D:defineMultipositionSwitch("FLAPS_LEVER", devices.CONTROL, 3508, 107, 6, 0.2, FLAPS, "Flaps")

-- Gun Charging Controls
local GUN_CHARGE = "Gun Charging"

F4U_1D:defineToggleSwitch("GUN_CHARGE_L", devices.WEAPON, 3921, 40, GUN_CHARGE, "Left Guns Charge")
F4U_1D:defineToggleSwitch("GUN_CHARGE_R", devices.WEAPON, 3922, 41, GUN_CHARGE, "Right Guns Charge")

-- Front Dashboard
local FRONT_DASH = "Front Dashboard"

-- F4U_1D:defineMultipositionSwitch("DASH_DROP_TANK_LOCK", devices.ENGINE, 3931, 205, 3, 0.5, FRONT_DASH, "Drop Tank Lock (RELEASE/FLIGHT LOCK/ATTACH)")
F4U_1D:reserveIntValue(3) -- drop tank lock not working properly
F4U_1D:definePushButton("DASH_STALL_WARN_TEST", devices.UTILITY, 3817, 136, FRONT_DASH, "Stall Warning Test Button")

F4U_1D:defineIndicatorLight("DASH_WATER_INJECT_LOW", 300, FRONT_DASH, "Water Inject Low Lamp (Green)")
F4U_1D:defineIndicatorLight("DASH_STALL_WARN", 302, FRONT_DASH, "Stall Warning Lamp (Red)")
F4U_1D:defineIndicatorLight("DASH_CARB_AIR_TEMP", 301, FRONT_DASH, "Carb Air Temp Lamp (Red)")

F4U_1D:reserveIntValue(65535) -- stall warn dimmer
F4U_1D:reserveIntValue(65535) -- carb air temp dimmer

-- Chartboard
local CHARTBOARD = "Chartboard"

F4U_1D:defineToggleSwitch("CHARTBOARD_EXTEND", devices.UTILITY, 3813, 214, CHARTBOARD, "Chartboard Extend/Retract")
F4U_1D:defineFloat("CHARTBOARD_LIGHT", 637, { 0, 1 }, CHARTBOARD, "Chartboard Lamp (White)")

-- Gun Switch Box
local GUN_SWITCH_BOX = "Gun Switch Box"

F4U_1D:define3PosTumb("GUN_BOX_CAMERA", devices.WEAPON, 3920, 114, GUN_SWITCH_BOX, "Gun Camera (GUN/OFF/FWD)")
F4U_1D:defineToggleSwitch("GUN_BOX_MASTER_ARM", devices.WEAPON, 3906, 113, GUN_SWITCH_BOX, "Master Arm")
F4U_1D:defineToggleSwitch("GUN_BOX_OUTBOARD", devices.WEAPON, 3907, 112, GUN_SWITCH_BOX, "Outboard Guns")
F4U_1D:defineToggleSwitch("GUN_BOX_CENTER", devices.WEAPON, 3908, 111, GUN_SWITCH_BOX, "Center Guns")
F4U_1D:defineToggleSwitch("GUN_BOX_INBOARD", devices.WEAPON, 3909, 110, GUN_SWITCH_BOX, "Inboard Guns")
F4U_1D:define3PosTumb("GUN_BOX_GUNSIGHT", devices.WEAPON, 3925, 109, GUN_SWITCH_BOX, "Gunsight (ALT/OFF/LIMIT)")
F4U_1D:definePotentiometer("GUN_BOX_LIGHT_INTENSITY", devices.WEAPON, 3926, 115, { 0, 1 }, GUN_SWITCH_BOX, "Gunsight Light Intensity")

-- Gun Sight
local GUN_SIGHT = "Gun Sight"

F4U_1D:defineFloat("GUN_SIGHT_INCLINOMETER", 28, { -1, 1 }, GUN_SIGHT, "Gun Sight Inclinometer")

-- Bomb Switch Box
local BOMB_SWITCH_BOX = "Bomb Switch Box"

F4U_1D:defineToggleSwitch("BOMB_BOX_RELEASE_L", devices.WEAPON, 3927, 119, BOMB_SWITCH_BOX, "Left Wing Release")
F4U_1D:defineToggleSwitch("BOMB_BOX_RELEASE_R", devices.WEAPON, 3928, 118, BOMB_SWITCH_BOX, "Right Wing Release")
F4U_1D:define3PosTumb("BOMB_BOX_ARMING", devices.WEAPON, 3929, 117, BOMB_SWITCH_BOX, "Arming (NOSE/SAFE/TAIL)")
F4U_1D:defineToggleSwitch("BOMB_BOX_RELEASE_PYLON", devices.WEAPON, 3930, 116, BOMB_SWITCH_BOX, "Pylon Release")

-- Tachometer
local TACHOMETER = "Tachometer"

F4U_1D:defineFloat("TACHOMETER_NEEDLE", 23, { 0, 1 }, TACHOMETER, "Tachometer Gauge Needle")
F4U_1D:defineFloat("TACHOMETER_DIAL", 22, { 0, 1 }, TACHOMETER, "Tachometer Gauge Dial")

-- Altimeter
local ALTIMETER = "Altimeter"

F4U_1D:defineFloat("ALTIMETER_10000_FT", 16, { 0, 1 }, ALTIMETER, "Altimeter 10000ft Needle")
F4U_1D:defineFloat("ALTIMETER_1000_FT", 25, { 0, 1 }, ALTIMETER, "Altimeter 1000ft Needle")
F4U_1D:defineFloat("ALTIMETER_100_FT", 24, { 0, 1 }, ALTIMETER, "Altimeter 100ft Needle")
F4U_1D:defineFloat("ALTIMETER_PRESSURE", 26, { -1, 1 }, ALTIMETER, "Altimeter Pressure Gauge")
F4U_1D:definePotentiometer("SET_ALTIMETER_PRESSURE", devices.PITOT, 3301, 26, { -1, 1 }, ALTIMETER, "Set Altimeter Pressure")
F4U_1D:defineFloat("ALTIMETER_INNER_NEEDLE", 426, { -1, 1 }, ALTIMETER, "Altimeter Inner Needle")
F4U_1D:defineFloat("ALTIMETER_OUTER_NEEDLE", 326, { -1, 1 }, ALTIMETER, "Altimeter Outer Needle")

-- Directional Gyro
local DIRECTIONAL_GYRO = "Directional Gyro"

F4U_1D:defineFloat("DIRECTIONAL_GYRO_HEADING", 12, { 0, 1 }, DIRECTIONAL_GYRO, "Directional Gyro Heading")
F4U_1D:defineFloat("DIRECTIONAL_GYRO_HEADING_CAGE_FLAG", 313, { 0, 1 }, DIRECTIONAL_GYRO, "Directional Gyro Heading Cage Flag")
F4U_1D:defineRotary("DIRECTIONAL_GYRO_SET", devices.NAV, 3362, 13, DIRECTIONAL_GYRO, "Directional Gyro Heading Set")
F4U_1D:definePushButton("DIRECTIONAL_GYRO_CAGE", devices.NAV, 3365, 313, DIRECTIONAL_GYRO, "Directional Gyro Heading Cage")

-- Manifold Pressure Gauge
local MANIFOLD_PRESSURE = "Manifold Pressure Gauge"

F4U_1D:defineFloat("MANIFOLD_PRESSURE_GAUGE", 10, { 0, 1 }, MANIFOLD_PRESSURE, "Manifold Pressure Gauge")

-- Airspeed Indicator
local ASI = "Airspeed Indicator"

F4U_1D:defineFloat("AIRSPEED_INDICATOR", 11, { 0, 1 }, ASI, "Airspeed Indicator")

-- Compass
local COMPASS = "Compass"

F4U_1D:defineFloat("HSI_COURSE", 1, { 0, 1 }, COMPASS, "HSI Course Indicator")
F4U_1D:defineFloat("RADIO_COURSE", 2, { 0, 1 }, COMPASS, "Rasio Course Indicator")
F4U_1D:defineRotary("RADIO_COURSE_SET", devices.NAV, 3354, 3, COMPASS, "Radio Course Set")

-- Turn and Bank Indicator
local TURN_BANK_INDICATOR = "Turn and Bank Indicator"

F4U_1D:defineFloat("TURN_NEEDLE", 27, { -1, 1 }, TURN_BANK_INDICATOR, "Turn Needle")
F4U_1D:defineFloat("SLIP_BALL", 28, { -1, 1 }, TURN_BANK_INDICATOR, "Slip Ball")

-- Gyro Horizon
local HORIZON_GYRO = "Gyro Horizon"

F4U_1D:defineFloat("GYRO_HORIZON_PITCH", 15, { -1, 1 }, HORIZON_GYRO, "Gyro Horizon Pitch")
F4U_1D:defineFloat("GYRO_HORIZON_PITCH_TRIM", 17, { -1, 1 }, HORIZON_GYRO, "Gyro Horizon Pitch Trim")
F4U_1D:definePotentiometer("GYRO_HORIZON_PITCH_TRIM_SET", devices.NAV, 3359, 17, { -1, 1 }, HORIZON_GYRO, "Gyro Horizon Set Pitch Trim")
F4U_1D:defineFloat("GYRO_HORIZON_BANK", 14, { -1, 1 }, HORIZON_GYRO, "Gyro Horizon Bank")
F4U_1D:defineFloat("GYRO_HORIZON_CAGE_FLAG", 18, { 0, 1 }, HORIZON_GYRO, "Gyro Horizon Cage Flag")
F4U_1D:defineToggleSwitch("GYRO_HORIZON_CAGE", devices.NAV, 3356, 18, HORIZON_GYRO, "Gyro Horizon Cage")

-- Climb Indicator
local VSI = "Climb Indicator"

F4U_1D:defineFloat("CLIMB_INDICATOR", 29, { -1, 1 }, VSI, "Climb Indicator")

-- Clock
local CLOCK = "Clock"

F4U_1D:defineFloat("CLOCK_CURRTIME_HOURS", 4, { 0, 1 }, CLOCK, "Clock Current Time Hours")
F4U_1D:reserveIntValue(65535) -- Clock current time Minute hand should be draw arg 5, currently not working with DCS bios
F4U_1D:reserveIntValue(65535) -- Clock current time second hand should be draw arg 6, currently not working with DCS bios
F4U_1D:defineFloat("CLOCK_CIVIL_DATE", 247, { 0, 1 }, CLOCK, "Clock Civil Date Dial")
F4U_1D:defineFloat("CLOCK_RIGHT_INNER_DIAL", 246, { 0, 1 }, CLOCK, "Clock Inner Right Dial")
F4U_1D:defineFloat("CLOCK_ELAPSED_TIME_MINUTES", 245, { 0, 1 }, CLOCK, "Clock Elapsed Time Minutes")
F4U_1D:defineFloat("CLOCK_ELAPSED_TIME_HOURS", 244, { 0, 1 }, CLOCK, "Clock Elapsed Time Hours")
F4U_1D:defineFloat("CLOCK_TOP_INNER_DIAL", 345, { 0, 1 }, CLOCK, "Clock Inner Top Dial")
F4U_1D:definePushButton("CLOCK_SET_DATE", devices.CLOCK, 3653, 347, CLOCK, "Clock Set Date Button")
F4U_1D:definePushButton("CLOCK_CHRONOMETER_START_STOP_RESET", devices.CLOCK, 3652, 248, CLOCK, "Start/Stop/Reset Button")
F4U_1D:defineSpringloaded_3PosTumb("CLOCK_ADJUSTMENT_BUTTON", devices.CLOCK, 3651, 3651, 250, CLOCK, "Clock Adjustment Button (Reset/Norm/Adjust)")
F4U_1D:defineRotary("CLOCK_ADJUSTMENT_ROTARY", devices.CLOCK, 3650, 249, CLOCK, "Clock Adjustment Rotary")
F4U_1D:defineFloat("CLOCK_STATE_INDICATOR", 251, { 0, 1 }, CLOCK, "Clock State Indicator")

-- Cylinder Temperature Indicator
local CHT = "Cylinder Temperature Indicator"

F4U_1D:defineFloat("CYLINDER_TEMPERATURE_INDICATOR", 21, { 0, 1 }, CHT, "Cylinder Temperature Indicator")

-- Engine Gauge Unit
local ENGINE_GAUGE_UNIT = "Engine Gauge Unit"

F4U_1D:defineFloat("ENGINE_GAUGE_OIL_TEMP", 30, { 0, 1 }, ENGINE_GAUGE_UNIT, "Enginge Oil Temp Gauge")
F4U_1D:defineFloat("ENGINE_GAUGE_OIL_PRESSURE", 31, { 0, 1 }, ENGINE_GAUGE_UNIT, "Enginge Oil Pressure Gauge")
F4U_1D:defineFloat("ENGINE_GAUGE_FUEL_PRESSURE", 32, { 0, 1 }, ENGINE_GAUGE_UNIT, "Enginge Fuel Pressure Gauge")

-- Fuel Quantity Gauge
local FUEL_QUANTITY = "Fuel Quantity Gauge"

F4U_1D:defineFloat("FUEL_QUANTITY_GAUGE", 7, { 0, 1 }, FUEL_QUANTITY, "Fuel Quantity Gauge")

-- Hydraulic Pressure Gauge
local HYD_PRESSURE = "Hydraulic Pressure Gauge"

F4U_1D:defineFloat("HYDRAULIC_PRESSURE_GAUGE", 35, { 0, 1 }, HYD_PRESSURE, "Hydraulic Pressure Gauge")

-- Voltammeter
local VOLTAMMETER = "Voltammeter"

F4U_1D:defineFloat("VOLTAMMETER", 8, { 0, 1 }, VOLTAMMETER, "Voltammeter")
F4U_1D:definePushButton("VOLTAMMETER_VOLTS_AMPS_BUTTON", devices.ELECTRO, 3001, 9, VOLTAMMETER, "Volts/Amps Button")

-- Accelerometer
local ACCELEROMETER = "Accelerometer"

F4U_1D:defineFloat("ACCELEROMETER_CURRENT_G_NEEDLE", 206, { -1, 1 }, ACCELEROMETER, "Accelerometer Current G Needle")
F4U_1D:defineFloat("ACCELEROMETER_MAX_G_NEEDLE", 207, { 0, 1 }, ACCELEROMETER, "Accelerometer Max G Needle")
F4U_1D:defineFloat("ACCELEROMETER_MIN_G_NEEDLE", 208, { -1, 0 }, ACCELEROMETER, "Accelerometer Min G Needle")
F4U_1D:definePushButton("ACCELEROMETER_RESET_BUTTON", devices.UTILITY, 3815, 209, ACCELEROMETER, "Accelerometer Reset Button")
F4U_1D:reserveIntValue(65535) -- Theres a knob for the Accelerometer reset button thats currently not used, tied to command 3816 under "Accel_reset_kb"

-- Water Pressure Gauge
local WATER_PRESSURE_GAUGE = "Water Pressure Gauge"

F4U_1D:defineFloat("WATER_PRESSURE_GAUGE", 242, { 0, 1 }, WATER_PRESSURE_GAUGE, "Water Pressure Gauge")

-- Emergency Pressure Release
local EMERGENCY_PRESSURE_RELEASE = "Emergency Pressure Release"

F4U_1D:defineToggleSwitch("EMERGENCY_PRESSURE_RELEASE", devices.ENGINE, 3245, 199, EMERGENCY_PRESSURE_RELEASE, "Emergency Pressure Release")

-- Rocket Station Distributor Box
local ROCKET_STATION = "Rocket Station Distributor Box"

F4U_1D:defineToggleSwitch("ROCKET_STATION_ON_OFF_COVER", devices.WEAPON, 3950, 166, ROCKET_STATION, "Rocket Station On/Off Cover")
F4U_1D:defineToggleSwitch("ROCKET_STATION_ON_OFF", devices.WEAPON, 3951, 167, ROCKET_STATION, "Rocket Station On/Off")
F4U_1D:defineToggleSwitch("ROCKET_STATION_ARM_SAFE", devices.WEAPON, 3952, 168, ROCKET_STATION, "Rocket Station Arm/Safe")
F4U_1D:defineToggleSwitch("ROCKET_STATION_SINGLE_AUTO", devices.WEAPON, 3953, 169, ROCKET_STATION, "Rocket Station Single/Auto")
F4U_1D:defineToggleSwitch("ROCKET_STATION_SELECTOR_PULL", devices.WEAPON, 3954, 171, ROCKET_STATION, "Rocket Station Selector Pull")
F4U_1D:reserveIntValue(3) --F4U_1D:defineMultipositionSwitch("ROCKET_STATION_SELECTOR_TURN", devices.WEAPON, 3955, 172, 4, 0.25, ROCKET_STATION, "Rocket Station Selector Turn")
F4U_1D:definePotentiometer("ROCKET_STATION_DIMMING_LIGHT", devices.WEAPON, 3957, 173, { 0, 1 }, ROCKET_STATION, "Rocket Station Dimming Light")
F4U_1D:defineIntegerFromArg("ROCKET_STATION_SELECTOR_INDICATOR", 170, 7, ROCKET_STATION, "Rocket Station Selector Indicator")
F4U_1D:defineIndicatorLight("ROCKET_STATION_READY_LIGHT", 267, ROCKET_STATION, "Rocket Station Ready Light (Red)")

-- Cooling Flaps Controls
local COOLING_FLAPS = "Cooling Flaps Controls"

F4U_1D:defineSpringloaded_3PosTumb("COOLING_FLAPS_OIL", devices.ENGINE, 3219, 3218, 165, COOLING_FLAPS, "Oil Cooling Flaps Open/Close")
F4U_1D:defineSpringloaded_3PosTumb("COOLING_FLAPS_INTERCOOLER", devices.ENGINE, 3217, 3216, 164, COOLING_FLAPS, "Intercooler Flaps Open/Close")
F4U_1D:defineSpringloaded_3PosTumb("COOLING_FLAPS_ENGINE", devices.ENGINE, 3215, 3214, 163, COOLING_FLAPS, "Engine Cooling Flaps Open/Close")
F4U_1D:defineFloat("OIL_COOLER_DOOR_INDICATOR", 265, { 0, 1 }, COOLING_FLAPS, "Oil Cooling Door Indicator")
F4U_1D:defineFloat("INTERCOOLER_DOOR_INDICATOR", 264, { 0, 1 }, COOLING_FLAPS, "Intercooler Door Indicator")

-- Pilot's Distribution Box
local PILOT_DISTRO = "Pilot's Distribution Box"

F4U_1D:defineToggleSwitch("PILOT_DISTRO_BATTERY_SWITCH", devices.ELECTRO, 3002, 120, PILOT_DISTRO, "Battery Switch")
F4U_1D:defineToggleSwitch("PILOT_DISTRO_FUEL_PUMP_SWITCH", devices.ENGINE, 3211, 121, PILOT_DISTRO, "Fuel Pump Switch")
F4U_1D:definePushButton("PILOT_DISTRO_PRIMER_SWITCH", devices.ENGINE, 3212, 122, PILOT_DISTRO, "Primer Switch")
F4U_1D:definePushButton("PILOT_DISTRO_STARTER_SWITCH", devices.ENGINE, 3231, 123, PILOT_DISTRO, "Starter Switch")
F4U_1D:defineToggleSwitch("PILOT_DISTRO_STARTER_SWITCH_COVER", devices.ENGINE, 3233, 124, PILOT_DISTRO, "Starter Switch Cover")
F4U_1D:reserveIntValue(1) -- Emergency Generator Switch Cover, draw arg 181
F4U_1D:reserveIntValue(1) -- Emergency Generator Switch, draw arg 180
F4U_1D:reserveIntValue(1) -- Emergency Radio Switch Cover, draw arg 179
F4U_1D:reserveIntValue(1) -- Emergency Radio Switch, draw arg 178
F4U_1D:define3PosTumb("PILOT_DISTRO_RECOGNITION_LIGHT_SWITCH_RED", devices.LIGHTS, 3714, 155, PILOT_DISTRO, "Red Recognition Light (Steady/Off/Flash)")
F4U_1D:define3PosTumb("PILOT_DISTRO_RECOGNITION_LIGHT_SWITCH_GREEN", devices.LIGHTS, 3716, 156, PILOT_DISTRO, "Green Recognition Light (Steady/Off/Flash)")
F4U_1D:define3PosTumb("PILOT_DISTRO_RECOGNITION_LIGHT_SWITCH_AMBER", devices.LIGHTS, 3718, 157, PILOT_DISTRO, "Amber Recognition Light (Steady/Off/Flash)")
F4U_1D:reserveIntValue(1) -- Red keying switch, draw arg 154
F4U_1D:define3PosTumb("PILOT_DISTRO_EXTERIOR_LIGHTS_SWITCH", devices.LIGHTS, 3704, 132, PILOT_DISTRO, "Exterior Lights (Flash/Off/Steady)")
F4U_1D:define3PosTumb("PILOT_DISTRO_WING_LIGHTS_SWITCH", devices.LIGHTS, 3702, 130, PILOT_DISTRO, "Wing Lights (Dim/Off/Bright)")
F4U_1D:define3PosTumb("PILOT_DISTRO_TAIL_LIGHTS_SWITCH", devices.LIGHTS, 3720, 131, PILOT_DISTRO, "Tail Lights (Dim/Off/Bright)")
F4U_1D:define3PosTumb("PILOT_DISTRO_FORMATION_LIGHTS_SWITCH", devices.LIGHTS, 3737, 133, PILOT_DISTRO, "Formation Lights (Dim/Off/Bright)")
F4U_1D:define3PosTumb("PILOT_DISTRO_SECTION_LIGHTS_SWITCH", devices.LIGHTS, 3705, 134, PILOT_DISTRO, "Section Lights (Dim/Off/Bright)")
F4U_1D:defineToggleSwitch("PILOT_DISTRO_APPROACH_LIGHTS_SWITCH", devices.LIGHTS, 3760, 158, PILOT_DISTRO, "Approach Lights Switch")
F4U_1D:defineToggleSwitch("PILOT_DISTRO_COCKPIT_LIGHTS_SWITCH", devices.LIGHTS, 3706, 129, PILOT_DISTRO, "Cockpit Lights Switch")
F4U_1D:definePotentiometer("PILOT_DISTRO_CHARTBOARD_LIGHT_KNOB", devices.LIGHTS, 3749, 137, { 0, 1 }, PILOT_DISTRO, "Chart Board Light Knob")
F4U_1D:definePotentiometer("PILOT_DISTRO_LEFT_PANEL_LIGHT_KNOB", devices.LIGHTS, 3707, 138, { 0, 1 }, PILOT_DISTRO, "Left Panel Light Knob")
F4U_1D:definePotentiometer("PILOT_DISTRO_RIGHT_PANEL_LIGHT_KNOB", devices.LIGHTS, 3708, 139, { 0, 1 }, PILOT_DISTRO, "Right Panel Light Knob")
F4U_1D:definePotentiometer("PILOT_DISTRO_LEFT_INSTRUMENT_BOARD_LIGHT_KNOB", devices.LIGHTS, 3709, 140, { 0, 1 }, PILOT_DISTRO, "Left Instrument Panel Light Knob")
F4U_1D:definePotentiometer("PILOT_DISTRO_RIGHT_INSTRUMENT_BOARD_LIGHT_KNOB", devices.LIGHTS, 3710, 141, { 0, 1 }, PILOT_DISTRO, "Right Instrument Panel Light Knob")

-- Arresting Hook Control
-- local HOOK = "Arresting Hook"

F4U_1D:reserveIntValue(2) --F4U_1D:define3PosTumb("ARRESTING_HOOK_CONTROL", devices.CONTROL, 3501, 202, HOOK, "Arresting Hook Control (Down/Parking/Up)")

-- Rear Right Circuit Breaker Panel
local RIGHT_CIRCUIT_BREAKER = "Rear Right Circuit Breaker Panel"

F4U_1D:defineToggleSwitch("RIGHT_CIRCUIT_BREAKER_IFF_RADIO", devices.BREAKERS, 3866, 148, RIGHT_CIRCUIT_BREAKER, "IFF/Radio CB")
F4U_1D:defineToggleSwitch("RIGHT_CIRCUIT_BREAKER_EXTERNAL_LIGHTS", devices.BREAKERS, 3867, 149, RIGHT_CIRCUIT_BREAKER, "External Lights CB")
F4U_1D:defineToggleSwitch("RIGHT_CIRCUIT_BREAKER_RECOGNITION_LIGHTS", devices.BREAKERS, 3868, 150, RIGHT_CIRCUIT_BREAKER, "Recognition Lights CB")
F4U_1D:defineToggleSwitch("RIGHT_CIRCUIT_BREAKER_STARTER", devices.BREAKERS, 3869, 151, RIGHT_CIRCUIT_BREAKER, "Starter CB")
F4U_1D:defineToggleSwitch("RIGHT_CIRCUIT_BREAKER_INERTIA_SWITCH", devices.BREAKERS, 3870, 152, RIGHT_CIRCUIT_BREAKER, "Inertia Switch CB")
F4U_1D:defineToggleSwitch("RIGHT_CIRCUIT_BREAKER_INSTRUMENT_RELAY", devices.BREAKERS, 3871, 153, RIGHT_CIRCUIT_BREAKER, "Instrument Relay CB")

-- Oxygen System
local O2_SYSTEM = "Oxygen System"

F4U_1D:defineFloat("OXYGEN_PRESSURE_GAUGE", 34, { 0, 1 }, O2_SYSTEM, "Oxygen Pressure Gauge")
F4U_1D:defineFloat("OXYGEN_FLOW_BLINKER", 33, { 0, 1 }, O2_SYSTEM, "Oxygen Flow Blinker")
F4U_1D:reserveIntValue(65535) -- oxygen bottle valve, not currently implemented uses arg 177 for turning animation
F4U_1D:reserveIntValue(65535) -- oxygen flow valve, not currently implemented uses arg 277 for turning animation
F4U_1D:reserveIntValue(1) -- oxygen valve Lever, not currently implemented uses arg 377 for turning animation

-- Navigation Antenna Control
-- local NAV_ANTENNA = "Navigation Antenna"

F4U_1D:reserveIntValue(1) -- nav antenna control not currently implemented, draw arg 36 is for the adjusting handle

-- C-26/ARC-5
local C26 = "Receiver Control Box"

F4U_1D:defineToggleSwitch("RECEIVER_C26_CW_VOICE_SWITCH", devices.RADIONAV, 3613, 96, C26, "Receiver C-26 CW/Voice Switch")
F4U_1D:definePotentiometer("RECEIVER_C26_FREQUENCY_ROTARY", devices.RADIONAV, 3614, 97, { 0, 1 }, C26, "Receiver C-26 Frequency Rotary")
F4U_1D:definePotentiometer("RECEIVER_C26_SENSITIVITY_ROTARY", devices.RADIONAV, 3615, 98, { 0, 1 }, C26, "Receiver C-26 Sensitivity Rotary")
F4U_1D:defineFloat("RECEIVER_C26_FREQUENCY_DIAL", 94, { 0, 1 }, C26, "Receiver C-26 Frequency Dial")

-- C-30A/ARC-5
local C30A = "C-30A/ARC-5 Control Unit"

F4U_1D:defineMultipositionSwitch("C30A_CHANNEL_SELECTOR", devices.RADIO, 3609, 88, 4, 1 / 3, C30A, "Channel Selector (1/2/3/4)")
F4U_1D:defineToggleSwitch("C30A_ON_OFF_SWITCH", devices.RADIO, 3610, 92, C30A, "On/Off Switch")
F4U_1D:defineMultipositionSwitch("C30A_CW_VOICE_SWITCH", devices.RADIO, 3612, 95, 4, 1 / 3, C30A, "CW/Voice Switch (A/B/C/D)")

-- C-38/ARC-5
local C38 = "Range Receiver Control Box"

F4U_1D:definePotentiometer("RECEIVER_C38_NOISE_LEVEL_ROTARY", devices.RADIONAV, 3601, 80, { 0, 1 }, C38, "Receiver C-38 Noise Level Rotary")
F4U_1D:definePotentiometer("RECEIVER_C38_VOLUME_ROTARY", devices.RADIO, 3602, 81, { 0, 1 }, C38, "Receiver C-38 Volume Rotary")
F4U_1D:defineToggleSwitch("RECEIVER_C38_RECEIVER_A_SWITCH", devices.RADIO, 3603, 82, C38, "Receiver C-38 Receiver A On/Off Switch")
F4U_1D:defineToggleSwitch("RECEIVER_C38_RECEIVER_C_SWITCH", devices.RADIONAV, 3604, 83, C38, "Receiver C-38 Receiver C On/Off Switch")
F4U_1D:defineToggleSwitch("RECEIVER_C38_CW_VOICE_SWITCH", devices.RADIONAV, 3605, 84, C38, "Receiver C-38 CW/Voice Switch")
F4U_1D:definePotentiometer("RECEIVER_C38_PITCH_ROTARY", devices.RADIONAV, 3606, 85, { 0, 1 }, C38, "Receiver C-38 Pitch Rotary")
F4U_1D:defineMultipositionSwitch("RECEIVER_C38_CHANNEL_SELECT_SWITCH", devices.RADIONAV, 3607, 86, 6, 1 / 6, C38, "Receiver C38 Channel Switch")
F4U_1D:definePotentiometer("RECEIVER_C38_SENSITIVITY_ROTARY", devices.RADIONAV, 3608, 87, { 0, 1 }, C38, "Receiver C-38 Sensitivity Rotary")
F4U_1D:defineFloat("RECEIVER_C38_CHANNEL_INDICATOR", 93, { 0, 1 }, C38, "Receiver C-38 Channel Indicator")

F4U_1D:defineString("RECEIVER_C38_CHANNEL_INDICATOR_VALUE", function(dev0)
	local val = dev0:get_argument_value(93)
	return tostring(Module.round(Module.valueConvert(val, { 0, 1 }, { 1, 6 })))
end, 1, C38, "Receiver C-38 Selected Channel")

-- IFF Switch Panel
-- local IFF = "IFF Switch Panel"

-- Bat Bomb
local BAT_BOMB_PANEL = "Bat Bomb Panel"
F4U_1D:definePushButton("BAT_BOMB_SEARCH_MODE", devices.BATBOMB, 3882, 810, BAT_BOMB_PANEL, "Bat Bomb Search Button")
F4U_1D:definePushButton("BAT_BOMB_LOCK_TARGET", devices.BATBOMB, 3881, 811, BAT_BOMB_PANEL, "Bat Bomb Lock Target Button")
F4U_1D:definePotentiometer("BAT_BOMB_GAIN", devices.BATBOMB, 3883, 812, { 0, 1 }, BAT_BOMB_PANEL, "Bat Bomb Gain Knob")
F4U_1D:definePotentiometer("BAT_BOMB_SCOPE_BRIGHTNESS", devices.BATBOMB, 3886, 815, { 0, 1 }, BAT_BOMB_PANEL, "Bat Bomb Scope Brightness Knob")
F4U_1D:define3PosTumb("BAT_BOMB_RADAR_ON_OFF", devices.BATBOMB, 3889, 813, BAT_BOMB_PANEL, "Bat Bomb Radar (OFF/MIN/RUN)")
F4U_1D:defineIndicatorLight("BAT_BOMB_TARGET_ALARM_LIGHT", 814, BAT_BOMB_PANEL, "Bat Bomb Target Alarm Light (Red)")
F4U_1D:defineIndicatorLight("BAT_BOMB_PANEL_SCOPE_VISIBILITY", 902, BAT_BOMB_PANEL, "Bat Bomb Panel and Scope Visibility (Not Visible/Visible)")

-- Canopy
local CANOPY = "Canopy"
F4U_1D:definePushButton("CANOPY_HANDLE", devices.UTILITY, 3458, 39, CANOPY, "Canopy Handle")
F4U_1D:definePushButton("CANOPY_JETTISON_HANDLES", devices.UTILITY, 3459, 238, CANOPY, "Canopy Jettison Handles")
F4U_1D:definePotentiometer("MIRROR_ADJUST_CENTER", devices.UTILITY, 3455, 800, { -1, 1 }, CANOPY, "Adjust Center Mirror")
F4U_1D:definePotentiometer("MIRROR_ADJUST_RIGHT", devices.UTILITY, 3456, 801, { -1, 1 }, CANOPY, "Adjust Right Mirror")
F4U_1D:definePotentiometer("MIRROR_ADJUST_LEFT", devices.UTILITY, 3457, 802, { -1, 1 }, CANOPY, "Adjust Left Mirror")

-- Flood Lights
local INTERIOR_LIGHTS = "Interior Lights"

F4U_1D:definePotentiometer("INTERIOR_PANEL_LAMP_LEFT", devices.LIGHTS, 3751, 738, { 0, 1 }, INTERIOR_LIGHTS, "Left Panel Lamp UV/White")
F4U_1D:definePotentiometer("INTERIOR_PANEL_LAMP_RIGHT", devices.LIGHTS, 3752, 739, { 0, 1 }, INTERIOR_LIGHTS, "Right Panel Lamp UV/White")
F4U_1D:definePotentiometer("INTERIOR_INSTRUMENT_BOARD_LAMP_LEFT", devices.LIGHTS, 3753, 740, { 0, 1 }, INTERIOR_LIGHTS, "Left Instrument Board Lamp UV/White")
F4U_1D:definePotentiometer("INTERIOR_INSTRUMENT_BOARD_LAMP_RIGHT", devices.LIGHTS, 3754, 741, { 0, 1 }, INTERIOR_LIGHTS, "Right Instrument Board Lamp UV/White")
F4U_1D:defineFloat("INTERIOR_CHARTBOARD_LAMP_BRIGHTNESS", 637, { 0, 1 }, INTERIOR_LIGHTS, "Chartboard Lamp Brightness")
F4U_1D:defineIndicatorLight("INTERIOR_PANEL_LAMP_ON_OFF_LEFT", 638, INTERIOR_LIGHTS, "Left Panel Lamp On/Off ")
F4U_1D:defineIndicatorLight("INTERIOR_PANEL_LAMP_ON_OFF_RIGHT", 639, INTERIOR_LIGHTS, "Right Panel Lamp On/Off")
F4U_1D:defineIndicatorLight("INTERIOR_INSTRUMENT_BOARD_LAMP_ON_OFF_LEFT", 640, INTERIOR_LIGHTS, "Left Instrument Board Lamp On/Off")
F4U_1D:defineIndicatorLight("INTERIOR_INSTRUMENT_BOARD_LAMP_ON_OFF_RIGHT", 641, INTERIOR_LIGHTS, "Right Instrument Board Lamp On/Off")
F4U_1D:defineFloat("INTERIOR_PANEL_LAMP_BRIGHTNESS_UV_LEFT", 838, { 0, 1 }, INTERIOR_LIGHTS, "Left Panel Brightness (UV)")
F4U_1D:defineFloat("INTERIOR_PANEL_LAMP_BRIGHTNESS_UV_RIGHT", 839, { 0, 1 }, INTERIOR_LIGHTS, "Right Panel Brightness (UV)")
F4U_1D:defineFloat("INTERIOR_INSTRUMENT_BOARD_LAMP_BRIGHTNESS_UV_LEFT", 840, { 0, 1 }, INTERIOR_LIGHTS, "Left Instrument Board Brightness (UV)")
F4U_1D:defineFloat("INTERIOR_INSTRUMENT_BOARD_LAMP_BRIGHTNESS_UV_RIGHT", 841, { 0, 1 }, INTERIOR_LIGHTS, "Right Instrument Board Brightness (UV)")
F4U_1D:defineFloat("INTERIOR_PANEL_LAMP_BRIGHTNESS_WHITE_LEFT", 938, { 0, 1 }, INTERIOR_LIGHTS, "Left Panel Brightness (White)")
F4U_1D:defineFloat("INTERIOR_PANEL_LAMP_BRIGHTNESS_WHITE_RIGHT", 939, { 0, 1 }, INTERIOR_LIGHTS, "Right Panel Brightness (White)")
F4U_1D:defineFloat("INTERIOR_INSTRUMENT_BOARD_LAMP_BRIGHTNESS_WHITE_LEFT", 940, { 0, 1 }, INTERIOR_LIGHTS, "Left Instrument Board Brightness (White)")
F4U_1D:defineFloat("INTERIOR_INSTRUMENT_BOARD_LAMP_BRIGHTNESS_WHITE_RIGHT", 941, { 0, 1 }, INTERIOR_LIGHTS, "Right Instrument Board Brightness (White)")

-- Interior Model
local INTERIOR_MODEL = "Interior Model"

F4U_1D:defineFloat("INTERIOR_MODEL_PANEL_ROTATION_X", 702, { -1, 1 }, INTERIOR_MODEL, "Panel Rotation (X Axis)")
F4U_1D:defineFloat("INTERIOR_MODEL_PANEL_SHAKE_X", 703, { -1, 1 }, INTERIOR_MODEL, "Panel Shake (X Axis)")
F4U_1D:defineFloat("INTERIOR_MODEL_PANEL_SHAKE_Y", 704, { -1, 1 }, INTERIOR_MODEL, "Panel Shake (Y Axis)")
F4U_1D:defineFloat("INTERIOR_MODEL_CANOPY_POSTION", 38, { 0, 1 }, INTERIOR_MODEL, "Position of Canopy")

-- Exterior Lights
local EXTERIOR_LIGHTS = "Exterior Lights"

F4U_1D:defineFloatFromDrawArgument("EXT_LIGHT_NAV_L", 190, EXTERIOR_LIGHTS, "Left Nav Light (Red)")
F4U_1D:defineFloatFromDrawArgument("EXT_LIGHT_NAV_R", 191, EXTERIOR_LIGHTS, "Right Nav Light (Green)")
F4U_1D:defineFloatFromDrawArgument("EXT_LIGHT_NAV_AFT", 192, EXTERIOR_LIGHTS, "Aft Nav Light (White)")
F4U_1D:defineFloatFromDrawArgument("EXT_LIGHT_RECONGITION_RED", 200, EXTERIOR_LIGHTS, "Recognition Light (Red)")
F4U_1D:defineFloatFromDrawArgument("EXT_LIGHT_RECONGITION_GREEN", 201, EXTERIOR_LIGHTS, "Recognition Light (Green)")
F4U_1D:defineFloatFromDrawArgument("EXT_LIGHT_RECONGITION_AMBER", 202, EXTERIOR_LIGHTS, "Recognition Light (Amber)")
F4U_1D:defineFloatFromDrawArgument("EXT_LIGHT_FORMATION", 88, EXTERIOR_LIGHTS, "Formation Lights (Blue)")
F4U_1D:defineBitFromDrawArgument("EXT_LIGHT_APPROACH", 208, EXTERIOR_LIGHTS, "Approach Light (Green)")

-- Exterior Model
local EXTERIOR_MODEL = "Exterior Model"

F4U_1D:defineFloatFromExternalDrawArgument("EXT_GEAR_TAIL_POS", 0, { 0, 1 }, EXTERIOR_MODEL, "Tail Gear Position")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_GEAR_LEFT_POS", 5, { 0, 1 }, EXTERIOR_MODEL, "Left Gear Position")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_GEAR_RIGHT_POS", 3, { 0, 1 }, EXTERIOR_MODEL, "Right Gear Position")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_GEAR_TAIL_WOW", 1, { 0, 1 }, EXTERIOR_MODEL, "Weight On Wheels Tail Gear")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_GEAR_LEFT_WOW", 6, { 0, 1 }, EXTERIOR_MODEL, "Weight On Wheels Left Gear")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_GEAR_RIGHT_WOW", 4, { 0, 1 }, EXTERIOR_MODEL, "Weight On Wheels Right Gear")
F4U_1D:defineFullRangeFloatFromExternalDrawArgument("EXT_GEAR_TAIL_ROT", 2, EXTERIOR_MODEL, "Tail Gear Rotation")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_GEAR_TAIL_HOOK_POS", 25, { 0, 1 }, EXTERIOR_MODEL, "Tail Hook Position")
F4U_1D:defineFullRangeFloatFromExternalDrawArgument("EXT_GEAR_TAIL_HOOK_ROT", 26, EXTERIOR_MODEL, "Tail Hook Rotation")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_WINGS_FOLD_POS", 8, { 0, 1 }, EXTERIOR_MODEL, "Folded Wings Position")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_WINGS_FLAPS_RIGHT_POS", 9, { 0, 1 }, EXTERIOR_MODEL, "Right Flaps Position")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_WINGS_FLAPS_LEFT_POS", 10, { 0, 1 }, EXTERIOR_MODEL, "Left Flaps Position")
F4U_1D:defineFullRangeFloatFromExternalDrawArgument("EXT_WINGS_AILERON_RIGHT_POS", 11, EXTERIOR_MODEL, "Right Aileron Position")
F4U_1D:defineFullRangeFloatFromExternalDrawArgument("EXT_WINGS_AILERON_LEFT_POS", 12, EXTERIOR_MODEL, "Left Aileron Position")
F4U_1D:defineFullRangeFloatFromExternalDrawArgument("EXT_TAIL_ELEVATOR_LEFT_POS", 16, EXTERIOR_MODEL, "Left Elevator Position")
F4U_1D:defineFullRangeFloatFromExternalDrawArgument("EXT_TAIL_ELEVATOR_RIGHT_POS", 15, EXTERIOR_MODEL, "Right Elevator Position")
F4U_1D:defineFullRangeFloatFromExternalDrawArgument("EXT_TAIL_RUDDER_POS", 17, EXTERIOR_MODEL, "Rudder Position")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_COWL_FLAPS_POS", 277, { 0, 1 }, EXTERIOR_MODEL, "Cowl Flaps Position")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_OIL_COOLER_FLAP_POS", 278, { 0, 1 }, EXTERIOR_MODEL, "Oil Cooler Flap Position")
F4U_1D:defineFloatFromExternalDrawArgument("EXT_INTERCOOLER_FLAP_POS", 279, { 0, 1 }, EXTERIOR_MODEL, "Intercooler Flap Position")

-- Radios
F4U_1D:defineReadWriteRadio("RADIO_C_30A", 8, 7, 3, 1000, "C-30A")

return F4U_1D
