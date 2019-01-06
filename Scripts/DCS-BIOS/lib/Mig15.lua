BIOS.protocol.beginModule("MiG-15Bis", 0x2400)
BIOS.protocol.setExportModuleAircrafts({"MiG-15Bis"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineFixedStepInput = BIOS.util.defineFixedStepInput
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch


-- Cockpit mechanics
defineToggleSwitch("EMERG_CANOPY_JETT", 15, 3006, 221, "Cockpit Mech", "Emergency Canopy Jettison")
defineToggleSwitch("L_CANOPY_LEVER", 15, 3003, 223, "Cockpit Mech", "Left Canopy Lever")
defineToggleSwitch("R_CANOPY_LEVER", 15, 3004, 222, "Cockpit Mech", "Right Canopy Lever")
defineToggleSwitch("AFT_CANOPY_LEVER", 15, 3005, 224, "Cockpit Mech", "Aft Canopy Lever")

-- Control system
definePushButton("AIRBRAKE", 3, 3004, 198, "Control System", "Airbrake Button")

-- Electric system
definePushButton("V_A_METER", 2, 3007, 84, "Electric System", "Ampere- & Voltmeter")
defineToggleSwitch("AIR_START", 2, 3005, 149, "Electric System", "Air Start Switch")
defineToggleSwitch("PITOT_CLOCK_HEATER", 2, 3011, 81, "Electric System", "Pitot and Clock Heater Switch")
definePushButton("ENGINE_START", 2, 3003, 200, "Electric System", "Engine Start Button")
defineToggleSwitch("ENGINE_START_COVER", 2, 3004, 214, "Electric System", "Engine Start Button Cover")

-- Circuit Breakers
defineToggleSwitch("TRANSFER_PUMP", 2, 3017, 117, "Circuit Breakers", "Transfer Pump Switch")
defineToggleSwitch("BOOSTER_PUMP", 2, 3018, 115, "Circuit Breakers", "Booster Pump Switch")
defineToggleSwitch("IGNITION", 2, 3019, 120, "Circuit Breakers", "Ignition Switch")
defineToggleSwitch("INSTR_LIGHTS", 2, 3022, 116, "Circuit Breakers", "Instruments and Lights Switch")

-- Right Panel
defineToggleSwitch("BATTERY", 2, 3001, 152, "Right Panel", "Accumulator Switch")
defineToggleSwitch("GENERATOR", 2, 3002, 153, "Right Panel", "Generator Switch")
defineToggleSwitch("NOSE_LIGHT_MASTER", 2, 3013, 151, "Right Panel", "Nose Light Master Switch")
defineToggleSwitch("TRIM", 2, 3012, 154, "Right Panel", "Trim Master Switch")
defineToggleSwitch("AGK_DGMK", 2, 3006, 155, "Right Panel", "AGK-47B Artificial Horizon + DGMK-3 Switch")
defineToggleSwitch("RADIO", 2, 3014, 158, "Right Panel", "Radio Switch")
defineToggleSwitch("BOMBS", 2, 3010, 157, "Right Panel", "Bombs Switch")
defineToggleSwitch("EMERG_DROP", 2, 3021, 156, "Right Panel", "Emergency Drop Switch")
defineToggleSwitch("ARC", 2, 3015, 159, "Right Panel", "ARC Switch")
defineToggleSwitch("RV_RADIO_ALT", 2, 3016, 160, "Right Panel", "RV-2 Radio Altimeter Switch")
defineToggleSwitch("NR23_CANNON", 2, 3008, 161, "Right Panel", "NR-23 Cannon Switch")
defineToggleSwitch("N37D_CANNON", 2, 3009, 162, "Right Panel", "N-37D Cannon Switch")
defineToggleSwitch("GUN_SIGHT", 2, 3020, 163, "Right Panel", "ASP-3N Gunsight Switch")
defineToggleSwitch("GUN_CAM", 2, 3023, 164, "Right Panel", "S-13 Gun Camera Switch")

-- HydroSystem
-- Gear System
defineToggleSwitch("LANDING_GEAR", 13, 3001, 71, "Gear System", "Landing Gear Handle")
definePushButton("GEAR_LAMP_TEST", 13, 3003, 72, "Gear System", "Gear Lamps Test Button")
definePushButton("R_EMERG_GEAR", 13, 3005, 210, "Gear System", "Right Emergency Gear Release Handle")
definePushButton("L_EMERG_GEAR", 13, 3004, 209, "Gear System", "Left Emergency Gear Release Handle")
defineToggleSwitch("LANDING_GEAR_COVER", 13, 3002, 85, "Gear System", "Landing Gear Handle Lock")

-- Fuel System
defineToggleSwitch("DROP_TANK_SIGNAL", 10, 3001, 82, "Fuel System", "Drop Tank Signal Switch")

-- Oxygen System
-- Conditioning and Heating System
-- Internal Lights System

-- Nav Lights System
defineToggleSwitch("EXT_LIGHTS", 14, 3001, 111, "Nav Lights System", "External Lights Switch")
defineToggleSwitch("NOSE_LIGHT", 14, 3002, 80, "Nav Lights System", "Nose Light Switch")

-- Power Plant
-- Fire Extinguisher System
-- Signal Flares


	-- Devices
-- AGK-47B
-- VD-15
-- PRV-46
-- PDK-45
-- CLOCK 
-- Weapon System
-- Stick buttons
-- ASP-3N Gunsight
-- ARC-5 radio compass
-- RSI-6K radio

BIOS.protocol.endModule()
