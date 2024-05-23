module("F-4E", package.seeall)

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
F_4E:definePushButton("PLT_IFF_TEST_BUTTON", IFF_DEVICE_ID, 3066, 2845, PILOT_IFF_PANEL, "IFF Test Lamp (push to test)")
F_4E:definePotentiometer("PLT_IFF_TEST_DIM", IFF_DEVICE_ID, 3067, 2844, { 0, 1 }, PILOT_IFF_PANEL, "IFF Test Lamp (rotate to dim)")
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
F_4E:define3PosTumb("PLT_IFF_IDENT", IFF_DEVICE_ID, 3060, 1330, PILOT_IFF_PANEL, "Set Position Identification")

-- Countermeasures
local COUNTERMEASURES_DEVICE_ID = 5

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

return F_4E
