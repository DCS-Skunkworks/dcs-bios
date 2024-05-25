module("F-4E", package.seeall)

local Log = require("Scripts.DCS-BIOS.lib.common.Log")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_4E: Module
local F_4E = Module:new("F-4E", 0x2A00, { "F-4E-45MC" })

--- Default limited multiposition tumb for F-4E
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param count integer the number of discrete steps the control has
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function F_4E:defineMultipositionRollerLimited(identifier, device_id, command, arg_number, count, category, description)
	self:defineTumb(identifier, device_id, command, arg_number, 1 / (count - 1), { 0, 1 }, nil, false, category, description)
end

-- ICS
local ICS_DEVICE_ID = 2

-- ARC-164
local ARC_164_DEVICE_ID = 3

-- IFF
local IFF_DEVICE_ID = 4

-- pilot iff panel
local PILOT_IFF_PANEL = "PLT IFF Panel"

F_4E:defineMultipositionSwitch("PLT_IFF_CODE", IFF_DEVICE_ID, 3001, 1322, 4, 1 / 3, PILOT_IFF_PANEL, "Select Mode 4 Function")
F_4E:definePushButton("PLT_IFF_REPLY_TEST_BUTTON", IFF_DEVICE_ID, 3064, 2843, PILOT_IFF_PANEL, "IFF Reply Lamp (push to test)")
F_4E:definePotentiometer("PLT_IFF_REPLY_TEST_DIM", IFF_DEVICE_ID, 3065, 2842, { 0, 1 }, PILOT_IFF_PANEL, "IFF Reply Lamp (rotate to dim)")
F_4E:defineIndicatorLight("PLT_IFF_REPLY_TEST_LIGHT", 2557, PILOT_IFF_PANEL, "IFF Reply Test Light (Blue)")
F_4E:definePushButton("PLT_IFF_TEST_BUTTON", IFF_DEVICE_ID, 3066, 2845, PILOT_IFF_PANEL, "IFF Test Lamp (push to test)")
F_4E:definePotentiometer("PLT_IFF_TEST_DIM", IFF_DEVICE_ID, 3067, 2844, { 0, 1 }, PILOT_IFF_PANEL, "IFF Test Lamp (rotate to dim)")
F_4E:defineIndicatorLight("PLT_IFF_TEST_LIGHT", 2556, PILOT_IFF_PANEL, "IFF Test Light (Blue)")
F_4E:defineMultipositionSwitch("PLT_IFF_MASTER", IFF_DEVICE_ID, 3005, 1521, 5, 1 / 4, PILOT_IFF_PANEL, "Select Master Mode")
F_4E:define3PosTumb("PLT_IFF_AUDIO_LIGHT_SW", IFF_DEVICE_ID, 3009, 1328, PILOT_IFF_PANEL, "Select Mode 4 Indication")
F_4E:define3PosTumb("PLT_IFF_M1", IFF_DEVICE_ID, 3013, 1323, PILOT_IFF_PANEL, "Mode 1")
F_4E:define3PosTumb("PLT_IFF_M2", IFF_DEVICE_ID, 3017, 1324, PILOT_IFF_PANEL, "Mode 2")
F_4E:define3PosTumb("PLT_IFF_M3", IFF_DEVICE_ID, 3021, 1325, PILOT_IFF_PANEL, "Mode 3A")
F_4E:define3PosTumb("PLT_IFF_MC", IFF_DEVICE_ID, 3025, 1326, PILOT_IFF_PANEL, "Mode C")
F_4E:define3PosTumb("PLT_IFF_RAD", IFF_DEVICE_ID, 3029, 1329, PILOT_IFF_PANEL, "Monitor Radiation")
F_4E:defineToggleSwitch("PLT_IFF_M4", IFF_DEVICE_ID, 3033, 1327, PILOT_IFF_PANEL, "Mode 4")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M1_CODE_TENS", IFF_DEVICE_ID, 3036, 1331, 8, PILOT_IFF_PANEL, "M1 Code (tens)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M1_CODE_ONES", IFF_DEVICE_ID, 3040, 1332, 4, PILOT_IFF_PANEL, "M1 Code (ones)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M3_CODE_THOUSANDS", IFF_DEVICE_ID, 3044, 1333, 8, PILOT_IFF_PANEL, "M3 Code (thousands)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M3_CODE_HUNDREDS", IFF_DEVICE_ID, 3048, 1334, 8, PILOT_IFF_PANEL, "M3 Code (hundreds)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M3_CODE_TENS", IFF_DEVICE_ID, 3052, 1335, 8, PILOT_IFF_PANEL, "M3 Code (tens)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M3_CODE_ONES", IFF_DEVICE_ID, 3056, 1336, 8, PILOT_IFF_PANEL, "M3 Code (ones)")

local function plt_iff_argument_display(dev0, arg_number, max_value)
	return Module.round(dev0:get_argument_value(arg_number) * max_value)
end

F_4E:defineString("PLT_IFF_M1_CODE", function(dev0)
	return string.format("%d%d", plt_iff_argument_display(dev0, 1331, 7), plt_iff_argument_display(dev0, 1332, 3))
end, 2, PILOT_IFF_PANEL, "M1 Code")

F_4E:defineString("PLT_IFF_M3_CODE", function(dev0)
	return string.format("%d%d%d%d", plt_iff_argument_display(dev0, 1333, 7), plt_iff_argument_display(dev0, 1334, 7), plt_iff_argument_display(dev0, 1335, 7), plt_iff_argument_display(dev0, 1336, 7))
end, 4, PILOT_IFF_PANEL, "M3 Code")

F_4E:define3PosTumb("PLT_IFF_IDENT", IFF_DEVICE_ID, 3060, 1330, PILOT_IFF_PANEL, "Set Position Identification")

-- Countermeasures
local COUNTERMEASURES_DEVICE_ID = 5

-- pilot countermeasures panel
local PILOT_COUNTERMEASURES_PANEL = "PLT Countermeasures Panel"

F_4E:defineMultipositionRollerLimited("PLT_CM_CHAFF_BURST_COUNT", COUNTERMEASURES_DEVICE_ID, 3014, 1500, 6, PILOT_COUNTERMEASURES_PANEL, "Select Chaff Burst Count")
F_4E:defineMultipositionRollerLimited("PLT_CM_CHAFF_BURST_INTERVAL", COUNTERMEASURES_DEVICE_ID, 3015, 1501, 4, PILOT_COUNTERMEASURES_PANEL, "Select Chaff Burst Interval")
F_4E:defineMultipositionRollerLimited("PLT_CM_CHAFF_SALVO_COUNT", COUNTERMEASURES_DEVICE_ID, 3016, 1502, 5, PILOT_COUNTERMEASURES_PANEL, "Select Chaff Salvo Count")
F_4E:defineMultipositionRollerLimited("PLT_CM_CHAFF_SALVO_INTERVAL", COUNTERMEASURES_DEVICE_ID, 3017, 1503, 7, PILOT_COUNTERMEASURES_PANEL, "Select Chaff Salvo Interval")
F_4E:defineMultipositionRollerLimited("PLT_CM_FLARE_BURST_COUNT", COUNTERMEASURES_DEVICE_ID, 3018, 1504, 5, PILOT_COUNTERMEASURES_PANEL, "Select Flare Burst Count")
F_4E:defineMultipositionRollerLimited("PLT_CM_FLARE_BURST_INTERVAL", COUNTERMEASURES_DEVICE_ID, 3019, 1505, 5, PILOT_COUNTERMEASURES_PANEL, "Select Flare Burst Interval")
F_4E:definePushButton("PLT_CM_ON_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3002, 1437, PILOT_COUNTERMEASURES_PANEL, "CMS Indicator (push to test)")
F_4E:definePotentiometer("PLT_CM_ON_DIM", COUNTERMEASURES_DEVICE_ID, 3003, 1438, { 0, 1 }, PILOT_COUNTERMEASURES_PANEL, "CMS Indicator (rotate to dim)")
F_4E:defineIndicatorLight("PLT_CM_ON_LIGHT", 1414, PILOT_COUNTERMEASURES_PANEL, "ALE-40 On Lamp (Green)")
F_4E:definePushButton("PLT_CM_FLARE_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3004, 1439, PILOT_COUNTERMEASURES_PANEL, "Flare Indicator (push to test)")
F_4E:definePotentiometer("PLT_CM_FLARE_DIM", COUNTERMEASURES_DEVICE_ID, 3005, 1440, { 0, 1 }, PILOT_COUNTERMEASURES_PANEL, "Flare Indicator (rotate to dim)")
F_4E:defineIndicatorLight("PLT_CM_FLARE_LIGHT", 1415, PILOT_COUNTERMEASURES_PANEL, "ALE-40 Flares Lamp (Red)")
F_4E:defineToggleSwitch("PLT_CM_FLARE_NORMAL", COUNTERMEASURES_DEVICE_ID, 3001, 1417, PILOT_COUNTERMEASURES_PANEL, "Select Dispense Program")

-- wso countermeasures panel
local WSO_COUNTERMEASURES_PANEL = "WSO Countermeasures Panel"

F_4E:definePushButton("WSO_CM_DISPENSE", COUNTERMEASURES_DEVICE_ID, 3013, 1447, WSO_COUNTERMEASURES_PANEL, "Dispense Countermeasures")
F_4E:defineToggleSwitch("WSO_CM_RIPPLE_COVER", COUNTERMEASURES_DEVICE_ID, 3010, 1446, WSO_COUNTERMEASURES_PANEL, "Ripple Switch Cover")
F_4E:defineToggleSwitch("WSO_CM_RIPPLE", COUNTERMEASURES_DEVICE_ID, 3011, 1445, WSO_COUNTERMEASURES_PANEL, "Toggle Ripple Release")
F_4E:definePushButton("WSO_CM_CHAFF_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3006, 1450, WSO_COUNTERMEASURES_PANEL, "Chaff Indicator (push to test)")
F_4E:definePotentiometer("WSO_CM_CHAFF_DIM", COUNTERMEASURES_DEVICE_ID, 3007, 1448, { 0, 1 }, WSO_COUNTERMEASURES_PANEL, "Chaff Indicator (rotate to dim)")
F_4E:defineIndicatorLight("WSO_CM_CHAFF_LIGHT", 1441, WSO_COUNTERMEASURES_PANEL, "Chaff Lamp (Green)")
F_4E:defineMultipositionRollerLimited("WSO_CM_CHAFF_MODE", COUNTERMEASURES_DEVICE_ID, 3020, 1444, 4, WSO_COUNTERMEASURES_PANEL, "Select Chaff Mode")
F_4E:definePushButton("WSO_CM_FLARE_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3008, 1451, WSO_COUNTERMEASURES_PANEL, "Flare Indicator (push to test)")
F_4E:definePotentiometer("WSO_CM_FLARE_DIM", COUNTERMEASURES_DEVICE_ID, 3009, 1449, { 0, 1 }, WSO_COUNTERMEASURES_PANEL, "Flare Indicator (rotate to dim)")
F_4E:defineIndicatorLight("WSO_CM_FLARE_LIGHT", 1442, WSO_COUNTERMEASURES_PANEL, "Flare Lamp (Red)")
F_4E:defineMultipositionRollerLimited("WSO_CM_FLARE_MODE", COUNTERMEASURES_DEVICE_ID, 3021, 1443, 3, WSO_COUNTERMEASURES_PANEL, "Select Flare Mode")

local function wso_cm_display(dev0, arg_number)
	return Module.round(dev0:get_argument_value(arg_number) * 10) % 10
end

local wso_cm_chaff_hundreds = 0
local wso_cm_chaff_tens = 0
local wso_cm_chaff_ones = 0
local wso_cm_chaff = ""

F_4E:addExportHook(function(dev0)
	wso_cm_chaff_hundreds = Module.round(wso_cm_display(dev0, 1390))
	wso_cm_chaff_tens = Module.round(wso_cm_display(dev0, 1391))
	wso_cm_chaff_ones = Module.round(wso_cm_display(dev0, 1392))
	wso_cm_chaff = string.format("%d%d%d", wso_cm_chaff_hundreds, wso_cm_chaff_tens, wso_cm_chaff_ones)
end)

local wso_cm_flare_hundreds = 0
local wso_cm_flare_tens = 0
local wso_cm_flare_ones = 0
local wso_cm_flare = ""

F_4E:addExportHook(function(dev0)
	wso_cm_flare_hundreds = Module.round(wso_cm_display(dev0, 1393))
	wso_cm_flare_tens = Module.round(wso_cm_display(dev0, 1394))
	wso_cm_flare_ones = Module.round(wso_cm_display(dev0, 1395))
	wso_cm_flare = string.format("%d%d%d", wso_cm_flare_hundreds, wso_cm_flare_tens, wso_cm_flare_ones)
end)

F_4E:defineIntegerFromGetter("WSO_CM_CHAFF_HUNDREDS", function()
	return wso_cm_chaff_hundreds
end, 9, WSO_COUNTERMEASURES_PANEL, "Chaff Counter (hundreds)")
F_4E:defineIntegerFromGetter("WSO_CM_CHAFF_TENS", function()
	return wso_cm_chaff_tens
end, 9, WSO_COUNTERMEASURES_PANEL, "Chaff Counter (tens)")
F_4E:defineIntegerFromGetter("WSO_CM_CHAFF_ONES", function()
	return wso_cm_chaff_ones
end, 9, WSO_COUNTERMEASURES_PANEL, "Chaff Counter (ones)")
F_4E:defineString("WSO_CM_CHAFF", function()
	return wso_cm_chaff
end, 3, WSO_COUNTERMEASURES_PANEL, "Chaff Counter")

F_4E:defineIntegerFromGetter("WSO_CM_FLARE_HUNDREDS", function()
	return wso_cm_flare_hundreds
end, 9, WSO_COUNTERMEASURES_PANEL, "Flare Counter (hundreds)")
F_4E:defineIntegerFromGetter("WSO_CM_FLARE_TENS", function()
	return wso_cm_flare_tens
end, 9, WSO_COUNTERMEASURES_PANEL, "Flare Counter (tens)")
F_4E:defineIntegerFromGetter("WSO_CM_FLARE_ONES", function()
	return wso_cm_flare_ones
end, 9, WSO_COUNTERMEASURES_PANEL, "Flare Counter (ones)")
F_4E:defineString("WSO_CM_FLARE", function()
	return wso_cm_flare
end, 3, WSO_COUNTERMEASURES_PANEL, "Flare Counter")

-- cockpit
local COCKPIT_DEVICE_ID = 7

-- AFCS
local AFCS_DEVICE_ID = 9

-- Magnetic Compass
local MAGNETIC_COMPASS_DEVICE_ID = 10

-- Clock
local CLOCK_DEVICE_ID = 11

-- Radar Altimeter
local RADAR_ALTIMETER_DEVICE_ID = 12

-- AOA System
local AOA_DEVICE_ID = 13

-- INS (AN-ASN-63)
local INS_DEVICE_ID = 14

-- Navigation (AN-ASN-46A)
local NAVIGATION_DEVICE_ID = 16

-- Pneumatic Gauge
local PNEUMATIC_GAUGE_DEVICE_ID = 17

-- Hydraulic Gauge
local HYDRAULIC_GAUGE_DEVICE_ID = 18

-- Landing Gear
local LANDING_GEAR_DEVICE_ID = 20

-- Indicators
local INDICATORS_DEVICE_ID = 22

-- Canopy
local CANOPY_DEVICE_ID = 23

-- Engine
local ENGINE_DEVICE_ID = 24

-- Control Surfaces
local CONTROL_SURFACES_DEVICE_ID = 25

-- Oxygen System
local OXYGEN_SYSTEM_DEVICE_ID = 26

-- Weapons
local WEAPONS_DEVICE_ID = 27

-- pilot weapons panel
local PILOT_WEAPONS_PANEL = "PLT Weapons Panel"

F_4E:defineToggleSwitch("PLT_MASTER_ARM_SW", WEAPONS_DEVICE_ID, 3003, 247, PILOT_WEAPONS_PANEL, "PILOT Master Arm switch")

-- Turn/Slip Indicators
local TURN_SLIP_DEVICE_ID = 29

-- HUD (AN-ASG-26)
local HUD_DEVICE_ID = 31

-- Accelerometer
local ACCELEROMETER_DEVICE_ID = 35

-- Pitot/Static System
local PITOT_STATIC_DEVICE_ID = 36

-- CADC
local CADC_DEVICE_ID = 38

-- Speed Indicator
local SPEED_DEVICE_ID = 39

-- Barometric Altimeter
local BARO_ALTIMETER_DEVICE_ID = 40

-- Vertical Velocity Indicator
local VVI_DEVICE_ID = 41

-- TAS Indicator
local TAS_DEVICE_ID = 42

-- ADI (ARU-11-A)
local ADI_DEVICE_ID = 44

-- CNI (AN-ASQ-19A)
local CNI_DEVICE_ID = 45

-- Ground Speed Indicator
local GS_DEVICE_ID = 46

-- Emergency Attitude Indicator
local EMERGENCY_ATTITUDE_DEVICE_ID = 47

-- TACAN (AN-ARN-118)
local TACAN_DEVICE_ID = 48

-- Flight Director Computer
local FLIGHT_DIRECTOR_DEVICE_ID = 49

-- HSI (AF-A24J-1)
local HSI_DEVICE_ID = 50

-- Radar
local RADAR_DEVICE_ID = 52

-- BDHI
local BDHI_DEVICE_ID = 53

-- Compass System
local COMPASS_DEVICE_ID = 54

-- Electric System
local ELECTRICS_DEVICE_ID = 55

-- Attitude Indicator (ARU-13A)
local ATTITUDE_INDICATOR_DEVICE_ID = 56

-- Fuel
local FUEL_DEVICE_ID = 60

-- pilot fuel panel
local PILOT_FUEL_PANEL = "PLT Fuel Panel"

F_4E:defineToggleSwitch("PLT_FUEL_WING_INTERNAL_FEED", FUEL_DEVICE_ID, 3004, 710, PILOT_FUEL_PANEL, "Internal Wing Tanks Feed")
F_4E:defineToggleSwitch("PLT_FUEL_REFUEL_SELECTOR_COVER", FUEL_DEVICE_ID, 3001, 705, PILOT_FUEL_PANEL, "Refuel Tank Selector Cover")
F_4E:defineToggleSwitch("PLT_FUEL_REFUEL_SELECTOR", FUEL_DEVICE_ID, 3002, 706, PILOT_FUEL_PANEL, "Select Tank to Refuel")
F_4E:defineToggleSwitch("PLT_FUEL_AIR_REFUEL", FUEL_DEVICE_ID, 3006, 712, PILOT_FUEL_PANEL, "Air Refuel Switch")
F_4E:defineToggleSwitch("PLT_FUEL_WING_FUEL_DUMP", FUEL_DEVICE_ID, 3003, 709, PILOT_FUEL_PANEL, "Wing Fuel Dump Selector")
F_4E:define3PosTumb("PLT_FUEL_EXTERNAL_TANKS_FEED", FUEL_DEVICE_ID, 3005, 711, PILOT_FUEL_PANEL, "External Tanks Feed")
F_4E:definePushButton("PLT_FUEL_BOOST_PUMP_L_CHECK", FUEL_DEVICE_ID, 3021, 725, PILOT_FUEL_PANEL, "Check Left Boost Pump")
F_4E:definePushButton("PLT_FUEL_BOOST_PUMP_R_CHECK", FUEL_DEVICE_ID, 3022, 726, PILOT_FUEL_PANEL, "Check Right Boost Pump")
F_4E:definePushButton("PLT_FUEL_FEED_TANK_CHECK", FUEL_DEVICE_ID, 3013, 2789, PILOT_FUEL_PANEL, "Check Engine-Feed Tank")

-- Attitude Reference
local ATTITUDE_REFERENCE_DEVICE_ID = 62

-- Aircraft Effects
local AIRCRAFT_EFFECTS_DEVICE_ID = 63

-- Target Designator System (AN-ASQ-153)
local TARGET_DESIGNATOR_DEVICE_ID = 64

-- WSO Front Panel
local WSO_FRONT_PANEL_DEVICE_ID = 65

-- RHAW
local RHAW_DEVICE_ID = 67

-- IFF Interrogator (AN-APX-80A)
local IFF_INTERROGATOR_DEVICE_ID = 68

-- wso iff panel
local WSO_IFF_PANEL = "WSO IFF Panel"

local iff_ones = 0
local iff_tens = 0
local iff_hundreds = 0
local iff_thousands = 0
local iff_code = ""

local function wso_iff_argument_display(dev0, arg_number)
	return Module.round(dev0:get_argument_value(arg_number) * 8) % 8
end

-- WSO IFF display
F_4E:addExportHook(function(dev0)
	iff_ones = wso_iff_argument_display(dev0, 2000)
	iff_tens = wso_iff_argument_display(dev0, 2001)
	iff_hundreds = wso_iff_argument_display(dev0, 2002)
	iff_thousands = wso_iff_argument_display(dev0, 2003)
	iff_code = string.format("%d%d%d%d", iff_thousands, iff_hundreds, iff_tens, iff_ones)
end)

--- @param dev0 CockpitDevice
--- @return string
local function get_iff_mode(dev0)
	local val = Module.round(dev0:get_argument_value(2004) * 5)
	if val == 1 then
		return " 1 "
	elseif val == 2 then
		return " 2 "
	elseif val == 3 then
		return " 3 "
	elseif val == 4 then
		return "4/A"
	elseif val == 5 then
		return "4/B"
	end

	return ""
end

F_4E:defineIntegerFromGetter("WSO_IFF_CODE_ONES", function()
	return iff_ones
end, 8, WSO_IFF_PANEL, "IFF Code (ones)")
F_4E:defineIntegerFromGetter("WSO_IFF_CODE_TENS", function()
	return iff_tens
end, 8, WSO_IFF_PANEL, "IFF Code (tens)")
F_4E:defineIntegerFromGetter("WSO_IFF_CODE_HUNDREDS", function()
	return iff_hundreds
end, 8, WSO_IFF_PANEL, "IFF Code (hundreds)")
F_4E:defineIntegerFromGetter("WSO_IFF_CODE_THOUSANDS", function()
	return iff_thousands
end, 8, WSO_IFF_PANEL, "IFF Code (thousands)")
F_4E:defineString("WSO_IFF_CODE", function()
	return iff_code
end, 4, WSO_IFF_PANEL, "IFF Code")
F_4E:defineString("WSO_IFF_MODE", get_iff_mode, 3, WSO_IFF_PANEL, "IFF Mode")

-- todo: string output
F_4E:definePushButton("WSO_IFF_MODE_INC", IFF_INTERROGATOR_DEVICE_ID, 3001, 2637, WSO_IFF_PANEL, "Increase IFF Mode")
F_4E:definePushButton("WSO_IFF_CODE_INC_THOUSANDS", IFF_INTERROGATOR_DEVICE_ID, 3002, 2635, WSO_IFF_PANEL, "Increase IFF Code (thousands)")
F_4E:definePushButton("WSO_IFF_CODE_INC_HUNDREDS", IFF_INTERROGATOR_DEVICE_ID, 3003, 2633, WSO_IFF_PANEL, "Increase IFF Code (hundreds)")
F_4E:definePushButton("WSO_IFF_CODE_INC_TENS", IFF_INTERROGATOR_DEVICE_ID, 3004, 2631, WSO_IFF_PANEL, "Increase IFF Code (tens)")
F_4E:definePushButton("WSO_IFF_CODE_INC_ONES", IFF_INTERROGATOR_DEVICE_ID, 3005, 2629, WSO_IFF_PANEL, "Increase IFF Code (ones)")
F_4E:definePushButton("WSO_IFF_MODE_DEC", IFF_INTERROGATOR_DEVICE_ID, 3006, 2638, WSO_IFF_PANEL, "Decrease IFF Mode")
F_4E:definePushButton("WSO_IFF_MODE_DEC_THOUSANDS", IFF_INTERROGATOR_DEVICE_ID, 3007, 2636, WSO_IFF_PANEL, "Decrease IFF Code (thousands)")
F_4E:definePushButton("WSO_IFF_MODE_DEC_HUNDREDS", IFF_INTERROGATOR_DEVICE_ID, 3008, 2634, WSO_IFF_PANEL, "Decrease IFF Code (hundreds)")
F_4E:definePushButton("WSO_IFF_MODE_DEC_TENS", IFF_INTERROGATOR_DEVICE_ID, 3009, 2632, WSO_IFF_PANEL, "Decrease IFF Code (tens)")
F_4E:definePushButton("WSO_IFF_MODE_DEC_ONES", IFF_INTERROGATOR_DEVICE_ID, 3010, 2630, WSO_IFF_PANEL, "Decrease IFF Code (ones)")

-- todo: output good, input bad (button + potentiometer). commands seem correct, unclear what is wrong
F_4E:definePushButton("WSO_IFF_CHALLENGE_TEST_BUTTON", IFF_DEVICE_ID, 3015, 2646, WSO_IFF_PANEL, "Challenge Light (push to test)")
F_4E:definePotentiometer("WSO_IFF_CHALLENGE_DIM", IFF_DEVICE_ID, 3016, 2811, { 0, 1 }, WSO_IFF_PANEL, "Challenge Light (rotate to dim)")
F_4E:defineIndicatorLight("WSO_IFF_CHALLENGE_LIGHT", 2695, WSO_IFF_PANEL, "IFF Challenge Light (Blue)")

F_4E:defineSpringloaded_3PosTumb("WSO_IFF_TEST_CHALLENGE", IFF_INTERROGATOR_DEVICE_ID, 3013, 3013, 2645, WSO_IFF_PANEL, "Test/Challenge Code Switch")

F_4E:reserveIntValue(1) -- Anti-Jam, not yet implemented

-- todo: output good, input bad (button + potentiometer). commands seem correct, unclear what is wrong
F_4E:definePushButton("WSO_IFF_COMBAT_TREE_CHALLENGE_TEST_BUTTON", IFF_DEVICE_ID, 3018, 2640, WSO_IFF_PANEL, "Combat-Tree Challenge Light (push to test) (not simulated)")
F_4E:definePotentiometer("WSO_IFF_COMBAT_TREE_CHALLENGE_DIM", IFF_DEVICE_ID, 3019, 2812, { 0, 1 }, WSO_IFF_PANEL, "Combat-Tree Challenge Light (rotate to dim) (not simulated)")
F_4E:defineIndicatorLight("WSO_IFF_COMBAT_TREE_CHALLENGE_TEST_LIGHT", 2696, WSO_IFF_PANEL, "Combat-Tree Challenge Light (Blue)")

F_4E:definePushButton("WSO_IFF_COMBAT_TREE_TEST", IFF_INTERROGATOR_DEVICE_ID, 3021, 2641, WSO_IFF_PANEL, "Test Combat-Tree")
F_4E:define3PosTumb("WSO_IFF_COMBAT_TREE_MODE_2", IFF_INTERROGATOR_DEVICE_ID, 3022, 2642, WSO_IFF_PANEL, "Set Combat-Tree Type 2 Mode")
F_4E:define3PosTumb("WSO_IFF_COMBAT_TREE_MODE_3", IFF_INTERROGATOR_DEVICE_ID, 3025, 2643, WSO_IFF_PANEL, "Set Combat-Tree Type 3 Mode")

F_4E:reserveIntValue(2) -- Mode 4 Alarm/Override, not yet implemented

-- Exterior Lights
local EXTERIOR_LIGHTS_DEVICE_ID = 69

-- VOR/ILS
local VOR_ILS_DEVICE_ID = 70

-- Ejection Seat
local EJECTION_SEAT_DEVICE_ID = 71

-- Interior Lights
local INTERIOR_LIGHTS_DEVICE_ID = 72

-- Airborne Video Tape Recorder
local RECORDER_DEVICE_ID = 73

-- Pilot Front Panel
local PILOT_FRONT_PANEL_DEVICE_ID = 74

-- WSO Course Indicator
local WSO_COURSE_INDICATOR_DEVICE_ID = 76

-- Jester Wheel
local JESTER_WHEEL_DEVICE_ID = 78

-- Grease Pencil
local GREASE_PENCIL_DEVICE_ID = 82

-- Circuit Breakers
local CIRCUIT_BREAKERS_DEVICE_ID = 84

-- Seat
local SEAT_DEVICE_ID = 85

-- ECM
local ECM_DEVICE_ID = 91

-- Pilot Throttle
local PILOT_THROTTLE = "PLT Throttle"

F_4E:definePushButton("PLT_THROTTLE_CM_DISPENSE", COUNTERMEASURES_DEVICE_ID, 3012, 1436, PILOT_THROTTLE, "Dispense Countermeasures")

return F_4E
