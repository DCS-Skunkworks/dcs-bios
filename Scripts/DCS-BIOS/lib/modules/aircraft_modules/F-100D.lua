module("F100D", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_100D: Module
local F_100D = Module:new("F-100D", 0xa800, { "F-100D" })

-- Special Args:
-- 22: Joystick visibility (Hidden > 0.5 )

local devices = {
	INSTRUMENTS = 1,
	ELECTRICAL = 2,
	TACAN = 3,
	UHF = 4,
	RADIO_COMPASS = 5,
	INTERCOM = 6,
	ADF = 7,
	COMM_AMPLIFIER = 8,
	HYDRAULICS = 9,
	ENGINE = 10,
	FUEL = 11,
	CANOPY = 12,
	AVIONICS = 13,
	J4_COMPASS = 14,
	WEAPONS = 15,
	WEAPONS2 = 16,
	DCU9A = 17,
	OXYGEN = 18,
	ECS = 19,
	FCS = 20,
	LIGHTING = 21,
	IFF = 22,
	SEEK_SILENCE = 23,
	STANDBY_COMPASS = 24,
	GUNSIGHT = 25,
	ABU11 = 26,
	DBM4C = 27,
	TYPEN9 = 28,
	KB3 = 29,
	AWRS = 30,
	PYLON_CONTROL = 31,
	TAILHOOK = 32,
	APG30 = 33,
	JET_COMPUTER = 34,
	ZLL = 35,
	RHAW = 36,
	BRAKES = 37,
	INSTRUMENT_SYSTEM = 38,
	LABS = 39,
	MACROS = 40,
	KNEEBOARD = 41,
	WEBVIEW = 42,
}

-- Instrument Panel Top
-- AN/APR-25(V) RWR

-- Status Display Lights

-- Drag Chute Handle

local DRAG_CHUTE = "Drag Chute"

F_100D:define3PosTumb("DRAG_CHUTE", devices.BRAKES, 3001, 245, DRAG_CHUTE, "Drag Chute", { positions = { "STOW", "DEPLOY", "RELEASE" } })

-- Magnetic Compass

-- A-4 Gunsight / Wingspan / Radar Lock

-- Instrument Panel
-- Radio Remote Channel Indicator

-- AC Loadmeter

-- DC Loadmeter

-- Master Caution Light

-- Gun Selector

-- VGI ERECT Button

-- Fire / Overheat Warning Lights

-- Hydraulic Pressure Selector

-- Hydraulic Pressure Gauge

-- Standby Attitude Indicator

-- Airspeed/Mach Indicator

-- Attitude Indicator

-- Vertical Velocity Indicator

-- Turn-and-Slip Indicator

-- Accelerometer

-- Oil Pressure Gauge

-- Clock

-- Master Heading Indicator

-- Radio Magnetic Indicator

-- Altimeter

-- LABS Dive-and-Roll Indicator

-- Exhaust Temperature Gauge

-- Tachometer

-- Sight Selector Unit

local SIGHT_SELECTOR = "Sight Selector Unit"

F_100D:definePotentiometer("SIGHT_SELECTOR_DEPRESSION", devices.GUNSIGHT, 3023, 175, { 0, 1 }, SIGHT_SELECTOR, "Sight Depression")
F_100D:defineMultipositionSwitch("SIGHT_SELECTOR_WEAPON", devices.GUNSIGHT, 3019, 176, 3, 0.1, SIGHT_SELECTOR, "Weapon Selector", { positions = { "BOMB", "GUN", "ROCKET" } })
F_100D:defineMultipositionSwitch("SIGHT_SELECTOR_SPEED", devices.GUNSIGHT, 3021, 177, 3, 0.1, SIGHT_SELECTOR, "Speed Range Selector", { positions = { "LO", "HI", "TR" } })

F_100D:defineFloat("SIGHT_SELECTOR_INDEX_1", 172, { 0, 1 }, SIGHT_SELECTOR, "Index Marker 1")
F_100D:defineFloat("SIGHT_SELECTOR_INDEX_2", 174, { 0, 1 }, SIGHT_SELECTOR, "Index Marker 2")
F_100D:defineFloat("SIGHT_SELECTOR_INDEX_3", 171, { 0, 1 }, SIGHT_SELECTOR, "Index Marker 3")
F_100D:defineFloat("SIGHT_SELECTOR_INDEX_4", 173, { 0, 1 }, SIGHT_SELECTOR, "Index Marker 4")

-- TACAN Range Indicator

-- Course Indicator

-- Tacan ILS Light (Inoperative)

-- Fuel Boost Pump INOP Light

-- Fuel Quantity Gauges

-- Fuel Flow Indicator

-- Engine Pressure Ratio Gauge

-- External Load Emergency Jettison Handle

-- Special Store Unlock Handle

-- Landing Gear Emergency Lowering Handle

-- Center Pedestal
-- DCU 9/A In-Flight Control Tester Panel

-- Drop Tank Panel

-- TRP Timer

-- LADD Release Timer

-- Foot Warmer

-- Seat

-- Stick

-- Rudder Pedals

-- Left Side
-- Left Circuit Breaker Panel

-- Speed Brake Emergency Dump Lever

-- Canopy Switch

-- LABS Y/R Gyro Check / Arresting Hook Panel

-- Pylon Loading Control Panel

-- Missile Control Panel

-- Anti G Suit Pressure Regulating Valve

-- Camera Control Panel

-- Spare Lamps Panel

-- Armament Control Panel

-- External Load Auxiliary Release Panel

-- Command Radio Control Panel

-- Seek Silence Control Panel

-- AWRS Control Panel

-- Throttle

-- Flaps Handle

-- Flaps Emergency Switch

-- Engine and Flight Control Panel

-- Landing Gear Control Panel

-- Right Side
-- Indicator and Caution Light Panel

-- Electrical Control Panel

-- Oxygen Regulator Control Panel

-- Liquid Oxygen Gauge

-- Canopy Alternate Emergency Jettison Handle

-- IFF/SIF Control Panel

-- Radio Compass Control Panel

-- TACAN Control Panel

-- J-4 Compass Control Panel

-- Exterior Floodlight / Anticollision Light Panel

-- Lighting Control Panel

-- Air Conditioning Control Panel

-- Standby Instrument Inverter Switch

-- Navigation Computer

-- Flight Control Emergency Hydraulic Pump Lever

-- Cockpit Pressure Altitude Indicator

-- Interphone / DC Fuel Boost Pump Test Switch

-- Right Circuit Breaker Panel

-- General
-- Interior Lights

-- Interior Model

-- Exterior Lights

-- Exterior Model

-- Radios

return F_100D
