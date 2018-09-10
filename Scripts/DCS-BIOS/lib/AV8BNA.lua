BIOS.protocol.beginModule("AV8BNA", 0x7800)
BIOS.protocol.setExportModuleAircrafts({"AV8BNA"})

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

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 0.1, {0.0, 0.2}, nil, false, category, description)
end


-------------------------------------------------------------------
-- MAIN INSTRUMENT PANEL:
-------------------------------------------------------------------

-- Master Modes Panel (MSC)
definePushButton("NAV_SEL", 12, 3282, 282,"Master Modes" , "NAV Master Mode Selector")
definePushButton("VSTOL_SEL", 12, 3284, 284,"Master Modes" , "VSTOL Master Mode Selector")
definePushButton("AG_SEL", 12, 3280, 280,"Master Modes" , "AG Master Mode Selector")

-- Engine Display Panel
definePotentiometer("EDP_BRIGHT", 20, 3272, 272, {-1, 1},"Engine Display" , "EDP Brightness Control")
defineToggleSwitch("EDP_BIT", 20, 3655, 655,"Engine Display" , "EDP BIT Button")

-- HUD Control Panel

-- UFC Panel
definePushButton("UFC_B1", 23, 3302, 302,"UFC" , "UFC Button 1")
definePushButton("UFC_B2", 23, 3303, 303,"UFC" , "UFC Button 2/N")
definePushButton("UFC_B3", 23, 3304, 304,"UFC" , "UFC Button 3")
definePushButton("UFC_B4", 23, 3306, 306,"UFC" , "UFC Button 4/W")
definePushButton("UFC_B5", 23, 3307, 307,"UFC" , "UFC Button 5")
definePushButton("UFC_B6", 23, 3308, 308,"UFC" , "UFC Button 6/E")
definePushButton("UFC_B7", 23, 3310, 310,"UFC" , "UFC Button 7")
definePushButton("UFC_B8", 23, 3311, 311,"UFC" , "UFC Button 8/S")
definePushButton("UFC_B9", 23, 3312, 312,"UFC" , "UFC Button 9")
definePushButton("UFC_B0", 23, 3315, 315,"UFC" , "UFC Button 0")
definePushButton("UFC_DOT", 23, 3316, 316,"UFC" , "UFC Button .")
definePushButton("UFC_DASH", 23, 3313, 313,"UFC" , "UFC Button -")
definePushButton("UFC_ENTER", 23, 3314, 314,"UFC" , "UFC ENTER Data Button")
definePushButton("UFC_CLEAR", 23, 3305, 305,"UFC" , "Clear Entry Button")
definePushButton("UFC_TIMER", 23, 3294, 294,"UFC" , "UFC Timer Function Selector")
definePushButton("UFC_ALT", 23, 3324, 324,"UFC" , "UFC Altitude Function Selector")
definePushButton("UFC_IFF", 23, 3318, 318,"UFC" , "UFC IFF Function Selector")
definePushButton("UFC_TACAN", 23, 3319, 319,"UFC" , "UFC TACAN Function Selector")
definePushButton("UFC_WEATHER", 23, 3320, 320,"UFC" , "UFC All Weather Landing Function Selector")
definePushButton("UFC_ONOFF", 23, 3317, 317,"UFC" , "UFC Radalt/TACAN/AWL/IFF ON/OFF Toggle")
definePushButton("UFC_EMCOM", 23, 3325, 325,"UFC" , "UFC EMCON ON/OFF Toggle")
definePushButton("UFC_TARGET", 23, 3296, 296,"UFC" , "UFC Target-Of-Opportunity Selector")
definePushButton("UFC_WAY", 23, 3322, 322,"UFC" , "UFC Waypoint Overfly INS Update Selector")
definePushButton("UFC_WEAPON", 23, 3321, 321,"UFC" , "UFC Weapons Function Selector")
definePushButton("UFC_BEACON", 23, 3323, 323,"UFC" , "UFC Radar Beacon Function Selector")
definePushButton("UFC_IP", 23, 3297, 297,"UFC" , "UFC I/P Button")
definePushButton("UFC_SAVE", 23, 3309, 309,"UFC" , "UFC Save Data Button")
definePotentiometer("UFC_BRIGHT", 23, 3295, 295, {0, 1}, "UHF Radio", "UFC Display Brightness Control")
definePotentiometer("UFC_COM1_VOL", 23, 3298, 298, {0, 1}, "UHF Radio", "UFC Comm 1 Volume Control")
definePotentiometer("UFC_COM2_VOL", 23, 3299, 299, {0, 1}, "UHF Radio", "UFC Comm 2 Volume Control")
definePushButton("UFC_COM1_PULL", 23, 3178, 178,"UFC" , "UFC Comm 1 Channel Selector Pull")
definePushButton("UFC_COM1_PULL", 23, 3179, 179,"UFC" , "UFC Comm 2 Channel Selector Pull")
definePotentiometer("UFC_COM1_SEL", 23, 3300, 300, {0, 1}, "UHF Radio", "UFC Comm 1 Channel Selector")
definePotentiometer("UFC_COM2_SEL", 23, 3301, 301, {0, 1}, "UHF Radio", "UFC Comm 2 Channel Selector")

-- ODU Panel
definePushButton("ODU_OPT1", 24, 3250, 250,"ODU" , "ODU Option 1")
definePushButton("ODU_OPT2", 24, 3251, 251,"ODU" , "ODU Option 2")
definePushButton("ODU_OPT3", 24, 3252, 252,"ODU" , "ODU Option 3")
definePushButton("ODU_OPT4", 24, 3248, 248,"ODU" , "ODU Option 4")
definePushButton("ODU_OPT5", 24, 3249, 249,"ODU" , "ODU Option 5")

-- Master Caution/Warning Panel
definePushButton("M_Caution", 35, 3198, 198,"Master Warning Panel" , "Master Caution")
definePushButton("M_Warning", 35, 3199, 199,"Master Warning Panel" , "Master Warning")

-- Fuel Quantity Indicator
-- MPCD left
definePushButton("MPCD_L_1", 26, 3200, 200,"MPCD Left" , "MPCD Left Button 1")
definePushButton("MPCD_L_2", 26, 3201, 201,"MPCD Left" , "MPCD Left Button 2")
definePushButton("MPCD_L_3", 26, 3202, 202,"MPCD Left" , "MPCD Left Button 3")
definePushButton("MPCD_L_4", 26, 3203, 203,"MPCD Left" , "MPCD Left Button 4")
definePushButton("MPCD_L_5", 26, 3204, 204,"MPCD Left" , "MPCD Left Button 5")
definePushButton("MPCD_L_6", 26, 3205, 205,"MPCD Left" , "MPCD Left Button 6")
definePushButton("MPCD_L_7", 26, 3206, 206,"MPCD Left" , "MPCD Left Button 7")
definePushButton("MPCD_L_8", 26, 3207, 207,"MPCD Left" , "MPCD Left Button 8")
definePushButton("MPCD_L_9", 26, 3208, 208,"MPCD Left" , "MPCD Left Button 9")
definePushButton("MPCD_L_10", 26, 3209, 209,"MPCD Left" , "MPCD Left Button 10")
definePushButton("MPCD_L_11", 26, 3210, 210,"MPCD Left" , "MPCD Left Button 11")
definePushButton("MPCD_L_12", 26, 3211, 211,"MPCD Left" , "MPCD Left Button 12")
definePushButton("MPCD_L_13", 26, 3212, 212,"MPCD Left" , "MPCD Left Button 13")
definePushButton("MPCD_L_14", 26, 3213, 213,"MPCD Left" , "MPCD Left Button 14")
definePushButton("MPCD_L_15", 26, 3214, 214,"MPCD Left" , "MPCD Left Button 15")
definePushButton("MPCD_L_16", 26, 3215, 215,"MPCD Left" , "MPCD Left Button 16")
definePushButton("MPCD_L_17", 26, 3216, 216,"MPCD Left" , "MPCD Left Button 17")
definePushButton("MPCD_L_18", 26, 3217, 217,"MPCD Left" , "MPCD Left Button 18")
definePushButton("MPCD_L_19", 26, 3218, 218,"MPCD Left" , "MPCD Left Button 19")
definePushButton("MPCD_L_20", 26, 3219, 219,"MPCD Left" , "MPCD Left Button 20")

-- MPCD Right
definePushButton("MPCD_R_1", 27, 3224, 224,"MPCD Right" , "MPCD Right Button 1")
definePushButton("MPCD_R_2", 27, 3225, 225,"MPCD Right" , "MPCD Right Button 2")
definePushButton("MPCD_R_3", 27, 3226, 226,"MPCD Right" , "MPCD Right Button 3")
definePushButton("MPCD_R_4", 27, 3227, 227,"MPCD Right" , "MPCD Right Button 4")
definePushButton("MPCD_R_5", 27, 3228, 228,"MPCD Right" , "MPCD Right Button 5")
definePushButton("MPCD_R_6", 27, 3229, 229,"MPCD Right" , "MPCD Right Button 6")
definePushButton("MPCD_R_7", 27, 3230, 230,"MPCD Right" , "MPCD Right Button 7")
definePushButton("MPCD_R_8", 27, 3231, 231,"MPCD Right" , "MPCD Right Button 8")
definePushButton("MPCD_R_9", 27, 3232, 232,"MPCD Right" , "MPCD Right Button 9")
definePushButton("MPCD_R_10", 27, 3233, 233,"MPCD Right" , "MPCD Right Button 10")
definePushButton("MPCD_R_11", 27, 3234, 234,"MPCD Right" , "MPCD Right Button 11")
definePushButton("MPCD_R_12", 27, 3235, 235,"MPCD Right" , "MPCD Right Button 12")
definePushButton("MPCD_R_13", 27, 3236, 236,"MPCD Right" , "MPCD Right Button 13")
definePushButton("MPCD_R_14", 27, 3237, 237,"MPCD Right" , "MPCD Right Button 14")
definePushButton("MPCD_R_15", 27, 3238, 238,"MPCD Right" , "MPCD Right Button 15")
definePushButton("MPCD_R_16", 27, 3239, 239,"MPCD Right" , "MPCD Right Button 16")
definePushButton("MPCD_R_17", 27, 3240, 240,"MPCD Right" , "MPCD Right Button 17")
definePushButton("MPCD_R_18", 27, 3241, 241,"MPCD Right" , "MPCD Right Button 18")
definePushButton("MPCD_R_19", 27, 3242, 242,"MPCD Right" , "MPCD Right Button 19")
definePushButton("MPCD_R_20", 27, 3243, 243,"MPCD Right" , "MPCD Right Button 20")

-- Armament Control Panel ACP

-- Master Armament Panel
definePushButton("LAUNCH_FLARE_SALVO", 30, 3286, 286,"Master Armament Panel" , "Launch Flare Salvo")
defineToggleSwitch("MASTER_ARM", 29, 3287, 287,"Master Armament Panel" , "Master Arm Switch")

-- ECM Control Panel

-- Landing Gear/Flaps Control Panel
defineToggleSwitch("LG_LEVER", 28, 3461, 461,"Gear/Flaps Control Panel" , "Gear Lever")
defineToggleSwitch("LG_EMERGBATT_LEVER", 28, 3470, 470,"Gear/Flaps Control Panel" , "Landing Gear Emergency Battery Lever")

-- Combat/Water Panel
-- Bulkhead Switches
-- Seat
defineToggleSwitch("SEAT_SAFE_LEVER", 12, 3800, 800,"Seat" , "Seat Ground Safety Lever")

-------------------------------------------------------------------
-- CENTER CONSOLE:
-------------------------------------------------------------------
-- Flights Instruments Panel
-- Miscelaneous Switch Panel

-- INS Panel
defineMultipositionSwitch("INS_MODE", 11, 3421, 421, 7, 0.1,"INS" ,"INS Mode Knob OFF/SEA/GND/NAV/IFA/GYRO/GB/TEST")

-------------------------------------------------------------------
-- LEFT CONSOLE:
-------------------------------------------------------------------
-- Trim Panel
-- SAAHS Panel
-- Throttle Quadrant
-- Fuel Panel
-- External Lights Panel
-- Pilot Service Panel
-- Bulkhead Switches

-------------------------------------------------------------------
-- RIGHT CONSOLE:
-------------------------------------------------------------------
-- Electrical Panel
-- V/UHF Radio Panel
-- ACNIP
-- ICS
-- IFF
-- Interior Lights Panel
-- ECS Panel

-------------------------------------------------------------------
-- FLOOD LAMPS:
-------------------------------------------------------------------
definePotentiometer("FLOOD_R_CAN_T", 28, 3150, 150, {-1, 1}, "Flood Lamps", "Flood Right Canopy Frame Top")
definePotentiometer("FLOOD_R_CAN_B", 28, 3151, 151, {-1, 1}, "Flood Lamps", "Flood Right Canopy Frame Btm")
definePotentiometer("FLOOD_R_BH_FWD", 28, 3152, 152, {-1, 1}, "Flood Lamps", "Flood Right BH FWD")
definePotentiometer("FLOOD_R_BH_AFT_F", 28, 3153, 153, {-1, 1}, "Flood Lamps", "Flood Right BH AFT Front")
definePotentiometer("FLOOD_R_BH_AFT_B", 28, 3154, 154, {-1, 1}, "Flood Lamps", "Flood Right BH AFT Back")
definePotentiometer("FLOOD_L_BH_AFT_B", 28, 3155, 155, {-1, 1}, "Flood Lamps", "Flood Left BH AFT Back")
definePotentiometer("FLOOD_L_BH_AFT_F", 28, 3156, 156, {-1, 1}, "Flood Lamps", "Flood Left BH AFT Front")
definePotentiometer("FLOOD_L_BH_FWD", 28, 3157, 157, {-1, 1}, "Flood Lamps", "Flood Left BH FWD")
definePotentiometer("FLOOD_L_CAN_B", 28, 3158, 158, {-1, 1}, "Flood Lamps", "Flood Left Canopy Frame Btm")
definePotentiometer("FLOOD_L_CAN_T", 28, 3159, 159, {-1, 1}, "Flood Lamps", "Flood Left Canopy Frame Top")

-------------------------------------------------------------------
-- CANOPY CONTROLS:
-------------------------------------------------------------------



BIOS.protocol.endModule()