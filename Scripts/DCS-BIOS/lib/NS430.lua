BIOS.protocol.beginModule("NS430", 0x8000)
BIOS.protocol.setExportModuleAircrafts({"Mi-8MT", "L-39ZA"})

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

--NS430 added by Capt Zeen------------------------------------------------------------------------------
definePushButton("NS430_PWR-VOL_PUSH-SQ_POW", 257, 3001, 1, "NS430", "PWR-VOL_PUSH-SQ COM Power")
defineRotary("NS430_PWR-VOL_PUSH-SQ_VOL", 257, 3002, 0, "NS430", "PWR-VOL_PUSH-SQ COM Volume")
definePushButton("NS430_VOL_PUSH-ID_PUSH", 257, 3004, 3, "NS430", "VOL_PUSH-ID VLOC Push")
defineRotary("NS430_VOL_PUSH-ID_VOL", 257, 3005, 2, "NS430", "VOL_PUSH-ID VLOC volume")
defineRotary("NS430_BIG_LEFT_BTN", 257, 3007, 4, "NS430", "NS430_BIG_LEFT_BTN")
definePushButton("NS430_SMALL_LEFT_BTN_PUSH", 257, 3009, 5, "NS430", "SMALL_LEFT_BTN Push")
defineRotary("NS430_SMALL_LEFT_BTN_ROT", 257, 3010, 6, "NS430", "SMALL_LEFT_BTN rotate")
definePushButton("NS430_COM_FLIP_FLOP", 257, 3012, 7, "NS430", "COM flip-flop")
definePushButton("NS430_VLOC_FLIP_FLOP", 257, 3013, 8, "NS430", "VLOC flip-flop")
definePushButton("NS430_CDI", 257, 3014, 9, "NS430", "CDI")
definePushButton("NS430_OBS", 257, 3015, 10, "NS430", "OBS")
definePushButton("NS430_MSG", 257, 3016, 11, "NS430", "MSG")
definePushButton("NS430_FPL", 257, 3017, 12, "NS430", "FPL")
definePushButton("NS430_PROC", 257, 3018, 13, "NS430", "PROC")
definePushButton("NS430_RNG-UP", 257, 3019, 14, "NS430", "RNG-UP")
definePushButton("NS430_RNG-DOWN", 257, 3020, 14, "NS430", "RNG-DOWN")
definePushButton("NS430_DIRECT-TO", 257, 3021, 15, "NS430", "DIRECT-TO")
definePushButton("NS430_MENU", 257, 3022, 16, "NS430", "MENU")
definePushButton("NS430_CLR", 257, 3023, 17, "NS430", "CLR")
definePushButton("NS430_ENT", 257, 3024, 18, "NS430", "ENT")
defineRotary("NS430_BIG_RIGHT_BTN", 257, 3025, 19, "NS430", "BIG_RIGHT_BTN")
definePushButton("NS430_SMALL_RIGHT_BTN_PUSH", 257, 3027, 20, "NS430", "SMALL_RIGHT_BTN Push")
defineRotary("NS430_SMALL_RIGHT_BTN_ROT", 257, 3028, 21, "NS430", "SMALL_RIGHT_BTN rotate")
definePushButton("NS430_PWR-VOL_PUSH-SQ_POW_STOP_ACTION", 257, 3030, 1, "NS430", "PWR-VOL_PUSH-SQ COM Power stop action command")
definePushButton("NS430_VOL_PUSH-ID_PUSH_STOP_ACTION", 257, 3031, 3, "NS430", "VOL_PUSH-ID VLOC Push stop action command")
definePushButton("NS430_SMALL_LEFT_BTN_PUSH_STOP_ACTION", 257, 3032, 5, "NS430", "SMALL_LEFT_BTN Push stop action command")
definePushButton("NS430_COM_FLIP_FLOP_STOP_ACTION", 257, 3033, 7, "NS430", "COM flip-flop stop action command")
definePushButton("NS430_VLOC_FLIP_FLOP_STOP_ACTION", 257, 3034, 8, "NS430", "VLOC flip-flop stop action command")
definePushButton("NS430_CDI_STOP_ACTION", 257, 3035, 9, "NS430", "CDI stop action command")
definePushButton("NS430_OBS_STOP_ACTION", 257, 3036, 10, "NS430", "OBS stop action command")
definePushButton("NS430_MSG_STOP_ACTION", 257, 3037, 11, "NS430", "MSG stop action command")
definePushButton("NS430_FPL_STOP_ACTION", 257, 3038, 12, "NS430", "FPL stop action command")
definePushButton("NS430_PROC_STOP_ACTION", 257, 3039, 13, "NS430", "PROC stop action command")
definePushButton("NS430_RNG-UP_STOP_ACTION", 257, 3040, 14, "NS430", "RNG-UP stop action command")
definePushButton("NS430_RNG-DOWN_STOP_ACTION", 257, 3041, 14, "NS430", "RNG-DOWN stop action command")
definePushButton("NS430_DIRECT-TO_STOP_ACTION", 257, 3042, 15, "NS430", "DIRECT-TO stop action command")
definePushButton("NS430_MENU_STOP_ACTION", 257, 3043, 16, "NS430", "MENU stop action command")
definePushButton("NS430_CLR_STOP_ACTION", 257, 3044, 17, "NS430", "CLR stop action command")
definePushButton("NS430_ENT_STOP_ACTION", 257, 3045, 18, "NS430", "ENT stop action command")
definePushButton("NS430_SMALL_RIGHT_BTN_PUSH_STOP_ACTION", 257, 3046, 20, "NS430", "SMALL_RIGHT_BTN Push stop action command")
-- end of NS430 added by Capt Zeen----------------------------------------------------------------------


BIOS.protocol.endModule()