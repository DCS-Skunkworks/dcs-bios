BIOS.protocol.beginModule("MB-339PAN", 0x8200)
BIOS.protocol.setExportModuleAircrafts({"MB-339PAN"})
--by WarLord
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3PosTumb = BIOS.util.define3PosTumb

-- remove Arg# Pilot 1000

--ELECTRIC_SYSTEMS
defineToggleSwitch("BATTERY", 1, 3100, 300, "Electric" , "BATTERY Power Switch")
defineToggleSwitch("GENERATOR1", 1, 3101, 301, "Electric" , "GENERATOR 1 Switch")
defineToggleSwitch("GENERATOR2", 1, 3102, 302, "Electric" , "GENERATOR 2 Switch")
defineToggleSwitch("EMERG_POWER", 1, 3103, 303, "Electric" , "AC Power Emergency Switch")
defineFloat("GENERATOR1_IND", 380, {0, 1}, "Electric", "GENERATOR 1 Indicator")
defineFloat("GENERATOR2_IND", 381, {0, 1}, "Electric", "GENERATOR 2 Indicator")

--CONTROLS
defineToggleSwitch("FLIGHT_CONTR", 2, 10400, 232, "Controls" , "Flight Controls Lock/Unlock")
defineToggleSwitch("PARK_BRK", 2, 3130, 263, "Controls" , "Parking Brake Handle")
definePushButton("START_ENG", 2, 3110, 239, "Controls" , "START ENGINE Button")

--ANIMATIONS
defineToggleSwitch("ENG_MASTER", 3, 3111, 238, "Animations" , "Engine MASTER Switch")
defineToggleSwitch("ENG_JPT_LMTR", 3, 3112, 240, "Animations" , "Engine JPT LMTR Switch")
defineToggleSwitch("ANTI_SKID", 3, 10153, 250, "Animations" , "Anti-Skid Switch")
definePushButton("SEAT_UP", 3, 10160, 323, "Animations" , "Adj Seat Up Switch")
definePushButton("SEAT_DN", 3, 10161, 323, "Animations" , "Adj Seat Down Switch")
defineToggleSwitch("MIRRORS", 3, 10410, 400, "Animations" , "Mirror Open/Close")
defineToggleSwitch("ANTI_ICE_ENG", 3, 10416, 262, "Animations" , "Anti-Ice Engine")
defineToggleSwitch("PITOT", 3, 10417, 261, "Animations" , "Anti-Ice Pitot")
defineToggleSwitch("SEAT_FIRE", 3, 10500, 205, "Animations" , "Seat Firing Handle")

--GEAR
defineToggleSwitch("D_LOCK_OVER", 4, 3131, 379, "Gear" , "DOWN-LOCK OVERRIDE Switch")
defineToggleSwitch("GEAR_LEVER", 4, 68, 4, "Gear" , "Gear Lever Up/Down")
defineIndicatorLight("GEAR_IND_LIGHTS", 20, "Gear", "Gear Indicator Lights (green)")
defineIndicatorLight("GEAR_LEVER_OFF", 42, "Gear", "Gear Lever Light (red)")

--LIGHTS
defineToggleSwitch("NAV_L_FLASH", 6, 3141, 41, "Lights" , "NAV Light Flash/Steady Switch")
define3PosTumb("NAV_L_DIM", 6, 3142, 40, "Lights" , "NAV Light BRT/DIM Switch")
defineToggleSwitch("STROBE_L", 6, 3143, 39, "Lights" , "BCN Strobo On/Off")
defineToggleSwitch("TAXI_LAND_L", 6, 3140, 321, "Lights" , "TAXI/LANDING Light Switch")
definePotentiometer("FORMATION_L", 6, 3014, 502, {0, 0.99}, "Lights", "FORMATION LIGHTS Knob")
definePotentiometer("INSTRUMENTS_L", 6, 3144, 503, {0, 1}, "Lights", "INSTRUMENTS LIGHTS Knob")
definePotentiometer("FLOOD_L", 6, 3016, 3146, {0, 1}, "Lights", "FLOOD LIGHTS Knob")
definePotentiometer("CONSOLE_L", 6, 3145, 505, {0, 1}, "Lights", "CONSOLE LIGHTS Knob")
defineFloat("INST_BRT", 150, {0, 1}, "Lights", "Instrument Lights BRT")

--CANOPY
definePushButton("SAVE_PIN_CANOPY", 7, 10162, 377, "Canopy" , "Seat Safety Pin To Canopy")
definePushButton("SAVE_PIN_SEAT", 7, 10163, 376, "Canopy" , "Seat Safety Pin To Seat")
defineToggleSwitch("PARTIAL_OPEN", 7, 10175, 183, "Canopy" , "Partial Opening Device")
defineToggleSwitch("CANOPY_L", 7, 71, 182, "Canopy" , "Canopy Lock/Unlock")

--HSI
defineRotary("HSI_HDG_SET", 11, 3003, 362, "HSI", "Heading Set Knob")
defineRotary("HSI_CRS_SET", 11, 3002, 353, "HSI", "Course Set Knob")
defineFloat("HSI_CRS_COUNT1", 350, {0, 1}, "HSI", "HSI Course Counter 1")
defineFloat("HSI_CRS_COUNT10", 351, {0, 1}, "HSI", "HSI Course Counter 10")
defineFloat("HSI_CRS_COUNT100", 352, {0, 1}, "HSI", "HSI Course Counter 100")
defineFloat("HSI_CRS_ARROW", 354, {0, 1}, "HSI", "HSI Course Arrow")
defineFloat("HSI_POW_FLAG", 355, {0, 1}, "HSI", "HSI Pow Flag")
defineFloat("HSI_RANGE_FLAG", 355, {0, 1}, "HSI", "HSI Range Flag")
defineFloat("HSI_RANGE_COUNT1", 357, {0, 1}, "HSI", "HSI Range Counter 1")
defineFloat("HSI_RANGE_COUNT10", 358, {0, 1}, "HSI", "HSI Range Counter 10")
defineFloat("HSI_RANGE_COUNT100", 359, {0, 1}, "HSI", "HSI Range Counter 100")
defineFloat("HSI_DEVIAT", 360, {-1, 1}, "HSI", "HSI Deviation")
defineFloat("HSI_HDG", 361, {0, 1}, "HSI", "HSI Heading")
defineFloat("HSI_HDG_MARK", 363, {0, 1}, "HSI", "HSI Heading Marker")
defineFloat("HSI_BRG1", 364, {0, 1}, "HSI", "HSI Bearing 1")
defineFloat("HSI_BRG2", 365, {0, 1}, "HSI", "HSI Bearing 2")
defineFloat("HSI_BRG_FLAG", 366, {0, 1}, "HSI", "HSI Bearing Flag")
defineFloat("HSI_TO_FROM1", 367, {0, 1}, "HSI", "HSI To - From 1")
defineFloat("HSI_TO_FROM2", 368, {0, 1}, "HSI", "HSI To - From 2")

--GPS
definePushButton("GPS_ROW1", 11, 10211, 3010, "HSI" , "GPS Row 1 Selector")
definePushButton("GPS_ROW2", 11, 10212, 3011, "HSI" , "GPS Row 2 Selector")
definePushButton("GPS_ROW3", 11, 10213, 3012, "HSI" , "GPS Row 3 Selector")
definePushButton("GPS_ROW4", 11, 10214, 3013, "HSI" , "GPS Row 4 Selector")
definePushButton("GPS_MARK", 11, 10207, 3014, "HSI" , "GPS MARK")
definePushButton("GPS_SET", 11, 10203, 3015, "HSI" , "GPS SET")
definePushButton("GPS_BRT", 11, 10204, 3016, "HSI" , "GPS BRT")
definePushButton("GPS_MINUS", 11, 10205, 3017, "HSI" , "GPS -")
definePushButton("GPS_PLUS", 11, 10206, 3018, "HSI" , "GPS +")
definePushButton("GPS_NR1", 11, 10191, 3019, "HSI" , "GPS N.1")
definePushButton("GPS_NR2", 11, 10192, 3020, "HSI" , "GPS N.2")
definePushButton("GPS_NR3", 11, 10193, 3021, "HSI" , "GPS N.3")
definePushButton("GPS_NR4", 11, 10194, 3022, "HSI" , "GPS N.4")
definePushButton("GPS_NR5", 11, 10195, 3023, "HSI" , "GPS N.5")
definePushButton("GPS_NR6", 11, 10196, 3024, "HSI" , "GPS N.6")
definePushButton("GPS_NR7", 11, 10197, 3025, "HSI" , "GPS N.7")
definePushButton("GPS_NR8", 11, 10198, 3026, "HSI" , "GPS N.8")
definePushButton("GPS_NR9", 11, 10199, 3027, "HSI" , "GPS N.9")
definePushButton("GPS_NR0", 11, 10200, 3028, "HSI" , "GPS N.0")
definePushButton("GPS_CLR", 11, 10201, 3029, "HSI" , "GPS CLR")
definePushButton("GPS_ENT", 11, 10202, 3030, "HSI" , "GPS ENT")
definePushButton("GPS_MODE", 11, 10215, 3031, "HSI" , "GPS MODE")

--ADI
defineRotary("CLOCK_WIND_ROTATRY", 12, 3001, 15, "ADI", "ADI Pitch Trim Knob")
defineFloat("ADI_SLIPBALL", 371, {-1, 1}, "ADI", "ADI SlipBall")

--ALTIMETER
defineRotary("PRESS_ALT", 3, 3002, 241, "Altimeter", "Press Altimeter Knob")
defineFloat("ALTIMETER_100", 50, {0, 1}, "Altimeter", "Altimeter 100")
defineFloat("ALTIMETER_1000", 52, {0, 1}, "Altimeter", "Altimeter 1000")
defineFloat("ALTIMETER_10000", 53, {0, 1}, "Altimeter", "Altimeter 10000")
defineFloat("ALTIMETER_PRESS_1000", 242, {0, 1}, "Altimeter", "Altimeter Pressure 1000")
defineFloat("ALTIMETER_PRESS_100", 243, {0, 1}, "Altimeter", "Altimeter Pressure 100")
defineFloat("ALTIMETER_PRESS_10", 244, {0, 1}, "Altimeter", "Altimeter Pressure 10")
defineFloat("ALTIMETER_PRESS_1", 245, {0, 1}, "Altimeter", "Altimeter Pressure 1")
defineFloat("ALTIMETER_OFF_FLAG", 311, {0, 1}, "Altimeter", "Altimeter OFF Flag")

--GUARD SWITCHES
defineToggleSwitch("BUS_RESET_SW", 14, 10150, 231, "Guard Switches" , "BUS RESET Switch")
defineToggleSwitch("BUS_RESET_GD", 14, 10100, 233, "Guard Switches" , "BUS RESET Guard")
defineToggleSwitch("FUEL_OFF_GD", 14, 3115, 237, "Guard Switches" , "Fuel SHUT-OFF Guard")
defineToggleSwitch("FUEL_OFF_SW", 14, 3114, 248, "Guard Switches" , "Fuel SHUT-OFF Switch")
defineToggleSwitch("AIL_SERVO_GD", 14, 10104, 235, "Guard Switches" , "AIL Servo Guard")
defineToggleSwitch("AIL_SERVO_SW", 14, 10156, 260, "Guard Switches" , "AIL Servo Switch")
defineToggleSwitch("GROUND_FIRE_SW", 14, 11004, 506, "Guard Switches" , "GROUND FIRE Switch")
defineToggleSwitch("GROUND_FIRE_GD", 14, 11001, 236, "Guard Switches" , "GROUND FIRE Guard")
defineToggleSwitch("CABIN_PRESS_GD", 14, 10105, 234, "Guard Switches" , "CABIN PRESS Guard")
defineToggleSwitch("CABIN_PRESS_SW", 14, 10157, 264, "Guard Switches" , "CABIN PRESS Switch")

--WARN
definePushButton("WARN_LIGHT_BT", 15, 10051, 304, "Warning" , "WARN LT TEST Button")
definePushButton("MASTER_CAUTION_RESET", 15, 10415, 209, "Warning" , "Master Caution Reset")

--SMOKES
defineToggleSwitch("SMK_MASTER", 17, 3135, 330, "Smokes" , "Smoke Master Switch")
defineToggleSwitch("SMK_WHITE", 17, 3136, 331, "Smokes" , "Smoke White Switch")
defineToggleSwitch("SMK_COLOR", 17, 3137, 332, "Smokes" , "Smoke Color Switch")

--SOUND_SYSTEM
defineToggleSwitch("WARN_SILENCE", 19, 10164, 382, "Sound System" , "WARNING SILENCE")

--NAV
defineToggleSwitch("FLT_HDG", 23, 10184, 333, "NAV" , "FLT DIR HDG Button")
defineToggleSwitch("FLT_GS_ARM", 23, 10185, 334, "NAV" , "FLT DIR GS ARM Button")
defineToggleSwitch("FLT_STBY", 23, 10186, 335, "NAV" , "FLT DIR STBY Button")
defineToggleSwitch("FLT_RADIO_NAV", 23, 10187, 336, "NAV" , "FLT DIR RADIO NAV Button")
defineToggleSwitch("FLT_GS", 23, 10188, 337, "NAV" , "FLT DIR GS Button")
defineToggleSwitch("FLT_ALT_HOLD", 23, 10189, 338, "NAV" , "FLT DIR ALT HOLD Button")
defineToggleSwitch("GPS", 23, 10180, 345, "NAV" , "GPS On/Off")
defineToggleSwitch("TACAN", 23, 10181, 346, "NAV" , "TACAN On/Off")
defineToggleSwitch("VOR", 23, 10182, 347, "NAV" , "VOR On/Off")
defineToggleSwitch("RNAV", 23, 10183, 348, "NAV" , "RNAV On/Off")
defineToggleSwitch("NAV", 23, 3001, 384, "NAV" , "NAV On/Off")
defineIndicatorLight("TACAN_LIGHT", 369, "NAV Lights", "TACAN Light")
defineIndicatorLight("VOR_LIGHT", 370, "NAV Lights", "VOR Light")
defineIndicatorLight("RNAV_LIGHT", 383, "NAV Lights", "RNAV Light")
defineIndicatorLight("NAV_LIGHT", 385, "NAV Lights", "NAV Light")
defineIndicatorLight("FLT_HDG_LIGHT", 339, "NAV Lights", "FLT HDG Light")
defineIndicatorLight("FLT_GS_ARM_LIGHT", 340, "NAV Lights", "FLT GS ARM Light")
defineIndicatorLight("FLT_STBY_LIGHT", 341, "NAV Lights", "FLT STBY Light")
defineIndicatorLight("FLT_RADIO_NAV_LIGHT", 342, "NAV Lights", "FLT RADIO NAV Light")
defineIndicatorLight("FLT_GS_LIGHT", 343, "NAV Lights", "FLT GS Light")
defineIndicatorLight("FLT_ALT_HOLD_LIGHT", 344, "NAV Lights", "FLT ALT HOLD Light")

--WEAPONS
defineToggleSwitch("MASTER_ARM", 26, 3014, 475, "Weapons" , "MASTER ARMAMENT Switch")
defineToggleSwitch("GUNSIGHT_PWR", 26, 11216, 478, "Weapons" , "Gunsight PWR Switch")
definePotentiometer("GUNSIGHT_BRT", 26, 3013, 479, {0, 1}, "Weapons", "Gunsight BRT Knob")
definePushButton("GUNSIGHT_TEST", 26, 11218, 480, "Weapons" , "Gunsight TEST Button")
defineTumb("DEPRESS_100", 26, 3010, 481, 0.1, {0, 1}, nil, false, "Weapons" , "Depression Reticle x 100 Roller")
defineTumb("DEPRESS_10", 26, 3011, 482, 0.1, {0, 1}, nil, false, "Weapons" , "Depression Reticle x 10 Roller")
defineTumb("DEPRESS_1", 26, 3012, 483, 0.1, {0, 1}, nil, false, "Weapons" , "Depression Reticle x 1 Roller")
defineToggleSwitch("BOMB_FUZE", 26, 11227, 494, "Weapons" , "BOMB FUZE Selector")
defineToggleSwitch("BOMB_SEQUENCE", 26, 11226, 495, "Weapons" , "SEQUENCE RIPPLE/SINGLE Switch")
defineToggleSwitch("STATION_1", 26, 11220, 488, "Weapons" , "STATION 1 Selector")
defineToggleSwitch("STATION_2", 26, 11221, 489, "Weapons" , "STATION 2 Selector")
defineToggleSwitch("STATION_3", 26, 11222, 490, "Weapons" , "STATION 3 Selector")
defineToggleSwitch("STATION_4", 26, 11223, 491, "Weapons" , "STATION 4 Selector")
defineToggleSwitch("STATION_5", 26, 11224, 492, "Weapons" , "STATION 5 Selector")
defineToggleSwitch("STATION_6", 26, 11225, 493, "Weapons" , "STATION 6 Selector")
definePushButton("SALVO_JETTISON", 26, 3015, 473, "Weapons" , "SALVO JETTISON Button")
definePushButton("SELECT_JETTISON", 26, 3016, 70, "Weapons" , "SELECTIVE JETTISON Button")
defineIndicatorLight("STATION_1_IND", 496, "Weapons Lights", "STATION 1 Indicator")
defineIndicatorLight("STATION_2_IND", 497, "Weapons Lights", "STATION 2 Indicator")
defineIndicatorLight("STATION_3_IND", 498, "Weapons Lights", "STATION 3 Indicator")
defineIndicatorLight("STATION_4_IND", 499, "Weapons Lights", "STATION 4 Indicator")
defineIndicatorLight("STATION_5_IND", 500, "Weapons Lights", "STATION 5 Indicator")
defineIndicatorLight("STATION_6_IND", 501, "Weapons Lights", "STATION 6 Indicator")

--FUEL SYSTEMS
defineTumb("FUEL_QUANT", 27, 3008, 257, 0.1, {0, 0.4}, nil, false, "Fuel Systems" , "Fuel Quantity Selector Knob")
definePushButton("FUEL_TEST", 27, 10411, 258, "Fuel Systems" , "Fuel Test Button")
defineToggleSwitch("FUEL_TRANSFER", 27, 10152, 249, "Fuel Systems" , "TIP/PYLON Fuel Transfer Switch")
defineFloat("FUEL_TOTAL", 312, {0, 1}, "Fuel Systems", "Total Fuel")
defineFloat("FUEL_FLOW", 265, {0.0, 0.62}, "Fuel Systems", "Fuel Flow")

--GAUGES
defineFloat("FLAPS_IND", 1, {0, 1}, "Gauges", "Flaps Indicator")
defineFloat("AIRBRAKE_IND", 2, {0, 1}, "Gauges", "AirbrakeIndicator")
defineFloat("TRIM_IND", 3, {0, 1}, "Gauges", "Trim Indicator")
defineFloat("ENGINE_RPM", 16, {0, 1}, "Gauges", "Engine RPM")
defineFloat("TRIM_RUDDER", 540, {-1, 1}, "Gauges", "Trim Rudder")
defineFloat("ANEMOMETER", 8, {0, 1}, "Gauges", "Anemometer")
defineFloat("INDEX_MACHMETER", 541, {0, 1}, "Gauges", "Index Machmeter")
defineFloat("TRIANGLE_MACHMETER", 542, {0, 1}, "Gauges", "Triagle Machmeter")
defineFloat("VARIOMETER", 208, {-1, 1}, "Gauges", "Variometer")
defineFloat("G_METER", 6, {-0.4,  1}, "Gauges", "G Meter")
defineFloat("RPM_INT", 33, {0, 1}, "Gauges", "RPM Int")
defineFloat("RPM_EXT", 16, {0, 1}, "Gauges", "RPM Ext")
defineFloat("EJECT_HANDLE", 376, {0, 1}, "Gauges", "Eject Handle")
defineFloat("COMPASS", 305, {0, 1}, "Gauges", "Compass")
defineFloat("COMPASS_PITCH", 299, {1.0, -1.0}, "Gauges", "Compass Pitch")
defineFloat("COMPASS_ROLL", 298, {1.0, -1.0}, "Gauges", "Compass Roll")
defineFloat("ADI_PITCH", 9, {1.0, -1.0}, "Gauges", "ADI Pitch")
defineFloat("ADI_ROLL", 10, {1.0, -1.0}, "Gauges", "ADI Roll")
defineFloat("ADI_FLAG_OFF", 21, {0, 1}, "Gauges", "ADI Flag OFF")
defineFloat("ADI_FLAG1", 22, {0, 1}, "Gauges", "ADI Flag 1")
defineFloat("ADI_FLAG2", 23, {0, 1}, "Gauges", "ADI Flag 2")
defineFloat("ADI_FD_LR", 372, {-1, 1}, "Gauges", "ADI FD LEFT RIGHT")
defineFloat("ADI_FD_UD", 373, {-1, 1}, "Gauges", "ADI FD UP DOWN")
defineFloat("TEMP_EXT", 314, {0.0, 0.55}, "Gauges", "Extern Temperature")
defineFloat("AOA", 315, {0, 1}, "Gauges", "AOA Indicator")
defineFloat("AOA_OFF_FLAG", 310, {0, 1}, "Gauges", "AOA OFF Flag")
defineFloat("AOA_ANTI_ICE", 528, {0, 1}, "Gauges", "AOA Anti ICE Band")
defineFloat("ENG_ANTI_ICE", 829, {0, 1}, "Gauges", "Engine Anti ICE Band")
defineFloat("CABIN_PRESS_IND", 319, {0, 1}, "Gauges", "Cabin Pressure Indicator")
defineFloat("O2_FLOW", 306, {0, 1}, "Gauges", "Oxy Flow Indicator")
defineFloat("O2_IND", 153, {0, 1}, "Gauges", "Oxy Indicator")
defineFloat("CLOCK_H", 47, {0, 1}, "Gauges", "Clock Hour Indicator")
defineFloat("CLOCK_M", 46, {0, 1}, "Gauges", "Clock Minutes Indicator")
defineFloat("CLOCK_S", 48, {0, 1}, "Gauges", "Clock Seconds Indicator")
defineFloat("CLOCK_S2", 49, {0, 1}, "Gauges", "Clock Seconds 2 Indicator")
defineFloat("PYL_SEL_1", 69, {0, 1}, "Gauges", "Pylon Selector 1")
defineFloat("PYL_SEL_2", 68, {0, 1}, "Gauges", "Pylon Selector 2")
defineFloat("PYL_SEL_3", 67, {0, 1}, "Gauges", "Pylon Selector 3")
defineFloat("PYL_SEL_4", 66, {0, 1}, "Gauges", "Pylon Selector 4")
defineFloat("PYL_SEL_5", 65, {0, 1}, "Gauges", "Pylon Selector 5")
defineFloat("PYL_SEL_6", 64, {0, 1}, "Gauges", "Pylon Selector 6")
defineFloat("HYD_PRESS", 150, {0, 1}, "Gauges", "Hydraulic Pressure")
defineFloat("HYD_EMERG_PRESS", 151, {0, 1}, "Gauges", "Emergency Hydraulic Pressure")
defineFloat("OIL_PRESS", 152, {0, 1}, "Gauges", "OIL Pressure")

--Indicator Lights
defineIndicatorLight("MASTER_CAUTION", 209, "Indicator Lights", "Master Caution")
defineIndicatorLight("CANOPY_WARN", 399, "Indicator Lights", "Canopy Warning")
defineIndicatorLight("WARN_DC1", 210, "Indicator Lights", "DC 1 Off Warning")
defineIndicatorLight("WARN_DC2", 211, "Indicator Lights", "DC 2 Off Warning")
defineIndicatorLight("WARN_BATT1", 212, "Indicator Lights", "Battery 1 Warning")
defineIndicatorLight("WARN_BATT2", 213, "Indicator Lights", "Battery 2 Warning")
defineIndicatorLight("WARN_BATT_HOT", 214, "Indicator Lights", "Battery Hot Warning")
defineIndicatorLight("WARN_AC_ESS", 215, "Indicator Lights", "AC ESS Bus Warning")
defineIndicatorLight("WARN_AC_SEC", 216, "Indicator Lights", "AC SEC Bus Warning")
defineIndicatorLight("WARN_CKT_BKR", 217, "Indicator Lights", "CKT BKR Warning")
defineIndicatorLight("WARN_AIL_SERVO", 218, "Indicator Lights", "AIL SERVO Warning")
defineIndicatorLight("WARN_OXY_LOW", 219, "Indicator Lights", "OXY LOW Warning")
defineIndicatorLight("WARN_DUCT_ICE", 220, "Indicator Lights", "Duct Anti Ice Warning")
defineIndicatorLight("WARN_PYL_EMPTY", 221, "Indicator Lights", "PYL TK Empty Warning")
defineIndicatorLight("WARN_FUEL_TRANS", 222, "Indicator Lights", "Fuel Transfer Warning")
defineIndicatorLight("WARN_TIP_UNBAL", 223, "Indicator Lights", "TIP TK UNBAL Warning")
defineIndicatorLight("WARN_FUEL_LOW", 224, "Indicator Lights", "Fuel Low Warning")
defineIndicatorLight("WARN_FUEL_PRESS", 225, "Indicator Lights", "Fuel Pressure Warning")
defineIndicatorLight("WARN_OIL_PRESS", 226, "Indicator Lights", "Oil Pressure Warning")
defineIndicatorLight("WARN_ICE", 227, "Indicator Lights", "Ice Warning")
defineIndicatorLight("WARN_LIGHT", 228, "Indicator Lights", "Warning")
defineIndicatorLight("WARN_IFF", 229, "Indicator Lights", "IFF Warning")
defineIndicatorLight("WARN_IFF4", 230, "Indicator Lights", "IFF Mode 4 Warning")
defineIndicatorLight("RUD_TAKEOFF_TRIM", 251, "Indicator Lights", "Rudder Take Off Trim")
defineIndicatorLight("AIL_TAKEOFF_TRIM", 252, "Indicator Lights", "Aileron Take Off Trim")
defineIndicatorLight("WARN_FIRE", 253, "Indicator Lights", "Fire Warning")
defineIndicatorLight("WARN_STEER", 254, "Indicator Lights", "Steering Warning")
defineIndicatorLight("WARN_ANTI_SKID", 255, "Indicator Lights", "Anti Skid Warning")
defineIndicatorLight("WARN_OVERHEAT", 256, "Indicator Lights", "Overheat Warning")
defineIndicatorLight("SMK_WHITE_IND", 62, "Indicator Lights", "White Smoke Indicator")
defineIndicatorLight("SMK_COLOR_IND", 63, "Indicator Lights", "Color Smoke Indicator")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE", function()
	return math.floor(LoGetAircraftDrawArgumentValue(21)*65535)
end, 65535, "External Aircraft Model", "Speed Brake")
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights")

defineIntegerFromGetter("EXT_STROBE_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Lights")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

defineFloat("CANOPY_POS", 181, {0, 1}, "Canopy", "Canopy Position")

BIOS.protocol.endModule()