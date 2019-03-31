BIOS.protocol.beginModule("L-39ZA", 0x3200)
BIOS.protocol.setExportModuleAircrafts({"L-39C", "L-39ZA"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitc


----- 2do



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
if L-39ZA then 
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
defineIndicatorLight("FwdIce_lamp", 21, "l-39 lamps","Icing Warn")
defineIndicatorLight("RIO_HeatingOk_lamp", 182, "l-39 lamps","RIO Heating On")

--- Hydrolics
defineIndicatorLight("FwdHydraulicPressureDrop_lamp", 5, "l-39 lamps","Hydro min press")

--- Master caution
defineIndicatorLight("FwdMasterDanger_lamp", 253, "l-39 lamps","SARTS")

--- Radio control
defineIndicatorLight("FwdRadioUnderControl_lamp", 562, "l-39 lamps","Control radio")

---2 do end


------------------------------------ L-39 Clickable Controls --------------------------------------------------------------------

-- Electric System
defineToggleSwitch("BATTERY_SW",  4,3001, 141,"Electric System", "Accumulator Switch, ON/OFF")
defineToggleSwitch("MAIN_GEN_SW",  4,3002, 142,"Electric System", "Main Generator Switch, ON/OFF")
defineToggleSwitch("EMERG_GEN_SW",  4,3003, 143,"Electric System", "Emergency Generator Switch, ON/OFF")
defineToggleSwitch("NET_SW",  4,3004, 502,"Electric System", "Net Switch, ON/OFF")
defineToggleSwitch("EMERG_ENG_INST_PW",  4,3072, 169,"Electric System", "Emergency Engine Instruments Power Switch, ON/OFF")
definePushButton("FWD_TURBO_BTN",  4,3005, 315,"Electric System", "Turbo Button")
defineToggleSwitch("FWD_TURBO_SW_COVER",  4,3006, 314,"Electric System", "Turbo Button Cover, Open/Close")
----- 2do
defineToggleSwitch("AftTurboSw",  4,3007, 142,"Electric System", "AftTurboSw")
defineToggleSwitch("AftTurboSwCover",  4,3008, 142,"Electric System", "AftTurboSwCover")
defineToggleSwitch("StopTurboSw",  4,3009, 142,"Electric System", "Main Generator Switch, ON/OFF")
defineToggleSwitch("StopTurboSwCover",  4,3010, 142,"Electric System", "StopTurboSwCover")
defineToggleSwitch("FwdEngineSw",  4,3011, 142,"Electric System", "FwdEngineSw")
defineToggleSwitch("FwdEngineSwCover",  4,3012, 142,"Electric System", "FwdEngineSwCover")
defineToggleSwitch("AftEngineSw",  4,3013, 142,"Electric System", "AftEngineSw")
defineToggleSwitch("AftEngineSwCover",  4,3014, 142,"Electric System", "AftEngineSwCover")
defineToggleSwitch("FwdStopEngineSw",  4,3015, 142,"Electric System", "FwdStopEngineSw")
defineToggleSwitch("FwdStopEngineSwCover",  4,3016, 142,"Electric System", "FwdStopEngineSwCover")
defineToggleSwitch("AftStopEngineSw",  4,3017, 142,"Electric System", "AftStopEngineSw")
defineToggleSwitch("AftStopEngineSwCover",  4,3018, 142,"Electric System", "AftStopEngineSwCover")
defineToggleSwitch("EngineStartModeSw",  4,3019, 142,"Electric System", "EngineStartModeSw")
defineToggleSwitch("EngineStartModeSwCover",  4,3020, 142,"Electric System", "EngineStartModeSwCover, ON/OFF")
defineToggleSwitch("FwdEmergFuelSw",  4,3021, 142,"Electric System", "FwdEmergFuelSw")
defineToggleSwitch("FwdEmergFuelSwCover",  4,3022, 142,"Electric System", "FwdEmergFuelSwCover")
defineToggleSwitch("AftEmergFuelSw",  4,3023, 142,"Electric System", "AftEmergFuelSw")
defineToggleSwitch("AftEmergFuelSwCover",  4,3024, 142,"AftEmergFuelSwCover")
---2 do end

defineToggleSwitch("CB_ENGINE",  4,3025, 144,"Electric System", "CB Engine")
defineToggleSwitch("CB_AGD_GMK",  4,3026, 145,"Electric System", "CB AGD-GMK")
defineToggleSwitch("CB_INVERT1",  4,3027, 146,"Electric System", "CB Inverter 1 (AC 115V)")
defineToggleSwitch("CB_INVERT2",  4,3028, 147,"Electric System", "CB Inverter 2 (AC 115V)")
defineToggleSwitch("CB_RTL",  4,3029, 148,"Electric System", "CB RDO (ICS and Radio)")
defineToggleSwitch("CB_MRP_RV",  4,3030, 149,"Electric System", "CB MRP-RV (Marker Beacon Receiver and Radio Altimeter)")
defineToggleSwitch("CB_ISKRA",  4,3031, 150,"Electric System", "CB RSBN (ISKRA)")
defineToggleSwitch("CB_EMERG_SRO",  4,3032, 151,"Electric System", "CB IFF (SRO) Emergency Connection")
defineToggleSwitch("CB_EMERG_ISKRA",  4,3033, 152,"Electric System", "CB RSBN (ISKRA) Emergency Connection")
defineToggleSwitch("CB_WING_TANKS",  4,3034, 153,"Electric System", "CB Wing Tanks")
defineToggleSwitch("CB_RIO",  4,3035, 154,"Electric System", "CB RIO-3 De-Icing Signal")
defineToggleSwitch("CB_SDU",  4,3036, 155,"Electric System", "CB SDU")
defineToggleSwitch("CB_HEAT_SENSOR_AOA",  4,3037, 628,"Electric System", "CB Heating Sensor AOA")
defineToggleSwitch("CB_WEAPON",  4,3038, 629,"Electric System", "CB Weapon")
--defineToggleSwitch("CB_TANKS",  4,3039, XXX,"Electric System", "CB Tanks")
defineToggleSwitch("CB_AIR_COND",  4,3040, 211,"Electric System", "CB Air Conditioning")
defineToggleSwitch("CB_ANTI_ICE",  4,3041, 212,"Electric System", "CB Anti-Ice")
defineToggleSwitch("CB_PITOT_L",  4,3042, 213,"Electric System", "CB Pitot Left")
defineToggleSwitch("CB_PITOT_R",  4,3043, 214,"Electric System", "CB Pitot Right")
defineToggleSwitch("CB_PT500C",  4,3044, 215,"Electric System", "CB PT-500C")
defineToggleSwitch("CB_ARC",  4,3045, 216,"Electric System", "CB ARC")
defineToggleSwitch("CB_SRO",  4,3046, 217,"Electric System", "CB SRO")
defineToggleSwitch("CB_SEAT_HELMET",  4,3047, 218,"Electric System", "CB Seat Helmet")
defineToggleSwitch("CB_GEARS",  4,3048, 219,"Electric System", "CB Gears")
defineToggleSwitch("CB_CONTROL",  4,3049, 220,"Electric System", "CB Control")
defineToggleSwitch("CB_SIGNALING",  4,3050, 221,"Electric System", "CB Signaling")
defineToggleSwitch("CB_NAV_LIGHTS",  4,3051, 222,"Electric System", "CB Nav. Lights")
defineToggleSwitch("CB_SPOTLIGHT_L",  4,3052, 223,"Electric System", "CB Spotlight Left")
defineToggleSwitch("CB_SPOTLIGHT_R",  4,3053, 224,"Electric System", "CB Spotlight Right")
defineToggleSwitch("CB_LIGHT_RED",  4,3054, 225,"Electric System", "CB Red Lights")
defineToggleSwitch("CB_LIGHT_WHITE",  4,3055, 226,"Electric System", "CB White Lights")
defineToggleSwitch("CB_START_PANEL",  4,3056, 227,"Electric System", "CB Start Panel")
defineToggleSwitch("CB_BOOST_PUMP",  4,3057, 228,"Electric System", "CB Booster Pump")
defineToggleSwitch("CB_INGNITION_1",  4,3058, 229,"Electric System", "CB Ignition 1")
defineToggleSwitch("CB_INGNITION_2",  4,3059, 230,"Electric System", "CB Ignition 2")
defineToggleSwitch("CB_ENG_INSTR",  4,3060, 231,"Electric System", "CB Engine Instruments")
defineToggleSwitch("CB_FIRE",  4,3061, 232,"Electric System", "CB Fire")
defineToggleSwitch("CB_EMERG_JETT",  4,3062, 233,"Electric System", "CB Emergency Jettison")
defineToggleSwitch("CB_SARPP",  4,3063, 234,"Electric System", "CB SARPP")
defineToggleSwitch("CB_SEAT_INSTRUCTOR",  4,3064, 503,"Electric System", "CB Seat Instructor")
defineToggleSwitch("CB_SIGNAL_INSTRUCTOR",  4,3065, 504,"Electric System", "CB Signal Instructor")
defineToggleSwitch("CB_WEAPON_INSTRUCTOR",  4,3066, 505,"Electric System", "CB Weapon Instructor")
defineToggleSwitch("CB_GROUND_INTCOM",  4,3067, 512,"Electric System", "CB Ground Intercom")

definePushButton("PITOT_HEAT_ON_L",  4,3068, 294,"Electric System", "Standby (Left) Pitot Tube Heating ON Button")
definePushButton("PITOT_HEAT_OFF_L",  4,3069, 295,"Electric System", "Standby (Left) Pitot Tube Heating OFF Button")
definePushButton("PITOT_HEAT_ON_R",  4,3070, 292,"Electric System", "Main (Right) Pitot Tube Heating ON Button")
definePushButton("PITOT_HEAT_OFF_R",  4,3071, 293,"Electric System", "Main (Right) Pitot Tube Heating OFF Button")

  
BIOS.protocol.endModule()