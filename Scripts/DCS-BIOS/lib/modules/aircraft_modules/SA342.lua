module("SA342", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class SA342: Module
local SA342 = Module:new("SA342", 0x5800, { "SA342M", "SA342Minigun", "SA342Mistral", "SA342L" })

--overhaul by WarLord 2.0c

local SYNC_DEVICE_ID = 35

--Electric System
SA342:definePushButton("WIPER_ONCE", SYNC_DEVICE_ID, 3018, 53, "Electric System", "Wiper Once")
SA342:defineToggleSwitch("BATTERY", SYNC_DEVICE_ID, 3001, 264, "Electric System", "Battery")
SA342:defineToggleSwitch("ALTERNATOR", SYNC_DEVICE_ID, 3002, 265, "Electric System", "Alternator")
SA342:defineToggleSwitch("GENERATOR", SYNC_DEVICE_ID, 3003, 268, "Electric System", "Generator")
SA342:definePushButton("VOLTMETER_TEST", SYNC_DEVICE_ID, 3004, 62, "Electric System", "Voltmeter Test")
SA342:defineToggleSwitch("PITOT", SYNC_DEVICE_ID, 3005, 170, "Electric System", "Pitot")
SA342:defineToggleSwitch("FUEL_PUMP", SYNC_DEVICE_ID, 3006, 271, "Electric System", "Fuel Pump")
SA342:defineToggleSwitch("ADDITIONAL_FUEL_TANK", SYNC_DEVICE_ID, 3007, 267, "Electric System", "Additional Fuel Tank")
SA342:define3PosTumb("STARTER", SYNC_DEVICE_ID, 3008, 56, "Electric System", "Starter Start/Stop/Air")
SA342:definePushButton("WARNING_PANEL_TEST", SYNC_DEVICE_ID, 3009, 57, "Electric System", "Warning Panel Test")
SA342:define3PosTumb("COPILOT_WIPER", SYNC_DEVICE_ID, 3010, 48, "Electric System", "Copilot Wiper")
SA342:define3PosTumb("PILOT_WIPER", SYNC_DEVICE_ID, 3011, 49, "Electric System", "Pilot Wiper")
SA342:defineToggleSwitch("UNASSIGNED_SWITCH", SYNC_DEVICE_ID, 3012, 61, "Electric System", "Unassigned Switch")
SA342:definePushButton("HYD_TEST", SYNC_DEVICE_ID, 3013, 59, "Electric System", "HYD Test")
SA342:definePushButton("REARM_ALTER", SYNC_DEVICE_ID, 3014, 66, "Electric System", "Alter Rearm")
SA342:definePushButton("REARM_GENE", SYNC_DEVICE_ID, 3015, 67, "Electric System", "Gene Rearm")
SA342:defineToggleSwitch("CONVOY_TANK", SYNC_DEVICE_ID, 3016, 63, "Electric System", "Convoy Tank On/Off")
SA342:defineToggleSwitch("SAND_FILTER", SYNC_DEVICE_ID, 3017, 64, "Electric System", "Sand Filter On/Off")

--Intercom Pilot
SA342:defineRotary("VHF_AM_RADIO_VOLUME_1", SYNC_DEVICE_ID, 3221, 68, "Intercom", "VHF AM Radio Volume 1")
SA342:defineRotary("FM_RADIO_VOLUME_1", SYNC_DEVICE_ID, 3222, 70, "Intercom", "FM Radio Volume 1")
SA342:defineRotary("UHF_RADIO_VOLUME_1", SYNC_DEVICE_ID, 3223, 69, "Intercom", "UHF Radio Volume 1")

--Intercom Copilot
SA342:defineRotary("VHF_AM_RADIO_VOLUME_2", SYNC_DEVICE_ID, 3251, 79, "Intercom", "VHF AM Radio Volume 2")
SA342:defineRotary("FM_RADIO_VOLUME_2", SYNC_DEVICE_ID, 3252, 81, "Intercom", "FM Radio Volume 2")
SA342:defineRotary("UHF_RADIO_VOLUME_2", SYNC_DEVICE_ID, 3253, 80, "Intercom", "UHF Radio Volume 2")

--AM Radio
SA342:defineTumb("AM_RADIO_SELECTOR", SYNC_DEVICE_ID, 3141, 128, 0.33, { 0, 1 }, nil, false, "AM Radio", "AM Radio Selector")
SA342:defineRotary("AM_RADIO_FREQUENCY_DIAL_RIGHT", SYNC_DEVICE_ID, 3142, 129, "AM Radio", "AM Radio Frequency Dial Right")
SA342:defineToggleSwitch("AM_FREQUENCY_SELECTOR", SYNC_DEVICE_ID, 3143, 130, "AM Radio", "AM Radio 25/50kHz Selector")
SA342:defineRotary("AM_RADIO_FREQUENCY_DIAL_LEFT", SYNC_DEVICE_ID, 3144, 131, "AM Radio", "AM Radio Frequency Dial Left")

--Autopilot
SA342:definePushButton("AUTOPILOT_BUTTON", 7, 3028, 209, "Autopilot", "Autopilot Button")
SA342:definePushButton("AUTOPILOT_SLAVE", 7, 3012, 293, "Autopilot", "Autopilot Slave")
SA342:definePushButton("AUTO_HOVER", 7, 3008, 294, "Autopilot", "Auto-Hover")
SA342:defineToggleSwitch("GYRO_TEST_COVER", 7, 3014, 197, "Autopilot", "Gyro Test Cover Open/Close")
SA342:defineToggleSwitch("GYRO_TEST_SWITCH", 7, 3015, 198, "Autopilot", "Gyro Test Switch On/Off")
SA342:define3PosTumb("GYRO_SWITCH", 7, 3016, 199, "Autopilot", "Gyro Left/Center/Right")
SA342:defineTumb("GYRO_KNOB", 7, 3017, 153, 0.25, { 0, 1 }, nil, false, "Autopilot", "Gyro Knob")
SA342:defineToggleSwitch("AUTOPILOT_ON_OFF", 7, 3001, 31, "Autopilot", "Autopilot On/Off")
SA342:defineToggleSwitch("AUTOPILOT_PITCH", 7, 3002, 32, "Autopilot", "Autopilot Pitch")
SA342:defineToggleSwitch("AUTOPILOT_ROLL", 7, 3003, 33, "Autopilot", "Autopilot Roll")
SA342:defineToggleSwitch("AUTOPILOT_YAW", 7, 3004, 34, "Autopilot", "Autopilot Yaw")
SA342:define3PosTumb("AUTOPILOT_MODE", 7, 3005, 35, "Autopilot", "Autopilot Mode Speed/Off/Altitude")
SA342:defineToggleSwitch("AUTOPILOT_TRIM", 7, 3006, 60, "Autopilot", "Autopilot Trim")
SA342:defineToggleSwitch("MAGNETIC_BRAKE", 7, 3007, 65, "Autopilot", "Magnetic Brake")

--Controls & Flight Controls
SA342:definePushButton("MAGNETIC_BRAKE_BUTTON", 8, 3001, 50, "Flight Controls", "Magnetic Brake Button")
SA342:definePushButton("HA_UNLOCK", 9, 3002, 116, "Flight Controls", "HA Unlock")
SA342:defineRotary("HA_ADJUST", 9, 3001, 115, "Flight Controls", "HA Adjust")
SA342:definePushButton("STANDBY_HA_UNLOCK", 9, 3004, 216, "Flight Controls", "Standby HA Unlock")
SA342:defineRotary("STANDBY_HA_ADJUST", 9, 3003, 215, "Flight Controls", "Standby HA Adjust")
SA342:defineTumb("HA_SOURCE", 9, 3007, 218, 0.33, { 0, 1 }, nil, false, "Flight Controls", "HA Source")

--Fuel
SA342:defineToggleSwitch("FUEL_FLOW_LEVER", 10, 3001, 557, "Fuel", "Fuel Flow Lever")

--Rotors
SA342:defineToggleSwitch("ROTOR_BRAKE", 37, 3001, 556, "Rotors", "Rotor Brake")

--TV
SA342:defineToggleSwitch("TV_ON_OFF", SYNC_DEVICE_ID, 3081, 124, "TV", "TV On/Off")
SA342:definePotentiometer("TV_CONTRAST", SYNC_DEVICE_ID, 3082, 125, { 0, 1 }, "TV", "TV Contrast")
SA342:definePotentiometer("TV_BRIGHTNESS", SYNC_DEVICE_ID, 3083, 123, { 0, 1 }, "TV", "TV Brightness")
SA342:defineToggleSwitch("TV_COVER", SYNC_DEVICE_ID, 3084, 126, "TV", "TV Cover")

--Lights
SA342:definePotentiometer("DASHBOARD_LIGHTING", 13, 3001, 22, { 0, 1 }, "Lights", "Main Dashboard Lighting")
SA342:definePotentiometer("CONSOLE_LIGHTING", 13, 3002, 21, { 0, 1 }, "Lights", "Console Lighting")
SA342:definePotentiometer("UV_LIGHTING", 13, 3003, 145, { 0, 1 }, "Lights", "UV Lighting")
SA342:defineToggleSwitch("LIGHTS_NORM_BNL", 13, 3004, 23, "Lights", "Lights Norm/BNL")
SA342:definePotentiometer("ROOF_LAMP", 13, 3005, 147, { 0, 1 }, "Lights", "Roof Lamp Knob")
SA342:defineToggleSwitch("RED_LENS_ON_OFF", 13, 3006, 154, "Lights", "Red Lens On/Off")

--Navlights
SA342:define3PosTumb("NAV_LIGHTS", 14, 3001, 146, "Navlights", "Navigation Lights CLI/OFF/FIX")
SA342:define3PosTumb("ANTICOLL_LIGHTS", 14, 3002, 228, "Navlights", "Anticollision Light NOR/OFF/ATT")
SA342:define3PosTumb("LANDING_LIGHTS", 14, 3003, 105, "Navlights", "Landing Light Off/Vario/On")
SA342:defineTumb("LANDING_LIGHT_EXTEND", 14, 3004, 106, 1, { -1, 0 }, nil, false, "Navlights", "Landing Light Extend")
SA342:defineToggleSwitch("LANDING_LIGHT_RETRACT", 14, 3006, 106, "Navlights", "Landing Light Retract")
SA342:defineToggleSwitch("PANEL_LIGHTING", 14, 3008, 382, "Navlights", "Panel Lighting On/Off")
SA342:definePotentiometer("ANTICOLL_INTENSITY", 14, 3010, 30, { 0, 1 }, "Navlights", "Anticollision Light Intensity")
SA342:defineToggleSwitch("FORMATION_LIGHTS", 14, 3011, 229, "Navlights", "Formation Lights On/Off")
SA342:definePotentiometer("FORMATION_INTENSITY", 14, 3012, 230, { 0, 1 }, "Navlights", "Formation Lights Intensity")

--PE
SA342:defineToggleSwitch("LASING_BUTTON_COVER", SYNC_DEVICE_ID, 3301, 255, "PE", "Lasing Button Cover")
SA342:definePushButton("LASING_BUTTON", SYNC_DEVICE_ID, 3302, 256, "PE", "Lasing Button")
SA342:defineToggleSwitchToggleOnly("MISSILE_LAUNCH_COVER", SYNC_DEVICE_ID, 3303, 257, "PE", "Missile Launch Cover")
SA342:definePushButton("MISSILE_LAUNCH", SYNC_DEVICE_ID, 3304, 258, "PE", "Missile Launch")
SA342:definePushButton("INVERSED_SYMBOLOGY", SYNC_DEVICE_ID, 3305, 259, "PE", "Inversed Symbology")
SA342:definePushButton("INVERSED_IMAGE", SYNC_DEVICE_ID, 3306, 260, "PE", "Inversed Image")
SA342:defineTumb("IMAGE_FOCUS_DOWN", SYNC_DEVICE_ID, 3307, 261, 1, { -1, 0 }, nil, false, "PE", "Image Focus Down")
SA342:defineToggleSwitch("IMAGE_FOCUS_UP", SYNC_DEVICE_ID, 3308, 261, "PE", "Image Focus Up")
SA342:defineTumb("IMAGE_GAIN_LEFT", SYNC_DEVICE_ID, 3310, 262, 1, { -1, 0 }, nil, false, "PE", "Image Gain Left")
SA342:defineToggleSwitch("IMAGE_GAIN_RIGHT", SYNC_DEVICE_ID, 3310, 262, "PE", "Image Gain Right")
SA342:defineTumb("IMAGE_BRIGHTNESS_DOWN", SYNC_DEVICE_ID, 3312, 263, 1, { -1, 0 }, nil, false, "PE", "Image Brightness Down")
SA342:defineToggleSwitch("IMAGE_BRIGHTNESS_UP", SYNC_DEVICE_ID, 3311, 263, "PE", "Symbology Brightness Left")
SA342:defineToggleSwitch("SYMBOLOGY_BRIGHTNESS_RIGHT", SYNC_DEVICE_ID, 3314, 219, "PE", "Symbology Brightness Right")
SA342:definePushButton("CAMERA_CENTERING", SYNC_DEVICE_ID, 3281, 362, "PE", "Camera Centering")
SA342:definePushButton("TOGGLE_VDO_VTH", SYNC_DEVICE_ID, 3282, 364, "PE", "Toggle VDO/VTH")
SA342:defineTumb("CAMERA_ZOOM_IN", SYNC_DEVICE_ID, 3284, 365, 1, { -1, 0 }, nil, false, "PE", "Camera Zoom In")
SA342:defineToggleSwitch("CAMERA_ZOOM_OUT", SYNC_DEVICE_ID, 3283, 365, "PE", "Camera Zoom Out")
SA342:defineTumb("CTH_POWER", SYNC_DEVICE_ID, 3285, 366, 0.5, { 0, 1 }, nil, false, "PE", "CTH Power")
SA342:defineToggleSwitch("VCB_POWER", SYNC_DEVICE_ID, 3286, 367, "PE", "VCB Power Selector")
SA342:defineTumb("CAMERA_MODE", SYNC_DEVICE_ID, 3287, 370, 0.25, { 0, 1 }, nil, false, "PE", "Camera Mode")

--Torque
SA342:definePushButton("TORQUE_TEST", 16, 3001, 58, "Torque", "Torque Test")
SA342:defineRotary("TORQUE_BUG_ADJUST", 16, 3002, 299, "Torque", "Torque Bug Adjust")

--Radar Altimeter
SA342:defineRotary("RADAR_ALT_BUG", 26, 3339, 93, "Radar Altimeter", "Radar Altimeter Bug Adjust")
SA342:defineRotary("RADAR_ALT_POWER", 26, 3340, 91, "Radar Altimeter", "Radar Altimeter Power")
SA342:definePushButton("RADAR_ALT_TEST", 26, 3341, 100, "Radar Altimeter", "Radar Altimeter Test")

--Baro Altimeter
SA342:defineRotary("BAROMETRIC_ALTIMETER", 18, 3001, 89, "Baro Altimeter", "Barometric Pressure Adjust")

--Clock
SA342:definePushButton("CLOCK_PUSH_BUTTON", 19, 3004, 270, "Clock", "Clock Push Button")
SA342:defineRotary("CLOCK_SET", 19, 3001, 45, "Clock", "Clock Set")
SA342:definePushButton("CLOCK_START_STOP", 19, 3002, 46, "Clock", "Clock Start Stop")
SA342:definePushButton("CLOCK_RESET", 19, 3003, 47, "Clock", "Clock Reset")

--ADF
SA342:defineToggleSwitch("ADF1_ADF2_SELECT", SYNC_DEVICE_ID, 3101, 166, "ADF", "ADF1/ADF2 Select")
SA342:defineToggleSwitch("ADF_TONE_ON_OFF", SYNC_DEVICE_ID, 3102, 167, "ADF", "ADF Tone On/Off")
SA342:defineTumb("ADF_MODE", SYNC_DEVICE_ID, 3103, 178, 0.33, { 0, 1 }, nil, false, "ADF", "ADF Mode")
SA342:defineRotary("ADF_GAIN", SYNC_DEVICE_ID, 3104, 179, "ADF", "ADF Gain")
SA342:defineRotary("ADF_NAV1_100", SYNC_DEVICE_ID, 3105, 168, "ADF", "ADF NAV1 100s")
SA342:defineRotary("ADF_NAV1_10", SYNC_DEVICE_ID, 3106, 169, "ADF", "ADF NAV1 10s")
SA342:defineRotary("ADF_NAV1_1", SYNC_DEVICE_ID, 3107, 173, "ADF", "ADF NAV1 1s")
SA342:defineRotary("ADF_NAV2_100", SYNC_DEVICE_ID, 3108, 174, "ADF", "ADF NAV2 100s")
SA342:defineRotary("ADF_NAV2_10", SYNC_DEVICE_ID, 3109, 175, "ADF", "ADF NAV2 10s")
SA342:defineRotary("ADF_NAV2_1", SYNC_DEVICE_ID, 3110, 176, "ADF", "ADF NAV2 1s")

--NADIR
SA342:definePotentiometer("NADIR_ON_OFF_BRIGHTNESS", 22, 3001, 330, { 0, 1 }, "NADIR", "NADIR On/Off/Brightness")
SA342:defineTumb("NADIR_DOPPLER_MODE", 22, 3002, 331, 0.2, { 0, 1 }, nil, false, "NADIR", "NADIR Doppler Mode")
SA342:defineTumb("NADIR_PARAMETER", 22, 3003, 332, 0.2, { 0, 1 }, nil, false, "NADIR", "NADIR Parameter")
SA342:definePushButton("NADIR_ENTER_BUTTON", 22, 3004, 333, "NADIR", "NADIR Enter Button")
SA342:definePushButton("NADIR_DEST_BUTTON", 22, 3005, 334, "NADIR", "NADIR Destination Button")
SA342:definePushButton("NADIR_AUX_BUTTON", 22, 3006, 335, "NADIR", "NADIR Auxiliary Button")
SA342:definePushButton("NADIR_MAP_IND_BUTTON", 22, 3007, 336, "NADIR", "NADIR Map Indicator Button")
SA342:definePushButton("NADIR_DOWN_ARROW", 22, 3008, 337, "NADIR", "NADIR Down Arrow Button")
SA342:definePushButton("NADIR_0_BUTTON", 22, 3009, 351, "NADIR", "NADIR 0 Button")
SA342:definePushButton("NADIR_1_BUTTON", 22, 3010, 338, "NADIR", "NADIR 1 Button")
SA342:definePushButton("NADIR_2_BUTTON", 22, 3011, 339, "NADIR", "NADIR 2 Button")
SA342:definePushButton("NADIR_3_BUTTON", 22, 3012, 340, "NADIR", "NADIR 3 Button")
SA342:definePushButton("NADIR_4_BUTTON", 22, 3013, 342, "NADIR", "NADIR 4 Button")
SA342:definePushButton("NADIR_5_BUTTON", 22, 3014, 343, "NADIR", "NADIR 5 Button")
SA342:definePushButton("NADIR_6_BUTTON", 22, 3015, 344, "NADIR", "NADIR 6 Button")
SA342:definePushButton("NADIR_7_BUTTON", 22, 3016, 346, "NADIR", "NADIR 7 Button")
SA342:definePushButton("NADIR_8_BUTTON", 22, 3017, 347, "NADIR", "NADIR 8 Button")
SA342:definePushButton("NADIR_9_BUTTON", 22, 3018, 348, "NADIR", "NADIR 9 Button")
SA342:definePushButton("NADIR_POL_BUTTON", 22, 3019, 341, "NADIR", "NADIR POL Button")
SA342:definePushButton("NADIR_GEO_BUTTON", 22, 3020, 345, "NADIR", "NADIR GEO Button")
SA342:definePushButton("NADIR_POS_BUTTON", 22, 3021, 349, "NADIR", "NADIR POS Button")
SA342:definePushButton("NADIR_GEL_BUTTON", 22, 3022, 350, "NADIR", "NADIR GEL Button")
SA342:definePushButton("NADIR_EFF_BUTTON", 22, 3023, 352, "NADIR", "NADIR EFF Button")

--RWR
SA342:define3PosTumb("RWR_OFF_ON_CROC", SYNC_DEVICE_ID, 3061, 148, "RWR", "RWR Off/On/Croc")
SA342:definePushButton("RWR_MARKER", SYNC_DEVICE_ID, 3062, 149, "RWR", "RWR Marker")
SA342:definePushButton("RWR_PAGE", SYNC_DEVICE_ID, 3063, 150, "RWR", "RWR Page")
SA342:definePotentiometer("RWR_AUDIO", SYNC_DEVICE_ID, 3064, 121, { 0, 1 }, "RWR", "RWR Audio Volume")
SA342:definePotentiometer("RWR_BRIGHTNESS", SYNC_DEVICE_ID, 3065, 122, { 0, 1 }, "RWR", "RWR Brightness")

--Flare Dispenser
SA342:define3PosTumb("FLARE_DISP_SIDE_SELECT", 24, 3001, 220, "Flare Dispenser", "Flare Dispenser Side Selector D/G+D/G")
SA342:defineToggleSwitch("FLARE_DISPENSE_MODE", 24, 3002, 221, "Flare Dispenser", "Flare Dispense Mode")
SA342:define3PosTumb("FLARE_DISPENSER_OFF_ON", 24, 3003, 222, "Flare Dispenser", "Flare Dispenser Off/On/Speed Select")
SA342:defineToggleSwitch("FLARE_DISP_FIRE_CAP", 24, 3004, 194, "Flare Dispenser", "Flare Dispense Fire Button Cap")
SA342:definePushButton("FLARE_DISPENSE_BUTTON", 24, 3005, 195, "Flare Dispenser", "Flare Dispenser Fire Button")

--Weapons
SA342:define3PosTumb("WEAPONS_PANEL_1_OFF_ON_STBY", 25, 3004, 354, "Weapons", "Weapons Panel 1 Off/On/Standby")
SA342:definePotentiometer("WEAPONS_PANEL_1_DISP_BRIGHT", 25, 3009, 357, { 0, 1 }, "Weapons", "Weapons Panel 1 Display Brightness")
SA342:defineToggleSwitch("LEFT_MASTER_ARM", 25, 3010, 372, "Weapons", "Left Master Arm On/Off")
SA342:defineToggleSwitch("LEFT_MASTER_ARM_COVER", 25, 3011, 373, "Weapons", "Left Master Arm Cover")
SA342:defineToggleSwitch("RIGHT_MASTER_ARM", 25, 3012, 374, "Weapons", "Right Master Arm On/Off")
SA342:defineToggleSwitch("RIGHT_MASTER_ARM_COVER", 25, 3013, 375, "Weapons", "Right Master Arm Cover")
SA342:defineToggleSwitch("WEAPON_LAUNCH_SEQ", 25, 3014, 376, "Weapons", "Weapon Launch Sequence")
SA342:defineToggleSwitch("PILOT_SIGHT", 25, 3002, 171, "Weapons", "Pilot Sight")
SA342:defineToggleSwitch("WEAPONS_MASTER_ARM", 25, 3001, 269, "Weapons", "Weapons Master Arm On/Off")

--PH/HOT3
SA342:defineTumb("HOT3_PANEL_TEST_OFF_ON", 26, 3001, 180, 0.25, { 0, 1 }, nil, false, "HOT3", "HOT3 Panel Test/Off/On")
SA342:defineTumb("HOT3_STATION_SELECT", 26, 3002, 181, 0.125, { 0, 1 }, nil, false, "HOT3", "HOT3 Station Select")
SA342:definePotentiometer("HOT3_BRIGHTNESS", 26, 3003, 182, { 0, 1 }, "HOT3", "HOT3 Brightness")

--FM Radio
SA342:defineTumb("FM_RADIO_MODE", SYNC_DEVICE_ID, 3191, 272, 0.25, { 0, 1 }, nil, false, "FM Radio", "FM Radio Mode Select")
SA342:defineTumb("FM_RADIO_CHANNEL", SYNC_DEVICE_ID, 3192, 273, 0.143, { 0, 1 }, nil, false, "FM Radio", "FM Radio Channel Select")
SA342:definePushButton("FM_RADIO_BUTTON_7", 27, 3003, 274, "FM Radio", "FM Radio Button 7")
SA342:definePushButton("FM_RADIO_BUTTON_8", 27, 3004, 275, "FM Radio", "FM Radio Button 8")
SA342:definePushButton("FM_RADIO_BUTTON_9", 27, 3005, 276, "FM Radio", "FM Radio Button 9")
SA342:definePushButton("FM_RADIO_BUTTON_0", 27, 3006, 277, "FM Radio", "FM Radio Button 0")
SA342:definePushButton("FM_RADIO_BUTTON_X", 27, 3007, 278, "FM Radio", "FM Radio Button X")
SA342:definePushButton("FM_RADIO_BUTTON_4", 27, 3008, 279, "FM Radio", "FM Radio Button 4")
SA342:definePushButton("FM_RADIO_BUTTON_5", 27, 3009, 280, "FM Radio", "FM Radio Button 5")
SA342:definePushButton("FM_RADIO_BUTTON_6", 27, 3010, 281, "FM Radio", "FM Radio Button 6")
SA342:definePushButton("FM_RADIO_BUTTON_RC", 27, 3011, 282, "FM Radio", "FM Radio Button RC")
SA342:definePushButton("FM_RADIO_BUTTON_UP", 27, 3012, 283, "FM Radio", "FM Radio Button UP")
SA342:definePushButton("FM_RADIO_BUTTON_1", 27, 3013, 284, "FM Radio", "FM Radio Button 1")
SA342:definePushButton("FM_RADIO_BUTTON_2", 27, 3014, 285, "FM Radio", "FM Radio Button 2")
SA342:definePushButton("FM_RADIO_BUTTON_3", 27, 3015, 286, "FM Radio", "FM Radio Button 3")
SA342:definePushButton("FM_RADIO_BUTTON_VAL", 27, 3016, 287, "FM Radio", "FM Radio Button VAL")
SA342:definePushButton("FM_RADIO_BUTTON_DOWN", 27, 3017, 288, "FM Radio", "FM Radio Button DOWN")

--UHF Radio
SA342:defineTumb("UHF_RADIO_MODE", SYNC_DEVICE_ID, 3161, 383, 0.167, { 0, 1 }, nil, false, "UHF Radio", "UHF Radio Mode Select")
SA342:definePushButton("UHF_RADIO_BUTTON_DRW", 30, 3002, 384, "UHF Radio", "UHF Radio Button DRW")
SA342:definePushButton("UHF_RADIO_BUTTON_VLD", SYNC_DEVICE_ID, 3163, 385, "UHF Radio", "UHF Radio Button VLD")
SA342:defineRotary("UHF_PAGE_KNOB", 30, 3004, 386, "UHF Radio", "UHF Radio Page Knob")
SA342:definePushButton("UHF_RADIO_BUTTON_CONF", 30, 3005, 387, "UHF Radio", "UHF Radio Button CONF")
SA342:definePushButton("UHF_RADIO_BUTTON_1", SYNC_DEVICE_ID, 3166, 388, "UHF Radio", "UHF Radio Button 1")
SA342:definePushButton("UHF_RADIO_BUTTON_2", SYNC_DEVICE_ID, 3167, 389, "UHF Radio", "UHF Radio Button 2")
SA342:definePushButton("UHF_RADIO_BUTTON_3", SYNC_DEVICE_ID, 3168, 390, "UHF Radio", "UHF Radio Button 3")
SA342:definePushButton("UHF_RADIO_BUTTON_4", SYNC_DEVICE_ID, 3169, 391, "UHF Radio", "UHF Radio Button 4")
SA342:definePushButton("UHF_RADIO_BUTTON_5", SYNC_DEVICE_ID, 3170, 392, "UHF Radio", "UHF Radio Button 5")
SA342:definePushButton("UHF_RADIO_BUTTON_6", SYNC_DEVICE_ID, 3171, 393, "UHF Radio", "UHF Radio Button 6")
SA342:definePushButton("UHF_RADIO_BUTTON_7", SYNC_DEVICE_ID, 3172, 394, "UHF Radio", "UHF Radio Button 7")
SA342:definePushButton("UHF_RADIO_BUTTON_8", SYNC_DEVICE_ID, 3173, 395, "UHF Radio", "UHF Radio Button 8")
SA342:definePushButton("UHF_RADIO_BUTTON_9", SYNC_DEVICE_ID, 3174, 396, "UHF Radio", "UHF Radio Button 9")
SA342:definePushButton("UHF_RADIO_BUTTON_0", SYNC_DEVICE_ID, 3175, 397, "UHF Radio", "UHF Radio Button 0")

--Indicator Lights
SA342:defineIndicatorLight("FD_LAMP_VE", 233, "Indicator Lights", "FD Lamp VE (yellow)")
SA342:defineIndicatorLight("FD_LAMP_G_OPE", 231, "Indicator Lights", "FD Lamp G OPE (green)")
SA342:defineIndicatorLight("FD_LAMP_D_OPE", 232, "Indicator Lights", "FD Lamp D OPE (green)")
SA342:defineIndicatorLight("FD_LAMP_LEU", 227, "Indicator Lights", "FD Lamp LEU (green)")
SA342:defineIndicatorLight("FD_LAMP_G_VIDE1", 223, "Indicator Lights", "FD Lamp G Vide1 (yellow)")
SA342:defineIndicatorLight("FD_LAMP_G_VIDE2", 224, "Indicator Lights", "FD Lamp G Vide2 (yellow)")
SA342:defineIndicatorLight("FD_LAMP_D_VIDE1", 225, "Indicator Lights", "FD Lamp D Vide1 (yellow)")
SA342:defineIndicatorLight("FD_LAMP_D_VIDE2", 226, "Indicator Lights", "FD Lamp D Vide2 (yellow)")
SA342:defineIndicatorLight("RADAR_ALT_ALARM_LAMP", 97, "Indicator Lights", "Radar Altimeter Alarm Lamp (red)")
SA342:defineIndicatorLight("AM_RADIO_LAMP", 141, "Indicator Lights", "AM Radio Lamp (green)")
SA342:defineIndicatorLight("RWR_LIGHT", 196, "Indicator Lights", "RWR Backlight  (green)")
SA342:defineIndicatorLight("GYRO_TEST_LAMP", 201, "Indicator Lights", "Gyro Test Lamp (green)")
SA342:defineIndicatorLight("GYRO_TRIM_WARNING_LAMP", 202, "Indicator Lights", "Gyro Trim Warning Lamp (yellow)")
SA342:defineIndicatorLight("GYRO_BPP_WARNING_LAMP", 203, "Indicator Lights", "Gyro BPP Warning Lamp (yellow)")
SA342:defineIndicatorLight("TORQUE_WARNING_LAMP", 17, "Indicator Lights", "Torque Warning Lamp (red)")
SA342:defineIndicatorLight("DEM_START_LAMP", 300, "Indicator Lights", "DEM Start Lamp (green)")
SA342:defineIndicatorLight("RLT_IDLE_LAMP", 301, "Indicator Lights", "RLT Idle Lamp (yellow)")
SA342:defineIndicatorLight("BLOCKED_ENGINE_WARNING_LAMP", 302, "Indicator Lights", "Block Engine Warning Lamp (red)")
SA342:defineIndicatorLight("ADDITIONAL_FUEL_TANK_LAMP", 320, "Indicator Lights", "Additional Fuel Tank Lamp (red)")
SA342:defineIndicatorLight("CONVOY_FUEL_TANK_LAMP", 321, "Indicator Lights", "Convoy Fuel Tank Lamp (red)")
SA342:defineIndicatorLight("SAND_FILTER_LAMP", 322, "Indicator Lights", "Sand Filter Lamp (green)")
SA342:defineIndicatorLight("ALARM_WARNING_LAMP", 303, "Indicator Lights", "Alarm Warning Lamp (red)")
SA342:defineIndicatorLight("TV_LAMP", 127, "Indicator Lights", "TV Lamp (green)")
SA342:defineIndicatorLight("WP2_LEFT_LAMP", 377, "Indicator Lights", "Weapons Panel 2 Left Lamp (green)")
SA342:defineIndicatorLight("WP2_RIGHT_LAMP", 378, "Indicator Lights", "Weapons Panel 2 Right Lamp (green)")

--Warning Panel
SA342:defineIndicatorLight("PITOT_TUBE_WARNING", 1, "Warning Panel", "Pitot Tube Warning (red)")
SA342:defineIndicatorLight("TURBINE_OIL_PRESSURE", 2, "Warning Panel", "Turbine Oil Pressure Warning (red)")
SA342:defineIndicatorLight("ROTOR_OIL_PRESSURE", 3, "Warning Panel", "Main Rotor Oil Pressure Warning (red)")
SA342:defineIndicatorLight("LOW_TURBINE_RPM", 4, "Warning Panel", "Low Turbine RPM Warning (red)")
SA342:defineIndicatorLight("GENERATOR_WARNING", 5, "Warning Panel", "Generator Warning (red)")
SA342:defineIndicatorLight("ALTERNATOR_WARNING", 6, "Warning Panel", "Alternator Warning (red)")
SA342:defineIndicatorLight("BATTERY_WARNING", 7, "Warning Panel", "Battery Warning (red)")
SA342:defineIndicatorLight("AUTOPILOT", 8, "Warning Panel", "Autopilot Warning (red)")
SA342:defineIndicatorLight("AC_115V_BUS_NAV", 9, "Warning Panel", "AC 115 V Bus/NAV Warning (red)")
SA342:defineIndicatorLight("LOW_FUEL", 10, "Warning Panel", "Low Fuel Warning (red)")
SA342:defineIndicatorLight("LOW_ROTOR_RPM", 11, "Warning Panel", "Low Rotor RPM Warning (red)")
SA342:defineIndicatorLight("CHIPS_IN_OIL", 12, "Warning Panel", "Chips In Oil Warning (red)")
SA342:defineIndicatorLight("SAND_FILTER_WARNING", 13, "Warning Panel", "Sand Filter Warning (red)")

--Raw Guage Values
SA342:defineFloat("GYRO_NEEDLE", 200, { -1, 1 }, "Raw Gauge Values", "Gyro Needle")
SA342:defineFloat("PITCH_NEEDLE", 37, { -1, 1 }, "Raw Gauge Values", "Pitch Needle")
SA342:defineFloat("ROLL_NEEDLE", 38, { -1, 1 }, "Raw Gauge Values", "Roll Needle")
SA342:defineFloat("YAW_NEEDLE", 39, { -1, 1 }, "Raw Gauge Values", "Yaw Needle")
SA342:defineFloat("TV_BRIGHTNESS_VALUE", 371, { 0, 1 }, "Raw Gauge Values", "TV Brightness")
SA342:defineFloat("NADIR_BRIGHTNESS", 353, { 0, 1 }, "Raw Gauge Values", "NADIR Brightness")
SA342:defineFloat("ADF_NAV1_FREQ_100S", 158, { 0, 1 }, "Raw Gauge Values", "ADF NAV1 Frequency 100s")
SA342:defineFloat("ADF_NAV1_FREQ_10S", 159, { 0, 1 }, "Raw Gauge Values", "ADF NAV1 Frequency 10s")
SA342:defineFloat("ADF_NAV1_FREQ_1S", 160, { 0, 1 }, "Raw Gauge Values", "ADF NAV1 Frequency 1s")
SA342:defineFloat("ADF_NAV1_FREQ_DECIMAL", 161, { 0, 1 }, "Raw Gauge Values", "ADF NAV1 Frequency Decimal")
SA342:defineFloat("ADF_NAV2_FREQ_100S", 162, { 0, 1 }, "Raw Gauge Values", "ADF NAV2 Frequency 100s")
SA342:defineFloat("ADF_NAV2_FREQ_10S", 163, { 0, 1 }, "Raw Gauge Values", "ADF NAV2 Frequency 10s")
SA342:defineFloat("ADF_NAV2_FREQ_1S", 164, { 0, 1 }, "Raw Gauge Values", "ADF NAV2 Frequency 1s")
SA342:defineFloat("ADF_NAV2_FREQ_DECIMAL", 165, { 0, 1 }, "Raw Gauge Values", "ADF NAV2 Frequency Decimal")
SA342:defineFloat("ADF_BACKGROUND", 113, { 0, 1 }, "Raw Gauge Values", "ADF Background")
SA342:defineFloat("ADF_NADIR_NEEDLE", 102, { -1, 1 }, "Raw Gauge Values", "ADF NADIR Needle")
SA342:defineFloat("ADF_SMALL_NEEDLE", 103, { -1, 1 }, "Raw Gauge Values", "ADF Small Needle")
SA342:defineFloat("ADF_FLAG_CAP", 107, { 0, 1 }, "Raw Gauge Values", "ADF Flag CAP")
SA342:defineFloat("ADF_FLAG_BUT", 109, { 0, 1 }, "Raw Gauge Values", "ADF Flag But")
SA342:defineFloat("ADF_FLAG_COUNTER", 108, { 0, 1 }, "Raw Gauge Values", "ADF Flag Counter")
SA342:defineFloat("ADF_DISTANCE_100S", 110, { 0, 1 }, "Raw Gauge Values", "ADF Distance 100s")
SA342:defineFloat("ADF_DISTANCE_10S", 111, { 0, 1 }, "Raw Gauge Values", "ADF Distance 10s")
SA342:defineFloat("ADF_DISTANCE_1S", 112, { 0, 1 }, "Raw Gauge Values", "ADF Distance 1s")
SA342:defineFloat("CLOCK_HOUR", 41, { 0, 1 }, "Raw Gauge Values", "Clock Hour")
SA342:defineFloat("CLOCK_MINUTE", 43, { 0, 1 }, "Raw Gauge Values", "Clock Minute")
SA342:defineFloat("CLOCK_SECOND", 42, { 0, 1 }, "Raw Gauge Values", "Clock Second")
SA342:defineFloat("CLOCK_MINI", 44, { 0, 1 }, "Raw Gauge Values", "Clock Mini")
SA342:defineFloat("WIPERS_PILOT", 547, { -1, 1 }, "Raw Gauge Values", "Wipers Pilot")
SA342:defineFloat("WIPERS_COPILOT", 546, { -1, 1 }, "Raw Gauge Values", "Wipers Copilot")
SA342:defineFloat("ROOF_LIGHT", 40, { 0, 1 }, "Raw Gauge Values", "Roof Light")
SA342:defineFloat("MAIN_PANEL_LIGHT", 142, { 0, 1 }, "Raw Gauge Values", "Main Panel Light")
SA342:defineFloat("CENTER_CONSOLE_LIGHT", 144, { 0, 1 }, "Raw Gauge Values", "Center Console Light")
SA342:defineFloat("BARO_ALT_THOUSANDS", 87, { 0, 1 }, "Raw Gauge Values", "Baro Altimeter 1000s")
SA342:defineFloat("BARO_ALT_HUNDREDS", 573, { 0, 1 }, "Raw Gauge Values", "Baro Altimeter 100s")
SA342:defineFloat("BARO_PRESSURE_UNITS", 88, { 0, 1 }, "Raw Gauge Values", "Baro Pressure 1s")
SA342:defineFloat("BARO_PRESSURE_TENS", 90, { 0, 1 }, "Raw Gauge Values", "Baro Pressure 10s")
SA342:defineFloat("BARO_PRESSURE_HUNDREDS", 92, { 0, 1 }, "Raw Gauge Values", "Baro Pressure 100s")
SA342:defineFloat("BARO_PRESSURE_THOUSANDS", 95, { 0, 1 }, "Raw Gauge Values", "Baro Pressure 1000s")
SA342:defineFloat("RADAR_ALTIMETER", 94, { 0.0, 0.87 }, "Raw Gauge Values", "Radar Altimeter (raw)")
SA342:defineFloat("RADAR_ALTIMETER_BUG", 93, { 0.0, 0.8693 }, "Raw Gauge Values", "Radar Altimeter Bug")
SA342:defineFloat("RADAR_ALT_FLAG_PENNE", 98, { 0, 1 }, "Raw Gauge Values", "Radar Altimeter Flag Panne")
SA342:defineFloat("RADAR_ALT_FLAG_ON_OFF", 99, { 0, 1 }, "Raw Gauge Values", "Radar Altimeter Flag On/Off")
SA342:defineFloat("RADAR_ALT_KNOB", 91, { 0, 1 }, "Raw Gauge Values", "Radar Altimeter Knob")
SA342:defineFloat("TORQUE_NEEDLE", 16, { 0.085, 0.908 }, "Raw Gauge Values", "Torque Needle")
SA342:defineFloat("TORQUE_BUG", 55, { 0.084, 0.91 }, "Raw Gauge Values", "Torque Bug")
SA342:defineFloat("GYRO_COMPASS_HEADING", 26, { 0, 1 }, "Raw Gauge Values", "Gyro Compass Heading")
SA342:defineFloat("STBY_ART_HOR_ROLL", 214, { -1, 1 }, "Raw Gauge Values", "Standby Artificial Horizon Roll")
SA342:defineFloat("STBY_ART_HOR_PITCH", 213, { -1, 1 }, "Raw Gauge Values", "Standby Artificial Horizon Pitch")
SA342:defineFloat("STBY_ART_HOR_FLAG", 211, { 0, 1 }, "Raw Gauge Values", "Standby Artificial Horizon Flag")
SA342:defineFloat("STBY_ART_HOR_W", 212, { 0, 1 }, "Raw Gauge Values", "Standby Artificial Horizon W")
SA342:defineFloat("STBY_ART_HOR_CURSEUR", 217, { 0, 1 }, "Raw Gauge Values", "Standby Artificial Horizon Curseur")
SA342:defineFloat("FUEL", 137, { 0.093, 0.932 }, "Raw Gauge Values", "Fuel")
SA342:defineFloat("ART_HORIZ_PITCH", 27, { -1, 1 }, "Raw Gauge Values", "Artificial Horizon Pitch")
SA342:defineFloat("ART_HORIZ_ROLL", 28, { -1, 1 }, "Raw Gauge Values", "Artificial Horizon Roll")
SA342:defineFloat("ART_HORIZ_BALL", 20, { -1, 1 }, "Raw Gauge Values", "Artificial Horizon Ball")
SA342:defineFloat("ART_HORIZ_FLAG_GS", 18, { 0, 1 }, "Raw Gauge Values", "Artificial Horizon Flag GS")
SA342:defineFloat("ART_HORIZ_FLAG_HS", 19, { 0, 1 }, "Raw Gauge Values", "Artificial Horizon Flag HS")
SA342:defineFloat("ART_HORIZ_FLAG_LOC", 29, { 0, 1 }, "Raw Gauge Values", "Artificial Horizon Flag LOC")
SA342:defineFloat("ART_HORIZ_CURSEUR", 117, { 0, 1 }, "Raw Gauge Values", "Artificial Horizon Curseur")
SA342:defineFloat("ART_HORIZ_W", 120, { -1, 1 }, "Raw Gauge Values", "Artificial Horizon W")
SA342:defineFloat("ART_HORIZ_VERT_BAR", 118, { -1, 1 }, "Raw Gauge Values", "Artificial Horizon Vertical Bar")
SA342:defineFloat("ART_HORIZ_HORIZONTAL_BAR", 119, { -1, 1 }, "Raw Gauge Values", "Artificial Horizon Horizontal Bar")
SA342:defineFloat("VARIOMETER_VVI", 24, { -0.481, 0.463 }, "Raw Gauge Values", "Variometer Vertical Velocity VVI")
SA342:defineFloat("IND_AIR_SPEED_IAS", 51, { 0, 0.886 }, "Raw Gauge Values", "Indicated Air Speed IAS")
SA342:defineFloat("TURBINE_RPM", 135, { 0.095, 0.909 }, "Raw Gauge Values", "Turbine RPM")
SA342:defineFloat("ROTOR_RPM", 52, { 0.096, 0.904 }, "Raw Gauge Values", "Rotor RPM")
SA342:defineFloat("VOLT_METER", 14, { 0.045, 0.724 }, "Raw Gauge Values", "Volt Meter")
SA342:defineFloat("QUATRE", 15, { 0.1575, 0.8625 }, "Raw Gauge Values", "Quatre")
SA342:defineFloat("TEMP_EXTERNAL", 25, { -0.758, 0.712 }, "Raw Gauge Values", "External Temperature")
SA342:defineFloat("TEMP_ENGINE_OIL", 151, { 0.046, 0.715 }, "Raw Gauge Values", "Engine Oil Temperature")
SA342:defineFloat("AUX_FUEL_TANK", 152, { 0, 1 }, "Raw Gauge Values", "Auxiliary Fuel Tank")
SA342:defineFloat("AM_RADIO_FREQ_100S", 133, { 0, 1 }, "Raw Gauge Values", "AM Radio Frequency 100s")
SA342:defineFloat("AM_RADIO_FREQ_10S", 134, { 0, 1 }, "Raw Gauge Values", "AM Radio Frequency 10s")
SA342:defineFloat("AM_RADIO_FREQ_1S", 136, { 0, 1 }, "Raw Gauge Values", "AM Radio Frequency 1s")
SA342:defineFloat("AM_RADIO_FREQ_TENTHS", 138, { 0, 1 }, "Raw Gauge Values", "AM Radio Frequency Tenths")
SA342:defineFloat("AM_RADIO_FREQ_HUNDREDTHS", 139, { 0, 1 }, "Raw Gauge Values", "AM Radio Frequency Hundredths")

--Actual Gauge Values
local function getHDG(dev0)
	local returnValue = (dev0:get_argument_value(26)) * 360
	return returnValue
end
SA342:defineIntegerFromGetter("HEADING_VALUE", getHDG, 65000, "Gauge Values", "Heading Value")

local function getNADIR(dev0)
	local a = (dev0:get_argument_value(26)) * 360
	local b
	local c
	local d = (dev0:get_argument_value(102))
	if d < 0 then
		b = 360 - (d * -360)
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
SA342:defineIntegerFromGetter("NADIR_HEADING_VALUE", getNADIR, 65000, "Gauge Values", "NADIR Heading Value")

local function getADFHDG(dev0)
	local e
	local f
	local g = (dev0:get_argument_value(26)) * 360
	local h = (dev0:get_argument_value(103))
	if h < 0 then
		e = 360 - (h * -360)
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
SA342:defineIntegerFromGetter("ADF_HEADING_VALUE", getADFHDG, 65000, "Gauge Values", "ADF Heading Value")

local function getADFDIST(dev0)
	local cent = (dev0:get_argument_value(110)) * 1000
	local dix = (dev0:get_argument_value(111)) * 100
	local unit = (dev0:get_argument_value(112)) * 10
	local dist = cent + dix + unit
	return dist
end
SA342:defineIntegerFromGetter("ADF_DISTANCE_VALUE", getADFDIST, 65000, "Gauge Values", "ADF Distance Value")

local function getBAROALT(dev0)
	return dev0:get_argument_value(87) * 10000
end
SA342:defineIntegerFromGetter("BARO_ALT_VALUE", getBAROALT, 65000, "Gauge Values", "Barometric Altimeter Value")

local function getBAROPRESS(dev0)
	local baromille = (dev0:get_argument_value(95)) * 10000
	local barocent = (dev0:get_argument_value(92)) * 1000
	local barodix = (dev0:get_argument_value(90)) * 100
	local barounit = (dev0:get_argument_value(88)) * 10
	local baro = baromille + barocent + barodix + barounit
	return baro
end
SA342:defineIntegerFromGetter("BARO_PRESS_VALUE", getBAROPRESS, 65000, "Gauge Values", "Barometric Pressure Value")

local function getRADALT(dev0)
	local returnValue = (-2775.9 * (dev0:get_argument_value(94)) ^ 5) + (8414.8 * (dev0:get_argument_value(94)) ^ 4) - (5860 * (dev0:get_argument_value(94)) ^ 3) + (1495.4 * (dev0:get_argument_value(94)) ^ 2) + (153.05 * (dev0:get_argument_value(94))) + 1.4913
	return returnValue
end
SA342:defineIntegerFromGetter("RADAR_ALT_VALUE", getRADALT, 65000, "Gauge Values", "Radar Altimeter Value")

local function getTORQUE(dev0)
	local returnValue = (-66.873 * (dev0:get_argument_value(16)) ^ 3) + (103.7 * (dev0:get_argument_value(16)) ^ 2) + (91.562 * (dev0:get_argument_value(16))) - 8.5301
	return returnValue
end
SA342:defineIntegerFromGetter("TORQUE_VALUE", getTORQUE, 65000, "Gauge Values", "Torque Value")

local function getFUEL(dev0)
	local returnValue = (-8880.7 * (dev0:get_argument_value(137)) ^ 6)
		+ (27939 * (dev0:get_argument_value(137)) ^ 5)
		- (32540 * (dev0:get_argument_value(137)) ^ 4)
		+ (17294 * (dev0:get_argument_value(137)) ^ 3)
		- (3852.5 * (dev0:get_argument_value(137)) ^ 2)
		+ (654.65 * (dev0:get_argument_value(137)))
		- 39.142
	return returnValue
end
SA342:defineIntegerFromGetter("FUEL_LEVEL_VALUE", getFUEL, 65000, "Gauge Values", "Fuel Level Value")

local function getIAS(dev0)
	local returnValue = (-605.35 * (dev0:get_argument_value(51)) ^ 4) + (1206.9 * (dev0:get_argument_value(51)) ^ 3) - (586.3 * (dev0:get_argument_value(51)) ^ 2) + (379.6 * (dev0:get_argument_value(51))) + 26.91
	return returnValue
end
SA342:defineIntegerFromGetter("IAS_VALUE", getIAS, 65000, "Gauge Values", "Airspeed IAS Value")

local function getTURBRPM(dev0)
	local returnValue = (35495 * (dev0:get_argument_value(135)) ^ 4) - (81489 * (dev0:get_argument_value(135)) ^ 3) + (62975 * (dev0:get_argument_value(135)) ^ 2) + (43447 * (dev0:get_argument_value(135))) - 4572.9
	return returnValue
end
SA342:defineIntegerFromGetter("TURBINE_RPM_VALUE", getTURBRPM, 65000, "Gauge Values", "Turbine RPM Value")

local function getROTRPM(dev0)
	local returnValue = (234.39 * (dev0:get_argument_value(52)) ^ 4) - (524.36 * (dev0:get_argument_value(52)) ^ 3) + (413.16 * (dev0:get_argument_value(52)) ^ 2) + (428.23 * (dev0:get_argument_value(52))) - 44.168
	return returnValue
end
SA342:defineIntegerFromGetter("ROTOR_RPM_VALUE", getROTRPM, 65000, "Gauge Values", "Rotor RPM Value")

SA342:defineIndicatorLight("HOT3_BON_LAMP", 183, "Indicator Lights", "HOT3 Panel BON Lamp (green)")
SA342:defineIndicatorLight("HOT3_MAUVAIS_LAMP", 184, "Indicator Lights", "HOT3 Panel MAUVAIS Lamp (red)")
SA342:defineIndicatorLight("HOT3_ALIM_LAMP", 185, "Indicator Lights", "HOT3 Panel ALIM Lamp (green)")
SA342:defineIndicatorLight("HOT3_PRET_LAMP", 186, "Indicator Lights", "HOT3 Panel PRET Lamp (blue)")
SA342:defineIndicatorLight("HOT3_AUTOR_LAMP", 187, "Indicator Lights", "HOT3 Panel AUTOR Lamp (green)")
SA342:defineIndicatorLight("HOT3_DEFAUT_LAMP", 188, "Indicator Lights", "HOT3 Panel DEFAUT Lamp (red)")
SA342:defineIndicatorLight("HOT3_TEST1_LAMP", 189, "Indicator Lights", "HOT3 Panel TEST 1 Lamp (blue)")
SA342:defineIndicatorLight("HOT3_JOUR_LAMP", 190, "Indicator Lights", "HOT3 Panel JOUR Lamp (green)")
SA342:defineIndicatorLight("HOT3_LUM_LAMP", 191, "Indicator Lights", "HOT3 Panel LUM Lamp (yellow)")
SA342:defineIndicatorLight("HOT3_TEST2_LAMP", 192, "Indicator Lights", "HOT3 Panel TEST 2 Lamp (blue)")
SA342:defineIndicatorLight("HOT3_NUIT_LAMP", 193, "Indicator Lights", "HOT3 Panel NUIT Lamp (green)")

--Externals
SA342:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
SA342:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
SA342:defineBitFromDrawArgument("EXT_STROBE", 193, "External Aircraft Model", "Strobe Light")
SA342:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR", 37, "External Aircraft Model", "Rotor Move")

SA342:definePushButton("VHF_AM_RADIO_VOL_1_P", SYNC_DEVICE_ID, 3241, 452, "Intercom", "VHF AM Radio Volume 1 (Push)")
SA342:definePushButton("FM_RADIO_VOL_1_P", SYNC_DEVICE_ID, 3242, 453, "Intercom", "FM Radio Volume 1 (Push)")
SA342:definePushButton("UHF_RADIO_VOL_1_P", SYNC_DEVICE_ID, 3243, 454, "Intercom", "UHF Radio Volume 1 (Push)")
SA342:definePushButton("VHF_AM_RADIO_VOL_2_P", SYNC_DEVICE_ID, 3271, 455, "Intercom", "VHF AM Radio Volume 2 (Push)")
SA342:definePushButton("FM_RADIO_VOL_2_P", SYNC_DEVICE_ID, 3272, 456, "Intercom", "FM Radio Volume 2 (Push)")
SA342:definePushButton("UHF_RADIO_VOL_2_P", SYNC_DEVICE_ID, 3273, 457, "Intercom", "UHF Radio Volume 2 (Push)")

SA342:defineFloat("DOOR_POS_L", 532, { 0, 1 }, "Cockpit", "Door Position Left")
SA342:defineFloat("DOOR_POS_R", 533, { 0, 1 }, "Cockpit", "Door Position Right")

SA342:defineSpringloaded_3PosTumb("WEAPONS_PANEL_1_ARROW", 25, 3446, 3444, 355, "Weapons", "Weapons Panel 1 Arrow")
SA342:defineSpringloaded_3PosTumb("WEAPONS_PANEL_1_VALUE", 25, 3446, 3444, 355, "Weapons", "Weapons Panel 1 Value")
SA342:defineToggleSwitch("PILOT_SIGHT_SHOW", 25, 3036, 600, "Weapons", "Show/Hide Pilot Sight")

--IFF

local IFF_DEVICE_ID = 40

SA342:defineMultipositionSwitch("IFF_CODE", IFF_DEVICE_ID, 3007, 244, 4, 0.33, "IFF", "IFF Code")
SA342:defineMultipositionSwitch("IFF_MASTER", IFF_DEVICE_ID, 3008, 245, 4, 0.33, "IFF", "IFF Master")
SA342:defineTumb("IFF_M1_D1", IFF_DEVICE_ID, 3001, 234, 10, { 0, 1 }, nil, false, "IFF", "IFF Mode 1 Digit 1")
SA342:defineTumb("IFF_M1_D2", IFF_DEVICE_ID, 3002, 235, 10, { 0, 1 }, nil, false, "IFF", "IFF Mode 1 Digit 2")
SA342:defineTumb("IFF_M3A_D1", IFF_DEVICE_ID, 3003, 236, 10, { 0, 1 }, nil, false, "IFF", "IFF Mode 3A Digit 1")
SA342:defineTumb("IFF_M3A_D2", IFF_DEVICE_ID, 3004, 237, 10, { 0, 1 }, nil, false, "IFF", "IFF Mode 3A Digit 2")
SA342:defineTumb("IFF_M3A_D3", IFF_DEVICE_ID, 3005, 238, 10, { 0, 1 }, nil, false, "IFF", "IFF Mode 3A Digit 3")
SA342:defineTumb("IFF_M3A_D4", IFF_DEVICE_ID, 3006, 239, 10, { 0, 1 }, nil, false, "IFF", "IFF Mode 3A Digit 4")
SA342:define3PosTumb("IFF_IDENT_OFF_MIC", IFF_DEVICE_ID, 3015, 240, "IFF", "IFF IDENT/OFF/MIC")
SA342:defineToggleSwitch("IFF_IDENT_PW", IFF_DEVICE_ID, 3016, 246, "IFF", "IFF Power ON/OFF")
SA342:define3PosTumb("IFF_ANT", IFF_DEVICE_ID, 3019, 247, "IFF", "IFF Antenna")
SA342:defineToggleSwitch("IFF_TEST_M1", IFF_DEVICE_ID, 3010, 248, "IFF", "IFF Test M-1")
SA342:defineToggleSwitch("IFF_TEST_M2", IFF_DEVICE_ID, 3011, 249, "IFF", "IFF Test M-2")
SA342:defineToggleSwitch("IFF_TEST_M3A", IFF_DEVICE_ID, 3012, 250, "IFF", "IFF Test M-3A")
SA342:defineToggleSwitch("IFF_TEST_MC", IFF_DEVICE_ID, 3013, 251, "IFF", "IFF Test M-C")
SA342:defineIndicatorLight("IFF_TEST_L", 252, "Indicator Lights", "IFF Test Lamp (green)")

--ATHOS

local ATHOS_DEVICE_ID = 39

SA342:defineToggleSwitch("ATHOS", ATHOS_DEVICE_ID, 3011, 172, "ATHOS", "Deploy/Stow Periscope")
SA342:defineToggleSwitch("PCB_ZOOM", ATHOS_DEVICE_ID, 3008, 590, "ATHOS", "PCB Zoom Toggle")
SA342:defineMultipositionSwitch("PCB_RETICLE", SYNC_DEVICE_ID, 3352, 591, 4, 0.33, "ATHOS", "PCB Reticle Selector")
SA342:defineToggleSwitch("PCB_STABI", SYNC_DEVICE_ID, 3353, 592, "ATHOS", "PCB Stabilization ON/OFF")
SA342:defineToggleSwitch("PCB_WIPER", SYNC_DEVICE_ID, 3354, 593, "ATHOS", "PCB Wipers ON/OFF")

--OTHER
SA342:defineToggleSwitch("COLLECTIVE_SHOW", 25, 3037, 601, "Flight Controls", "Show/Hide Collective")

--MINIGUN

local MINIGUN_IZLID_DEVICE_ID = 41

SA342:definePushButton("MG_SIGHT_BRIGHT_INC", MINIGUN_IZLID_DEVICE_ID, 3001, 597, "Minigun", "Sight Brightness Increase/On")
SA342:definePushButton("MG_SIGHT_BRIGHT_DEC", MINIGUN_IZLID_DEVICE_ID, 3002, 598, "Minigun", "Sight Brightness Decrease/Off")
SA342:defineToggleSwitch("MG_IZLID_PW", MINIGUN_IZLID_DEVICE_ID, 3003, 596, "Minigun", "IZLID On/Off")
SA342:defineToggleSwitch("MG_SAFE", 25, 3039, 606, "Minigun", "Minigun Safety Armed/Safe")
SA342:defineToggleSwitch("MG_SAFE_CVR", 25, 3040, 605, "Minigun", "Minigun Safety Cover")

--Tablet

local TABLET_DEVICE_ID = 42

SA342:definePushButton("TABLET_PW", TABLET_DEVICE_ID, 3001, 0, "Tablet", "Tablet Power (no output)")
SA342:define3PosTumb("TABLET_SCREEN", TABLET_DEVICE_ID, 3002, 0, "Tablet", "Tablet Screen (no output)")
SA342:definePushButton("TABLET_SHOW", TABLET_DEVICE_ID, 3003, 0, "Tablet", "Deploy/Stow Tablet (no output)")
SA342:definePushButton("TABLET_BRIGHT_INC", TABLET_DEVICE_ID, 3004, 0, "Tablet", "Tablet Brightness Increase (no output)")
SA342:definePushButton("TABLET_BRIGHT_DEC", TABLET_DEVICE_ID, 3005, 0, "Tablet", "Tablet Brightness Decrease (no output)")
SA342:definePushButton("TABLET_ZOOM_INC", TABLET_DEVICE_ID, 3006, 0, "Tablet", "Tablet Zoom Increase (no output)")
SA342:definePushButton("TABLET_ZOOM_DEC", TABLET_DEVICE_ID, 3007, 0, "Tablet", "Tablet Zoom Decrease (no output)")

SA342:defineReadWriteRadio("AM_RADIO", 5, 7, 3, 1000, "AM Radio")
SA342:defineReadWriteRadio("FM_RADIO", 27, 7, 3, 1000, "FM Radio")
SA342:defineReadWriteRadio("UHF_RADIO", 30, 7, 3, 1000, "UHF Radio")

SA342:defineToggleSwitch("LASER_POWER", SYNC_DEVICE_ID, 3286, 367, "PE", "Deprecated - use VCB_POWER instead")

return SA342
