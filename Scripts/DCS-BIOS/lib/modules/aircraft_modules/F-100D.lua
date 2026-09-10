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

local RHAW = "AN/APR-25(V) RWR"

F_100D:defineIndicatorLight("RHAW_HIDDEN", 824, RHAW, "RHAW Hidden")

F_100D:definePotentiometer("RHAW_INTENSITY", devices.RHAW, 3018, 823, { 0, 1 }, RHAW, "Intensity")
F_100D:definePushButton("RHAW_X_BAND_DISABLE", devices.RHAW, 3011, 822, RHAW, "X Band Disable")
F_100D:defineFloat("RHAW_X_BAND_DISABLE_LIGHT", 839, { 0, 1 }, RHAW, "X Band Disable Light (orange)")

F_100D:definePushButton("RHAW_I_SAM", devices.RHAW, 3001, 810, RHAW, "I SAM Button")
F_100D:definePushButton("RHAW_G_SAM", devices.RHAW, 3002, 811, RHAW, "G SAM Button")
F_100D:definePushButton("RHAW_E_SAM", devices.RHAW, 3003, 812, RHAW, "E SAM Button")
F_100D:definePushButton("RHAW_LAUNCH", devices.RHAW, 3004, 813, RHAW, "LAUNCH Button")
F_100D:definePushButton("RHAW_AAA_DEF", devices.RHAW, 3005, 814, RHAW, "AAA DEF Button")
F_100D:definePushButton("RHAW_AI", devices.RHAW, 3006, 815, RHAW, "AI Button")
F_100D:definePushButton("RHAW_G_LORO", devices.RHAW, 3007, 816, RHAW, "G LORO Button")
F_100D:definePushButton("RHAW_AAA_AI", devices.RHAW, 3008, 817, RHAW, "AAA/AI Button")
F_100D:definePushButton("RHAW_ACT_PWR", devices.RHAW, 3009, 818, RHAW, "ACT/PWR Button")
F_100D:definePushButton("RHAW_POWER", devices.RHAW, 3010, 819, RHAW, "POWER Button")

F_100D:definePotentiometer("RHAW_VOLUME", devices.RHAW, 3012, 820, { 0, 1 }, RHAW, "Volume")
F_100D:definePotentiometer("RHAW_DIMMER", devices.RHAW, 3015, 821, { 0, 1 }, RHAW, "Dimmer")

F_100D:defineFloat("RHAW_I_SAM_HI_LIGHT", 825, { 0, 1 }, RHAW, "I SAM HI Light (red)")
F_100D:defineFloat("RHAW_I_SAM_LO_LIGHT", 826, { 0, 1 }, RHAW, "I SAM LO Light (red)")
F_100D:defineFloat("RHAW_G_SAM_HI_LIGHT", 827, { 0, 1 }, RHAW, "G SAM HI Light (red)")
F_100D:defineFloat("RHAW_G_SAM_LO_LIGHT", 828, { 0, 1 }, RHAW, "G SAM LO Light (red)")
F_100D:defineFloat("RHAW_E_SAM_HI_LIGHT", 829, { 0, 1 }, RHAW, "E SAM HI Light (red)")
F_100D:defineFloat("RHAW_E_SAM_LO_LIGHT", 830, { 0, 1 }, RHAW, "E SAM LO Light (red)")
F_100D:defineFloat("RHAW_LAUNCH_LIGHT", 831, { 0, 1 }, RHAW, "MISSILE LAUNCH Light (red)")
F_100D:defineFloat("RHAW_AAA_DEF_LIGHT", 832, { 0, 1 }, RHAW, "AAA DEFEAT Light (red)")
F_100D:defineFloat("RHAW_AI_WX_LIGHT", 833, { 0, 1 }, RHAW, "AI WX Light (red)")
F_100D:defineFloat("RHAW_AI_DAY_LIGHT", 834, { 0, 1 }, RHAW, "AI DAY Light (red)")
F_100D:defineFloat("RHAW_G_LORO_LIGHT", 835, { 0, 1 }, RHAW, "G LORO Light (red)")
F_100D:defineFloat("RHAW_AAA_AI_LIGHT", 836, { 0, 1 }, RHAW, "AAA/AI Light (red)")
F_100D:defineFloat("RHAW_ACT_PWR_LIGHT", 837, { 0, 1 }, RHAW, "ACTIVITY POWER Light (red)")
F_100D:defineFloat("RHAW_POWER_LIGHT", 838, { 0, 1 }, RHAW, "SYSTEM POWER Light (green)")

-- Status Display Lights

-- Drag Chute Handle

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
