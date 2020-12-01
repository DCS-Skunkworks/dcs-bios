BIOS.protocol.beginModule("F-86F Sabre", 0x3000)
BIOS.protocol.setExportModuleAircrafts({"F-86F Sabre"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineString = BIOS.util.defineString
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

defineTumb("BAT_START",1, 3001, 653, 1, {-1,1}, nil, false, "Electrics", "Battery-Starter Switch, BATTERY/OFF/STARTER")
defineTumb("INSTR_PWR",1, 3002, 643, 1, {0,1}, nil, false, "Electrics", "Instrument Power Switch, ALTERNATE/NORMAL")
defineTumb("STOP_START",1, 3003, 664, 1, {0,1}, nil, false, "Electrics", "Stop-Starter Button (Push to de-energize starter in case of malfunction)")
defineTumb("ENG_MASTER",1, 3004, 652, 1, {0,1}, nil, false, "Electrics", "Engine Master Switch, ON/OFF")
defineTumb("GEN_SWITCH",1, 3005, 670, 1, {-1,1}, nil, false, "Electrics", "Generator Switch, ON/OFF/RESET")
defineTumb("GEN_SWITCH_CVR",1, 3006, 671, 1, {0,1}, nil, false, "Electrics", "Generator Switch Cover")
defineTumb("GEN_WARN_LGHT_TEST",1, 3007, 687, 1, {0,1}, nil, false, "Electrics", "Generator Warning Light (Push To Test)")
defineTumb("MAIN_INV_FAIL_TEST",1, 3008, 680, 1, {0,1}, nil, false, "Electrics", "Main Instrument (Three-phase) Inverter Failure Warning Light (Push to test)")
defineTumb("BOTH_INV_FAIL_TEST",1, 3009, 681, 1, {0,1}, nil, false, "Electrics", "Both Instrument (Main and alternate three-phase) Inverter Failure Warning Light (Push to test)")
defineTumb("RDR_INV_FAIL_TEST",1, 3010, 682, 1, {0,1}, nil, false, "Electrics", "Main Radar (Single-phase) Inverter Failure Warning Light (Push to test)")
defineTumb("BMB_RKT_SALVO",1, 3011, 760, 1, {0,1}, nil, false, "Electrics", "Bomb Rocket Tank Salvo")
defineTumb("BMB_SEL",1, 3012, 761, 1, {0,1}, nil, false, "Electrics", "Bomb Sel.")
defineTumb("GYR_SYN",1, 3013, 762, 1, {0,1}, nil, false, "Electrics", "Gyr'Syn Compass")
defineTumb("3F_INVERTER",1, 3015, 763, 1, {0,1}, nil, false, "Electrics", "3f Inverter")
defineTumb("TURN_BNK_IND",1, 3016, 764, 1, {0,1}, nil, false, "Electrics", "Turn Bank Ind.")
defineTumb("RUDDER_IND",1, 3017, 765, 1, {0,1}, nil, false, "Electrics", "Rudder Trim & Take-Off Ind.")
defineTumb("ALT_AIL_TRIM",1, 3018, 766, 1, {0,1}, nil, false, "Electrics", "Alt Ail. Trim")
defineTumb("AIL_ALT_HRZ_TRIM",1, 3019, 767, 1, {0,1}, nil, false, "Electrics", "Ail & Horiz. Trim & Alt Horiz. Trim")
defineTumb("LDG_LGHTS_CONT",1, 3020, 768, 1, {0,1}, nil, false, "Electrics", "LDG Light Control")
defineTumb("LDG_LGHTS",1, 3021, 769, 1, {0,1}, nil, false, "Electrics", "LDG Lights")
defineTumb("FIRE_WARN",1, 3023, 770, 1, {0,1}, nil, false, "Electrics", "Fire Warn.")
defineTumb("BUS_TIE_CTRL",1, 3024, 771, 1, {0,1}, nil, false, "Electrics", "Bus Tie-In Control")
defineTumb("SPD_BRAKE_CB",1, 3025, 772, 1, {0,1}, nil, false, "Electrics", "Speed Brake Circuit Breaker")
defineTumb("AIR_OIL_TMP_SEL",1, 3026, 773, 1, {0,1}, nil, false, "Electrics", "Free Air & Oil Temp & Air Sel.")
defineTumb("LDG_GEAR_WARN",1, 3027, 774, 1, {0,1}, nil, false, "Electrics", "LDG Gear Warn.")
defineTumb("LDG_GEAR_WARN_CTRL",1, 3028, 775, 1, {0,1}, nil, false, "Electrics", "LDG Gear Control")
defineTumb("LDG_GEAR_POS_IND",1, 3029, 776, 1, {0,1}, nil, false, "Electrics", "LDG Gear Pos Ind.")
defineTumb("FUEL_BOOST_AFT",1, 3030, 777, 1, {0,1}, nil, false, "Electrics", "Fuel Booster AFT")
defineTumb("ALT_EMG_HYD_IND",1, 3031, 778, 1, {0,1}, nil, false, "Electrics", "Alt Emerg. Hyd. Cont. & Hyd. Press Ind.")
defineTumb("SGHT_PWR",1, 3032, 779, 1, {0,1}, nil, false, "Electrics", "Sight Power")
defineTumb("SGHT_HEATER",1, 3033, 780, 1, {0,1}, nil, false, "Electrics", "Sight Heater")
defineTumb("SGHT_AC_PWR",1, 3034, 781, 1, {0,1}, nil, false, "Electrics", "Sight A.C. Power Unit")
defineTumb("ARN_6_RDO_COMP",1, 3035, 782, 1, {0,1}, nil, false, "Electrics", "AN/ARN-6 Radio Compass")
defineTumb("ENG_MASTER_FUEL",1, 3036, 783, 1, {0,1}, nil, false, "Electrics", "Eng. Master Fuel Shut-Off")
defineTumb("ENG_IGN",1, 3037, 784, 1, {0,1}, nil, false, "Electrics", "Eng. Ign.")
defineTumb("FUEL_LVL",1, 3038, 785, 1, {0,1}, nil, false, "Electrics", "Fuel Level")
defineTumb("INV_GEN_OV_TEST",1, 3039, 786, 1, {0,1}, nil, false, "Electrics", "Inv Gen. Failure Overvolt LTS Test")
defineTumb("LGHT_PST_CODE",1, 3040, 787, 1, {0,1}, nil, false, "Electrics", "Light Post IndCode")
defineTumb("CONS_PED_LTS",1, 3041, 788, 1, {0,1}, nil, false, "Electrics", "Console & Ped LTS")
defineTumb("FUEL_BOOST_FWD",1, 3042, 789, 1, {0,1}, nil, false, "Electrics", "Fuel Boost FWD")
defineTumb("WNG_FLAP_LH",1, 3043, 790, 1, {0,1}, nil, false, "Electrics", "Wing Flap LH.")
defineTumb("WNG_FLAP_RH",1, 3044, 791, 1, {0,1}, nil, false, "Electrics", "Wing Flap RH.")
defineTumb("LGHT_FLUOR",1, 3045, 792, 1, {0,1}, nil, false, "Electrics", "Light Fluor")
defineTumb("SGHT_CTRL",1, 3046, 793, 1, {0,1}, nil, false, "Electrics", "Sight Control")
defineTumb("APC_3_RADIO",1, 3047, 794, 1, {0,1}, nil, false, "Electrics", "AN/APC 3 Radio")
defineTumb("APX_6_IFF",1, 3048, 795, 1, {0,1}, nil, false, "Electrics", "AN/APX-6 Radio IFF")
defineTumb("LDG_GEAR_EMG_UP",2, 3002, 710, 1, {0,1}, nil, false, "Hydraulics", "Landing Gear Emergency-up Button (Ground-use only! Hold in until gear retracts completely)")
defineTumb("HYD_PRESS_SEL",2, 3004, 631, 1, {-1,1}, nil, false, "Hydraulics", "Hydraulic Pressure Gage and Selector Switch, UTILITY/NORMAL/ALTERNATE")
defineTumb("ALT_ON_TEST",2, 3007, 684, 1, {0,1}, nil, false, "Hydraulics", "Alternate-on Warning Light (Push to test)")
defineTumb("ALT_ON_EMG_HANDLE",2, 3008, 706, 1, {0,1}, nil, false, "Hydraulics", "Alternate Hydraulic Emergency Override Handle, IN/OUT")
defineTumb("FL_CTRL_SWITCH",2, 3003, 647, 1, {-1,1}, nil, false, "Hydraulics", "Flight Control Switch, ALTERNATE ON/NORMAL/RESET")
defineTumb("LDG_GEAR_HORN",2, 3009, 815, 1, {0,1}, nil, false, "Hydraulics", "Landing Gear Warning Horn Cutout Button (Push to silence horn)")
defineTumb("SPD_BRAKE_SW",2, 3005, 211, 1, {-1,1}, nil, false, "Hydraulics", "Speed Brake Switch, OUT/HOLD/IN")
defineTumb("PRK_BRAKE",2, 3014, 217, 1, {0,1}, nil, false, "Hydraulics", "Parking Brake Handle, ON/OFF")

defineTumb("FUEL_DENS_SEL",3, 3001, 672, 1, {0,1}, nil, false, "Fuel", "Fuel Densitometer Selection Switch, IN/OUT")

defineTumb("FUEL_DENS_SEL_CVR",3, 3002, 673, 1, {0,1}, nil, false, "Fuel", "Fuel Densitometer Selection Switch Cover")
defineTumb("DRP_TNK_JETT",3, 3004, 701, 1, {0,1}, nil, false, "Fuel", "Drop Tank Jettison Button - Push to release drop tank(s)")
defineTumb("OUT_DRP_TNK_IND_TEST",3, 3005, 695, 1, {0,1}, nil, false, "Fuel", "Outboard Drop Tank Empty Indicator Light (Push to test)")
defineTumb("OXY_DIL_LVR",14, 3001, 703, 1, {0,1}, nil, false, "Oxygen", "Oxygen Regulator Diluter Lever, NORMAL OXYGEN/100% OXYGEN")
defineTumb("OXY_WRN_LGHT",14, 3006, 230, 1, {0,1}, nil, false, "Oxygen", "Oxygen Regulator Warning Light Switch, ON/OFF")
defineTumb("ENG_FIRE_TEST",15, 3001, 635, 1, {0,1}, nil, false, "Fire Alarms", "Engine Fire Warning Light Test Switch")
defineTumb("FWD_ENG_FIRE_TEST",15, 3002, 685, 1, {0,1}, nil, false, "Fire Alarms", "Forward Engine Compartment Fire-warning Light (Push to test)")
defineTumb("AFT_ENG_FIRE_TEST",15, 3003, 686, 1, {0,1}, nil, false, "Fire Alarms", "Aft Engine Compartment Fire-warning Light (Push to test)")
defineTumb("CPIT_PRESS_CTRL",16, 3001, 650, 1, {0,1}, nil, false, "Cockpit Air", "Cockpit Pressure Control Switch, PRESS/RAM")
defineTumb("CPIT_PRESS_SEL",16, 3002, 651, 1, {0,1}, nil, false, "Cockpit Air", "Cockpit Pressure Schedule Selector Switch, 5 PSI/2.75 PSI")
defineTumb("CPIT_AIR_TEMP_CVR",16, 3006, 736, 1, {0,1}, nil, false, "Cockpit Air", "Cockpit Air Temperature Control Switch Cover")
defineTumb("ENG_SCREEN_ICE",16, 3007, 645, 1, {-1,1}, nil, false, "Cockpit Air", "Engine Anti-Ice & Screen Switch, EXTEND/RET./ANTI-ICE")
defineTumb("WNDSHLD_ICE_HEAT_WARN",16, 3009, 691, 1, {0,1}, nil, false, "Cockpit Air", "Windshield Anti-Ice Overheat Warning Light (Push to test)")
defineTumb("CMPS_LGHT",17, 3004, 654, 1, {0,1}, nil, false, "Lights", "Compass Light Switch, ON/OFF")
defineTumb("LND_TAXI_LGHT",18, 3001, 661, 1, {-1,1}, nil, false, "Navigation Lights", "Landing & Taxi Lights Switch, EXTEND&ON/OFF/RETRACT")
defineTumb("POS_LGHT_SEL",18, 3002, 656, 1, {-1,1}, nil, false, "Navigation Lights", "Position and Fuselage Light Selector Switch, STEADY/OFF/FLASH")
defineTumb("EXT_LGHT_DIM",18, 3003, 655, 1, {0,1}, nil, false, "Navigation Lights", "Exterior Lighting Dimmer Switch, BRIGHT/DIM")
defineTumb("EMG_FUEL",4, 3003, 630, 1, {0,1}, nil, false, "Engines", "Emergency Fuel Switch, ON/OFF")
defineTumb("EMG_IGN_CVR",4, 3002, 732, 1, {0,1}, nil, false, "Engines", "Emergency (In-air) Ignition Switch Cover")
defineTumb("LONG_ALT_TRM_CVR",13, 3011, 738, 1, {0,1}, nil, false, "Steering", "Longitudinal Alternate Trim Switch Cover")
defineTumb("TO_TRIM_LGHT_TEST",13, 3012, 683, 1, {0,1}, nil, false, "Steering", "Take-off (Trim) Position Indicator Light (Push to test)")
defineTumb("N_WHEEL_STEER",2, 3016, 209, 1, {0,1}, nil, false, "Hydraulics", "Nose Wheel Steering Button")
defineTumb("MIC_BUT",26, 3004, 213, 1, {0,1}, nil, false, "Radio", "Microphone Button")
defineTumb("ARN_6_LGHT",27, 3007, 657, 1, {-1,1}, nil, false, "Radio", "AN/ARN-6 Scale Light Switch, HI/OFF/LO")
defineTumb("ARN_6_CW",27, 3006, 658, 1, {0,1}, nil, false, "Radio", "AN/ARN-6 CW-VOICE Switch, CW/VOICE")
defineTumb("APX_6_IFF_2",29, 3002, 659, 1, {-1,1}, nil, false, "Radio", "AN/APX-6 IFF Mode 2 Switch, MODE 2/OUT/I/P")
defineTumb("APX_6_IFF_3",29, 3003, 660, 1, {0,1}, nil, false, "Radio", "AN/APX-6 IFF Mode 3 Switch, MODE 3/OUT")
defineTumb("APX_6_DESTR_CVR",29, 3005, 808, 1, {0,1}, nil, false, "Radio", "AN/APX-6 IFF Destruct Switch Cover")
defineTumb("APX_6_IFF_DIAL_STOP",29, 3010, 203, 1, {0,1}, nil, false, "Radio", "AN/APX-6 IFF Dial Stop Button")
defineTumb("SLAVE_FAST",20, 3003, 598, 1, {0,1}, nil, false, "Gyro Compass", "Directional Indicator Fast Slaving Button - Push for fast slaving")
defineTumb("J8_ATT_CAGE",24, 3001, 714, 1, {0,1}, nil, false, "Attitude Indicator", "J-8 Attitude Indicator Cage Knob - Pull to cage")
defineTumb("ACC_RST",12, 3001, 1004, 1, {0,1}, nil, false, "Cockpit", "Accelerometer Reset Button - Push to reset")
defineTumb("A4_SIGHT_CAGE",22, 3025, 212, 1, {0,1}, nil, false, "Cockpit", "A-4 Sight Electrical Caging Button")
defineTumb("A4_SIGHT_FIL_SEL",22, 3015, 642	, 1, {0,1}, nil, false, "Cockpit", "A-4 Sight Filament Selector Switch, SECONDARY/PRIMARY")
defineTumb("DEM_BMB_REL_SEL",5, 3006, 639, 1, {0,1}, nil, false, "Cockpit", "Demolition Bomb Release Selector Switch, AUTO RELEASE/MANUAL RELEASE")
defineTumb("DEM_BMB_SEQ_SEL",5, 3008,752,0.1,{0, 0.5}, nil, false,"Cockpit", "Demolition Bomb Sequence Selector Switch, ALL/OFF/LEFT/RIGHT")
defineTumb("RKT_JETT",5, 3012, 637, 1, {0,1}, nil, false, "Cockpit", "Rocket Jettison Switch, READY/OFF")
defineTumb("RKT_REL",5, 3009,  751, 1, {-1,1}, nil, false, "Cockpit", "Rocket Release Selector Switch, SINGLE/OFF/AUTO")
defineTumb("MAN_PIP_CTRL",5, 3004, 663, 1, {0,1}, nil, false, "Cockpit", "Manual Pip Control Switch, BOMB/NORMAL")
defineTumb("BMB_RKT_TANK_JETT",5, 3017, 702, 1, {0,1}, nil, false, "Cockpit", "Bomb-Rocket-Tank Jettison Button")
defineTumb("MISS_CTRL",5, 3018,820, 1, {-1,1}, nil, false, "Cockpit", "Missile Control Switch, LH & RH/RH/SALVO")
defineTumb("BMB_RKT_REL",5, 3047, 207, 1, {0,1}, nil, false, "Cockpit", "Bomb-Rocket Release Button - Push to release")
defineTumb("A4_RDR_TRG_SEL",22, 3027, 208, 1, {0,1}, nil, false, "Cockpit", "A-4 Sight Radar Target Selector Button")
definePotentiometer("OXY_REG_SUP",14,3002, 704, {0, 1},"Oxygen", "Oxygen Regulator Supply Lever")
definePotentiometer("CPIT_AIR_TEMP",16,3004, 740, {0, 1},"Cockpit Air", "Cockpit Air Temperature Control Rheostat")
definePotentiometer("IN_PNL_LGHT",17,3002, 813, {0, 1},"Lights", "Instrument Panel Primary Light Rheostat")
definePotentiometer("IN_PNL_AUX_LGHT",17,3003, 811, {0, 1},"Lights", "Instrument Panel Auxiliary Light Rheostat")
definePotentiometer("CONS_LGTH",17,3001, 812, {0, 1},"Lights", "Console and Panel Light Rheostat")
definePotentiometer("ARC_27_VOL",26,3002, 806, {0.1, 0.9},"Radio", "AN/ARC-27 UHF Audio Volume Knob")
definePotentiometer("ARN_6_VOL",27,3004, 802, {0.1, 0.9},"Radio", "AN/ARN-6 Audio Volume Control")
definePotentiometer("J8_ATT_PTC_TRIM",24,3002, 200, {0.0, 1.0},"Attitude Indicator", "J-8 Attitude Indicator Pitch Trim Knob")
defineRotary("ARN_6_TUNE",27, 3003, 801, "Radio", "AN/ARN-6 Tuning Crank")
defineRotary("ARN_6_E_W_VAR",27, 3008, 826, "Radio", "AN/ARN-6 East/West Variation Knob")
defineRotary("ALT_MET_REF_PRESS",7, 3001, 218, "Cockpit", "Altimeter reference pressure adjusting knob")
defineRotary("COMP_DIRECTION",20, 3001, 199, "Gyro Compass", "Compass Correction")

defineTumb("CANOPY",25, 3001, 718, 1, {-1,1}, nil, false, "Cockpit", "Canopy Switch, OPEN/OFF/CLOSE")
defineTumb("EMG_JETT_HANDLE",25, 3008, 818, 1, {0,1}, nil, false, "Cockpit", "Emergency Jettison Handle, RELEASE ALL/RELEASE OUTBD ONLY")
defineTumb("EMG_JETT_HANDLE_CVR",25, 3016, 220, 1, {0,1}, nil, false, "Cockpit", "Emergency Jettison Handle Cover, OPEN/CLOSE")

defineTumb("EMG_ALT_JETT_HANDLE",25, 3009, 817, 1, {0,1}, nil, false, "Cockpit", "Canopy Alternate Emergency Jettison Handle, IN/OUT")
defineTumb("CANOPY_DECLUTCH",25, 3010, 816, 1, {0,1}, nil, false, "Cockpit", "Canopy Declutch Handle, IN/OUT")
defineTumb("LANDING_GEAR_HANDLE",2, 3001, 599, 1, {0,1}, nil, false, "Cockpit", "Landing Gear Up/Down")
defineTumb("LG_EMG_HANDLE",2, 3010, 819, 1, {0,1}, nil, false, "Cockpit", "Landing Gear Emergency Release Handle")
defineTumb("DRP_TANK_SEL",3, 3003, 662, 1, {0,1}, nil, false, "Cockpit", "Drop Tank Selector Switch")
defineTumb("OXY_EMG_LEVER",14, 3010, 229, 1, {0,1}, nil, false, "Cockpit", "Oxygen Regulator Emergency Lever")
defineTumb("PIT_HEAT",16, 3003, 646, 1, {0,1}, nil, false, "Cockpit", "Pitot Heater Switch, ON/OFF")
defineTumb("CPIT_HEAT_MODE",16, 3005, 737, 0.1, {0,0.5}, nil, false, "Cockpit", "Cockpit Air Temperature Control Switch, AUTO/OFF/HOT/COLD")
defineTumb("AIR_OUTLET_SEL",16, 3008, 741, 1, {-1,1}, nil, false, "Cockpit", "Air Outlet Selector Lever, FLOOR/BOTH/DEFROST")
defineTumb("WND_SHIELD_ANTI_ICE",16, 3019, 202, 1, {0,1}, nil, false, "Cockpit", "Windshield Anti-Icing Lever, ON/OFF")
defineTumb("ENG_EMG_IGN_SWITCH",4, 3001, 733, 1, {-1,1}, nil, false, "Cockpit", "Emergency (In-air) Ignition Switch, ON/OFF")
defineTumb("RUDDER_TRIM_SWITCH",13, 3010, 648, 1, {-1,1}, nil, false, "Cockpit", "Rudder Trim Switch, LEFT/OFF/RIGHT")
defineTumb("LONG_ALT_TRIM_SWITCH",13, 3009, 739, 0.2, {0.1,0.5}, nil, false, "Cockpit", "Longitudinal Alternate Trim Switch - NORMAL GRIP CONT/OFF, NOSE UP/OFF, NOSE DOWN/OFF")
defineTumb("WING_FLAPS_HANDLE",13, 3001, 735,1, {-1,1}, nil, false, "Cockpit", "Wing Flaps Handle")
defineTumb("TRIM_LEFT_OFF",13, 3004, 205, 1, {-1,0}, nil, false, "Cockpit", "Left Trim Switch, LEFT/OFF")
defineTumb("TRIM_RIGHT_OFF",13, 3005, 205, 1, {0,1}, nil, false, "Cockpit", "Right Trim Switch, LEFT/OFF")
defineTumb("TRIM_UP_OFF",13, 3007, 204, 1, {-1,0}, nil, false, "Cockpit", "Up Trim Switch, LEFT/OFF")
defineTumb("TRIM_DOWN_OFF",13, 3006, 204, 1, {0,1}, nil, false, "Cockpit", "Down Trim Switch, LEFT/OFF")
defineTumb("ARC27_CHAN_SEL",26, 3001, 807,0.01, {0,0.18}, nil, false, "Radio", "AN/ARC-27 UHF Preset Channel Selector")
defineTumb("ARC27_PWR_SEL",26, 3003, 805,0.1, {0,0.3}, nil, false, "Radio", "AN/ARC-27 UHF Power Switch, OFF/T/R/T/R + G REC/ADF")
defineTumb("ARN6_CHAN_SEL",27, 3002, 803, 0.1, {0,0.3}, nil, false, "Radio", "AN/ARN-6 Frequency Band Switch")
defineTumb("ARN6_FUNC_SEL",27, 3001, 667, 0.1, {0,0.4}, nil, false, "Radio", "AN/ARN-6 Function Selector Switch, OFF/COMP/ANT./LOOP/CONT.")
defineTumb("ARN6_LOOP_SEL",27, 3005, 666, 1, {-1,1}, nil, false, "Radio", "AN/ARN-6 LOOP L-R Switch")
defineTumb("APX6_MASTER",29, 3001, 810, 0.1, {0,0.4}, nil, false, "Radio", "AN/APX-6 IFF Master Switch, EMERGENCY/NORM/LOW/STDBY/OFF")
defineTumb("APX6_DESTRUCT",29, 3004, 809, 1, {-1,1}, nil, false, "Radio", "AN/APX-6 IFF Destruct Switch, OFF/ON")
definePushButton("CLOCK_SET_ENABLE", 10, 3002, 227, "Cockpit", "Press to set clock")
defineRotary("CLOCK_SET", 10, 3003, 228, "Cockpit", "Set Clock Knob")
definePushButton("CLOCK_TIMER", 10, 3004, 831, "Cockpit", "Elapsed Time Mechanism Button")
definePushButton("MIRROR", 0, 3001, 3, "Cockpit", "Toggle Mirror")
defineTumb("A4_SGHT_WING_ADJ",22, 3001, 716, 0.0215, {0,1}, nil, false, "Sight", "A-4 Sight Wing Span Adjustment Knob")
defineTumb("A4_SGHT_RDR_SWP",21, 3001, 715, 0.0215, {0,1}, nil, false, "Sight", "A-4 Sight Radar Range Sweep Rheostat")
defineTumb("A4_SGHT_RET_DIM",22, 3003, 734, 0.0215, {0,0.74}, nil, false, "Sight", "A-4 Sight Reticle Dimmer Control")
defineTumb("A4_SGHT_CAGE",22, 3017, 755, 1, {0,1}, nil, false, "Sight", "Sight_mechanical_caging_lever")
defineTumb("A4_SGHT_ROT_GRIP",22, 3026, 210, 0.05, {-1,1}, nil, false, "Sight", "A-4 Sight Rotating Grip manual ranging, CCW spring-loaded position")
defineTumb("A4_SGHT_FUNC",22, 3011, 721, 0.1, {0,0.2}, nil, false, "Sight", "Variable Sight Selector Unit - Sight Function Selector Lever, ROCKET/GUN/BOMB")
defineTumb("A4_SGHT_TRG_SPD",22, 3012, 720, 0.5, {0,1}, nil, false, "Sight", "Variable Sight Selector Unit - Target Speed Switch, TR/HI/LO")
defineTumb("A4_SGHT_RKT_DEP",22, 3013, 722, 0.0215, {0,1}, nil, false, "Sight", "Variable Sight Selector Unit - Rocket Depression Angle Selector")
definePotentiometer("A4_SGHT_BMB_WND", 22, 3014, 727,  {-1.0, 1.0}, "Sight", "Bomb-Target Wind Control Knob")
defineTumb("WPN_DEM_BMB_ARM",5, 3007, 641, 1, {-1,1}, nil, false, "Weapon System", "Demolition Bomb Arming Switch (Fuze Selection), ARM NOSE&TAIL/OFF/TAIL ONLY")
defineTumb("WPN_RKT_FUSE",5, 3011, 638, 1, {-1,1}, nil, false, "Weapon System", "Rocket Fuze (Arming) Switch, DELAY/OFF/INSTANT")
defineTumb("WPN_RKT_RLS_CVR",5, 3010, 750, 1, {0,1}, nil, false, "Weapon System", "Rocket Release Selector Switch Cover")
defineTumb("WPN_GUN_SEL",5, 3001, 668, 0.1, {-0.2,0.2}, nil, false, "Weapon System", "Gun Selector Switch")
defineTumb("WPN_GUN_MISS",5, 3002, 665, 0.1, {0,0.3}, nil, false, "Weapon System", "Gun-Missile Selector Switch, OFF/SIGHT CAMERA & RADAR/GUNS/MISSILE")
defineTumb("WPN_GUN_HEAT",5, 3003, 636, 1, {-1,1}, nil, false, "Weapon System", "Gun Heater Switch, HEATER/OFF/(N/F)")
defineTumb("WPN_PIP_PRESETS",5, 3016, 796, 0.3, {0,0.9}, nil, false, "Weapon System", "Manual Pip Control Change Calibrated Dials (Presets)")
definePotentiometer("WPN_PIP_KNOB", 5, 3005, 797,  {-1.0, 1.0}, "Weapon System", "Manual Pip Control Knob")
definePotentiometer("WPN_BMB_TRGT_ALT_TRG_KNOB", 5, 3021, 729,  {0, 1.0}, "Weapon System", "A-4 Sight Bombing Altimeter Target Altitude Knob")
definePotentiometer("WPN_BMB_TRGT_ALT_IND_HNDL", 5, 3022, 731,  {0, 1.0}, "Weapon System", "A-4 Sight Bombing Altimeter Index Altitude Handle")
defineTumb("WPN_LAB_CAGE",5, 3013, 632, 2, {-1,1}, nil, false, "Weapon System", "LABS Gyro Caging Switch, UNCAGE/CAGE")
defineTumb("WPN_LAB_START",5, 3014, 633, 2, {-1,1}, nil, false, "Weapon System", "LABS Start Switch, ON/OFF")
defineTumb("WPN_LAB_CHG_A4",5, 3015, 634, 2, {-1,1}, nil, false, "Weapon System", "LABS Change-over Switch, LABS/A-4")
definePotentiometer("WPN_TONE_VOL", 5, 3019, 821,  {0, 1.0}, "Weapon System", "Tone Volume")
defineTumb("WPN_SAFE_LAUNCH",5, 3020, 822, 1, {0,1}, nil, false, "Weapon System", "Safe Launch Button")
defineTumb("WPN_SAFE_G_LIMIT_TEST",5, 3053, 225, 1, {0,1}, nil, false, "Weapon System", "G-Limit Light - Push to test")
definePotentiometer("WPN_SAFE_G_LIMIT_TEST_LGHT", 5, 3054, 226,  {0, 1.0}, "Weapon System", "Rotate to adjust brightness(MW)")
defineRotary("WPN_RKT_INVL", 5, 3023, 1001, "Weapon System", "Rocket Intervalometer")
defineTumb("WPN_TRG_DETENT",5, 3048, 206, 0.5, {0,1}, nil, false, "Weapon System", "Gun Trigger, SECOND DETENT/FIRST DETENT")
defineIndicatorLight("LMP_ELEC_GENOFF",617, "Lamps", "ELEC_GenOff")
defineIndicatorLight("LMP_ELEC_MAININVOFFSELECTALT",610, "Lamps", "ELEC_MainInstInverterOffSelectAlt")
defineIndicatorLight("LMP_ELEC_BOTHINSTINVOFF",611, "Lamps", "ELEC_BothInstInvertersOff")
defineIndicatorLight("LMP_ELEC_MAINRADARINVOFF",612, "Lamps", "ELEC_MainRadarInverterOff")
defineIndicatorLight("LMP_HYDRO_ALTFLTCONTSYSOPER",614, "Lamps", "HYDRO_AltFltContSysOper")
defineIndicatorLight("LMP_HYDRO_LEFTGEAR",39, "Lamps", "HYDRO_LeftGear")
defineIndicatorLight("LMP_HYDRO_RIGHTGEAR",41, "Lamps", "HYDRO_RightGear")
defineIndicatorLight("LMP_HYDRO_NOSEGEAR",40, "Lamps", "HYDRO_NoseGear")
defineIndicatorLight("LMP_FUEL_OUTBDTANKSEMPTY",625, "Lamps", "FUEL_OutbdTanksEmpty")
defineIndicatorLight("LMP_FIRE_DETECTION_FWDFIREWARNING",615, "Lamps", "FIRE_DETECTION_FwdFireWarning")
defineIndicatorLight("LMP_FIRE_DETECTION_AFTFIREWARNING",616, "Lamps", "FIRE_DETECTION_AftFireWarning")
defineIndicatorLight("LMP_CONTROL_TAKEOFFPOSIND",613, "Lamps", "CONTROL_TakeOffPosInd")
defineIndicatorLight("LMP_WNW_SHLDANTIICE_HEAT",621, "Lamps", "WindshieldAntiIceOverheatWarning")

defineFloat("MIRRORS_DRAW", 3, {0, 1}, "Indicator", "mirrors_draw")
defineFloat("STICKPITCH", 74, {1, -1}, "Indicator", "StickPitch")
defineFloat("STICKROLL", 71, {-1, 1}, "Indicator", "StickRoll")
defineFloat("RUDDER", 500, {-1, 1}, "Indicator", "Rudder")
defineFloat("THROTTLE", 104, {-1.0, 1.0}, "Indicator", "Throttle")
defineFloat("LEFT_WHEEL_BRAKE", 215, {0, 1}, "Indicator", "Left_Wheel_Brake")
defineFloat("RIGHT_WHEEL_BRAKE", 216, {0, 1}, "Indicator", "Right_Wheel_Brake")
defineFloat("NORMALTRIMSWITCH_PITCH", 204, {-1, 1}, "Indicator", "NormalTrimSwitch_pitch")
defineFloat("PILOT_DRAW", 540, {0.0, 1.0}, "Indicator", "pilot_draw")
defineFloat("CLOCK_CURRTIME_HOURS", 19, {0.0, 1.0}, "Indicator", "CLOCK_currtime_hours")
defineFloat("CLOCK_CURRTIME_MINUTES", 18, {0.0, 1.0}, "Indicator", "CLOCK_currtime_minutes")
defineFloat("CLOCK_SECONDS_METER_TIME_MINUTES", 37, {0.0, 1.0}, "Indicator", "CLOCK_seconds_meter_time_minutes")
defineFloat("CLOCK_SECONDS_METER_TIME_SECONDS", 1006, {0.0, 1.0}, "Indicator", "CLOCK_seconds_meter_time_seconds")
defineFloat("COCKPITCANOPY", 181, {0.0, 1.0}, "Indicator", "CockpitCanopy")
defineFloat("AIRSPEEDINDICATOR", 178, {0.0, 0.965}, "Indicator", "AirSpeedIndicator")
defineFloat("AIRSPEEDINDICATORDRUM", 178, {0.0, 0.965}, "Indicator", "AirSpeedIndicatorDrum")
defineFloat("AIRSPEEDM1INDICATOR", 8, {0.0, 0.697}, "Indicator", "AirSpeedM1Indicator")
defineFloat("BAROALTIMETER10000", 8, {0.0, 0.697}, "Indicator", "BaroAltimeter10000")
defineFloat("BAROALTIMETER1000", 8, {0.0, 0.697}, "Indicator", "BaroAltimeter1000")
defineFloat("BAROALTIMETER100", 8, {0.0, 0.697}, "Indicator", "BaroAltimeter100")
defineFloat("BAROALTIMETERHG", 8, {0.0, 0.697}, "Indicator", "BaroAltimeterHG")
defineFloat("VARIOMETER", 24, {-1.0, 1.0}, "Indicator", "Variometer")
defineFloat("MACHNUMBER", 179, {0.0515, 0.965}, "Indicator", "MachNumber")
defineFloat("TURNINDICATOR", 25, {-1.0, 1.0}, "Indicator", "TurnIndicator")
defineFloat("SLIPINDICATOR", 31, {-1.0, 1.0}, "Indicator", "SlipIndicator")
defineFloat("ACCELEROMETER", 6, {0.0, 1.0}, "Indicator", "Accelerometer")
defineFloat("ACCELEROMETERMIN", 1003, {0.0, 1.0}, "Indicator", "AccelerometerMin")
defineFloat("ACCELEROMETERMAX", 1002, {0.0, 1.0}, "Indicator", "AccelerometerMax")
defineFloat("GYROCOMPASSNEEDLE", 711, {1.0, 0.0}, "Indicator", "GyroCompassNeedle")
defineFloat("GYROCOMPASSSCALE", 712, {0.0, 1.0}, "Indicator", "GyroCompassScale")
defineFloat("ATTITUDEINDICATOROFFFLAG", 713, {1.0, 0.0}, "Indicator", "AttitudeIndicatorOffFlag")
defineFloat("ATTITUDEINDICATORPITCH", 605, {-0.27, 0.27}, "Indicator", "AttitudeIndicatorPitch")
defineFloat("ATTITUDEINDICATORBANK", 606, {1.0, -1.0}, "Indicator", "AttitudeIndicatorBank")
defineFloat("ATTITUDEINDICATORPITCHSPHERE", 81, {-1.0, 1.0}, "Indicator", "AttitudeIndicatorPitchSphere")
defineFloat("ATTITUDEINDICATORBANKNEEDLE", 1005, {1.0, -1.0}, "Indicator", "AttitudeIndicatorBankNeedle")
defineFloat("ATTITUDEINDICATORPITCHSHIFT", 214, {-1.0, 1.0}, "Indicator", "AttitudeIndicatorPitchShift")
defineFloat("ENGINETACHOMETER", 16, {0.0, 1.0}, "Indicator", "Engine Tachometer")
defineFloat("ENGINEEXHAUSTTEMPERATURE", 12, {0.0, 1.0}, "Indicator", "EngineExhaustTemperature")
defineFloat("ENGINEOILPRESSURE", 112, {0.023, 1.0}, "Indicator", "EngineOilPressure")
defineFloat("ENGINEFUELFLOW", 531, {0.0, 1.0}, "Indicator", "EngineFuelFlow")
defineFloat("DC_VOLTAGE", 601, {0.0, 0.3}, "Indicator", "DC_voltage")
defineFloat("DC_CURRENT", 602, {0.0, 1.0}, "Indicator", "DC_current")
defineFloat("HYDRAULIC_PRESSURE", 109, {0.0, 1.0}, "Indicator", "Hydraulic_Pressure")
defineFloat("FUEL_QUANTITY", 22, {-1.0, 1.0}, "Indicator", "Fuel_Quantity")
defineFloat("OXYGEN_PRESSURE", 353, {0, 1}, "Indicator", "Oxygen_Pressure")
defineFloat("OXYGENFLOWBLINKER", 705, {0.0, 1.0}, "Indicator", "OxygenFlowBlinker")
defineFloat("COCKPITALTIMETER", 114, {0.0, 1.0}, "Indicator", "CockpitAltimeter")
defineFloat("ARN6_BAND", 804, {0.0, 1.0}, "Indicator", "ARN6 Band")
defineFloat("ARN6_TUNINGMETER", 800, {0.0, 1.0}, "Indicator", "ARN6_TuningMeter")
defineFloat("ARN6_TUNING", 800, {0.0, 1.0}, "Indicator", "ARN6_Tuning")
defineFloat("ARN6_BEARING", 800, {0.0, 1.0}, "Indicator", "ARN6_Bearing")
defineFloat("ARN6_SCALE", 814, {1.0, 0.0}, "Indicator", "ARN6_Scale")
defineFloat("ARN6_FREQSCALE", 830, {0.0, 1.0}, "Indicator", "ARN6_FreqScale")
defineFloat("ARN6_SCALELIGHT", 219, {0.0, 1.0}, "Indicator", "ARN6_ScaleLight")
defineFloat("ILLUMINATIONLIGHTS", 182, {0.0, 1.0}, "Indicator", "Illumination Lights")
defineFloat("STANDBYCOMPASSLIGHT", 825, {0.0, 1.0}, "Indicator", "Standby Compass Light")
defineFloat("PRIMARYINSTLIGHTS", 180, {0.0, 1.0}, "Indicator", "Primary Instrument Lights")
defineFloat("LANDING_GEAR_UNSAFE", 222, {0.0, 1.0}, "Indicator", "Landing Gear Unsafe")
defineFloat("AUXILIARYINSTRUMENTLIGHTS", 185, {0.0, 1.0}, "Indicator", "AuxiliaryInstrumentLights")
defineFloat("LABS_ROLL_NEEDLE", 603, {-1.0, 1.0}, "Indicator", "LABS_roll_needle")
defineFloat("LABS_PITCH_NEEDLE", 604, {-1.0, 1.0}, "Indicator", "LABS_pitch_needle")
defineFloat("EMERGENCYJETTISONHANDLEPOS", 818, {0.0, 1.0}, "Indicator", "EmergencyJettisonHandlePos")
defineFloat("EMERGENCYJETTISONHANDLEROT", 221, {0.0, 1.0}, "Indicator", "EmergencyJettisonHandleRot")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Position Light")

defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light")
defineIntegerFromGetter("EXT_STROBE_TOP", function()
	if LoGetAircraftDrawArgumentValue(195) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Strobe Light")
defineIntegerFromGetter("EXT_STROBE_BOTTOM", function()
	if LoGetAircraftDrawArgumentValue(194) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Bottom Strobe Light")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

--[[--Gauge Values--]]--

local function getBand()
     local returnValue = (((GetDevice(0):get_argument_value(804))*3)+1)
     return returnValue
end
defineIntegerFromGetter("ARN6_BAND_DISP", getBand, 65000, 
"Gauge Values", "ARN-6 Band")

local function getARN6Freq()
   local returnValue = (GetDevice(0):get_argument_value(830))
   if (GetDevice(0):get_argument_value(830)) >= 0 and (GetDevice(0):get_argument_value(830)) < 0.25 then
     returnValue = (((GetDevice(0):get_argument_value(830))*400)+100)
   elseif (GetDevice(0):get_argument_value(830)) >= 0.25 and (GetDevice(0):get_argument_value(830)) < 0.5 then
     returnValue = (((GetDevice(0):get_argument_value(830))*840)-10)
   elseif (GetDevice(0):get_argument_value(830)) >= 0.5 and (GetDevice(0):get_argument_value(830)) < 0.75  then
     returnValue = (((GetDevice(0):get_argument_value(830))*1760)-470)
   elseif (GetDevice(0):get_argument_value(830)) >= 0.75  then
     returnValue = (((GetDevice(0):get_argument_value(830))*3600)-1850)
   end
   return returnValue
end
defineIntegerFromGetter("ARN6_FREQUENCY", getARN6Freq, 65000, 
"Gauge Values", "ARN-6 Frequency")

local function getBearing()
     local returnValue = (GetDevice(0):get_argument_value(600))*360
     return returnValue
end
defineIntegerFromGetter("ARN6_BEARING_VALUE", getBearing, 65000, 
"Gauge Values", "ARN-6 Bearing Value")

local function getScale()
     local returnValue = (GetDevice(0):get_argument_value(814))*360
     return returnValue
end
defineIntegerFromGetter("ARN6_SCALE_VALUE", getScale, 65000, 
"Gauge Values", "ARN-6 Scale Value")

local function getMach()
     local returnValue = (((-0.1871*(GetDevice(0):get_argument_value(179))^4)+(1.0314*(GetDevice(0):get_argument_value(179))^3)-(1.3069*(GetDevice(0):get_argument_value(179))^2)+(1.5846*(GetDevice(0):get_argument_value(179)))+0.4231)*100)
     return returnValue
end
defineIntegerFromGetter("MACH_NUMBER_VALUE_X.XX", getMach, 65000, 
"Gauge Values", "Mach Number Value Read As X.XX")

local function getAirspeed()
     local returnValue = (((GetDevice(0):get_argument_value(178))*625)+40)
     return returnValue
end
defineIntegerFromGetter("AIRSPEED_VALUE", getAirspeed, 65000, 
"Gauge Values", "Airspeed Value")

local function getAlt()
     local returnValue = (GetDevice(0):get_argument_value(707))*100000
     return returnValue
end
defineIntegerFromGetter("ALTITUDE_VALUE", getAlt, 65000, 
"Gauge Values", "Altitude Value")

local function getExhTemp()
     local returnValue = (GetDevice(0):get_argument_value(12))*1000
     return returnValue
end
defineIntegerFromGetter("EXHAUST_TEMP_VALUE", getExhTemp, 65000, 
"Gauge Values", "Exhaust Temperature Value")

local function getOilPres()
     local returnValue = (GetDevice(0):get_argument_value(112))*100
     return returnValue
end
defineIntegerFromGetter("OIL_PRESSURE_VALUE", getOilPres, 65000, 
"Gauge Values", "Oil Pressure Value")

local function getFuelFlow()
     local returnValue = (GetDevice(0):get_argument_value(531))*10000
     return returnValue
end
defineIntegerFromGetter("FUEL_FLOW_VALUE", getFuelFlow, 65000, 
"Gauge Values", "Fuel Flow Value")

local function getVolt()
     local returnValue = (GetDevice(0):get_argument_value(601))*100
     return returnValue
end
defineIntegerFromGetter("DC_VOLTAGE_VALUE", getVolt, 65000, 
"Gauge Values", "DC Voltage Value")

local function getLoad()
     local returnValue = (GetDevice(0):get_argument_value(602))*100
     return returnValue
end
defineIntegerFromGetter("LOADMETER_VALUE", getLoad, 65000, 
"Gauge Values", "Loadmeter Value")

local function getTach()
     local returnValue = ((5.894*(GetDevice(0):get_argument_value(16))^3)+(3.021*(GetDevice(0):get_argument_value(16))^2)+(101.29*(GetDevice(0):get_argument_value(16)))+0.0758)
     return returnValue
end
defineIntegerFromGetter("TACHOMETER_VALUE", getTach, 65000, 
"Gauge Values", "Tachometer Value")

local function getHydPres()
     local returnValue = (GetDevice(0):get_argument_value(109))*4000
     return returnValue
end
defineIntegerFromGetter("HYDRAULIC_PRES_VALUE", getHydPres, 65000, 
"Gauge Values", "Hydraulic Pressure Value")

local function getFuelQuant()
     local returnValue = (GetDevice(0):get_argument_value(22))*3200
     return returnValue
end
defineIntegerFromGetter("FUEL_QUANTITY_VALUE", getFuelQuant, 65000, 
"Gauge Values", "Fuel Quantity Value")

local function getOxyPres()
     local returnValue = (GetDevice(0):get_argument_value(353))*500
     return returnValue
end
defineIntegerFromGetter("OXYGEN_PRESSURE_VALUE", getOxyPres, 65000, 
"Gauge Values", "Oxygen Pressure Value")

local function getCockpitAlt()
     local returnValue = (GetDevice(0):get_argument_value(114))*50000
     return returnValue
end
defineIntegerFromGetter("COCKPIT_ALT_VALUE", getCockpitAlt, 65000, 
"Gauge Values", "Cockpit Altitude Value")

local function getHDG()
     local heading = 0
     if ((360-((GetDevice(0):get_argument_value(711))/0.002778)) + (360-((GetDevice(0):get_argument_value(712))/0.002778))) < 360 then
     heading = (360-((GetDevice(0):get_argument_value(711))/0.002778)) + (360-((GetDevice(0):get_argument_value(712))/0.002778))
     else
     heading = ((360-((GetDevice(0):get_argument_value(711))/0.002778)) + (360-((GetDevice(0):get_argument_value(712))/0.00278))) - 360
     end
     return heading
end
defineIntegerFromGetter("HEADING_VALUE", getHDG, 65000,"Gauge Values", 
"Heading Value")

local function getVVI()
     local returnValue = (-1319.8*(GetDevice(0):get_argument_value(24))^5)+(0.00000005*(GetDevice(0):get_argument_value(24))^4)+(4334.8*(GetDevice(0):get_argument_value(24))^3)+(0.0000002*(GetDevice(0):get_argument_value(24))^2)+(2988.1*(GetDevice(0):get_argument_value(24)))+0.0000001
     return returnValue
end
defineIntegerFromGetter("VVI_VALUE", getVVI, 65000, 
"Gauge Values", "Verticl Velocity VVI")

BIOS.protocol.endModule()