BIOS.protocol.beginModule("SA342M", 0x5800)
BIOS.protocol.setExportModuleAircrafts({"SA342M", "SA342Minigun", "SA342Mistral", "SA342L"})

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
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--Electric System
definePushButton("WIPER_ONCE", 2, 3018, 53, "Electric System", "Wiper Once")
defineToggleSwitch("BATTERY", 2, 3001, 264, "Electric System", "Battery")
defineToggleSwitch("ALTERNATOR", 2, 3002, 265, "Electric System", "Alternator")
defineToggleSwitch("GENERATOR", 2, 3003, 268, "Electric System", "Generator")
definePushButton("VOLTMETER_TEST", 2, 3004, 62, "Electric System", "Voltmeter Test")
defineToggleSwitch("PITOT", 2, 3005, 170, "Electric System", "Pitot")
defineToggleSwitch("FUEL_PUMP", 2, 3006, 271, "Electric System", "Fuel Pump")
defineToggleSwitch("ADDITIONAL_FUEL_TANK", 2, 3007, 267, "Electric System", "Additional Fuel Tank")
defineTumb("STARTER", 2, 3008, 56, 1, {-1, 1}, nil, false, "Electric System", "Starter Start/Stop/Air")
definePushButton("WARNING_PANEL_TEST", 2, 3009, 57, "Electric System", "Warning Panel Test")
defineTumb("COPILOT_WIPER", 2, 3010, 48, 1, {-1, 1}, nil, false, "Electric System", "Copilot Wiper")
defineTumb("PILOT_WIPER", 2, 3011, 49, 1, {-1, 1}, nil, false, "Electric System", "Pilot Wiper")
defineToggleSwitch("UNASSIGNED_SWITCH", 2, 3012, 61, "Electric System", "Unassigned Switch")
definePushButton("HYD_TEST", 2, 3013, 59, "Electric System", "HYD Test")
definePushButton("REARM_ALTER", 2, 3014, 66, "Electric System", "Alter Rearm")
definePushButton("REARM_GENE", 2, 3015, 67, "Electric System", "Gene Rearm")
defineToggleSwitch("CONVOY_TANK", 2, 3016, 63, "Electric System", "Convoy Tank On/Off")
defineToggleSwitch("SAND_FILTER", 2, 3017, 64, "Electric System", "Sand Filter On/Off")

--Intercom Pilot
defineRotary("VHF_AM_RADIO_VOLUME_1", 4, 3001, 68, "Intercom", "VHF AM Radio Volume 1")
defineRotary("FM_RADIO_VOLUME_1", 4, 3002, 70, "Intercom", "FM Radio Volume 1")
defineRotary("UHF_RADIO_VOLUME_1", 4, 3003, 69, "Intercom", "UHF Radio Volume 1")

--Intercom Copilot
defineRotary("VHF_AM_RADIO_VOLUME_2", 4, 3031, 79, "Intercom", "VHF AM Radio Volume 2")
defineRotary("FM_RADIO_VOLUME_2", 4, 3032, 81, "Intercom", "FM Radio Volume 2")
defineRotary("UHF_RADIO_VOLUME_2", 4, 3033, 80, "Intercom", "UHF Radio Volume 2")

--AM Radio
defineTumb("AM_RADIO_SELECTOR", 5, 3001, 128, 0.33, {0, 1}, nil, false, "AM Radio", "AM Radio Selector")
defineRotary("AM_RADIO_FREQUENCY_DIAL_RIGHT", 5, 3002, 129, "AM Radio", "AM Radio Frequency Dial Right")
defineToggleSwitch("AM_FREQUENCY_SELECTOR", 5, 3003, 130, "AM Radio", "AM Radio 25/50kHz Selector")
defineRotary("AM_RADIO_FREQUENCY_DIAL_LEFT", 5, 3004, 131, "AM Radio", "AM Radio Frequency Dial Left")

--Autopilot
definePushButton("AUTOPILOT_BUTTON", 7, 3028, 209, "Autopilot", "Autopilot Button")
definePushButton("AUTOPILOT_SLAVE", 7, 3012, 293, "Autopilot", "Autopilot Slave")
definePushButton("AUTO_HOVER", 7, 3008, 294, "Autopilot", "Auto-Hover")
defineToggleSwitch("GYRO_TEST_COVER", 7, 3014, 197, "Autopilot", "Gyro Test Cover Open/Close")
defineToggleSwitch("GYRO_TEST_SWITCH", 7, 3015, 198, "Autopilot", "Gyro Test Switch On/Off")
defineTumb("GYRO_SWITCH", 7, 3016, 199, 1, {-1, 1}, nil, false, "Autopilot", "Gyro Left/Center/Right")
defineTumb("GYRO_KNOB", 7, 3017, 153, 0.25, {0, 1}, nil, false, "Autopilot", "Gyro Knob")
defineToggleSwitch("AUTOPILOT_ON_OFF", 7, 3001, 31, "Autopilot", "Autopilot On/Off")
defineToggleSwitch("AUTOPILOT_PITCH", 7, 3002, 32, "Autopilot", "Autopilot Pitch")
defineToggleSwitch("AUTOPILOT_ROLL", 7, 3003, 33, "Autopilot", "Autopilot Roll")
defineToggleSwitch("AUTOPILOT_YAW", 7, 3004, 34, "Autopilot", "Autopilot Yaw")
defineTumb("AUTOPILOT_MODE", 7, 3005, 35, 1, {-1, 1}, nil, false, "Autopilot", "Autopilot Mode Speed/Off/Altitude")
defineToggleSwitch("AUTOPILOT_TRIM", 7, 3006, 60, "Autopilot", "Autopilot Trim")
defineToggleSwitch("MAGNETIC_BRAKE", 7, 3007, 65, "Autopilot", "Magnetic Brake")

--Controls & Flight Controls
definePushButton("MAGNETIC_BRAKE_BUTTON", 8, 3001, 50, "Controls", "Magnetic Brake Button")
definePushButton("HA_UNLOCK", 9, 3002, 116, "Flight Controls", "HA Unlock")
defineRotary("HA_ADJUST", 9, 3001, 115, "Flight Controls", "HA Adjust")
definePushButton("STANDBY_HA_UNLOCK", 9, 3004, 216, "Flight Controls", "Standby HA Unlock")
defineRotary("STANDBY_HA_ADJUST", 9, 3003, 215, "Flight Controls", "Standby HA Adjust")
defineTumb("HA_SOURCE", 9, 3007, 218, 0.33, {0, 1}, nil, false, "Flight Controls", "HA Source")

--Fuel
defineToggleSwitch("FUEL_FLOW_LEVER", 10, 3001, 557, "Fuel", "Fuel Flow Lever")

--Rotors
defineToggleSwitch("ROTOR_BRAKE", 11, 3001, 556, "Rotors", "Rotor Brake")

--TV
defineToggleSwitch("TV_ON_OFF", 13, 3001, 124, "TV", "TV On/Off")
definePotentiometer("TV_CONTRAST", 13, 3002, 125, {0, 1}, "TV", "TV Contrast")
definePotentiometer("TV_BRIGHTNESS", 13, 3003, 123, {0, 1}, "TV", "TV Brightness")
defineToggleSwitch("TV_COVER", 13, 3004, 126, "TV", "TV Cover")

--Lights
definePotentiometer("DASHBOARD_LIGHTING", 14, 3001, 22, {0, 1}, "Lights", "Main Dashboard Lighting")
definePotentiometer("CONSOLE_LIGHTING", 14, 3002, 21, {0, 1}, "Lights", "Console Lighting")
definePotentiometer("UV_LIGHTING", 14, 3003, 145, {0, 1}, "Lights", "UV Lighting")
defineToggleSwitch("LIGHTS_NORM_BNL", 14, 3004, 23, "Lights", "Lights Norm/BNL")
definePotentiometer("ROOF_LAMP", 14, 3005, 147, {0, 1}, "Lights", "Roof Lamp Knob")
defineToggleSwitch("RED_LENS_ON_OFF", 14, 3006, 154, "Lights", "Red Lens On/Off")

--Navlights
defineTumb("NAV_LIGHTS", 15, 3001, 146, 1, {-1, 1}, nil, false, "Navlights", "Navigation Lights CLI/OFF/FIX")
defineTumb("ANTICOLL_LIGHTS", 15, 3002, 228, 1, {-1, 1}, nil, false, "Navlights", "Anticollision Light NOR/OFF/ATT")
defineTumb("LANDING_LIGHTS", 15, 3003, 105, 1, {-1, 1}, nil, false, "Navlights", "Landing Light Off/Vario/On")
defineTumb("LANDING_LIGHT_EXTEND", 15, 3004, 106, 1, {-1, 0}, nil, false, "Navlights", "Landing Light Extend")
defineTumb("LANDING_LIGHT_RETRACT", 15, 3006, 106, 1, {0, 1}, nil, false, "Navlights", "Landing Light Retract")
defineToggleSwitch("PANEL_LIGHTING", 15, 3008, 382, "Navlights", "Panel Lighting On/Off")
definePotentiometer("ANTICOLL_INTENSITY", 15, 3010, 30, {0, 1}, "Navlights", "Anticollision Light Intensity")
defineToggleSwitch("FORMATION_LIGHTS", 15, 3011, 229, "Navlights", "Formation Lights On/Off")
definePotentiometer("FORMATION_INTENSITY", 15, 3012, 230, {0, 1}, "Navlights", "Formation Lights Intensity")

--PE
defineToggleSwitch("LASING_BUTTON_COVER", 16, 3021, 255, "PE", "Lasing Button Cover")
definePushButton("LASING_BUTTON", 16, 3022, 256, "PE", "Lasing Button")
defineToggleSwitch("MISSILE_LAUNCH_COVER", 16, 3023, 257, "PE", "Missile Launch Cover")
definePushButton("MISSILE_LAUNCH", 16, 3024, 258, "PE", "Missile Launch")
definePushButton("INVERSED_SYMBOLOGY", 16, 3025, 259, "PE", "Inversed Symbology")
definePushButton("INVERSED_IMAGE", 16, 3026, 260, "PE", "Inversed Image")
defineTumb("IMAGE_FOCUS_DOWN", 16, 3027, 261, 1, {-1, 0}, nil, false, "PE", "Image Focus Down")
defineTumb("IMAGE_FOCUS_UP", 16, 3028, 261, 1, {0, 1}, nil, false, "PE", "Image Focus Up")
defineTumb("IMAGE_GAIN_LEFT", 16, 3029, 262, 1, {-1, 0}, nil, false, "PE", "Image Gain Left")
defineTumb("IMAGE_GAIN_RIGHT", 16, 3030, 262, 1, {0, 1}, nil, false, "PE", "Image Gain Right")
defineTumb("IMAGE_BRIGHTNESS_DOWN", 16, 3032, 263, 1, {-1, 0}, nil, false, "PE", "Image Brightness Down")
defineTumb("IMAGE_BRIGHTNESS_UP", 16, 3031, 263, 1, {0, 1}, nil, false, "PE", "Image Brightness Up")
defineTumb("SYMBOLOGY_BRIGHTNESS_LEFT", 16, 3033, 219, 1, {-1, 0}, nil, false, "PE", "Symbology Brightness Left")
defineTumb("SYMBOLOGY_BRIGHTNESS_RIGHT", 16, 3034, 219, 1, {0, 1}, nil, false, "PE", "Symbology Brightness Right")
definePushButton("CAMERA_CENTERING", 16, 3001, 362, "PE", "Camera Centering")
definePushButton("TOGGLE_VDO_VTH", 16, 3002, 364, "PE", "Toggle VDO/VTH")
defineTumb("CAMERA_ZOOM_IN", 16, 3004, 365, 1, {-1, 0}, nil, false, "PE", "Camera Zoom In")
defineTumb("CAMERA_ZOOM_OUT", 16, 3003, 365, 1, {0, 1}, nil, false, "PE", "Camera Zoom Out")
defineTumb("CTH_POWER", 16, 3005, 366, 0.5, {0, 1}, nil, false, "PE", "CTH Power")
defineToggleSwitch("LASER_POWER", 16, 3006, 367, "PE", "Laser Power")
defineTumb("CAMERA_MODE", 16, 3007, 370, 0.25, {0, 1}, nil, false, "PE", "Camera Mode")

--Torque
definePushButton("TORQUE_TEST", 17, 3001, 58, "Torque", "Torque Test")
defineRotary("TORQUE_BUG_ADJUST", 17, 3002, 299, "Torque", "Torque Bug Adjust")

--Radar Altimeter
defineRotary("RADAR_ALT_BUG", 18, 3001, 93, "Radar Altimeter", "Radar Altimeter Bug Adjust")
defineRotary("RADAR_ALT_POWER", 18, 3002, 91, "Radar Altimeter", "Radar Altimeter Power")
definePushButton("RADAR_ALT_TEST", 18, 3003, 100, "Radar Altimeter", "Radar Altimeter Test")

--Baro Altimeter
defineRotary("BAROMETRIC_ALTIMETER", 19, 3001, 89, "Baro Altimeter", "Barometric Pressure Adjust")

--Clock
definePushButton("CLOCK_PUSH_BUTTON", 20 , 3004, 270, "Clock", "Clock Push Button")
defineRotary("CLOCK_SET", 20, 3001, 45, "Clock", "Clock Set")
definePushButton("CLOCK_START_STOP", 20 , 3002, 46, "Clock", "Clock Start Stop")
definePushButton("CLOCK_RESET", 20 , 3003, 47, "Clock", "Clock Reset")

--ADF
defineToggleSwitch("ADF1_ADF2_SELECT", 21, 3001, 166, "ADF", "ADF1/ADF2 Select")
defineToggleSwitch("ADF_TONE_ON_OFF", 21, 3002, 167, "ADF", "ADF Tone On/Off")
defineTumb("ADF_MODE", 21, 3003, 178, 0.33, {0, 1}, nil, false, "ADF", "ADF Mode")
defineRotary("ADF_GAIN", 21, 3004, 179, "ADF", "ADF Gain")
defineRotary("ADF_NAV1_100", 21, 3005, 168, "ADF", "ADF NAV1 100s")
defineRotary("ADF_NAV1_10", 21, 3006, 169, "ADF", "ADF NAV1 10s")
defineRotary("ADF_NAV1_1", 21, 3007, 173, "ADF", "ADF NAV1 1s")
defineRotary("ADF_NAV2_100", 21, 3008, 174, "ADF", "ADF NAV2 100s")
defineRotary("ADF_NAV2_10", 21, 3009, 175, "ADF", "ADF NAV2 10s")
defineRotary("ADF_NAV2_1", 21, 3010, 176, "ADF", "ADF NAV2 1s")

--NADIR
definePotentiometer("NADIR_ON_OFF_BRIGHTNESS", 23, 3001, 330, {0, 1}, "NADIR", "NADIR On/Off/Brightness")
defineTumb("NADIR_DOPPLER_MODE", 23, 3002, 331, 0.2, {0, 1}, nil, false, "NADIR", "NADIR Doppler Mode")
defineTumb("NADIR_PARAMETER", 23, 3003, 332, 0.2, {0, 1}, nil, false, "NADIR", "NADIR Parameter")
definePushButton("NADIR_ENTER_BUTTON", 23, 3004, 333, "NADIR", "NADIR Enter Button")
definePushButton("NADIR_DEST_BUTTON", 23, 3005, 334, "NADIR", "NADIR Destination Button")
definePushButton("NADIR_AUX_BUTTON", 23, 3006, 335, "NADIR", "NADIR Auxiliary Button")
definePushButton("NADIR_MAP_IND_BUTTON", 23, 3007, 336, "NADIR", "NADIR Map Indicator Button")
definePushButton("NADIR_DOWN_ARROW", 23, 3008, 337, "NADIR", "NADIR Down Arrow Button")
definePushButton("NADIR_0_BUTTON", 23, 3009, 351, "NADIR", "NADIR 0 Button")
definePushButton("NADIR_1_BUTTON", 23, 3010, 338, "NADIR", "NADIR 1 Button")
definePushButton("NADIR_2_BUTTON", 23, 3011, 339, "NADIR", "NADIR 2 Button")
definePushButton("NADIR_3_BUTTON", 23, 3012, 340, "NADIR", "NADIR 3 Button")
definePushButton("NADIR_4_BUTTON", 23, 3013, 342, "NADIR", "NADIR 4 Button")
definePushButton("NADIR_5_BUTTON", 23, 3014, 343, "NADIR", "NADIR 5 Button")
definePushButton("NADIR_6_BUTTON", 23, 3015, 344, "NADIR", "NADIR 6 Button")
definePushButton("NADIR_7_BUTTON", 23, 3016, 346, "NADIR", "NADIR 7 Button")
definePushButton("NADIR_8_BUTTON", 23, 3017, 347, "NADIR", "NADIR 8 Button")
definePushButton("NADIR_9_BUTTON", 23, 3018, 348, "NADIR", "NADIR 9 Button")
definePushButton("NADIR_POL_BUTTON", 23, 3019, 341, "NADIR", "NADIR POL Button")
definePushButton("NADIR_GEO_BUTTON", 23, 3020, 345, "NADIR", "NADIR GEO Button")
definePushButton("NADIR_POS_BUTTON", 23, 3021, 349, "NADIR", "NADIR POS Button")
definePushButton("NADIR_GEL_BUTTON", 23, 3022, 350, "NADIR", "NADIR GEL Button")
definePushButton("NADIR_EFF_BUTTON", 23, 3023, 352, "NADIR", "NADIR EFF Button")

--RWR
defineTumb("RWR_OFF_ON_CROC", 24, 3001, 148, 1, {-1, 1}, nil, false, "RWR", "RWR Off/On/Croc")
definePushButton("RWR_MARKER", 24, 3002, 149, "RWR", "RWR Marker")
definePushButton("RWR_PAGE", 24, 3003, 150, "RWR", "RWR Page")
definePotentiometer("RWR_AUDIO", 24, 3004, 121, {0, 1}, "RWR", "RWR Audio Volume")
definePotentiometer("RWR_BRIGHTNESS", 24, 3005, 122, {0, 1}, "RWR", "RWR Brightness")

--Flare Dispenser
defineTumb("FLARE_DISP_SIDE_SELECT", 25, 3001, 220, 1, {-1, 1}, nil, false, "Flare Dispenser", "Flare Dispenser Side Selector D/G+D/G")
defineToggleSwitch("FLARE_DISPENSE_MODE", 25, 3002, 221, "Flare Dispenser", "Flare Dispense Mode")
defineTumb("FLARE_DISPENSER_OFF_ON", 25, 3003, 222, 1, {-1, 1}, nil, false, "Flare Dispenser", "Flare Dispenser Off/On/Speed Select")
defineToggleSwitch("FLARE_DISP_FIRE_CAP", 25, 3004, 194, "Flare Dispenser", "Flare Dispense Fire Button Cap")
definePushButton("FLARE_DISPENSE_BUTTON", 25, 3005, 195, "Flare Dispenser", "Flare Dispenser Fire Button")

--Weapons
defineTumb("WEAPONS_PANEL_1_OFF_ON_STBY", 26, 3004, 354, 1, {-1, 1}, nil, false, "Weapons", "Weapons Panel 1 Off/On/Standby")
definePotentiometer("WEAPONS_PANEL_1_DISP_BRIGHT", 26, 3009, 357, {0, 1}, "Weapons", "Weapons Panel 1 Display Brightness")
defineToggleSwitch("LEFT_MASTER_ARM", 26, 3010, 372, "Weapons", "Left Master Arm On/Off")
defineToggleSwitch("LEFT_MASTER_ARM_COVER", 26, 3011, 373, "Weapons", "Left Master Arm Cover")
defineToggleSwitch("RIGHT_MASTER_ARM", 26, 3012, 374, "Weapons", "Right Master Arm On/Off")
defineToggleSwitch("RIGHT_MASTER_ARM_COVER", 26, 3013, 375, "Weapons", "Right Master Arm Cover")
defineToggleSwitch("WEAPON_LAUNCH_SEQ", 26, 3014, 376, "Weapons", "Weapon Launch Sequence")
defineToggleSwitch("PILOT_SIGHT", 26, 3002, 171, "Weapons", "Pilot Sight")
defineToggleSwitch("WEAPONS_MASTER_ARM", 26, 3001, 269, "Weapons", "Weapons Master Arm On/Off")

--PH/HOT3
defineTumb("HOT3_PANEL_TEST_OFF_ON", 27, 3001, 180, 0.25, {0, 1}, nil, false, "HOT3", "HOT3 Panel Test/Off/On")
defineTumb("HOT3_STATION_SELECT", 27, 3002, 181, 0.125, {0, 1}, nil, false, "HOT3", "HOT3 Station Select")
definePotentiometer("HOT3_BRIGHTNESS", 27, 3003, 182, {0, 1}, "HOT3", "HOT3 Brightness")

--FM Radio
defineTumb("FM_RADIO_MODE", 28, 3001, 272, 0.25, {0, 1}, nil, false, "FM Radio", "FM Radio Mode Select")
defineTumb("FM_RADIO_CHANNEL", 28, 3002, 273, 0.143, {0, 1}, nil, false, "FM Radio", "FM Radio Channel Select")
definePushButton("FM_RADIO_BUTTON_7", 28, 3003, 274, "FM Radio", "FM Radio Button 7")
definePushButton("FM_RADIO_BUTTON_8", 28, 3004, 275, "FM Radio", "FM Radio Button 8")
definePushButton("FM_RADIO_BUTTON_9", 28, 3005, 276, "FM Radio", "FM Radio Button 9")
definePushButton("FM_RADIO_BUTTON_0", 28, 3006, 277, "FM Radio", "FM Radio Button 0")
definePushButton("FM_RADIO_BUTTON_X", 28, 3007, 278, "FM Radio", "FM Radio Button X")
definePushButton("FM_RADIO_BUTTON_4", 28, 3008, 279, "FM Radio", "FM Radio Button 4")
definePushButton("FM_RADIO_BUTTON_5", 28, 3009, 280, "FM Radio", "FM Radio Button 5")
definePushButton("FM_RADIO_BUTTON_6", 28, 3010, 281, "FM Radio", "FM Radio Button 6")
definePushButton("FM_RADIO_BUTTON_RC", 28, 3011, 282, "FM Radio", "FM Radio Button RC")
definePushButton("FM_RADIO_BUTTON_UP", 28, 3012, 283, "FM Radio", "FM Radio Button UP")
definePushButton("FM_RADIO_BUTTON_1", 28, 3013, 284, "FM Radio", "FM Radio Button 1")
definePushButton("FM_RADIO_BUTTON_2", 28, 3014, 285, "FM Radio", "FM Radio Button 2")
definePushButton("FM_RADIO_BUTTON_3", 28, 3015, 286, "FM Radio", "FM Radio Button 3")
definePushButton("FM_RADIO_BUTTON_VAL", 28, 3016, 287, "FM Radio", "FM Radio Button VAL")
definePushButton("FM_RADIO_BUTTON_DOWN", 28, 3017, 288, "FM Radio", "FM Radio Button DOWN")

--UHF Radio
defineTumb("UHF_RADIO_MODE", 31, 3001, 383, 0.167, {0, 1}, nil, false, "UHF Radio", "UHF Radio Mode Select")
definePushButton("UHF_RADIO_BUTTON_DRW", 31, 3002, 384, "UHF Radio", "UHF Radio Button DRW")
definePushButton("UHF_RADIO_BUTTON_VLD", 31, 3003, 385, "UHF Radio", "UHF Radio Button VLD")
defineRotary("UHF_PAGE_KNOB", 31, 3004, 386, "UHF Radio", "UHF Radio Page Knob")
definePushButton("UHF_RADIO_BUTTON_CONF", 31, 3005, 387, "UHF Radio", "UHF Radio Button CONF")
definePushButton("UHF_RADIO_BUTTON_1", 31, 3006, 388, "UHF Radio", "UHF Radio Button 1")
definePushButton("UHF_RADIO_BUTTON_2", 31, 3007, 389, "UHF Radio", "UHF Radio Button 2")
definePushButton("UHF_RADIO_BUTTON_3", 31, 3008, 390, "UHF Radio", "UHF Radio Button 3")
definePushButton("UHF_RADIO_BUTTON_4", 31, 3009, 391, "UHF Radio", "UHF Radio Button 4")
definePushButton("UHF_RADIO_BUTTON_5", 31, 3010, 392, "UHF Radio", "UHF Radio Button 5")
definePushButton("UHF_RADIO_BUTTON_6", 31, 3011, 393, "UHF Radio", "UHF Radio Button 6")
definePushButton("UHF_RADIO_BUTTON_7", 31, 3012, 394, "UHF Radio", "UHF Radio Button 7")
definePushButton("UHF_RADIO_BUTTON_8", 31, 3013, 395, "UHF Radio", "UHF Radio Button 8")
definePushButton("UHF_RADIO_BUTTON_9", 31, 3014, 396, "UHF Radio", "UHF Radio Button 9")
definePushButton("UHF_RADIO_BUTTON_0", 31, 3015, 397, "UHF Radio", "UHF Radio Button 0")

--Indicator Lights
defineIndicatorLight("FD_LAMP_VE", 233, "Indicator Lights", "FD Lamp VE (yellow)")
defineIndicatorLight("FD_LAMP_G_OPE)", 231, "Indicator Lights", "FD Lamp G OPE (green)")
defineIndicatorLight("FD_LAMP_D_OPE", 232, "Indicator Lights", "FD Lamp D OPE (green)")
defineIndicatorLight("FD_LAMP_LEU", 227, "Indicator Lights", "FD Lamp LEU (green)")
defineIndicatorLight("FD_LAMP_G_VIDE1", 223, "Indicator Lights", "FD Lamp G Vide1 (yellow)")
defineIndicatorLight("FD_LAMP_G_VIDE2", 224, "Indicator Lights", "FD Lamp G Vide2 (yellow)")
defineIndicatorLight("FD_LAMP_D_VIDE1", 225, "Indicator Lights", "FD Lamp D Vide1 (yellow)")
defineIndicatorLight("FD_LAMP_D_VIDE2", 226, "Indicator Lights", "FD Lamp D Vide2 (yellow)")
defineIndicatorLight("RADAR_ALT_ALARM_LAMP", 97, "Indicator Lights", "Radar Altimeter Alarm Lamp (red)")
defineIndicatorLight("AM_RADIO_LAMP", 141, "Indicator Lights", "AM Radio Lamp (green)")
defineIndicatorLight("RWR_LIGHT", 196, "Indicator Lights", "RWR Backlight  (green)")
defineIndicatorLight("GYRO_TEST_LAMP", 201, "Indicator Lights", "Gyro Test Lamp (green)")
defineIndicatorLight("GYRO_TRIM_WARNING_LAMP", 202, "Indicator Lights", "Gyro Trim Warning Lamp (yellow)")
defineIndicatorLight("GYRO_BPP_WARNING_LAMP", 203, "Indicator Lights", "Gyro BPP Warning Lamp")
defineIndicatorLight("TORQUE_WARNING_LAMP", 17, "Indicator Lights", "Torque Warning Lamp")
defineIndicatorLight("DEM_START_LAMP", 300, "Indicator Lights", "DEM Start Lamp")
defineIndicatorLight("RLT_IDLE_LAMP", 301, "Indicator Lights", "RLT Idle Lamp")
defineIndicatorLight("BLOCKED_ENGINE_WARNING_LAMP", 302, "Indicator Lights", "Block Engine Warning Lamp")
defineIndicatorLight("ADDITIONAL_FUEL_TANK_LAMP", 320, "Indicator Lights", "Additional Fuel Tank Lamp")
defineIndicatorLight("CONVOY_FUEL_TANK_LAMP", 321, "Indicator Lights", "Convoy Fuel Tank Lamp")
defineIndicatorLight("SAND_FILTER_LAMP", 322, "Indicator Lights", "Sand Filter Lamp")
defineIndicatorLight("ALARM_WARNING_LAMP", 303, "Indicator Lights", "Alarm Warning Lamp")
defineIndicatorLight("TV_LAMP", 127, "Indicator Lights", "TV Lamp")
defineIndicatorLight("WP2_LEFT_LAMP", 377, "Indicator Lights", "Weapons Panel 2 Left Lamp")
defineIndicatorLight("WP2_RIGHT_LAMP", 378, "Indicator Lights", "Weapons Panel 2 Right Lamp")

--Warning Panel
defineIndicatorLight("PITOT_TUBE_WARNING", 1, "Warning Panel", "Pitot Tube Warning (red)")
defineIndicatorLight("TURBINE_OIL_PRESSURE", 2, "Warning Panel", "Turbine Oil Pressure Warning (red)")
defineIndicatorLight("ROTOR_OIL_PRESSURE", 3, "Warning Panel", "Main Rotor Oil Pressure Warning (red)")
defineIndicatorLight("LOW_TURBINE_RPM", 4, "Warning Panel", "Low Turbine RPM Warning (red)")
defineIndicatorLight("GENERATOR_WARNING", 5, "Warning Panel", "Generator Warning (red)")
defineIndicatorLight("ALTERNATOR_WARNING", 6, "Warning Panel", "Alternator Warning (red)")
defineIndicatorLight("BATTERY_WARNING", 7, "Warning Panel", "Battery Warning (red)")
defineIndicatorLight("AUTOPILOT", 8, "Warning Panel", "Autopilot Warning (red)")
defineIndicatorLight("AC_115V_BUS_NAV", 9, "Warning Panel", "AC 115 V Bus/NAV Warning (red)")
defineIndicatorLight("LOW_FUEL", 10, "Warning Panel", "Low Fuel Warning (red)")
defineIndicatorLight("LOW_ROTOR_RPM", 11, "Warning Panel", "Low Rotor RPM Warning (red)")
defineIndicatorLight("CHIPS_IN_OIL", 12, "Warning Panel", "Chips In Oil Warning (red)")
defineIndicatorLight("SAND_FILTER_WARNING", 13, "Warning Panel", "Sand Filter Warning (red)")

--Raw Guage Values
defineFloat("GYRO_NEEDLE", 200, {-1, 1}, "Raw Gauge Values", "Gyro Needle")
defineFloat("PITCH_NEEDLE", 37, {-1, 1}, "Raw Gauge Values", "Pitch Needle")
defineFloat("ROLL_NEEDLE", 38, {-1, 1}, "Raw Gauge Values", "Roll Needle")
defineFloat("YAW_NEEDLE", 39, {-1, 1}, "Raw Gauge Values", "Yaw Needle")
defineFloat("TV_BRIGHTNESS_VALUE", 371, {0, 1}, "Raw Gauge Values", "TV Brightness")
defineFloat("NADIR_BRIGHTNESS", 353, {0, 1}, "Raw Gauge Values", "NADIR Brightness")
defineFloat("ADF_NAV1_FREQ_100s", 158, {0, 1}, "Raw Gauge Values", "ADF NAV1 Frequency 100s")
defineFloat("ADF_NAV1_FREQ_10s", 159, {0, 1}, "Raw Gauge Values", "ADF NAV1 Frequency 10s")
defineFloat("ADF_NAV1_FREQ_1s", 160, {0, 1}, "Raw Gauge Values", "ADF NAV1 Frequency 1s")
defineFloat("ADF_NAV1_FREQ_DECIMAL", 161, {0, 1}, "Raw Gauge Values", "ADF NAV1 Frequency Decimal")
defineFloat("ADF_NAV2_FREQ_100s", 162, {0, 1}, "Raw Gauge Values", "ADF NAV2 Frequency 100s")
defineFloat("ADF_NAV2_FREQ_10s", 163, {0, 1}, "Raw Gauge Values", "ADF NAV2 Frequency 10s")
defineFloat("ADF_NAV2_FREQ_1s", 164, {0, 1}, "Raw Gauge Values", "ADF NAV2 Frequency 1s")
defineFloat("ADF_NAV2_FREQ_DECIMAL", 165, {0, 1}, "Raw Gauge Values", "ADF NAV2 Frequency Decimal")
defineFloat("ADF_BACKGROUND", 113, {0, 1}, "Raw Gauge Values", "ADF Background")
defineFloat("ADF_NADIR_NEEDLE", 102, {-1, 1}, "Raw Gauge Values", "ADF NADIR Needle")
defineFloat("ADF_SMALL_NEEDLE", 103, {-1, 1}, "Raw Gauge Values", "ADF Small Needle")
defineFloat("ADF_FLAG_CAP", 107, {0, 1}, "Raw Gauge Values", "ADF Flag CAP")
defineFloat("ADF_FLAG_BUT", 109, {0, 1}, "Raw Gauge Values", "ADF Flag But")
defineFloat("ADF_FLAG_COUNTER", 108, {0, 1}, "Raw Gauge Values", "ADF Flag Counter")
defineFloat("ADF_DISTANCE_100s", 110, {0, 1}, "Raw Gauge Values", "ADF Distance 100s")
defineFloat("ADF_DISTANCE_10s", 111, {0, 1}, "Raw Gauge Values", "ADF Distance 10s")
defineFloat("ADF_DISTANCE_1s", 112, {0, 1}, "Raw Gauge Values", "ADF Distance 1s")
defineFloat("CLOCK_HOUR", 41, {0, 1}, "Raw Gauge Values", "Clock Hour")
defineFloat("CLOCK_MINUTE", 43, {0, 1}, "Raw Gauge Values", "Clock Minute")
defineFloat("CLOCK_SECOND", 42, {0, 1}, "Raw Gauge Values", "Clock Second")
defineFloat("CLOCK_MINI", 44, {0, 1}, "Raw Gauge Values", "Clock Mini")
defineFloat("WIPERS_PILOT", 547, {-1, 1}, "Raw Gauge Values", "Wipers Pilot")
defineFloat("WIPERS_COPILOT", 546, {-1, 1}, "Raw Gauge Values", "Wipers Copilot")
defineFloat("ROOF_LIGHT", 40, {0, 1}, "Raw Gauge Values", "Roof Light")
defineFloat("MAIN_PANEL_LIGHT", 142, {0, 1}, "Raw Gauge Values", "Main Panel Light")
defineFloat("CENTER_CONSOLE_LIGHT", 144, {0, 1}, "Raw Gauge Values", "Center Console Light")
defineFloat("BARO_ALT_THOUSANDS", 87, {0, 1}, "Raw Gauge Values", "Baro Altimeter 1000s")
defineFloat("BARO_ALT_HUNDREDS", 573, {0, 1}, "Raw Gauge Values", "Baro Altimeter 100s")
defineFloat("BARO_PRESSURE_UNITS", 88, {0, 1}, "Raw Gauge Values", "Baro Pressure 1s")
defineFloat("BARO_PRESSURE_TENS", 90, {0, 1}, "Raw Gauge Values", "Baro Pressure 10s")
defineFloat("BARO_PRESSURE_HUNDREDS", 92, {0, 1}, "Raw Gauge Values", "Baro Pressure 100s")
defineFloat("BARO_PRESSURE_THOUSANDS", 95, {0, 1}, "Raw Gauge Values", "Baro Pressure 1000s")
defineFloat("RADAR_ALTIMETER", 94, {0.0, 0.87}, "Raw Gauge Values", "Radar Altimeter (raw)")
defineFloat("RADAR_ALTIMETER_BUG", 93, {0.0, 0.8693}, "Raw Gauge Values", "Radar Altimeter Bug")
defineFloat("RADAR_ALT_FLAG_PENNE", 98, {0, 1}, "Raw Gauge Values", "Radar Altimeter Flag Panne")
defineFloat("RADAR_ALT_FLAG_ON_OFF", 99, {0, 1}, "Raw Gauge Values", "Radar Altimeter Flag On/Off")
defineFloat("RADAR_ALT_KNOB", 91, {0, 1}, "Raw Gauge Values", "Radar Altimeter Knob")
defineFloat("TORQUE_NEEDLE", 16, {0.085, 0.908}, "Raw Gauge Values", "Torque Needle")
defineFloat("TORQUE_BUG", 55, {0.084, 0.91}, "Raw Gauge Values", "Torque Bug")
defineFloat("GYRO_COMPASS_HEADING", 26, {0, 1}, "Raw Gauge Values", "Gyro Compass Heading")
defineFloat("STBY_ART_HOR_ROLL", 214, {-1, 1}, "Raw Gauge Values", "Standby Artificial Horizon Roll")
defineFloat("STBY_ART_HOR_PITCH", 213, {-1, 1}, "Raw Gauge Values", "Standby Artificial Horizon Pitch")
defineFloat("STBY_ART_HOR_FLAG", 211, {0, 1}, "Raw Gauge Values", "Standby Artificial Horizon Flag")
defineFloat("STBY_ART_HOR_W", 212, {0, 1}, "Raw Gauge Values", "Standby Artificial Horizon W")
defineFloat("STBY_ART_HOR_CURSEUR", 217, {0, 1}, "Raw Gauge Values", "Standby Artificial Horizon Curseur")
defineFloat("FUEL", 137, {0.093, 0.932}, "Raw Gauge Values", "Fuel")
defineFloat("ART_HORIZ_PITCH", 27, {-1, 1}, "Raw Gauge Values", "Artificial Horizon Pitch")
defineFloat("ART_HORIZ_ROLL", 28, {-1, 1}, "Raw Gauge Values", "Artificial Horizon Roll")
defineFloat("ART_HORIZ_BALL", 20, {-1, 1}, "Raw Gauge Values", "Artificial Horizon Ball")
defineFloat("ART_HORIZ_FLAG_GS", 18, {0, 1}, "Raw Gauge Values", "Artificial Horizon Flag GS")
defineFloat("ART_HORIZ_FLAG_HS", 19, {0, 1}, "Raw Gauge Values", "Artificial Horizon Flag HS")
defineFloat("ART_HORIZ_FLAG_LOC", 29, {0, 1}, "Raw Gauge Values", "Artificial Horizon Flag LOC")
defineFloat("ART_HORIZ_CURSEUR", 117, {0, 1}, "Raw Gauge Values", "Artificial Horizon Curseur")
defineFloat("ART_HORIZ_W", 120, {-1, 1}, "Raw Gauge Values", "Artificial Horizon W")
defineFloat("ART_HORIZ_VERT_BAR", 118, {-1, 1}, "Raw Gauge Values", "Artificial Horizon Vertical Bar")
defineFloat("ART_HORIZ_HORIZONTAL_BAR", 119, {-1, 1}, "Raw Gauge Values", "Artificial Horizon Horizontal Bar")
defineFloat("VARIOMETER_VVI", 24, {-0.481, 0.463}, "Raw Gauge Values", "Variometer Vertical Velocity VVI")
defineFloat("IND_AIR_SPEED_IAS", 51, {0, 0.886}, "Raw Gauge Values", "Indicated Air Speed IAS")
defineFloat("TURBINE_RPM", 135, {0.095, 0.909}, "Raw Gauge Values", "Turbine RPM")
defineFloat("ROTOR_RPM", 52, {0.096, 0.904}, "Raw Gauge Values", "Rotor RPM")
defineFloat("VOLT_METER", 14, {0.045, 0.724}, "Raw Gauge Values", "Volt Meter")
defineFloat("QUATRE", 15, {0.1575, 0.8625}, "Raw Gauge Values", "Quatre")
defineFloat("TEMP_EXTERNAL", 25, {-0.758, 0.712}, "Raw Gauge Values", "External Temperature")
defineFloat("TEMP_ENGINE_OIL", 151, {0.046, 0.715}, "Raw Gauge Values", "Engine Oil Temperature")
defineFloat("AUX_FUEL_TANK", 152, {0, 1}, "Raw Gauge Values", "Auxiliary Fuel Tank")
defineFloat("AM_RADIO_FREQ_100s", 133, {0, 1}, "Raw Gauge Values", "AM Radio Frequency 100s")
defineFloat("AM_RADIO_FREQ_10s", 134, {0, 1}, "Raw Gauge Values", "AM Radio Frequency 10s")
defineFloat("AM_RADIO_FREQ_1s", 136, {0, 1}, "Raw Gauge Values", "AM Radio Frequency 1s")
defineFloat("AM_RADIO_FREQ_TENTHS", 138, {0, 1}, "Raw Gauge Values", "AM Radio Frequency Tenths")
defineFloat("AM_RADIO_FREQ_HUNDREDTHS", 139, {0, 1}, "Raw Gauge Values", "AM Radio Frequency Hundredths")

--Actual Gauge Values
local function getHDG()
     local returnValue = (GetDevice(0):get_argument_value(26))*360
     return returnValue
end
defineIntegerFromGetter("HEADING_VALUE", getHDG, 65000, "Gauge Values", "Heading Value")

local function getNADIR()
	 local a = (GetDevice(0):get_argument_value(26))*360
     local b = 0
	 local c = 0
	 local d = (GetDevice(0):get_argument_value(102))
	 if d < 0 then
	 b = 360 - (d * (-360))
	 else
     b = d * 360
	 end
	 if a + b < 360 then
	 c = a + b
	 else
	 c = (a + b) - 360
	 end
	 return c
end
defineIntegerFromGetter("NADIR_HEADING_VALUE", getNADIR, 65000, "Gauge Values", "NADIR Heading Value")

local function getADFHDG()
     local e = 0
	 local f = 0
	 local g = (GetDevice(0):get_argument_value(26))*360
	 local h = (GetDevice(0):get_argument_value(103))
	 if h < 0 then
	 e = 360 - (h * (-360))
	 else
     e = h * 360
	 end
	 if g + e < 360 then
	 f = g + e
	 else
	 f = (g + e) - 360
	 end
	 return f
end
defineIntegerFromGetter("ADF_HEADING_VALUE", getADFHDG, 65000, "Gauge Values", "ADF Heading Value")

local function getADFDIST()
     local returnValue = dist
	 local cent = (GetDevice(0):get_argument_value(110))*1000
	 local dix = (GetDevice(0):get_argument_value(111))*100
	 local unit = (GetDevice(0):get_argument_value(112))*10
	 dist = cent + dix + unit
     return returnValue
end
defineIntegerFromGetter("ADF_DISTANCE_VALUE", getADFDIST, 65000, "Gauge Values", "ADF Distance Value")

local function getBAROALT()
     local returnValue = ((GetDevice(0):get_argument_value(87))*10053) - 41.048
     return returnValue
end
defineIntegerFromGetter("BARO_ALT_VALUE", getBAROALT, 65000, "Gauge Values", "Barometric Altimeter Value")

local function getBAROPRESS()
     local returnValue = baro
	 local baromille = (GetDevice(0):get_argument_value(95))*10000
	 local barocent = (GetDevice(0):get_argument_value(92))*1000
	 local barodix = (GetDevice(0):get_argument_value(90))*100
	 local barounit = (GetDevice(0):get_argument_value(88))*10	 
	 baro = baromille + barocent + barodix + barounit
     return returnValue
end
defineIntegerFromGetter("BARO_PRESS_VALUE", getBAROPRESS, 65000, "Gauge Values", "Barometric Pressure Value")

local function getRADALT()
     local returnValue = (-2775.9*(GetDevice(0):get_argument_value(94))^5) + (8414.8*(GetDevice(0):get_argument_value(94))^4) - (5860*(GetDevice(0):get_argument_value(94))^3) + (1495.4*(GetDevice(0):get_argument_value(94))^2) + (153.05*(GetDevice(0):get_argument_value(94))) + 1.4913
     return returnValue
end
defineIntegerFromGetter("RADAR_ALT_VALUE", getRADALT, 65000, "Gauge Values", "Radar Altimeter Value")

local function getTORQUE()
     local returnValue = (-66.873*(GetDevice(0):get_argument_value(16))^3) + (103.7*(GetDevice(0):get_argument_value(16))^2) + (91.562*(GetDevice(0):get_argument_value(16))) - 8.5301
     return returnValue
end
defineIntegerFromGetter("TORQUE_VALUE", getTORQUE, 65000, "Gauge Values", "Torque Value")

local function getFUEL()
     local returnValue = (-8880.7*(GetDevice(0):get_argument_value(137))^6) + (27939*(GetDevice(0):get_argument_value(137))^5) - (32540*(GetDevice(0):get_argument_value(137))^4) + (17294*(GetDevice(0):get_argument_value(137))^3) - (3852.5*(GetDevice(0):get_argument_value(137))^2) + (654.65*(GetDevice(0):get_argument_value(137))) - 39.142
     return returnValue
end
defineIntegerFromGetter("FUEL_LEVEL_VALUE", getFUEL, 65000, "Gauge Values", "Fuel Level Value")

local function getIAS()
     local returnValue = (-605.35*(GetDevice(0):get_argument_value(51))^4) + (1206.9*(GetDevice(0):get_argument_value(51))^3) - (586.3*(GetDevice(0):get_argument_value(51))^2) + (379.6*(GetDevice(0):get_argument_value(51))) + 26.91
     return returnValue
end
defineIntegerFromGetter("IAS_VALUE", getIAS, 65000, "Gauge Values", "Airspeed IAS Value")

local function getTURBRPM()
     local returnValue = (35495*(GetDevice(0):get_argument_value(135))^4) - (81489*(GetDevice(0):get_argument_value(135))^3) + (62975*(GetDevice(0):get_argument_value(135))^2) + (43447*(GetDevice(0):get_argument_value(135))) - 4572.9
     return returnValue
end
defineIntegerFromGetter("TURBINE_RPM_VALUE", getTURBRPM, 65000, "Gauge Values", "Turbine RPM Value")

local function getROTRPM()
     local returnValue = (234.39*(GetDevice(0):get_argument_value(52))^4) - (524.36*(GetDevice(0):get_argument_value(52))^3) + (413.16*(GetDevice(0):get_argument_value(52))^2) + (428.23*(GetDevice(0):get_argument_value(52))) - 44.168
     return returnValue
end
defineIntegerFromGetter("ROTOR_RPM_VALUE", getROTRPM, 65000, "Gauge Values", "Rotor RPM Value")

defineIndicatorLight("HOT3_BON_LAMP", 183, "Indicator Lights", "HOT3 Panel BON Lamp (green)")
defineIndicatorLight("HOT3_MAUVAIS_LAMP", 184, "Indicator Lights", "HOT3 Panel MAUVAIS Lamp (red)")
defineIndicatorLight("HOT3_ALIM_LAMP", 185, "Indicator Lights", "HOT3 Panel ALIM Lamp (green)")
defineIndicatorLight("HOT3_PRET_LAMP", 186, "Indicator Lights", "HOT3 Panel PRET Lamp (blue)")
defineIndicatorLight("HOT3_AUTOR_LAMP", 187, "Indicator Lights", "HOT3 Panel AUTOR Lamp (green)")
defineIndicatorLight("HOT3_DEFAUT_LAMP", 188, "Indicator Lights", "HOT3 Panel DEFAUT Lamp (red)")
defineIndicatorLight("HOT3_TEST1_LAMP", 189, "Indicator Lights", "HOT3 Panel TEST 1 Lamp (blue)")
defineIndicatorLight("HOT3_JOUR_LAMP", 190, "Indicator Lights", "HOT3 Panel JOUR Lamp (green)")
defineIndicatorLight("HOT3_LUM_LAMP", 191, "Indicator Lights", "HOT3 Panel LUM Lamp (yellow)")
defineIndicatorLight("HOT3_TEST2_LAMP", 192, "Indicator Lights", "HOT3 Panel TEST 2 Lamp (blue)")
defineIndicatorLight("HOT3_NUIT_LAMP", 193, "Indicator Lights", "HOT3 Panel NUIT Lamp (green)")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_STROBE", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Light")

BIOS.protocol.endModule()