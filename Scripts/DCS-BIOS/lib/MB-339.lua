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
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3PosTumb = BIOS.util.define3PosTumb
local defineSpringloaded_3PosTumb = BIOS.util.defineSpringloaded_3PosTumb

-- remove Arg# Pilot 1000 / Copilot 1002

--Breakers
defineToggleSwitch("CB_IFF", 1, 3911, 1114, "Circuit Breakers", "C/B IFF")
defineToggleSwitch("CB_HYD_PRESS", 1, 3912, 1115, "Circuit Breakers", "C/B Hyd Press")
defineToggleSwitch("CB_OIL_PRESS", 1, 3913, 1116, "Circuit Breakers", "C/B Oil Press")
defineToggleSwitch("CB_HSI", 1, 3914, 1121, "Circuit Breakers", "C/B HSI")
defineToggleSwitch("CB_ADI", 1, 3915, 1122, "Circuit Breakers", "C/B ADI")
defineToggleSwitch("CB_FD_CMPTR", 1, 3916, 1123, "Circuit Breakers", "C/B F/D Cmptr")
defineToggleSwitch("CB_SIGHT", 1, 3917, 1124, "Circuit Breakers", "C/B Sight")
defineToggleSwitch("CB_AHR_GPS", 1, 3918, 1125, "Circuit Breakers", "C/B AHR/GPS")
defineToggleSwitch("CB_HSI_COMD", 1, 3919, 1126, "Circuit Breakers", "C/B HSI/COMD")
defineToggleSwitch("CB_VOR_ILS", 1, 3920, 1127, "Circuit Breakers", "C/B VOR ILS")
defineToggleSwitch("CB_UTIL_PW", 1, 3921, 1131, "Circuit Breakers", "C/B Util Pwr")
defineToggleSwitch("CB_TACAN", 1, 3922, 1132, "Circuit Breakers", "C/B TACAN")
defineToggleSwitch("CB_FORM_LT", 1, 3923, 1134, "Circuit Breakers", "C/B Form Lt")
defineToggleSwitch("CB_AHR_GPS", 1, 3924, 1135, "Circuit Breakers", "C/B AHR/GPS")
defineToggleSwitch("CB_ADF", 1, 3925, 1136, "Circuit Breakers", "C/B ADF")
defineToggleSwitch("CB_TACAN", 1, 3922, 1132, "Circuit Breakers", "C/B TACAN")
defineToggleSwitch("CB_STBY_ATT_FWD", 1, 3929, 1213, "Circuit Breakers", "C/B Fwd Stby Att Ind")
defineToggleSwitch("CB_STBY_ATT_AFT", 1, 3930, 1214, "Circuit Breakers", "C/B Aft Stby Att Ind")
defineToggleSwitch("CB_COMM2", 1, 3931, 1215, "Circuit Breakers", "C/B COMM2")
defineToggleSwitch("CB_IFF_2", 1, 3933, 1217, "Circuit Breakers", "C/B IFF 2")
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
definePotentiometer("FW_ADI_PITCH", 1, 3112, 15, {0, 1}, "ADI FW", "Forward ADI Pitch Adjustment")
defineToggleSwitch("FW_ADI_CAGE", 1, 3114, 403, "ADI FW", "Forward ADI Cage")
definePotentiometer("FW_ADI_ADJUST", 1, 3115, 401, {-1, 1}, "ADI FW", "Forward ADI Adjust")

definePotentiometer("AFT_ADI_PITCH", 1, 3113, 388, {0, 1}, "ADI AFT", "Aft ADI Pitch Adjustment")
defineToggleSwitch("AFT_ADI_CAGE", 1, 3116, 404, "ADI AFT", "Aft ADI Cage")
definePotentiometer("AFT_ADI_ADJUST", 1, 3117, 402, {-1, 1}, "ADI AFT", "Aft ADI Adjust")

--HSI
defineRotary("FW_HSI_HDG", 1, 3118, 362, "HSI FW", "Forward HSI Heading Set")
defineRotary("FW_HSI_CRS", 1, 3119, 353, "HSI FW", "Forward HSI Course Set")
definePushButton("FW_HSI_TCN", 1, 3219, 346, "HSI FW", "Forward HSI TACAN")
definePushButton("FW_HSI_VOR", 1, 3220, 347, "HSI FW", "Forward HSI VOR")
definePushButton("FW_HSI_RNAV", 1, 3221, 348, "HSI FW", "Forward HSI RNAV")

defineRotary("AFT_HSI_HDG", 1, 3120, 196, "HSI AFT", "Aft HSI Heading Set")
defineRotary("AFT_HSI_CRS", 1, 3121, 187, "HSI AFT", "Aft HSI Course Set")
definePushButton("AFT_HSI_TCN", 1, 3222, 57, "HSI AFT", "Aft HSI TACAN")
definePushButton("AFT_HSI_VOR", 1, 3223, 58, "HSI AFT", "Aft HSI VOR")
definePushButton("AFT_HSI_RNAV", 1, 3224, 59, "HSI AFT", "Aft HSI RNAV")

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

--Fuel
defineMultipositionSwitch("FW_FUEL_TANK_SEL", 1, 3134, 257, 5, 0.25, "Fuel FW", "Forward Fuel Tank Selector")
definePushButton("FW_FUEL_TEST", 1, 3135, 258, "Fuel FW", "Forward Fuel Quantity Test")
defineToggleSwitch("FW_FUEL_OFF_SW", 1, 3138, 248, "Fuel FW", "Foreward Fuel Shut-Off Switch")
defineToggleSwitch("FW_FUEL_OFF_CVR", 1, 3139, 237, "Fuel FW", "Foreward Fuel Shut-Off Guard")
defineToggleSwitch("FW_FUEL_TRANS", 1, 3142, 249, "Fuel FW", "Foreward Fuel Transfer")
defineToggleSwitch("FW_FUEL_DUMP", 1, 3143, 593, "Fuel FW", "Foreward Fuel Dump")

defineMultipositionSwitch("AFT_FUEL_TANK_SEL", 1, 3136, 328, 5, 0.25, "Fuel AFT", "Aft Fuel Tank Selector")
definePushButton("AFT_FUEL_TEST", 1, 3137, 374, "Fuel AFT", "Aft Fuel Quantity Test")
defineToggleSwitch("AFT_FUEL_OFF_SW", 1, 3140, 516, "Fuel AFT", "Aft Fuel Shut-Off Switch")
defineToggleSwitch("AFT_FUEL_OFF_CVR", 1, 3141, 517, "Fuel AFT", "Aft Fuel Shut-Off Guard")
defineToggleSwitch("AFT_FUEL_DUMP", 1, 3144, 160, "Fuel AFT", "Aft Fuel Dump")

--L/G & Ground
defineToggleSwitch("FW_LG_GEAR_LVR", 1, 3154, 4, "Gear FW", "Foreward Gear Lever")
defineToggleSwitch("FW_LG_ASKID", 1, 3145, 250, "Gear FW", "Foreward Anti-Skid")
definePotentiometer("FW_LG_PBRAKE", 1, 3147, 266, {0, 1}, "Gear FW", "Forward Parking Brake Pull")
defineToggleSwitch("FW_LG_PBRAKE_LOCK", 1, 3148, 263, "Gear FW", "Foreward Parking Brake Lock")
defineToggleSwitch("FW_LG_EMERG_GEAR", 1, 3149, 681, "Gear FW", "Foreward Emergency Landing Gear")
definePushButton("FW_LG_DL_OVERRIDE", 1, 5000, 379, "Gear FW", "Foreward Down-Lock Override")
defineSpringloaded_3PosTumb("FW_RUDDER_TRIM", 1, 3151, 3150, 540, "Gear FW", "Foreward Rudder Trim")

defineToggleSwitch("AFT_LG_GEAR_LVR", 1, 3154, 106, "Gear AFT", "Aft Gear Lever")
defineToggleSwitch("AFT_LG_ASKID", 1, 3146, 518, "Gear AFT", "Aft Anti-Skid")
definePushButton("AFT_LG_DL_OVERRIDE", 1, 5001, 14, "Gear AFT", "Aft Down-Lock Override")
defineSpringloaded_3PosTumb("AFT_RUDDER_TRIM", 1, 3152, 3153, 519, "Gear AFT", "Aft Rudder Trim")

--Lights
define3PosTumb("FW_LIGHT_TAXI_LAND", 1, 3156, 321, "Lights FW", "Forward Taxi/Landing Lights")
definePotentiometer("FW_LIGHT_FORMATION", 1, 3157, 502, {0, 1}, "Lights FW", "Forward Formation Lights")
definePotentiometer("FW_LIGHT_INSTRUMENT", 1, 3158, 503, {0, 1}, "Lights FW", "Forward Instruments Lights")
definePotentiometer("FW_LIGHT_FLOOD", 1, 3159, 504, {0, 1}, "Lights FW", "Forward Flood Lights")
definePotentiometer("FW_LIGHT_CONSOLE", 1, 3160, 505, {0, 1}, "Lights FW", "Forward Console Lights")
defineToggleSwitch("FW_LIGHT_NAV_FLASH", 1, 3167, 41, "Lights FW", "Forward Nav Lights Flash/Steady")
define3PosTumb("FW_LIGHT_NAV_BRIGHT", 1, 3168, 40, "Lights FW", "Forward Nav Lights Bright/Dim")
defineToggleSwitch("FW_LIGHT_BEACON", 1, 3169, 685, "Lights FW", "Forward Beacon Lights")
defineToggleSwitch("FW_LIGHT_WARN_BRIGHT", 1, 3170, 322, "Lights FW", "Forward Warn Lights Bright/Dim")

definePotentiometer("AFT_LIGHT_INSTRUMENT", 1, 3161, 510, {0, 1}, "Lights AFT", "Aft Instruments Lights")
definePotentiometer("AFT_LIGHT_FLOOD", 1, 3162, 512, {0, 1}, "Lights AFT", "Aft Flood Lights")
definePotentiometer("AFT_LIGHT_CONSOLE", 1, 3163, 511, {0, 1}, "Lights AFT", "Aft Console Lights")
defineToggleSwitch("AFT_LIGHT_WARN_BRIGHT", 1, 3171, 107, "Lights AFT", "Aft Warn Lights Bright/Dim")

--Warning panel
definePushButton("WARN_L_TEST", 1, 3172, 304, "Warning Panel", "Warn Lights Test")
definePushButton("FW_MASTER_CAUTION", 1, 3173, 591, "Warning Panel", "Forward Master Caution Reset")
definePushButton("AFT_MASTER_CAUTION", 1, 3173, 591, "Warning Panel", "Aft Master Caution Reset")
definePushButton("WARN_SILENT", 1, 3177, 382, "Warning Panel", "Warning Silence")

--Engine
defineToggleSwitch("ENG_MASTER", 1, 3178, 238, "Engine", "Engine Master")
defineToggleSwitch("ENG_JPT_LIMIT", 1, 3179, 240, "Engine", "JPT Limiter")
definePushButton("ENG_START", 1, 3180, 239, "Engine", "Engine Start")

--Flight Controls
defineToggleSwitch("FW_FC_CANOPY_LOCK", 1, 3181, 182, "Flight Controls FW", "Forward Canopy LOCK/UNLOCK")
defineToggleSwitch("FW_FC_CANOPY_HOOK", 1, 3182, 183, "Flight Controls FW", "Forward Partial Opening Hook")
definePushButton("FW_FC_CANOPY_UNLOCK", 1, 5002, 582, "Flight Controls FW", "Forward Canopy UNLOCK")
defineToggleSwitch("FW_FC_CANOPY_HND", 1, 3183, 750, "Flight Controls FW", "Forward Canopy Handle")
defineToggleSwitch("FW_FC_LOCK", 1, 3186, 232, "Flight Controls FW", "Forward Flight Controls LOCK/UNLOCK")
defineToggleSwitch("FW_FC_MIRRORS", 1, 3187, 400, "Flight Controls FW", "Forward Mirrors OPEN/CLOSE")
defineToggleSwitch("FW_FC_AILERON_SERVO_CV", 1, 3193, 235, "Flight Controls FW", "Forward Aileron Servo Guard")
defineToggleSwitch("FW_FC_AILERON_SERVO", 1, 3194, 260, "Flight Controls FW", "Forward Aileron Servo Switch")

defineToggleSwitch("AFT_FC_CANOPY_LOCK", 1, 3184, 43, "Flight Controls AFT", "Aft Canopy LOCK/UNLOCK")
defineToggleSwitch("AFT_FC_MIRRORS", 1, 3187, 594, "Flight Controls AFT", "Aft Mirrors OPEN/CLOSE")
defineToggleSwitch("AFT_FC_AILERON_SERVO_CV", 1, 3195, 288, "Flight Controls AFT", "Aft Aileron Servo Guard")
defineToggleSwitch("AFT_FC_AILERON_SERVO", 1, 3196, 289, "Flight Controls AFT", "Aft Aileron Servo Switch")

--Pressurisation
defineToggleSwitch("PRESS_RAMAIR_SCOOP", 1, 3197, 590, "Pressurisation", "Ram Air Scoop")
defineToggleSwitch("PRESS_CABIN_PRESS", 1, 3198, 264, "Pressurisation", "Cabin Pressure Switch")
defineToggleSwitch("PRESS_CABIN_PRESS_CVR", 1, 3199, 234, "Pressurisation", "Cabin Pressure Switch Guard")
definePotentiometer("PRESS_CABIN_TEMP", 1, 3200, 179, {0, 1}, "Pressurisation", "Cabin Temp")

--Smoke
defineToggleSwitch("SMOKE_MASTER", 1, 3201, 330, "Smoke", "Smoke Master Switch")
defineToggleSwitch("SMOKE_WHITE", 1, 3202, 331, "Smoke", "Smoke White Switch")
defineToggleSwitch("SMOKE_COLOR", 1, 3203, 332, "Smoke", "Smoke Color Switch")

--Anti Ice
define3PosTumb("AI_ENG_AICE", 1, 3204, 262, "Anti Ice", "Engine Anti-Ice")
define3PosTumb("AI_FW_PITOT_AICE", 1, 3205, 261, "Anti Ice", "Front Pitot Anti-Ice")
define3PosTumb("AI_AFT_PITOT_AICE", 1, 3206, 149, "Anti Ice", "Rear Pitot Anti-Ice")
define3PosTumb("AI_WS_DEMIST", 1, 3207, 178, "Anti Ice", "Windshield Demist")
define3PosTumb("AI_WS_RAIN", 1, 3208, 177, "Anti Ice", "Windshield Rain RMVL")

-- Ejection seat
defineToggleSwitch("SEAT_FIRE", 1, 3209, 205, "Seat", "Seat Firing Handle")
defineSpringloaded_3PosTumb("SEAT_ADJ", 1, 3211, 3212, 323, "Seat", "Adj Seat UP/DOWN")
defineToggleSwitch("SEAT_PIN_CANOPY", 1, 3213, 377, "Seat", "Ejection Safety Pin to Canopy")
defineToggleSwitch("SEAT_PIN_SEAT", 1, 3214, 376, "Seat", "Ejection Safety Pin to Seat")

--Control shift
definePushButton("FW_CONTROL_TCN", 1, 3225, 324, "Control Shift FW", "Forward TACAN Control Shift")
definePushButton("FW_CONTROL_ILS", 1, 3226, 326, "Control Shift FW", "Forward VOR-ILS Control Shift")
definePushButton("FW_CONTROL_NAV", 1, 3227, 384, "Control Shift FW", "Forward NAV Control Shift")
definePushButton("FW_CONTROL_COM1", 1, 3228, 307, "Control Shift FW", "Forward COMM1 Control Shift")
definePushButton("FW_CONTROL_COM2", 1, 3229, 309, "Control Shift FW", "Forward COMM2 Control Shift")
definePushButton("FW_CONTROL_ADF", 1, 3230, 317, "Control Shift FW", "Forward ADF Control Shift")

definePushButton("AFT_CONTROL_TCN", 1, 3231, 273, "Control Shift AFT", "Aft TACAN Control Shift")
definePushButton("AFT_CONTROL_ILS", 1, 3232, 275, "Control Shift AFT", "Aft VOR-ILS Control Shift")
definePushButton("AFT_CONTROL_NAV", 1, 3233, 277, "Control Shift AFT", "Aft NAV Control Shift")
definePushButton("AFT_CONTROL_COM1", 1, 3234, 267, "Control Shift AFT", "Aft COMM1 Control Shift")
definePushButton("AFT_CONTROL_COM2", 1, 3235, 269, "Control Shift AFT", "Aft COMM2 Control Shift")
definePushButton("AFT_CONTROL_ADF", 1, 3236, 271, "Control Shift AFT", "Aft ADF Control Shift")

--CDU
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

--Weapons
defineToggleSwitch("WP_GND_FIRE_CVR", 1, 3289, 236, "Weapons", "Ground Fire Guard")
defineToggleSwitch("WP_MASTER_ARM", 1, 3290, 475, "Weapons", "Master Armament")
definePushButton("WP_JETT_SALVO", 1, 3291, 473, "Weapons", "Salvo Jettison")
definePushButton("WP_JETT_SEL", 1, 3292, 70, "Weapons", "Selective Jettison")
define3PosTumb("WP_BOMB_FUZE", 1, 3293, 494, "Weapons", "Bomb Fuze")
defineToggleSwitch("WP_SEQUENCE", 1, 3294, 495, "Weapons", "Sequence Ripple/Single")
defineToggleSwitch("WP_STATION1", 1, 3295, 488, "Weapons", "Station 1")
defineToggleSwitch("WP_STATION2", 1, 3296, 489, "Weapons", "Station 2")
defineToggleSwitch("WP_STATION3", 1, 3297, 490, "Weapons", "Station 3")
defineToggleSwitch("WP_STATION4", 1, 3298, 491, "Weapons", "Station 4")
defineToggleSwitch("WP_STATION5", 1, 3299, 492, "Weapons", "Station 5")
defineToggleSwitch("WP_STATION6", 1, 3300, 493, "Weapons", "Station 6")
defineToggleSwitch("WP_GND_FIRE", 1, 3301, 506, "Weapons", "Ground Fire")
defineToggleSwitch("WP_MASTER_ARM_INIB_CVR", 1, 3302, 169, "Weapons", "Master Arm Inib Guard")
defineToggleSwitch("WP_MASTER_ARM_INIB", 1, 3303, 170, "Weapons", "Master Arm Inib")

--Gunsight
define3PosTumb("GUN_PWR", 1, 3304, 478, "Gunsight", "Gunsight Power")
definePotentiometer("GUN_BRIGHT", 1, 3306, 479, {0, 1}, "Gunsight", "Gunsight Brightness")
definePushButton("GUN_TEST", 1, 3307, 480, "Gunsight", "Gunsight Test")
definePotentiometer("GUN_DEP_100", 1, 3308, 481, {0, 1}, "Gunsight", "Gunsight Depression reticle x 100")
definePotentiometer("GUN_DEP_10", 1, 3309, 482, {0, 1}, "Gunsight", "Gunsight Depression reticle x 10")
definePotentiometer("GUN_DEP_1", 1, 3310, 483, {0, 1}, "Gunsight", "Gunsight Depression reticle x 1")

--VOR
definePotentiometer("FW_VOR_FREQU_1MHZ", 1, 3311, 563, {0, 1}, "VOR FW", "Forward VOR Frequency 1MHz")
definePotentiometer("FW_VOR_FREQU_50KHZ", 1, 3312, 564, {0, 1}, "VOR FW", "Forward VOR Frequency 50 kHz")
definePushButton("FW_VOR_TEST", 1, 3313, 561, "VOR FW", "Forward VOR Frequency Test")
defineToggleSwitch("FW_VOR_PW", 1, 3314, 562, "VOR FW", "Forward VOR Frequency Power Switch")

definePotentiometer("AFT_VOR_FREQU_1MHZ", 1, 3315, 539, {0, 1}, "VOR AFT", "Aft VOR Frequency 1MHz")
definePotentiometer("AFT_VOR_FREQU_50KHZ", 1, 3316, 34, {0, 1}, "VOR AFT", "Aft VOR Frequency 50 kHz")
definePushButton("AFT_VOR_TEST", 1, 3317, 537, "VOR AFT", "Aft VOR Frequency Test")
defineToggleSwitch("AFT_VOR_PW", 1, 3318, 538, "VOR AFT", "Aft VOR Frequency Power Switch")

--Tacan
defineMultipositionSwitch("FW_TCN_MODE", 1, 3319, 569, 5, 0.25, "TACAN FW", "Forward TACAN Mode")
defineToggleSwitch("FW_TCN_XY", 1, 3320, 552, "TACAN FW", "Forward TACAN X/Y Switch")
defineMultipositionSwitch("FW_TCN_1", 1, 3321, 553, 10, 0.1, "TACAN FW", "Forward TACAN Units")
defineMultipositionSwitch("FW_TCN_10", 1, 3322, 554, 13, 0.08333, "TACAN FW", "Forward TACAN Tens")
definePushButton("FW_TCN_TEST", 1, 3323, 555, "TACAN FW", "Forward TACAN Test")

defineMultipositionSwitch("AFT_TCN_MODE", 1, 3324, 571, 5, 0.25, "TACAN AFT", "Aft TACAN Mode")
defineToggleSwitch("AFT_TCN_XY", 1, 3325, 572, "TACAN AFT", "Aft TACAN X/Y Switch")
defineMultipositionSwitch("AFT_TCN_1", 1, 3326, 573, 10, 0.1, "TACAN AFT", "Aft TACAN Units")
defineMultipositionSwitch("AFT_TCN_10", 1, 3327, 574, 13, 0.08333, "TACAN AFT", "Aft TACAN Tens")
definePushButton("AFT_TCN_TEST", 1, 3328, 575, "TACAN AFT", "Aft TACAN Test")

--

--Comm2
defineMultipositionSwitch("FW_COM2_MODE", 1, 3351, 650, 5, 0.25, "Comm2 FW", "Forward Comm 2 Mode")
defineMultipositionSwitch("FW_COM2_FUNC", 1, 3352, 651, 5, 0.25, "Comm2 FW", "Forward Comm 2 Function")
definePotentiometer("FW_COM2_BRIGHT", 1, 3353, 652, {0, 1}, "Comm2 FW", "Forward Comm 2 Brightness")
defineSpringloaded_3PosTumb("FW_COM2_CHN_1", 1, 3354, 3355, 654, "Comm2 FW", "Forward Comm 2 Channel x1")
defineSpringloaded_3PosTumb("FW_COM2_CHN_10", 1, 3356, 3357, 655, "Comm2 FW", "Forward Comm 2 Channel 1x")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_1", 1, 3358, 3359, 656, "Comm2 FW", "Forward Comm 2 Frequency xxxx1")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_10", 1, 3360, 3361, 657, "Comm2 FW", "Forward Comm 2 Frequency xxx1x")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_100", 1, 3362, 3363, 658, "Comm2 FW", "Forward Comm 2 Frequency xx1xx")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_1000", 1, 3364, 3365, 659, "Comm2 FW", "Forward Comm 2 Frequency x1xxx")
defineSpringloaded_3PosTumb("FW_COM2_FREQU_10000", 1, 3366, 3367, 660, "Comm2 FW", "Forward Comm 2 Frequency 1xxxx")
defineSpringloaded_3PosTumb("FW_COM2_SQUELCH", 1, 3368, 3368, 662, "Comm2 FW", "Forward Comm 2 Squelch")
defineToggleSwitch("FW_COM2_MOD", 1, 3370, 661, "Comm2 FW", "Forward Comm 2 Modulation")
defineToggleSwitch("FW_COM2_TOD", 1, 3371, 663, "Comm2 FW", "Forward Comm 2 TOD")

defineMultipositionSwitch("AFT_COM2_MODE", 1, 3372, 290, 5, 0.25, "Comm2 AFT", "Aft Comm 2 Mode")
defineMultipositionSwitch("AFT_COM2_FUNC", 1, 3373, 291, 5, 0.25, "Comm2 AFT", "Aft Comm 2 Function")
definePotentiometer("AFT_COM2_BRIGHT", 1, 3374, 292, {0, 1}, "Comm2 AFT", "Aft Comm 2 Brightness")
defineSpringloaded_3PosTumb("AFT_COM2_CHN_1", 1, 3375, 3376, 294, "Comm2 AFT", "Aft Comm 2 Channel x1")
defineSpringloaded_3PosTumb("AFT_COM2_CHN_10", 1, 3377, 3378, 295, "Comm2 AFT", "Aft Comm 2 Channel 1x")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_1", 1, 3379, 3380, 296, "Comm2 AFT", "Aft Comm 2 Frequency xxxx1")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_10", 1, 3381, 3382, 297, "Comm2 AFT", "Aft Comm 2 Frequency xxx1x")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_100", 1, 3383, 3384, 154, "Comm2 AFT", "Aft Comm 2 Frequency xx1xx")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_1000", 1, 3385, 3386, 155, "Comm2 AFT", "Aft Comm 2 Frequency x1xxx")
defineSpringloaded_3PosTumb("AFT_COM2_FREQU_10000", 1, 3387, 3388, 156, "Comm2 AFT", "Aft Comm 2 Frequency 1xxxx")
defineSpringloaded_3PosTumb("AFT_COM2_SQUELCH", 1, 3389, 3389, 158, "Comm2 AFT", "Aft Comm 2 Squelch")
defineToggleSwitch("AFT_COM2_MOD", 1, 3391, 157, "Comm2 AFT", "Aft Comm 2 Modulation")
defineToggleSwitch("AFT_COM2_TOD", 1, 3392, 159, "Comm2 AFT", "Aft Comm 2 TOD")

--

--Oxygen
defineToggleSwitch("FW_OXY_PW", 1, 3427, 587, "Oxygen FW", "Forward Oxygen Power Supply")
defineToggleSwitch("FW_OXY_DILUIT", 1, 3428, 589, "Oxygen FW", "Forward Oxygen Diluiter Lever (Normal / 100%)")
defineToggleSwitch("FW_OXY_EMERG", 1, 3429, 588, "Oxygen FW", "Forward Oxygen Emergengy Lever")

defineToggleSwitch("AFT_OXY_PW", 1, 3430, 113, "Oxygen AFT", "Aft Oxygen Power Supply")
defineToggleSwitch("AFT_OXY_DILUIT", 1, 3431, 113, "Oxygen AFT", "Aft Oxygen Diluiter Lever (Normal / 100%)")
defineToggleSwitch("AFT_OXY_EMERG", 1, 3432, 111, "Oxygen AFT", "Aft Oxygen Emergengy Lever")

--Cockpit
definePushButton("FW_GLOVE_COMP", 1, 3433, 206, "Cockpit", "Forward Glove Compartment")
defineToggleSwitch("FW_CANOPY_SEVERANCE_LVR", 1, 3215, 583, "Cockpit", "Forward Canopy Severance Handle")
defineToggleSwitch("FW_CANOPY_SEVERANCE_PIN", 1, 3216, 584, "Cockpit", "Forward Canopy Severance Safety Pin")

definePushButton("AFT_GLOVE_COMP", 1, 3434, 207, "Cockpit", "Aft Glove Compartment")
defineToggleSwitch("AFT_CANOPY_SEVERANCE_LVR", 1, 3217, 741, "Cockpit", "Aft Canopy Severance Handle")
defineToggleSwitch("AFT_CANOPY_SEVERANCE_PIN", 1, 3218, 742, "Cockpit", "Aft Canopy Severance Safety Pin")

defineToggleSwitch("CURTAIN_HANDLE", 1, 3435, 1999, "Cockpit", "Curtain Handle")

defineFloat("CANOPY_POS", 181, {0, 1}, "Cockpit Gauges", "Canopy Position")

--ELT
defineSpringloaded_3PosTumb("ELT_SW", 1, 3436, 3436, 727, "ELT", "ELT Switch")

--IFF


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