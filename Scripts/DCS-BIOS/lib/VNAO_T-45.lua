BIOS.protocol.beginModule("VNAO_T-45", 0x9000)
BIOS.protocol.setExportModuleAircrafts({"T-45"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local define3PosTumb = BIOS.util.define3PosTumb
local defineTumb = BIOS.util.defineTumb
local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineRotary = BIOS.util.defineRotary
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-------- FRONT Pit ------

defineTumb("FLAPS_LVR", 19, 3013, 7, 0.5, {0, 1}, nil, false, "General", "Flaps Lever, UP/ 1/2 /DOWN")
defineToggleSwitch("EMERG_FLAP_SW", 19, 3027, 184, "General", "EMER FLAPS Switch, NORM/DOWN")
defineToggleSwitch("PARK_BRAKE", 19, 3038, 117, "General", "Parking Brake Handle, OUT/IN")
definePushButton("HYD2_RESET_BTN", 19, 3025, 66, "Gear", "HYD 2 Reset Button")
defineToggleSwitch("PARK_BRAKE", 19, 3026, 180, "General", "Pitot Heat Switch, HEAT/OFF")
defineRotary("ALT_SET_KNB", 8, 3557, 165, "General", "Altimeter Setting Knob")
defineToggleSwitch("CANOPY_HANDLE", 19, 3042, 116, "General", "Canopy Handle, OPEN/CLOSE")
definePushButton("MASTER_ALERT_BTN", 19, 3040, 143, "General", "Master Alert Button")

-- MFD Left ----
definePushButton("MFD_L_ON_DAY", 12, 3501, 424, "MFD Left", "Left MFD On Day")
definePushButton("MFD_L_ON_NGT", 12, 3502, 425, "MFD Left", "Left MFD On Night")
definePushButton("MFD_L_OFF", 12, 3503, 426, "MFD Left", "Left MFD Off")
definePushButton("MFD_L_BRIGHT_INC", 12, 3504, 422, "MFD Left", "Left MFD Brightness Increase")
definePushButton("MFD_L_BRIGHT_DEC", 12, 3505, 423, "MFD Left", "Left MFD Brightness Decrease")
definePushButton("MFD_L_BTN_20", 12, 3525, 34, "MFD Left", "Left MFD Push Button 20")
definePushButton("MFD_L_BTN_19", 12, 3524, 33, "MFD Left", "Left MFD Push Button 19")
definePushButton("MFD_L_BTN_18", 12, 3523, 32, "MFD Left", "Left MFD Push Button 18")
definePushButton("MFD_L_BTN_17", 12, 3522, 31, "MFD Left", "Left MFD Push Button 17")
definePushButton("MFD_L_BTN_16", 12, 3521, 30, "MFD Left", "Left MFD Push Button 16")
definePushButton("MFD_L_BTN_15", 12, 3520, 29, "MFD Left", "Left MFD Push Button 15")
definePushButton("MFD_L_BTN_14", 12, 3519, 28, "MFD Left", "Left MFD Push Button 14")
definePushButton("MFD_L_BTN_13", 12, 3518, 27, "MFD Left", "Left MFD Push Button 13")
definePushButton("MFD_L_BTN_12", 12, 3517, 26, "MFD Left", "Left MFD Push Button 12")
definePushButton("MFD_L_BTN_11", 12, 3516, 25, "MFD Left", "Left MFD Push Button 11")
definePushButton("MFD_L_BTN_10", 12, 3515, 24, "MFD Left", "Left MFD Push Button 10")
definePushButton("MFD_L_BTN_9", 12, 3514, 23, "MFD Left", "Left MFD Push Button 9")
definePushButton("MFD_L_BTN_8", 12, 3513, 22, "MFD Left", "Left MFD Push Button 8")
definePushButton("MFD_L_BTN_7", 12, 3512, 21, "MFD Left", "Left MFD Push Button 7")
definePushButton("MFD_L_BTN_6", 12, 3511, 20, "MFD Left", "Left MFD Push Button 6")
definePushButton("MFD_L_BTN_5", 12, 3510, 19, "MFD Left", "Left MFD Push Button 5")
definePushButton("MFD_L_BTN_4", 12, 3509, 18, "MFD Left", "Left MFD Push Button 4")
definePushButton("MFD_L_BTN_3", 12, 3508, 17, "MFD Left", "Left MFD Push Button 3")
definePushButton("MFD_L_BTN_2", 12, 3507, 16, "MFD Left", "Left MFD Push Button 2")
definePushButton("MFD_L_BTN_1", 12, 3506, 15, "MFD Left", "Left MFD Push Button 1")

-- MFD Right ----
definePushButton("MFD_R_ON_DAY", 12, 3501, 434, "MFD Right", "Right MFD On Day")
definePushButton("MFD_R_ON_NGT", 12, 3502, 435, "MFD Right", "Right MFD On Night")
definePushButton("MFD_R_OFF", 12, 3503, 436, "MFD Right", "Right MFD Off")
definePushButton("MFD_R_BRIGHT_INC", 12, 3504, 432, "MFD Right", "Right MFD Brightness Increase")
definePushButton("MFD_R_BRIGHT_DEC", 12, 3505, 433, "MFD Right", "Right MFD Brightness Decrease")
definePushButton("MFD_R_BTN_20", 12, 3525, 59, "MFD Right", "Right MFD Push Button 20")
definePushButton("MFD_R_BTN_19", 12, 3524, 58, "MFD Right", "Right MFD Push Button 19")
definePushButton("MFD_R_BTN_18", 12, 3523, 57, "MFD Right", "Right MFD Push Button 18")
definePushButton("MFD_R_BTN_17", 12, 3522, 56, "MFD Right", "Right MFD Push Button 17")
definePushButton("MFD_R_BTN_16", 12, 3521, 55, "MFD Right", "Right MFD Push Button 16")
definePushButton("MFD_R_BTN_15", 12, 3520, 54, "MFD Right", "Right MFD Push Button 15")
definePushButton("MFD_R_BTN_14", 12, 3519, 53, "MFD Right", "Right MFD Push Button 14")
definePushButton("MFD_R_BTN_13", 12, 3518, 52, "MFD Right", "Right MFD Push Button 13")
definePushButton("MFD_R_BTN_12", 12, 3517, 51, "MFD Right", "Right MFD Push Button 12")
definePushButton("MFD_R_BTN_11", 12, 3516, 50, "MFD Right", "Right MFD Push Button 11")
definePushButton("MFD_R_BTN_10", 12, 3515, 49, "MFD Right", "Right MFD Push Button 10")
definePushButton("MFD_R_BTN_9", 12, 3514, 48, "MFD Right", "Right MFD Push Button 9")
definePushButton("MFD_R_BTN_8", 12, 3513, 47, "MFD Right", "Right MFD Push Button 8")
definePushButton("MFD_R_BTN_7", 12, 3512, 46, "MFD Right", "Right MFD Push Button 7")
definePushButton("MFD_R_BTN_6", 12, 3511, 45, "MFD Right", "Right MFD Push Button 6")
definePushButton("MFD_R_BTN_5", 12, 3510, 44, "MFD Right", "Right MFD Push Button 5")
definePushButton("MFD_R_BTN_4", 12, 3509, 43, "MFD Right", "Right MFD Push Button 4")
definePushButton("MFD_R_BTN_3", 12, 3508, 42, "MFD Right", "Right MFD Push Button 3")
definePushButton("MFD_R_BTN_2", 12, 3507, 41, "MFD Right", "Right MFD Push Button 2")
definePushButton("MFD_R_BTN_1", 12, 3506, 40, "MFD Right", "Right MFD Push Button 1")

-------- REAR Pit ------

--Warning, Caution and IndicatorLights
defineIndicatorLight("AOA_SLOW_L", 320, "Warning, Caution and IndicatorLights","AOA Light Slow (green)")
defineIndicatorLight("AOA_OPT_L", 321, "Warning, Caution and IndicatorLights","AOA Light Optimum (yellow)")
defineIndicatorLight("AOA_FAST_L", 322, "Warning, Caution and IndicatorLights","AOA Light Fast (red)")

--Gauges
defineFloat("CANOPY_VALUE", 1, {0, 1}, "Gauges", "Canopy Position")
defineFloat("ADI_SLIP", 161, {-0.1, 0.1}, "Gauges", "ADI Slip")
defineFloat("AOA_GAUGE", 161, {0, 1}, "Gauges", "AoA Gauge")
defineFloat("EGT_G", 178, {0, 1}, "Gauges", "EGT Gauge")
defineFloat("CLOCK_H_G", 185, {0, 1}, "Gauges", "Clock Hours Gauge")
defineFloat("CLOCK_M_G", 186, {0, 1}, "Gauges", "Clock Minutes Gauge")
defineFloat("CLOCK_S_G", 187, {0, 1}, "Gauges", "Clock Seconds Gauge")
defineFloat("SADI_PITCH_G", 169, {1, -1}, "Gauges", "SADI Pitch Gauge")
defineFloat("SADI_ROLL_G", 170, {1, -1}, "Gauges", "SADI Roll Gauge")
defineFloat("VERT_VELOCITY_G", 162, {-1, 1}, "Gauges", "Vertical Velocity Gauge")
defineFloat("AIRSPEED_G", 162, {0, 1}, "Gauges", "Airspeed Gauge")
defineFloat("ALT_NEEDLE_G", 164, {0, 1}, "Gauges", "Altimeter Needle Gauge")
defineFloat("ALT_10K_G", 314, {0, 1}, "Gauges", "Altimeter 10K Gauge")
defineFloat("ALT_1K_G", 315, {0, 1}, "Gauges", "Altimeter 1K Gauge")
defineFloat("ALT_100_G", 316, {0, 1}, "Gauges", "Altimeter 100 Gauge")
defineFloat("ALT_10_G", 317, {0, 1}, "Gauges", "Altimeter 10 Gauge")
defineFloat("ALT_1_G", 318, {0, 1}, "Gauges", "Altimeter 1 Gauge")
defineFloat("ALT_BARO10_G", 324, {0, 1}, "Gauges", "Altimeter Barometric 10 Gauge")
defineFloat("ALT_BARO1_G", 325, {0, 1}, "Gauges", "Altimeter Barometric 1 Gauge")
defineFloat("ALT_BARO010_G", 326, {0, 1}, "Gauges", "Altimeter Barometric 0.10 Gauge")
defineFloat("ALT_BARO0100_G", 327, {0, 1}, "Gauges", "Altimeter Barometric 0.100 Gauge")
defineFloat("FUEL_FLOW_G", 173, {0, 1}, "Gauges", "Fuel Flow Needle Gauge")
defineFloat("FUEL_TOTAL_G", 174, {0, 1}, "Gauges", "Total Fuel Needle Gauge")
defineFloat("RPM_G", 175, {0, 1}, "Gauges", "RPM Needle Gauge")
defineFloat("RPM_S_G", 176, {0, 1}, "Gauges", "RPM Needle Small Gauge")
defineFloat("TACAN_1_G", 332, {0, 1}, "Gauges", "TACAN Dial 1 Gauge")
defineFloat("TACAN_10_G", 331, {0, 1}, "Gauges", "TACAN Dial 10 Gauge")
defineFloat("TACAN_100_G", 330, {0, 1}, "Gauges", "TACAN Dial 100 Gauge")
defineFloat("VOR_NXX_G", 334, {0, 1}, "Gauges", "VOR Dial Whole Xxx Gauge")
defineFloat("VOR_XNX_G", 335, {0, 1}, "Gauges", "VOR Dial Whole xXx Gauge")
defineFloat("VOR_XXN_G", 336, {0, 1}, "Gauges", "VOR Dial Whole xxX Gauge")
defineFloat("VOR_DEC_NX_G", 337, {0, 1}, "Gauges", "VOR Dial Decimal Xx Gauge")
defineFloat("VOR_DEC_XN_G", 338, {0, 1}, "Gauges", "VOR Dial Decimal xX Gauge")
defineFloat("INT_PTT_G", 295, {0, 1}, "Gauges", "Intercom PTT Gauge")
defineFloat("MAG_COMP_G", 118, {1, 0}, "Gauges", "Magnetic Compasss Gauge")

defineIntegerFromGetter("EXT_HOOK", function()
	return math.floor(LoGetAircraftDrawArgumentValue(25)*65535)
end, 65535, "External Aircraft Model", "Hook")
defineIntegerFromGetter("EXT_TOP_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Light (white)")
defineIntegerFromGetter("EXT_STROBE", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Lights (red)")
defineIntegerFromGetter("EXT_TAIL_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Light (white)")
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (green,red)")
defineIntegerFromGetter("EXT_NAV_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(195) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Navigation Lights (yellow)")
defineIntegerFromGetter("EXT_TAXI_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(189) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Taxi Light (white)")
defineIntegerFromGetter("EXT_SPEED_BRAKES", function()
	return math.floor(LoGetAircraftDrawArgumentValue(500)*65535)
end, 65535, "External Aircraft Model", "Speed Brakes")
defineIntegerFromGetter("EXT_FAN", function()
	if LoGetAircraftDrawArgumentValue(60) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Fan")
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