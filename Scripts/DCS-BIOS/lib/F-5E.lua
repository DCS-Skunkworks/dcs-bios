BIOS.protocol.beginModule("F-5E", 0x7600)
BIOS.protocol.setExportModuleAircrafts({"F-5E-3"})


local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication


local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineElectricallyHeldSwitch = BIOS.util.defineElectricallyHeldSwitch
local defineFloat = BIOS.util.defineFloat
local define8BitFloat = BIOS.util.define8BitFloat

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 0.1, {0.0, 0.2}, nil, false, category, description)
end

-- Indicator Lights
defineIndicatorLight("L_GEN", 530, "Warning, Caution and IndicatorLights","L Generator Lamp")
defineIndicatorLight("CANOPY", 531, "Warning, Caution and IndicatorLights","Canopy Open")
defineIndicatorLight("R_GEN", 532, "Warning, Caution and IndicatorLights","R Generator Lamp")
defineIndicatorLight("UTIL_HYDRAULIC", 533, "Warning, Caution and IndicatorLights","Utility Hydr")
defineIndicatorLight("SPARE_1", 534, "Warning, Caution and IndicatorLights","Spare 1")
defineIndicatorLight("FLIGHT_HYDRAULIC", 535, "Warning, Caution and IndicatorLights","Flight Hydr")
defineIndicatorLight("EXT_TANKS", 536, "Warning, Caution and IndicatorLights","External Tanks Empty")
defineIndicatorLight("IFF", 537, "Warning, Caution and IndicatorLights","Iff")
defineIndicatorLight("OXYGEN", 538, "Warning, Caution and IndicatorLights","Oxygen")
defineIndicatorLight("LEFT_FUEL_LOW", 539, "Warning, Caution and IndicatorLights","Left Flow Indicator")
defineIndicatorLight("ENGINE_ANTI_ICE", 540, "Warning, Caution and IndicatorLights","Anti Ice")
defineIndicatorLight("RIGHT_FUEL_LOW", 541, "Warning, Caution and IndicatorLights","Right Flow Indicator")
defineIndicatorLight("L_FUEL_PRESS", 542, "Warning, Caution and IndicatorLights","L Fuel Press")
defineIndicatorLight("INS", 543, "Warning, Caution and IndicatorLights","Inertial Navigation System")
defineIndicatorLight("R_FUEL_PRESS", 544, "Warning, Caution and IndicatorLights","R Fuel Press")
defineIndicatorLight("AOA_FLAPS", 545, "Warning, Caution and IndicatorLights","AoA Flaps")
defineIndicatorLight("AIR_DATA_COMPUTER", 546, "Warning, Caution and IndicatorLights","Air Data Computer")
defineIndicatorLight("DIR_GYRO", 547, "Warning, Caution and IndicatorLights","Directional Gyroscope")
defineIndicatorLight("SPARE_2", 548, "Warning, Caution and IndicatorLights","Spare 2")
defineIndicatorLight("DC_OVERLOAD", 549, "Warning, Caution and IndicatorLights","DC Overload")
defineIndicatorLight("SPARE_3", 550, "Warning, Caution and IndicatorLights","Spare 3")
defineIndicatorLight("MC_LIGHT", 169, "Warning, Caution and IndicatorLights","MasterCaution Lamp")

-- Control System
defineToggleSwitch("YAW_DAMPER", 2, 3001, 323,"Control Interface" , "Yaw Damper Switch, YAW/OFF")
defineToggleSwitch("PITCH_DAMPER", 2, 3002, 322,"Control Interface" , "Pitch Damper Switch, PITCH/OFF")
definePotentiometer("RUDDER_TRIM", 2, 3003, 324, {-1, 1}, "Control Interface", "Rudder Trim Knob")
definePushButton("PITCH_DAMPER_CUT", 2, 3004, 132, "Control Interface" , "Pitch Damper Cutoff Switch")
define3PosTumb("FLAPS", 2, 3005, 116, "Control Interface", "Flaps Lever, EMER UP/THUMB SW/FULL")
define3PosTumb("A_FLAPS", 2, 3006, 115, "Control Interface", "Auto Flap System Thumb Switch, UP/FIXED/AUTO")
define3PosTumb("SPEED", 2, 3007, 101, "Control Interface", "Speed Brake Switch, OUT/OFF/IN")
defineToggleSwitch("RUDDER_T", 2, 3014, 278, "Control Interface" , "Rudder Pedal Adjust T-Handle, PULL/STOW")

-- Electric system
defineToggleSwitch("SW_BATTERY", 3, 3001, 387,"Electric" , "Battery Switch")
defineToggleSwitch("L_GENERATOR", 3, 3002, 388,"Electric" , "Generator Left")
defineToggleSwitch("R_GENERATOR", 3, 3004, 389,"Electric" , "Generator Right")
defineToggleSwitch("PITOT_HEATER", 3, 3006, 375,"Electric" , "Pitot Heater")
define3PosTumb("F_O2_SW", 3, 3007, 230, "Electric", "Fuel & Oxygen Switch, GAGE TEST/OFF/QTY CHECK")

-- Fuel System
defineToggleSwitch("L_SHUTOFF_S", 4, 3001, 360,"Fuel" , "Left Fuel Shutoff Switch, OPEN/CLOSED")
defineToggleSwitch("R_SHUTOFF_S", 4, 3002, 362,"Fuel" , "Right Fuel Shutoff Switch, OPEN/CLOSED")
defineToggleSwitch("EXT_PYLON_SW", 4, 3003, 378,"Fuel" , "Ext Fuel Pylons Switch, ON/OFF")
defineToggleSwitch("EXT_CENTER_SW", 4, 3004, 377,"Fuel" , "Ext Fuel Cl Switch, ON/OFF")
defineToggleSwitch("CROSSFEED", 4, 3005, 381,"Fuel" , "Crossfeed Switch, OPEN/CLOSED")
define3PosTumb("AUTOBAL", 4, 3006, 230, "Fuel", "Autobalance Switch, LEFT/NEUT/RIGHT")
defineToggleSwitch("L_BOOSTPUMP", 4, 3008, 380,"Fuel" , "Left Boost Pump Switch, ON/OFF")
defineToggleSwitch("R_BOOSTPUMP", 4, 3009, 382,"Fuel" , "Right Boost Pump Switch, ON/OFF")
defineToggleSwitch("L_SHUTOFF_C", 4, 3010, 359,"Fuel" , "Left Fuel Shutoff Switch Cover, OPEN/CLOSED")
defineToggleSwitch("R_SHUTOFF_C", 4, 3011, 361,"Fuel" , "Right Fuel Shutoff Switch Cover, OPEN/CLOSED")

-- Engines
definePushButton("L_START", 6, 3001, 357,"Engine Interface" , "Left Engine Start Button")
definePushButton("R_START", 6, 3002, 358,"Engine Interface" , "Right Engine Start Button")
defineToggleSwitch("INLET_HEATER", 6, 3003, 376,"Engine Interface" , "Engine Anti-Ice Switch, ENGINE/OFF")

-- Gear System
defineIndicatorLight("GW_LIGHT", 96, "Gear Interface","GearWarning")
defineIndicatorLight("NOSE_LIGHT", 54, "Gear Interface","Gear Nose-Green")
defineIndicatorLight("LEFT_LIGHT", 53, "Gear Interface","Gear Left-Green")
defineIndicatorLight("RIGHT_LIGHT", 55, "Gear Interface","Gear Right-Green")
defineToggleSwitch("LG_LEVER_SWITCH", 7, 3001, 83,"Gear Interface" , "Gear Lever")
definePushButton("LG_ALT_REL", 7, 3002, 95,"Gear Interface" , "Landing Gear Alternate Release Handle, Pull and Hold")
definePushButton("LG_DOWN_L", 7, 3003, 88,"Gear Interface" , "Landing Gear Downlock Override Button - Push and Hold")
definePushButton("NWS", 7, 3004, 131,"Gear Interface" , "Nosewheel Steering Button - Pull and Hold")
defineToggleSwitch("LG_ALT_RES", 7, 3005, 98,"Gear Interface" , "Landing Gear Alternate Release Reset Control, OFF/RESET")
defineToggleSwitch("NS_STRUCT", 7, 3006, 250,"Gear Interface" , "Nose Strut Switch, EXTEND/RETRACT")
definePushButton("LGF_SILENCE", 7, 3007, 87,"Gear Interface" , "Landing Gear And Flap Warning Silence Button")
definePushButton("LG_TEST", 7, 3008, 92,"Gear Interface" , "Left Landing Gear Test Lamp")
definePushButton("NG_TEST", 7, 3009, 93,"Gear Interface" , "Nose Landing Gear Test Lamp")
definePushButton("RG_TEST", 7, 3010, 94,"Gear Interface" , "Right Landing Gear Test Lamp")
definePushButton("HOOK", 7, 3014, 89,"Gear Interface" , "Arresting Hook Button")

-- Oxygen System
defineToggleSwitch("O2_LEVER", 8, 3001, 603,"O2 Interface" , "Oxygen Supply Lever, ON/OFF")
defineToggleSwitch("DILUTER_LEVER", 8, 3002, 602,"O2 Interface" , "Diluter Lever")
define3PosTumb("EMER_L", 8, 3003, 601, "O2 Interface", "Emergency Lever, EMERGENCY/NORMAL/TEST MASK")

-- EC System
define3PosTumb("CABIN_P_SW", 9, 3001, 371, "EC Interface", "Cabin Press Switch, DEFOG ONLY/NORMAL/RAM DUMP")
defineToggleSwitch("CABIN_P_C", 9, 3002, 370,"EC Interface" , "Cabin Press Switch Cover, OPEN/CLOSED")
defineMultipositionSwitch("CABIN_TEMP_SW", 9, 3003, 372, 3, 0.1,"EC Interface" ,"Cabin Temp Switch, AUTO/CENTER/MAN COLD/MAN HOT")
definePotentiometer("CABIN_TEMP", 9, 3004, 373, {-1, 1},"EC Interface" , "Cabin Temperature Knob")
definePotentiometer("CABIN_DEFOG", 9, 3005, 374, {0, 1},"EC Interface" , "Canopy Defog Knob")

-- Cockpit Mechanics
defineToggleSwitch("CANOPY_LEVER", 10, 3001, 712,"Cockpit" , "Canopy Handle, OPEN/CLOSE")
define3PosTumb("DRAG_CHUTE", 10, 3002, 91,"Cockpit" , "Chute Handle")
defineToggleSwitch("CANOPY_JETTISON", 10, 3005, 384,"Cockpit" , "Canopy Jettison T-Handle, PULL/PUSH")

--Mirrors

-- External Lights
definePotentiometer("NAV_LIGHTS", 11, 3001, 227, {0, 1},"External Lights" , "Nav Lights Knob")
definePotentiometer("FORMATION_LIGHTS", 11, 3002, 228, {0, 1},"External Lights" , "Formation Lights Knob")
defineToggleSwitch("BEACON", 11, 3003, 229,"External Lights" , "Beacon Light Switch")
defineToggleSwitch("LG_LIGHT", 11, 3004, 353,"External Lights" , "Landing & Taxi Light Switch, ON/OFF")

-- Internal Lights
defineToggleSwitch("PANEL_L_SW", 12, 3001, 46,"Internal Lights" , "AN/ASG-31 Sight Panel Light Button, ON/OFF")
defineToggleSwitch("COMPAS_L_SW", 12, 3002, 613,"Internal Lights" , "Magnetic Compass Light Switch, LIGHT/OFF")
definePotentiometer("FLOOD_LIGHTS", 12, 3003, 221, {0, 1},"Internal Lights" , "Flood Lights Knob")
definePotentiometer("FLIGHT_LIGHTS", 12, 3004, 222, {0, 1},"Internal Lights" , "Flight Instruments Lights Knob")
definePotentiometer("ENGINE_LIGHTS", 12, 3005, 223, {0, 1},"Internal Lights" , "Engine Instruments Lights Knob")
definePotentiometer("CONSOLE_LIGHTS", 12, 3006, 224, {0, 1},"Internal Lights" , "Console Lights Knob")
definePotentiometer("ARM_LIGHTS", 12, 3007, 363, {0, 1},"Internal Lights" , "Armament Panel Lights Knob")
definePushButton("WARN_T_SW", 12, 3008, 226,"Internal Lights" , "Warning Test Switch")
define3PosTumb("BRI_DIM_SW", 12, 3009, 225,"Internal Lights" , "Bright/Dim Switch, BRT/NEUT/DIM")
definePushButton("MC_RESET_BTN", 12, 3011, 172,"Internal Lights" , "Master Caution Button")

-- Countermeasures Dispensing System
defineTumb("CHAFF_MODE", 13, 3001, 400, 0.1, {0.0, 0.3}, nil, false, "CMDS", "Chaff Mode Selector, OFF/SINGLE/PRGM/MULT")
defineTumb("FLARE_MODE_SEL", 13, 3002, 404, 0.1, {0.0, 0.2}, nil, false, "CMDS", "Flare Mode Selector, OFF/SINGLE/PRGM")
defineToggleSwitch("FL_JETT_COVER", 13, 3003, 408,"CMDS" , "Flare Jettison Switch Cover, OPEN/CLOSED")
defineToggleSwitch("FL_JETT_SW", 13, 3004, 409,"CMDS" , "Flare Jettison Switch, OFF/UP")
definePushButton("CHAFF_COUNT", 13, 3005, 403,"CMDS" , "Chaff Counter Reset Button - Push to reset")
definePushButton("FL_COUNT", 13, 3006, 407,"CMDS" , "Flare Counter Reset Button - Push to reset")
definePushButton("FL_CHAFF_BT", 13, 3007, 117,"CMDS" , "Flare-Chaff Button - Push to dispense")

-- IFF
defineToggleSwitch("IFF4", 22, 3010, 208,"IFF" , "IFF MODE 4 Control Switch, ON/OUT")

-- Jettison System
defineToggleSwitch("EMER_JETT_COVER", 14, 3001, 364,"Jettison" , "Emergency All Jettison Button Cover, OPEN")
definePushButton("EMER_JETT_B", 14, 3002, 365,"Jettison" , "Emergency All Jettison Button - Push to jettison")
define3PosTumb("JETT_SW", 14, 3003, 367, "Jettison", "Select Jettison Switch, SELECT POSITION/OFF/ALL PYLONS")
definePushButton("JETT_B", 14, 3004, 366,"Jettison" , "Select Jettison Button - Push to jettison")

-- Weapons Control
defineToggleSwitch("ARMPOS1", 15, 3001, 346,"Weapons Control" , "Armament Position Selector - L WINGTIP, ON/OFF")
defineToggleSwitch("ARMPOS2", 15, 3002, 347,"Weapons Control" , "Armament Position Selector - L OUTBD, ON/OFF")
defineToggleSwitch("ARMPOS3", 15, 3003, 348,"Weapons Control" , "Armament Position Selector - L INBD, ON/OFF")
defineToggleSwitch("ARMPOS4", 15, 3004, 349,"Weapons Control" , "Armament Position Selector - CENTER, ON/OFF")
defineToggleSwitch("ARMPOS5", 15, 3005, 350,"Weapons Control" , "Armament Position Selector - R INBD, ON/OFF")
defineToggleSwitch("ARMPOS6", 15, 3006, 351,"Weapons Control" , "Armament Position Selector - R OUTBD, ON/OFF")
defineToggleSwitch("ARMPOS7", 15, 3007, 352,"Weapons Control" , "Armament Position Selector - R WINGTIP, ON/OFF")
define3PosTumb("INT_SW", 15, 3008, 340, "Weapons Control", "Interval Switch [sec], .06/.10/.14")
defineToggleSwitch("MASTER_ARM_GUARD", 15, 3010, 342,"Weapons Control" , "Master Arm Safe Guard")
define3PosTumb("MASTER_ARM", 15, 3011, 343,"Weapons Control" , "Master Arm Guns, GUNS MSL & CAMR/OFF/CAMR ONLY")
defineTumb("EXT_STORE", 15, 3012, 344, 0.1, {0.0, 0.3}, nil, false, "Weapons Control", "External Stores Selector RIPL/BOMB/SAFE/RKT DISP")
definePotentiometer("MISSILE_VOL", 15, 3015, 345, {0, 1}, "Weapons Control", "Missile Volume Knob")

-- AN/APQ-159 Radar Control Panel
defineTumb("RADAR_MODE", 17, 3005, 316, 0.1, {0.0, 0.3}, nil, false, "Radar", "Off/Stby/Oper/test")

-- RWR-IC
definePushButton("RWR_MODE", 19, 3001, 551,"RWR IC" , "RWR MODE Button")
definePushButton("RWR_SEARCH", 19, 3002, 554,"RWR IC" , "RWR SEARCH Button")
definePushButton("RWR_HAND", 19, 3003, 556,"RWR IC" , "RWR HANDOFF Button")
definePushButton("RWR_ALT", 19, 3004, 561,"RWR IC" , "RWR ALTITUDE Button")
definePushButton("RWR_T", 19, 3005, 564,"RWR IC" , "RWR T Button")
definePushButton("RWR_TEST", 19, 3006, 567,"RWR IC" , "RWR SYS TEST Button")
definePushButton("RWR_SHIP", 19, 3007, 570,"RWR IC" , "RWR UNKNOWN SHIP Button")
definePushButton("RWR_PWR", 19, 3008, 575,"RWR IC" , "RWR POWER Button")
definePushButton("RWR_LAUNCH", 19, 3009, 559,"RWR IC" , "RWR LAUNCH Button")
definePushButton("RWR_ACT", 19, 3010, 573,"RWR IC" , "RWR ACT/PWR Button")
definePotentiometer("RWR_DIM", 19, 3011, 578, {0, 1}, "RWR IC", "RWR DIM Knob")
definePotentiometer("RWR_VOL", 19, 3012, 577, {0, 1}, "RWR IC", "RWR AUDIO Knob")

-- AN/ALR-87 RWR
definePotentiometer("RWR_INT", 20, 3001, 140, {0, 1}, "AN ALR87", "RWR INT Knob")

-- Instruments --------------------------
defineFloat("TRIM_INDICATOR", 52, {1.0, 0.0, -0.1}, "Gauges", "Trim Position")
defineFloat("FUELQUANTITY_L", 22, {0.0, 1.0}, "Gauges", "Fuel Quantity Left")
defineFloat("FUELQUANTITY_R", 23, {0.0, 1.0}, "Gauges", "Fuel Quantity Right")
defineFloat("O2QUANTITY", 390, {0.0, 1.0}, "Gauges", "O2 Quantity")
defineFloat("O2FLOWINDICATOR", 600, {0.0, 1.0}, "Gauges", "O2 Flow Blinker")
defineFloat("O2FLOWPRESSURE", 604, {0.0, 0.5, 1.0}, "Gauges", "O2 FlowPressure")

-- Accelerometer
definePushButton("ACC", 27, 3001, 904,"Accelerometer" , "Accelerometer - Push to set")

-- AirSpeed/Mach Indicator
definePotentiometer("IAS_SET", 28, 3001, 180, {0, 1}, "AirSpeed Indicator", "Index Setting Pointer Knob")

-- Altimeter AAU-34/A
defineRotary("ALT_SET_PRESSURE", 31, 3001, 62, "Altimeter", "Altimeter Zero Setting Knob")

-- Attitude Indicator ARU-20/A
definePotentiometer("AI_PITCH_TRIM", 32, 3001, 150, {0, 1}, "Attitude Indicator", "AI Pitch Trim Knob")

-- Horizontal Situation Indicator
defineVariableStepTumb("HSI_HDG_KNOB", 33, 3001, 271, 1.0, "HSI", "HSI Heading Set Knob")
defineVariableStepTumb("HSI_CRS_KNOB", 33, 3002, 272, 1.0, "HSI", "HSI Course Set Knob")

-- Clock
definePushButton("ELAP_TIME", 35, 3003, 512,"Clock" , "ABU-11 Clock Elapsed Time Knob")

--UHF Radio AN/ARC-164
definePushButton("UHF_TONE_BT", 23, 3001, 310,"UHF Radio" , "UHF Radio Tone Button")
defineToggleSwitch("UHF_SQUELCH_SW", 23, 3002, 308,"UHF Radio" , "AUHF Radio Squelch Switch, ON/OFF")
defineTumb("UHF_FUNC", 23, 3003, 311, 0.1, {0.0, 0.3}, nil, false,"UHF Radio" , "UHF Radio Function Selector Switch, OFF/MAIN/BOTH/ADF")
defineTumb("UHF_FREQ", 23, 3004, 307, 0.1, {0.0, 0.2}, nil, false,"UHF Radio" , "UHF Radio Frequency Mode Selector Switch, MANUAL/PRESET/GUARD")
defineTumb("UHF_PRE", 23, 3005, 300, 0.05, {0.0, 1.0}, nil, false,"UHF Radio" , "UHF Radio Preset Channel Selector Knob")
defineTumb("UHF_100", 23, 3006, 327, 0.1, {0.0, 0.3}, nil, false,"UHF Radio" , "UHF Radio 100 MHz Frequency Selector Knob")
defineTumb("UHF_10", 23, 3007, 328, 0.1, {0.0, 1.0}, nil, false,"UHF Radio" , "UHF Radio 10 MHz Frequency Selector Knob")
defineTumb("UHF_1", 23, 3008, 329, 0.1, {0.0, 1.0}, nil, false,"UHF Radio" , "UHF Radio 1 MHz Frequency Selector Knob")
defineTumb("UHF_01", 23, 3009, 330, 0.1, {0.0, 1.0}, nil, false,"UHF Radio" , "UHF Radio 0.1 MHz Frequency Selector Knob")
defineTumb("UHF_0025", 23, 3010, 331, 0.25, {0.0, 1.0}, nil, false,"UHF Radio" , "UHF Radio 0.025 MHz Frequency Selector Knob")
definePotentiometer("UHF_VOL", 23, 3011, 309, {0, 1}, "UHF Radio", "UHF Radio Volume Knob")
define3PosTumb("UHF_ANT", 23, 3012, 336, "UHF Radio", "UHF Radio Antenna Selector Switch, UPPER/AUTO/LOWER")
definePushButton("UHF_MIC_BT", 23, 3013, 135,"UHF Radio" , "UHF Radio Microphone Button")
defineToggleSwitch("UHF_DOOR", 23, 3014, 335,"UHF Radio" , "Hinged Access Door, OPEN/CLOSE")
definePushButton("UHF_PRE_SET", 23, 3015, 314,"UHF Radio" , "UHF Preset Channel Set Button")

--TACAN
defineIndicatorLight("TACAN_TEST", 260, "TACAN Panel", "TACAN Test Indicator Light")
defineFixedStepTumb("TACAN_10", 41, 3001, 256, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Left Channel Selector")
defineFixedStepTumb("TACAN_1", 41, 3002, 257, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Right Channel Selector")
defineToggleSwitch("TACAN_XY", 41, 3003, 266, "TACAN Panel", "TACAN Channel X/Y Toggle")
defineMultipositionSwitch("TACAN_MODE", 41, 3004, 262, 4, 0.1,"TACAN Panel", "TACAN Mode Dial")
definePotentiometer("TACAN_VOL", 41, 3005, 261, {0, 1}, "TACAN Panel", "TACAN Signal Volume")
definePushButton("TACAN_HSI", 41, 3006, 259,"TACAN Panel" , "TACAN Signal on HSI Test Button")

BIOS.protocol.endModule()