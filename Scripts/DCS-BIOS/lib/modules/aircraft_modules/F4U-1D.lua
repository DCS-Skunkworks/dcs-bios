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
-- local DROP_TANK_BOMB = "Drop Tank/Bomb Release"

-- Trim/Tail Wheel Controls
-- local TRIM_TAIL_WHEEL = "Trim/Tail Wheel"

-- Emergency Landing Gear Deployment
-- local CO2_GEAR = "Emergency Landing Gear Deployment"
-- co2 bottle (not implemented, reserve toggle and float for both valves)
-- hydraulic system hand pump

-- Fuel Selector
-- local FUEL_SELECTOR = "Fuel Selector"

-- Engine Control Unit
-- local ENGINE_CONTROL_UNIT = "Engine Control Unit"

-- Landing Gear and Dive Brake Control
-- local GEAR_DIVE_BRAKE = "Landing Gear/Dive Brake"
-- 3x landing gear indicators

-- Forward Left Circuit Breaker Panel
-- local LEFT_CB = "Forward Left Circuit Breaker Panel"

-- Rocket Launching Switch
-- local ROCKETS = "Rocket Launching Switch"

-- Ignition Switch
-- local IGNITION = "Ignition Switch"

-- Wing Flaps Control
-- local FLAPS = "Wing Flaps"

-- Gun Charging Controls
-- local GUN_CHARGE = "Gun Charging"

-- Front Dashboard
-- local FRONT_DASH = "Front Dashboard"

-- Chartboard
-- local CHARTBOARD = "Chartboard"

-- Gun Switch Box
-- local GUN_SWITCH_BOX = "Gun Switch Box"

-- Gun Sight
-- local GUN_SIGHT = "Gun Sight"
-- inclinometer

-- Defroster Control
-- local DEFROSTER = "Defroster"

-- Bomb Switch Box
-- local BOMB_SWITCH_BOX = "Bomb Switch Box"

-- Tachometer
-- local TACHOMETER = "Tachometer"

-- Altimeter
-- local ALTIMETER = "Altimeter"

-- Directional Gyro
-- local DIRECTIONAL_GYRO = "Directional Gyro"

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
