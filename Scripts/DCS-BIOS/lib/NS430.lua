BIOS.protocol.beginModule("NS430", 0x8000)
BIOS.protocol.setExportModuleAircrafts({"Mi-8MT", "L-39ZA", "L-39C", "UH-1H", "P-51D", "TF-51D", "MiG-21Bis", "F-86F Sabre"}, BIOS.FLAMING_CLIFFS_AIRCRAFT)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineRotary = BIOS.util.defineRotary
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local defineMomentaryRockerSwitch = BIOS.util.defineMomentaryRockerSwitch
local defineDoubleCommandButton = BIOS.util.defineDoubleCommandButton

-- 1.0 by Capt Zeen
-- 2.0 by Celemourn

---------------------------
defineDoubleCommandButton("NS430_PWR_VOL_PUSH_SQ_POW", 257, 3001, 3030, 1, "NS430", "PWR-VOL PUSH-SQ COM Power")
defineDoubleCommandButton("NS430_VOL_PUSH_ID_PUSH", 257, 3004, 3031, 3, "NS430", "VOL_PUSH-ID VLOC Push")
defineDoubleCommandButton("NS430_SMALL_LEFT_BTN_PUSH", 257, 3009,3032, 5, "NS430", "SMALL_LEFT_BTN Push")
defineDoubleCommandButton("NS430_COM_FLIP_FLOP", 257, 3012, 3033, 7, "NS430", "COM flip-flop")
defineDoubleCommandButton("NS430_VLOC_FLIP_FLOP", 257, 3013, 3034, 8, "NS430", "VLOC flip-flop")
defineDoubleCommandButton("NS430_CDI", 257, 3014, 3035, 9, "NS430", "CDI")
defineDoubleCommandButton("NS430_OBS", 257, 3015, 3036, 10, "NS430", "OBS")
defineDoubleCommandButton("NS430_MSG", 257, 3016, 3037, 11, "NS430", "MSG")
defineDoubleCommandButton("NS430_FPL", 257, 3017, 3038, 12, "NS430", "FPL")
defineDoubleCommandButton("NS430_PROC", 257, 3018, 3039, 13, "NS430", "PROC")
defineDoubleCommandButton("NS430_DIRECT_TO", 257, 3021, 3042, 15, "NS430", "DIRECT-TO")
defineDoubleCommandButton("NS430_MENU", 257, 3022, 3043, 16, "NS430", "MENU")
defineDoubleCommandButton("NS430_CLR", 257, 3023, 3044, 17, "NS430", "CLR")
defineDoubleCommandButton("NS430_ENT", 257, 3024, 3045, 18, "NS430", "ENT")
defineDoubleCommandButton("NS430_SMALL_RIGHT_BTN_PUSH", 257, 3027, 3046, 20, "NS430", "SMALL_RIGHT_BTN Push")

defineRotary("NS430_PWR_VOL_PUSH_SQ_VOL", 257, 3002, 0, "NS430", "PWR-VOL_PUSH-SQ COM Volume")
defineRotary("NS430_VOL_PUSH_ID_VOL", 257, 3005, 2, "NS430", "VOL_PUSH-ID VLOC volume")
defineRotary("NS430_BIG_LEFT_BTN", 257, 3007, 4, "NS430", "BIG_LEFT_BTN")
defineRotary("NS430_SMALL_LEFT_BTN_ROT", 257, 3010, 6, "NS430", "SMALL_LEFT_BTN rotate")
defineRotary("NS430_BIG_RIGHT_BTN", 257, 3025, 19, "NS430", "BIG_RIGHT_BTN")
defineRotary("NS430_SMALL_RIGHT_BTN_ROT", 257, 3028, 21, "NS430", "SMALL_RIGHT_BTN rotate")

defineMomentaryRockerSwitch("NS430_RNG_RKR",257,3020,3041,3019,3040,14,"NS430","RNG Rocker")

defineIndicatorLight("GLOW", 70, "NS430", "Glow")

BIOS.protocol.endModule()