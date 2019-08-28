BIOS.protocol.beginModule("AJS37", 0x4600)
BIOS.protocol.setExportModuleAircrafts({"AJS37"})

local inputProcessors = moduleBeingDefined.inputProcessors
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
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter


--[[--Weapon System--]]--
defineToggleSwitch("TRIGGER_SAFETY_BRACKET", 2, 3300, 8, "Weapon System", "Trigger Safety Bracket")
defineToggleSwitch("WEAPON_RELEASE_COVER", 2, 3302, 260, "Weapon System", "Weapon Emergency Release Cover")
definePushButton("WEAPON_RELEASE", 2, 3303, 261, "Weapon System", "Weapon Emergency Release Button")
defineToggleSwitch("TANK_RELEASE_COVER", 2, 3402, 262, "Weapon System", "External Tank Release Cover")
definePushButton("TANK_RELEASE", 2, 3320, 263, "Weapon System", "External Tank Release Button")
defineTumb("WEAPON_SELECT", 2, 3304, 264, 0.1, {0.0, 0.5}, nil, false, "Weapon System", "Weapon Selector Knob")
defineTumb("WEAPON_INTERVAL", 2, 3305, 265, 0.1, {0.0, 1.0}, nil, false, "Weapon System", "Weapon Interval Selector Mode Knob")
defineToggleSwitch("WEAPON_REL_MODE", 2, 3306, 266, "Weapon System", "Weapon Release Mode Switch")
defineToggleSwitch("RB_BK_REL_MODE",2, 3307, 267, "Weapon System", "RB-04/RB-15/BK Release Mode Switch")

--[[--Radar--]]--
defineTumb("ANTI_JAM_MODE", 5, 3208, 217, 0.1, {0.0, 0.7}, nil, false, "Radar", "Anti Jamming Mode (AS) Selector")
defineToggleSwitch("RADAR_GAIN", 5, 3209, 214, "Radar", "Lin/Log Radar Gain Switch")
defineToggleSwitch("RADAR_PULSE_NORMAL_SHORT", 5, 3328, 218, "Radar", "Pulse Normal/Short Switch")
defineToggleSwitch("RADAR_RECCE_ON_OFF", 5, 3350, 216, "Radar", "Passive Recce On/Off Switch")
defineToggleSwitch("RADAR_MAINTENANCE_TEST", 5, 3914, 1006, "Radar", "Radar/EL Maintenance Test")
defineToggleSwitch("RADAR_IGNITION_COILS", 5, 3918, 395, "Radar", "Ignition Coils")
definePushButton("RADAR_IFF_ID", 5, 3922, 1205, "Radar", "IFF Identification")

--[[--Reversal--]]--
defineToggleSwitch("REVERSAL", 7, 3001, 20, "Thrust Reverser", "Thrust Reverser On/Off")

--[[--Navigation--]]--
definePushButton("DATAPANEL_KEY_0", 12, 3020, 290, "Navigation", "Datapanel Key 0")
definePushButton("DATAPANEL_KEY_1", 12, 3021, 291, "Navigation", "Datapanel Key 1")
definePushButton("DATAPANEL_KEY_2", 12, 3022, 292, "Navigation", "Datapanel Key 2")
definePushButton("DATAPANEL_KEY_3", 12, 3023, 293, "Navigation", "Datapanel Key 3")
definePushButton("DATAPANEL_KEY_4", 12, 3024, 294, "Navigation", "Datapanel Key 4")
definePushButton("DATAPANEL_KEY_5", 12, 3025, 295, "Navigation", "Datapanel Key 5")
definePushButton("DATAPANEL_KEY_6", 12, 3026, 296, "Navigation", "Datapanel Key 6")
definePushButton("DATAPANEL_KEY_7", 12, 3027, 297, "Navigation", "Datapanel Key 7")
definePushButton("DATAPANEL_KEY_8", 12, 3028, 298, "Navigation", "Datapanel Key 8")
definePushButton("DATAPANEL_KEY_9", 12, 3029, 299, "Navigation", "Datapanel Key 9")
definePushButton("NAV_SELECT_BTN_B1", 12, 3011, 271, "Navigation", "Navigation Selector Button B1")
definePushButton("NAV_SELECT_BTN_B2", 12, 3012, 272, "Navigation", "Navigation Selector Button B2")
definePushButton("NAV_SELECT_BTN_B3", 12, 3013, 273, "Navigation", "Navigation Selector Button B3")
definePushButton("NAV_SELECT_BTN_B4", 12, 3014, 274, "Navigation", "Navigation Selector Button B4")
definePushButton("NAV_SELECT_BTN_B5", 12, 3015, 275, "Navigation", "Navigation Selector Button B5")
definePushButton("NAV_SELECT_BTN_B6", 12, 3016, 276, "Navigation", "Navigation Selector Button B6")
definePushButton("NAV_SELECT_BTN_B7", 12, 3017, 277, "Navigation", "Navigation Selector Button B7")
definePushButton("NAV_SELECT_BTN_B8", 12, 3018, 278, "Navigation", "Navigation Selector Button B8")
definePushButton("NAV_SELECT_BTN_B9", 12, 3019, 279, "Navigation", "Navigation Selector Button B9")
definePushButton("NAV_SELECT_BTN_BX", 12, 3010, 280, "Navigation", "Navigation Selector Button BX")
definePushButton("NAV_SELECT_BTN_LS", 12, 3009, 270, "Navigation", "Navigation Selector Button LS")
definePushButton("NAV_SELECT_BTN_L_MAL", 12, 3008, 281, "Navigation", "Navigation Selector Button L MAL")

--[[Lights--]]--
defineToggleSwitch("ANTI_COLLISION_LIGHTS", 17, 3001, 250, "Lights", "Anti Collision Lights")
defineTumb("NAVIGATION_LIGHTS", 17, 3002, 251, 1, {-1,1}, nil, false, "Lights", "Navigation Lights")
defineToggleSwitch("FORMATION_LIGHTS", 17, 3003, 252, "Lights", "Formation Lights")
defineToggleSwitch("POSITION_LIGHTS", 17, 3004, 253, "Lights", "Position Lights")
defineToggleSwitch("TAXI_LANDING_LIGHTS", 17, 3009, 3554, "Lights", "Taxi/Landing Lights")
defineToggleSwitch("EMERGENCY_LIGHTS", 17, 3010, 3555, "Lights", "Emergency Lights")
definePotentiometer("FLOOD_LIGHTS", 17, 3007, 393, {0, 1}, "Lights", "Flood Lights")
definePotentiometer("PANEL_LIGHTS", 17, 3006, 392, {0, 1}, "Lights", "Panel Lights")
defineTumb("POSITION_LIGHTS_BRIGHTNESS", 17, 3005, 254, 0.1, {0.0, 0.2}, nil, false, "Lights", "Position Lights Brightness")
definePotentiometer("INSTRUMENT_LIGHTS", 17, 3008, 394, {0, 1}, "Lights", "Instrument Lights")

--[[--Engine Panel--]]--
defineToggleSwitch("START_SYSTEM", 18, 3001, 206, "Engine Panel", "Start System")
defineToggleSwitch("LOW_PRES_FUEL_VALVE", 18, 3002, 204, "Engine Panel", "Low Pressure Fuel Valve")
defineToggleSwitch("HIGH_PRES_FUEL_VALVE", 18, 3005, 202, "Engine Panel", "High Pressure Fuel Valve")
defineToggleSwitch("ENGINE_DEICE", 18, 3008, 310, "Engine Panel", "Engine De-Ice")
defineToggleSwitch("MANUAL_FUEL_REG", 18, 3007, 316, "Engine Panel", "Manual Fuel Regulator")
defineToggleSwitch("CB_AUTOPILOT", 18, 3905, 302, "Engine Panel", "CB Autopilot SA")
defineToggleSwitch("CB_HIGH_ALPHA_WARN", 18, 3906, 303, "Engine Panel", "CB High Alpha Warning")
defineToggleSwitch("CB_TRIM_SYSTEM", 18, 3907, 304, "Engine Panel", "CB Trim System")
defineToggleSwitch("CB_CI_SI", 18, 3908, 305, "Engine Panel", "CB CI/SI")
defineToggleSwitch("CB_EJECTION_SYSTEM", 18, 3909, 306, "Engine Panel", "CB Ejection System")
defineToggleSwitch("CB_ENGINE", 18, 3910, 307, "Engine Panel", "CB Engine")
defineToggleSwitch("IFF_TRANSPONDER_POWER", 18, 3920, 1203, "Engine Panel", "IFF/Transponder Power")
defineToggleSwitch("IFF_CHANNEL", 18, 3921, 1204, "Engine Panel", "IFF Channel Selector")
defineToggleSwitch("DME_SELECTOR", 18, 3919, 1206, "Engine Panel", "DME Selector")
defineToggleSwitch("IGNITION_SYSTEM", 18, 3003, 205, "Engine Panel", "Ignition System")
defineToggleSwitch("MAN_AFTERBURN_FUEL_REG", 18, 3006, 313, "Engine Panel", "Manual Afterburner Fuel Regulator")
defineTumb("FLIGHT_RECORDER", 18, 3924, 384, 0.5, {0.0, 1.0}, nil, false, "Engine Panel", "Flight Recorder")
definePushButton("RESTART", 18, 3004, 208, "Engine Panel", "Restart")
defineTumb("AFK_LEVER", 18, 3304, 13, 1.138, {0, 1.138}, nil, false, "Engine Panel", "AFK Lever")
defineToggleSwitch("DATA_CARTRIDGE", 18, 3925, 4200, "Engine Panel", "Insert/Remove Data Cartridge")
definePushButton("MISSILE_SELECT_BUTTON", 18, 3000, 400, "Engine Panel", "Missile Select Button")

--[[--Electric System--]]--
defineToggleSwitch("GENERATOR", 19, 3002, 207, "Electric System", "Generator")
defineToggleSwitch("MAIN_ELECTRIC_POWER", 19, 3001, 203, "Electric System", "Main Electric Power")
defineToggleSwitch("BACKUP_GENERATOR", 19, 3003, 312, "Electric System", "Backup Generator")

--[[--Radar Altimeter--]]--
defineToggleSwitch("RADAR_ALTIMETER_POWER", 20, 3002, 283, "Radar Altimeter", "Radar Altimeter Power")

--[[--Doppler--]]--
defineToggleSwitchToggleOnly("DOPPLER_LAND_SEA_MODE", 21, 3001, 213, "Doppler", "Doppler Land/Sea Mode")

--[[--Flight Data Unit--]]--
defineToggleSwitch("GEAR_HANDLE", 22, 3719, 12, "Flight Data Unit", "Gear Handle")
definePushButton("SPAK", 22, 3301, 401,  "Flight Data Unit",  "SPAK")
definePushButton("ATTITUDE_HOLD", 22, 3302, 402, "Flight Data Unit", "Attitude Hold")
definePushButton("ALTITUDE_HOLD", 22, 3303, 403, "Flight Data Unit", "Altitude Hold")
defineTumb("TILS_CHANNEL_SELECT", 22, 3512, 282, 0.1, {0.0, 1.0}, nil, false, "Flight Data Unit", "TILS Channel Selection")
defineToggleSwitch("TILS_CHANNEL_LAYER", 22, 3511, 285, "Flight Data Unit", "TILS Channel Layer Selection")
defineToggleSwitch("EJECTION_SEAT_ARM", 22, 3405, 21, "Flight Data Unit", "Ejection Seat Arm")
defineToggleSwitch("SLAV_SI", 22, 3201, 323, "Flight Data Unit", "Slav SI")
defineToggleSwitch("HOJD_CISI", 22, 3200, 324, "Flight Data Unit", "HOJD CISI")
definePotentiometer("BACKUP_ALT_SETTING", 22, 3721, 126, {0, 1}, "Flight Data Unit", "Backup Altimeter Setting")
defineToggleSwitch("PITCH_GEAR_MODE", 22, 3210, 311, "Flight Data Unit", "Pitch Gear Automatic/Landing")
defineToggleSwitch("OXYGEN_LEVER", 22, 3718, 176, "Flight Data Unit", "Oxygen Lever")
defineTumb("CANOPY_OPEN_CLOSE", 22, 3406, 9, 1, {-1, 1}, nil, false, "Flight Data Unit", "Canopy Open/Close")
definePushButton("CANOPY_JETTISON", 22, 3407, 210, "Flight Data Unit", "Canopy Jettison")
definePushButton("COUNTERMEASURE_FAST_RELEASE", 22, 3001, 184, "Flight Data Unit", "Countermeasure Fast Release")
defineToggleSwitch("EMERGENCY_ROLL_TRIM", 22, 3716, 390, "Flight Data Unit", "Emergency Roll Trim")
defineToggleSwitch("EMERGENCY_PITCH_TRIM", 22, 3717, 389, "Flight Data Unit", "Emergency Pitch Trim")
defineToggleSwitch("EMERGENCY_YAW_TRIM", 22, 3918, 388, "Flight Data Unit", "Emergency Yaw Trim")
defineToggleSwitch("MAG_DEC_COVER", 22, 3742, 1200, "Flight Data Unit", "Magnetic Declination Cover")
defineToggleSwitch("YAW_TRIM_COVER", 22, 3741, 493, "Flight Data Unit", "Autopilot Yaw Trim Cover")
defineToggleSwitchToggleOnly("PARKING_BRAKE", 22, 3408, 22, "Flight Data Unit", "Parking Brake")
defineToggleSwitchToggleOnly("HUD_GLASS_POSITION", 22, 3401, 11, "Flight Data Unit", "HUD Reflector Glass Position")
defineToggleSwitchToggleOnly("AFK_MODE_3", 22, 3402, 464, "Flight Data Unit", "AFK Mode 3")
defineToggleSwitchToggleOnly("AFK_15_DEG_MODE", 22, 3402, 464, "Flight Data Unit", "AFK 15 Deg Mode")
defineTumb("MASTER_MODE_SELECT", 22, 3107, 209, 0.16666667, {0, 1}, nil, false, "Flight Data Unit", "Master Mode Selector")

--[[--Navigation Panel--]]--
defineTumb("DATAPANEL_SELECTOR", 23, 3009, 200, 0.1, {0.0, 0.6}, nil, false, "Navigation Panel", "Datapanel Selector")
defineToggleSwitch("DATA_IN_OUT", 23, 3008, 201, "Navigation Panel", "Data In/Out")
defineToggleSwitch("RENSA_BUTTON_COVER", 23, 3101, 300, "Navigation Panel", "Rensa Button Cover")
definePushButton("CK37_RENSA_CLEAR", 23, 3001, 301, "Navigation Panel", "CK37 Rensa Clear")

--[[--RWR--]]--
defineTumb("RADAR_WARN_SELECT", 24, 3004, 321, 0.1, {0.0, 0.2}, nil, false, "RWR", "Radar Warning Indication Selector")

--[[--Warning Panel--]]--
definePushButton("WARNING_PANEL_TEST", 26, 3002, 344, "Warning Panel", "Warning Panel Light Test")
definePushButton("INDICATOR_SYSTEM_TEST", 26, 3004, 315, "Warning Panel", "Indicator System Test")
defineToggleSwitch("MASTER_CAUTION_RESET", 26, 3001, 446, "Warning Panel", "Master Caution Reset")

--[[--Countermeasures--]]--
defineTumb("JAMMER_MODE_SELECTOR", 28, 3024, 317, 0.1, {0.0, 0.4}, nil, false, "Countermeasures", "Jammer Mode Selector")
defineTumb("JAMMER_BAND_SELECTOR", 28, 3025, 318, 0.1, {0.0, 0.4}, nil, false, "Countermeasures", "Jammer Band Selector") 
defineTumb("COUNTERMEASURE_MODE_SELECTOR", 28, 3026, 319, 0.1, {0.0, 0.4}, nil, false, "Countermeasures", "Countermeasure Operation Mode Selector")
defineTumb("COUNTERMEASURE_STREAK_MODE_SELECTOR", 28, 3027, 320, 0.1, {0.0, 0.1}, nil, false, "Countermeasures", "Countermeasure Streak Mode Selector")
defineTumb("COUNTERMEASURE_CHAFF_FLARES_SELECTOR", 28, 3028, 322, 0.1, {0.0, 0.2}, nil, false, "Countermeasures", "Countermeasure Chaff/Flares Selector")
defineTumb("COUNTERMEASURE_RELEASE_MODE", 22, 3001, 184, 1, {-1, 1}, nil, false, "Countermeasures", "Countermeasure Release Mode") --3030

--[[--FR22 Radio--]]--
defineRotary("FR22_INNER_LEFT_KNOB", 31, 3003, 171, "FR22 Radio", "Radio Frequency Knob Inner Left")
defineRotary("FR22_OUTER_LEFT_KNOB", 31, 3004, 172, "FR22 Radio", "Radio Frequency Knob Outer Left")
defineRotary("FR22_INNER_RIGHT_KNOB", 31, 3005, 173, "FR22 Radio", "Radio Frequency Knob Inner Right")
defineRotary("FR22_OUTER_RIGHT_KNOB", 31, 3006, 174, "FR22 Radio", "Radio Frequency Knob Outer Right")
defineToggleSwitchToggleOnly("FR22_SET_MODULATION", 31, 3008, 170, "FR22 Radio", "Radio Manual Frequency Setting Modulation")

--[[--Raw Gauge Values--]]--
defineFloat("STICK_PITCH", 2, {-1, 1}, "Raw Gauge Values", "Stick Pitch")
defineFloat("STICK_ROLL", 3, {-1, 1}, "Raw Gauge Values", "Stick Roll")
defineFloat("PEDALS", 4, {-1, 1}, "Raw Gauge Values", "Pedals")
defineFloat("THROTTLE", 5, {0, 1}, "Raw Gauge Values", "Throttle")
defineFloat("ENGINE_RPM_100", 139, {-1, 1}, "Raw Gauge Values", "Engine RPM 100")
defineFloat("ENGINE_RPM_10", 140, {0, 1}, "Raw Gauge Values", "Engine RPM 10")
defineFloat("ENGINE_TEMP", 146, {0, 1}, "Raw Gauge Values", "Engine Temp")
defineFloat("AIRSPEED_M/S", 100, {0, 1}, "Raw Gauge Values", "Airspeed m/s")
defineFloat("MACH_METER_INTEGER", 101, {0, 1}, "Raw Gauge Values", "Mach Meter Integer X.00")
defineFloat("MACH_METER_FIRST_DECIMAL", 102, {0, 1}, "Raw Gauge Values", "Mach Meter First Decimal 0.X0")
defineFloat("MACH_METER_SECOND_DECIMAL", 103, {0, 1}, "Raw Gauge Values", "Mach Meter Second Decimal 0.0X")
defineFloat("VERTICAL_ACCELERATION", 136, {-0.3, 0.8}, "Raw Gauge Values", "Vertical Acceleration G Meter")
defineFloat("ALTIMETER_10000M", 114, {0, 1}, "Raw Gauge Values", "Altimeter 10000 Meter")
defineFloat("ALTIMETER_1000M", 113, {0, 1}, "Raw Gauge Values", "Altimeter 1000 Meter")
defineFloat("ALTIMETER_BARO_1_HPA", 115, {0, 1}, "Raw Gauge Values", "Altimeter Baro 1 hPa 000X")
defineFloat("ALTIMETER_BARO_10_HPA", 116, {0, 1}, "Raw Gauge Values", "Altimeter Baro 10 hPa 00X0")
defineFloat("ALTIMETER_BARO_100_HPA", 117, {0, 1}, "Raw Gauge Values", "Altimeter Baro 100 hPa 0X00")
defineFloat("ALTIMETER_BARO_1000_HPA", 118, {0, 1}, "Raw Gauge Values", "Altimeter Baro 1000 hPa X000")
defineFloat("ADI_PITCH", 105, {1, -1}, "Raw Gauge Values", "ADI Pitch")
defineFloat("ADI_HEADING", 106, {1, -1}, "Raw Gauge Values", "ADI Heading")
defineFloat("ADI_ROLL", 107, {-1, 1}, "Raw Gauge Values", "ADI Roll")
defineFloat("ADI_VERTICAL_VELOCITY", 108, {-1, 1}, "Raw Gauge Values", "ADI Vertical Velocity")
defineFloat("ADI_VERTICAL_ILS", 109, {1, -1}, "Raw Gauge Values", "ADI Vertical ILS")
defineFloat("ADI_HORIZONTAL_ILS", 110, {1, -1}, "Raw Gauge Values", "ADI Horizontal ILS")
defineFloat("ADI_SLIPBALL", 111, {-1, 1}, "Raw Gauge Values", "ADI Slipball")
defineFloat("ADI_AOA_INDICATOR", 147, {0, 1}, "Raw Gauge Values", "ADI AoA Indicator")
defineFloat("CI_HEADING", 128, {1, -1}, "Raw Gauge Values", "CI Heading")
defineFloat("CI_COMMANDED_HEADING", 129, {1, 0}, "Raw Gauge Values", "CI Commanded Heading")
defineFloat("MAGNETIC_HEADING", 127, {1, -1}, "Raw Gauge Values", "Magnetic Heading")
defineFloat("BACKUP_INDICATED_AIRSPEED", 138, {0, 1}, "Raw Gauge Values", "Backup Indicated Airspeed")
defineFloat("BACKUP_ALTIMETER_10000M", 125, {0, 1}, "Raw Gauge Values", "Backup Altimeter 10000 Meter")
defineFloat("BACKUP_ALTIMETER_1000M", 124, {0, 1}, "Raw Gauge Values", "Backup Altimeter 1000 Meter")
defineFloat("BACKUP_PITCH", 121, {1, -1}, "Raw Gauge Values", "Backup Pitch")
defineFloat("BACKUP_ROLL", 122, {1, -1}, "Raw Gauge Values", "Backup Roll")
defineFloat("DISTANCE_INDICATOR", 142, {0, 1}, "Raw Gauge Values", "Distance Indicator")
defineFloat("FUEL_LEVEL", 144, {0, 1}, "Raw Gauge Values", "Fuel Level")
defineFloat("FUEL_NEEDED", 145, {0, 1}, "Raw Gauge Values", "Fuel Needed")
defineIndicatorLight("SPAK_LAMP", 401, "Indicator Lights", "SPAK Lamp")
defineIndicatorLight("ATT_LAMP", 402, "Indicator Lights", "ATT Lamp")
defineIndicatorLight("HOJD_LAMP", 403, "Indicator Lights", "HOJD Lamp")

--[[--Error Panel Indicators--]]--
defineIndicatorLight("BRAND_1", 406, "Error Panel", "Engine Fire 1")
defineIndicatorLight("BRAND_2", 407, "Error Panel", "Engine Fire 2")
defineIndicatorLight("BRA_UPPF", 408, "Error Panel", "Fuel Distribution Low Pressure")
defineIndicatorLight("X_TANK_BRA", 409, "Error Panel", "External Fuel Tank Feed System")
defineIndicatorLight("TANK_PUMP", 410, "Error Panel", "Fuel Pump")
defineIndicatorLight("LANDSTALL", 411, "Error Panel", "Landing Gear")
defineIndicatorLight("FORV_FORB", 412, "Error Panel", "Thrust Reverser Warning")
defineIndicatorLight("NOSSTALL", 413, "Error Panel", "Nose Gear")
defineIndicatorLight("VSTALL", 414, "Error Panel", "Left Gear")
defineIndicatorLight("HSTALL", 415, "Error Panel", "Right Gear")
defineIndicatorLight("TIPPVAXEL", 416, "Error Panel", "Pitch Gearing")
defineIndicatorLight("ELFEL", 417, "Error Panel", "Electrical System")
defineIndicatorLight("RESERVEFF", 418, "Error Panel", "Backup Hydraulic")
defineIndicatorLight("HYDRA_TA_2", 419, "Error Panel", "Hydraulic System 2 Pressure")
defineIndicatorLight("HYDRA_TA_1", 420, "Error Panel", "Hydraulic System 1 Pressure")
defineIndicatorLight("AFK_FEL", 421, "Error Panel", "Autothrottle")
defineIndicatorLight("EJ_REV", 422, "Error Panel", "Thrust Reverser Inoperable")
defineIndicatorLight("OLJETRYCK", 423, "Error Panel", "Oil Pressure")
defineIndicatorLight("SPAK_ERROR", 424, "Error Panel", "SPAK Error")
defineIndicatorLight("HALL_FUNK", 425, "Error Panel", "Autopilot Hold")
defineIndicatorLight("RHM_FEL", 426, "Error Panel", "Radar Altimeter")
defineIndicatorLight("ROLL_VAXEL", 427, "Error Panel", "Roll Gearing")
defineIndicatorLight("CK", 428, "Error Panel", "Computer")
defineIndicatorLight("KABINHOJD", 429, "Error Panel", "Cabin Pressure")
defineIndicatorLight("HUV_O_STOL", 430, "Error Panel", "Ejection Seat/Canopy")
defineIndicatorLight("TANDSYST", 431, "Error Panel", "Ignition System")
defineIndicatorLight("STARTSYST", 432, "Error Panel", "Starter System")
defineIndicatorLight("MAN_BG_REG", 433, "Error Panel", "Manual Fuel Regulator")
defineIndicatorLight("SYRGAS", 434, "Error Panel", "Oxygen")
defineIndicatorLight("BRA_24", 435, "Error Panel", "Low Fuel")
defineIndicatorLight("BRAND_GTS", 436, "Error Panel", "Turbine Starter Fire")
defineIndicatorLight("TILS", 437, "Error Panel", "TILS")
defineIndicatorLight("NAV_SYST", 438, "Error Panel", "Navigation System")
defineIndicatorLight("KB_V_SLUT", 439, "Error Panel", "Left Countermeasures Pod Empty")
defineIndicatorLight("KB_H_KA_SL", 440, "Error Panel", "Right Countermeasures Pod Empty/ECM Failure")
defineIndicatorLight("FACKL_SL", 441, "Error Panel", "Flares Empty")
defineIndicatorLight("MOTVERK", 442, "Error Panel", "Countermeasures/RWR")
defineIndicatorLight("LUFTBROMS", 443, "Error Panel", "Airbrakes")

--[[--Actual Gauge Values--]]--

local function getRPM()
     local returnValue = ((GetDevice(0):get_argument_value(139))*55+55)
     return returnValue
end
defineIntegerFromGetter("ENGINE_RPM_VALUE", getRPM, 65000, "Gauge Values", "Engine RPM Value")

local function getEngineTemp()
     local returnValue = ((GetDevice(0):get_argument_value(146))*700+100)
     return returnValue
end
defineIntegerFromGetter("ENGINE_TEMP_VALUE", getEngineTemp, 65000, "Gauge Values", "Engine Temp Value")

local function getAirspeed()
     local returnValue = ((-707.23*(GetDevice(0):get_argument_value(100))^4)+(1843.8*(GetDevice(0):get_argument_value(100))^3)-(647.84*(GetDevice(0):get_argument_value(100))^2)+(810.63*(GetDevice(0):get_argument_value(100)))+100.03)
     return returnValue
end
defineIntegerFromGetter("AIRSPEED_VALUE", getAirspeed, 65000, "Gauge Values", "Airspeed Value")

local function getAlt()
     local returnValue = ((GetDevice(0):get_argument_value(114))*10000)
     return returnValue
end
defineIntegerFromGetter("ALTITUDE_VALUE", getAlt, 65000, "Gauge Values", "Altitude Value")

local function getFuelLev()
     local returnValue = ((GetDevice(0):get_argument_value(144))*135)
     return returnValue
end
defineIntegerFromGetter("FUEL_LEVEL_VALUE", getFuelLev, 65000, "Gauge Values", "Fuel Level Value")

local function getFuelNeed()
     local returnValue = ((GetDevice(0):get_argument_value(145))*135)
     return returnValue
end
defineIntegerFromGetter("FUEL_NEEDED_VALUE", getFuelNeed, 65000, "Gauge Values", "Fuel Needed Value")

local function getCIHDG()
	 local heading = 0
	 if (GetDevice(0):get_argument_value(128)) <= 0 then
	 heading = ((180 * (GetDevice(0):get_argument_value(128))) + 360)
	 else
     heading = (180 * (GetDevice(0):get_argument_value(128)))
	 end
     return heading
end
defineIntegerFromGetter("CI_HEADING_VALUE", getCIHDG, 65000, "Gauge Values", "CI Heading Value")

local function getCICMDHDG()
     local returnValue = ((GetDevice(0):get_argument_value(129)) * 360)
     return returnValue
end
defineIntegerFromGetter("CI_COMMAND_HEADING_VALUE", getCICMDHDG, 65000, "Gauge Values", "CI Commanded Heading Value")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")
defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(186)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights")
defineIntegerFromGetter("EXT_NAV_LIGHTS_WING", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Navigation Lights Wing")
defineIntegerFromGetter("EXT_NAV_LIGHTS_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Navigation Lights Tail")

defineIntegerFromGetter("EXT_STROBE_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(811) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Lights")
defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(812) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Formation Lights")

 ---- added by Warlord
definePushButton("MAX_G_RESET", 25, 3722, 175, "Flight Data Unit", "Max G Reset")
definePushButton("BACK_ADI_CAGE", 25, 3720, 123, "Flight Data Unit", "Backup ADI Cage")
definePushButton("ROLL_CENTER", 25, 3305, 212, "Flight Data Unit", "Roll Centering")
definePotentiometer("ALT_SET", 25, 3306, 2005, {0, 1},"Flight Data Unit" , "Altimeter Setting")
definePotentiometer("HUD_BRIGHT", 25, 3409, 180, {0, 1},"Flight Data Unit" , "HUD Brightness Knob")
definePotentiometer("MAG_CORRECTION", 25, 3724, 1201, {0, 1},"Flight Data Unit" , "Magnetic Declination Correction")
definePotentiometer("AUTO_YAW_TRIM", 25, 3732, 211, {0, 1},"Flight Data Unit" , "Autopilot Yaw Trim")
definePotentiometer("CLOCK_SET", 25, 3801, 135, {0, 1},"Flight Data Unit" , "Clock Setting")

definePushButton("FR22_FLIGHT_0", 34, 3210,372, "FR22 Radio", "Flight 0")
definePushButton("FR22_FLIGHT_1", 34, 3211,373, "FR22 Radio", "Flight 1")
definePushButton("FR22_FLIGHT_2", 34, 3212,374, "FR22 Radio", "Flight 2")
definePushButton("FR22_FLIGHT_3", 34, 3213,375, "FR22 Radio", "Flight 3")
definePushButton("FR22_FLIGHT_4", 34, 3214,376, "FR22 Radio", "Flight 4")
definePushButton("FR22_FLIGHT_5", 34, 3215,377, "FR22 Radio", "Flight 5")
definePushButton("FR22_FLIGHT_6", 34, 3216,378, "FR22 Radio", "Flight 6")
definePushButton("FR22_FLIGHT_7", 34, 3217,379, "FR22 Radio", "Flight 7")
definePushButton("FR22_FLIGHT_8", 34, 3218,380, "FR22 Radio", "Flight 8")
definePushButton("FR22_FLIGHT_9", 34, 3219,381, "FR22 Radio", "Flight 9")
definePushButton("FR22_CHANNEL_H", 34, 3200,362, "FR22 Radio", "Channel H")
definePushButton("FR22_SPECIAL_1", 34, 3201,363, "FR22 Radio", "Special 1")
definePushButton("FR22_SPECIAL_2", 34, 3202,364, "FR22 Radio", "Special 2")
definePushButton("FR22_SPECIAL_3", 34, 3203,365, "FR22 Radio", "Special 3")
definePushButton("FR22_MINUS", 34, 3204,366, "FR22 Radio", "Minus")
definePushButton("FR22_CHANNEL_AG", 34, 3205,367, "FR22 Radio", "Channel A/G")
definePushButton("FR22_CHANNEL_B", 34, 3206,368, "FR22 Radio", "Channel B")
definePushButton("FR22_CHANNEL_CF", 34, 3207,369, "FR22 Radio", "Channel C/F")
definePushButton("FR22_CHANNEL_C2", 34, 3208,370, "FR22 Radio", "Channel C2")
definePushButton("FR22_CHANNEL_DE", 34, 3209,371, "FR22 Radio", "Channel D/E")
definePushButton("FR22_GROUND_COM", 34, 3011,382, "FR22 Radio", "Ground Intercom")
defineTumb("FR22_MODE", 34, 3110, 386, 0.1, {0.0, 0.5}, nil, false, "FR22 Radio", "FR22 Mode Selector")
defineTumb("FR22_BASE", 34, 3230, 2002, 0.1, {0.0, 1.0}, nil, false, "FR22 Radio", "FR22 Base Selector")
defineTumb("FR22_GROUP", 34, 3307, 360, 0.1, {0.0, 1.0}, nil, false, "FR22 Radio", "FR22 Group Selector")
defineRotary("FR22_VOL", 21, 3112, 385, "FR22 Radio" , "Radio Volume")

defineToggleSwitch("IFF_POWER", 21, 3000, 308, "Radar", "IFF Power")
defineTumb("IFF_CODE", 21, 3000, 309, 0.1, {0.0, 1.0}, nil, false, "Radar", "IFF Code")
definePotentiometer("DE-ICE", 21, 3912, 286, {0, 1},"Engine Panel" , "Windscreen De-Ice")
definePotentiometer("TEST_MODE", 21, 3913, 675, {0, 1},"Engine Panel" , "Maintenance Testing Mode")
definePotentiometer("DRYSUIT", 21, 3917, 396, {0, 1},"Engine Panel" , "Drysuit Ventilation Adjustment")
defineToggleSwitch("CABIN_AIR_VALVE", 21, 3000, 398, "Engine Panel", "Cabin Air Valve")

definePotentiometer("MASTER_VOL", 27, 3006, 399, {0, 1},"RWR" , "Master Volume / Sidewinder Tone")
definePotentiometer("RADAR_BRIGHT", 5, 3923, 391, {0, 1},"Radar" , "Radar Brightness")

--found no argument
-- elements["SnabbresM-PTR"] = default_button(_("Snabbresning"), devices.FLIGHTDATAUNIT, 3091, 0) left bottom radar display
-- elements["PNT_CLOCK_RIGHT"] = default_button(_("Stopwatch Start/Stop/Reset"),devices.FLIGHTDATAUNIT, 3802, 0) right upper clock

local function getAJS37NavIndicator1()
	local li = list_indication(2)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "data1"
			then
			return value:sub(1)
		end
    end
return "X"
end
 
defineString("AJS37_NAV_INDICATOR_DATA_1", getAJS37NavIndicator1, 1, "Navigation Panel", "Navigataion Panel Data Digit 1")

local function getAJS37NavIndicator2()
	local li = list_indication(2)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "data2"
			then
			return value:sub(1)
		end
    end
return "X"
end
 
defineString("AJS37_NAV_INDICATOR_DATA_2", getAJS37NavIndicator2, 1, "Navigation Panel", "Navigataion Panel Data Digit 2")

local function getAJS37NavIndicator3()
	local li = list_indication(2)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "data3"
			then
			return value:sub(1)
		end
    end
return "X"
end
 
defineString("AJS37_NAV_INDICATOR_DATA_3", getAJS37NavIndicator3, 1, "Navigation Panel", "Navigataion Panel Data Digit 3")

local function getAJS37NavIndicator4()
	local li = list_indication(2)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "data4"
			then
			return value:sub(1)
		end
    end
return "X"
end
 
defineString("AJS37_NAV_INDICATOR_DATA_4", getAJS37NavIndicator4, 1, "Navigation Panel", "Navigataion Panel Data Digit 4")

local function getAJS37NavIndicator5()
	local li = list_indication(2)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "data5"
			then
			return value:sub(1)
		end
    end
return "X"
end
 
defineString("AJS37_NAV_INDICATOR_DATA_5", getAJS37NavIndicator5, 1, "Navigation Panel", "Navigataion Panel Data Digit 5")

local function getAJS37NavIndicator6()
	local li = list_indication(2)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "data6"
			then
			return value:sub(1)
		end
    end
return "X"
end
 
defineString("AJS37_NAV_INDICATOR_DATA_6", getAJS37NavIndicator6, 1, "Navigation Panel", "Navigataion Panel Data Digit 6")




BIOS.protocol.endModule()