module("AH-6J", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class AH_6J: Module
local AH_6J = Module:new("AH-6J", 0x6200, { "AH-6", "BlackHawk" })

--by WarLord

--Electric System
AH_6J:define3PosTumb("PW_SEL_SW", 11, 3013, 17, "Electric System", "Power Selector Switch, BATT/OFF/EXT")
AH_6J:defineToggleSwitch("GEN_SWITCH", 11, 3014, 16, "Electric System", "Generator Switch, ON/OFF")
AH_6J:defineToggleSwitch("INV_SWITCH", 11, 3015, 15, "Electric System", "Inverter Switch, ON/OFF")

--Fuel System
--Engines
AH_6J:defineToggleSwitch("THROTTLE_CUTOFF", 11, 3011, 5, "Engines", "Throttle Cutoff")

--Weapons Panel
AH_6J:defineToggleSwitch("MASTER_ARM_SW", 2, 3204, 43, "Weapons Panel", "Master Arm Switch, ARM/SAFE")
AH_6J:defineToggleSwitch("ROCKET_MODE_SW", 2, 3205, 44, "Weapons Panel", "Rocket Single/Ripple Mode Switch, SINGLE/RIPPLE")
AH_6J:defineToggleSwitch("PYLON_JETT_SW", 2, 3206, 45, "Weapons Panel", "Pylon Jettison Switch, SAFE/JETTISON")
AH_6J:defineToggleSwitch("PYLON_JETT_COVER", 2, 3207, 46, "Weapons Panel", "Pylon Jettison Switch Cover")
AH_6J:defineMultipositionSwitch("ROCKET_STATION_SEL", 2, 3208, 47, 4, 0.33, "Weapons Panel", "Rocket Station Selector, OFF/LEFT/BOTH/RIGHT")
AH_6J:defineMultipositionSwitch("GUN_STATION_SEL", 2, 3209, 48, 4, 0.33, "Weapons Panel", "Gun Station Selector, OFF/LEFT/BOTH/RIGHT")

--RWR
AH_6J:defineToggleSwitch("RWR_PW_SW", 3, 3214, 25, "RWR", "RWR Power Switch, OFF/ON")
AH_6J:definePotentiometer("RWR_DISP_BRIGHT", 3, 3215, 30, { 0, 1 }, "RWR", "RWR Display Brightness Knob")

--External Lights
AH_6J:defineToggleSwitch("POS_L_SW", 4, 3210, 11, "External Lights", "Position Light Switch")
AH_6J:defineToggleSwitch("LAND_L_SW", 4, 3213, 26, "External Lights", "Landing Light Switch, ON/OFF")

--Avionics
AH_6J:defineRotary("ALT_SET_KNB", 8, 3216, 28, "Avionics", "Altimeter Setting Knob")
AH_6J:definePotentiometer("ADI_ADJ_KNB", 8, 3217, 29, { -1, 1 }, "Avionics", "ADI Adjustment Knob")
AH_6J:definePotentiometer("ALT_LO_FLAG_KNB", 8, 3218, 31, { 0, 1 }, "Avionics", "Altimeter LO Flag Setting Knob")
AH_6J:definePotentiometer("ALT_HI_FLAG_KNB", 8, 3219, 32, { 0, 1 }, "Avionics", "Altimeter HI Flag Setting Knob")

--Gauges
AH_6J:defineFloat("IAS_NEEDLE", 100, { 0, 1 }, "Gauges", "IAS Needle")
AH_6J:defineFloat("ALT_NEEDLE", 101, { 0, 1 }, "Gauges", "Altimeter Needle")
AH_6J:defineFloat("RADAR_ALT_NEEDLE", 102, { 0, 1 }, "Gauges", "Radar Altimeter Needle")
AH_6J:defineFloat("RADAR_ALT_OFF", 117, { 0, 1 }, "Gauges", "Radar Altimeter OFF Flag")
AH_6J:defineFloat("VV_NEEDLE", 103, { -1, 1 }, "Gauges", "Vertical Velocity Needle")
AH_6J:defineFloat("ADI_PITCH", 104, { -1, 1 }, "Gauges", "ADI Pitch")
AH_6J:defineFloat("ADI_BANK", 105, { -1, 1 }, "Gauges", "ADI Bank")
AH_6J:defineFloat("ADI_SLIP", 123, { -1, 1 }, "Gauges", "ADI Slip")
AH_6J:defineFloat("COMPASS", 106, { 0, 1 }, "Gauges", "Compass")
AH_6J:defineFloat("DRUM_ALT_1K", 108, { 0, 1 }, "Gauges", "Altimeter Drum 1000ft")
AH_6J:defineFloat("DRUM_ALT_10K", 107, { 0, 1 }, "Gauges", "Altimeter Drum 10000ft")
AH_6J:defineFloat("DRUM_ALT_ADJ_HG1", 109, { 0, 1 }, "Gauges", "Altimeter inHG Drum 1")
AH_6J:defineFloat("DRUM_ALT_ADJ_HG2", 110, { 0, 1 }, "Gauges", "Altimeter inHG Drum 2")
AH_6J:defineFloat("DRUM_ALT_ADJ_HG3", 111, { 0, 1 }, "Gauges", "Altimeter inHG Drum 3")
AH_6J:defineFloat("DRUM_ALT_ADJ_HG4", 112, { 0, 1 }, "Gauges", "Altimeter inHG Drum 4")
AH_6J:defineFloat("DRUM_ALT_ADJ_MB1", 113, { 0, 1 }, "Gauges", "Altimeter MB Drum 1")
AH_6J:defineFloat("DRUM_ALT_ADJ_MB2", 114, { 0, 1 }, "Gauges", "Altimeter MB Drum 2")
AH_6J:defineFloat("DRUM_ALT_ADJ_MB3", 115, { 0, 1 }, "Gauges", "Altimeter MB Drum 3")
AH_6J:defineFloat("DRUM_ALT_ADJ_MB4", 116, { 0, 1 }, "Gauges", "Altimeter MB Drum 4")

--Externals
AH_6J:defineBitFromDrawArgument("EXT_POSITION_LIGHTS", 190, "External Aircraft Model", "Position Lights (red,Green)")
AH_6J:defineBitFromDrawArgument("EXT_LAND_LIGHT", 208, "External Aircraft Model", "Landing Light (white)")
AH_6J:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR", 37, "External Aircraft Model", "Rotor Move")

return AH_6J
