BIOS.protocol.beginModule("MiG-15Bis", 0x2400)
BIOS.protocol.setExportModuleAircrafts({"MiG-15bis"})

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

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

-- Draw pilot = 540

-- Cockpit mechanics
defineToggleSwitch("EMERG_CANOPY_JETT", 15, 3006, 221, "Cockpit Mech", "Emergency Canopy Jettison")
defineToggleSwitch("L_CANOPY_LEVER", 15, 3003, 223, "Cockpit Mech", "Left Canopy Lever")
defineToggleSwitch("R_CANOPY_LEVER", 15, 3004, 222, "Cockpit Mech", "Right Canopy Lever")
defineToggleSwitch("AFT_CANOPY_LEVER", 15, 3005, 224, "Cockpit Mech", "Aft Canopy Lever")

-- Control system
define3PosTumb("ELEVATOR_TRIM", 3, 3002, 114, "Control System", "Elevator Trimmer Switch")
define3PosTumb("AILERON_TRIM", 3, 3001, 142, "Control System", "Aileron Trimmer Switch")
defineTumb("FLAPS_HANDLE", 3, 3003, 207, 0.5, {-1.0, 0.5}, nil, false, "Control System", "Wing Flaps Handle")
defineToggleSwitch("AIRBRAKE_SW", 3, 3005, 125, "Control System", "Airbrake Switch")
defineToggleSwitch("HYDRO_BOOST", 3, 3006, 203, "Control System", "Hydro Booster Lever")
defineTumb("THROTTLE_FRICTION", 3, 3008, 204, 0.5, {0.5, 1.0}, nil, false, "Control System", "Throttle Friction Lever")
definePushButton("AIRBRAKE_BT", 3, 3004, 198, "Control System", "Airbrake Button")

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

-- Hydro System
definePotentiometer("EMERG_FLAPS_VALVE", 12, 3001, 171, {0.0, 1.0}, "Hydro System", "Emergency Flaps Valve")
definePotentiometer("EMERG_GEARS_VALVE", 12, 3002, 167, {0.0, 1.0}, "Hydro System", "Emergency Gears Valve")
defineToggleSwitch("EMERG_FLAPS_VALVE_COVER", 12, 3003, 170, "Hydro System", "Emergency Flaps Valve Cover")
defineToggleSwitch("EMERG_GEARS_VALVE_COVER", 12, 3004, 166, "Hydro System", "Emergency Gears Valve Cover")
definePotentiometer("EMERG_SYS_FILL", 12, 3006, 186, {0.0, 1.0}, "Hydro System", "Emergency System Filling Valve")
definePotentiometer("AIR_NET", 12, 3007, 242, {0.0, 1.0}, "Hydro System", "Air Net Valve")
definePotentiometer("COCKPIT_FILL", 12, 3008, 241, {0.0, 1.0}, "Hydro System", "Cockpit Filling Valve")

-- Gear System
defineToggleSwitch("LANDING_GEAR", 13, 3001, 71, "Gear System", "Landing Gear Handle")
definePushButton("GEAR_LAMP_TEST", 13, 3003, 72, "Gear System", "Gear Lamps Test Button")
definePushButton("R_EMERG_GEAR", 13, 3005, 210, "Gear System", "Right Emergency Gear Release Handle")
definePushButton("L_EMERG_GEAR", 13, 3004, 209, "Gear System", "Left Emergency Gear Release Handle")
defineToggleSwitch("LANDING_GEAR_COVER", 13, 3002, 85, "Gear System", "Landing Gear Handle Lock")

-- Fuel System
defineToggleSwitch("DROP_TANK_SIGNAL", 10, 3001, 82, "Fuel System", "Drop Tank Signal Switch")

-- Oxygen System
definePotentiometer("O2_SUPPLY", 9, 3001, 141, {0.0, 1.0}, "Oxygen System", "Oxygen Supply Valve")
definePotentiometer("AIR_DILUTER", 9, 3003, 143, {-1.0, 0.0}, "Oxygen System", "Air Diluter Valve")
definePotentiometer("O2_EMERG", 9, 3002, 243, {0.0, 1.0}, "Oxygen System", "Oxygen Emergency Valve")

-- Conditioning and Heating System
definePotentiometer("COCKPIT_AIT", 8, 3001, 187, {0.0, 1.0}, "Conditioning and Heating System", "Cockpit Air Valve")
definePotentiometer("VENTILATION", 8, 3002, 86, {-1.0, 0.0}, "Conditioning and Heating System", "Ventilation Valve")

-- Internal Lights System
definePotentiometer("L_UV_LIGHT", 22, 3001, 184, {0.23, 0.82}, "Internal Lights System", "Left UV Light Rheostat")
definePotentiometer("R_UV_LIGHT", 22, 3002, 185, {0.23, 0.82}, "Internal Lights System", "Right UV Light Rheostat")
definePotentiometer("PANELS_LIGHT", 22, 3003, 220, {0.23, 0.82}, "Internal Lights System", "Panels Light Rheostat")

-- Nav Lights System
defineToggleSwitch("EXT_LIGHTS", 14, 3001, 111, "Nav Lights System", "External Lights Switch")
defineToggleSwitch("NOSE_LIGHT", 14, 3002, 80, "Nav Lights System", "Nose Light Switch")

-- Power Plant
definePotentiometer("ENGINE_STOP", 11, 3001, 208, {0.0, 1.0}, "Power Plant", "Engine Stop Lever")
defineToggleSwitch("ISO_VALVE", 11, 3002, 118, "Power Plant", "Isolating Valve Switch")

-- Fire Extinguisher System
defineToggleSwitch("FIRE_EX_COVER", 17, 3002, 136, "Fire Extinguisher System", "Engine Fire Extinguisher Button Cover")
definePushButton("FIRE_EX", 17, 3003, 137, "Fire Extinguisher System", "Engine Fire Extinguisher Button")
definePushButton("FIRE_EX_TEST", 17, 3001, 138, "Fire Extinguisher System", "Engine Fire Warning Light Test Button")

-- Signal Flares
defineToggleSwitch("SIGNAL_FLARE_SW", 28, 3001, 129, "Signal Flares", "Signal Flare Switch")
definePushButton("SIGNAL_FLARE_YEL", 28, 3005, 130, "Signal Flares", "Signal Flare Yellow Button")
definePushButton("SIGNAL_FLARE_GRE", 28, 3002, 131, "Signal Flares", "Signal Flare Green Button")
definePushButton("SIGNAL_FLARE_RED", 28, 3003, 132, "Signal Flares", "Signal Flare Red Button")
definePushButton("SIGNAL_FLARE_WHI", 28, 3004, 133, "Signal Flares", "Signal Flare White Button")

------ Devices
-- AGK-47B
defineToggleSwitch("AGK_CAGE", 25, 3002, 12, "AGK-47B", "AGK-47B Artificial Horizon Cage")
definePotentiometer("AGK_TRIM", 25, 3003, 13, {0.0, 1.0}, "AGK-47B", "AGK-47B Artificial Horizon Zero Pitch Trim Knob")

-- VD-15
definePotentiometer("QFE", 19, 3001, 30, {0.0, 1.0}, "VD-15", "Barometric Pressure QFE Knob")

-- PRV-46
defineToggleSwitch("RPV46_RANGE", 16, 3004, 36, "PRV-46", "PRV-46 Radar Altimeter Indicator Range Switch")
defineToggleSwitch("RPV46_POWER", 16, 3003, 37, "PRV-46", "PRV-46 Radar Altimeter Indicator Power Switch")

-- PDK-45
definePotentiometer("PDK45_HEADING", 19, 3001, 34, {0.0, 1.0}, "PDK-45", "Heading Knob")
definePushButton("PDK45_FAST_SLAVE", 28, 3003, 61, "PDK-45", "Fast Slave Button")

-- CLOCK 
defineRockerSwitch("CLOCK_LEFT_LVR", 7, 3001, 3002, 23, "Flight Status/Navigation Panel", "AChS-1 Cockpit Chronograph Left Push/Pull")
defineRotary("CLOCK_LEFT_ROT", 7, 3003, 24, "Flight Status/Navigation Panel", "AChS-1 Cockpit Chronograph Left  Rotate")
definePushButton("CLOCK_RIGHT_LVR", 7, 3004, 25, "Flight Status/Navigation Panel", "AChS-1 Cockpit Chronograph Right Push")
defineRotary("CLOCK_RIGHT_ROT", 7, 3005, 26, "Flight Status/Navigation Panel", "AChS-1 Cockpit Chronograph Right Rotate")

-- Weapon System
definePushButton("N37_RELOAD", 4, 3005, 92, "Weapon System", "N-37D Cannon Reload Button")
definePushButton("NR23_RELOAD_TOP", 4, 3006, 90, "Weapon System", "NR-23 (Top) Cannon Reload Button")
definePushButton("NR23_RELOAD_BOTTOM", 4, 3007, 91, "Weapon System", "NR-23 (Bottom) Cannon Reload Button")
defineToggleSwitch("TACTIC_RELEASE", 4, 3008, 96, "Weapon System", "Tactical Release Switch")
definePushButton("EMERG_RELEASE", 4, 3004, 97, "Weapon System", "Emergency Release Button")
defineToggleSwitch("EMERG_RELEASE_COVER", 4, 3009, 104, "Weapon System", "Emergency Release Button Cover")

-- Stick buttons
definePushButton("N37_FIRE", 4, 3001, 193, "Stick Buttons", "N-37D Cannon Fire Button")
definePushButton("WEAPON_RELEASE", 4, 3003, 195, "Stick Buttons", "Weapon Release Button")
defineToggleSwitch("GUN_SAFE", 4, 3010, 196, "Stick Buttons", "Guns Safety Cover")

-- ASP-3N Gunsight
defineToggleSwitch("ASP3_MODE", 26, 3003, 101, "ASP-3N Gunsight", "ASP-3N Gunsight Mode")
defineToggleSwitch("ASP3_MASK_LEVER", 26, 3011, 106, "ASP-3N Gunsight", "ASP-3N Gunsight Fixed Reticle Mask Lever")
definePotentiometer("ASP3_WINGSPAN_ADJ", 26, 3001, 103, {-0.5, 1.0}, "ASP-3N Gunsight", "ASP-3N Gunsight Target Wingspan Adjustment Dial")
definePotentiometer("ASP3_BRIGHT", 26, 3004, 102, {0.0, 1.0}, "ASP-3N Gunsight", "ASP-3N Gunsight Brightness Knob")
definePotentiometer("ASP3_DIST", 26, 3002, 201, {0.0, 1.0}, "ASP-3N Gunsight", "ASP-3N Gunsight Target Distance Knob")
defineToggleSwitch("ASP3_COLOR", 26, 3012, 105, "ASP-3N Gunsight", "ASP-3N Gunsight Color Filter")

-- ARC-5 radio compass
definePotentiometer("ARC5_VOL", 26, 3001, 180, {0.0, 1.0}, "ARC-5", "ARC-5 Audio Volume Knob")
defineTumb("ARC5_BAND", 26, 3004, 177, 0.5, {0.0, 1.0}, nil, false,"ARC-5" ,"ARC-5 Frequency Band Switch")
defineTumb("ARC5_SELECT", 26, 3003, 174, 0.1, {0.0, 0.4}, nil, false,"ARC-5" ,"ARC-5 Function Selector Switch")
define3PosTumb("ARC5_LOOP", 26, 3006, 178, "ARC-5", "ARC-5 LOOP L-R Switch")
definePotentiometer("ARC5_TUNE", 26, 3005, 175, {0.0, 1.0}, "ARC-5 Tuning Crank")
definePotentiometer("ARC5_LIGHT", 26, 3007, 181, {0.0, 1.0}, "ARC-5", "ARC-5 Scale Light Knob")
defineToggleSwitch("ARC5_TGL_TFL", 29, 3002, 173, "ARC-5", "ARC-5 TLG-TLF Switch")
definePushButton("ARC5_CONTROL", 29, 3008, 182, "ARC-5", "ARC-5 Take Control Button")
defineToggleSwitch("ARC5_NEAR_FAR_NBD", 29, 3009, 123, "ARC-5", "ARC-5 Near/Far NDB Switch")
defineToggleSwitch("ARC5_NBD1", 29, 3010, 146, "ARC-5", "ARC-5 NDB 1 Switch")
defineToggleSwitch("ARC5_NBD2", 29, 3011, 147, "ARC-5", "ARC-5 NDB 2 Switch")
defineToggleSwitch("ARC5_NBD3", 29, 3012, 148, "ARC-5", "ARC-5 NDB 3 Switch")

-- RSI-6K radio
defineRotary("RSI6K_VOL", 30, 3001, 126, "RSI-6K", "RSI-6K Audio Volume Knob")
defineRotary("RSI6K_TRAS_FREQ", 30, 3004, 232, "RSI-6K", "RSI-6K Wave Control Handle")
defineRotary("RSI6K_ANT_FREQ", 30, 3006, 230, "RSI-6K", "RSI-6K Antenna Control Handle")
defineRotary("RSI6K_TRAS_FREQ_FIX", 30, 3006, 233, "RSI-6K", "RSI-6K Wave Control Handle")
defineRotary("RSI6K_ANT_FREQ_FIX", 30, 3007, 231, "RSI-6K", "RSI-6K Antenna Control Handle")
defineRotary("RSI6K_RECEIVE_FREQ", 30, 3003, 128, "RSI-6K", "RSI-6K Receiver Tuning Knob")
defineToggleSwitch("RSI6K_RECEIVE", 30, 3008, 140, "RSI-6K", "RSI-6K Receive/ARC Switch")
defineToggleSwitch("RSI6K_FORCE", 30, 3009, 240, "RSI-6K", "RSI-6K Forced Mode Switch")
definePushButton("RSI6K_MIC", 30, 3002, 202, "RSI-6K", "Microphone Button")

-- Instruments --------------------------
defineFloat("VARIOMETER", 14, {0.0,	0.075, 0.151, 0.24,	0.352, 0.401, 0.448, 0.5, 0.553, 0.6, 0.649, 0.76, 0.848, 0.925, 1.0}, "Gauges", "Variometer")


BIOS.protocol.endModule()
