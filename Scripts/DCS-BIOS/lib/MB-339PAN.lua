BIOS.protocol.beginModule("MB-339PAN", 0x8200)
BIOS.protocol.setExportModuleAircrafts({"MB-339PAN"})

--For the mod visit: http://www.freccetricolorivirtuali.net/mod%20ftv.htm

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication


local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
--local defineString = BIOS.util.defineString
local defineFloat = BIOS.util.defineFloat

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

--ELECTRIC_SYSTEMS
defineToggleSwitch("BATTERY", 1, 315, 300,"Electric" , "BATTERY Power Switch")
defineToggleSwitch("GENERATOR1", 1, 10316, 301,"Electric" , "GENERATOR 1 Switch")
defineToggleSwitch("GENERATOR2", 1, 10317, 302,"Electric" , "GENERATOR 2 Switch")
defineToggleSwitch("EMERG_POWER", 1, 10318, 303,"Electric" , "AC Power Emer Switch")

--CONTROLS
defineToggleSwitch("FLIGHT_CONTR", 2, 10400, 232,"Controls" , "Flight Controls Lock/Unlock")
defineToggleSwitch("PARK_BRK", 2, 855, 263,"Controls" , "Parking Brake Handle")
definePushButton("START_ENG", 2, 12000, 239,"Controls" , "START ENGINE Button")

--ANIMATIONS
defineToggleSwitch("ENG_MASTER", 3, 10154, 238,"Animations" , "Engine MASTER Switch")
defineToggleSwitch("ENG_JPT_LMTR", 3, 10155, 240,"Animations" , "Engine JPT LMTR Switch")
defineToggleSwitch("ANTI_SKID", 3, 10153, 250,"Animations" , "Anti-Skid Switch")
definePushButton("SEAT_UP", 3, 10160, 323,"Animations" , "Adj Seat Up Switch")
definePushButton("SEAT_DN", 3, 10161, 323,"Animations" , "Adj Seat Down Switch")
defineToggleSwitch("MIRRORS", 3, 10410, 400,"Animations" , "Mirror Open/Close")
defineToggleSwitch("ANTI_ICE_ENG", 3, 10416, 262,"Animations" , "Anti-Ice Engine")
defineToggleSwitch("PITOT", 3, 10417, 261,"Animations" , "Anti-Ice Pitot")
defineToggleSwitch("SEAT_FIRE", 3, 10500, 205,"Animations" , "Seat Firing Handle")

--GEAR
defineToggleSwitch("D_LOCK_OVER", 4, 10165, 379,"Gear" , "DOWN-LOCK OVERRIDE Switch")
defineToggleSwitch("GEAR_LEVER", 4, 68, 4,"Gear" , "GEAR Lever Up/Down")

--LIGHTS
defineToggleSwitch("NAV_L_FLASH", 6, 10168, 41,"Lights" , "NAV Light Flash/Steady Switch")
defineToggleSwitch("NAV_L_DIM", 6, 175, 40,"Lights" , "NAV Light BRT/DIM Switch")
defineToggleSwitch("STROBE_L", 6, 10170, 39,"Lights" , "BCN Strobo On/Off")
defineToggleSwitch("TAXI_L", 6, 328, 321,"Lights" , "TAXI Light Switch")
definePotentiometer("FORMATION_L", 6, 3014, 502, {0, 0.99}, "Lights", "FORMATION LIGHTS Knob")
definePotentiometer("INSTRUMENTS_L", 6, 10171, 503, {0, 1}, "Lights", "INSTRUMENTS LIGHTS Knob")
definePotentiometer("FLOOD_L", 6, 3016, 504, {0, 1}, "Lights", "FLOOD LIGHTS Knob")
definePotentiometer("CONSOLE_L", 6, 10172, 505, {0, 1}, "Lights", "CONSOLE LIGHTS Knob")

--CANOPY
definePushButton("SAVE_PIN_CANOPY", 7, 10162, 377,"Canopy" , "Seat Safety Pin To Canopy")
definePushButton("SAVE_PIN_SEAT", 7, 10163, 376,"Canopy" , "Seat Safety Pin To Seat")
defineToggleSwitch("PARTIAL_OPEN", 7, 10175, 183,"Canopy" , "Partial Opening Device")
defineToggleSwitch("CANOPY_L", 7, 71, 182,"Canopy" , "Canopy Lock/Unlock")

--HSI
defineRotary("HDG_SET", 11, 3003, 362, "HSI", "Heading Set Knob")
defineRotary("CRS_SET", 11, 3002, 353, "HSI", "Course Set Knob")
definePushButton("GPS_ROW1", 11, 10211, nil,"HSI" , "GPS Row 1 Selector")
--definePushButton("GPS_ROW2", 11, 10212, nil,"HSI" , "GPS Row 2 Selector")
--definePushButton("GPS_ROW3", 11, 10213, nil,"HSI" , "GPS Row 3 Selector")
--definePushButton("GPS_ROW4", 11, 10214, nil,"HSI" , "GPS Row 4 Selector")
--definePushButton("GPS_MARK", 11, 10207, nil,"HSI" , "GPS MARK")
--definePushButton("GPS_SET", 11, 10203, nil,"HSI" , "GPS SET")
--definePushButton("GPS_BRT", 11, 10204, nil,"HSI" , "GPS BRT")
--definePushButton("GPS_MINUS", 11, 10205, nil,"HSI" , "GPS -")
--definePushButton("GPS_PLUS", 11, 10206, nil,"HSI" , "GPS +")
--definePushButton("GPS_NR1", 11, 10191, nil,"HSI" , "GPS N.1")
--definePushButton("GPS_NR2", 11, 10192, nil,"HSI" , "GPS N.2")
--definePushButton("GPS_NR3", 11, 10193, nil,"HSI" , "GPS N.3")
--definePushButton("GPS_NR4", 11, 10194, nil,"HSI" , "GPS N.4")
--definePushButton("GPS_NR5", 11, 10195, nil,"HSI" , "GPS N.5")
--definePushButton("GPS_NR6", 11, 10196, nil,"HSI" , "GPS N.6")
--definePushButton("GPS_NR7", 11, 10197, nil,"HSI" , "GPS N.7")
--definePushButton("GPS_NR8", 11, 10198, nil,"HSI" , "GPS N.8")
--definePushButton("GPS_NR9", 11, 10199, nil,"HSI" , "GPS N.9")
--definePushButton("GPS_NR0", 11, 10200, nil,"HSI" , "GPS N.0")
--definePushButton("GPS_CLR", 11, 10201, nil,"HSI" , "GPS CLR")
--definePushButton("GPS_ENT", 11, 10202, nil,"HSI" , "GPS ENT")
--definePushButton("GPS_MODE", 11, 10215, nil,"HSI" , "GPS MODE")

--ADI
defineRotary("CLOCK_WIND_ROTATRY", 12, 3001, 15, "ADI", "ADI Pitch Trim Knob")

--ALTIMETER
defineRotary("PRESS_ALT", 13, 3002, 241, "Altimeter", "Press Altimeter Knob")

--GUARD SWITCHES
defineToggleSwitch("BUS_RESET_SW", 14, 10150, 231,"Guard Switches" , "BUS RESET Switch")
defineToggleSwitch("BUS_RESET_GD", 14, 10100, 233,"Guard Switches" , "BUS RESET Guard")
defineToggleSwitch("FUEL_OFF_GD", 14, 10101, 237,"Guard Switches" , "Fuel SHUT-OFF Guard")
defineToggleSwitch("FUEL_OFF_SW", 14, 10151, 248,"Guard Switches" , "Fuel SHUT-OFF Switch")
defineToggleSwitch("AIL_SERVO_GD", 14, 10104, 235,"Guard Switches" , "AIL Servo Guard")
defineToggleSwitch("AIL_SERVO_SW", 14, 10156, 260,"Guard Switches" , "AIL Servo Switch")
defineToggleSwitch("GROUND_FIRE_SW", 14, 11004, 506,"Guard Switches" , "GROUND FIRE Switch")
defineToggleSwitch("GROUND_FIRE_GD", 14, 11001, 236,"Guard Switches" , "GROUND FIRE Guard")
defineToggleSwitch("CABIN_PRESS_GD", 14, 10105, 234,"Guard Switches" , "CABIN PRESS Guard")
defineToggleSwitch("CABIN_PRESS_SW", 14, 10157, 264,"Guard Switches" , "CABIN PRESS Switch")

--WARN
definePushButton("WARN_LIGHT_BT", 15, 10051, 304,"Warning" , "WARN LT TEST Button")
definePushButton("MASTER_CAUTION_RESET", 15, 10415, 209,"Warning" , "Master Caution Reset")

--SMOKES
defineToggleSwitch("SMK_MASTER", 17, 10330, 330,"Smokes" , "Smoke Master Switch")
defineToggleSwitch("SMK_WHITE", 17, 10331, 331,"Smokes" , "Smoke White Switch")
defineToggleSwitch("SMK_COLOR", 17, 10332, 332,"Smokes" , "Smoke Color Switch")

--SOUND_SYSTEM
defineToggleSwitch("WARN_SILENCE", 19, 10164, 382,"Sound System" , "WARNING SILENCE")
 
--NAV
defineToggleSwitch("FLT_HDG", 23, 10184, 333,"NAV" , "FLT DIR HDG Button")
defineToggleSwitch("FLT_GS_ARM", 23, 10185, 334,"NAV" , "FLT DIR GS ARM Button")
defineToggleSwitch("FLT_STBY", 23, 10186, 335,"NAV" , "FLT DIR STBY Button")
defineToggleSwitch("FLT_RADIO_NAV", 23, 10187, 336,"NAV" , "FLT DIR RADIO NAV Button")
defineToggleSwitch("FLT_GS", 23, 10188, 337,"NAV" , "FLT DIR GS Button")
defineToggleSwitch("FLT_ALT_HOLD", 23, 10189, 338,"NAV" , "FLT DIR ALT HOLD Button")
defineToggleSwitch("GPS", 23, 10180, 345,"NAV" , "GPS On/Off")
defineToggleSwitch("TACAN", 23, 10181, 346,"NAV" , "TACAN On/Off")
defineToggleSwitch("VOR", 23, 10182, 347,"NAV" , "VOR On/Off")
defineToggleSwitch("RNAV", 23, 10183, 348,"NAV" , "RNAV On/Off")
defineToggleSwitch("NAV", 23, 3001, 384,"NAV" , "NAV On/Off")

--WEAPONS
defineToggleSwitch("MASTER_ARM", 26, 3014, 475, "Weapons" , "MASTER ARMAMENT Switch")
defineToggleSwitch("GUNSIGHT_PWR", 26, 11216, 478, "Weapons" , "Gunsight PWR Switch")
definePotentiometer("GUNSIGHT_BRT", 26, 3013, 479, {0, 1}, "Weapons", "Gunsight BRT Knob")
definePushButton("GUNSIGHT_TEST", 26, 11218, 480, "Weapons" , "Gunsight TEST Button")
defineTumb("DEPRESS_100", 26, 3010, 481, 0.1, {0.0, 1.0}, nil, false,"Weapons" , "Depression Reticle x 100 Roller")
defineTumb("DEPRESS_10", 26, 3011, 482, 0.1, {0.0, 1.0}, nil, false,"Weapons" , "Depression Reticle x 10 Roller")
defineTumb("DEPRESS_1", 26, 3012, 483, 0.1, {0.0, 1.0}, nil, false,"Weapons" , "Depression Reticle x 1 Roller")
defineToggleSwitch("BOMB_FUZE", 26, 11227, 494, "Weapons" , "BOMB FUZE Selector")
defineToggleSwitch("BOMB_SEQUENCE", 26, 11226, 495, "Weapons" , "SEQUENCE RIPPLE/SINGLE Switch")
defineToggleSwitch("STATION_1", 26, 11220, 488, "Weapons" , "STATION 1 Selector")
defineToggleSwitch("STATION_2", 26, 11221, 489, "Weapons" , "STATION 2 Selector")
defineToggleSwitch("STATION_3", 26, 11222, 490, "Weapons" , "STATION 3 Selector")
defineToggleSwitch("STATION_4", 26, 11223, 491, "Weapons" , "STATION 4 Selector")
defineToggleSwitch("STATION_5", 26, 11224, 492, "Weapons" , "STATION 5 Selector")
defineToggleSwitch("STATION_6", 26, 11225, 493, "Weapons" , "STATION 6 Selector")
definePushButton("SALVO_JETTISON", 26, 3015, 473, "Weapons" , "SALVO JETTISON Button")
defineToggleSwitch("SELECT_JETTISON", 26, 3016, 70, "Weapons" , "SELECTIVE JETTISON Button")

--FUEL SYSTEMS
defineTumb("FUEL_QUANT", 27, 3008, 257, 0.1, {0.0, 0.4}, nil, false,"Fuel Systems" , "Fuel Quantity Selector Knob")
definePushButton("FUEL_TEST", 27, 10411, 258,"Fuel Systems" , "Fuel Test Button")
defineToggleSwitch("FUEL_TRANSFER", 27, 10152, 249,"Fuel Systems" , "TIP/PYLON Fuel Transfer Switch")

--GAUGES
defineFloat("ENGINE_RPM", 16, {0.0, 1.0}, "Gauges", "Engine RPM")
defineFloat("TRIM_RUDDER", 540, {-1.0, 1.0}, "Gauges", "Trim Rudder")
defineFloat("ANEMOMETER", 8, {0.0, 1.0}, "Gauges", "Anemometer")
defineFloat("INDEX_MACHMETER", 541, {0.0, 1.0}, "Gauges", "Index Machmeter")
defineFloat("TRIANGLE_MACHMETER", 542, {0.0, 1.0}, "Gauges", "Triagle Machmeter")
defineFloat("VARIOMETER", 208, {-1.0, 1.0}, "Gauges", "Variometer")
defineFloat("ALTIMETER_100", 50, {0.0, 1.0}, "Gauges", "Altimeter 100")
defineFloat("ALTIMETER_1000", 52, {0.0, 1.0}, "Gauges", "Altimeter 1000")
defineFloat("ALTIMETER_10000", 53, {0.0, 1.0}, "Gauges", "Altimeter 10000")
defineFloat("ALTIMETER_PRESS_1000", 242, {0.0, 1.0}, "Gauges", "Altimeter Pressure 1000")
defineFloat("ALTIMETER_PRESS_100", 243, {0.0, 1.0}, "Gauges", "Altimeter Pressure 100")
defineFloat("ALTIMETER_PRESS_10", 244, {0.0, 1.0}, "Gauges", "Altimeter Pressure 10")
defineFloat("ALTIMETER_PRESS_1", 245, {0.0, 1.0}, "Gauges", "Altimeter Pressure 1")
defineFloat("G_METER", 6, {-0.4,  1}, "Gauges", "G Meter")
defineFloat("RPM_INT", 33, {0.0, 1.0}, "Gauges", "RPM Int")
defineFloat("RPM_EXT", 16, {0.0, 1.0}, "Gauges", "RPM Ext")
defineFloat("COMPASS", 305, {0.0, 1.0}, "Gauges", "Compass")
defineFloat("COMPASS_PITCH", 299, {1.0, -1.0}, "Gauges", "Compass Pitch")
defineFloat("COMPASS_ROLL", 298, {1.0, -1.0}, "Gauges", "Compass Roll")

--Indicator Lights
defineIndicatorLight("MASTER_CAUTION", 209, "Indicator Lights","Master Caution")
defineIndicatorLight("CANOPY_WARN", 399, "Indicator Lights","Canopy Warning")
defineIndicatorLight("TACAN_LIGHT", 369, "Indicator Lights","TACAN Light")
defineIndicatorLight("WARN_DC1", 210, "Indicator Lights","DC 1 Off Warning")
defineIndicatorLight("WARN_DC2", 211, "Indicator Lights","DC 2 Off Warning")
defineIndicatorLight("WARN_BATT1", 212, "Indicator Lights","Battery 1 Warning")
defineIndicatorLight("WARN_BATT2", 213, "Indicator Lights","Battery 2 Warning")
defineIndicatorLight("WARN_BATT_HOT", 214, "Indicator Lights","Battery Hot Warning")
defineIndicatorLight("WARN_AC_ESS", 215, "Indicator Lights","AC ESS Bus Warning")
defineIndicatorLight("WARN_AC_SEC", 216, "Indicator Lights","AC SEC Bus Warning")
defineIndicatorLight("WARN_CKT_BKR", 217, "Indicator Lights","CKT BKR Warning")
defineIndicatorLight("WARN_AIL_SERVO", 218, "Indicator Lights","AIL SERVO Warning")
defineIndicatorLight("WARN_OXY_LOW", 219, "Indicator Lights","OXY LOW Warning")
defineIndicatorLight("WARN_DUCT_ICE", 220, "Indicator Lights","Duct Anti Ice Warning")
defineIndicatorLight("WARN_PYL_EMPTY", 221, "Indicator Lights","PYL TK Empty Warning")
defineIndicatorLight("WARN_FUEL_TRANS", 222, "Indicator Lights","Fuel Transfer Warning")
defineIndicatorLight("WARN_TIP_UNBAL", 223, "Indicator Lights","TIP TK UNBAL Warning")
defineIndicatorLight("WARN_FUEL_LOW", 224, "Indicator Lights","Fuel Low Warning")
defineIndicatorLight("WARN_FUEL_PRESS", 225, "Indicator Lights","Fuel Pressure Warning")
defineIndicatorLight("WARN_OIL_PRESS", 226, "Indicator Lights","Oil Pressure Warning")
defineIndicatorLight("WARN_ICE", 227, "Indicator Lights","Ice Warning")
defineIndicatorLight("WARN_LIGHT", 228, "Indicator Lights","Warning")
defineIndicatorLight("WARN_IFF", 229, "Indicator Lights","IFF Warning")
defineIndicatorLight("WARN_IFF4", 230, "Indicator Lights","IFF Mode 4 Warning")
defineIndicatorLight("RUD_TAKEOFF_TRIM", 251, "Indicator Lights","Rudder Take Off Trim")
defineIndicatorLight("AIL_TAKEOFF_TRIM", 252, "Indicator Lights","Aileron Take Off Trim")
defineIndicatorLight("WARN_FIRE", 253, "Indicator Lights","Fire Warning")
defineIndicatorLight("WARN_STEER", 254, "Indicator Lights","Steering Warning")
defineIndicatorLight("WARN_ANTI_SKID", 255, "Indicator Lights","Anti Skid Warning")
defineIndicatorLight("WARN_OVERHEAT", 256, "Indicator Lights","Overheat Warning")

BIOS.protocol.endModule()