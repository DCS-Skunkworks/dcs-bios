BIOS.protocol.beginModule("AH-6J", 0x6200)
BIOS.protocol.setExportModuleAircrafts({"AH-6"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local define3PosTumb = BIOS.util.define3PosTumb
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineString = BIOS.util.defineString
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--Electric System
define3PosTumb("PW_SEL_SW", 11, 3003, 17, "Electric System", "Power Selector Switch, BATT/OFF/EXT")
defineToggleSwitch("GEN_SWITCH", 11, 3004, 16, "Electric System", "Generator Switch, ON/OFF")
defineToggleSwitch("INV_SWITCH", 11, 3005, 15, "Electric System", "Inverter Switch, ON/OFF")

--Fuel System
--Engines
defineToggleSwitch("THROTTLE_CUTOFF", 11, 3001, 5, "Engines", "Throttle Cutoff")

--Weapons Panel
defineToggleSwitch("MASTER_ARM_SW", 2, 3203, 43, "Weapons Panel", "Master Arm Switch, ARM/SAFE")
defineToggleSwitch("ROCKET_MODE_SW", 2, 3204, 44, "Weapons Panel", "Rocket Single/Ripple Mode Switch, SINGLE/RIPPLE")
defineToggleSwitch("PYLON_JETT_SW", 2, 3205, 45, "Weapons Panel", "Pylon Jettison Switch, SAFE/JETTISON")
defineToggleSwitch("PYLON_JETT_COVER", 2, 3206, 46, "Weapons Panel", "Pylon Jettison Switch Cover")
defineMultipositionSwitch("ROCKET_STATION_SEL", 2, 3207, 47, 4, 0.33, "Weapons Panel" ,"Rocket Station Selector, OFF/LEFT/BOTH/RIGHT")
defineMultipositionSwitch("GUN_STATION_SEL", 2, 3208, 48, 4, 0.33, "Weapons Panel" ,"Gun Station Selector, OFF/LEFT/BOTH/RIGHT")

--RWR
defineToggleSwitch("RWR_PW_SW", 3, 3213, 25, "RWR", "RWR Power Switch, OFF/ON")
definePotentiometer("RWR_DISP_BRIGHT", 3, 3214, 30, {0.0, 1.0}, "RWR", "RWR Display Brightness Knob")

--External Lights
defineToggleSwitch("POS_L_SW", 4, 3209, 11, "External Lights", "Position Light Switch")
defineToggleSwitch("LAND_L_SW", 4, 3212, 26, "External Lights", "Landing Light Switch, ON/OFF")

--Avionics


--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (red,Green)")
defineIntegerFromGetter("EXT_LAND_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Light (white)")


BIOS.protocol.endModule()