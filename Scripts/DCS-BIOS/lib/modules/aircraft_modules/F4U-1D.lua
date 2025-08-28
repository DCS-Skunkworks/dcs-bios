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
-- local TACHOMETER = "Tachometer"

-- Altimeter
-- local ALTIMETER = "Altimeter"

-- Directional Gyro
local DIRECTIONAL_GYRO = "Directional Gyro"

F4U_1D:defineFloat("DIRECTIONAL_GYRO_HEADING", 12, { 0, 1 }, DIRECTIONAL_GYRO, "Directional Gyro Heading")
F4U_1D:defineFloat("DIRECTIONAL_GYRO_HEADING_CAGE_FLAG", 313, { 0, 1 }, DIRECTIONAL_GYRO, "Directional Gyro Heading Cage Flag")
F4U_1D:definePotentiometer("DIRECTIONAL_GYRO_SET", devices.NAV, 3362, 12, { 0, 1 }, DIRECTIONAL_GYRO, "Directional Gyro Heading Set")
F4U_1D:definePushButton("DIRECTIONAL_GYRO_CAGE", devices.NAV, 3365, 313, DIRECTIONAL_GYRO, "Directional Gyro Heading Cage")

-- Manifold Pressure Gauge
-- local MANIFOLD_PRESSURE = "Manifold Pressure Gauge"

-- Airspeed Indicator
-- local ASI = "Airspeed Indicator"

-- Compass
-- local COMPASS = "Compass"

-- Turn and Bank Indicator
-- local TURN_BANK_INDICATOR = "Turn and Bank Indicator"

-- Gyro Horizon
-- local HORIZON_GYRO = "Gyro Horizon"

-- Climb Indicator
-- local VSI = "Climb Indicator"

-- Clock
-- local CLOCK = "Clock"

-- Cylinder Temperature Indicator
-- local CHT = "Cylinder Temperature Indicator"

-- Engine Gauge Unit
-- local ENGINE_GAUGE_UNIT = "Engine Gauge Unit"

-- Fuel Quantity Gauge
-- local FUEL_QUANTITY = "Fuel Quantity Gauge"

-- Hydraulic Pressure Gauge
-- local HYD_PRESSURE = "Hydraulic Pressure Gauge"

-- Voltammeter
-- local VOLTAMMETER = "Voltammeter"

-- Accelerometer
-- local ACCELEROMETER = "Accelerometer"

-- Fuel Pressure Gauge
-- local FUEL_PRESSURE_GAUGE = "Fuel Pressure Gauge"

-- Emergency Pressure Release
-- local EMERGENCY_PRESSURE_RELEASE = "Emergency Pressure Release"

-- Rocket Station Distributor Box
-- local ROCKET_STATION = "Rocket Station Distributor Box"

-- Cooling Flaps Controls
-- local COOLING_FLAPS = "Cooling Flaps Controls"
-- includes two indicators on front right panel

-- Pilot's Distribution Box
-- local PILOT_DISTRO = "Pilot's Distribution Box"

-- Arresting Hook Control
-- local HOOK = "Arresting Hook"

-- Oxygen System
-- local O2_SYSTEM = "Oxygen System"
-- includes flow indicator

-- Navigation Antenna Control
-- local NAV_ANTENNA = "Navigation Antenna"

-- C-26/ARC-5
-- local C26 = "Receiver Control Box"

-- C-30A/ARC-5
-- local C30A = "C-30A/ARC-5 Control Unit"

-- C-38/ARC-5
-- local C38 = "Range Receiver Control Box"

-- IFF Switch Panel
-- local IFF = "IFF Switch Panel"

-- Bat Bomb
-- local BAT_BOMB_PANEL = "Bat Bomb Panel"
-- 902, contains additional controls
-- display has knob too

-- Canopy
-- local CANOPY = "Canopy"
-- emergency release, mirrors

-- Flood Lights
-- local INTERIOR_LIGHTS = "Interior Lights"

-- Interior Model
-- local INTERIOR_MODEL = "Interior Model"

-- Exterior Lights
-- local EXTERIOR_LIGHTS = "Exterior Lights"

-- Exterior Model
-- local EXTERIOR_MODEL = "Exterior Model"

-- Radios

return F4U_1D
