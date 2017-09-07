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
defineFloat("VD20", 52, {0, 1}, "instruments l-39","Altimetre")-- Kilometers gauge on VD-20



-- Radar altimeter RV-5
defineFloat("RV_5_RALT", 58, {0, 1}, "instruments l-39","Radio Altimetre")



-- VARIOMETER
defineFloat("Variometer", 74, {-1,1}, "instruments l-39","Variomatre")
defineFloat("Variometer_turn", 75, {-1, 1}, "instruments l-39","Ind Inaclinaison variometre")
defineFloat("Variometer_sideslip", 76, {-1, 1},"instruments l-39"," Bille Variometre")



-- ARCTI HORIZ
defineFloat("KPP_1273K_roll", 38, {-1, 1}, "instruments l-39","KPP Roulis")
defineFloat("KPP_1273_pitch", 31, {-1, 1}, "instruments l-39","KPP Tangage")
defineFloat("KPP_1273K_sideslip", 40, {-1, 1}, "instruments l-39","Bille KPP")
--defineFloat("KPP_Course_Deviation_Bar", 35, {-1.0, 1.0}, "instruments l-39","SDU DEV CAP KPP") (need to verify)
--defineFloat("KPP_Alt_Deviation_Bar", 34, {-1.0, 1.0}, "instruments l-39","SDU DEV H KPP") (need to verify)
defineFloat("KPP_Glide_Beacon", 36, {0, 1}, "instruments l-39","Glide KPP")--GLIDE beacon on KPP
defineFloat("KPP_Localizer_Beacon", 37, {0, 1}, "instruments l-39","LOC KPP")-- LOC beacon on KPP
-- defineFloat("KPP_Arretir", 29, {0.0, 1.0}, "instruments l-39"," Arretir KPP") (need to verify)
defineFloat("KPP_SDU_Roll_Fwd", 32, {-1, 1}, "instruments l-39","SDU INCLINAISON KPP")-- SDU roll indication on KPP
defineFloat("KPP_SDU_Pitch_Fwd", 33, {-1, 1}, "instruments l-39","SDU CABRE KPP")-- SDU pitch indicator on KPP



-- NPP (HSI)
defineFloat("HSI_heading", 41, {0, 1}, "instruments l-39","IND CAP")-- heading indication
--defineFloat("HSI_commanded_course_needle", 42, {1.0, 0.0}, "instruments l-39","IND AZIMUT")
--defineFloat("HSI_bearing_needle", 43, {0.0, 1.0}, "instruments l-39","IND ROUTE")
--defineFloat("HSI_Course_Deviation_Bar", 47, {-0.8, 0.8}, "instruments l-39","HSI DEV CAP") (need to verify)
--defineFloat("HSI_Alt_Deviation_Bar", 45, {-0.8, 0.8}, "instruments l-39","HSI DEV H") (need to verify)
defineFloat("HSI_Glide_Beacon", 46, {0, 1}, "instruments l-39","GLIDE HSI")-- GLIDE beacon
defineFloat("HSI_Localizer_Beacon", 44, {0, 1}, "instruments l-39","LOC HSI")-- LOC beacon



--RSBN
defineFloat("RSBN_Range_1", 64, {0, 1}, "instruments l-39","DIST RSBN 1KM")-- range indication by 1 KM



--AIRSPEED AND MACH
defineFloat("IAS", 49, {0, 1}, "instruments l-39","V IND")-- indicated air speed
defineFloat("TAS", 50, {0, 1}, "instruments l-39","V VRAI")-- true air speed
defineFloat("MACH", 51, {0, 1}, "instruments l-39","N MACH")-- number of Mach



-- RKL-41
defineFloat("RKL_41_needle", 77, {0, 1}, "instruments l-39","IND RKL")



-- electric interface
defineFloat("Voltmeter", 92, {0,	1}, "instruments l-39","VOLTMETRE")
defineFloat("Ampermeter", 93, {0,	1}, "instruments l-39","AMPERMETRE")



-- oxygen interface
defineFloat("FwdOxygenPressure", 301, {0, 1}, "instruments l-39","PRESS OXYGENE")-- oxygene pressure indicator
defineFloat("FwdFlowBlinker", 302, {0,	1}, "instruments l-39","IND RESPIRATION")-- breathing blinkers



-- accelerometer
defineFloat("Acceleration", 86, {0,	1}, "instruments l-39","Ny")-- G indicator



-- Cockpit pressure
defineFloat("CockpitAltFwd", 95, {0, 1}, "instruments l-39","ALTI CABINE")-- cabine altitude
defineFloat("PressDiffFwd", 96, {0,	1}, "instruments l-39","DELTA P CAB")-- differantial cabine pressure



---Hydro Pressure
defineFloat("MainHydro_PRESS", 198, {0, 1}, "instruments l-39","PRESS HYDRO PRIN")-- main hydrolic system pressure indicator
defineFloat("AuxHydro_PRESS", 200, {0, 1}, "instruments l-39","PRESS HYDRO SECOURS")-- aux hydrolic system pressure indicator
defineFloat("BrakeLMainHydro_PRESS", 98, {0, 1}, "instruments l-39","PRESS PRIN FREIN GAUCHE")-- main hydrolic left brake pressure indicator
defineFloat("BrakeRMainHydro_PRESS", 99, {0, 1}, "instruments l-39","PRESS PRIN FREIN DROIT")-- main hydrolic right brake pressure indicator
defineFloat("BrakeAuxHydro_PRESS", 100, {0, 1}, "instruments l-39","PRESS FREINS SECOURS")-- aux hydrolic brakes system pressure indicator



-- Fuel 
defineFloat("Fuel_Quantity", 91, {0, 1}, "instruments l-39","Gt")-- fuel quantity indicator
defineFloat("Fuel_Press", 81, {0, 1}, "instruments l-39","PRESS CARB")-- fuel pressure indicator


-- ENGINE
defineFloat("Fan_RPM", 85, {0, 1}, "instruments l-39","RPM N1")-- low pressure compressor rpm indicator
defineFloat("Compressor_RPM", 84, {0, 1}, "instruments l-39","RPM N2")-- high pressure compressor rpm indicator
defineFloat("Engine_Temp", 90, {0, 1}, "instruments l-39","T4")-- turbine temperature indicator
defineFloat("EngineVibration", 94, {0, 1}, "instruments l-39","VIBRATIONS REACTEUR")-- engine vibrations indicator



-- OIL
defineFloat("Oil_Temp", 83, {0, 1}, "instruments l-39","T HUILE")-- oil temperature indicator
defineFloat("Oil_Press", 82, {0, 1}, "instruments l-39","PRESS HUILE")-- oil pressure indicator

  
  
-- TRIM
defineFloat("PitchTrimInd", 247, {-1, 1}, "instruments l-39","IND TRIM") -- pitch trim indicator

------------------------------------ L-39 Lights --------------------------------------------------------------------


--- Elec syst lamps
defineIndicatorLight("MRP_56_lamp", 18, "l-39 lamps","MRP 56")
defineIndicatorLight("MainGen_lamp", 6, "l-39 lamps","Gen prin")
defineIndicatorLight("ReservGen_lamp", 6, "l-39 lamps"," Gen Sec")
defineIndicatorLight("Inverter115_lamp", 12, "l-39 lamps","inverter 115v")
defineIndicatorLight("Inverter363_lamp", 16, "l-39 lamps","inverter 3x36v")
defineIndicatorLight("GroundPower_lamp", 316, "l-39 lamps","Ground power")

--- Flaps
defineIndicatorLight("FlapsUp_lamp", 278, "l-39 lamps","Flaps 0°")
defineIndicatorLight("FlapsTO_lamp", 279, "l-39 lamps","Flaps 25°")
defineIndicatorLight("FlapsDn_lamp", 280, "l-39lamps","Flaps 44°")

--- Air Brakes
defineIndicatorLight("AirBrakes_lamp", 117, "l-39 lamps","Aero frein")

--- Gears
defineIndicatorLight("GearDown_front_lamp", 113, "l-39 lamps","Roulette nez sortie")
defineIndicatorLight("GearDown_left_lamp", 112, "l-39 lamps","Train prin gauche sorti")
defineIndicatorLight("GearDown_right_lamp", 114, "l-39 lamps","Train prin droit sorti")
defineIndicatorLight("GearUp_front_lamp", 110, "l-39 lamps","Roulette nez rentree")
defineIndicatorLight("GearUp_left_lamp", 109, "l-39 lamps","Train prin gauche rentre")
defineIndicatorLight("GearUp_right_lamp", 111, "l-39 lamps","Train prin droit rentre")
defineIndicatorLight("ExtendGears_lamp", 115, "l-39 lamps","Trains en mvt")
defineIndicatorLight("DoorsOut_lamp", 116, "l-39 lamps","Volets TR sorti")

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
defineIndicatorLight("DangerAltitude_lamp", 2, "l-39 lamps","Altitude Dangereuse")

--- Fuel and turbostarter
defineIndicatorLight("EmergFuelFwd_lamp", 27, "l-39 lamps","System Carb Secours")
defineIndicatorLight("TurboStarter_lamp", 23, "l-39 lamps","Turbo starter")

defineIndicatorLight("FwdRemain150_lamp", 4, "l-39 lamps","Reste 150Kg")
defineIndicatorLight("FwdDoNotStart_lamp", 7, "l-39 lamps","Do not start")
defineIndicatorLight("FwdFuelFilter_lamp", 26, "l-39 lamps","Filtre carb")
defineIndicatorLight("FwdWingTanks_lamp", 14, "l-39 lamps","Reservoir bout Ailes")
if L_39ZA then 
defineIndicatorLight("FwdWingTanks_lamp", 13, "l-39 lamps","Reservoir bout Ailes")
end


--- Trim
defineIndicatorLight("TrimmerRollNeutralFwd_lamp", 246, "l-39 lamps","Trim inclinaison neutre")

--- MACH
defineIndicatorLight("MachMeterLampFwd", 3, "l-39 lamps","Over Mach")

--- Canopy
defineIndicatorLight("FwdCanopyNotClosed", 10, "l-39 lamps","Verierre ouverte")

--- Pitot
defineIndicatorLight("LeftPitot_lamp", 556, "l-39 lamps","Pitot gauche")
defineIndicatorLight("RightPitot_lamp", 557, "l-39 lamps","Pitot droit")

--- Vibrations
defineIndicatorLight("FwdVibration_lamp", 8, "l-39 lamps","Vibrations elevees")

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


  
  
BIOS.protocol.endModule()