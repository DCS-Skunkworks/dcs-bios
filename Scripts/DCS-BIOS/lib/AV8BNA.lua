BIOS.protocol.beginModule("AV8BNA", 0x7800)
BIOS.protocol.setExportModuleAircrafts({"AV8BNA"})
--by WarLord (aka BlackLibrary) v.2.2

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineTumb = BIOS.util.defineTumb
local define3PosTumb = BIOS.util.define3PosTumb
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineString = BIOS.util.defineString
local defineRotary = BIOS.util.defineRotary


local function defineAV8BCommSelector(msg, device_id, command, arg_delta, arg_number, category, description)
	moduleBeingDefined.inputProcessors[msg] = function(state)
		local currentValue = GetDevice(0):get_argument_value(arg_number)
		if state == "INC" then
			GetDevice(device_id):performClickableAction(command, currentValue + arg_delta)
		end
		if state == "DEC" then
			GetDevice(device_id):performClickableAction(command, currentValue - arg_delta)
		end
	end
	
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 65535
	}
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		value:setValue(dev0:get_argument_value(arg_number) * 65535)
	end

	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "fixed_step_dial",
		inputs = {
			{ interface = "fixed_step", description = "rotate the knob left or right" },
		},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 65535,
			  description = "rotation of the knob"
			}
		}
	}
end

-------------------------------------------------------------------
-- MAIN INSTRUMENT PANEL:
-------------------------------------------------------------------

-- Master Modes Panel (MSC)
definePushButton("NAV_SEL", 12, 3282, 282, "Master Modes", "NAV Master Mode Selector")
definePushButton("VSTOL_SEL", 12, 3284, 284, "Master Modes", "VSTOL Master Mode Selector")
definePushButton("AG_SEL", 12, 3280, 280, "Master Modes", "AG Master Mode Selector")

-- Engine Display Panel
definePotentiometer("EDP_BRIGHT", 20, 3272, 272, {0, 1},"Engine Display", "EDP Brightness Control")
defineToggleSwitch("EDP_BIT", 20, 3655, 655, "Engine Display", "EDP BIT Button")

-- HUD Control Panel
defineMultipositionSwitch("HUD_SYMBOL", 22, 3288, 288, 3, 0.5, "HUD Control", "HUD Symbology Reject Switch NORM/REJ1/REJ2")
definePotentiometer("HUD_BRIGHT", 22, 3289, 289, {0, 1},"HUD Control", "HUD Off/Brightness Control")
defineMultipositionSwitch("HUD_MODE", 22, 3290, 290, 3, 0.5, "HUD Control", "HUD Display Mode Switch DAY/AUTO/NIGHT")
definePotentiometer("HUD_VIDEO_BRIGHT", 22, 3291, 291, {0, 1},"HUD Control", "HUD Video Brightness Control")
definePotentiometer("HUD_VIDEO_CONTR", 22, 3292, 292, {0, 1},"HUD Control", "HUD Video Contrast Control")
defineToggleSwitch("HUD_ALT", 22, 3293, 293, "HUD Control", "HUD Altitude Selector Switch")

-- UFC Panel
definePushButton("UFC_B1", 23, 3302, 302, "UFC", "UFC Button 1")
definePushButton("UFC_B2", 23, 3303, 303, "UFC", "UFC Button 2/N")
definePushButton("UFC_B3", 23, 3304, 304, "UFC", "UFC Button 3")
definePushButton("UFC_B4", 23, 3306, 306, "UFC", "UFC Button 4/W")
definePushButton("UFC_B5", 23, 3307, 307, "UFC", "UFC Button 5")
definePushButton("UFC_B6", 23, 3308, 308, "UFC", "UFC Button 6/E")
definePushButton("UFC_B7", 23, 3310, 310, "UFC", "UFC Button 7")
definePushButton("UFC_B8", 23, 3311, 311, "UFC", "UFC Button 8/S")
definePushButton("UFC_B9", 23, 3312, 312, "UFC", "UFC Button 9")
definePushButton("UFC_B0", 23, 3315, 315, "UFC", "UFC Button 0")
definePushButton("UFC_DOT", 23, 3316, 316, "UFC", "UFC Button .")
definePushButton("UFC_DASH", 23, 3313, 313, "UFC", "UFC Button -")
definePushButton("UFC_ENTER", 23, 3314, 314, "UFC", "UFC ENTER Data Button")
definePushButton("UFC_CLEAR", 23, 3305, 305, "UFC", "Clear Entry Button")
definePushButton("UFC_TIMER", 23, 3294, 294, "UFC", "UFC Timer Function Selector")
definePushButton("UFC_ALT", 23, 3324, 324, "UFC", "UFC Altitude Function Selector")
definePushButton("UFC_IFF", 23, 3318, 318, "UFC", "UFC IFF Function Selector")
definePushButton("UFC_TACAN", 23, 3319, 319, "UFC", "UFC TACAN Function Selector")
definePushButton("UFC_WEATHER", 23, 3320, 320, "UFC", "UFC All Weather Landing Function Selector")
definePushButton("UFC_ONOFF", 23, 3317, 317, "UFC", "UFC Radalt/TACAN/AWL/IFF ON/OFF Toggle")
definePushButton("UFC_EMCOM", 23, 3325, 325, "UFC", "UFC EMCON ON/OFF Toggle")
definePushButton("UFC_TARGET", 23, 3296, 296, "UFC", "UFC Target-Of-Opportunity Selector")
definePushButton("UFC_WAY", 23, 3322, 322, "UFC", "UFC Waypoint Overfly INS Update Selector")
definePushButton("UFC_WEAPON", 23, 3321, 321, "UFC", "UFC Weapons Function Selector")
definePushButton("UFC_BEACON", 23, 3323, 323, "UFC", "UFC Radar Beacon Function Selector")
definePushButton("UFC_IP", 23, 3297, 297, "UFC", "UFC I/P Button")
definePushButton("UFC_SAVE", 23, 3309, 309, "UFC", "UFC Save Data Button")
definePotentiometer("UFC_BRIGHT", 23, 3295, 295, {0, 1}, "UHF Radio", "UFC Display Brightness Control")
definePotentiometer("UFC_COM1_VOL", 23, 3298, 298, {0, 1}, "UHF Radio", "UFC Comm 1 Volume Control")
definePotentiometer("UFC_COM2_VOL", 23, 3299, 299, {0, 1}, "UHF Radio", "UFC Comm 2 Volume Control")
definePushButton("UFC_COM1_PULL", 23, 3178, 178, "UHF Radio", "UFC Comm 1 Channel Selector Pull")
definePushButton("UFC_COM2_PULL", 23, 3179, 179, "UHF Radio", "UFC Comm 2 Channel Selector Pull")
defineRotary("UFC_COM1_SEL", 23, 3300, 300, "UHF Radio", "UFC Comm 1 Channel Selector Turn")
defineRotary("UFC_COM2_SEL", 23, 3301, 301, "UHF Radio", "UFC Comm 2 Channel Selector Turn")

local function getARC210_COMM1_String_Frequency()
	local arc_210_comm1 = GetDevice(2)
	local freq = tostring(arc_210_comm1:get_frequency())
	if(string.len(freq) == 8) then
		return freq:sub(1,2) .. "." .. freq:sub(3,5)	
	else
		return freq:sub(1,3) .. "." .. freq:sub(4,6)	
	end	
end
defineString("COMM1_STRING_FREQ", getARC210_COMM1_String_Frequency, 7, "AAA", "COMM1 ARC-210 Frequency (string)")

local function getARC210_COMM2_String_Frequency()
	local arc_210_comm2 = GetDevice(3)
	local freq = tostring(arc_210_comm2:get_frequency())
	if(string.len(freq) == 8) then
		return freq:sub(1,2) .. "." .. freq:sub(3,5)	
	else
		return freq:sub(1,3) .. "." .. freq:sub(4,6)	
	end	
end
defineString("COMM2_STRING_FREQ", getARC210_COMM2_String_Frequency, 7, "AAA", "COMM2 ARC-210 Frequency (string)")

-- ODU Panel
definePushButton("ODU_OPT1", 24, 3250, 250, "ODU", "ODU Option 1")
definePushButton("ODU_OPT2", 24, 3251, 251, "ODU", "ODU Option 2")
definePushButton("ODU_OPT3", 24, 3252, 252, "ODU", "ODU Option 3")
definePushButton("ODU_OPT4", 24, 3248, 248, "ODU", "ODU Option 4")
definePushButton("ODU_OPT5", 24, 3249, 249, "ODU", "ODU Option 5")

-- Master Caution/Warning Panel
definePushButton("M_Caution", 35, 3198, 198, "Master Warning Panel", "Master Caution")
definePushButton("M_Warning", 35, 3199, 199, "Master Warning Panel", "Master Warning")

-- Fuel Quantity Indicator
defineMultipositionSwitch("FUEL_SEL", 21, 3379, 379, 7, 0.33, "Fuel Panel", "Fuel Totalizer Selector OUTBD/INBD/WING/INT/TOT/FEED/BIT")
defineAV8BCommSelector("BINGO_SET", 21, 3380, 0.1, 380, "Fuel Panel", "Bingo Fuel Set Knob")

-- MPCD left
definePushButton("MPCD_L_1", 26, 3200, 200, "MPCD Left", "MPCD Left Button 1")
definePushButton("MPCD_L_2", 26, 3201, 201, "MPCD Left", "MPCD Left Button 2")
definePushButton("MPCD_L_3", 26, 3202, 202, "MPCD Left", "MPCD Left Button 3")
definePushButton("MPCD_L_4", 26, 3203, 203, "MPCD Left", "MPCD Left Button 4")
definePushButton("MPCD_L_5", 26, 3204, 204, "MPCD Left", "MPCD Left Button 5")
definePushButton("MPCD_L_6", 26, 3205, 205, "MPCD Left", "MPCD Left Button 6")
definePushButton("MPCD_L_7", 26, 3206, 206, "MPCD Left", "MPCD Left Button 7")
definePushButton("MPCD_L_8", 26, 3207, 207, "MPCD Left", "MPCD Left Button 8")
definePushButton("MPCD_L_9", 26, 3208, 208, "MPCD Left", "MPCD Left Button 9")
definePushButton("MPCD_L_10", 26, 3209, 209, "MPCD Left", "MPCD Left Button 10")
definePushButton("MPCD_L_11", 26, 3210, 210, "MPCD Left", "MPCD Left Button 11")
definePushButton("MPCD_L_12", 26, 3211, 211, "MPCD Left", "MPCD Left Button 12")
definePushButton("MPCD_L_13", 26, 3212, 212, "MPCD Left", "MPCD Left Button 13")
definePushButton("MPCD_L_14", 26, 3213, 213, "MPCD Left", "MPCD Left Button 14")
definePushButton("MPCD_L_15", 26, 3214, 214, "MPCD Left", "MPCD Left Button 15")
definePushButton("MPCD_L_16", 26, 3215, 215, "MPCD Left", "MPCD Left Button 16")
definePushButton("MPCD_L_17", 26, 3216, 216, "MPCD Left", "MPCD Left Button 17")
definePushButton("MPCD_L_18", 26, 3217, 217, "MPCD Left", "MPCD Left Button 18")
definePushButton("MPCD_L_19", 26, 3218, 218, "MPCD Left", "MPCD Left Button 19")
definePushButton("MPCD_L_20", 26, 3219, 219, "MPCD Left", "MPCD Left Button 20")
defineRockerSwitch("MPCD_L_DAY_NIGHT", 26, 3007, 3007, 3008, 3008, 220, "MPCD Left", "MPCD Left Display DAY/NIGHT Mode")
defineRockerSwitch("MPCD_L_SYMBOL", 26, 3001, 3001, 3002, 3002, 221, "MPCD Left", "MPCD Left Display Symbology")
defineRockerSwitch("MPCD_L_GAIN", 26, 3003, 3003, 3004, 3004, 222, "MPCD Left", "MPCD Left Display Gain")
defineRockerSwitch("MPCD_L_CONTRAST", 26, 3005, 3005, 3006, 3006, 223, "MPCD Left", "MPCD Left Display Contrast")
definePotentiometer("MPCD_L_BRIGHT", 26, 3194, 194, {0, 1},"MPCD Left", "MPCD Left Off/Brightness Control")

-- MPCD Right
definePushButton("MPCD_R_1", 27, 3224, 224, "MPCD Right", "MPCD Right Button 1")
definePushButton("MPCD_R_2", 27, 3225, 225, "MPCD Right", "MPCD Right Button 2")
definePushButton("MPCD_R_3", 27, 3226, 226, "MPCD Right", "MPCD Right Button 3")
definePushButton("MPCD_R_4", 27, 3227, 227, "MPCD Right", "MPCD Right Button 4")
definePushButton("MPCD_R_5", 27, 3228, 228, "MPCD Right", "MPCD Right Button 5")
definePushButton("MPCD_R_6", 27, 3229, 229, "MPCD Right", "MPCD Right Button 6")
definePushButton("MPCD_R_7", 27, 3230, 230, "MPCD Right", "MPCD Right Button 7")
definePushButton("MPCD_R_8", 27, 3231, 231, "MPCD Right", "MPCD Right Button 8")
definePushButton("MPCD_R_9", 27, 3232, 232, "MPCD Right", "MPCD Right Button 9")
definePushButton("MPCD_R_10", 27, 3233, 233, "MPCD Right", "MPCD Right Button 10")
definePushButton("MPCD_R_11", 27, 3234, 234, "MPCD Right", "MPCD Right Button 11")
definePushButton("MPCD_R_12", 27, 3235, 235, "MPCD Right", "MPCD Right Button 12")
definePushButton("MPCD_R_13", 27, 3236, 236, "MPCD Right", "MPCD Right Button 13")
definePushButton("MPCD_R_14", 27, 3237, 237, "MPCD Right", "MPCD Right Button 14")
definePushButton("MPCD_R_15", 27, 3238, 238, "MPCD Right", "MPCD Right Button 15")
definePushButton("MPCD_R_16", 27, 3239, 239, "MPCD Right", "MPCD Right Button 16")
definePushButton("MPCD_R_17", 27, 3240, 240, "MPCD Right", "MPCD Right Button 17")
definePushButton("MPCD_R_18", 27, 3241, 241, "MPCD Right", "MPCD Right Button 18")
definePushButton("MPCD_R_19", 27, 3242, 242, "MPCD Right", "MPCD Right Button 19")
definePushButton("MPCD_R_20", 27, 3243, 243, "MPCD Right", "MPCD Right Button 20")
defineRockerSwitch("MPCD_R_DAY_NIGHT", 27, 3017, 3017, 3018, 3018, 244, "MPCD Right", "MPCD Right Display DAY/NIGHT Mode")
defineRockerSwitch("MPCD_R_SYMBOL", 27, 3011, 3011, 3012, 3012, 245, "MPCD Right", "MPCD Right Display Symbology")
defineRockerSwitch("MPCD_R_GAIN", 27, 3013, 3013, 3014, 3014, 246, "MPCD Right", "MPCD Right Display Gain")
defineRockerSwitch("MPCD_R_CONTRAST", 27, 3015, 3015, 3016, 3016, 247, "MPCD Right", "MPCD Right Display Contrast")
definePotentiometer("MPCD_R_BRIGHT", 27, 3195, 195, {0, 1},"MPCD Right", "MPCD Right Off/Brightness Control")

-- Armament Control Panel ACP
defineMultipositionSwitch("RELEASE_CONTROL", 29, 3395, 395, 4, 0.33, "ACP" , "Manual Release Control Knob NORM/N+T/N/T")
define3PosTumb("ARM_CONTROL", 29, 3396, 396, "ACP", "Armament Mode Control")
define3PosTumb("FUZE_CONTROL", 29, 3397, 397, "ACP", "Fuzing Control")
define3PosTumb("QUANT_SEL_10", 29, 3398, 398, "ACP", "Quantity Selector (Tens)")
define3PosTumb("QUANT_SEL_01", 29, 3399, 399, "ACP", "Quantity Selector (Units)")
define3PosTumb("MULTI_RELEASE_CONTROL", 29, 3400, 400, "ACP", "Multiple Release Control")
define3PosTumb("RELEASE_INT_100", 29, 3401, 401, "ACP", "Release Interval Control (Hundreds)")
define3PosTumb("RELEASE_INT_010", 29, 3402, 402, "ACP", "Release Interval Control (Tens)")
define3PosTumb("RELEASE_INT_001", 29, 3403, 403, "ACP", "Release Interval Control (Units)")
defineTumb("JETT_MODE", 29, 3404, 404, 0.5, {-1, 1}, nil, false, "ACP", "Jettison Mode Selector STA/STOR/SAFE/CMBT/Fuel")
definePushButton("JETT_STORES", 29, 3405, 405, "ACP", "Jettison Stores")
definePushButton("JETT_STATION_1", 29, 3407, 407, "ACP", "Select Station 1 Toggle")
definePushButton("JETT_STATION_2", 29, 3409, 409, "ACP", "Select Station 2 Toggle")
definePushButton("JETT_STATION_3", 29, 3411, 411, "ACP", "Select Station 3 Toggle")
definePushButton("JETT_STATION_4", 29, 3413, 413, "ACP", "Select Station 4 Toggle")
definePushButton("JETT_STATION_5", 29, 3415, 415, "ACP", "Select Station 5 Toggle")
definePushButton("JETT_STATION_6", 29, 3417, 417, "ACP", "Select Station 6 Toggle")
definePushButton("JETT_STATION_7", 29, 3419, 419, "ACP", "Select Station 7 Toggle")
defineToggleSwitch("GND_IR_COOL", 29, 3420, 420, "ACP", "Ground IR Cool Switch")
defineIndicatorLight("JETT_STATION_1_LIGHT", 406, "ACP","Select Station 1 LIGHT")
defineIndicatorLight("JETT_STATION_2_LIGHT", 408, "ACP","Select Station 2 LIGHT")
defineIndicatorLight("JETT_STATION_3_LIGHT", 410, "ACP","Select Station 3 LIGHT")
defineIndicatorLight("JETT_STATION_4_LIGHT", 412, "ACP","Select Station 4 LIGHT")
defineIndicatorLight("JETT_STATION_5_LIGHT", 414, "ACP","Select Station 5 LIGHT")
defineIndicatorLight("JETT_STATION_6_LIGHT", 416, "ACP","Select Station 6 LIGHT")
defineIndicatorLight("JETT_STATION_7_LIGHT", 418, "ACP","Select Station 7 LIGHT")

-- Master Armament Panel
definePushButton("LAUNCH_FLARE_SALVO", 30, 3286, 286, "Master Armament Panel", "Launch Flare Salvo")
defineToggleSwitch("MASTER_ARM", 29, 3287, 287, "Master Armament Panel", "Master Arm Switch")

-- ECM Control Panel
definePotentiometer("RWR_VOL", 18, 3273, 273, {0, 1},"ECM", "RWR Power/Volume Button")
defineMultipositionSwitch("DECOY_CONTROL", 30, 3274, 274, 5, 0.25, "ECM" , "Decoy Dispenser Control OFF/AUT/UP/DWN/RWR")
defineMultipositionSwitch("JAMMER_CONTROL", 30, 3275, 275, 5, 0.25, "ECM" , "Jammer Control OFF/STBY/BIT/RCV/RPT")

-- Landing Gear/Flaps Control Panel
defineToggleSwitch("LG_EMERG_LEVER", 28, 3447, 447, "Gear/Flaps Control Panel", "Emergency Landing Gear Lever")
definePushButton("LG_DOWN_LOCK", 28, 3448, 448, "Gear/Flaps Control Panel", "Gear Down Lock Override Button")
defineMultipositionSwitch("FLAP_MODE", 13, 3454, 454, 3, 0.5, "Gear/Flaps Control Panel", "Flaps Mode Switch CRUISE/AUTO/STOL")
defineMultipositionSwitch("FLAP_POWER", 13, 3457, 457, 3, 0.5, "Gear/Flaps Control Panel", "Flaps Power Switch RESET/ON/OFF")
definePushButton("EMERG_JETT", 29, 3458, 458, "Gear/Flaps Control Panel", "Emergency Jettison Button")
defineMultipositionSwitch("ANTI_SKID", 28, 3459, 459, 3, 0.5, "Gear/Flaps Control Panel", "Anti-Skid Switch TEST/ON/NWS")
definePushButton("FLAPS_BIT", 13, 3460, 460, "Gear/Flaps Control Panel", "Flaps BIT Button")
defineToggleSwitch("LG_LEVER", 28, 3461, 461, "Gear/Flaps Control Panel", "Gear Lever")
defineToggleSwitch("LG_EMERGBATT_LEVER", 28, 3470, 470, "Gear/Flaps Control Panel", "Landing Gear Emergency Battery Lever")

-- Combat/Water Panel
definePushButton("CMBT", 9, 3450, 450, "H2O", "CMBT Thrust Button")
defineMultipositionSwitch("H2O_MODE", 9, 3449, 449, 3, 0.5, "H2O", "H2O Mode Switch  LDG/OFF/TO")

-- Bulkhead Switches
defineToggleSwitch("MFS_EMERG_LEVER", 28, 3501, 501, "Bulkhead", "MFS Emergency Lever")
definePushButton("STOPWATCH_START", 12, 3051, 1121, "Bulkhead", "Stopwatch Start/Stop")
definePushButton("STOPWATCH_LAP", 12, 3052, 1122, "Bulkhead", "Stopwatch Lap/Reset")

-- Seat
defineToggleSwitch("SEAT_SAFE_LEVER", 12, 3800, 800, "Seat", "Seat Ground Safety Lever")

-------------------------------------------------------------------
-- CENTER CONSOLE:
-------------------------------------------------------------------
-- Flights Instruments Panel
define3PosTumb("NAV_CRS", 11, 3364, 364, "Flight Instruments", "NAV Course Setting")
defineRotary("BARO_PRESSURE", 10, 3653, 653, "Flight Instruments", "Barometric Pressure Calibration")
definePotentiometer("BAK_ADI_CAGE_KNOB", 19, 3351, 351, {0, 1}, "Flight Instruments", "Backup ADI Cage/Pitch Adjust Knob")
definePushButton("BAK_ADI_CAGE_PULL", 19, 3350, 350, "Flight Instruments", "Backup ADI Cage/Pitch Adjust Pull")

-- Miscelaneous Switch Panel
defineToggleSwitch("RECORD_SYS_MODE", 14, 3422, 422, "Misc", "Video Recorder System Mode Switch")
defineToggleSwitch("RECORD_SYS_DISPLAY", 14, 3423, 423, "Misc", "Video Recorder System Display Selector Switch")
defineToggleSwitch("DMT", 16, 3424, 424, "Misc", "DMT Toggle On/Off")
defineMultipositionSwitch("DUAL_CPU_MODE", 12, 3425, 425, 3, 0.5, "Misc", "Display Computer Mode Selector Switch PRIM/AUTO/ALTER")
defineToggleSwitch("PROBE_HEAT_MODE", 19, 3426, 426, "Misc", "Probe Heat Mode Switch")
defineMultipositionSwitch("MISS_PC_MODE", 12, 3427, 427, 3, 0.5, "Misc", "Mission Computer Mode Switch OVRD/AUTO/OFF")
defineToggleSwitch("FLIR", 14, 3429, 429, "Misc", "FLIR Power Switch")

-- INS Panel
defineMultipositionSwitch("INS_MODE", 11, 3421, 421, 8, 0.1, "INS" , "INS Mode Knob OFF/SEA/GND/NAV/IFA/GYRO/GB/TEST")

-------------------------------------------------------------------
-- LEFT CONSOLE:
-------------------------------------------------------------------
-- Trim Panel
defineMultipositionSwitch("YAW_TRIM_SW", 28, 3471, 471, 3, 0.5, "Trim", "RPS/YAW Trim Switch TEST/ON/OFF")
defineMultipositionSwitch("TRIM_MODE", 28, 3472, 472, 3, 0.5, "Trim", "Trim Mode Switch APRCH/HVR/OFF")

-- SAAHS Panel
defineToggleSwitch("ALT_HOLD_SW", 28, 3476, 476, "SAAHS", "Alt Hold Switch")
defineToggleSwitch("Q_FEEL_SW", 28, 3475, 475, "SAAHS", "Q Feel Switch")
defineMultipositionSwitch("AFC_SW", 28, 3477, 477, 3, 0.5, "SAAHS", "AFC Switch ON/OFF/RESET")
defineToggleSwitch("SAS_YAW", 28, 3478, 478, "SAAHS", "SAS Yaw Switch")
defineToggleSwitch("SAS_ROLL", 28, 3479, 479, "SAAHS", "SAS Roll Switch")
defineToggleSwitch("SAS_PITCH", 28, 3480, 480, "SAAHS", "SAS Pitch Switch")

-- Throttle Quadrant
defineToggleSwitch("JPTL_SW", 9, 3481, 481, "Throttle", "JPTL Switch")
define3PosTumb("RUDDER_TRIM", 28, 3483, 483, "Throttle", "Rudder Trim Switch L/R")
definePushButton("EMS_B", 9, 3482, 482, "Throttle", "EMS Button")
defineToggleSwitch("MAN_FUEL_SW", 9, 3484, 484, "Throttle", "Manual Fuel Switch")
definePotentiometer("THROTTLE_FRICTION", 28, 3485, 485, {0, 1}, "Throttle", "Throttle Lever Friction Knob")
definePotentiometer("NOZZLE_FRICTION", 28, 3486, 486, {0, 1}, "Throttle", "Nozzle Lever Friction Knob")
defineToggleSwitch("THROTT_CUTOFF_LV", 9, 3490, 490, "Throttle", "Throttle Cutoff Lever")
defineToggleSwitch("PARK_BRAKE_LV", 28, 3489, 489, "Throttle", "Parking Brake Lever")
definePotentiometer("NOZZLE_LEVER", 13, 3487, 487, {0, 1}, "Throttle", "Nozzle Control Lever")
defineTumb("STO_LEVER", 13, 3488, 488, 0.05, {0.35, 1}, nil, false, "Throttle", "STO Stop Lever")

-- Fuel Panel
defineToggleSwitch("FUEL_PROP", 9, 3504, 504, "Fuel Panel", "Fuel Proportioner")
defineMultipositionSwitch("FUEL_PUMP_L", 9, 3505, 505, 3, 0.5, "Fuel Panel" , "Fuel Pump L Switch DC OPEN/OFF/NORM")
defineMultipositionSwitch("FUEL_PUMP_R", 9, 3506, 506, 3, 0.5, "Fuel Panel" , "Fuel Pump R Switch DC OPEN/OFF/NORM")
defineMultipositionSwitch("PROBE", 9, 3507, 507, 3, 0.5, "Fuel Panel" , "Air Refueling Probe Switch IN/OUT/PRESS")
defineToggleSwitch("FUEL_DUMP_L", 9, 3508, 508, "Fuel Panel", "Fuel Dump L Switch")
defineToggleSwitch("FUEL_DUMP_R", 9, 3509, 509, "Fuel Panel", "Fuel Dump R Switch")

-- External Lights Panel
defineMultipositionSwitch("LANDING_TAXI_LIGHTS", 33, 3472, 472, 3, 0.5, "External Lights" , "Landing/Taxi Lights Switch OFF/HVR/APRCH")
defineMultipositionSwitch("EXT_LIGHTS", 33, 3503, 503, 3, 0.5, "External Lights" , "External Lights Mode Switch NORM/NVG/OFF")
definePotentiometer("FORMATION_LIGHTS", 33, 3510, 510, {0, 1}, "External Lights", "Formation Lights Knob")
defineMultipositionSwitch("POS_LIGHTS", 33, 3511, 511, 3, 0.5, "External Lights" , "Position Lights Switch OFF/DIM/BRT")
defineToggleSwitch("ANTI_COLL_LIGHTS", 33, 3512, 512, "External Lights", "Anti-Collision Lights Switch")
defineToggleSwitch("EXT_AUX_LIGHTS", 33, 3513, 513, "External Lights", "External Auxiliary Lights Switch")

-- Pilot Service Panel
defineToggleSwitch("O2_SW", 36, 3514, 514, "Gear/Flaps Control Panel", "Oxygen Switch")
defineToggleSwitch("H2O_DUMP", 9, 3515, 515, "Gear/Flaps Control Panel", "H2O Dump Switch")
defineToggleSwitch("LIDS_SW", 13, 3516, 516, "Gear/Flaps Control Panel", "LIDS Switch")
defineToggleSwitch("RPM_SW", 9, 3517, 517, "Gear/Flaps Control Panel", "ENG RPM Switch")
defineToggleSwitch("EFC_SW", 9, 3518, 518, "Gear/Flaps Control Panel", "EFC Switch")

-- Bulkhead Switches
define3PosTumb("SEAT_ADJ", 12, 3502, 502, "Bulkhead Left", "Seat Adjustment Switch")
defineToggleSwitch("FUEL_SHUTOFF", 9, 3519, 519, "Bulkhead Left", "Fuel Shutoff Lever")
defineToggleSwitch("DECS_SW", 9, 3520, 520, "Bulkhead Left", "DECS Switch")

-------------------------------------------------------------------
-- RIGHT CONSOLE:
-------------------------------------------------------------------
-- Electrical Panel
defineToggleSwitch("DC_TEST_SW", 1, 3609, 609, "Electric Panel", "DC Test Switch")
defineMultipositionSwitch("APU_GEN_SW", 1, 3610, 610, 3, 0.5, "Electric Panel", "APU Generator Switch OFF/ON/RESET")
defineToggleSwitch("ENG_START_SW", 1, 3611, 611, "Electric Panel", "Engine Start Switch")
defineMultipositionSwitch("GEN_SW", 1, 3612, 612, 3, 0.5, "Electric Panel", "Generator Switch  TEST/OFF/ON")
defineMultipositionSwitch("BATT_SW", 1, 3613, 613, 3, 0.5, "Electric Panel", "Battery Switch  ALERT/OFF/ON")

-- V/UHF Radio Panel
definePotentiometer("UHF_VOL", 7, 3614, 614, {0, 1}, "UHF Radio", "V/UHF RSC Volume Knob")
defineRotary("UHF_FREQ", 7, 3615, 615, "UHF Radio", "V/UHF RSC Chan/Freq Knob")
defineMultipositionSwitch("UHF_MODE", 7, 3616, 616, 7, 0.2, "UHF Radio" , "V/UHF RSC Operational Mode Switch ZRO/OFF/TEST/TR+G/TR/ADF/CHNG PRST")
definePushButton("UHF_ANC_POINT", 7, 3617, 617, "UHF Radio", "V/UHF RSC Ancillary Mode Pointer")
definePushButton("UHF_ANC_SW", 7, 3618, 618, "UHF Radio", "V/UHF RSC Ancillary Mode Switch")
defineMultipositionSwitch("BOMBS_ARM_SW", 7, 3619, 619, 7, 0.15, "UHF Radio" , "V/UHF RSC Frequency Mode Switch AJ-M/AJ/MAR/PRST/MAN/243/121")
definePushButton("UHF_LOAD_SW", 7, 3620, 620, "UHF Radio", "V/UHF RSC LOAD/OFST Switch")

-- ACNIP
defineToggleSwitch("ACNIP_MODE", 8, 3621, 621, "ACNIP", "ACNIP Mode Switch")
defineToggleSwitch("KY1_TYPE", 8, 3622, 622, "ACNIP", "KY-1 Cipher Type Selector Switch")
defineToggleSwitch("KY2_TYPE", 8, 3623, 623, "ACNIP", "KY-2 Cipher Type Selector Switch")
defineToggleSwitch("KY1_MODE", 8, 3624, 624, "ACNIP", "KY-1 Code/Mode Switch")
defineToggleSwitch("KY2_MODE", 8, 3625, 625, "ACNIP", "KY-2 Code/Mode Switch")
defineToggleSwitch("ACNIP_RADIO_SEL", 8, 3626, 626, "ACNIP", "ACNIP Radio Selector Switch")
defineToggleSwitch("KY58_CODE_CLEAR", 8, 3627, 627, "ACNIP", "KY-58 Codes Clear Switch")
define3PosTumb("KY58_CODE_LOAD", 8, 3628, 628, "ACNIP", "KY-58 Remote Codes Load Switch  RV1/OPR/RV2")

-- ICS
definePotentiometer("ICS_AUX_VOL", 4, 3629, 629, {0, 1}, "ICS", "ICS Aux Volume Knob")
definePotentiometer("ICS_GND_VOL", 4, 3630, 630, {0, 1}, "ICS", "ICS Ground Volume Knob")
defineMultipositionSwitch("ICS_MIC_MODE", 4, 3631, 631, 3, 0.5, "ICS", "ICS Mic Operational Mode Switch  COLD/HOT/TEL")

-- IFF
defineToggleSwitch("IFF_OPER_MODE", 8, 3632, 632, "IFF", "IFF Operational Mode Switch")
define3PosTumb("IFF_CRYPT_MODE", 8, 3633, 633, "IFF", "IFF Crypto Mode Switch  ZERO/NORM/HOLD")

-- Interior Lights Panel
define3PosTumb("COMP_LIGHT", 34, 3634, 634, "Int Light", "Compass Light/Test Lights  COPM/OFF/LTS TEST")
definePotentiometer("INST_LIGHTS", 34, 3635, 635, {0, 1}, "Int Light", "Instruments Lights")
definePotentiometer("CONSOLE_LIGHTS", 34, 3636, 636, {0, 1}, "Int Light", "Console Lights")
definePotentiometer("FLOOD_LIGHTS_DIAL", 34, 3637, 637, {0, 1}, "Int Light", "Flood Lights")
definePotentiometer("ANNUNCIATOR_LIGHTS", 34, 3638, 638, {0, 0.9}, "Int Light", "Annunciator Lights")

-- ECS Panel
definePotentiometer("TEMP_CONTROL", 36, 3639, 639, {0, 1}, "ECS", "Temperature Control Knob")
defineToggleSwitch("ECS_FWD", 36, 3640, 640, "ECS" , "Fwd Equipment Bay ECS Switch")
defineMultipositionSwitch("CABIN_DEFOG", 36, 3641, 641, 3, 0.5, "ECS" , "Cabin Defog Switch NORM/DFOG/MAX")
defineMultipositionSwitch("ECS_AFT", 36, 3642, 642, 3, 0.5, "ECS" , "Aft Equipment Bay ECS Switch RESET/ON/OFF")
defineMultipositionSwitch("CABIN_PRESS_SWITCH", 36, 3643, 643, 3, 0.5, "ECS" , "Cabin Pressure Switch NORM/DUMP/RAM")

-------------------------------------------------------------------
-- FLOOD LAMPS:
-------------------------------------------------------------------
definePotentiometer("FLOOD_R_CAN_T", 34, 3150, 150, {-1, 1}, "Flood Lamps", "Flood Right Canopy Frame Top")
definePotentiometer("FLOOD_R_CAN_B", 34, 3151, 151, {-1, 1}, "Flood Lamps", "Flood Right Canopy Frame Btm")
definePotentiometer("FLOOD_R_BH_FWD", 34, 3152, 152, {-1, 1}, "Flood Lamps", "Flood Right BH FWD")
definePotentiometer("FLOOD_R_BH_AFT_F", 34, 3153, 153, {-1, 1}, "Flood Lamps", "Flood Right BH AFT Front")
definePotentiometer("FLOOD_R_BH_AFT_B", 34, 3154, 154, {-1, 1}, "Flood Lamps", "Flood Right BH AFT Back")
definePotentiometer("FLOOD_L_BH_AFT_B", 34, 3155, 155, {-1, 1}, "Flood Lamps", "Flood Left BH AFT Back")
definePotentiometer("FLOOD_L_BH_AFT_F", 34, 3156, 156, {-1, 1}, "Flood Lamps", "Flood Left BH AFT Front")
definePotentiometer("FLOOD_L_BH_FWD", 34, 3157, 157, {-1, 1}, "Flood Lamps", "Flood Left BH FWD")
definePotentiometer("FLOOD_L_CAN_B", 34, 3158, 158, {-1, 1}, "Flood Lamps", "Flood Left Canopy Frame Btm")
definePotentiometer("FLOOD_L_CAN_T", 34, 3159, 159, {-1, 1}, "Flood Lamps", "Flood Left Canopy Frame Top")

-------------------------------------------------------------------
-- CANOPY CONTROLS:
-------------------------------------------------------------------
defineToggleSwitch("CANOPY_HAND_L", 28, 3801, 801, "Canopy", "Canopy Handle Left")
defineToggleSwitch("CANOPY_HAND_R", 28, 3802, 802, "Canopy", "Canopy Handle Right")
defineToggleSwitch("CANOPY_LOCK", 28, 3803, 803, "Canopy", "Canopy Locking Lever")
defineFloat("CANOPY_VALUE", 38, {0.0, 1.0}, "Canopy", "Canopy Position")

-------------------------------------------------------------------
-- Indicator Lights & Gauges
-------------------------------------------------------------------
---MIP INNER LEFT
defineIndicatorLight("MC_LIGHT", 196, "Warning, Caution and IndicatorLights","MasterCaution Lamp")
defineIndicatorLight("MW_LIGHT", 197, "Warning, Caution and IndicatorLights","MasterWarning Lamp")
defineIndicatorLight("LFUEL_LIGHT", 326, "Warning, Caution and IndicatorLights","Left Fuel Lamp")
defineIndicatorLight("RFUEL_LIGHT", 327, "Warning, Caution and IndicatorLights","Right Fuel Lamp")
defineIndicatorLight("15SEK_LIGHT", 328, "Warning, Caution and IndicatorLights","15 Sek Lamp")
defineIndicatorLight("MFS_LIGHT", 329, "Warning, Caution and IndicatorLights","MFS Lamp")
defineIndicatorLight("BINGO_LIGHT", 330, "Warning, Caution and IndicatorLights","Bingo Lamp")
defineIndicatorLight("H2O_LIGHT", 331, "Warning, Caution and IndicatorLights","H2O Lamp")
---MIP RIGHT SIDE
defineIndicatorLight("FIRE_LIGHT", 334, "Warning, Caution and IndicatorLights","Fire Lamp")
defineIndicatorLight("LAW_LIGHT", 335, "Warning, Caution and IndicatorLights","LAW Lamp")
defineIndicatorLight("FLAPS_LIGHT", 336, "Warning, Caution and IndicatorLights","Flaps Lamp")
defineIndicatorLight("LTANK_LIGHT", 337, "Warning, Caution and IndicatorLights","Left Tank Lamp")
defineIndicatorLight("RTANK_LIGHT", 338, "Warning, Caution and IndicatorLights","Right Tank Lamp")
defineIndicatorLight("HHYD_LIGHT", 339, "Warning, Caution and IndicatorLights","HHYD Lamp")
defineIndicatorLight("GEAR_LIGHT", 340, "Warning, Caution and IndicatorLights","Gear Lamp")
defineIndicatorLight("OT_LIGHT", 341, "Warning, Caution and IndicatorLights","OT Lamp")
defineIndicatorLight("JPTL_LIGHT", 342, "Warning, Caution and IndicatorLights","JPTL Lamp")
defineIndicatorLight("EFC_LIGHT", 343, "Warning, Caution and IndicatorLights","EFC Lamp")
defineIndicatorLight("GEN_LIGHT", 344, "Warning, Caution and IndicatorLights","GEN Lamp")
---EYEBROW LIGHTS RIGHT SIGHT
defineIndicatorLight("SAM_LIGHT", 276, "Warning, Caution and IndicatorLights","SAM Lamp")
defineIndicatorLight("CW_LIGHT", 277, "Warning, Caution and IndicatorLights","CW Lamp")
defineIndicatorLight("AI_LIGHT", 278, "Warning, Caution and IndicatorLights","AI Lamp")
defineIndicatorLight("AAA_LIGHT", 279, "Warning, Caution and IndicatorLights","AAA Lamp")
---MIP OUTER LEFT SIDE
defineIndicatorLight("NAV_LIGHT", 283, "Warning, Caution and IndicatorLights","NAV Lamp")
defineIndicatorLight("VSTOL_LIGHT", 285, "Warning, Caution and IndicatorLights","VSTOL Lamp")
defineIndicatorLight("AG_LIGHT", 281, "Warning, Caution and IndicatorLights","A/G Lamp")
defineIndicatorLight("SEL_LIGHT", 451, "Warning, Caution and IndicatorLights","SEL Lamp")
defineIndicatorLight("CMBT_LIGHT", 452, "Warning, Caution and IndicatorLights","CMBT Lamp")
defineIndicatorLight("STO_LIGHT", 453, "Warning, Caution and IndicatorLights","STO Lamp")
---CANOPY FRAME
defineIndicatorLight("LEFT_LIGHT", 750, "Warning, Caution and IndicatorLights","Left Lamp Canopy")
defineIndicatorLight("READY_LIGHT", 751, "Warning, Caution and IndicatorLights","Ready Lamp Canopy")
defineIndicatorLight("RIGHT_LIGHT", 752, "Warning, Caution and IndicatorLights","Right Lamp Canopy")
---GEAR LEVER
defineIndicatorLight("GEAR_LEVER_LIGHT", 446, "Warning, Caution and IndicatorLights","Red Gear Lever Lamp")
---CAUTION PANEL (from upper left to lower right)
defineIndicatorLight("OXY_WLIGHT", 560, "Warning, Caution and IndicatorLights","OXY Warning Light")
defineIndicatorLight("WSLD_WLIGHT", 561, "Warning, Caution and IndicatorLights","WSLD Warning Light")
defineIndicatorLight("HYD1_WLIGHT", 562, "Warning, Caution and IndicatorLights","HYD 1 Warning Light")
defineIndicatorLight("HYD2_WLIGHT", 563, "Warning, Caution and IndicatorLights","HYD 2 Warning Light")
defineIndicatorLight("LPUMP_WLIGHT", 564, "Warning, Caution and IndicatorLights","Left Pump Warning Light")
defineIndicatorLight("RPUMP_WLIGHT", 565, "Warning, Caution and IndicatorLights","Right Pump Warning Light")
defineIndicatorLight("LTRANS_WLIGHT", 566, "Warning, Caution and IndicatorLights","L TRANS Warning Light")
defineIndicatorLight("RTRANS_WLIGHT", 567, "Warning, Caution and IndicatorLights","R TRANS Warning Light")
defineIndicatorLight("FLAPS1_WLIGHT", 568, "Warning, Caution and IndicatorLights","FLAPS 1 Warning Light")
defineIndicatorLight("FLAPS2_WLIGHT", 569, "Warning, Caution and IndicatorLights","FLAPS 2 Warning Light")
defineIndicatorLight("AUTFLP_WLIGHT", 570, "Warning, Caution and IndicatorLights","AUT FLP Warning Light")
defineIndicatorLight("PROP_WLIGHT", 571, "Warning, Caution and IndicatorLights","PROP Warning Light")
defineIndicatorLight("LIDS_WLIGHT", 572, "Warning, Caution and IndicatorLights","LIDS Warning Light")
defineIndicatorLight("OIL_WLIGHT", 573, "Warning, Caution and IndicatorLights","OIL Warning Light")
defineIndicatorLight("APU_GEN_WLIGHT", 574, "Warning, Caution and IndicatorLights","APU GEN Warning Light")
defineIndicatorLight("LINE_WLIGHT", 575, "Warning, Caution and IndicatorLights","Line -- Warning Light")
defineIndicatorLight("GPS_WLIGHT", 576, "Warning, Caution and IndicatorLights","GPS Warning Light")
defineIndicatorLight("DEP_RES_WLIGHT", 577, "Warning, Caution and IndicatorLights","DEP RES Warning Light")
defineIndicatorLight("DC_WLIGHT", 578, "Warning, Caution and IndicatorLights","DC Warning Light")
defineIndicatorLight("STBY_TR_WLIGHT", 579, "Warning, Caution and IndicatorLights","STBY TR Warning Light")
defineIndicatorLight("CS_COOL_WLIGHT", 580, "Warning, Caution and IndicatorLights","CS COOL Warning Light")
defineIndicatorLight("LOAD_WLIGHT", 581, "Warning, Caution and IndicatorLights","LOAD Warning Light")
defineIndicatorLight("CANOPY_WLIGHT", 582, "Warning, Caution and IndicatorLights","CANOPY Warning Light")
defineIndicatorLight("INS_WLIGHT", 583, "Warning, Caution and IndicatorLights","INS Warning Light")
defineIndicatorLight("SKID_WLIGHT", 584, "Warning, Caution and IndicatorLights","SKID Warning Light")
defineIndicatorLight("EFC_WLIGHT", 585, "Warning, Caution and IndicatorLights","EFC Warning Light")
defineIndicatorLight("NWS_WLIGHT", 586, "Warning, Caution and IndicatorLights","NWS Warning Light")
defineIndicatorLight("AFC_WLIGHT", 587, "Warning, Caution and IndicatorLights","AFC Warning Light")
defineIndicatorLight("C_AUT", 588, "Warning, Caution and IndicatorLights","C AUT Warning Light")
defineIndicatorLight("H2O_SEL", 589, "Warning, Caution and IndicatorLights","H2O SEL Warning Light")
defineIndicatorLight("APU_WLIGHT", 590, "Warning, Caution and IndicatorLights","APU Warning Light")
defineIndicatorLight("PITCH_WLIGHT", 591, "Warning, Caution and IndicatorLights","PITCH Warning Light")
defineIndicatorLight("IFF_WLIGHT", 592, "Warning, Caution and IndicatorLights","IFF Warning Light")
defineIndicatorLight("SPD_BRK_WLIGHT", 593, "Warning, Caution and IndicatorLights","SPD BRK Warning Light")
defineIndicatorLight("DROOP_WLIGHT", 594, "Warning, Caution and IndicatorLights","DROOP Warning Light")
defineIndicatorLight("ROLL_WLIGHT", 595, "Warning, Caution and IndicatorLights","ROLL Warning Light")
defineIndicatorLight("AFT_BAY_WLIGHT", 596, "Warning, Caution and IndicatorLights","AFT BAY Warning Light")
defineIndicatorLight("AV_BIT_WLIGHT", 597, "Warning, Caution and IndicatorLights","AV BIT Warning Light")--MAYBE NOT WORKING !--
defineIndicatorLight("LINE2_WLIGHT", 598, "Warning, Caution and IndicatorLights","2 Line --  Warning Light")
defineIndicatorLight("YAW_WLIGHT", 599, "Warning, Caution and IndicatorLights","YAW Warning Light")
defineIndicatorLight("CW_NOGO_WLIGHT", 600, "Warning, Caution and IndicatorLights","CW NOGO Warning Light")
defineIndicatorLight("P_JAM_WLIGHT", 601, "Warning, Caution and IndicatorLights","P JAM Warning Light")
defineIndicatorLight("JAM_HOT_WLIGHT", 602, "Warning, Caution and IndicatorLights","JAM HOT Warning Light")
defineIndicatorLight("ENG_EXC_WLIGHT", 603, "Warning, Caution and IndicatorLights","ENG EXC Warning Light")
defineIndicatorLight("P_NOGO_WLIGHT", 604, "Warning, Caution and IndicatorLights","P NOGO Warning Light")
defineIndicatorLight("CW_JAM_WLIGHT", 605, "Warning, Caution and IndicatorLights","CW JAM Warning Light")
defineIndicatorLight("REPLY_WLIGHT", 606, "Warning, Caution and IndicatorLights","REPLY Warning Light")
---ENGINE DISPLAY
defineFloat("DUCT1", 253, {0.0, 1.0}, "Gauges", "Duct 1. Drum Digit")
defineFloat("DUCT2", 254, {0.0, 1.0}, "Gauges", "Duct 2. Drum Digit")
defineFloat("DUCT3", 255, {0.0, 1.0}, "Gauges", "Duct 3. Drum Digit")
defineFloat("RPM1", 256, {0.0, 1.0}, "Gauges", "RPM 1. Drum Digit")
defineFloat("RPM2", 257, {0.0, 1.0}, "Gauges", "RPM 2. Drum Digit")
defineFloat("RPM3", 258, {0.0, 1.0}, "Gauges", "RPM 3. Drum Digit")
defineFloat("RPM4", 259, {0.0, 1.0}, "Gauges", "RPM 4. Drum Digit")
defineFloat("FF1", 260, {0.0, 1.0}, "Gauges", "FF 1. Drum Digit")
defineFloat("FF2", 261, {0.0, 1.0}, "Gauges", "FF 2. Drum Digit")
defineFloat("FF3", 262, {0.0, 1.0}, "Gauges", "FF 3. Drum Digit")
defineFloat("JPT1", 263, {0.0, 1.0}, "Gauges", "JPT 1. Drum Digit")
defineFloat("JPT2", 264, {0.0, 1.0}, "Gauges", "JPT 2. Drum Digit")
defineFloat("JPT3", 265, {0.0, 1.0}, "Gauges", "JPT 3. Drum Digit")
defineFloat("STAB_ARROW", 266, {-1.0, 1.0}, "Gauges", "STAB Arrow up/down Drum Digit")
defineFloat("STAB1", 267, {0.0, 1.0}, "Gauges", "STAB 1. Drum Digit")
defineFloat("STAB2", 268, {0.0, 1.0}, "Gauges", "STAB 2. Drum Digit")
defineFloat("H2O1", 269, {0.0, 1.0}, "Gauges", "H2O 1. Drum Digit")
defineFloat("H2O2", 270, {0.0, 1.0}, "Gauges", "H2O 2. Drum Digit")
defineFloat("NOZZLE_POINTER", 271, {0.0, 1.0}, "Gauges", "Nozzle Pointer")
defineIndicatorLight("H2O_CONTROL_LIGHT", 177, "Warning, Caution and IndicatorLights","H2O Control Lamp (green)")
---FUEL PANEL DISPLAY
defineFloat("FUEL_FLAG", 365, {0.0, 1.0}, "Gauges", "FUEL ON/OFF Flag")
defineFloat("TOT_FUEL1", 366, {0.0, 1.0}, "Gauges", "TOT FUEL 1. Drum Digit")
defineFloat("TOT_FUEL2", 367, {0.0, 1.0}, "Gauges", "TOT FUEL 2. Drum Digit")
defineFloat("TOT_FUEL3", 368, {0.0, 1.0}, "Gauges", "TOT FUEL 3. Drum Digit")
defineFloat("TOT_FUEL4", 369, {0.0, 1.0}, "Gauges", "TOT FUEL 4. Drum Digit")
defineFloat("TOT_FUEL5", 370, {0.0, 1.0}, "Gauges", "TOT FUEL 5. Drum Digit")
defineFloat("LBS_L1", 371, {0.0, 1.0}, "Gauges", "LBS Left 1. Drum Digit")
defineFloat("LBS_L2", 372, {0.0, 1.0}, "Gauges", "LBS Left 2. Drum Digit")
defineFloat("LBS_L3", 373, {0.0, 1.0}, "Gauges", "LBS Left 3. Drum Digit")
defineFloat("LBS_L4", 374, {0.0, 1.0}, "Gauges", "LBS Left 4. Drum Digit")
defineFloat("LBS_R1", 375, {0.0, 1.0}, "Gauges", "LBS Right 1. Drum Digit")
defineFloat("LBS_R2", 376, {0.0, 1.0}, "Gauges", "LBS Right 2. Drum Digit")
defineFloat("LBS_R3", 377, {0.0, 1.0}, "Gauges", "LBS Right 3. Drum Digit")
defineFloat("LBS_R4", 378, {0.0, 1.0}, "Gauges", "LBS Right 4. Drum Digit")
defineFloat("BINGO1", 381, {0.0, 1.0}, "Gauges", "BINGO 1. Drum Digit")
defineFloat("BINGO2", 382, {0.0, 1.0}, "Gauges", "BINGO 2. Drum Digit")
defineFloat("BINGO3", 383, {0.0, 1.0}, "Gauges", "BINGO 3. Drum Digit")
defineFloat("BINGO4", 384, {0.0, 1.0}, "Gauges", "BINGO 4. Drum Digit")
---UPPER AMARMENT PANEL
defineFloat("MODE_GAUGE", 385, {0.0, 1.0}, "Gauges", "MODE Drum Digit")
defineFloat("FUZ1", 386, {0.0, 1.0}, "Gauges", "Fuze 1. Drum Digit")
defineFloat("FUZ2", 387, {0.0, 1.0}, "Gauges", "Fuze 2. Drum Digit")
defineFloat("INVT1", 392, {0.0, 1.0}, "Gauges", "InVT x 10 1. Drum Digit")
defineFloat("INVT2", 393, {0.0, 1.0}, "Gauges", "InVT x 10 2. Drum Digit")
defineFloat("INVT3", 394, {0.0, 1.0}, "Gauges", "InVT x 10 3. Drum Digit")
defineFloat("MULT_GAUGE", 391, {0.0, 1.0}, "Gauges", "Multiplicator Drum Digit")
defineFloat("QTY1", 389, {0.0, 1.0}, "Gauges", "Quantity 1. Drum Digit")
defineFloat("QTY2", 390, {0.0, 1.0}, "Gauges", "Quantity 2. Drum Digit")
---LOWER AMARMENT PANEL
defineFloat("SET_FLAG1", 406, {0.0, 1.0}, "Gauges", "SET FLAG 1 Gauge")
defineFloat("SET_FLAG2", 408, {0.0, 1.0}, "Gauges", "SET FLAG 2 Gauge")
defineFloat("SET_FLAG3", 410, {0.0, 1.0}, "Gauges", "SET FLAG 3 Gauge")
defineFloat("SET_FLAG4", 412, {0.0, 1.0}, "Gauges", "SET FLAG 4 Gauge")
defineFloat("SET_FLAG5", 414, {0.0, 1.0}, "Gauges", "SET FLAG 5 Gauge")
defineFloat("SET_FLAG6", 416, {0.0, 1.0}, "Gauges", "SET FLAG 6 Gauge")
defineFloat("SET_FLAG7", 418, {0.0, 1.0}, "Gauges", "SET FLAG 7 Gauge")
---GEAR PANEL DISPLAY --STATUS LIGHTS--
defineIndicatorLight("NOSE_GEAR_Y", 462, "Warning, Caution and IndicatorLights","Nose Gear Yellow Light")
defineIndicatorLight("NOSE_GEAR_G", 463, "Warning, Caution and IndicatorLights","Nose Gear Green Light")
defineIndicatorLight("LEFT_GEAR_Y", 464, "Warning, Caution and IndicatorLights","Left Gear Yellow Light")
defineIndicatorLight("LEFT_GEAR_G", 465, "Warning, Caution and IndicatorLights","Left Gear Green Light")
defineIndicatorLight("RIGHT_GEAR_Y", 466, "Warning, Caution and IndicatorLights","Right Gear Yellow Light")
defineIndicatorLight("RIGHT_GEAR_G", 467, "Warning, Caution and IndicatorLights","Right Gear Green Light")
defineIndicatorLight("MAIN_GEAR_Y", 469, "Warning, Caution and IndicatorLights","Main Gear Yellow Light")
defineIndicatorLight("MAIN_GEAR_G", 468, "Warning, Caution and IndicatorLights","Main Gear Green Light")
---BRAKE/ HYD DISPLAY
defineFloat("BRAKE1", 550, {0.0, 1.0}, "Gauges", "Brake 1. Drum Digit")
defineFloat("BRAKE2", 551, {0.0, 1.0}, "Gauges", "Brake 2. Drum Digit")
defineFloat("BRAKE3", 552, {0.0, 1.0}, "Gauges", "Brake 3. Drum Digit")
defineFloat("HYD11", 553, {0.0, 1.0}, "Gauges", "Hydraulic 1 1. Drum Digit")
defineFloat("HYD12", 554, {0.0, 1.0}, "Gauges", "Hydraulic 1 2. Drum Digit")
defineFloat("HYD13", 555, {0.0, 1.0}, "Gauges", "Hydraulic 1 3. Drum Digit")
defineFloat("HYD21", 556, {0.0, 1.0}, "Gauges", "Hydraulic 2 1. Drum Digit")
defineFloat("HYD22", 557, {0.0, 1.0}, "Gauges", "Hydraulic 2 2. Drum Digit")
defineFloat("HYD23", 558, {0.0, 1.0}, "Gauges", "Hydraulic 2 3. Drum Digit")
---FLAP POSITION DISPLAY
defineFloat("FLAP_POS1", 455, {0.0, 1.0}, "Gauges", "Flap Position 1. Drum Digit")
defineFloat("FLAP_POS2", 456, {0.0, 1.0}, "Gauges", "Flap Position 2. Drum Digit")
defineFloat("ADI_PITCH", 349, {-1, 1}, "Gauges", "ADI Pitch")
defineFloat("ADI_BANK", 348, {-1, 1}, "Gauges", "ADI Bank")
defineFloat("ADI_FLAG", 347, {0, 1}, "Gauges", "ADI OFF Flag")
defineFloat("KNT_POINTER_S", 346, {0, 1}, "Gauges", "Speed knt Pointer Short")
defineFloat("KNT_POINTER_L", 345, {0, 1}, "Gauges", "Speed knt Pointer Long")
defineFloat("ALT_POINTER", 352, {0, 1}, "Gauges", "Altimeter Pointer")
defineFloat("ALT_10000FT_CNT", 353, {0, 1}, "Gauges", "Altimeter 10000 FT Counter")
defineFloat("ALT_1000FT_CNT", 354, {0, 1}, "Gauges", "Altimeter 1000 FT Counter")
defineFloat("ALT_100FT_CNT", 355, {0, 1}, "Gauges", "Altimeter 100 FT Counter")
defineFloat("ALT_PRESSURE1", 356, {0, 1}, "Gauges", "Altimeter Pressure Digit 1")
defineFloat("ALT_PRESSURE2", 357, {0, 1}, "Gauges", "Altimeter Pressure Digit 2")
defineFloat("ALT_PRESSURE3", 358, {0, 1}, "Gauges", "Altimeter Pressure Digit 3")
defineFloat("ALT_PRESSURE4", 359, {0, 1}, "Gauges", "Altimeter Pressure Digit 4")
defineFloat("AOA_FLAG", 360, {0, 1}, "Gauges", "Speed knt Pointer Short")
defineFloat("AOA_POINTER", 361, {-0.1, 0.2}, "Gauges", "Speed knt Pointer Long")
defineFloat("VVI", 362, {-1, 1}, "Gauges", "Vertical Velocity Indicator")
defineFloat("SLIP_IND", 363, {-1, 1}, "Gauges", "Slip Indicator Ball")
---SIDE PANELS LEFT
defineFloat("AILERON_NEEDLE", 473, {-1, 1}, "Gauges", "Aileron Needle")
defineFloat("RUDDER_NEEDLE", 474, {-1, 1}, "Gauges", "Rudder Needle")
---SIDE PANELS RIGHT
defineFloat("CABIN_PRESS", 607, {0, 1}, "Gauges", "Cabin Pressure Pointer")
defineFloat("VOLT_METER", 608, {0, 1}, "Gauges", "Volt Meter Pointer")
---COMPASS
defineFloat("COMPASS_NS", 753, {0, 1}, "Gauges", "Compassrose N-S")
defineFloat("COMPASS_UD", 754, {-1, 1}, "Gauges", "Compassrose Up/Down")
defineFloat("COMPASS_BANK", 755, {-1, 1}, "Gauges", "Compassrose Bank")
---CLOCK
defineFloat("CLOCK_HH", 759, {0, 1}, "Gauges", "Clock Hours")
defineFloat("CLOCK_MM", 760, {0, 1}, "Gauges", "Clock Minutes")
defineFloat("CLOCK_SS", 761, {0, 1}, "Gauges", "Clock Seconds")
--CABIN LIGHTNING
defineFloat("FLOOD_LIGHTS", 180, {0, 1}, "Gauges", "Flood Lightning Intensity")
defineFloat("MIP_LIGHTS", 182, {0, 1}, "Gauges", "MIP Backlight Intensity")
defineFloat("SIDEPANEL_LIGHTS", 183, {0, 1}, "Gauges", "Sidepanel Lightning Intensity")
defineFloat("COMPASS_LIGHTS", 184, {0, 1}, "Gauges", "Compass Lightning Intensity")

defineFloat("BRAKE_ACCU", 559, {0, 0.4}, "Gauges", "Brake Accummulator")
defineFloat("TURN_INDI", 652, {-1, 1}, "Gauges", "Turn Indicator")
defineFloat("SLIP_TURN_FLAG", 654, {0, 1}, "Gauges", "Slip/Turn Flag")

defineToggleSwitch("MIRROR_TOGGLE_L", 19, 4124, 1124, "Canopy", "Mirror Rendering Toggle Left")
defineToggleSwitch("MIRROR_TOGGLE_C", 19, 4125, 1125, "Canopy", "Mirror Rendering Toggle Center")
defineToggleSwitch("MIRROR_TOGGLE_R", 19, 4126, 1126, "Canopy", "Mirror Rendering Toggle Right")
defineToggleSwitch("HIDE_STICK", 28, 4999, 999, "Cockpit", "Show/Hide Controls")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(935) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights")
defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(934)*65535)
end, 65535, "External Aircraft Model", "Formation Lights")

defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")
defineIntegerFromGetter("EXT_WOW_TAIL", function()
	if LoGetAircraftDrawArgumentValue(343) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")

-- Get Displays Functions

local function getComm1Text()
	if parse_indication(5) == nil then return (" "):rep(2) end
	local txt = parse_indication(5)["ufc_chnl_1_m"] or parse_indication(5)["ufc_chnl_1_v"] or ""
	return (" "):rep(2 - #txt) .. txt:sub(3,4)
end
defineString("UFC_COMM1_DISPLAY", getComm1Text, 2, "UFC", "UFC Comm1 Preset Display")
local function getComm2Text()
	if parse_indication(5) == nil then return (" "):rep(2) end
	local txt = parse_indication(5)["ufc_chnl_2_m"] or parse_indication(5)["ufc_chnl_2_v"] or ""
	return (" "):rep(2 - #txt) .. txt:sub(3,4)
end
defineString("UFC_COMM2_DISPLAY", getComm2Text, 2, "UFC", "UFC Comm2 Preset Display")


local dummyAlloc = moduleBeingDefined.memoryMap:allocateString { maxLength = 14 }

local function getAV8BNAODU1Select()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_1_Slc"
			then
			return value:sub(1)
		end
    end
return " "
end

defineString("AV8BNA_ODU_1_SELECT", getAV8BNAODU1Select, 1, "ODU", "ODU Option 1 Select (string)")

local function getAV8BNAODU1Text()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_1_Text"
			then
			return value:sub(1,4)
		end
    end
return "    "
end

defineString("AV8BNA_ODU_1_Text", getAV8BNAODU1Text, 4, "ODU", "ODU Option 1 Text (string)")

local function getAV8BNAODU2Select()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_2_Slc"
			then
			return value:sub(1)
		end
    end
return " "
end

defineString("AV8BNA_ODU_2_SELECT", getAV8BNAODU2Select, 1, "ODU", "ODU Option 2 Select (string)")

local function getAV8BNAODU2Text()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_2_Text"
			then
			return value:sub(1,4)
		end
    end
return "    "
end

defineString("AV8BNA_ODU_2_Text", getAV8BNAODU2Text, 4, "ODU", "ODU Option 2 Text (string)")


local function getAV8BNAODU3Select()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_3_Slc"
			then
			return value:sub(1)
		end
    end
return " "
end

defineString("AV8BNA_ODU_3_SELECT", getAV8BNAODU3Select, 1, "ODU", "ODU Option 3 Select (string)")

local function getAV8BNAODU3Text()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_3_Text"
			then
			return value:sub(1,4)
		end
    end
return "    "
end

defineString("AV8BNA_ODU_3_Text", getAV8BNAODU3Text, 4, "ODU", "ODU Option 3 Text (string)")

local function getAV8BNAODU4Select()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_4_Slc"
			then
			return value:sub(1)
		end
    end
return " "
end

defineString("AV8BNA_ODU_4_SELECT", getAV8BNAODU4Select, 1, "ODU", "ODU Option 4 Select (string)")

local function getAV8BNAODU4Text()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_4_Text"
			then
			return value:sub(1,4)
		end
    end
return "    "
end

defineString("AV8BNA_ODU_4_Text", getAV8BNAODU4Text, 4, "ODU", "ODU Option 4 Text (string)")

local function getAV8BNAODU5Select()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_5_Slc"
			then
			return value:sub(1)
		end
    end
return " "
end

defineString("AV8BNA_ODU_5_SELECT", getAV8BNAODU5Select, 1, "ODU", "ODU Option 5 Select (string)")

local function getAV8BNAODU5Text()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "ODU_Option_5_Text"
			then
			return value:sub(1,4)
		end
    end
return "    "
end

defineString("AV8BNA_ODU_5_Text", getAV8BNAODU5Text, 4, "ODU", "ODU Option 5 Text (string)")


local function getUfcText()
	if parse_indication(5) == nil then return (" "):rep(12) end
	local leftStr = parse_indication(5)["ufc_left_position"] or ""
	local rightStr = parse_indication(5)["ufc_right_position"] or ""
	
    local displayStr = leftStr .. (" "):rep(12 - #leftStr - #rightStr) .. rightStr
    return displayStr
end
defineString("UFC_SCRATCHPAD", getUfcText, 12, "UFC", "UFC Scratchpad Display")


BIOS.protocol.endModule()