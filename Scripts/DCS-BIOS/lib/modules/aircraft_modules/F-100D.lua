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

-- TACAN Range Indicator

-- Course Indicator

-- Tacan ILS Light (Inoperative)

-- Fuel Boost Pump INOP Light

-- Fuel Quantity Gauges

-- Fuel Flow Indicator

-- Engine Pressure Ratio Gauge

local EPR = "Engine Pressure Ratio Gauge"

F_100D:defineSpringloaded_3PosTumb("EPR_SET_MODE", devices.ENGINE, 3013, 3014, 120, EPR, "Engine Pressure Ratio Set Mode", { positions = { "TAKE OFF", "NONE", "CRUISE" } })
F_100D:defineRotaryWithRange("EPR_SET_ROTATE", devices.ENGINE, 3015, 117, { -1, 1 }, EPR, "Set Engine Pressure Ratio")

F_100D:defineFloat("EPR_NEEDLE", 110, { 0, 1 }, EPR, "Engine Pressure Ratio")

F_100D:defineFloat("EPR_CRUISE_HUNDREDS", 111, { 0, 1 }, EPR, "Cruise Drum (Hundreds)")
F_100D:defineFloat("EPR_CRUISE_TENS", 112, { 0, 1 }, EPR, "Cruise Drum (Tens)")
F_100D:defineFloat("EPR_CRUISE_ONES", 113, { 0, 1 }, EPR, "Cruise Drum (Ones)")
F_100D:defineFloat("EPR_CRUISE_INDEX", 119, { 0, 1 }, EPR, "Cruise Index")

F_100D:defineString("EPR_CRUISE", function(dev0)
	return Module.drum_set(dev0, 111, 112, 113)
end, 3, EPR, "Cruise Drum Value")

F_100D:defineFloat("EPR_TO_HUNDREDS", 114, { 0, 1 }, EPR, "Take Off Drum (Hundreds)")
F_100D:defineFloat("EPR_TO_TENS", 115, { 0, 1 }, EPR, "Take Off Drum (Tens)")
F_100D:defineFloat("EPR_TO_ONES", 116, { 0, 1 }, EPR, "Take Off Drum (Ones)")
F_100D:defineFloat("EPR_TO_INDEX", 118, { 0, 1 }, EPR, "Take Off Index")

F_100D:defineString("EPR_TO", function(dev0)
	return Module.drum_set(dev0, 114, 115, 116)
end, 3, EPR, "Take Off Drum Value")

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
