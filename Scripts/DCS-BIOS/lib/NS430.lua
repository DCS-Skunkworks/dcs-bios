BIOS.protocol.beginModule("NS430", 0x8000)
BIOS.protocol.setExportModuleAircrafts({"A-10C", "AJS37", "AV8BNA", "Bf-109K-4", "C-101CC", "C-101EB", "Christen Eagle II", "F-14B", "F-16C_50", "F-5E-3", "F-86F Sabre", "FA-18C_hornet", "FW-190A8", "FW-190D9", 
"Hawk", "I-16", "Ka-50", "L-39C", "L-39ZA", "M-2000C", "Mi-8MT", "MiG-15bis", "MiG-19P", "MiG-21Bis", "NS430", "P-51D", "P-51D-30-NA", "SA342L", "SA342M", "SA342Minigun", "SA342Mistral", "SpitfireLFMkIX", 
"SpitfireLFMkIXCW", "TF-51D", "UH-1H", "Yak-52", "A-10A", "F-15C", "F-16A", "J-11A", "MiG-29A", "MiG-29G", "MiG-29S", "Su-25", "Su-25T", "Su-27", "Su-33", "A-4E-C", "AC_130", "Bell47_2", "Cessna_210N", "DC3", 
"F-2A", "F-2B", "F4e", "FA_18D", "MB-339PAN", "Mig-23UB", "MirageF1", "MirageF1CT", "REISEN52", "RST_Eurofighter", "RST_Eurofighter_AG", "Su-30M", "Su-30MK", "Su-30SM", "Su-57", "Super_Etendard", "T-4", 
"VSN_AJS37Viggen", "VSN_C17A", "VSN_C5_Galaxy", "VSN_E2D", "VSN_Eurofighter", "VSN_Eurofighter_", "VSN_F104G", "VSN_F104G_AG", "VSN_F14A", "VSN_F14B", "VSN_F15E", "VSN_F15E_AA", "VSN_F16A", "VSN_F16AMLU", 
"VSN_F16CBL50", "VSN_F16CBL52D", "VSN_F16CMBL50", "VSN_F22", "VSN_F35B", "VSN_F35B_AG", "VSN_F4E", "VSN_F4E_AG", "VSN_F5E", "VSN_F5N", "VSN_FA18C", "VSN_FA18C_AG", "VSN_FA18C_Lot20", "VSN_FA18F", "VSN_FA18F_AG", 
"VSN_Harrier", "VSN_M2000", "VSN_P3C", "VSN_TornadoGR4", "VSN_TornadoIDS", "VSN_Su47", "VSN_UFO"})


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