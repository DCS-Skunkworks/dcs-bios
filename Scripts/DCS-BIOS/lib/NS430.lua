BIOS.protocol.beginModule("NS430", 0x0600)
BIOS.protocol.setExportModuleAircrafts({"A-10C", "A-10C_2",	"AJS37", "AV8BNA", "Bf-109K-4", "C-101CC", "C-101EB", "Christen Eagle II", "F-14A-135-GR", "F-14B", "F-16C_50", "F-5E-3", "F-86F Sabre", "FA-18C_hornet", "FW-190A8", "FW-190D9", "I-16", "JF-17", "Ka-50", "L-39C", "L-39ZA", "M-2000C", "Mi-8MT",	"Mi-24P", "MiG-15bis", "MiG-19P",	"MiG-21Bis", "P-47D-30", "P-47D-30bl1", "P-47D-40",	"P-51D", "P-51D-30-NA", "SA342L", "SA342M", "SA342Minigun", "SA342Mistral", "SpitfireLFMkIX", "SpitfireLFMkIXCW", "TF-51D", "UH-1H", "Yak-52"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineRotary = BIOS.util.defineRotary
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local defineMomentaryRockerSwitch = BIOS.util.defineMomentaryRockerSwitch
local definePotentiometer = BIOS.util.definePotentiometer
local defineDoubleCommandButton = BIOS.util.defineDoubleCommandButton

-- 1.0 by Capt Zeen
-- 2.0 by Celemourn

---------------------------
defineDoubleCommandButton("NS430_PWR_VOL_PUSH_SQ_POW", 1, 3001, 3030, 1, "NS430", "PWR-VOL PUSH-SQ COM Power")
defineDoubleCommandButton("NS430_VOL_PUSH_ID_PUSH", 1, 3004, 3031, 3, "NS430", "VOL_PUSH-ID VLOC Push")
defineDoubleCommandButton("NS430_SMALL_LEFT_BTN_PUSH", 1, 3009,3032, 5, "NS430", "SMALL_LEFT_BTN Push")
defineDoubleCommandButton("NS430_COM_FLIP_FLOP", 1, 3012, 3033, 7, "NS430", "COM flip-flop")
defineDoubleCommandButton("NS430_VLOC_FLIP_FLOP", 1, 3013, 3034, 8, "NS430", "VLOC flip-flop")
defineDoubleCommandButton("NS430_CDI", 1, 3014, 3035, 9, "NS430", "CDI")
defineDoubleCommandButton("NS430_OBS", 1, 3015, 3036, 10, "NS430", "OBS")
defineDoubleCommandButton("NS430_OBS1", 1, 3015, 3036, 10, "NS430", "OBS1")
defineDoubleCommandButton("NS430_MSG", 1, 3016, 3037, 11, "NS430", "MSG")
defineDoubleCommandButton("NS430_FPL", 1, 3017, 3038, 12, "NS430", "FPL")
defineDoubleCommandButton("NS430_PROC", 1, 3018, 3039, 13, "NS430", "PROC")
defineDoubleCommandButton("NS430_DIRECT_TO", 1, 3021, 3042, 15, "NS430", "DIRECT-TO")
defineDoubleCommandButton("NS430_MENU", 1, 3022, 3043, 16, "NS430", "MENU")
defineDoubleCommandButton("NS430_CLR", 1, 3023, 3044, 17, "NS430", "CLR")
defineDoubleCommandButton("NS430_ENT", 1, 3024, 3045, 18, "NS430", "ENT")
defineDoubleCommandButton("NS430_SMALL_RIGHT_BTN_PUSH", 1, 3027, 3046, 20, "NS430", "SMALL_RIGHT_BTN Push")

definePotentiometer("NS430_PWR_VOL_PUSH_SQ_VOL", 1, 3002, 0, {0, 1}, "NS430", "PWR-VOL_PUSH-SQ COM Volume")
definePotentiometer("NS430_VOL_PUSH_ID_VOL", 1, 3005, 2, {0, 1}, "NS430", "VOL_PUSH-ID VLOC Volume")
defineRotary("NS430_BIG_LEFT_BTN", 1, 3007, 4, "NS430", "BIG_LEFT_BTN")
defineRotary("NS430_SMALL_LEFT_BTN_ROT", 1, 3010, 6, "NS430", "SMALL_LEFT_BTN rotate")
defineRotary("NS430_BIG_RIGHT_BTN", 1, 3025, 19, "NS430", "BIG_RIGHT_BTN")
defineRotary("NS430_SMALL_RIGHT_BTN_ROT", 1, 3028, 21, "NS430", "SMALL_RIGHT_BTN rotate")

defineMomentaryRockerSwitch("NS430_RNG_RKR", 1, 3020, 3041, 3019, 3040, 14, "NS430", "RNG Rocker")

defineIndicatorLight("GLOW", 70, "NS430", "Glow")

BIOS.protocol.endModule()