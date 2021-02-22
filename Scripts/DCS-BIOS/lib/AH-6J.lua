BIOS.protocol.beginModule("AH-6J", 0x6200)
BIOS.protocol.setExportModuleAircrafts({"AH-6", "BlackHawk"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local define3PosTumb = BIOS.util.define3PosTumb
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--Electric System
define3PosTumb("PW_SEL_SW", 11, 3013, 17, "Electric System", "Power Selector Switch, BATT/OFF/EXT")
defineToggleSwitch("GEN_SWITCH", 11, 3014, 16, "Electric System", "Generator Switch, ON/OFF")
defineToggleSwitch("INV_SWITCH", 11, 3015, 15, "Electric System", "Inverter Switch, ON/OFF")

--Fuel System
--Engines
defineToggleSwitch("THROTTLE_CUTOFF", 11, 3011, 5, "Engines", "Throttle Cutoff")

--Weapons Panel
defineToggleSwitch("MASTER_ARM_SW", 2, 3204, 43, "Weapons Panel", "Master Arm Switch, ARM/SAFE")
defineToggleSwitch("ROCKET_MODE_SW", 2, 3205, 44, "Weapons Panel", "Rocket Single/Ripple Mode Switch, SINGLE/RIPPLE")
defineToggleSwitch("PYLON_JETT_SW", 2, 3206, 45, "Weapons Panel", "Pylon Jettison Switch, SAFE/JETTISON")
defineToggleSwitch("PYLON_JETT_COVER", 2, 3207, 46, "Weapons Panel", "Pylon Jettison Switch Cover")
defineMultipositionSwitch("ROCKET_STATION_SEL", 2, 3208, 47, 4, 0.33, "Weapons Panel" ,"Rocket Station Selector, OFF/LEFT/BOTH/RIGHT")
defineMultipositionSwitch("GUN_STATION_SEL", 2, 3209, 48, 4, 0.33, "Weapons Panel" ,"Gun Station Selector, OFF/LEFT/BOTH/RIGHT")

--RWR
defineToggleSwitch("RWR_PW_SW", 3, 3214, 25, "RWR", "RWR Power Switch, OFF/ON")
definePotentiometer("RWR_DISP_BRIGHT", 3, 3215, 30, {0.0, 1.0}, "RWR", "RWR Display Brightness Knob")

--External Lights
defineToggleSwitch("POS_L_SW", 4, 3210, 11, "External Lights", "Position Light Switch")
defineToggleSwitch("LAND_L_SW", 4, 3213, 26, "External Lights", "Landing Light Switch, ON/OFF")

--Avionics
defineRotary("ALT_SET_KNB", 8, 3216, 28, "Avionics", "Altimeter Setting Knob")
definePotentiometer("ADI_ADJ_KNB", 8, 3217, 29, {-1, 1}, "Avionics", "ADI Adjustment Knob")
definePotentiometer("ALT_LO_FLAG_KNB", 8, 3218, 31, {0, 1}, "Avionics", "Altimeter LO Flag Setting Knob")
definePotentiometer("ALT_HI_FLAG_KNB", 8, 3219, 32, {0, 1}, "Avionics", "Altimeter HI Flag Setting Knob")

--Gauges
defineFloat("IAS_NEEDLE", 100, {0, 1}, "Gauges", "IAS Needle")
defineFloat("ALT_NEEDLE", 101, {0, 1}, "Gauges", "Altimeter Needle")
defineFloat("RADAR_ALT_NEEDLE", 102, {0, 1}, "Gauges", "Radar Altimeter Needle")
defineFloat("RADAR_ALT_OFF", 117, {0, 1}, "Gauges", "Radar Altimeter OFF Flag")
defineFloat("VV_NEEDLE", 103, {-1, 1}, "Gauges", "Vertical Velocity Needle")
defineFloat("ADI_PITCH", 104, {-1, 1}, "Gauges", "ADI Pitch")
defineFloat("ADI_BANK", 105, {-1, 1}, "Gauges", "ADI Bank")
defineFloat("ADI_SLIP", 123, {-1, 1}, "Gauges", "ADI Slip")
defineFloat("COMPASS", 106, {0, 1}, "Gauges", "Compass")
defineFloat("DRUM_ALT_1K", 108, {0, 1}, "Gauges", "Altimeter Drum 1000ft")
defineFloat("DRUM_ALT_10K", 107, {0, 1}, "Gauges", "Altimeter Drum 10000ft")
defineFloat("DRUM_ALT_ADJ_HG1", 109, {0, 1}, "Gauges", "Altimeter inHG Drum 1")
defineFloat("DRUM_ALT_ADJ_HG2", 110, {0, 1}, "Gauges", "Altimeter inHG Drum 2")
defineFloat("DRUM_ALT_ADJ_HG3", 111, {0, 1}, "Gauges", "Altimeter inHG Drum 3")
defineFloat("DRUM_ALT_ADJ_HG4", 112, {0, 1}, "Gauges", "Altimeter inHG Drum 4")
defineFloat("DRUM_ALT_ADJ_MB1", 113, {0, 1}, "Gauges", "Altimeter MB Drum 1")
defineFloat("DRUM_ALT_ADJ_MB2", 114, {0, 1}, "Gauges", "Altimeter MB Drum 2")
defineFloat("DRUM_ALT_ADJ_MB3", 115, {0, 1}, "Gauges", "Altimeter MB Drum 3")
defineFloat("DRUM_ALT_ADJ_MB4", 116, {0, 1}, "Gauges", "Altimeter MB Drum 4")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (red,Green)")
defineIntegerFromGetter("EXT_LAND_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Light (white)")


BIOS.protocol.endModule()