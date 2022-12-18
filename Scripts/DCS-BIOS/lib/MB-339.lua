BIOS.protocol.beginModule("MB-339", 0x8200)
BIOS.protocol.setExportModuleAircrafts({"MB-339A", "MB-339APAN"})
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

-- remove Arg# Pilot 1000 / Copilot 1002

--Breakers
defineToggleSwitch("CB_IFF", 1, 3911, 1114, "Circuit Breakers", "C/B IFF")
defineToggleSwitch("CB_HYD_PRESS", 1, 3912, 1115, "Circuit Breakers", "C/B Hyd Press")
defineToggleSwitch("CB_OIL_PRESS", 1, 3913, 1116, "Circuit Breakers", "C/B Oil Press")
--defineToggleSwitch("CB_HSI", 1, 3914, 1121, "Circuit Breakers", "C/B HSI")
defineToggleSwitch("CB_ADI", 1, 3915, 1122, "Circuit Breakers", "C/B ADI")
--defineToggleSwitch("CB_FD_CMPTR", 1, 3916, 1123, "Circuit Breakers", "C/B F/D Cmptr")
defineToggleSwitch("CB_SIGHT", 1, 3917, 1124, "Circuit Breakers", "C/B Sight")
defineToggleSwitch("CB_AHR_GPS", 1, 3918, 1125, "Circuit Breakers", "C/B AHR/GPS")
--defineToggleSwitch("CB_HSI_COMD", 1, 3919, 1126, "Circuit Breakers", "C/B HSI/COMD")
--defineToggleSwitch("CB_VOR_ILS", 1, 3920, 1127, "Circuit Breakers", "C/B VOR ILS")
--defineToggleSwitch("CB_UTIL_PW", 1, 3921, 1131, "Circuit Breakers", "C/B Util Pwr")
--defineToggleSwitch("CB_TACAN", 1, 3922, 1132, "Circuit Breakers", "C/B TACAN")
defineToggleSwitch("CB_FORM_LT", 1, 3923, 1134, "Circuit Breakers", "C/B Form Lt")
defineToggleSwitch("CB_AHR_GPS", 1, 3924, 1135, "Circuit Breakers", "C/B AHR/GPS")
--defineToggleSwitch("CB_ADF", 1, 3925, 1136, "Circuit Breakers", "C/B ADF")
--defineToggleSwitch("CB_TACAN", 1, 3922, 1132, "Circuit Breakers", "C/B TACAN")
defineToggleSwitch("CB_STBY_ATT_FWD", 1, 3929, 1213, "Circuit Breakers", "C/B Fwd Stby Att Ind")
defineToggleSwitch("CB_STBY_ATT_AFT", 1, 3930, 1214, "Circuit Breakers", "C/B Aft Stby Att Ind")
defineToggleSwitch("CB_COMM2", 1, 3931, 1215, "Circuit Breakers", "C/B COMM2")
defineToggleSwitch("CB_IFF 2", 1, 3933, 1217, "Circuit Breakers", "C/B IFF 2")
defineToggleSwitch("CB_WING_FLAP", 1, 3934, 1221, "Circuit Breakers", "C/B Wing Flap")
defineToggleSwitch("CB_SPD_BRAKE", 1, 3935, 1222, "Circuit Breakers", "C/B Spd Brake")
defineToggleSwitch("CB_POS_IND", 1, 3936, 1223, "Circuit Breakers", "C/B Pos Ind")
defineToggleSwitch("CB_LG", 1, 3937, 1224, "Circuit Breakers", "C/B LG")
defineToggleSwitch("CB_LG_DN_MON", 1, 3938, 1225, "Circuit Breakers", "C/B LG Down Mon")
defineToggleSwitch("CB_FUEL_QTY", 1, 3939, 1226, "Circuit Breakers", "C/B Fuel Qty")
defineToggleSwitch("CB_JPT_IND", 1, 3940, 1227, "Circuit Breakers", "C/B Jpt Ind")
defineToggleSwitch("CB_AIR_COND", 1, 3941,1231, "Circuit Breakers", "C/B Air Cond")
defineToggleSwitch("CB_ENG_START", 1, 3942,1232, "Circuit Breakers", "C/B Eng Start")
defineToggleSwitch("CB_DUMP_OFF", 1, 3946,1236, "Circuit Breakers", "C/B Dump Shut-Off")
defineToggleSwitch("CB_OXY_PRESS", 1, 3949,1242, "Circuit Breakers", "C/B Oxy Press")
defineToggleSwitch("CB_ARMT_SEL", 1, 3950,1243, "Circuit Breakers", "C/B Armt Sel")
defineToggleSwitch("CB_FUEL_PUMP", 1, 3951,1244, "Circuit Breakers", "C/B Fuel Pump")
defineToggleSwitch("CB_STORE_JETT", 1, 3952,1245, "Circuit Breakers", "C/B Store Jett")
defineToggleSwitch("CB_INV_MAIN", 1, 3953,1246, "Circuit Breakers", "C/B Main Inv")
defineToggleSwitch("CB_INV_STBY", 1, 3954,1247, "Circuit Breakers", "C/B Stby Inv")
defineToggleSwitch("CB_TRIM_A_E", 1, 3955,1251, "Circuit Breakers", "C/B Ail & Elev Trim")
defineToggleSwitch("CB_AIL_SERVO", 1, 3956,1252, "Circuit Breakers", "C/B Ail Servo")
defineToggleSwitch("CB_CAUTION_L", 1, 3957,1253, "Circuit Breakers", "C/B Caution Lt")
defineToggleSwitch("CB_INV_CONTR_MAIN", 1, 3959,1255, "Circuit Breakers", "C/B Main Inv Contr")
defineToggleSwitch("CB_INV_CONTR_STBY", 1, 3961,1257, "Circuit Breakers", "C/B Stby Inv Contr")
defineToggleSwitch("CB_ANTI_SKID", 1, 3962,1411, "Circuit Breakers", "C/B Anti-Skid")
defineToggleSwitch("CB_AC_PRI_BUS", 1, 3963,1412, "Circuit Breakers", "C/B AC Pri Bus")
defineToggleSwitch("CB_LDG_L_MTR", 1, 3965,1414, "Circuit Breakers", "C/B Ldg Lt Mtr")
defineToggleSwitch("CB_BCN", 1, 3966,1415, "Circuit Breakers", "C/B Bcn")
defineToggleSwitch("CB_NAV_L", 1, 3967,1416, "Circuit Breakers", "C/B Nav Lt")
defineToggleSwitch("CB_AOA", 1, 3973,1431, "Circuit Breakers", "C/B AOA")
defineToggleSwitch("CB_NW_STEER", 1, 3974,1432, "Circuit Breakers", "C/B NW Steer")
defineToggleSwitch("CB_JPT_LIMIT", 1, 3975,1433, "Circuit Breakers", "C/B JPT Limiter")
defineToggleSwitch("CB_FUEL_FLOW_IND", 1, 3977,1435, "Circuit Breakers", "C/B Fuel Flow ind")
defineToggleSwitch("CB_FUEL_TRANS", 1, 3978,1436, "Circuit Breakers", "C/B Fuel Trans")
defineToggleSwitch("CB_TRIM_R", 1, 3979,1437, "Circuit Breakers", "C/B Rud Trim")
defineToggleSwitch("CB_TAXI_L", 1, 3982,1445, "Circuit Breakers", "C/B Taxi Lt")
defineToggleSwitch("CB_LDG_L", 1, 3983,1446, "Circuit Breakers", "C/B Ldg Lt")
defineToggleSwitch("CB_PITOT_FWD", 1, 3984,1452, "Circuit Breakers", "C/B Fwd Pitot")
defineToggleSwitch("CB_PITOT_AFT", 1, 3985,1453, "Circuit Breakers", "C/B Aft Pitot")
defineToggleSwitch("CB_ENG_ANTI_ICE", 1, 3986,1454, "Circuit Breakers", "C/B Engine Anti-Ice")
defineToggleSwitch("CB_WHSLD_DEM", 1, 3987,1455, "Circuit Breakers", "C/B Whsld Dem")
defineToggleSwitch("CB_ICE_DETR", 1, 3988,1456, "Circuit Breakers", "C/B Ice Detr")
defineToggleSwitch("CB_SIGHT", 1, 3989,1457, "Circuit Breakers", "C/B Sight")
defineToggleSwitch("CB_CDU_FWD", 1, 3990,1511, "Circuit Breakers", "C/B Fwd Cdu")
defineToggleSwitch("CB_CDU_AFT", 1, 3991,1512, "Circuit Breakers", "C/B Aft Cdu")
defineToggleSwitch("CB_AHR_GPS", 1, 3992,1513, "Circuit Breakers", "C/B AHR/GPS")
defineToggleSwitch("CB_COMM_RDU", 1, 3995,1522, "Circuit Breakers", "C/B COMM RDU")

--Electrical
defineToggleSwitch("BATTERY_SW", 1, 3095, 300, "Electrical", "Battery")
defineToggleSwitch("GEN1_SW", 1, 3096, 301, "Electrical", "Generator 1")
defineToggleSwitch("GEN2_SW", 1, 3097, 302, "Electrical", "Generator 2")
defineToggleSwitch("AC_PW_SW", 1, 3098, 303, "Electrical", "AC Power")
defineToggleSwitch("BUS_RESET_SW", 1, 3099, 231, "Electrical", "Bus Reset Switch")
defineToggleSwitch("BUS_RESET_CV", 1, 3100, 233, "Electrical", "Bus Reset Cover")

--Simple avionics
defineRotary("FW_SET_INDEX", 1, 3101, 541, "Avionics FW", "Forward Set Index")
defineRotary("FW_ALTIMETER_KNOB", 1, 3102, 241, "Avionics FW", "Forward Altimeter Pressure Setting")
definePushButton("FW_G_RESET", 1, 3104, 259, "Avionics FW", "Forward Reset Min/Max G")

defineRotary("AFT_ALTIMETER_KNOB", 1, 3103, 570, "Avionics AFT", "Aft Altimeter Pressure Setting")
definePushButton("AFT_G_RESET", 1, 3105, 691, "Avionics AFT", "Aft Reset Min/Max G")

--Chrono
definePushButton("FW_CLOCK_BTN", 1, 3106, 44, "Clock FW", "Forward Clock Start/Stop/Reset")
defineToggleSwitch("FW_CLOCK_SET_PULL", 1, 3107, 45, "Clock FW", "Forward Clock Set Pull")
defineRotary("FW_CLOCK_SET_KNOB", 1, 3108, 51, "Clock FW", "Forward Clock Set Rotate")

definePushButton("AFT_CLOCK_BTN", 1, 3109, 28, "Clock AFT", "Aft Clock Start/Stop/Reset")
defineToggleSwitch("AFT_CLOCK_SET_PULL", 1, 3110, 29, "Clock AFT", "Aft Clock Set Pull")
defineRotary("AFT_CLOCK_SET_KNOB", 1, 3111, 30, "Clock AFT", "Aft Clock Set Rotate")

-- ADI

--HSI
defineRotary("FW_HSI_HDG", 1, 3118, 362, "HSI FW", "Forward HSI Heading Set")
defineRotary("FW_HSI_CRS", 1, 3119, 353, "HSI FW", "Forward HSI Course Set")

defineRotary("AFT_HSI_HDG", 1, 3120, 196, "HSI AFT", "Aft HSI Heading Set")
defineRotary("AFT_HSI_CRS", 1, 3121, 187, "HSI AFT", "Aft HSI Course Set")

--Flight dir
definePushButton("FW_FD_HDG", 1, 3122, 333, "Flight Dir FW", "Forward F/D HDG")
definePushButton("FW_FD_GS_ARM", 1, 3123, 334, "Flight Dir FW", "Forward F/D GS ARM")
definePushButton("FW_FD_STBY", 1, 3124, 335, "Flight Dir FW", "Forward F/D STBY")
definePushButton("FW_FD_RADIO_NAV", 1, 3125, 336, "Flight Dir FW", "Forward F/D RADIO NAV")
definePushButton("FW_FD_GS", 1, 3126, 337, "Flight Dir FW", "Forward F/D GS")
definePushButton("FW_FD_ALT_HOLD", 1, 3127, 338, "Flight Dir FW", "Forward F/D ALT HOLD")

definePushButton("AFT_FD_HDG", 1, 3128, 693, "Flight Dir AFT", "Aft F/D HDG")
definePushButton("AFT_FD_GS_ARM", 1, 3129, 695, "Flight Dir AFT", "Aft F/D GS ARM")
definePushButton("AFT_FD_STBY", 1, 3130, 697, "Flight Dir AFT", "Aft F/D STBY")
definePushButton("AFT_FD_RADIO_NAV", 1, 3131, 699, "Flight Dir AFT", "Aft F/D RADIO NAV")
definePushButton("AFT_FD_GS", 1, 3132, 701, "Flight Dir AFT", "Aft F/D GS")
definePushButton("AFT_FD_ALT_HOLD", 1, 3133, 703, "Flight Dir AFT", "Aft F/D ALT HOLD")

-- Fuel

-- L/G & Ground

-- Lights

--Warning panel
definePushButton("WARN_L_TEST", 1, 3172, 304, "Warning Panel", "Warn Lights Test")
definePushButton("FW_MASTER_CAUTION", 1, 3173, 591, "Warning Panel", "Forward Master Caution Reset")
definePushButton("AFT_MASTER_CAUTION", 1, 3173, 591, "Warning Panel", "Aft Master Caution Reset")
definePushButton("WARN_SILENT", 1, 3177, 382, "Warning Panel", "Warning Silence")

--


--CDU FWD
defineToggleSwitch("FW_CDU_GPS_PW", 1, 3237, 345, "CDU FW", "Forward CDU AHRS/GPS System")
definePushButton("FW_CDU_ROW1", 1, 3238, 600, "CDU FW", "Forward CDU Row 1")
definePushButton("FW_CDU_ROW2", 1, 3239, 601, "CDU FW", "Forward CDU Row 2")
definePushButton("FW_CDU_ROW3", 1, 3240, 602, "CDU FW", "Forward CDU Row 3")
definePushButton("FW_CDU_ROW4", 1, 3241, 603, "CDU FW", "Forward CDU Row 4")
definePushButton("FW_CDU_MARK", 1, 3242, 605, "CDU FW", "Forward CDU MARK")
definePushButton("FW_CDU_SET", 1, 3243, 609, "CDU FW", "Forward CDU SET")
definePushButton("FW_CDU_BRT", 1, 3244, 610, "CDU FW", "Forward CDU BRT")
definePushButton("FW_CDU_INC", 1, 3245, 611, "CDU FW", "Forward CDU +")
definePushButton("FW_CDU_DEC", 1, 3246, 612, "CDU FW", "Forward CDU -")
definePushButton("FW_CDU_N1", 1, 3247, 613, "CDU FW", "Forward CDU N. 1")
definePushButton("FW_CDU_N2", 1, 3248, 614, "CDU FW", "Forward CDU N. 2")
definePushButton("FW_CDU_N3", 1, 3249, 615, "CDU FW", "Forward CDU N. 3")
definePushButton("FW_CDU_N4", 1, 3250, 616, "CDU FW", "Forward CDU N. 4")
definePushButton("FW_CDU_N5", 1, 3251, 617, "CDU FW", "Forward CDU N. 5")
definePushButton("FW_CDU_N6", 1, 3252, 618, "CDU FW", "Forward CDU N. 6")
definePushButton("FW_CDU_N7", 1, 3253, 619, "CDU FW", "Forward CDU N. 7")
definePushButton("FW_CDU_N8", 1, 3254, 620, "CDU FW", "Forward CDU N. 8")
definePushButton("FW_CDU_N9", 1, 3255, 621, "CDU FW", "Forward CDU N. 9")
definePushButton("FW_CDU_N0", 1, 3257, 622, "CDU FW", "Forward CDU N. 0")
definePushButton("FW_CDU_CLR", 1, 3258, 623, "CDU FW", "Forward CDU CLR")
definePushButton("FW_CDU_ENT", 1, 3259, 624, "CDU FW", "Forward CDU ENT")
definePushButton("FW_CDU_MODE", 1, 3260, 606, "CDU FW", "Forward CDU MODE")
definePushButton("FW_CDU_STEER", 1, 3261, 607, "CDU FW", "Forward CDU STEER")
definePushButton("FW_CDU_FIX", 1, 3262, 604, "CDU FW", "Forward CDU FIX")
definePushButton("FW_CDU_FLT_PLN", 1, 3263, 608, "CDU FW", "Forward CDU FLT PLN")

--CDU AFT
definePushButton("AFT_CDU_ROW1", 1, 3264, 625, "CDU AFT", "Aft CDU Row 1")
definePushButton("AFT_CDU_ROW2", 1, 3265, 626, "CDU AFT", "Aft CDU Row 2")
definePushButton("AFT_CDU_ROW3", 1, 3266, 627, "CDU AFT", "Aft CDU Row 3")
definePushButton("AFT_CDU_ROW4", 1, 3267, 628, "CDU AFT", "Aft CDU Row 4")
definePushButton("AFT_CDU_MARK", 1, 3268, 630, "CDU AFT", "Aft CDU MARK")
definePushButton("AFT_CDU_SET", 1, 3269, 634, "CDU AFT", "Aft CDU SET")
definePushButton("AFT_CDU_BRT", 1, 3270, 635, "CDU AFT", "Aft CDU BRT")
definePushButton("AFT_CDU_INC", 1, 3271, 636, "CDU AFT", "Aft CDU +")
definePushButton("AFT_CDU_DEC", 1, 3272, 637, "CDU AFT", "Aft CDU -")
definePushButton("AFT_CDU_N1", 1, 3273, 638, "CDU AFT", "Aft CDU N. 1")
definePushButton("AFT_CDU_N2", 1, 3274, 639, "CDU AFT", "Aft CDU N. 2")
definePushButton("AFT_CDU_N3", 1, 3275, 640, "CDU AFT", "Aft CDU N. 3")
definePushButton("AFT_CDU_N4", 1, 3276, 641, "CDU AFT", "Aft CDU N. 4")
definePushButton("AFT_CDU_N5", 1, 3277, 642, "CDU AFT", "Aft CDU N. 5")
definePushButton("AFT_CDU_N6", 1, 3278, 643, "CDU AFT", "Aft CDU N. 6")
definePushButton("AFT_CDU_N7", 1, 3279, 644, "CDU AFT", "Aft CDU N. 7")
definePushButton("AFT_CDU_N8", 1, 3280, 645, "CDU AFT", "Aft CDU N. 8")
definePushButton("AFT_CDU_N9", 1, 3281, 646, "CDU AFT", "Aft CDU N. 9")
definePushButton("AFT_CDU_N0", 1, 3282, 647, "CDU AFT", "Aft CDU N. 0")
definePushButton("AFT_CDU_CLR", 1, 3283, 648, "CDU AFT", "Aft CDU CLR")
definePushButton("AFT_CDU_ENT", 1, 3284, 649, "CDU AFT", "Aft CDU ENT")
definePushButton("AFT_CDU_MODE", 1, 3285, 631, "CDU AFT", "Aft CDU MODE")
definePushButton("AFT_CDU_STEER", 1, 3286, 632, "CDU AFT", "Aft CDU STEER")
definePushButton("AFT_CDU_FIX", 1, 3287, 629, "CDU AFT", "Aft CDU FIX")
definePushButton("AFT_CDU_FLT_PLN", 1, 3288, 633, "CDU AFT", "Aft CDU FLT PLN")

defineFloat("CANOPY_POS", 181, {0, 1}, "Canopy", "Canopy Position")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE", function()
	return math.floor(LoGetAircraftDrawArgumentValue(21)*65535)
end, 65535, "External Aircraft Model", "Speed Brake")
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (red+green)")
defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light (red)")
defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
end, 65535, "External Aircraft Model", "Formation Lights (light green)")
defineIntegerFromGetter("EXT_BOTTOM_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Middle Bottom Light (white)")
defineIntegerFromGetter("EXT_TOP_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(202) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Light (white)")
defineIntegerFromGetter("EXT_TAIL_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(203) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Light (white)")
defineIntegerFromGetter("EXT_FRONT_LANDLIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Front Landing Light (white)")
defineIntegerFromGetter("EXT_WING_LANDLIGHT", function()
	if LoGetAircraftDrawArgumentValue(209) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Wing Landing Light (white)")
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