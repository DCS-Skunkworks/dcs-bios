BIOS.protocol.beginModule("F-22A", 0x6600)
BIOS.protocol.setExportModuleAircrafts({"F-22A"})
--v1.0 by WarLord (aka BlackLibrary)

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local define3PosTumb = BIOS.util.define3PosTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineRockerSwitch = BIOS.util.defineRockerSwitch

--Engine System
defineToggleSwitch("BATT_SW", 3, 3001, 700, "Engine System", "Battery Switch")
define3PosTumb("APU_SW", 3, 3002, 701, "Engine System", "APU Switch")
defineToggleSwitch("GEN_L_SW", 3, 3003, 702, "Engine System", "Left Generator Switch")
defineToggleSwitch("GEN_R_SW", 3, 3004, 703, "Engine System", "Right Generator Switch")
defineToggleSwitch("START_L_SW", 3, 3009, 999, "Engine System", "Left Engine Start")
defineToggleSwitch("START_R_SW", 3, 3010, 999, "Engine System", "Right Engine Start")
defineToggleSwitch("GEAR", 3, 3011, 999, "Engine System", "Landing Gear")
defineToggleSwitch("P_BRAKE", 3, 3012, 710, "Engine System", "Parking Brake")

--Electrical System
defineToggleSwitch("AAR_PORT_OPEN", 2, 3001, 712, "Electrical System", "Open/Close AAR Port")
definePotentiometer("AAR_LIGHTS_SW", 2, 3002, 713, {0, 1}, "Electrical System", "AAR Lights")
defineMultipositionSwitch("NAV_LIGHTS_SW", 2, 3003, 715, 5, 0.1, "Electrical System", "Navigation Lights")
define3PosTumb("TAXI_LIGHTS_SW", 2, 3004, 709, "Electrical System", "Taxi/Landing Lights")

--Weapon System
defineToggleSwitch("MASTER_ARM", 4, 3001, 708, "Weapon System", "Master Arm")
definePushButton("EMERG_JETT", 4, 3002, 711, "Weapon System", "Emergency Jettison")
-- defineToggleSwitch("RWR_UP", 4, 3002, 999, "Weapon System", "RWR Volume Up")
-- defineToggleSwitch("RWR_DWN", 4, 3003, 999, "Weapon System", "RWR Volume Down")

--Avionics System
definePotentiometer("MAP_LIGHT_L_SW", 1, 3001, 716, {0, 1}, "Avionics System", "Left Map Light")
definePotentiometer("MAP_LIGHT_R_SW", 1, 3002, 717, {0, 1}, "Avionics System", "Right Map Light")
definePushButton("EJECT_HANDLE", 1, 3011, 999, "Avionics System", "Eject Handle")
definePotentiometer("MFD_BRIGHT_SW", 1, 3003, 704, {0, 1}, "Avionics System", "MFD Brightness")
definePotentiometer("PFD_BRIGHT_SW", 1, 3004, 705, {0, 1}, "Avionics System", "PFD Brightness")
definePotentiometer("CONSOLE_LIGHTS_SW", 1, 3001, 706, {0, 1}, "Avionics System", "Console Lights")
definePotentiometer("FLOOD_LIGHTS_SW", 1, 3006, 707, {0, 1}, "Avionics System", "Flood Lights")
definePotentiometer("FORMATION_LIGHTS_SW", 1, 3007, 714, {0, 1}, "Avionics System", "Formation Lights")
defineToggleSwitch("DAY_NIGHT_MODE", 1, 3008, 718, "Avionics System", "Day/Night Mode")

--Left UFD
definePushButton("SMFD_1_L", 1, 3010, 881, "Left UFD", "Left SMFD OSB 1")
-- defineToggleSwitch("SMFD_2_L", 1, 3010, 882, "Left UFD", "Left SMFD OSB 2")
-- defineToggleSwitch("SMFD_3_L", 1, 3010, 883, "Left UFD", "Left SMFD OSB 3")
-- defineToggleSwitch("SMFD_4_L", 1, 3010, 884, "Left UFD", "Left SMFD OSB 4")

--Right UFD
definePushButton("SMFD_1_R", 1, 3009, 885, "Right UFD", "SMFD OSB 1")
-- defineToggleSwitch("SMFD_2_R", 1, 3009, 886, "Right UFD", "Right SMFD OSB 2")
-- defineToggleSwitch("SMFD_3_R", 1, 3009, 887, "Right UFD", "Right SMFD OSB 3")
-- defineToggleSwitch("SMFD_4_R", 1, 3009, 888, "Right UFD", "Right SMFD OSB 4")

--Left MFD
definePushButton("MFD_1_L", 5, 3001, 801, "Left MFD", "Left MFD OSB 1")
definePushButton("MFD_2_L", 5, 3002, 802, "Left MFD", "Left MFD OSB 2")
definePushButton("MFD_3_L", 5, 3003, 803, "Left MFD", "Left MFD OSB 3")
definePushButton("MFD_4_L", 5, 3004, 804, "Left MFD", "Left MFD OSB 4")
definePushButton("MFD_5_L", 5, 3005, 805, "Left MFD", "Left MFD OSB 5")
definePushButton("MFD_6_L", 5, 3006, 806, "Left MFD", "Left MFD OSB 6")
definePushButton("MFD_7_L", 5, 3007, 807, "Left MFD", "Left MFD OSB 7")
definePushButton("MFD_8_L", 5, 3008, 808, "Left MFD", "Left MFD OSB 8")
definePushButton("MFD_9_L", 5, 3009, 809, "Left MFD", "Left MFD OSB 9")
definePushButton("MFD_10_L", 5, 3010, 810, "Left MFD", "Left MFD OSB 10")
definePushButton("MFD_11_L", 5, 3011, 811, "Left MFD", "Left MFD OSB 11")
definePushButton("MFD_12_L", 5, 3012, 812, "Left MFD", "Left MFD OSB 12")
definePushButton("MFD_13_L", 5, 3013, 813, "Left MFD", "Left MFD OSB 13")
definePushButton("MFD_14_L", 5, 3014, 814, "Left MFD", "Left MFD OSB 14")
definePushButton("MFD_15_L", 5, 3015, 815, "Left MFD", "Left MFD OSB 15")
definePushButton("MFD_16_L", 5, 3016, 816, "Left MFD", "Left MFD OSB 16")
definePushButton("MFD_17_L", 5, 3017, 817, "Left MFD", "Left MFD OSB 17")
definePushButton("MFD_18_L", 5, 3018, 818, "Left MFD", "Left MFD OSB 18")
definePushButton("MFD_19_L", 5, 3019, 819, "Left MFD", "Left MFD OSB 19")
definePushButton("MFD_20_L", 5, 3020, 820, "Left MFD", "Left MFD OSB 20")

--PMFD
definePushButton("PMFD_1", 6, 3001, 821, "PMFD", "PMFD OSB 1")
definePushButton("PMFD_2", 6, 3002, 822, "PMFD", "PMFD OSB 2")
definePushButton("PMFD_3", 6, 3003, 823, "PMFD", "PMFD OSB 3")
definePushButton("PMFD_4", 6, 3004, 824, "PMFD", "PMFD OSB 4")
definePushButton("PMFD_5", 6, 3005, 825, "PMFD", "PMFD OSB 5")
definePushButton("PMFD_6", 6, 3006, 826, "PMFD", "PMFD OSB 6")
definePushButton("PMFD_7", 6, 3007, 827, "PMFD", "PMFD OSB 7")
definePushButton("PMFD_8", 6, 3008, 828, "PMFD", "PMFD OSB 8")
definePushButton("PMFD_9", 6, 3009, 829, "PMFD", "PMFD OSB 9")
definePushButton("PMFD_10", 6, 3010, 830, "PMFD", "PMFD OSB 10")
definePushButton("PMFD_11", 6, 3011, 831, "PMFD", "PMFD OSB 11")
definePushButton("PMFD_12", 6, 3012, 832, "PMFD", "PMFD OSB 12")
definePushButton("PMFD_13", 6, 3013, 833, "PMFD", "PMFD OSB 13")
definePushButton("PMFD_14", 6, 3014, 834, "PMFD", "PMFD OSB 14")
definePushButton("PMFD_15", 6, 3015, 835, "PMFD", "PMFD OSB 15")
definePushButton("PMFD_16", 6, 3016, 836, "PMFD", "PMFD OSB 16")
definePushButton("PMFD_17", 6, 3017, 837, "PMFD", "PMFD OSB 17")
definePushButton("PMFD_18", 6, 3018, 838, "PMFD", "PMFD OSB 18")
definePushButton("PMFD_19", 6, 3019, 839, "PMFD", "PMFD OSB 19")
definePushButton("PMFD_20", 6, 3020, 840, "PMFD", "PMFD OSB 20")

--Right MF
definePushButton("MFD_1_R", 5, 3021, 841, "Right MFD", "Right MFD OSB 1")
definePushButton("MFD_2_R", 5, 3022, 842, "Right MFD", "Right MFD OSB 2")
definePushButton("MFD_3_R", 5, 3023, 843, "Right MFD", "Right MFD OSB 3")
definePushButton("MFD_4_R", 5, 3024, 844, "Right MFD", "Right MFD OSB 4")
definePushButton("MFD_5_R", 5, 3025, 845, "Right MFD", "Right MFD OSB 5")
definePushButton("MFD_6_R", 5, 3026, 846, "Right MFD", "Right MFD OSB 6")
definePushButton("MFD_7_R", 5, 3027, 847, "Right MFD", "Right MFD OSB 7")
definePushButton("MFD_8_R", 5, 3028, 848, "Right MFD", "Right MFD OSB 8")
definePushButton("MFD_9_R", 5, 3029, 849, "Right MFD", "Right MFD OSB 9")
definePushButton("MFD_10_R", 5, 3030, 850, "Right MFD", "Right MFD OSB 10")
definePushButton("MFD_11_R", 5, 3031, 851, "Right MFD", "Right MFD OSB 11")
definePushButton("MFD_12_R", 5, 3032, 852, "Right MFD", "Right MFD OSB 12")
definePushButton("MFD_13_R", 5, 3033, 853, "Right MFD", "Right MFD OSB 13")
definePushButton("MFD_14_R", 5, 3034, 854, "Right MFD", "Right MFD OSB 14")
definePushButton("MFD_15_R", 5, 3035, 855, "Right MFD", "Right MFD OSB 15")
definePushButton("MFD_16_R", 5, 3036, 856, "Right MFD", "Right MFD OSB 16")
definePushButton("MFD_17_R", 5, 3037, 857, "Right MFD", "Right MFD OSB 17")
definePushButton("MFD_18_R", 5, 3038, 858, "Right MFD", "Right MFD OSB 18")
definePushButton("MFD_19_R", 5, 3039, 859, "Right MFD", "Right MFD OSB 19")
definePushButton("MFD_20_R", 5, 3040, 860, "Right MFD", "Right MFD OSB 20")

--Center MFD
definePushButton("MFD_1_C", 5, 3041, 861, "Center MFD", "Center MFD OSB 1")
definePushButton("MFD_2_C", 5, 3042, 862, "Center MFD", "Center MFD OSB 2")
definePushButton("MFD_3_C", 5, 3043, 863, "Center MFD", "Center MFD OSB 3")
definePushButton("MFD_4_C", 5, 3044, 864, "Center MFD", "Center MFD OSB 4")
definePushButton("MFD_5_C", 5, 3045, 865, "Center MFD", "Center MFD OSB 5")
definePushButton("MFD_6_C", 5, 3046, 866, "Center MFD", "Center MFD OSB 6")
definePushButton("MFD_7_C", 5, 3047, 867, "Center MFD", "Center MFD OSB 7")
definePushButton("MFD_8_C", 5, 3048, 868, "Center MFD", "Center MFD OSB 8")
definePushButton("MFD_9_C", 5, 3049, 869, "Center MFD", "Center MFD OSB 9")
definePushButton("MFD_10_C", 5, 3050, 870, "Center MFD", "Center MFD OSB 10")
definePushButton("MFD_11_C", 5, 3051, 871, "Center MFD", "Center MFD OSB 11")
definePushButton("MFD_12_C", 5, 3052, 872, "Center MFD", "Center MFD OSB 12")
definePushButton("MFD_13_C", 5, 3053, 873, "Center MFD", "Center MFD OSB 13")
definePushButton("MFD_14_C", 5, 3054, 874, "Center MFD", "Center MFD OSB 14")
definePushButton("MFD_15_C", 5, 3055, 875, "Center MFD", "Center MFD OSB 15")
definePushButton("MFD_16_C", 5, 3056, 876, "Center MFD", "Center MFD OSB 16")
definePushButton("MFD_17_C", 5, 3057, 877, "Center MFD", "Center MFD OSB 17")
definePushButton("MFD_18_C", 5, 3058, 878, "Center MFD", "Center MFD OSB 18")
definePushButton("MFD_19_C", 5, 3059, 879, "Center MFD", "Center MFD OSB 19")
definePushButton("MFD_20_C", 5, 3060, 880, "Center MFD", "Center MFD OSB 20")

--ICP Stuff and Shit
definePushButton("ICP_COM1", 7, 3001, 889, "ICP System", "ICP Com 1")
definePushButton("ICP_COM2", 7, 3002, 890, "ICP System", "ICP Com 2")
definePushButton("ICP_NAV", 7, 3003, 891, "ICP System", "ICP NAV")
definePushButton("ICP_STPT", 7, 3004, 892, "ICP System", "ICP STPT")
definePushButton("ICP_ALT", 7, 3005, 894, "ICP System", "ICP ALT")
definePushButton("ICP_HUD", 7, 3006, 895, "ICP System", "ICP HUD")
definePushButton("ICP_OTHR", 7, 3007, 896, "ICP System", "ICP OTHR")
definePushButton("ICP_OPT1", 7, 3008, 898, "ICP System", "ICP Option 1")
definePushButton("ICP_OPT2", 7, 3009, 899, "ICP System", "ICP Option 2")
definePushButton("ICP_OPT3", 7, 3010, 900, "ICP System", "ICP Option 3")
definePushButton("ICP_OPT4", 7, 3011, 901, "ICP System", "ICP Option 4")
definePushButton("ICP_OPT5", 7, 3012, 902, "ICP System", "ICP Option 5")
defineRockerSwitch("ICP_ROCKER", 7, 3013, 3013, 3014, 3014, 903, "ICP System", "ICP Rocker Switch Up/Down")
definePushButton("ICP_AP", 7, 3015, 904, "ICP System", "ICP Autopilot")
-- definePushButton("ICP_MARK", 7, 3016, 905, "ICP System", "ICP MARK")
definePushButton("ICP_1", 7, 3017, 906, "ICP System", "ICP 1")
definePushButton("ICP_2", 7, 3018, 907, "ICP System", "ICP 2")
definePushButton("ICP_3", 7, 3019, 908, "ICP System", "ICP 3")
definePushButton("ICP_4", 7, 3020, 909, "ICP System", "ICP 4")
definePushButton("ICP_5", 7, 3021, 910, "ICP System", "ICP 5")
definePushButton("ICP_6", 7, 3022, 911, "ICP System", "ICP 6")
definePushButton("ICP_7", 7, 3023, 912, "ICP System", "ICP 7")
definePushButton("ICP_8", 7, 3024, 913, "ICP System", "ICP 8")
definePushButton("ICP_9", 7, 3025, 914, "ICP System", "ICP 9")
definePushButton("ICP_CLR", 7, 3026, 915, "ICP System", "ICP CLR")
definePushButton("ICP_0", 7, 3027, 916, "ICP System", "ICP 0")
definePushButton("ICP_UNDO", 7, 3028, 917, "ICP System", "ICP UNDO")
definePotentiometer("ICP_WHEEL_UP", 7, 3029, 918, {0, 1}, "ICP System", "ICP Wheel Up")
definePotentiometer("ICP_WHEEL_DWN", 7, 3030, 918, {0, 1}, "ICP System", "ICP Wheel Down")
-- definePushButton("ICP_KNEE_NEXT", 7, 3031, 999, "ICP System", "Kneeboard Next Page")
-- definePushButton("ICP_KNEE_PREV", 7, 3032, 999, "ICP System", "Kneeboard Prev Page")

--Gauges
defineFloat("CANOPY_POS", 181, {0, 1}, "Gauges", "Canopy Position")

-- WARNING, CAUTION AND INDICATORLIGHTS
defineIndicatorLight("FLOOD_LIGHTS", 750, "Warning, Caution and IndicatorLights", "Flood Lights (green)")
defineIndicatorLight("FLOOD_LIGHTS", 750, "Warning, Caution and IndicatorLights", "Flood Lights (green)")
defineIndicatorLight("PANEL_LIGHTS", 751, "Warning, Caution and IndicatorLights", "Panel Lights (green)")
defineIndicatorLight("BATTERY_L", 700, "Warning, Caution and IndicatorLights", "Battery Lamp (green)")
defineIndicatorLight("GEAR_NOSE_L", 723, "Warning, Caution and IndicatorLights", "Gear Nose Lamp (green)")
defineIndicatorLight("GEAR_LEFT_L", 724, "Warning, Caution and IndicatorLights", "Gear Left Lamp (green)")
defineIndicatorLight("GEAR_RIGHT_L", 725, "Warning, Caution and IndicatorLights", "Gear Right Lamp (green)")

defineIndicatorLight("CLIPBOARD_L", 752, "Warning, Caution and IndicatorLights", "Clipboard Left")
defineIndicatorLight("CLIPBOARD_R", 753, "Warning, Caution and IndicatorLights", "Clipboard Right")
defineIndicatorLight("GARFIELD", 760, "Warning, Caution and IndicatorLights", "Garfield")
defineIndicatorLight("PHOTO", 755, "Warning, Caution and IndicatorLights", "Photo")

--Externals
defineIntegerFromGetter("EXT_REFUEL_DOOR", function()
	return math.floor(LoGetAircraftDrawArgumentValue(22)*65535)
end, 65535, "External Aircraft Model", "Fuel Door")

defineIntegerFromGetter("EXT_GUN_DOOR", function()
	return math.floor(LoGetAircraftDrawArgumentValue(614)*65535)
end, 1, "External Aircraft Model", "Gun Door")

defineIntegerFromGetter("EXT_POSITION_LIGHT_WINGL", function()
	if LoGetAircraftDrawArgumentValue(613) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Light Wing Left (red)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_WINGR", function()
	if LoGetAircraftDrawArgumentValue(612) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Light Wing Right (green)")

defineIntegerFromGetter("EXT_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(609) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Light (white)")

defineIntegerFromGetter("EXT_COCKPIT_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(605) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Cockpit Light (white)")

defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(606)*65535)
end, 65535, "External Aircraft Model", "Formation Lights (yellow green)")

defineIntegerFromGetter("EXT_ANTI_COL", function()
	if LoGetAircraftDrawArgumentValue(607) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Anticollision Lights (white)")

defineIntegerFromGetter("EXT_BEACON_L", function()
	if LoGetAircraftDrawArgumentValue(608) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Beacon Lights (red)")

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