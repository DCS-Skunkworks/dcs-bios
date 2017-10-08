BIOS.protocol.beginModule("L-39ZA", 0x3200)
BIOS.protocol.setExportModuleAircrafts({"L-39ZA"})



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
-----------------------------------L-39 GAUGES--------------------------------------------------
-- Barometric altimeter VD-20
defineFloat("VD20", 52, {0, 1}, "instruments l-39","Altimeter KM")-- Kilometers gauge on VD-20



-- Radar altimeter RV-5
defineFloat("RV_5_RALT", 58, {0, 1}, "instruments l-39","Radio Altimeter")



-- VARIOMETER
defineFloat("Variometer", 74, {-1,1}, "instruments l-39","Variometer")
defineFloat("Variometer_turn", 75, {-1, 1}, "instruments l-39","Roll indication variometre")
defineFloat("Variometer_sideslip", 76, {-1, 1},"instruments l-39","Sideslip Variometer")


-- ARTI HORIZ (KPP)
defineFloat("KPP_1273K_roll", 38, {-1, 1}, "instruments l-39","KPP Roll")
defineFloat("KPP_1273_pitch", 31, {-1, 1}, "instruments l-39","KPP Pitch")
defineFloat("KPP_1273K_sideslip", 40, {-1, 1}, "instruments l-39","Sideslip KPP")
--defineFloat("KPP_Course_Deviation_Bar", 35, {-1.0, 1.0}, "instruments l-39","SDU DEV CAP KPP") (need to verify)
--defineFloat("KPP_Alt_Deviation_Bar", 34, {-1.0, 1.0}, "instruments l-39","SDU DEV H KPP") (need to verify)
defineFloat("KPP_Glide_Beacon", 36, {0, 1}, "instruments l-39","Glide KPP")--GLIDE beacon on KPP
defineFloat("KPP_Localizer_Beacon", 37, {0, 1}, "instruments l-39","LOC KPP")-- LOC beacon on KPP
-- defineFloat("KPP_Arretir", 29, {0.0, 1.0}, "instruments l-39"," Arretir KPP") (need to verify)
defineFloat("KPP_SDU_Roll_Fwd", 32, {-1, 1}, "instruments l-39","SDU Roll KPP")-- SDU roll indication on KPP
defineFloat("KPP_SDU_Pitch_Fwd", 33, {-1, 1}, "instruments l-39","SDU Pitch KPP")-- SDU pitch indicator on KPP



-- NPP (HSI)
defineFloat("HSI_heading", 41, {0, 1}, "instruments l-39","Heading indication")-- heading indication
defineFloat("HSI_commanded_course_needle", 42, {1.0, 0.0}, "instruments l-39","Commanded course Needle")
defineFloat("HSI_bearing_needle", 43, {0.0, 1.0}, "instruments l-39","Bearing Needle")
defineFloat("HSI_Course_Deviation_Bar", 47, {-0.8, 0.8}, "instruments l-39","LOC")
defineFloat("HSI_Alt_Deviation_Bar", 45, {-0.8, 0.8}, "instruments l-39","GLIDE")
defineFloat("HSI_Glide_Beacon", 46, {0, 1}, "instruments l-39","GLIDE HSI FLAG")-- GLIDE beacon
defineFloat("HSI_Localizer_Beacon", 44, {0, 1}, "instruments l-39","LOC HSI FLAG")-- LOC beacon



--RSBN
defineFloat("RSBN_Range_1", 64, {0, 1}, "instruments l-39","Range RSBN 1KM")-- range indication by 1 KM
defineFloat("RSBN_Range_10", 65, {0, 1}, "instruments l-39","Range RSBN 10KM")-- range indication by 10 KM
defineFloat("RSBN_Range_100", 66, {0, 1}, "instruments l-39","Range RSBN 100KM")-- range indication by 100 KM




--AIRSPEED AND MACH
defineFloat("IAS", 49, {0, 1}, "instruments l-39","V indicated")-- indicated air speed
defineFloat("TAS", 50, {0, 1}, "instruments l-39","V true")-- true air speed
defineFloat("MACH", 51, {0, 1}, "instruments l-39","Number of MACH")-- number of Mach



-- RKL-41
defineFloat("RKL_41_needle", 77, {0, 1}, "instruments l-39","RKL Indicator")



-- electric interface
defineFloat("Voltmeter", 92, {0,	1}, "instruments l-39","VOLTMETER")
defineFloat("Ampermeter", 93, {0,	1}, "instruments l-39","AMPERMETER")



-- oxygen interface
defineFloat("FwdOxygenPressure", 301, {0, 1}, "instruments l-39","Oxygene pressure")-- oxygene pressure indicator
defineFloat("FwdFlowBlinker", 302, {0,	1}, "instruments l-39","Breathing blikers")-- breathing blinkers



-- accelerometer
defineFloat("Acceleration", 86, {0,	1}, "instruments l-39","G indicator")-- G indicator



-- Cockpit pressure
defineFloat("CockpitAltFwd", 95, {0, 1}, "instruments l-39","Cockpit altitude")-- cabine altitude
defineFloat("PressDiffFwd", 96, {0,	1}, "instruments l-39","Differantial cockpit altitude")-- differantial cabine pressure



---Hydro Pressure
defineFloat("MainHydro_PRESS", 198, {0, 1}, "instruments l-39","Main hydrolic pressure")-- main hydrolic system pressure indicator
defineFloat("AuxHydro_PRESS", 200, {0, 1}, "instruments l-39","Emergency hydrolic pressure")-- aux hydrolic system pressure indicator
defineFloat("BrakeLMainHydro_PRESS", 98, {0, 1}, "instruments l-39","Left brake pressure")-- main hydrolic left brake pressure indicator
defineFloat("BrakeRMainHydro_PRESS", 99, {0, 1}, "instruments l-39","Right brake pressure")-- main hydrolic right brake pressure indicator
defineFloat("BrakeAuxHydro_PRESS", 100, {0, 1}, "instruments l-39","Emergency brakes pressure")-- aux hydrolic brakes system pressure indicator



-- Fuel 
defineFloat("Fuel_Quantity", 91, {0, 1}, "instruments l-39","Fuel Quantity")-- fuel quantity indicator
defineFloat("Fuel_Press", 81, {0, 1}, "instruments l-39","Fuel pressure")-- fuel pressure indicator


-- ENGINE
defineFloat("Fan_RPM", 85, {0, 1}, "instruments l-39","Low pressure compressor RPM")-- low pressure compressor rpm indicator
defineFloat("Compressor_RPM", 84, {0, 1}, "instruments l-39","High pressure compressor RPM")-- high pressure compressor rpm indicator
defineFloat("Engine_Temp", 90, {0, 1}, "instruments l-39","T4")-- turbine temperature indicator
defineFloat("EngineVibration", 94, {0, 1}, "instruments l-39","Vibrations indicator")-- engine vibrations indicator



-- OIL
defineFloat("Oil_Temp", 83, {0, 1}, "instruments l-39","Oil temperature")-- oil temperature indicator
defineFloat("Oil_Press", 82, {0, 1}, "instruments l-39","Oil pressure")-- oil pressure indicator

  
  
-- TRIM
defineFloat("PitchTrimInd", 247, {-1, 1}, "instruments l-39","Pitch trim indicator") -- pitch trim indicator

------------------------------------ L-39 Lights --------------------------------------------------------------------


--- Elec syst lamps
defineIndicatorLight("MRP_56_lamp", 18, "l-39 lamps","MRP 56")
defineIndicatorLight("MainGen_lamp", 6, "l-39 lamps","Main generator")
defineIndicatorLight("ReservGen_lamp", 6, "l-39 lamps","Reserve generator")
defineIndicatorLight("Inverter115_lamp", 12, "l-39 lamps","inverter 115v")
defineIndicatorLight("Inverter363_lamp", 16, "l-39 lamps","inverter 3x36v")
defineIndicatorLight("GroundPower_lamp", 316, "l-39 lamps","Ground power")

--- Flaps
defineIndicatorLight("FlapsUp_lamp", 278, "l-39 lamps","Flaps 0°")
defineIndicatorLight("FlapsTO_lamp", 279, "l-39 lamps","Flaps 25°")
defineIndicatorLight("FlapsDn_lamp", 280, "l-39lamps","Flaps 44°")

--- Air Brakes
defineIndicatorLight("AirBrakes_lamp", 117, "l-39 lamps","Airbrake")

--- Gears
defineIndicatorLight("GearDown_front_lamp", 113, "l-39 lamps","Front gear down")
defineIndicatorLight("GearDown_left_lamp", 112, "l-39 lamps","Left gear down")
defineIndicatorLight("GearDown_right_lamp", 114, "l-39 lamps","Right gear down")
defineIndicatorLight("GearUp_front_lamp", 110, "l-39 lamps","Front gear up")
defineIndicatorLight("GearUp_left_lamp", 109, "l-39 lamps","Left gear up")
defineIndicatorLight("GearUp_right_lamp", 111, "l-39 lamps","Right gear up")
defineIndicatorLight("ExtendGears_lamp", 115, "l-39 lamps","Gears in Transition")
defineIndicatorLight("DoorsOut_lamp", 116, "l-39 lamps","Doors out")

--- RSBN (HSI)
defineIndicatorLight("RSBN_Azim_Correction", 185, "l-39 lamps","RSBN correction AZIM")
defineIndicatorLight("RSBN_Range_Correction", 186, "l-39 lamps","RSBN correction D")

defineIndicatorLight("BreakdownFinished_lamp", 15, "l-39 lamps","BreakdownFinished_lamp")

defineIndicatorLight("defineIndicatorLight", 123, "l-39 lamps","GMK tilt")
defineIndicatorLight("defineIndicatorLight", 206, "l-39 lamps","GMK tilt PU-26")
defineIndicatorLight("HSI_Accordance", 19, "l-39 lamps","HSI ok")
---RSBN_Azim_Correct = create_default_lamp(359, controllers.RSBN_Azimuth_Correction)
---RSBN_Range_Correct = create_default_lamp(362, controllers.RSBN_Range_Correction)

--- RV-5
defineIndicatorLight("DangerAltitude_lamp", 2, "l-39 lamps","Dangerous Altitude")

--- Fuel and turbostarter
defineIndicatorLight("EmergFuelFwd_lamp", 27, "l-39 lamps","Emergency fuel system")
defineIndicatorLight("TurboStarter_lamp", 23, "l-39 lamps","Turbo starter")

defineIndicatorLight("FwdRemain150_lamp", 4, "l-39 lamps","Remain 150Kg")
defineIndicatorLight("FwdDoNotStart_lamp", 7, "l-39 lamps","Do not start")
defineIndicatorLight("FwdFuelFilter_lamp", 26, "l-39 lamps","Fuel Filter")
defineIndicatorLight("FwdWingTanks_lamp", 14, "l-39 lamps","Wing Tanks Empty")
if L_39ZA then 
defineIndicatorLight("FwdWingTanks_lamp", 13, "l-39 lamps","Wing Tanks Empty")
end


--- Trim
defineIndicatorLight("TrimmerRollNeutralFwd_lamp", 246, "l-39 lamps","Roll trim neutral")

--- MACH
defineIndicatorLight("MachMeterLampFwd", 3, "l-39 lamps","Over Mach")

--- Canopy
defineIndicatorLight("FwdCanopyNotClosed", 10, "l-39 lamps","Canopy not closed")

--- Pitot
defineIndicatorLight("LeftPitot_lamp", 556, "l-39 lamps","Pitot Left")
defineIndicatorLight("RightPitot_lamp", 557, "l-39 lamps","Pitot Right")

--- Vibrations
defineIndicatorLight("FwdVibration_lamp", 8, "l-39 lamps","High vibrations")

--- Fire
defineIndicatorLight("FwdFire_lamp", 1, "l-39 lamps","FIRE")

--- T°4 and Oil pressur
defineIndicatorLight("FwdEngineTemperature700_lamp", 28, "l-39 lamps","T4 700")
defineIndicatorLight("FwdEngineTemperature730_lamp", 24, "l-39 lamps","T4 730")
defineIndicatorLight("FwdEngineMinOilPressure_lamp", 20, "l-39 lamps","press oil mini")

--- Cockpit pressure & conditioning
defineIndicatorLight("FwdCockpitPressure_lamp", 11, "l-39 lamps","Cockpit overpress")
defineIndicatorLight("FwdConditioningClosed_lamp", 22, "l-39 lamps","Clim Off")
defineIndicatorLight("EmergConditioning_lamp", 17, "l-39 lamps","Clim secours")

--- Anti icing syst
defineIndicatorLight("FwdDefrost_lamp", 25, "l-39 lamps","Anti icing on")
defineIndicatorLight("FwdIce_lamp	", 21, "l-39 lamps","Icing Warn")
defineIndicatorLight("RIO_HeatingOk_lamp", 182, "l-39 lamps","RIO Heating On")

--- Hydrolics
defineIndicatorLight("FwdHydraulicPressureDrop_lamp", 5, "l-39 lamps","Hydro min press")

--- Master caution
defineIndicatorLight("FwdMasterDanger_lamp", 253, "l-39 lamps","SARTS")

--- Radio control
defineIndicatorLight("FwdRadioUnderControl_lamp", 562, "l-39 lamps","Control radio")



--Clickable Controls

defineToggleSwitch("BatterySw",  4,3001, 141,"electric system", "Accumulator Switch, ON/OFF")
defineToggleSwitch("MainGeneratorSw",  4,3002, 142,"electric system", "Main Generator Switch, ON/OFF")
defineToggleSwitch("EmergGeneratorSw",  4,3003, 143,"electric system", "EmergGeneratorSw")
defineToggleSwitch("NetSw",  4,3004, 502,"electric system", "NetSw")
defineToggleSwitch("FwdTurboSw",  4,3005, 315,"electric system", "FwdTurboSw")
defineToggleSwitch("FwdTurboSwCover",  4,3006, 314,"electric system", "FwdTurboSwCover")
defineToggleSwitch("AftTurboSw",  4,3007, 142,"electric system", "AftTurboSw")
defineToggleSwitch("AftTurboSwCover",  4,3008, 142,"electric system", "AftTurboSwCover")
defineToggleSwitch("StopTurboSw",  4,3009, 142,"electric system", "Main Generator Switch, ON/OFF")
defineToggleSwitch("StopTurboSwCover",  4,3010, 142,"electric system", "StopTurboSwCover")
defineToggleSwitch("FwdEngineSw",  4,3011, 142,"electric system", "FwdEngineSw")
defineToggleSwitch("FwdEngineSwCover",  4,3012, 142,"electric system", "FwdEngineSwCover")
defineToggleSwitch("AftEngineSw",  4,3013, 142,"electric system", "AftEngineSw")
defineToggleSwitch("AftEngineSwCover",  4,3014, 142,"electric system", "AftEngineSwCover")
defineToggleSwitch("FwdStopEngineSw",  4,3015, 142,"electric system", "FwdStopEngineSw")
defineToggleSwitch("FwdStopEngineSwCover",  4,3016, 142,"electric system", "FwdStopEngineSwCover")
defineToggleSwitch("AftStopEngineSw",  4,3017, 142,"electric system", "AftStopEngineSw")
defineToggleSwitch("AftStopEngineSwCover",  4,3018, 142,"electric system", "AftStopEngineSwCover")
defineToggleSwitch("EngineStartModeSw",  4,3019, 142,"electric system", "EngineStartModeSw")
defineToggleSwitch("EngineStartModeSwCover",  4,3020, 142,"electric system", "EngineStartModeSwCover, ON/OFF")
defineToggleSwitch("FwdEmergFuelSw",  4,3021, 142,"electric system", "FwdEmergFuelSw")
defineToggleSwitch("FwdEmergFuelSwCover",  4,3022, 142,"electric system", "FwdEmergFuelSwCover")
defineToggleSwitch("AftEmergFuelSw",  4,3023, 142,"electric system", "AftEmergFuelSw")
defineToggleSwitch("AftEmergFuelSwCover",  4,3024, 142,"AftEmergFuelSwCover")
defineToggleSwitch("CB_Engine",  4,3025, 142,"electric system", "CB_Engine")
defineToggleSwitch("CB_AGD_GMK",  4,3026, 142,"electric system", "CB_AGD_GMK")
defineToggleSwitch("CB_Converter1Sw",  4,3027, 142,"electric system", "CB_Converter1Sw")
defineToggleSwitch("CB_Converter2Sw",  4,3028, 142,"electric system", "CB_Converter2Sw")
defineToggleSwitch("CB_RTL",  4,3029, 142,"electric system", "CB_RTL")
defineToggleSwitch("CB_MRP_RV",  4,3030, 142,"electric system", "CB_MRP_RV")
defineToggleSwitch("CB_ISKRA",  4,3031, 142,"electric system", "CB_ISKRA")
defineToggleSwitch("CB_EMERG_SRO",  4,3032, 142,"electric system", "CB_EMERG_SRO")
defineToggleSwitch("CB_EMERG_ISKRA",  4,3033, 142,"electric system", "CB_EMERG_ISKRA")
defineToggleSwitch("CB_WingTanks",  4,3034, 142,"electric system", "CB_WingTanks")
defineToggleSwitch("CB_RIO",  4,3035, 142,"electric system", "CB_RIO")
defineToggleSwitch("CB_SDU",  4,3036, 142,"electric system", "CB_SDU")
defineToggleSwitch("CB_HeatingSensorAOA",  4,3037, 142,"electric system", "CB_HeatingSensorAOA")
defineToggleSwitch("CB_Weapon",  4,3038, 142,"electric system", "CB_Weapon")
defineToggleSwitch("CB_Tanks",  4,3039, 142,"electric system", "CB_Tanks")
defineToggleSwitch("CB_AirConditioning",  4,3040, 142,"electric system", "CB_AirConditioning")
defineToggleSwitch("CB_AntiIce",  4,3041, 142,"electric system", "CB_AntiIce")
defineToggleSwitch("CB_PVD_Left",  4,3042, 142,"electric system", "CB_PVD_Left")
defineToggleSwitch("CB_PVD_Right",  4,3043, 142,"electric system", "CB_PVD_Right")
defineToggleSwitch("CB_PT500C",  4,3044, 142,"electric system", "CB_PT500C")
defineToggleSwitch("CB_ARC",  4,3045, 142,"electric system", "CB_ARC")
defineToggleSwitch("CB_SRO",  4,3046, 142,"electric system", "CB_SRO")
defineToggleSwitch("CB_SeatHelmet",  4,3047, 142,"electric system", "CB_SeatHelmet")
defineToggleSwitch("CB_Gears",  4,3048, 142,"electric system", "CB_Gears")
defineToggleSwitch("CB_Control",  4,3049, 142,"electric system", "CB_Control")
defineToggleSwitch("CB_Signaling",  4,3050, 142,"electric system", "CB_Signaling")
defineToggleSwitch("CB_ANO",  4,3051, 142,"electric system", "CB_ANO")
defineToggleSwitch("CB_SpotlightLeft",  4,3052, 142,"electric system", "CB_SpotlightLeft")
defineToggleSwitch("CB_SpotlightRight",  4,3053, 142,"electric system", "CB_SpotlightRight")
defineToggleSwitch("CB_LightRed",  4,3054, 142,"electric system", "CB_LightRed")
defineToggleSwitch("CB_LightWhite",  4,3055 142,"electric system", "CB_LightWhite")
defineToggleSwitch("CB_StartPanel",  4,3056, 142,"electric system", "CB_StartPanel")
defineToggleSwitch("CB_BoosterPump",  4,3057, 142,"electric system", "CB_BoosterPump")
defineToggleSwitch("CB_Ignition1",  4,3058, 142,"electric system", "CB_Ignition1")
defineToggleSwitch("CB_Ignition2",  4,3059, 142,"electric system", "CB_Ignition2")
defineToggleSwitch("CB_EngineInstruments",  4,3060, 142,"electric system", "CB_EngineInstruments")
defineToggleSwitch("CB_Fire",  4,3061, 142,"electric system", "CB_Fire")
defineToggleSwitch("CB_EmergJettison",  4,3062, 142,"electric system", "CB_EmergJettison")
defineToggleSwitch("CB_SARPP",  4,3063, 142,"electric system", "CB_SARPP")
defineToggleSwitch("CB_Seat_Instructor",  4,3064, 142,"electric system", "CB_Seat_Instructor")
defineToggleSwitch("CB_Signal_Instructor",  4,3065, 142,"electric system", "CB_Signal_Instructor")
defineToggleSwitch("CB_Weapon_Instructor",  4,3066, 142,"electric system", "CB_Weapon_Instructor")
defineToggleSwitch("CB_Ground_SPU",  4,3067, 142,"electric system", "CB_Ground_SPU")
defineToggleSwitch("LeftPitotHeatingOn",  4,3068, 142,"electric system", "LeftPitotHeatingOn")
defineToggleSwitch("LeftPitotHeatingOff",  4,3069, 142,"electric system", "LeftPitotHeatingOff")
defineToggleSwitch("RightPitotHeatingOn",  4,3070, 142,"electric system", "RightPitotHeatingOn")
defineToggleSwitch("RightPitotHeatingOff",  4,3071, 142,"electric system", "RightPitotHeatingOff")
defineToggleSwitch("EmergencyEngineInstrumentsPower",  4,3072, 142,"electric system", "EmergencyEngineInstrumentsPower")



  
  
BIOS.protocol.endModule()