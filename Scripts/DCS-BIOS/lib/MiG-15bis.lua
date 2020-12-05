BIOS.protocol.beginModule("MiG-15bis", 0x2400)
BIOS.protocol.setExportModuleAircrafts({"MiG-15bis"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local define3PosTumb = BIOS.util.define3PosTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

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
defineFloat("V_A_METER_G", 83, {-1.0, 0.0, 1.0}, "Electric System", "Volt Amper Meter Gauge")

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
defineFloat("HYDRO_PRESS_MAIN", 168, {0.0, 1.0}, "Hydro System", "Hydraulic Pressure Main")
defineFloat("HYDRO_PRESS_GAIN", 139, {0.0, 1.0}, "Hydro System", "Hydraulic Pressure Gain")
defineFloat("HYDRO_PRESS_FLAPS", 169, {0.0, 1.0}, "Hydro System", "Hydraulic Pressure Air Flaps")
defineFloat("HYDRO_PRESS_GEARS", 165, {0.0, 1.0}, "Hydro System", "Hydraulic Pressure Air Gears")
defineFloat("HYDRO_PRESS_MAIN_AIR", 172, {0.0, 1.0}, "Hydro System", "Hydraulic Pressure Main Air")

-- Gear System
defineToggleSwitch("LANDING_GEAR", 13, 3001, 71, "Gear System", "Landing Gear Handle")
definePushButton("GEAR_LAMP_TEST", 13, 3003, 72, "Gear System", "Gear Lamps Test Button")
definePushButton("R_EMERG_GEAR", 13, 3005, 210, "Gear System", "Right Emergency Gear Release Handle")
definePushButton("L_EMERG_GEAR", 13, 3004, 209, "Gear System", "Left Emergency Gear Release Handle")
defineToggleSwitch("LANDING_GEAR_COVER", 13, 3002, 85, "Gear System", "Landing Gear Handle Lock")
defineFloat("BRAKE_PRESS_L", 121, {0.0, 1.0}, "Gear System", "Left Brake Pressure")
defineFloat("BRAKE_PRESS_R", 122, {0.0, 1.0}, "Gear System", "Right Brake Pressure")

-- Fuel System
defineToggleSwitch("DROP_TANK_SIGNAL", 10, 3001, 82, "Fuel System", "Drop Tank Signal Switch")
defineFloat("FUEL_QUANTITY", 47, {0.0, 0.047, 0.136, 0.22, 0.38, 0.52, 0.631, 0.755, 0.869, 0.921, 1.0}, "Fuel System", "Fuel Quantity")

-- Oxygen System
definePotentiometer("O2_SUPPLY", 9, 3001, 141, {0.0, 1.0}, "Oxygen System", "Oxygen Supply Valve")
definePotentiometer("AIR_DILUTER", 9, 3003, 143, {-1.0, 0.0}, "Oxygen System", "Air Diluter Valve")
definePotentiometer("O2_EMERG", 9, 3002, 243, {0.0, 1.0}, "Oxygen System", "Oxygen Emergency Valve")
defineFloat("O2_PRESS", 48, {0.0, 1.0}, "Oxygen System", "Oxygen Pressure")
defineFloat("O2_FLOW_BLINK", 60, {0.0, 1.0}, "Oxygen System", "Flow Blinker")
defineFloat("O2_FLOW_PRESS", 49, {0.0, 0.9, 1.0}, "Oxygen System", "Flow Pressure")

-- Conditioning and Heating System
definePotentiometer("COCKPIT_AIT", 8, 3001, 187, {0.0, 1.0}, "Conditioning and Heating System", "Cockpit Air Valve")
definePotentiometer("VENTILATION", 8, 3002, 86, {-1.0, 0.0}, "Conditioning and Heating System", "Ventilation Valve")

-- Internal Lights System
definePotentiometer("L_UV_LIGHT", 22, 3001, 184, {0.23, 0.82}, "Internal Lights System", "Left UV Light Rheostat")
definePotentiometer("R_UV_LIGHT", 22, 3002, 185, {0.23, 0.82}, "Internal Lights System", "Right UV Light Rheostat")
definePotentiometer("PANELS_LIGHT", 22, 3003, 220, {0.23, 0.82}, "Internal Lights System", "Panels Light Rheostat")
defineFloat("LAMP_LIGHT", 244, {0.0, 1.0}, "Internal Lights System", "Lamps Lightness") --???

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
defineToggleSwitch("SIGNAL_FLARE_YEL", 28, 3005, 130, "Signal Flares", "Signal Flare Yellow Button")
defineToggleSwitch("SIGNAL_FLARE_GRE", 28, 3002, 131, "Signal Flares", "Signal Flare Green Button")
defineToggleSwitch("SIGNAL_FLARE_RED", 28, 3008, 132, "Signal Flares", "Signal Flare Red Button")
defineToggleSwitch("SIGNAL_FLARE_WHI", 28, 3004, 133, "Signal Flares", "Signal Flare White Button")

------ Devices
-- AGK-47B
defineToggleSwitch("AGK_CAGE", 25, 3002, 12, "AGK47B", "AGK-47B Artificial Horizon Cage")
definePotentiometer("AGK_TRIM", 25, 3003, 13, {0.0, 1.0}, "AGK47B", "AGK-47B Artificial Horizon Zero Pitch Trim Knob")
defineFloat("AGK_ROLL", 6, {-1.0, 1.0}, "AGK47B", "AGK-47B Roll Gauge")
defineFloat("AGK_PITCH", 7, {1.0, -1.0}, "AGK47B", "AGK-47B Pitch Gauge")
defineFloat("AGK_FLAG", 11, {0.0, 1.0}, "AGK47B", "AGK-47B Failure Flag")
defineFloat("AGK_SLIP", 8, {-1.0, 1.0}, "AGK47B", "AGK-47B Sideslip Gauge")
defineFloat("AGK_TURN", 9, {-1.0, 1.0}, "AGK47B", "AGK-47B Turn Gauge")
defineFloat("AGK_HORIZON", 10, {-1.0, 1.0}, "AGK47B", "AGK-47B Horizon Gauge")

-- VD-15
definePotentiometer("BARO_PRESS", 19, 3001, 30, {0.0, 1.0}, "VD15", "Barometric Pressure QFE Knob")

-- PRV-46
defineToggleSwitch("RPV46_RANGE", 16, 3004, 36, "PRV46", "PRV-46 Radar Altimeter Indicator Range Switch")
defineToggleSwitch("RPV46_POWER", 16, 3003, 37, "PRV46", "PRV-46 Radar Altimeter Indicator Power Switch")
defineFloat("RPV46_RALT", 35, {-1.0, 0.0, 1.0}, "PRV46", "PRV-46 Radar Altimeter Gauge")

-- PDK-45
definePotentiometer("PDK45_HEADING", 21, 3001, 34, {0.0, 1.0}, "PDK45", "Heading Knob")
definePushButton("PDK45_FAST_SLAVE", 21, 3003, 61, "PDK45", "Fast Slave Button")
defineFloat("PDK45_HDG_SCALE", 32, {1.0, 0.0}, "PDK45", "Heading Scale")
defineFloat("PDK45_HDG", 33, {0.0, 1.0}, "PDK45", "Heading")

-- CLOCK
defineTumb("CLOCK_LEFT_LVR1", 7, 3001, 23, 1, {-1.0, 0.0}, nil, false, "Clock", "AChS-1 Cockpit Chronograph Left Push/Pull (Stage 1)")
definePushButton("CLOCK_LEFT_LVR2", 7, 3002, 23, "Clock", "AChS-1 Cockpit Chronograph Left Push/Pull (Stage 2)")
defineRotary("CLOCK_LEFT_ROT", 7, 3003, 24, "Clock", "AChS-1 Cockpit Chronograph Left  Rotate")
definePushButton("CLOCK_RIGHT_LVR", 7, 3004, 25, "Clock", "AChS-1 Cockpit Chronograph Right Push")
defineRotary("CLOCK_RIGHT_ROT", 7, 3005, 26, "Clock", "AChS-1 Cockpit Chronograph Right Rotate")
defineFloat("CLOCK_CUR_H", 15, {0.0, 1.0}, "Clock", "CLOCK currtime hours")
defineFloat("CLOCK_CUR_M", 16, {0.0, 1.0}, "Clock", "CLOCK currtime minutes")
defineFloat("CLOCK_FLY_STATUS", 22, {0.5, 0.0}, "Clock", "CLOCK flight time meter status")
defineFloat("CLOCK_FLY_H", 18, {0.0, 1.0}, "Clock", "CLOCK fly hours")
defineFloat("CLOCK_FLY_M", 19, {0.0, 1.0}, "Clock", "CLOCK fly minutes")
defineFloat("CLOCK_SEC_M", 20, {1.0, 0.0}, "Clock", "CLOCK seconds meter time minutes")
defineFloat("CLOCK_SEC_S", 17, {0.0, 1.0}, "Clock", "CLOCK seconds meter time seconds")

-- Weapon System
definePushButton("N37_RELOAD", 4, 3005, 92, "Weapon System", "N-37D Cannon Reload Button")
definePushButton("NR23_RELOAD_TOP", 4, 3006, 90, "Weapon System", "NR-23 (Top) Cannon Reload Button")
definePushButton("NR23_RELOAD_BOTTOM", 4, 3007, 91, "Weapon System", "NR-23 (Bottom) Cannon Reload Button")
defineToggleSwitch("TACTIC_RELEASE", 4, 3008, 96, "Weapon System", "Tactical Release Switch")
definePushButton("EMERG_RELEASE", 4, 3004, 97, "Weapon System", "Emergency Release Button")
defineToggleSwitch("EMERG_RELEASE_COVER", 4, 3009, 104, "Weapon System", "Emergency Release Button Cover")
defineIndicatorLight("N37_READY_L", 95, "Weapon System", "N37D Ready Indicator Light (red)")
defineIndicatorLight("NR23_TOP_READY_L", 93, "Weapon System", "NR23 TOP Ready Indicator Light (red)")
defineIndicatorLight("NR23_BOTTOM_READY_L", 94, "Weapon System", "NR23 BOTTOM Ready Indicator Light (red)")
defineIndicatorLight("TACTIC_RELEASE_L", 100, "Weapon System", "Tactical Release Indicator Light (red)")
defineIndicatorLight("L_BOMB_L", 98, "Weapon System", "Left BOMB Indicator Light (green)")
defineIndicatorLight("R_BOMB_L", 99, "Weapon System", "Right BOMB Indicator Light (green)")

-- Stick buttons
definePushButton("N37_FIRE", 4, 3001, 193, "Stick Buttons", "N-37D Cannon Fire Button")
definePushButton("WEAPON_RELEASE", 4, 3003, 195, "Stick Buttons", "Weapon Release Button")
defineToggleSwitch("GUN_SAFE", 4, 3010, 196, "Stick Buttons", "Guns Safety Cover")

-- ASP-3N Gunsight
defineToggleSwitch("ASP3_MODE", 26, 3003, 101, "ASP3N Gunsight", "ASP-3N Gunsight Mode")
defineToggleSwitch("ASP3_MASK_LEVER", 26, 3011, 106, "ASP3N Gunsight", "ASP-3N Gunsight Fixed Reticle Mask Lever")
definePotentiometer("ASP3_WINGSPAN_ADJ", 26, 3001, 103, {-0.5, 1.0}, "ASP3N Gunsight", "ASP-3N Gunsight Target Wingspan Adjustment Dial")
definePotentiometer("ASP3_BRIGHT", 26, 3004, 102, {0.0, 1.0}, "ASP3N Gunsight", "ASP-3N Gunsight Brightness Knob")
definePotentiometer("ASP3_DIST", 26, 3002, 201, {0.0, 1.0}, "ASP3N Gunsight", "ASP-3N Gunsight Target Distance Knob")
defineToggleSwitch("ASP3_COLOR", 26, 3012, 105, "ASP3N Gunsight", "ASP-3N Gunsight Color Filter")
defineFloat("ASP3_RANGE", 245, {0.0, 1.0}, "ASP3N Gunsight", "ASP-3N Gunsight Range")

-- ARC-5 radio compass
definePotentiometer("ARC5_VOL", 29, 3001, 180, {0.0, 1.0}, "ARC5", "ARC-5 Audio Volume Knob")
defineTumb("ARC5_BAND", 29, 3004, 177, 0.5, {0.0, 1.0}, nil, false,"ARC5" ,"ARC-5 Frequency Band Switch")
defineTumb("ARC5_SELECT", 29, 3003, 174, 0.1, {0.0, 0.4}, nil, false,"ARC5" ,"ARC-5 Function Selector Switch")
define3PosTumb("ARC5_LOOP", 29, 3006, 178, "ARC5", "ARC-5 LOOP L-R Switch")
definePotentiometer("ARC5_TUNE", 29, 3005, 175, {0.0, 1.0}, "ARC5", "ARC-5 Tuning Crank")
definePotentiometer("ARC5_LIGHT", 29, 3007, 181, {0.0, 1.0}, "ARC5", "ARC-5 Scale Light Knob")
defineToggleSwitch("ARC5_TGL_TFL", 29, 3002, 173, "ARC5", "ARC-5 TLG-TLF Switch")
definePushButton("ARC5_CONTROL", 29, 3008, 182, "ARC5", "ARC-5 Take Control Button")
defineToggleSwitch("ARC5_NEAR_FAR_NBD", 29, 3009, 123, "ARC5", "ARC-5 Near/Far NDB Switch")
defineToggleSwitch("ARC5_NBD1", 29, 3010, 146, "ARC5", "ARC-5 NDB 1 Switch")
defineToggleSwitch("ARC5_NBD2", 29, 3011, 147, "ARC5", "ARC-5 NDB 2 Switch")
defineToggleSwitch("ARC5_NBD3", 29, 3012, 148, "ARC5", "ARC-5 NDB 3 Switch")
defineFloat("ARC5_BAND", 238, {0.0, 0.4}, "ARC5", "ARC-5 Band")
defineFloat("ARC5_TUNE_METER", 176, {0.0, 1.0}, "ARC5", "ARC-5 Tuning Meter")
defineFloat("ARC5_TUNE", 175, {0.0, 1.0}, "ARC5", "ARC-5 Tuning")
defineFloat("ARC5_BEARING", 38, {0.0, 1.0}, "ARC5", "ARC-5 Bearing")
defineFloat("ARC5_FREQ", 239, {0.0,	0.0695,	0.14, 0.2865, 0.43, 0.7155, 1.0}, "ARC5", "ARC-5 Freq Scale")
defineIndicatorLight("ARC5_PW_LIGHT", 183, "ARC5", "ARC-5 Power Light (green)")	

-- RSI-6K Radio
defineRotary("RSI6K_VOL", 30, 3001, 126, "RSI6K", "RSI-6K Audio Volume Knob")
defineRotary("RSI6K_TRAS_FREQ", 30, 3004, 232, "RSI6K", "RSI-6K Wave Control Handle")
defineRotary("RSI6K_ANT_FREQ", 30, 3006, 230, "RSI6K", "RSI-6K Antenna Control Handle")
defineRotary("RSI6K_TRAS_FREQ_FIX", 30, 3006, 233, "RSI6K", "RSI-6K Wave Control Handle")
defineRotary("RSI6K_ANT_FREQ_FIX", 30, 3007, 231, "RSI6K", "RSI-6K Antenna Control Handle")
defineRotary("RSI6K_RECEIVE_FREQ", 30, 3003, 128, "RSI6K", "RSI-6K Receiver Tuning Knob")
defineToggleSwitch("RSI6K_RECEIVE", 30, 3008, 140, "RSI6K", "RSI-6K Receive/ARC Switch")
defineToggleSwitch("RSI6K_FORCE", 30, 3009, 240, "RSI6K", "RSI-6K Forced Mode Switch")
definePushButton("RSI6K_MIC", 30, 3002, 202, "RSI6K", "Microphone Button")
defineFloat("RSI6K_ANT_POWER", 235, {0.0, 1.0}, "RSI6K", "RSI-6K Antenna Power")
defineFloat("RSI6K_RECEIVE_KNOB", 128, {0.0, 1.0}, "RSI6K", "RSI-6K Receiver Knob")
defineFloat("RSI6K_RECEIVE_IND", 127, {0.036, 0.961}, "RSI6K", "RSI-6K Receiver Ind")
defineFloat("RSI6K_RECEIVE_GAUGE", 144, {0.026, 0.957}, "RSI6K", "RSI-6K Receiver Gauge")


-- Instruments
defineFloat("VARIOMETER", 14, {0.0,	0.075, 0.151, 0.24,	0.352, 0.401, 0.448, 0.5, 0.553, 0.6, 0.649, 0.76, 0.848, 0.925, 1.0}, "Gauges", "Variometer")
defineFloat("ALT_KM", 28, {0.0, 1.0}, "Gauges", "Altimeter km")
defineFloat("ALT_M", 29, {0.0, 1.0}, "Gauges", "Altimeter km")
defineFloat("ALT_PRESS", 31, {-0.0535, 0.0, 1.0}, "Gauges", "Altimeter Pressure")
defineFloat("IAS", 4, {0.0, 1.0}, "Gauges", "IAS")
defineFloat("TAS", 5, {0.0, 1.0}, "Gauges", "TAS")
defineFloat("MACH", 27, {0.12,	0.215,	1.0}, "Gauges", "Mach")
defineFloat("CANOPY_AIR_VALVE", 188, {0.0, 1.0}, "Gauges", "Canopy Air Valve Indication")
defineFloat("COCKPIT_ALT", 39, {0.008,	1.0}, "Gauges", "Cockpit Altitude")
defineFloat("PRESS_DIFF", 40, {0.0,	0.243, 1.0}, "Gauges", "Pressure Difference")
defineFloat("ENG_TACHO", 42, {0.0, 1.0}, "Gauges", "Engine Tachometer")
defineFloat("ENG_TEMP", 41, {0.0, 1.0}, "Gauges", "Engine Temperature")
defineFloat("OIL_TEMP", 45, {0.0, 1.0}, "Gauges", "Oil Temperature")
defineFloat("OIL_PRESS", 44, {0.0, 1.0}, "Gauges", "Oil Pressure")
defineFloat("ENG_FUEL_PRESS", 43, {0.0, 1.0}, "Gauges", "Engine Fuel Pressure")
defineFloat("FUEL_PRESS", 46, {0.0, 1.0}, "Gauges", "Fuel Pressure")
defineFloat("SBY_COMPASS_HDG", 3, {-1, 1}, "Gauges", "Standby Compass Heading")
defineFloat("SBY_COMPASS_PITCH", 2, {-1, 1}, "Gauges", "Standby Compass Pitch")
defineFloat("SBY_COMPASS_BANK", 1, {-1, 1}, "Gauges", "Standby Compass Bank")

-- Warning, Caution and IndicatorLights
defineIndicatorLight("FIRE_TEST_LIGHT", 135, "Warning, Caution and IndicatorLights","Fire Alarm Test Light (red)")
defineIndicatorLight("ISO_VALVE_LIGHT", 119, "Warning, Caution and IndicatorLights", "Isolating Valve Indicator Light (green)")	
defineIndicatorLight("AIRBRAKE_LIGHT", 124, "Warning, Caution and IndicatorLights", "Airbrake Light (green)")
defineIndicatorLight("FUEL2_EMPTY_LIGHT", 50, "Warning, Caution and IndicatorLights", "Fuel Tank 2 Empty Warning Light (green)")		
defineIndicatorLight("FUEL_LINE_LIGHT", 51, "Warning, Caution and IndicatorLights","Fuel Line Warning Light (red)")
defineIndicatorLight("FUEL_WING_EMPTY_LIGHT", 52, "Warning, Caution and IndicatorLights", "Fuel Tank Wing Empty Warning Light (green)")
defineIndicatorLight("GEAR_WARN_LIGHT", 53, "Warning, Caution and IndicatorLights", "Landing Gear Warning Light (white)")
defineIndicatorLight("BEACON_ALARM_LIGHT", 54, "Warning, Caution and IndicatorLights","Radio Beacon Alarm Light (red)")
defineIndicatorLight("FUEL_300_LIGHT", 56, "Warning, Caution and IndicatorLights","Fuel 300L Warning Light (red)")
defineIndicatorLight("GEN_OFF_LIGHT", 57, "Warning, Caution and IndicatorLights","Generator OFF Warning Light (red)")
defineIndicatorLight("ING_LIGHT", 58, "Warning, Caution and IndicatorLights","Ingnition Warning Light (red)")
defineIndicatorLight("FLAPS_LIGHT", 59, "Warning, Caution and IndicatorLights", "Flaps Warning Light (green)")
defineIndicatorLight("L_GEAR_UP", 74, "Warning, Caution and IndicatorLights","Left Gear UP Lamp (red)")
defineIndicatorLight("N_GEAR_UP", 76, "Warning, Caution and IndicatorLights","Nose Gear UP Lamp (red)")
defineIndicatorLight("R_GEAR_UP", 78, "Warning, Caution and IndicatorLights","Right Gear UP Lamp (red)")
defineIndicatorLight("L_GEAR_DOWN", 75, "Warning, Caution and IndicatorLights","Left Gear DOWN Lamp (green)")
defineIndicatorLight("N_GEAR_DOWN", 77, "Warning, Caution and IndicatorLights","Nose Gear DOWN Lamp (green)")
defineIndicatorLight("R_GEAR_DOWN", 79, "Warning, Caution and IndicatorLights","Right Gear DOWN Lamp (green)")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(183)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(185)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()