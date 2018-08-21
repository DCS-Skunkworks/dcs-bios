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
defineIndicatorLight("TACAN_TEST", 260, "TACAN Panel", "TACAN Test Indicator Light")
defineIndicatorLight("GW_LIGHT", 96, "CautionLights","GearWarning")
defineIndicatorLight("NOSE_LIGHT", 54, "Green Light","Gear Nose")
defineIndicatorLight("LEFT_LIGHT", 53, "Green Light","Gear Left")
defineIndicatorLight("RIGHT_LIGHT", 55, "Green Light","Gear Right")
defineIndicatorLight("MC_LIGHT", 169, "Warning, Caution and IndicatorLights","MasterCaution Lamp")
definePushButton("MC_RESET_BTN", 12, 3011, 172,"Warning, Caution and IndicatorLights" , "MasterCaution reset")
definePushButton("DRAG_CHUTE", 10, 3002, 91,"Brake System" , "Chute Handle")
defineToggleSwitch("LG_LEVER_SWITCH", 7, 3001, 83,"Gear Interface" , "Gear Lever")
defineToggleSwitch("MASTER_ARM", 15, 3001, 3011,"Switch" , "Master Arm")
defineToggleSwitch("MASTER_ARM_GUARD", 15, 3010, 342,"Switch" , "Master Arm Safe Guard")
defineToggleSwitch("L_GENERATOR", 3, 3002, 338,"Electric" , "Gen Left")
defineToggleSwitch("SW_BATTERY", 3, 3001, 387,"Electric" , "Battery")
defineToggleSwitch("R_GENERATOR", 3, 3004, 339,"Electric" , "Gen Right")
defineToggleSwitch("LG_LIGHT", 11, 3010, 353,"Light" , "Landing Light")
defineToggleSwitch("NS_STRUCT", 7, 3017, 250,"System" , "Landing Gear")
defineToggleSwitch("PITOT_HEATER", 3, 3006, 375,"Electric" , "Pitot Heater")
defineToggleSwitch("INLET_HEATER", 6, 3006, 376,"Engine Interface" , "Heater")
defineToggleSwitch("CANOPY_LEVER", 10, 3001, 712,"Cockpit Interface" , "Lever")
--defineMultipositionSwitch("RADAR_MODE", 17, 3002, 316, 4, 0.1, "Radar", "Off/Stby/Oper/test")--
--defineTumb("RADAR_MODE", 17, 3002, 316, 0.1, {0.0, 0.3}, nil, false, "Radar", "Off/Stby/Oper/test")
defineRotary("ALT_SET_PRESSURE", 35, 3001, 62, "Altimeter", "Set Pressure")
definePotentiometer("TACAN_VOL", 41, 3005, 261, {0, 1}, "TACAN Panel", "TACAN Signal Volume")
defineFloat("TRIM_INDICATOR", 52, {1.0, 0.0, -0.1}, "INSTRUMENTS", "TRIM_POSITION")
defineVariableStepTumb("HSI_CRS_KNOB", 33, 3002, 272, 1.0, "HSI", "Course Select Knob")
defineFixedStepTumb("TACAN_10", 41, 3001, 256, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Left Channel Selector")
defineFixedStepTumb("TACAN_1", 41, 3002, 257, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Right Channel Selector")
--defineFixedStepTumb("HSI_COURSE", 33, 3002, 272, 0, 0.05818, false, true, "Hsi Panel", "Course Setting")
defineFixedStepTumb("BARO_SET", 41, 3002, 257, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Right Channel Selector")
defineToggleSwitch("TACAN_XY", 41, 3003, 266, "TACAN Panel", "TACAN Channel X/Y Toggle")
defineMultipositionSwitch("TACAN_MODE", 41, 3006, 262, 4, 0.1,"TACAN Panel", "TACAN Mode Dial")



BIOS.protocol.endModule()