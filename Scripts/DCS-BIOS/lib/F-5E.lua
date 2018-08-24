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
defineToggleSwitch("YAW_DAMPER", 7, 3017, 323,"Control" , "Yaw Damper Switch, YAW/OFF")
defineToggleSwitch("PITCH_DAMPER", 7, 3017, 322,"Control" , "Pitch Damper Switch, PITCH/OFF")

-- Electric system
defineToggleSwitch("SW_BATTERY", 3, 3001, 387,"Electric" , "Battery Switch")
defineToggleSwitch("L_GENERATOR", 3, 3002, 388,"Electric" , "Generator Left")
defineToggleSwitch("R_GENERATOR", 3, 3003, 389,"Electric" , "Generator Right")
defineToggleSwitch("PITOT_HEATER", 3, 3004, 375,"Electric" , "Pitot Heater")

-- Fuel System
defineToggleSwitch("L_BOOSTPUMP", 5, 3001, 380,"Fuel" , "Left Boost Pump Switch, ON/OFF")
defineToggleSwitch("R_BOOSTPUMP", 5, 3002, 382,"Fuel" , "Right Boost Pump Switch, ON/OFF")

-- Engines
defineToggleSwitch("INLET_HEATER", 6, 3006, 376,"Engine" , "Engine Anti-Ice Switch, ENGINE/OFF")

-- Gear System
defineIndicatorLight("GW_LIGHT", 96, "Gear","GearWarning")
defineIndicatorLight("NOSE_LIGHT", 54, "Gear","Gear Nose-Green")
defineIndicatorLight("LEFT_LIGHT", 53, "Gear","Gear Left-Green")
defineIndicatorLight("RIGHT_LIGHT", 55, "Gear","Gear Right-Green")
defineToggleSwitch("LG_LEVER_SWITCH", 7, 3001, 83,"Gear" , "Gear Lever")
defineToggleSwitch("NS_STRUCT", 7, 3017, 250,"Gear" , "Nose Strut Switch, EXTEND/RETRACT")

-- Oxygen System
-- EC System

-- Cockpit Mechanics
defineToggleSwitch("CANOPY_LEVER", 10, 3001, 712,"Cockpit" , "Canopy Handle, OPEN/CLOSE")
defineToggleSwitch("CANOPY_JETTISON", 10, 3002, 384,"Cockpit" , "Canopy Jettison T-Handle, PULL/PUSH")
definePushButton("DRAG_CHUTE", 10, 3002, 91,"Cockpit" , "Chute Handle")

--Mirrors

-- External Lights
defineToggleSwitch("LG_LIGHT", 11, 3010, 353,"Ext Light" , "Landing & Taxi Light Switch, ON/OFF")
defineToggleSwitch("BEACON", 11, 3010, 229,"Ext Light" , "Beacon Light Switch")

-- Internal Lights
definePushButton("MC_RESET_BTN", 12, 3011, 172,"Int Light" , "Master Caution Button")

-- Countermeasures Dispensing System
-- IFF
-- Jettison System

-- Weapons Control
defineToggleSwitch("MASTER_ARM", 3, 3001, 343,"Weapon" , "Master Arm Guns - Off - CAMR")
defineToggleSwitch("ARMPOS1", 3, 3002, 346,"Weapon" , "Armament Position Selector - L WINGTIP, ON/OFF")
defineToggleSwitch("ARMPOS2", 3, 3003, 347,"Weapon" , "Armament Position Selector - L OUTBD, ON/OFF")
defineToggleSwitch("ARMPOS3", 3, 3004, 348,"Weapon" , "Armament Position Selector - L INBD, ON/OFF")
defineToggleSwitch("ARMPOS4", 3, 3005, 349,"Weapon" , "Armament Position Selector - CENTER, ON/OFF")
defineToggleSwitch("ARMPOS5", 3, 3006, 350,"Weapon" , "Armament Position Selector - R INBD, ON/OFF")
defineToggleSwitch("ARMPOS6", 3, 3007, 351,"Weapon" , "Armament Position Selector - R OUTBD, ON/OFF")
defineToggleSwitch("ARMPOS7", 3, 3008, 352,"Weapon" , "Armament Position Selector - R WINGTIP, ON/OFF")
defineToggleSwitch("MASTER_ARM_GUARD", 15, 3010, 342,"Weapon" , "Master Arm Safe Guard")
defineTumb("EXT_STORE", 3, 3018, 344, 0.1, {0.0, 0.3}, nil, false, "Weapon", "External Stores Selector RIPL/BOMB/SAFE/RKT DISP")

-- AN/APQ-159 Radar Control Panel
defineTumb("RADAR_MODE", 17, 3002, 316, 0.1, {0.0, 0.3}, nil, false, "Radar", "Off/Stby/Oper/test")

-- Instruments --------------------------
defineFloat("TRIM_INDICATOR", 52, {1.0, 0.0, -0.1}, "INSTRUMENTS", "TRIM_POSITION")

-- Altimeter AAU-34/A
defineRotary("ALT_SET_PRESSURE", 35, 3001, 62, "Altimeter", "Altimeter Zero Setting Knob")

-- Horizontal Situation Indicator
defineVariableStepTumb("HSI_CRS_KNOB", 33, 3001, 272, 1.0, "HSI", "HSI Course Set Knob")
defineVariableStepTumb("HSI_HDG_KNOB", 33, 3002, 271, 1.0, "HSI", "HSI Heading Set Knob")

--TACAN
defineIndicatorLight("TACAN_TEST", 260, "TACAN Panel", "TACAN Test Indicator Light")
defineFixedStepTumb("TACAN_10", 41, 3001, 256, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Left Channel Selector")
defineFixedStepTumb("TACAN_1", 41, 3002, 257, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Right Channel Selector")
defineFixedStepTumb("BARO_SET", 41, 3002, 257, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Right Channel Selector")
defineToggleSwitch("TACAN_XY", 41, 3003, 266, "TACAN Panel", "TACAN Channel X/Y Toggle")
defineMultipositionSwitch("TACAN_MODE", 41, 3006, 262, 4, 0.1,"TACAN Panel", "TACAN Mode Dial")
definePotentiometer("TACAN_VOL", 41, 3005, 261, {0, 1}, "TACAN Panel", "TACAN Signal Volume")

BIOS.protocol.endModule()