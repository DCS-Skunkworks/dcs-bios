module("MiG-15bis", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class MiG_15bis: Module
local MiG_15bis = Module:new("MiG-15bis", 0x2400, { "MiG-15bis" })

-- Draw pilot = 540

-- Cockpit mechanics
MiG_15bis:defineToggleSwitch("EMERG_CANOPY_JETT", 15, 3006, 221, "Cockpit Mech", "Emergency Canopy Jettison")
MiG_15bis:defineToggleSwitch("L_CANOPY_LEVER", 15, 3003, 223, "Cockpit Mech", "Left Canopy Lever")
MiG_15bis:defineToggleSwitch("R_CANOPY_LEVER", 15, 3004, 222, "Cockpit Mech", "Right Canopy Lever")
MiG_15bis:defineToggleSwitch("AFT_CANOPY_LEVER", 15, 3005, 224, "Cockpit Mech", "Aft Canopy Lever")

-- Control system
MiG_15bis:define3PosTumb("ELEVATOR_TRIM", 3, 3002, 114, "Control System", "Elevator Trimmer Switch")
MiG_15bis:define3PosTumb("AILERON_TRIM", 3, 3001, 142, "Control System", "Aileron Trimmer Switch")
MiG_15bis:defineTumb("FLAPS_HANDLE", 3, 3003, 207, 0.5, { -1, 0.5 }, nil, false, "Control System", "Wing Flaps Handle")
MiG_15bis:defineToggleSwitch("AIRBRAKE_SW", 3, 3005, 125, "Control System", "Airbrake Switch")
MiG_15bis:defineToggleSwitch("HYDRO_BOOST", 3, 3006, 203, "Control System", "Hydro Booster Lever")
MiG_15bis:reserveIntValue(1) -- removed THROTTLE_FRICTION defined as tumb
MiG_15bis:definePushButton("AIRBRAKE_BT", 3, 3004, 198, "Control System", "Airbrake Button")

-- Electric system
MiG_15bis:definePushButton("V_A_METER", 2, 3007, 84, "Electric System", "Ampere- & Voltmeter")
MiG_15bis:defineToggleSwitch("AIR_START", 2, 3005, 149, "Electric System", "Air Start Switch")
MiG_15bis:defineToggleSwitch("PITOT_CLOCK_HEATER", 2, 3011, 81, "Electric System", "Pitot and Clock Heater Switch")
MiG_15bis:definePushButton("ENGINE_START", 2, 3003, 200, "Electric System", "Engine Start Button")
MiG_15bis:defineToggleSwitch("ENGINE_START_COVER", 2, 3004, 214, "Electric System", "Engine Start Button Cover")
MiG_15bis:defineFloat("V_A_METER_G", 83, { -1, 1 }, "Electric System", "Volt Amper Meter Gauge")

-- Circuit Breakers
MiG_15bis:defineToggleSwitch("TRANSFER_PUMP", 2, 3017, 117, "Circuit Breakers", "Transfer Pump Switch")
MiG_15bis:defineToggleSwitch("BOOSTER_PUMP", 2, 3018, 115, "Circuit Breakers", "Booster Pump Switch")
MiG_15bis:defineToggleSwitch("IGNITION", 2, 3019, 120, "Circuit Breakers", "Ignition Switch")
MiG_15bis:defineToggleSwitch("INSTR_LIGHTS", 2, 3022, 116, "Circuit Breakers", "Instruments and Lights Switch")

-- Right Panel
MiG_15bis:defineToggleSwitch("BATTERY", 2, 3001, 152, "Right Panel", "Accumulator Switch")
MiG_15bis:defineToggleSwitch("GENERATOR", 2, 3002, 153, "Right Panel", "Generator Switch")
MiG_15bis:defineToggleSwitch("NOSE_LIGHT_MASTER", 2, 3013, 151, "Right Panel", "Nose Light Master Switch")
MiG_15bis:defineToggleSwitch("TRIM", 2, 3012, 154, "Right Panel", "Trim Master Switch")
MiG_15bis:defineToggleSwitch("AGK_DGMK", 2, 3006, 155, "Right Panel", "AGK-47B Artificial Horizon + DGMK-3 Switch")
MiG_15bis:defineToggleSwitch("RADIO", 2, 3014, 158, "Right Panel", "Radio Switch")
MiG_15bis:defineToggleSwitch("BOMBS", 2, 3010, 157, "Right Panel", "Bombs Switch")
MiG_15bis:defineToggleSwitch("EMERG_DROP", 2, 3021, 156, "Right Panel", "Emergency Drop Switch")
MiG_15bis:defineToggleSwitch("ARC", 2, 3015, 159, "Right Panel", "ARC Switch")
MiG_15bis:defineToggleSwitch("RV_RADIO_ALT", 2, 3016, 160, "Right Panel", "RV-2 Radio Altimeter Switch")
MiG_15bis:defineToggleSwitch("NR23_CANNON", 2, 3008, 161, "Right Panel", "NR-23 Cannon Switch")
MiG_15bis:defineToggleSwitch("N37D_CANNON", 2, 3009, 162, "Right Panel", "N-37D Cannon Switch")
MiG_15bis:defineToggleSwitch("GUN_SIGHT", 2, 3020, 163, "Right Panel", "ASP-3N Gunsight Switch")
MiG_15bis:defineToggleSwitch("GUN_CAM", 2, 3023, 164, "Right Panel", "S-13 Gun Camera Switch")

-- Hydro System
MiG_15bis:definePotentiometer("EMERG_FLAPS_VALVE", 12, 3001, 171, { 0, 1 }, "Hydro System", "Emergency Flaps Valve")
MiG_15bis:definePotentiometer("EMERG_GEARS_VALVE", 12, 3002, 167, { 0, 1 }, "Hydro System", "Emergency Gears Valve")
MiG_15bis:defineToggleSwitch("EMERG_FLAPS_VALVE_COVER", 12, 3003, 170, "Hydro System", "Emergency Flaps Valve Cover")
MiG_15bis:defineToggleSwitch("EMERG_GEARS_VALVE_COVER", 12, 3004, 166, "Hydro System", "Emergency Gears Valve Cover")
MiG_15bis:definePotentiometer("EMERG_SYS_FILL", 12, 3006, 186, { 0, 1 }, "Hydro System", "Emergency System Filling Valve")
MiG_15bis:definePotentiometer("AIR_NET", 12, 3007, 242, { 0, 1 }, "Hydro System", "Air Net Valve")
MiG_15bis:definePotentiometer("COCKPIT_FILL", 12, 3008, 241, { 0, 1 }, "Hydro System", "Cockpit Filling Valve")
MiG_15bis:defineFloat("HYDRO_PRESS_MAIN", 168, { 0, 1 }, "Hydro System", "Hydraulic Pressure Main")
MiG_15bis:defineFloat("HYDRO_PRESS_GAIN", 139, { 0, 1 }, "Hydro System", "Hydraulic Pressure Gain")
MiG_15bis:defineFloat("HYDRO_PRESS_FLAPS", 169, { 0, 1 }, "Hydro System", "Hydraulic Pressure Air Flaps")
MiG_15bis:defineFloat("HYDRO_PRESS_GEARS", 165, { 0, 1 }, "Hydro System", "Hydraulic Pressure Air Gears")
MiG_15bis:defineFloat("HYDRO_PRESS_MAIN_AIR", 172, { 0, 1 }, "Hydro System", "Hydraulic Pressure Main Air")

-- Gear System
MiG_15bis:defineToggleSwitch("LANDING_GEAR", 13, 3001, 71, "Gear System", "Landing Gear Handle")
MiG_15bis:definePushButton("GEAR_LAMP_TEST", 13, 3003, 72, "Gear System", "Gear Lamps Test Button")
MiG_15bis:definePushButton("R_EMERG_GEAR", 13, 3005, 210, "Gear System", "Right Emergency Gear Release Handle")
MiG_15bis:definePushButton("L_EMERG_GEAR", 13, 3004, 209, "Gear System", "Left Emergency Gear Release Handle")
MiG_15bis:defineToggleSwitch("LANDING_GEAR_COVER", 13, 3002, 85, "Gear System", "Landing Gear Handle Lock")
MiG_15bis:defineFloat("BRAKE_PRESS_L", 121, { 0, 1 }, "Gear System", "Left Brake Pressure")
MiG_15bis:defineFloat("BRAKE_PRESS_R", 122, { 0, 1 }, "Gear System", "Right Brake Pressure")

-- Fuel System
MiG_15bis:defineToggleSwitch("DROP_TANK_SIGNAL", 10, 3001, 82, "Fuel System", "Drop Tank Signal Switch")
MiG_15bis:defineFloat("FUEL_QUANTITY", 47, { 0.0, 1.0 }, "Fuel System", "Fuel Quantity")

-- Oxygen System
MiG_15bis:definePotentiometer("O2_SUPPLY", 9, 3001, 141, { 0, 1 }, "Oxygen System", "Oxygen Supply Valve")
MiG_15bis:definePotentiometer("AIR_DILUTER", 9, 3003, 143, { 0, 1 }, "Oxygen System", "Air Diluter Valve")
MiG_15bis:definePotentiometer("O2_EMERG", 9, 3002, 243, { 0, 1 }, "Oxygen System", "Oxygen Emergency Valve")
MiG_15bis:defineFloat("O2_PRESS", 48, { 0, 1 }, "Oxygen System", "Oxygen Pressure")
MiG_15bis:defineFloat("O2_FLOW_BLINK", 60, { 0, 1 }, "Oxygen System", "Flow Blinker")
MiG_15bis:defineFloat("O2_FLOW_PRESS", 49, { 0.0, 1.0 }, "Oxygen System", "Flow Pressure")

-- Conditioning and Heating System
MiG_15bis:definePotentiometer("COCKPIT_AIT", 8, 3001, 187, { 0, 1 }, "Conditioning and Heating System", "Cockpit Air Valve")
MiG_15bis:definePotentiometer("VENTILATION", 8, 3002, 86, { -1, 0 }, "Conditioning and Heating System", "Ventilation Valve")

-- Internal Lights System
MiG_15bis:definePotentiometer("L_UV_LIGHT", 22, 3001, 184, { 0.23, 0.82 }, "Internal Lights System", "Left UV Light Rheostat")
MiG_15bis:definePotentiometer("R_UV_LIGHT", 22, 3002, 185, { 0.23, 0.82 }, "Internal Lights System", "Right UV Light Rheostat")
MiG_15bis:definePotentiometer("PANELS_LIGHT", 22, 3003, 220, { 0.1, 0.9 }, "Internal Lights System", "Panels Light Rheostat")
MiG_15bis:defineFloat("LAMP_LIGHT", 244, { 0, 1 }, "Internal Lights System", "Lamps Lightness") --???

-- Nav Lights System
MiG_15bis:defineToggleSwitch("EXT_LIGHTS", 14, 3001, 111, "Nav Lights System", "External Lights Switch")
MiG_15bis:defineToggleSwitch("NOSE_LIGHT", 14, 3002, 80, "Nav Lights System", "Nose Light Switch")

-- Power Plant
MiG_15bis:definePotentiometer("ENGINE_STOP", 11, 3001, 208, { 0, 1 }, "Power Plant", "Engine Stop Lever")
MiG_15bis:defineToggleSwitch("ISO_VALVE", 11, 3002, 118, "Power Plant", "Isolating Valve Switch")

-- Fire Extinguisher System
MiG_15bis:defineToggleSwitch("FIRE_EX_COVER", 17, 3002, 136, "Fire Extinguisher System", "Engine Fire Extinguisher Button Cover")
MiG_15bis:definePushButton("FIRE_EX", 17, 3003, 137, "Fire Extinguisher System", "Engine Fire Extinguisher Button")
MiG_15bis:definePushButton("FIRE_EX_TEST", 17, 3001, 138, "Fire Extinguisher System", "Engine Fire Warning Light Test Button")

-- Signal Flares
MiG_15bis:defineToggleSwitch("SIGNAL_FLARE_SW", 28, 3001, 129, "Signal Flares", "Signal Flare Switch")
MiG_15bis:defineToggleSwitch("SIGNAL_FLARE_YEL", 28, 3005, 130, "Signal Flares", "Signal Flare Yellow Button")
MiG_15bis:defineToggleSwitch("SIGNAL_FLARE_GRE", 28, 3002, 131, "Signal Flares", "Signal Flare Green Button")
MiG_15bis:defineToggleSwitch("SIGNAL_FLARE_RED", 28, 3008, 132, "Signal Flares", "Signal Flare Red Button")
MiG_15bis:defineToggleSwitch("SIGNAL_FLARE_WHI", 28, 3004, 133, "Signal Flares", "Signal Flare White Button")

------ Devices
-- AGK-47B
MiG_15bis:defineToggleSwitch("AGK_CAGE", 25, 3002, 12, "AGK47B", "AGK-47B Artificial Horizon Cage")
MiG_15bis:definePotentiometer("AGK_TRIM", 25, 3003, 13, { 0, 1 }, "AGK47B", "AGK-47B Artificial Horizon Zero Pitch Trim Knob")
MiG_15bis:defineFloat("AGK_ROLL", 6, { -1, 1 }, "AGK47B", "AGK-47B Roll Gauge")
MiG_15bis:defineFloat("AGK_PITCH", 7, { 1.0, -1.0 }, "AGK47B", "AGK-47B Pitch Gauge")
MiG_15bis:defineFloat("AGK_FLAG", 11, { 0, 1 }, "AGK47B", "AGK-47B Failure Flag")
MiG_15bis:defineFloat("AGK_SLIP", 8, { -1, 1 }, "AGK47B", "AGK-47B Sideslip Gauge")
MiG_15bis:defineFloat("AGK_TURN", 9, { -1, 1 }, "AGK47B", "AGK-47B Turn Gauge")
MiG_15bis:defineFloat("AGK_HORIZON", 10, { -1, 1 }, "AGK47B", "AGK-47B Horizon Gauge")

-- VD-15
MiG_15bis:definePotentiometer("BARO_PRESS", 19, 3001, 30, { 0, 1 }, "VD15", "Barometric Pressure QFE Knob")

-- PRV-46
MiG_15bis:defineToggleSwitch("RPV46_RANGE", 16, 3004, 36, "PRV46", "PRV-46 Radar Altimeter Indicator Range Switch")
MiG_15bis:defineToggleSwitch("RPV46_POWER", 16, 3003, 37, "PRV46", "PRV-46 Radar Altimeter Indicator Power Switch")
MiG_15bis:defineFloat("RPV46_RALT", 35, { -1.0, 1.0 }, "PRV46", "PRV-46 Radar Altimeter Gauge")

-- PDK-45
MiG_15bis:definePotentiometer("PDK45_HEADING", 21, 3001, 34, { 0, 1 }, "PDK45", "Heading Knob")
MiG_15bis:definePushButton("PDK45_FAST_SLAVE", 21, 3003, 61, "PDK45", "Fast Slave Button")
MiG_15bis:defineFloat("PDK45_HDG_SCALE", 32, { 1, 0 }, "PDK45", "Heading Scale")
MiG_15bis:defineFloat("PDK45_HDG", 33, { 0, 1 }, "PDK45", "Heading")

-- CLOCK
MiG_15bis:defineTumb("CLOCK_LEFT_LVR1", 7, 3001, 23, 1, { -1, 0 }, nil, false, "Clock", "AChS-1 Cockpit Chronograph Left Push/Pull (Stage 1)")
MiG_15bis:definePushButton("CLOCK_LEFT_LVR2", 7, 3002, 23, "Clock", "AChS-1 Cockpit Chronograph Left Push/Pull (Stage 2)")
MiG_15bis:defineRotary("CLOCK_LEFT_ROT", 7, 3003, 24, "Clock", "AChS-1 Cockpit Chronograph Left  Rotate")
MiG_15bis:definePushButton("CLOCK_RIGHT_LVR", 7, 3004, 25, "Clock", "AChS-1 Cockpit Chronograph Right Push")
MiG_15bis:defineRotary("CLOCK_RIGHT_ROT", 7, 3005, 26, "Clock", "AChS-1 Cockpit Chronograph Right Rotate")
MiG_15bis:defineFloat("CLOCK_CUR_H", 15, { 0, 1 }, "Clock", "CLOCK currtime hours")
MiG_15bis:defineFloat("CLOCK_CUR_M", 16, { 0, 1 }, "Clock", "CLOCK currtime minutes")
MiG_15bis:defineFloat("CLOCK_FLY_STATUS", 22, { 0.5, 0 }, "Clock", "CLOCK flight time meter status")
MiG_15bis:defineFloat("CLOCK_FLY_H", 18, { 0, 1 }, "Clock", "CLOCK fly hours")
MiG_15bis:defineFloat("CLOCK_FLY_M", 19, { 0, 1 }, "Clock", "CLOCK fly minutes")
MiG_15bis:defineFloat("CLOCK_SEC_M", 20, { 1, 0 }, "Clock", "CLOCK seconds meter time minutes")
MiG_15bis:defineFloat("CLOCK_SEC_S", 17, { 0, 1 }, "Clock", "CLOCK seconds meter time seconds")

-- Weapon System
MiG_15bis:definePushButton("N37_RELOAD", 4, 3005, 92, "Weapon System", "N-37D Cannon Reload Button")
MiG_15bis:definePushButton("NR23_RELOAD_TOP", 4, 3006, 90, "Weapon System", "NR-23 (Top) Cannon Reload Button")
MiG_15bis:definePushButton("NR23_RELOAD_BOTTOM", 4, 3007, 91, "Weapon System", "NR-23 (Bottom) Cannon Reload Button")
MiG_15bis:defineToggleSwitch("TACTIC_RELEASE", 4, 3008, 96, "Weapon System", "Tactical Release Switch")
MiG_15bis:definePushButton("EMERG_RELEASE", 4, 3004, 97, "Weapon System", "Emergency Release Button")
MiG_15bis:defineToggleSwitch("EMERG_RELEASE_COVER", 4, 3009, 104, "Weapon System", "Emergency Release Button Cover")
MiG_15bis:defineIndicatorLight("N37_READY_L", 95, "Weapon System", "N37D Ready Indicator Light (red)")
MiG_15bis:defineIndicatorLight("NR23_TOP_READY_L", 93, "Weapon System", "NR23 TOP Ready Indicator Light (red)")
MiG_15bis:defineIndicatorLight("NR23_BOTTOM_READY_L", 94, "Weapon System", "NR23 BOTTOM Ready Indicator Light (red)")
MiG_15bis:defineIndicatorLight("TACTIC_RELEASE_L", 100, "Weapon System", "Tactical Release Indicator Light (red)")
MiG_15bis:defineIndicatorLight("L_BOMB_L", 98, "Weapon System", "Left BOMB Indicator Light (green)")
MiG_15bis:defineIndicatorLight("R_BOMB_L", 99, "Weapon System", "Right BOMB Indicator Light (green)")

-- Stick buttons
MiG_15bis:definePushButton("N37_FIRE", 4, 3001, 193, "Stick Buttons", "N-37D Cannon Fire Button")
MiG_15bis:definePushButton("WEAPON_RELEASE", 4, 3003, 195, "Stick Buttons", "Weapon Release Button")
MiG_15bis:defineToggleSwitch("GUN_SAFE", 4, 3010, 196, "Stick Buttons", "Guns Safety Cover")

-- ASP-3N Gunsight
MiG_15bis:defineToggleSwitch("ASP3_MODE", 26, 3003, 101, "ASP3N Gunsight", "ASP-3N Gunsight Mode")
MiG_15bis:defineToggleSwitch("ASP3_MASK_LEVER", 26, 3011, 106, "ASP3N Gunsight", "ASP-3N Gunsight Fixed Reticle Mask Lever")
MiG_15bis:definePotentiometer("ASP3_WINGSPAN_ADJ", 26, 3001, 103, { -0.5, 1 }, "ASP3N Gunsight", "ASP-3N Gunsight Target Wingspan Adjustment Dial")
MiG_15bis:definePotentiometer("ASP3_BRIGHT", 26, 3004, 102, { 0, 1 }, "ASP3N Gunsight", "ASP-3N Gunsight Brightness Knob")
MiG_15bis:definePotentiometer("ASP3_DIST", 26, 3002, 201, { 0, 1 }, "ASP3N Gunsight", "ASP-3N Gunsight Target Distance Knob")
MiG_15bis:defineToggleSwitch("ASP3_COLOR", 26, 3012, 105, "ASP3N Gunsight", "ASP-3N Gunsight Color Filter")
MiG_15bis:defineFloat("ASP3_RANGE", 245, { 0, 1 }, "ASP3N Gunsight", "ASP-3N Gunsight Range")

-- ARC-5 radio compass
MiG_15bis:definePotentiometer("ARC5_VOL", 29, 3001, 180, { 0, 1 }, "ARC5", "ARC-5 Audio Volume Knob")
MiG_15bis:defineTumb("ARC5_BAND_SW", 29, 3004, 177, 0.5, { 0, 1 }, nil, false, "ARC5", "ARC-5 Frequency Band Switch")
MiG_15bis:defineTumb("ARC5_SELECT", 29, 3003, 174, 0.1, { 0, 0.4 }, nil, false, "ARC5", "ARC-5 Function Selector Switch")
MiG_15bis:define3PosTumb("ARC5_LOOP", 29, 3006, 178, "ARC5", "ARC-5 LOOP L-R Switch")
MiG_15bis:definePotentiometer("ARC5_TUNE_CRANK", 29, 3005, 175, { 0, 1 }, "ARC5", "ARC-5 Tuning Crank")
MiG_15bis:definePotentiometer("ARC5_LIGHT", 29, 3007, 181, { 0, 1 }, "ARC5", "ARC-5 Scale Light Knob")
MiG_15bis:defineToggleSwitch("ARC5_TGL_TFL", 29, 3002, 173, "ARC5", "ARC-5 TLG-TLF Switch")
MiG_15bis:definePushButton("ARC5_CONTROL", 29, 3008, 182, "ARC5", "ARC-5 Take Control Button")
MiG_15bis:defineToggleSwitch("ARC5_NEAR_FAR_NBD", 29, 3009, 123, "ARC5", "ARC-5 Near/Far NDB Switch")
MiG_15bis:defineToggleSwitch("ARC5_NBD1", 29, 3010, 146, "ARC5", "ARC-5 NDB 1 Switch")
MiG_15bis:defineToggleSwitch("ARC5_NBD2", 29, 3011, 147, "ARC5", "ARC-5 NDB 2 Switch")
MiG_15bis:defineToggleSwitch("ARC5_NBD3", 29, 3012, 148, "ARC5", "ARC-5 NDB 3 Switch")
MiG_15bis:defineFloat("ARC5_BAND", 238, { 0, 0.4 }, "ARC5", "ARC-5 Band")
MiG_15bis:defineFloat("ARC5_TUNE_METER", 176, { 0, 1 }, "ARC5", "ARC-5 Tuning Meter")
MiG_15bis:defineFloat("ARC5_TUNE", 175, { 0, 1 }, "ARC5", "ARC-5 Tuning")
MiG_15bis:defineFloat("ARC5_BEARING", 38, { 0, 1 }, "ARC5", "ARC-5 Bearing")
MiG_15bis:defineFloat("ARC5_FREQ", 239, { 0.0, 1.0 }, "ARC5", "ARC-5 Freq Scale")
MiG_15bis:defineIndicatorLight("ARC5_PW_LIGHT", 183, "ARC5", "ARC-5 Power Light (green)")

-- RSI-6K Radio
MiG_15bis:defineRotary("RSI6K_VOL", 30, 3001, 126, "RSI6K", "RSI-6K Audio Volume Knob")
MiG_15bis:defineRotary("RSI6K_TRAS_FREQ", 30, 3004, 232, "RSI6K", "RSI-6K Wave Control Handle")
MiG_15bis:defineRotary("RSI6K_ANT_FREQ", 30, 3006, 230, "RSI6K", "RSI-6K Antenna Control Handle")
MiG_15bis:defineRotary("RSI6K_TRAS_FREQ_FIX", 30, 3006, 233, "RSI6K", "RSI-6K Wave Control Handle")
MiG_15bis:defineRotary("RSI6K_ANT_FREQ_FIX", 30, 3007, 231, "RSI6K", "RSI-6K Antenna Control Handle")
MiG_15bis:defineRotary("RSI6K_RECEIVE_FREQ", 30, 3003, 128, "RSI6K", "RSI-6K Receiver Tuning Knob")
MiG_15bis:defineToggleSwitch("RSI6K_RECEIVE", 30, 3008, 140, "RSI6K", "RSI-6K Receive/ARC Switch")
MiG_15bis:defineToggleSwitch("RSI6K_FORCE", 30, 3009, 240, "RSI6K", "RSI-6K Forced Mode Switch")
MiG_15bis:definePushButton("RSI6K_MIC", 30, 3002, 202, "RSI6K", "Microphone Button")
MiG_15bis:defineFloat("RSI6K_ANT_POWER", 235, { 0, 1 }, "RSI6K", "RSI-6K Antenna Power")
MiG_15bis:defineFloat("RSI6K_RECEIVE_KNOB", 128, { 0, 1 }, "RSI6K", "RSI-6K Receiver Knob")
MiG_15bis:defineFloat("RSI6K_RECEIVE_IND", 127, { 0.036, 0.961 }, "RSI6K", "RSI-6K Receiver Ind")
MiG_15bis:defineFloat("RSI6K_RECEIVE_GAUGE", 144, { 0.026, 0.957 }, "RSI6K", "RSI-6K Receiver Gauge")

-- Instruments
MiG_15bis:defineFloat("VARIOMETER", 14, { 0.0, 1.0 }, "Gauges", "Variometer")
MiG_15bis:defineFloat("ALT_KM", 28, { 0, 1 }, "Gauges", "Altimeter km")
MiG_15bis:defineFloat("ALT_M", 29, { 0, 1 }, "Gauges", "Altimeter km")
MiG_15bis:defineFloat("ALT_PRESS", 31, { -0.0535, 1.0 }, "Gauges", "Altimeter Pressure")
MiG_15bis:defineFloat("IAS", 4, { 0, 1 }, "Gauges", "IAS")
MiG_15bis:defineFloat("TAS", 5, { 0, 1 }, "Gauges", "TAS")
MiG_15bis:defineFloat("MACH", 27, { 0.12, 1.0 }, "Gauges", "Mach")
MiG_15bis:defineFloat("CANOPY_AIR_VALVE", 188, { 0, 1 }, "Gauges", "Canopy Air Valve Indication")
MiG_15bis:defineFloat("COCKPIT_ALT", 39, { 0.008, 1.0 }, "Gauges", "Cockpit Altitude")
MiG_15bis:defineFloat("PRESS_DIFF", 40, { 0.0, 1.0 }, "Gauges", "Pressure Difference")
MiG_15bis:defineFloat("ENG_TACHO", 42, { 0, 1 }, "Gauges", "Engine Tachometer")
MiG_15bis:defineFloat("ENG_TEMP", 41, { 0, 1 }, "Gauges", "Engine Temperature")
MiG_15bis:defineFloat("OIL_TEMP", 45, { 0, 1 }, "Gauges", "Oil Temperature")
MiG_15bis:defineFloat("OIL_PRESS", 44, { 0, 1 }, "Gauges", "Oil Pressure")
MiG_15bis:defineFloat("ENG_FUEL_PRESS", 43, { 0, 1 }, "Gauges", "Engine Fuel Pressure")
MiG_15bis:defineFloat("FUEL_PRESS", 46, { 0, 1 }, "Gauges", "Fuel Pressure")
MiG_15bis:defineFloat("SBY_COMPASS_HDG", 3, { -1, 1 }, "Gauges", "Standby Compass Heading")
MiG_15bis:defineFloat("SBY_COMPASS_PITCH", 2, { -1, 1 }, "Gauges", "Standby Compass Pitch")
MiG_15bis:defineFloat("SBY_COMPASS_BANK", 1, { -1, 1 }, "Gauges", "Standby Compass Bank")

-- Warning, Caution and IndicatorLights
MiG_15bis:defineIndicatorLight("FIRE_TEST_LIGHT", 135, "Warning, Caution and IndicatorLights", "Fire Alarm Test Light (red)")
MiG_15bis:defineIndicatorLight("ISO_VALVE_LIGHT", 119, "Warning, Caution and IndicatorLights", "Isolating Valve Indicator Light (green)")
MiG_15bis:defineIndicatorLight("AIRBRAKE_LIGHT", 124, "Warning, Caution and IndicatorLights", "Airbrake Light (green)")
MiG_15bis:defineIndicatorLight("FUEL2_EMPTY_LIGHT", 50, "Warning, Caution and IndicatorLights", "Fuel Tank 2 Empty Warning Light (green)")
MiG_15bis:defineIndicatorLight("FUEL_LINE_LIGHT", 51, "Warning, Caution and IndicatorLights", "Fuel Line Warning Light (red)")
MiG_15bis:defineIndicatorLight("FUEL_WING_EMPTY_LIGHT", 52, "Warning, Caution and IndicatorLights", "Fuel Tank Wing Empty Warning Light (green)")
MiG_15bis:defineIndicatorLight("GEAR_WARN_LIGHT", 53, "Warning, Caution and IndicatorLights", "Landing Gear Warning Light (white)")
MiG_15bis:defineIndicatorLight("BEACON_ALARM_LIGHT", 54, "Warning, Caution and IndicatorLights", "Radio Beacon Alarm Light (red)")
MiG_15bis:defineIndicatorLight("FUEL_300_LIGHT", 56, "Warning, Caution and IndicatorLights", "Fuel 300L Warning Light (red)")
MiG_15bis:defineIndicatorLight("GEN_OFF_LIGHT", 57, "Warning, Caution and IndicatorLights", "Generator OFF Warning Light (red)")
MiG_15bis:defineIndicatorLight("ING_LIGHT", 58, "Warning, Caution and IndicatorLights", "Ingnition Warning Light (red)")
MiG_15bis:defineIndicatorLight("FLAPS_LIGHT", 59, "Warning, Caution and IndicatorLights", "Flaps Warning Light (green)")
MiG_15bis:defineIndicatorLight("L_GEAR_UP", 74, "Warning, Caution and IndicatorLights", "Left Gear UP Lamp (red)")
MiG_15bis:defineIndicatorLight("N_GEAR_UP", 76, "Warning, Caution and IndicatorLights", "Nose Gear UP Lamp (red)")
MiG_15bis:defineIndicatorLight("R_GEAR_UP", 78, "Warning, Caution and IndicatorLights", "Right Gear UP Lamp (red)")
MiG_15bis:defineIndicatorLight("L_GEAR_DOWN", 75, "Warning, Caution and IndicatorLights", "Left Gear DOWN Lamp (green)")
MiG_15bis:defineIndicatorLight("N_GEAR_DOWN", 77, "Warning, Caution and IndicatorLights", "Nose Gear DOWN Lamp (green)")
MiG_15bis:defineIndicatorLight("R_GEAR_DOWN", 79, "Warning, Caution and IndicatorLights", "Right Gear DOWN Lamp (green)")

--Externals
MiG_15bis:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_RIGHT", 183, "External Aircraft Model", "Right Speed Brake")

MiG_15bis:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_LEFT", 185, "External Aircraft Model", "Left Speed Brake")

MiG_15bis:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
MiG_15bis:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")

MiG_15bis:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
MiG_15bis:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
MiG_15bis:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

MiG_15bis:defineFloat("CANOPY_POS", 225, { 0, 1 }, "Cockpit Mech", "Canopy Position")

MiG_15bis:definePotentiometer("THROTTLE_FRICTION", 3, 3008, 204, { 0, 1 }, "Control System", "Throttle Friction Lever")

MiG_15bis:defineReadWriteRadio("RSI6K_RADIO", 30, 7, 3, 100, "RSI-6K Radio Transmitter")

return MiG_15bis
