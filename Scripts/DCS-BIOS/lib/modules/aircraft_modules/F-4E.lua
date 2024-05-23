module("F-4E", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_4E: Module
local F_4E = Module:new("F-4E", 0x2A00, { "F-4E-45MC" })

-- ICS
local ICS_DEVICE_ID = 2

-- ARC-164
local ARC_164_DEVICE_ID = 3

-- IFF
local IFF_DEVICE_ID = 4

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
