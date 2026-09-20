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

--- Computes the index location of a gauge
--- @param dev0 CockpitDevice dcs device 0
--- @param arg_number integer the dcs argument number
--- @param default_index integer the default index of the gauge
--- @return integer index the current gauge index
local function gauge_index(dev0, arg_number, default_index)
	local value = dev0:get_argument_value(arg_number)
	value = math.min(value, 0.6) -- nothing extends past 0.6

	return math.floor((value + 0.1 * default_index) * 10) % 7
end

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

local ATTITUDE = "Attitude Indicator"

F_100D:defineFloat("ATTITUDE_PITCH", 50, { -1, 1 }, ATTITUDE, "Pitch")
F_100D:defineFloat("ATTITUDE_ROLL", 51, { -1, 1 }, ATTITUDE, "Roll")
F_100D:defineFloat("ATTITUDE_OFF_FLAG", 55, { 1, 0 }, ATTITUDE, "Off Flag")

F_100D:definePotentiometer("ATTITUDE_ADJUST", devices.AVIONICS, 3002, 52, { 0, 1 }, ATTITUDE, "Attitude Indicator Adjust")

F_100D:defineIntegerFromGetter("ATTITUDE_POSITION", function(dev0)
	return gauge_index(dev0, 291, 0)
end, 6, ATTITUDE, "Attitude Indicator Position Index")

-- Vertical Velocity Indicator

local VVI = "Vertical Velocity Indicator"

F_100D:defineFloat("VVI_NEEDLE", 108, { -1, 1 }, VVI, "Vertical Velocity")

F_100D:defineIntegerFromGetter("VVI_POSITION", function(dev0)
	return gauge_index(dev0, 292, 1)
end, 6, VVI, "Vertical Velocity Indicator Position Index")

-- Turn-and-Slip Indicator

-- Accelerometer

-- Oil Pressure Gauge

-- Clock

-- Master Heading Indicator

local MASTER_HEADING = "Master Heading Indicator"

F_100D:definePotentiometer("MASTER_HEADING_CORRECTION", devices.J4_COMPASS, 3007, 42, { 0, 1 }, MASTER_HEADING, "Compass Correction")

F_100D:defineFloat("MASTER_HEADING_CARD", 40, { 0, 1 }, MASTER_HEADING, "Compass Card")
F_100D:defineFloat("MASTER_HEADING_NEEDLE", 41, { 0, 1 }, MASTER_HEADING, "Compass Needle")

F_100D:defineIntegerFromGetter("MASTER_HEADING_POSITION", function(dev0)
	return gauge_index(dev0, 293, 2)
end, 6, MASTER_HEADING, "Master Heading Indicator Position Index")

-- Radio Magnetic Indicator

local RADIO_HEADING = "Radio Magnetic Indicator"

F_100D:defineFloat("RADIO_HEADING_CARD", 165, { 0, 1 }, RADIO_HEADING, "Compass Card")
F_100D:defineFloat("RADIO_HEADING_NEEDLE", 166, { 0, 1 }, RADIO_HEADING, "Compass Needle")
F_100D:defineFloat("RADIO_HEADING_COURSE", 167, { 0, 1 }, RADIO_HEADING, "Compass Course")

F_100D:defineIntegerFromGetter("RADIO_HEADING_POSITION", function(dev0)
	return gauge_index(dev0, 294, 3)
end, 6, RADIO_HEADING, "Radio Magnetic Indicator Position Index")

-- Altimeter

local ALTIMETER = "Altimeter"

F_100D:defineRotary("ALTIMETER_ADJUST", devices.AVIONICS, 3007, 203, ALTIMETER, "Barometric Pressure Adjustment")
F_100D:define3PosTumb("ALTIMETER_MODE", devices.AVIONICS, 3014, 204, ALTIMETER, "Altimeter Mode", { positions = { "RESET", "NORM", "STBY" } })

F_100D:defineFloat("ALTIMETER_ALTITUDE_TEN_THOUSANDS", 196, { 0, 1 }, ALTIMETER, "Altitude Drum (Ten Thousands)")
F_100D:defineFloat("ALTIMETER_ALTITUDE_THOUSANDS", 197, { 0, 1 }, ALTIMETER, "Altitude Drum (Thousands)")
F_100D:defineFloat("ALTIMETER_ALTITUDE_HUNDREDS", 198, { 0, 1 }, ALTIMETER, "Altitude Drum (Hundreds)")

F_100D:defineFloat("ALTIMETER_PRESSURE_TENS", 199, { 0, 1 }, ALTIMETER, "Pressure Drum (Tens)")
F_100D:defineFloat("ALTIMETER_PRESSURE_ONES", 200, { 0, 1 }, ALTIMETER, "Pressure Drum (Ones)")
F_100D:defineFloat("ALTIMETER_PRESSURE_TENTHS", 201, { 0, 1 }, ALTIMETER, "Pressure Drum (Tenths)")
F_100D:defineFloat("ALTIMETER_PRESSURE_HUNDREDTHS", 202, { 0, 1 }, ALTIMETER, "Pressure Drum (Hundredths)")

F_100D:defineFloat("ALTIMETER_STANDBY_FLAG", 205, { 0, 1 }, ALTIMETER, "Standby Flag")

F_100D:defineFloat("ALTIMETER_NEEDLE", 195, { 0, 1 }, ALTIMETER, "Altimeter Needle")

local MAP_10K = { [0] = " ", [9] = "-" }

local function altimeter_10k_value(dev0, arg_number)
	local drum_value = Module.drum_value(dev0, arg_number)
	return MAP_10K[drum_value] or tostring(drum_value)
end

F_100D:defineString("ALTIMETER_ALTITUDE", function(dev0)
	return altimeter_10k_value(dev0, 196) .. Module.drum_set(dev0, 197, 198)
end, 3, ALTIMETER, "Altitude Drum Value")

F_100D:defineString("ALTIMETER_PRESSURE", function(dev0)
	return Module.drum_set(dev0, 199, 200, 201, 202)
end, 4, ALTIMETER, "Pressure Drum Value")

F_100D:defineIntegerFromGetter("ALTIMETER_POSITION", function(dev0)
	return gauge_index(dev0, 295, 4)
end, 6, ALTIMETER, "Altimeter Position Index")

-- LABS Dive-and-Roll Indicator

-- Exhaust Temperature Gauge

-- Tachometer

-- Sight Selector Unit

-- TACAN Range Indicator

local TACAN_RANGE = "TACAN Range Indicator"

F_100D:defineFloat("TACAN_RANGE_HUNDREDS", 160, { 0, 1 }, TACAN_RANGE, "Range Drum (Hundreds)")
F_100D:defineFloat("TACAN_RANGE_TENS", 161, { 0, 1 }, TACAN_RANGE, "Range Drum (Tens)")
F_100D:defineFloat("TACAN_RANGE_ONES", 162, { 0, 1 }, TACAN_RANGE, "Range Drum (Ones)")
F_100D:defineFloat("TACAN_RANGE_FLAG", 163, { 0, 1 }, TACAN_RANGE, "Standby Flag")

F_100D:defineString("TACAN_RANGE_VALUE", function(dev0)
	return Module.drum_set(dev0, 160, 161, 162)
end, 3, TACAN_RANGE, "TACAN Range Drum Value")

F_100D:defineIntegerFromGetter("TACAN_RANGE_POSITION", function(dev0)
	return gauge_index(dev0, 296, 5)
end, 6, TACAN_RANGE, "TACAN Range Indicator Position Index")

-- Course Indicator

local COURSE = "Course Indicator"

F_100D:defineRotary("COURSE_SET", devices.TACAN, 3010, 186, COURSE, "Course Set")

F_100D:defineFloat("COURSE_NEEDLE", 180, { 0, 1 }, COURSE, "Course Needle")
F_100D:defineFloat("COURSE_TRACK_NEEDLE", 181, { -1, 1 }, COURSE, "Course Track Needle")
F_100D:defineFloat("COURSE_GLIDE_SLOPE_NEEDLE", 182, { -1, 1 }, COURSE, "Glide Slope Needle")

F_100D:defineFloat("COURSE_HUNDREDS_TENS", 183, { 0, 1 }, COURSE, "Course Drum (Hundreds/Tens)")
F_100D:defineFloat("COURSE_ONES", 185, { 0, 1 }, COURSE, "Course Drum (Ones)")

F_100D:defineFloat("COURSE_FROM_TO", 187, { -1, 1 }, COURSE, "FROM/TO Drum")
F_100D:defineFloat("COURSE_TRACK_OFF", 188, { 1, 0 }, COURSE, "Course Track Off Flag")
F_100D:defineFloat("COURSE_GLIDE_SLOPE_OFF", 189, { 1, 0 }, COURSE, "Course Glide Slope Off Flag")

F_100D:defineString("COURSE_VALUE", function(dev0)
	return string.format("%02d", Module.drum_value(dev0, 183, false, 36)) .. Module.drum_value(dev0, 185)
end, 3, COURSE, "Course Drum Value")

F_100D:defineIntegerFromGetter("COURSE_POSITION", function(dev0)
	return gauge_index(dev0, 297, 6)
end, 6, COURSE, "Course Indicator Position Index")

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
