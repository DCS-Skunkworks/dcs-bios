BIOS.protocol.beginModule("Ka-50", 0x1800)
BIOS.protocol.setExportModuleAircrafts({"Ka-50"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local define8BitFloat = BIOS.util.define8BitFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter



local function defineLedPushButton(msg, device_id, device_command, arg_number, category, description)
	BIOS.util.defineTumb(msg, device_id, device_command, arg_number, 0.3, {0, 0.3}, nil, false, category, description)
	local docentry = moduleBeingDefined.documentation[category][msg]
	docentry.physical_variant = "push_button"
	docentry.api_variant = "momentary_last_position"
end

local function definePushButtonLed(msg, arg_number, category, description)
	local function round(n)
		return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
	end
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		value:setValue(round(dev0:get_argument_value(arg_number)*10) % 2)
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "led",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "0 if light is off, 1 if light is on"
			}
		},
		physical_variant = "button_light",
	}
end


---------------------------------------------------------------------
-- Overhead Panel
---------------------------------------------------------------------
-- Overhead Panel - left side
defineMultipositionSwitch("OP_NAV_LIGHTS", 45, 3004, 146, 5, 0.1, "Overhead Panel", "Navigation Lights 10% / 30% / 100% / Off switch")
defineMultipositionSwitch("OP_WINDSHIELD_WIPER", 34, 3006, 147, 5, 0.1, "Overhead Panel", "Windshield wiper switch")
defineToggleSwitch("OP_WINDSHIELD_WASH", 0, 3008, 148, "Overhead Panel", "Windshield washer fluid switch")
defineToggleSwitch("OP_PITOT_PORT_HEAT", 34, 3008, 539, "Overhead Panel", "Pitot static port and AoA sensors heat switch")
defineToggleSwitch("OP_PITOT_RAM_HEAT", 34, 3009, 151, "Overhead Panel", "Pitot ram air and clock heat switch")
-- Magnetic Compass
defineFloat("KI13_CRS", 11, {-1, 1}, "Magnetic Compass", "Course")
defineFloat("KI13_PITCH", 12, {-1, 1}, "Magnetic Compass", "Pitch")
defineFloat("KI13_BANK", 14, {-1, 1}, "Magnetic Compass", "Bank")
-- Overhead Panel - right side
defineToggleSwitch("OP_ROTOR_DEICE", 4, 3013, 153, "Overhead Panel", "Rotor de-icing system switch")
defineMultipositionSwitch("OP_ENG_DEICE", 4, 3014, 154, 3, 0.5, "Overhead Panel", "Engines de-icing / dust-protection systems switch")
definePushButton("OP_PITOT_HEAT_TEST", 34, 3010, 156, "Overhead Panel", "Pitot heat system test button")
-- Warning and Advisory Lamps
defineIndicatorLight("WAL_RALT_HOLD", 170, "Warning and Advisory Lamps", "R-ALT hold")
defineIndicatorLight("WAL_AUTO_HOVER", 175, "Warning and Advisory Lamps", "Auto hover")
defineIndicatorLight("WAL_AUTO_DESCENT", 172, "Warning and Advisory Lamps", "Auto descent")
defineIndicatorLight("WAL_ENR_NAV", 165, "Warning and Advisory Lamps", "Route heading steering")
defineIndicatorLight("WAL_ENR_COURSE", 171, "Warning and Advisory Lamps", "Route course steering")
defineIndicatorLight("WAL_NEXT_WPT", 176, "Warning and Advisory Lamps", "Next waypoint")
defineIndicatorLight("WAL_ENR_END", 166, "Warning and Advisory Lamps", "End of route")
defineIndicatorLight("WAL_NAV_CALC", 164, "Warning and Advisory Lamps", "Rough NAV calc")
defineIndicatorLight("WAL_WEAPONS_ARM", 178, "Warning and Advisory Lamps", "Weapons armed")
defineIndicatorLight("WAL_CANNON", 173, "Warning and Advisory Lamps", "Cannon away from boresight")
defineIndicatorLight("WAL_CANNON2", 177, "Warning and Advisory Lamps", "Cannon downward away from boresight")
defineIndicatorLight("WAL_XFEED_VLV_OPEN", 211, "Warning and Advisory Lamps", "Fuel crossfeed ON")
defineIndicatorLight("WAL_TURBO_GEARBOX_OFF", 187, "Warning and Advisory Lamps", "Gearbox disconnected")
defineIndicatorLight("WAL_GEARBOX_OIL_PRESS", 204, "Warning and Advisory Lamps", "Gearbox oil pressure normal")
defineIndicatorLight("WAL_SLING_OPEN", 213, "Warning and Advisory Lamps", "Sling load lock (hook) is open")
-- Message Lamps
defineIndicatorLight("ML_MASTER_ARM", 167, "Message Lamps", "Master ARM is ON")
defineIndicatorLight("ML_WEAPONS_TRAIN", 180, "Message Lamps", "Training mode is ON")
defineIndicatorLight("ML_HMS_FAIL", 179, "Message Lamps", "Helmet-Mounted sight mailfunction")
defineIndicatorLight("ML_HUD_NOT_READY", 188, "Message Lamps", "HUD failure or not ready")
defineIndicatorLight("ML_COMPUTER_DIAG", 189, "Message Lamps", "Computers in diagnostic mode")
defineIndicatorLight("ML_COMPUTER_FAIL", 206, "Message Lamps", "Computer(s) failure")
defineIndicatorLight("ML_INVERTER", 212, "Message Lamps", "DC/AC inverter is ON")
defineIndicatorLight("ML_SHKVAL_FAIL", 205, "Message Lamps", "SHKVAL failure")
defineIndicatorLight("ML_L_ENG_ANTIICE", 181, "Message Lamps", "Left engine de-icing")
defineIndicatorLight("ML_L_ENG_DUST", 190, "Message Lamps", "Left engine dust protector")
defineIndicatorLight("ML_L_ENG_POWER_LIMIT", 207, "Message Lamps", "Left engine limited by governor")
defineIndicatorLight("ML_ROTOR_ANTIICE", 183, "Message Lamps", "Rotor de-icing")
defineIndicatorLight("ML_R_ENG_ANTIICE", 182, "Message Lamps", "Right engine deicing")
defineIndicatorLight("ML_R_ENG_DUST", 191, "Message Lamps", "Right engine dust protector")
defineIndicatorLight("ML_R_ENG_POWER_LIMIT", 208, "Message Lamps", "Right engine limited by governor")
defineIndicatorLight("ML_WINDSHIELD_HEAT", 184, "Message Lamps", "Windshield heater is ON")
defineIndicatorLight("ML_FWD_TANK_PUMP", 200, "Message Lamps", "Forward fuel pump ON")
defineIndicatorLight("ML_L_ENG_VLV_CLOSED", 209, "Message Lamps", "Left engine fuel valve is closed")
defineIndicatorLight("ML_L_OUTER_TANK_PUMP", 185, "Message Lamps", "Left outer fuel tank pump is ON")
defineIndicatorLight("ML_L_INNER_TANK_PUMP", 202, "Message Lamps", "Left inner fuel tank pump is ON")
defineIndicatorLight("ML_AFT_TANK_PUMP", 201, "Message Lamps", "Aft fuel tank pump is ON")
defineIndicatorLight("ML_R_ENG_VLV_CLOSED", 210, "Message Lamps", "Right engine fuel valve is closed")
defineIndicatorLight("ML_R_OUTER_TANK_PUMP", 186, "Message Lamps", "Right outer fuel tank pump is ON")
defineIndicatorLight("ML_R_INNER_TANK_PUMP", 203, "Message Lamps", "Right inner fuel tank pump is ON")
-- PRTz Data Link Control Panel
defineLedPushButton("DLNK_SEND_BTN", 25, 3001, 159, "Datalink Control Panel", "Send/Memory button")
definePushButtonLed("DLNK_SEND_LED", 159, "Datalink Control Panel", "Send/Memory LED")
defineLedPushButton("DLNK_ESCAPE_BTN", 25, 3002, 150, "Datalink Control Panel", "Ingress to target button")
definePushButtonLed("DLNK_ESCAPE_LED", 150, "Datalink Control Panel", "Ingress to target LED")
defineLedPushButton("DLNK_ERASE_BTN", 25, 3003, 161, "Datalink Control Panel", "Erase button")
definePushButtonLed("DLNK_ERASE_LED", 161, "Datalink Control Panel", "Erase LED")
defineLedPushButton("DLNK_CLEAN_BTN", 25, 3004, 15, "Datalink Control Panel", "N/A button")
definePushButtonLed("DLNK_CLEAN_LED", 15, "Datalink Control Panel", "N/A LED")
defineLedPushButton("DLNK_WINGMAN_ALL_BTN", 25, 3005, 16, "Datalink Control Panel", "To aLL button")
definePushButtonLed("DLNK_WINGMAN_ALL_LED", 16, "Datalink Control Panel", "To all LED")
defineLedPushButton("DLNK_WINGMAN_1_BTN", 25, 3006, 17, "Datalink Control Panel", "To wingman 1 button")
definePushButtonLed("DLNK_WINGMAN_1_LED", 17, "Datalink Control Panel", "To wingman 1 LED")
defineLedPushButton("DLNK_WINGMAN_2_BTN", 25, 3007, 18, "Datalink Control Panel", "To wingman 2 button")
definePushButtonLed("DLNK_WINGMAN_2_LED", 18, "Datalink Control Panel", "To wingman 2 LED")
defineLedPushButton("DLNK_WINGMAN_3_BTN", 25, 3008, 19, "Datalink Control Panel", "To wingman 3 button")
definePushButtonLed("DLNK_WINGMAN_3_LED", 19, "Datalink Control Panel", "To wingman 3 LED")
defineLedPushButton("DLNK_WINGMAN_4_BTN", 25, 3009, 20, "Datalink Control Panel", "To wingman 4 button")
definePushButtonLed("DLNK_WINGMAN_4_LED", 20, "Datalink Control Panel", "To wingman 4 LED")
defineLedPushButton("DLNK_TARGET_VEHICLE_BTN", 25, 3010, 21, "Datalink Control Panel", "Target #1/Vehicle button")
definePushButtonLed("DLNK_TARGET_VEHICLE_LED", 21, "Datalink Control Panel", "Target #1/Vehicle LED")
defineLedPushButton("DLNK_TARGET_SAM_BTN", 25, 3011, 22, "Datalink Control Panel", "Target #2/SAM button")
definePushButtonLed("DLNK_TARGET_SAM_LED", 22, "Datalink Control Panel", "Target #2/SAM LED")
defineLedPushButton("DLNK_TARGET_OTHER_BTN", 25, 3012, 23, "Datalink Control Panel", "Target #3/Other type button")
definePushButtonLed("DLNK_TARGET_OTHER_LED", 23, "Datalink Control Panel", "Target #3/Other type LED")
defineLedPushButton("DLNK_TARGET_POINT_BTN", 25, 3013, 50, "Datalink Control Panel", "Ingress point button")
definePushButtonLed("DLNK_TARGET_POINT_LED", 50, "Datalink Control Panel", "Ingress point LED")
-- Laser Warning Receiver
defineIndicatorLight("LWR_AZI_0", 25, "LWR", "Lamp azimuth 0")
defineIndicatorLight("LWR_AZI_90", 28, "LWR", "Lamp azimuth 90")
defineIndicatorLight("LWR_AZI_180", 26, "LWR", "Lamp azimuth 180")
defineIndicatorLight("LWR_AZI_270", 27, "LWR", "Lamp azimuth 270")
defineIndicatorLight("LWR_HEMI_UPPER", 31, "LWR", "Lamp hemisphere upper")
defineIndicatorLight("LWR_HEMI_LOWER", 32, "LWR", "Lamp hemisphere lower")
defineIndicatorLight("LWR_LASER_RANGE", 33, "LWR", "Lamp laser range finder")
defineIndicatorLight("LWR_LASER_TARGETING", 34, "LWR", "Lamp laser targeting system")
definePushButton("LWR_RESET", 36, 3001, 35, "LWR", "Reset button")
-- UV-26 Countermeasures Control Panel 
local function getUV26Display()
    local ind = parse_indication(7)
    if ind == nil then return "   " end
    return ind["txt_digits"]
end
defineString("UV26_DISPLAY", getUV26Display, 3, "UV-26 Control Panel", "UV-26 display")
defineIndicatorLight("UV26_L_DISPENSER", 541, "UV-26 Control Panel", "Left dispenser indicator")
defineIndicatorLight("UV26_R_DISPENSER", 542, "UV-26 Control Panel", "Right dispenser indicator")
defineMultipositionSwitch("UV26_DISPENSERS_SELECTOR", 22, 3001, 36, 3, 0.1, "UV-26 Control Panel", "Select Left/Both/Right board flares dispensers switch")
defineMultipositionSwitch("UV26_MODE", 22, 3003, 37, 2, 0.1, "UV-26 Control Panel", "Amount flares counter/Programming switch")
definePushButton("UV26_SERIES", 22, 3004, 38, "UV-26 Control Panel", "Num of sequences button")
definePushButton("UV26_BURST", 22, 3005, 39, "UV-26 Control Panel", "Num in sequence button")
definePushButton("UV26_INTERVAL", 22, 3006, 41, "UV-26 Control Panel", "Dispense interval button")
definePushButton("UV26_START", 22, 3007, 43, "UV-26 Control Panel", "Start dispense button")
definePushButton("UV26_RESET", 22, 3008, 42, "UV-26 Control Panel", "Reset to default program button")
definePushButton("UV26_STOP", 22, 3009, 40, "UV-26 Control Panel", "Stop dispense button")
-- Ambient Temperature
defineFloat("TEMP_AMBIENT", 587, {-0.946, 0.788}, "Ambient Temperature", "Ambient temperature")


---------------------------------------------------------------------
-- Left Forward Panel
---------------------------------------------------------------------
-- System Controller
defineLedPushButton("SC_MASTER_CAUTION_BTN", 14, 3001, 44, "System Controller", "Master caution button")
definePushButtonLed("SC_MASTER_CAUTION_LED", 44, "System Controller", "Master caution button LED")
definePushButton("SC_LAMPS_TEST", 14, 3002, 45, "System Controller", "Lamps test button")
defineLedPushButton("SC_ROTOR_RPM_BTN", 14, 3003, 46, "System Controller", "Rotor RPM warning button")
definePushButtonLed("SC_ROTOR_RPM_LED", 46, "System Controller", "Rotor RPM warning button LED")
defineToggleSwitch("SC_MWS_MODE", 14, 3004, 49, "System Controller", "MWS operation mode switch (not functional)")
-- Caution Lights Panel
defineIndicatorLight("CL_LASER_WARN", 47, "Caution Lights Panel", "Under fire warning")
defineIndicatorLight("CL_EXTEND_GEAR", 48, "Caution Lights Panel", "Extend landing gear")
defineIndicatorLight("CL_L_ENG_OVERSPEED", 78, "Caution Lights Panel", "Left engine power turbine over-speed")
defineIndicatorLight("CL_R_ENG_OVERSPEED", 79, "Caution Lights Panel", "Right engine power turbine over-speed")
defineIndicatorLight("CL_OVER_G", 80, "Caution Lights Panel", "G over-limit")
defineIndicatorLight("CL_L_ENG_VIBRATION", 81, "Caution Lights Panel", "Left engine vibration exceeded")
defineIndicatorLight("CL_R_ENG_VIBRATION", 82, "Caution Lights Panel", "Right engine vibration exceeded")
defineIndicatorLight("CL_IAS_MAX", 83, "Caution Lights Panel", "Maximum allowed IAS exceeded")
defineIndicatorLight("CL_MAIN_GEARBOX", 84, "Caution Lights Panel", "Minimum main gearbox oil pressure / Main gearbox oil overheat / Oil metallic chip detected")
defineIndicatorLight("CL_FIRE", 85, "Caution Lights Panel", "Left engine / Right engine / APU / Hydraulics bay / Main gearbox fire")
defineIndicatorLight("CL_IFF_FAIL", 86, "Caution Lights Panel", "IFF failure")
-- Attitude Director Indicator
definePushButton("ADI_TEST", 31, 3003, 110, "ADI", "Self-test button")
defineToggleSwitch("ADI_TEST_COVER", 31, 3002, 550, "ADI", "Self-test button cover")
defineVariableStepTumb("ADI_PITCH_TRIM", 31, 3001, 105, 0.1, "ADI", "Zero pitch trim rotary")
defineFloat("ADI_ROLL", 100, {-1, 1}, "ADI", "Roll")
defineFloat("ADI_PITCH", 101, {-1, 1}, "ADI", "Pitch")
define8BitFloat("ADI_STEER_WARN_FLAG", 102, {0, 1}, "ADI", "Steering warning flag")
define8BitFloat("ADI_ATT_WARN_FLAG", 109, {0, 1}, "ADI", "Attitude warning flag")
defineFloat("ADI_BANK_STEER", 107, {-1, 1}, "ADI", "Bank steering bar")
defineFloat("ADI_PITCH_STEER", 106, {-1, 1}, "ADI", "Pitch steering bar")
defineFloat("ADI_AIRSPEED_DEV", 111, {-1, 1}, "ADI", "Airspeed deviation")
defineFloat("ADI_TRACK_DEV", 103, {-1, 1}, "ADI", "Track deviation")
defineFloat("ADI_ALT_DEV", 526, {-1, 1}, "ADI", "Altitude deviation")
defineFloat("ADI_YAW", 108, {-1, 1}, "ADI", "Yaw indicator")
-- Horizontal Situation Indicator
defineVariableStepTumb("HSI_COURSE_ROT", 30, 3001, 126, 1, "HSI", "Desired course rotary")
defineVariableStepTumb("HSI_HDG_ROT", 30, 3002, 129, 1, "HSI", "Desired heading rotary")
definePushButton("HSI_TEST", 30, 3003, 113, "HSI", "Self-test button")
defineToggleSwitch("HSI_DH_DTA_MANUAL_AUTO", 30, 3004, 54, "HSI", "DH/DTA Manual - Auto switch")
defineFloat("HSI_HDG", 112, {0, 1}, "HSI", "Heading")
defineFloat("HSI_DES_COURSE", 118, {0, 1}, "HSI", "Desired course")
defineFloat("HSI_DES_HDG", 124, {0, 1}, "HSI", "Desired heading")
defineFloat("HSI_BEARING", 115, {0, 1}, "HSI", "Bearing to radio station")
define8BitFloat("HSI_HDG_WARN_FLAG", 119, {0, 1}, "HSI", "Heading warning flag")
define8BitFloat("HSI_COURSE_WARN_FLAG", 114, {0, 1}, "HSI", "Course warning flag")
define8BitFloat("HSI_GS_WARN_FLAG", 125, {0, 1}, "HSI", "Glideslope warning flag")
defineFloat("HSI_RANGE_CNT_100", 117, {0, 1}, "HSI", "Range counter 100")
defineFloat("HSI_RANGE_CNT_10", 527, {0, 1}, "HSI", "Range counter 10")
defineFloat("HSI_RANGE_CNT_1", 528, {0, 1}, "HSI", "Range counter 1")
defineFloat("HSI_COURSE_CNT_100_10", 529, {0, 1}, "HSI", "Course counter 100/10")
defineFloat("HSI_COURSE_CNT_1", 530, {0, 1}, "HSI", "Course counter 1")
defineFloat("HSI_LONG_DEV", 127, {-1, 1}, "HSI", "Longitudinal deviation from hover position")
defineFloat("HSI_LAT_DEV", 128, {-1, 1}, "HSI", "Lateral deviation from the assigned flight path or hover position")
define8BitFloat("HSI_RANGE_NOT_AVAIL_FLAG", 116, {0, 1}, "HSI", "Range unavailable flag")
define8BitFloat("HSI_COURSE_NOT_AVAIL_FLAG", 121, {0, 1}, "HSI", "Course unavailable flag")
-- Laser Designator Panel
defineToggleSwitch("LASER_MODE", 11, 3003, 56, "Laser Designator Panel", "Laser rangefinder / designator - mode switch")
defineToggleSwitch("LASER_MODE_COVER", 11, 3002, 57, "Laser Designator Panel", "Laser rangefinder / designator - mode switch cover")
definePushButton("LASER_RESET", 11, 3004, 55, "Laser Designator Panel", "Laser designator reset button")
-- Vertical Velocity Indicator
defineFloat("VARIO_SPEED", 24, {-1, 1}, "Variometer", "Vertical speed indicator")
-- Accelerometer
defineFloat("ACCEL_G", 97, {0, 1}, "Accelerometer", "G load")
defineFloat("ACCEL_MIN", 99, {0, 1}, "Accelerometer", "Accelerometer min pointer")
defineFloat("ACCEL_MAX", 98, {0, 1}, "Accelerometer", "Accelerometer max pointer")
definePushButton("ACCEL_RESET", 61, 3001, 572, "Accelerometer", "Accelerometer reset button")
-- Radar Altimeter
defineVariableStepTumb("RALT_SAFE_ALT_KNOB", 38, 3001, 91, 1, "Radar Altimeter", "Safe altitude treshold rotary")
definePushButton("RALT_TEST", 38, 3002, 96, "Radar Altimeter", "Test button")
defineFloat("RALT_ALT", 94, {0, 1}, "Radar Altimeter", "Altitude")
defineFloat("RALT_SAFE_ALT_BUG", 93, {0, 1}, "Radar Altimeter", "Safe altitude treshold bug")
defineIndicatorLight("RALT_SAFE_ALT_LAMP", 92, "Radar Altimeter", "Safe altitude lamp")
define8BitFloat("RALT_WARN_FLAG", 95, {0, 1}, "Radar Altimeter", "Warning flag")
-- Airspeed Indicator
defineFloat("AIRSPEED", 51, {0, 1}, "Airspeed Indicator", "Airspeed indicator")
-- Rotor RPM Indicator
defineFloat("ROTOR_RPM", 52, {0, 1}, "Rotor RPM Indicator", "Rotor RPM")
-- Barometric Altimeter
definePotentiometer("ALT_QFE_KNOB", 41, 3005, 90, {0, 1}, "Barometric Altimeter", "QFE knob")
defineFloat("ALT_1000M", 87, {0, 1}, "Barometric Altimeter", "Baro alt 1000 meters")
defineFloat("ALT_100M", 573, {0, 1}, "Barometric Altimeter", "Baro alt 100 meters")
defineFloat("ALT_QFE_PRESS", 88, {0, 1}, "Barometric Altimeter", "QFE pressure scale")
defineFloat("ALT_DESIRE_ALT", 89, {0, 1}, "Barometric Altimeter", "Desire altitude bug")
-- Clock
defineTumb("CLK_L_LEVER", 29, 3001, 76, 1, {-1, 1}, nil, false, "Clock", "Left lever push/pull")
defineVariableStepTumb("CLK_L_LEVER_ROT", 29, 3003, 511, 1, "Clock", "Left lever rotary")
definePushButton("CLK_R_LEVER", 29, 3004, 77, "Clock", "Right lever push")
defineTumb("CLK_R_LEVER_ROT", 29, 3005, 525, 0.3, {-0.15, 0.15}, nil, false, "Clock", "Right lever rotary")
defineFloat("CLK_CURRTIME_HOURS", 68, {0, 1}, "Clock", "Current time - hours")
defineFloat("CLK_CURRTIME_MINUTES", 69, {0, 1}, "Clock", "Current time - minutes")
defineFloat("CLK_CURRTIME_SECONDS", 70, {0, 1}, "Clock", "Current time - seconds")
defineFloat("CLK_FLIGHT_HOURS", 72, {0, 1}, "Clock", "Flight hours")
defineFloat("CLK_FLIGHT_MINUTES", 531, {0, 1}, "Clock", "Flight minutes")
define8BitFloat("CLK_FLIGHT_TIME_METER_STATUS", 75, {0, 0.2}, "Clock", "Flight time meter status")
defineFloat("CLK_STOPWATCH_MINUTES", 73, {0, 1}, "Clock", "Stop-watch minutes")
defineFloat("CLK_STOPWATCH_SECONDS", 532, {0, 1}, "Clock", "Stop-watch seconds")
-- Rotor Pitch Indicator
defineFloat("ROTOR_PITCH", 53, {0, 1}, "Rotor Pitch Indicator", "Rotor blade pitch indicator")
-- Landing Gear Control Panel
defineToggleSwitch("GEAR_LEVER", 34, 3001, 65, "Landing Gear Control Panel", "Gear lever")
defineToggleSwitch("GEAR_EMER_HYD", 34, 3004, 66, "Landing Gear Control Panel", "Emergency gear hydraulics selector switch")
defineToggleSwitch("GEAR_EMER_HYD_COVER", 34, 3005, 67, "Landing Gear Control Panel", "Emergency gear hydraulics selector switch cover")
defineFloat("GEAR_LEVER_POS", 65, {0, 1}, "Landing Gear Control Panel", "Gear lever position")
defineIndicatorLight("GEAR_NOSE__UP", 63, "Landing Gear Control Panel", "Nose gear up lamp")
defineIndicatorLight("GEAR_NOSE_DOWN", 64, "Landing Gear Control Panel", "Nose gear down lamp")
defineIndicatorLight("GEAR_R_MAIN_UP", 61, "Landing Gear Control Panel", "Right main gear up lamp")
defineIndicatorLight("GEAR_R_MAIN_DOWN", 62, "Landing Gear Control Panel", "Right main gear down lamp")
defineIndicatorLight("GEAR_L_MAIN_UP", 59, "Landing Gear Control Panel", "Left main gear up lamp")
defineIndicatorLight("GEAR_L_MAIN_DOWN", 60, "Landing Gear Control Panel", "Left main gear down lamp")


---------------------------------------------------------------------
-- Center Panel
---------------------------------------------------------------------
-- HUD
define8BitFloat("HUD_FILTER_POS", 509, {0, 1}, "HUD", "Filter position")
define8BitFloat("HUD_FILTER_HANDLE_POS", 510, {0, 1}, "HUD", "Filter lever position")
definePotentiometer("HUD_BRIGHTNESS", 7, 3001, 8, {0, 1}, "HUD", "Brightness knob")
defineTumb("HUD_MODE", 7, 3002, 9, 1, {-1, 1}, nil, false, "HUD", "Reticle/Night/Day mode selector")
definePushButton("HUD_TEST", 7, 3003, 7, "HUD", "Self-test button")
defineToggleSwitch("HUD_FILTER_HANDLE", 7, 3004, 510, "HUD", "Filter lever switch")
-- PUI-800 Weapon Status and Control Panel
defineToggleSwitch("WEAPONS_MASTER_ARM", 12, 3001, 387, "Weapons Control Panel", "Master arm switch")
definePushButton("WEAPONS_JETTISON_AA_MIS", 12, 3002, 401, "Weapons Control Panel", "Emergency jettison of AA missiles button (no function)")
definePushButton("WEAPONS_JETTISON_EXT", 12, 3003, 402, "Weapons Control Panel", "External stores jettison button (except Vikhr)")
defineToggleSwitch("WEAPONS_JETTISON_ARM_MODE", 12, 3022, 396, "Weapons Control Panel", "Jettison arm mode - arm fuse/disarm fuse switch")
defineToggleSwitch("WEAPONS_MANUAL_AUTO", 12, 3005, 403, "Weapons Control Panel", "Manual/Auto weapon system control switch")
defineToggleSwitch("WEAPONS_CANNON_ROUND", 12, 3006, 399, "Weapons Control Panel", "Cannon round selector switch HE/AP")
defineMultipositionSwitch("WEAPONS_CANNON_BURST", 12, 3004, 400, 3, 0.1, "Weapons Control Panel", "Long-medium-short cannon burst mode switch")
defineToggleSwitch("WEAPONS_CANNON_RATE", 12, 3020, 398, "Weapons Control Panel", "Cannon rate of fire setting switch")
defineToggleSwitch("WEAPONS_EXPEDITE_ATGM_JETTISON", 12, 3021, 397, "Weapons Control Panel", "Expedite emergency ATGM launch switch")
defineIndicatorLight("WEAPONS_PRESENT_STATION_1", 392, "Weapons Control Panel", "Weapon is present on station 1 light")
defineIndicatorLight("WEAPONS_PRESENT_STATION_2", 393, "Weapons Control Panel", "Weapon is present on station 2 light")
defineIndicatorLight("WEAPONS_PRESENT_STATION_3", 394, "Weapons Control Panel", "Weapon is present on station 3 light")
defineIndicatorLight("WEAPONS_PRESENT_STATION_4", 395, "Weapons Control Panel", "Weapon is present on station 4 light")
defineIndicatorLight("WEAPONS_RDY_STATION_1", 388, "Weapons Control Panel", "Weapon is ready to fire on station 1 light")
defineIndicatorLight("WEAPONS_RDY_STATION_2", 389, "Weapons Control Panel", "Weapon is ready to fire on station 2 light")
defineIndicatorLight("WEAPONS_RDY_STATION_3", 390, "Weapons Control Panel", "Weapon is ready to fire on station 3 light")
defineIndicatorLight("WEAPONS_RDY_STATION_4", 391, "Weapons Control Panel", "Weapon is ready to fire on station 4 light")
local indPUI800 = nil
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	indPUI800 = parse_indication(6)
end
local function getPUI800_txt_weap_type()
	if not indPUI800 then return "  " end
	if indPUI800.txt_weap_type_AT ~= nil then return "AT" end
	if indPUI800.txt_weap_type_RT ~= nil then return "RT" end
	if indPUI800.txt_weap_type_Iron_Bomb ~= nil then return "IB" end
	if indPUI800.txt_weap_type_Gun_Pod ~= nil then return "GP" end
	return "  "
end
local function getPUI800_txt_weap_count()
	if not indPUI800 then return "  " end
	return indPUI800.txt_weap_count or "  "
end
local function getPUI800_txt_cannon_count()
	if not indPUI800 then return "  " end
	return indPUI800.txt_cannon_count or "  "
end
defineString("WEAPONS_DISPLAY_STORE_TYPE", getPUI800_txt_weap_type, 2, "Weapons Control Panel", "Display store type")
defineString("WEAPONS_DISPLAY_WEAPON_REMAIN", getPUI800_txt_weap_count, 2, "Weapons Control Panel", "Display selected weapons remaining")
defineString("WEAPONS_DISPLAY_CANNON_REMAIN", getPUI800_txt_cannon_count, 2, "Weapons Control Panel", "Display cannon round remaining")
-- Targeting Display Control Panel
defineToggleSwitch("SHKVAL_POLARITY", 8, 3001, 404, "Targeting Display Control Panel", "SHKVAL Black-White indication switch")
definePotentiometer("HMS_BRIGHTNESS", 23, 3001, 405, {0, 1}, "Targeting Display Control Panel", "Helmet device brightness knob")
definePotentiometer("SHKVAL_BRIGHTNESS", 8, 3002, 406, {0, 1}, "Targeting Display Control Panel", "SHKVAL brightness knob")
definePotentiometer("SKHVAL_CONTRAST", 8, 3003, 407, {0, 1}, "Targeting Display Control Panel", "SHKVAL contrast knob")
defineTumb("LASER_CODE", 12, 3007, 408, 0.1, {0, 0.2}, nil, false, "Targeting Display Control Panel", "Laser code selector")
defineToggleSwitch("HUD_DECLUTTER", 41, 3001, 409, "Targeting Display Control Panel", "HUD/TV declutter switch")
defineToggleSwitch("TRACER", 8, 3004, 410, "Targeting Display Control Panel", "Tracer switch (no function)")
defineTumb("SHKVAL_OPTICS_ADJ", 8, 3005, 411, 0.1, {0, 0.7}, nil, false, "Targeting Display Control Panel", "SHKVAL Optics adjustment selector (no function)")
-- Landing Lights & Voice Warning Control Panel
defineMultipositionSwitch("LIGHT_LANDING_ON_RETR_OFF", 44, 3001, 382, 3, 0.5, "Landing Lights & Voice Warning Control Panel", "Landing light On/Retraction/Off switch")
defineToggleSwitch("LIGHT_LANDING_MAIN_BACKUP", 44, 3002, 383, "Landing Lights & Voice Warning Control Panel", "Main/Backup landing light switch")
defineMultipositionSwitch("ADF_NDB_MODE", 46, 3003, 381, 3, 0.5, "Landing Lights & Voice Warning Control Panel", "ADF Inner-Auto-Outer NDB switch")
definePushButton("VOICE_MSG_OFF", 13, 3001, 384, "Landing Lights & Voice Warning Control Panel", "Voice message system messages OFF button")
defineToggleSwitch("VOICE_MSG_EMER", 13, 3002, 386, "Landing Lights & Voice Warning Control Panel", "Voice message system emergency ON switch")
definePushButton("VOICE_MSG_REPEAT", 13, 3003, 385, "Landing Lights & Voice Warning Control Panel", "Voice message system messages repeat button")


---------------------------------------------------------------------
-- Right Forward Panel
---------------------------------------------------------------------
-- EKRAN Warning System display
local function parse_EKRAN()
	local ret = {}
	local li = list_indication(4)
	if li == "" then return nil end
	
	local m = li:gmatch("([^\n]*)\n")
	local newval = false
	local name = nil
	local value = {}
	
	while true do
		local line = m()
		if not line then
			if name ~= nil then
				ret[name] = value
			end
			break
		end
		if line == "-----------------------------------------" then
			newval = true
			if name ~= nil then
				ret[name] = value
				name = nil
				value = {}
			end
		else
			if newval == true then
				newval = false
				name = line
			else
				value[#value+1] = line
			end
		end
	end
	return ret
end
local indEKRAN = nil
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	indEKRAN = parse_EKRAN()
end
local function getEKRAN_memory()
    if indEKRAN == nil or indEKRAN.txt_memory == nil then return "0" end
    return "1"
end
local function getEKRAN_queue()
	if indEKRAN == nil or indEKRAN.txt_queue == nil then return "0" end
    return "1"
end
local function getEKRAN_failure()
	if indEKRAN == nil or indEKRAN.txt_failure == nil then return "0" end
    return "1"
end
defineString("EKRAN_MEMORY", getEKRAN_memory, 1, "EKRAN", "Memory message")
defineString("EKRAN_QUEUE", getEKRAN_queue, 1, "EKRAN", "Queue message")
defineString("EKRAN_FAILURE", getEKRAN_failure, 1, "EKRAN", "Failure message")
local function getEKRAN_txt1_line1()
	if indEKRAN == nil or indEKRAN.txt_1 == nil then return "          " end
	return indEKRAN.txt_1[1] or "          "
end
local function getEKRAN_txt1_line2()
	if indEKRAN == nil or indEKRAN.txt_1 == nil then return "          " end
	return indEKRAN.txt_1[2] or "          "
end
local function getEKRAN_txt1_line3()
	if indEKRAN == nil or indEKRAN.txt_1 == nil then return "          " end
	return indEKRAN.txt_1[3] or "          "
end
local function getEKRAN_txt1_line4()
	if indEKRAN == nil or indEKRAN.txt_1 == nil then return "          " end
	return indEKRAN.txt_1[4] or "          "
end
defineString("EKRAN_TXT1_LINE1", getEKRAN_txt1_line1, 10, "EKRAN", "EKRAN txt 1 line 1")
defineString("EKRAN_TXT1_LINE2", getEKRAN_txt1_line2, 10, "EKRAN", "EKRAN txt 1 line 2")
defineString("EKRAN_TXT1_LINE3", getEKRAN_txt1_line3, 10, "EKRAN", "EKRAN txt 1 line 3")
defineString("EKRAN_TXT1_LINE4", getEKRAN_txt1_line4, 10, "EKRAN", "EKRAN txt 1 line 4")
local function getEKRAN_txt2_line1()
	if indEKRAN == nil or indEKRAN.txt_2 == nil then return "          " end
	return indEKRAN.txt_2[1] or "          "
end
local function getEKRAN_txt2_line2()
	if indEKRAN == nil or indEKRAN.txt_2 == nil then return "          " end
	return indEKRAN.txt_2[2] or "          "
end
local function getEKRAN_txt2_line3()
	if indEKRAN == nil or indEKRAN.txt_2 == nil then return "          " end
	return indEKRAN.txt_2[3] or "          "
end
local function getEKRAN_txt2_line4()
	if indEKRAN == nil or indEKRAN.txt_2 == nil then return "          " end
	return indEKRAN.txt_2[4] or "          "
end
defineString("EKRAN_TXT2_LINE1", getEKRAN_txt2_line1, 10, "EKRAN", "EKRAN txt 2 line 1")
defineString("EKRAN_TXT2_LINE2", getEKRAN_txt2_line2, 10, "EKRAN", "EKRAN txt 2 line 2")
defineString("EKRAN_TXT2_LINE3", getEKRAN_txt2_line3, 10, "EKRAN", "EKRAN txt 2 line 3")
defineString("EKRAN_TXT2_LINE4", getEKRAN_txt2_line4, 10, "EKRAN", "EKRAN txt 2 line 4")
-- Standby Attitude Indicator (SAI)
defineTumb("SAI_CTRL", 55, 3001, 141, 1, {-1, 1}, nil, false, "SAI", "Cage/control handle push/pull")
defineVariableStepTumb("SAI_CTRL_ROT", 55, 3003, 597, 1, "SAI", "Cage/control handle rotary")
defineFloat("SAI_ROLL", 142, {-1, 1}, "SAI", "Roll")
defineFloat("SAI_PITCH", 143, {-1, 1}, "SAI", "Pitch")
defineFloat("SAI_YAW", 144, {-1, 1}, "SAI", "Yaw")
define8BitFloat("SAI_WARN_FLAG", 145, {0, 1}, "SAI", "Warning flag")
defineFloat("SAI_LONG_DEV", 599, {-1, 1}, "SAI", "Longitudinal deviation")
defineFloat("SAI_LAT_DEV", 613, {-1, 1}, "SAI", "Lateral deviation")
-- Exhaust Gas Temperature Indicator
definePushButton("ENG_RUNNING_EGT_TEST", 4, 3022, 131, "EGT Indicator", "Running engines EGT indicator test button")
definePushButton("ENG_STOPPED_EGT_TEST", 4, 3023, 132, "EGT Indicator", "Stopped engines EGT indicator test button")
defineFloat("ENG_L_ENG_TEMP_100", 133, {0, 1}, "EGT Indicator", "Left engine temperature 100")
defineFloat("ENG_L_ENG_TEMP_10", 566, {0, 1}, "EGT Indicator", "Left engine temperature 10")
defineFloat("ENG_R_ENG_TEMP_100", 134, {0, 1}, "EGT Indicator", "Right engine temperature 100")
defineFloat("ENG_R_ENG_TEMP_10", 567, {0, 1}, "EGT Indicator", "Right engine temperature 10")
-- Engines RPM
defineFloat("ENG_L_RPM", 135, {0, 1}, "Engines RPM", "Left engine RPM")
defineFloat("ENG_R_RPM", 136, {0, 1}, "Engines RPM", "Right engine RPM")
-- Fuel Quantity
definePushButton("FUEL_TEST", 3, 3014, 616, "Fuel Quantity", "Self test button")
defineFloat("FUEL_FORWARD_TANK", 137, {0, 1}, "Fuel Quantity", "Forward tank amount")
defineFloat("FUEL_REAR_TANK", 138, {0, 1}, "Fuel Quantity", "Rear tank amount")
defineIndicatorLight("FUEL_FORWARD_TANK_TEST", 139, "Fuel Quantity", "Forward tank test lamp")
defineIndicatorLight("FUEL_REAR_TANK_TEST", 140, "Fuel Quantity", "Rear tank test lamp")
-- ABRIS Display
definePushButton("ABRIS_BTN_1", 9, 3001, 512, "ABRIS Display", "Button 1")
definePushButton("ABRIS_BTN_2", 9, 3002, 513, "ABRIS Display", "Button 2")
definePushButton("ABRIS_BTN_3", 9, 3003, 514, "ABRIS Display", "Button 3")
definePushButton("ABRIS_BTN_4", 9, 3004, 515, "ABRIS Display", "Button 4")
definePushButton("ABRIS_BTN_5", 9, 3005, 516, "ABRIS Display", "Button 5")
defineVariableStepTumb("ABRIS_CURSOR_ROT", 9, 3006, 518, 1, "ABRIS Display", "Cursor rotary")
definePushButton("ABRIS_CURSOR_BTN", 9, 3007, 523, "ABRIS Display", "Cursor button")
definePotentiometer("ABRIS_BRIGHTNESS", 9, 3008, 517, {0, 1}, "ABRIS Display", "Brightness knob")
defineToggleSwitch("ABRIS_POWER", 9, 3009, 130, "ABRIS Display", "Power switch")


---------------------------------------------------------------------
-- Left Panel
---------------------------------------------------------------------
-- R-800L1 VHF Radio Control System
defineIndicatorLight("R800_TEST_LAMP", 419, "R-800 VHF-2", "BIT lamp")
definePushButton("R800_TEST_BTN", 48, 3001, 418, "R-800 VHF-2", "BIT button")
defineToggleSwitch("R800_AM_FM", 48, 3002, 417, "R-800 VHF-2", "AM-FM toggle switch")
defineToggleSwitch("R800_EMER_RCVR", 48, 3003, 421, "R-800 VHF-2", "Emergency receiver switch")
defineToggleSwitch("R800_ADF", 48, 3004, 422, "R-800 VHF-2", "ADF switch")
defineToggleSwitch("R800_DATA_TRANSFER_RATE", 48, 3005, 420, "R-800 VHF-2", "Data transfer rate switch")
defineToggleSwitch("R800_SQUELCH", 48, 3006, 423, "R-800 VHF-2", "Squelch button")
defineFixedStepTumb("R800_FREQ1", 48, 3007, 424, 0.04545455, {0, 1}, {-1, 1}, {"10", "11", "12", "13", "14", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39"}, "R-800 VHF-2", "Frequency 1")
defineFixedStepTumb("R800_FREQ2", 48, 3008, 425, 0.11111111, {0, 1}, {-1, 1}, nil, "R-800 VHF-2", "Frequency 2")
defineFixedStepTumb("R800_FREQ3", 48, 3009, 426, 0.11111111, {0, 1}, {-1, 1}, nil, "R-800 VHF-2", "Frequency 3")
defineFixedStepTumb("R800_FREQ4", 48, 3010, 427, 0.33333333, {0, 1}, {-1, 1}, {"00", "25", "50", "75"}, "R-800 VHF-2", "Frequency 4")
define8BitFloat("R800_FREQ1_ROT", 577, {0, 1}, "R-800 VHF-2", "Frequency 1 rotary")
define8BitFloat("R800_FREQ2_ROT", 574, {0, 1}, "R-800 VHF-2", "Frequency 2 rotary")
define8BitFloat("R800_FREQ3_ROT", 575, {0, 1}, "R-800 VHF-2", "Frequency 3 rotary")
define8BitFloat("R800_FREQ4_ROT", 576, {0, 1}, "R-800 VHF-2", "Frequency 4 rotary")
-- Targeting Mode Control Panel
defineLedPushButton("WEAPONS_AUTO_TURN_BTN", 12, 3010, 437, "Targeting Mode Control Panel", "Automatic turn on target button")
definePushButtonLed("WEAPONS_AUTO_TURN_LED", 437, "Targeting Mode Control Panel", "Automatic turn on target LED")
defineLedPushButton("WEAPONS_AIRBORNE_TARGET_BTN", 12, 3011, 438, "Targeting Mode Control Panel", "Airborne target button")
definePushButtonLed("WEAPONS_AIRBORNE_TARGET_LED", 438, "Targeting Mode Control Panel", "Airborne target LED")
defineLedPushButton("WEAPONS_FORWARD_HEMI_TARGET_BTN", 12, 3012, 439, "Targeting Mode Control Panel", "Head-on airborne target button")
definePushButtonLed("WEAPONS_FORWARD_HEMI_TARGET_LED", 439, "Targeting Mode Control Panel", "Head-on airborne target LED")
defineLedPushButton("WEAPONS_GROUND_TARGET_BTN", 12, 3013, 440, "Targeting Mode Control Panel", "Ground moving target button")
definePushButtonLed("WEAPONS_GROUND_TARGET_LED", 440, "Targeting Mode Control Panel", "Ground moving target LED")
defineLedPushButton("WEAPONS_TARGET_RESET_BTN", 12, 3016, 441, "Targeting Mode Control Panel", "Targeting mode reset button")
-- not working properly: WEAPONS_TARGET_RESET_LED
definePushButtonLed("WEAPONS_TARGET_RESET_LED", 441, "Targeting Mode Control Panel", "Targeting mode reset LED")
defineToggleSwitch("WEAPONS_TRAINING_MODE", 12, 3009, 432, "Targeting Mode Control Panel", "Training mode switch")
defineToggleSwitch("K041_POWER", 59, 3002, 433, "Targeting Mode Control Panel", "K-041 power switch")
defineToggleSwitch("HMS_POWER", 23, 3002, 434, "Targeting Mode Control Panel", "HMS/NVG power switch")
defineToggleSwitch("WEAPONS_AUTOTRACK_GUNSIGHT", 12, 3017, 436, "Targeting Mode Control Panel", "Automatic Tracking / gun sight switch")
defineToggleSwitch("LASER_STANDBY", 11, 3001, 435, "Targeting Mode Control Panel", "Laser standby ON/OFF switch")
defineTumb("WEAPONS_MODE", 12, 3014, 431, 0.1, {0, 0.4}, nil, false, "Targeting Mode Control Panel", "Weapon system mode selector")
-- Engine and APU Start-Up Controls
defineIndicatorLight("ENG_START_VLV_OPEN", 163, "Engines Start-Up Control Panel", "Engines start valve open lamp")
definePushButton("ENG_START", 4, 3005, 412, "Engines Start-Up Control Panel", "Start-up selected engine button")
definePushButton("ENG_STOP", 4, 3006, 413, "Engines Start-Up Control Panel", "Interrupt start-up button")
definePushButton("ENG_APU_STOP", 4, 3007, 414, "Engines Start-Up Control Panel", "Stop APU button")
defineMultipositionSwitch("ENG_STARTUP_MODE", 4, 3012, 415, 3, 0.1, "Engines Start-Up Control Panel", "Engine Startup/Crank/False Start selector")
defineMultipositionSwitch("ENG_SELECTOR", 4, 3008, 416, 4, 0.1, "Engines Start-Up Control Panel", "Engine selector")
-- Radio Intercom SPU-9 Panel
defineTumb("RADIO_SELECTOR", 50, 3002, 428, 0.11, {0, 0.33}, nil, false, "Radio Intercom SPU-9 Panel", "Radio communicator selector")
-- Auxiliary Power Unit (APU) Control
defineIndicatorLight("APU_FUEL_VLV_OPEN", 162, "APU control panel", "APU fuel shutoff valve is open lamp")
defineIndicatorLight("APU_OIL_PRESS", 168, "APU control panel", "APU oil pressure lamp")
defineIndicatorLight("APU_STOP_RPM", 169, "APU control panel", "APU shutdown due to RPM limit lamp")
defineIndicatorLight("APU_OPER", 174, "APU control panel", "APU operating lamp")
defineFloat("APU_TEMP", 6, {0, 1}, "APU control panel", "APU temperature")
-- Engines Cut-Off Valves
defineToggleSwitch("ENG_L_CUTOFF_VLV_HANDLE", 4, 3009, 554, "Engines Cut-Off Valves", "Left engine cut-off valve handle")
defineToggleSwitch("ENG_R_CUTOFF_VLV_HANDLE", 4, 3010, 555, "Engines Cut-Off Valves", "Right engine cut-off valve handle")
define8BitFloat("ENG_L_CUTOFF_VLV_HANDLE_POS", 554, {0, 1}, "Engines Cut-Off Valves", "Left engine cut-off valve handle pos")
define8BitFloat("ENG_R_CUTOFF_VLV_HANDLE_POS", 555, {0, 1}, "Engines Cut-Off Valves", "Right engine cut-off valve handle pos")
defineToggleSwitch("ENG_ROTOR_BREAK", 4, 3011, 556, "Engines Cut-Off Valves", "Rotor break")


---------------------------------------------------------------------
-- Right Panel
---------------------------------------------------------------------
-- PVI-800 Navigation Control Panel 
local indPVI = nil
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	indPVI = parse_indication(5)
end
local function getPVI_line1_sign()
	if not indPVI then return " " end
	return indPVI.txt_VIT_sign or " "
end
local function getPVI_line2_sign()
	if not indPVI then return " " end
	return indPVI.txt_NIT_sign or " "
end
local function getPVI_line1_text()
	if not indPVI then return "      " end
	return indPVI.txt_VIT or "      "
end
local function getPVI_line2_text()
	if not indPVI then return "      " end
	return indPVI.txt_NIT or "      "
end
local function getPVI_line1_point()
	if not indPVI then return " " end
	return indPVI.txt_OIT_PPM or " "
end
local function getPVI_line2_point()
	if not indPVI then return " " end
	return indPVI.txt_OIT_NOT or " "
end
local function getPVI_line1_apostrophe1()
	if not indPVI then return " " end
	return indPVI.txt_VIT_apostrophe1 or " "
end
local function getPVI_line1_apostrophe2()
	if not indPVI then return " " end
	return indPVI.txt_VIT_apostrophe2 or " "
end
local function getPVI_line2_apostrophe1()
	if not indPVI then return " " end
	return indPVI.txt_NIT_apostrophe1 or " "
end
local function getPVI_line2_apostrophe2()
	if not indPVI then return " " end
	return indPVI.txt_NIT_apostrophe2 or " "
end
defineString("PVI_LINE1_SIGN", getPVI_line1_sign, 1, "PVI-800 Control Panel", "Display top line sign")
defineString("PVI_LINE2_SIGN", getPVI_line2_sign, 1, "PVI-800 Control Panel", "Display bottom line sign")
defineString("PVI_LINE1_TEXT", getPVI_line1_text, 6, "PVI-800 Control Panel", "Display top line text")
defineString("PVI_LINE2_TEXT", getPVI_line2_text, 6, "PVI-800 Control Panel", "Display bottom line text")
defineString("PVI_LINE1_POINT", getPVI_line1_point, 1, "PVI-800 Control Panel", "Display top line waypoint")
defineString("PVI_LINE2_POINT", getPVI_line2_point, 1, "PVI-800 Control Panel", "Display bottom line airfield/fixed/target/correction point")
defineString("PVI_LINE1_APOSTROPHE1", getPVI_line1_apostrophe1, 1, "PVI-800 Control Panel", "Display top line apostrophe 1")
defineString("PVI_LINE1_APOSTROPHE2", getPVI_line1_apostrophe2, 1, "PVI-800 Control Panel", "Display top line apostrophe 2")
defineString("PVI_LINE2_APOSTROPHE1", getPVI_line2_apostrophe1, 1, "PVI-800 Control Panel", "Display bottom line apostrophe 1")
defineString("PVI_LINE2_APOSTROPHE2", getPVI_line2_apostrophe2, 1, "PVI-800 Control Panel", "Display bottom line apostrophe 2")
defineLedPushButton("PVI_0", 20, 3001, 312, "PVI-800 Control Panel", "'0' button")
defineLedPushButton("PVI_1", 20, 3002, 303, "PVI-800 Control Panel", "'1' button")
defineLedPushButton("PVI_2", 20, 3003, 304, "PVI-800 Control Panel", "'2' button")
defineLedPushButton("PVI_3", 20, 3004, 305, "PVI-800 Control Panel", "'3' button")
defineLedPushButton("PVI_4", 20, 3005, 306, "PVI-800 Control Panel", "'4' button")
defineLedPushButton("PVI_5", 20, 3006, 307, "PVI-800 Control Panel", "'5' button")
defineLedPushButton("PVI_6", 20, 3007, 308, "PVI-800 Control Panel", "'6' button")
defineLedPushButton("PVI_7", 20, 3008, 309, "PVI-800 Control Panel", "'7' button")
defineLedPushButton("PVI_8", 20, 3009, 310, "PVI-800 Control Panel", "'8' button")
defineLedPushButton("PVI_9", 20, 3010, 311, "PVI-800 Control Panel", "'9' button")
defineLedPushButton("PVI_WAYPOINTS_BTN", 20, 3011, 315, "PVI-800 Control Panel", "Waypoints button")
definePushButtonLed("PVI_WAYPOINTS_LED", 315, "PVI-800 Control Panel", "Waypoints LED")
defineLedPushButton("PVI_INU_INFLIGHT_REALIGN_BTN", 20, 3012, 519, "PVI-800 Control Panel", "Inflight INU Realignment button")
definePushButtonLed("PVI_INU_INFLIGHT_REALIGN_LED", 519, "PVI-800 Control Panel", "Inflight INU Realignment LED")
defineLedPushButton("PVI_FIXPOINTS_BTN", 20, 3013, 316, "PVI-800 Control Panel", "Fixpoints button")
definePushButtonLed("PVI_FIXPOINTS_LED", 316, "PVI-800 Control Panel", "Fixpoints LED")
defineLedPushButton("PVI_INU_PRECISE_ALIGN_BTN", 20, 3014, 520, "PVI-800 Control Panel", "Precise INU Alignment button")
definePushButtonLed("PVI_INU_PRECISE_ALIGN_LED", 520, "PVI-800 Control Panel", "Precise INU Alignment LED")
defineLedPushButton("PVI_AIRFIELDS_BTN", 20, 3015, 317, "PVI-800 Control Panel", "Airfields button")
definePushButtonLed("PVI_AIRFIELDS_LED", 317, "PVI-800 Control Panel", "Airfields LED")
defineLedPushButton("PVI_INU_NORMAL_ALIGN_BTN", 20, 3016, 521, "PVI-800 Control Panel", "Normal INU Alignment button")
definePushButtonLed("PVI_INU_NORMAL_ALIGN_LED", 521, "PVI-800 Control Panel", "Normal INU Alignment LED")
defineLedPushButton("PVI_TARGETS_BTN", 20, 3017, 318, "PVI-800 Control Panel", "Targets button")
definePushButtonLed("PVI_TARGETS_LED", 318, "PVI-800 Control Panel", "Targets LED")
defineLedPushButton("PVI_ENTER_BTN", 20, 3018, 313, "PVI-800 Control Panel", "Enter button")
definePushButtonLed("PVI_ENTER_LED", 313, "PVI-800 Control Panel", "Enter LED")
defineLedPushButton("PVI_RESET_BTN", 20, 3019, 314, "PVI-800 Control Panel", "Cancel button")
definePushButtonLed("PVI_RESET_LED", 314, "PVI-800 Control Panel", "Cancel LED")
defineLedPushButton("PVI_INIT_PNT_BTN", 20, 3020, 522, "PVI-800 Control Panel", "Initial Nav Pos button")
definePushButtonLed("PVI_INIT_PNT_LED", 522, "PVI-800 Control Panel", "Initial Nav Pos LED")
defineLedPushButton("PVI_SELF_COOR_BTN", 20, 3021, 319, "PVI-800 Control Panel", "Self coordinates button")
definePushButtonLed("PVI_SELF_COOR_LED", 319, "PVI-800 Control Panel", "Self coordinates LED")
defineLedPushButton("PVI_DTA_DH_BTN", 20, 3022, 320, "PVI-800 Control Panel", "Course:Course Deviation/Time/Range to WPT button")
definePushButtonLed("PVI_DTA_DH_LED", 320, "PVI-800 Control Panel", "Course:Course Deviation/Time/Range to WPT LED")
defineLedPushButton("PVI_WIND_HDG_SPEED_BTN", 20, 3023, 321, "PVI-800 Control Panel", "Wind Heading/Speed button")
definePushButtonLed("PVI_WIND_HDG_SPEED_LED", 321, "PVI-800 Control Panel", "Wind Heading/Speed LED")
defineLedPushButton("PVI_THDG_TIME_RANGE_BTN", 20, 3024, 322, "PVI-800 Control Panel", "True Heading/Time/Range to final WPT button")
definePushButtonLed("PVI_THDG_TIME_RANGE_LED", 322, "PVI-800 Control Panel", "True Heading/Time/Range to final WPT LED")
defineLedPushButton("PVI_BEARING_RANGE_BTN", 20, 3025, 323, "PVI-800 Control Panel", "Bearing/Range to target button")
definePushButtonLed("PVI_BEARING_RANGE_LED", 323, "PVI-800 Control Panel", "Bearing/Range to target LED")
defineToggleSwitch("PVI_INU_FIX", 20, 3028, 325, "PVI-800 Control Panel", "INU fixtaking method switch")
defineToggleSwitch("PVI_POWER", 25, 3016, 326, "PVI-800 Control Panel", "Datalink power switch")
defineTumb("PVI_MODES", 20, 3026, 324, 0.1, {0, 0.6}, nil, false, "PVI-800 Control Panel", "Master mode selector")
definePotentiometer("PVI_BRIGHTNESS", 20, 3029, 327, {0, 1}, "PVI-800 Control Panel", "Brightness knob")
-- PVTz-800 Off-Board Targeting Data Link Mode Panel 
defineTumb("DLNK_SELF_ID", 25, 3014, 328, 0.1, {0, 0.3}, nil, false, "Datalink Mode Panel", "Datalink self ID selector")
defineTumb("DLNK_MASTER_MODE", 25, 3015, 329, 0.1, {0, 0.3}, nil, false, "Datalink Mode Panel", "Datalink master mode selector")
-- Autopilot Panel 
defineLedPushButton("AP_BANK_HOLD_BTN", 33, 3001, 330, "Autopilot Panel", "Bank hold button")
definePushButtonLed("AP_BANK_HOLD_LED", 330, "Autopilot Panel", "Bank hold LED")
defineLedPushButton("AP_HDG_HOLD_BTN", 33, 3002, 332, "Autopilot Panel", "Heading hold button")
definePushButtonLed("AP_HDG_HOLD_LED", 332, "Autopilot Panel", "Heading hold LED")
defineLedPushButton("AP_PITCH_HOLD_BTN", 33, 3003, 331, "Autopilot Panel", "Pitch hold button")
definePushButtonLed("AP_PITCH_HOLD_LED", 331, "Autopilot Panel", "Pitch hold LED")
defineLedPushButton("AP_ALT_HOLD_BTN", 33, 3004, 333, "Autopilot Panel", "Altitude hold button")
definePushButtonLed("AP_ALT_HOLD_LED", 333, "Autopilot Panel", "Altitude hold LED")
defineLedPushButton("AP_FD_BTN", 33, 3005, 334, "Autopilot Panel", "Flight director button")
definePushButtonLed("AP_FD_LED", 334, "Autopilot Panel", "Flight director LED")
defineMultipositionSwitch("AP_BARO_RALT", 33, 3006, 335, 3, 0.5, "Autopilot Panel", "BARO/RALT altitude hold mode switch")
defineMultipositionSwitch("AP_DH_DT", 28, 3003, 336, 3, 0.5, "Autopilot Panel", "DH/DT switch")
-- Magnetic Variation Panel
defineVariableStepTumb("ZMS3_MAGVAR_SELECTOR", 58, 3001, 338, 1, "Magnetic Variation Panel", "Magnetic variation selection rotaty")
defineFloat("ZMS3_MAGVAR_CNT_100_10", 337, {-1, 1}, "Magnetic Variation Panel", "Magnetic variation counter 100/10")
defineFloat("ZMS3_MAGVAR_CNT_1", 596, {0, 1}, "Magnetic Variation Panel", "Magnetic variation counter 1")
-- Shkval optics scan rate
defineTumb("SHKVAL_OPTICS_SCAN_RATE", 8, 3006, 301, 0.1, {0, 0.7}, nil, false, "SHKVAL Scan Rate", "SHKVAL scan rate selector")
-- Latitude Correction Panel
defineToggleSwitch("PSHK7_NORTH_SOUTH", 57, 3002, 341, "Latitude Correction Panel", "North/South latitude selection switch")
defineVariableStepTumb("PSHK7_LAT_ROT", 57, 3001, 340, 1, "Latitude Correction Panel", "Latitude selection rotaty")
defineFloat("PSHK7_LAT_CNT_10", 339, {0, 1}, "Latitude Correction Panel", "Latitude counter 10")
defineFloat("PSHK7_LAT_CNT_1", 594, {0, 1}, "Latitude Correction Panel", "Latitude counter 1")
defineIndicatorLight("PSHK7_AUTO", 342, "Latitude Correction Panel", "Latitude AUTO lamp")
-- Automatic Direction Finder (ADF) ARK-22
defineTumb("ADF_CHANNEL", 46, 3001, 357, 0.1, {0.0, 0.9}, nil, true, "ADF", "Channel selector")
defineToggleSwitch("ADF_CMPS_ANT", 46, 3004, 356, "ADF", "COMPASS-ANTENNA modes switch")
defineToggleSwitch("ADF_TLF_TLG", 46, 3005, 354, "ADF", "TLF-TLG modes switch")
definePotentiometer("ADF_VOLUME", 46, 3006, 353, {0, 1}, "ADF", "Volume knob")
definePushButton("ADF_TEST", 46, 3007, 355, "ADF", "Self-test button")
-- R-828 Radio Control Panel
defineTumb("R828_CHANNEL", 49, 3001, 371, 0.1, {0, 0.9}, nil, true, "R-828 VHF-1", "Radio channel selector")
definePotentiometer("R828_VOLUME", 49, 3002, 372, {0, 1}, "R-828 VHF-1", "Radio Volume")
definePushButton("R828_TUNER", 49, 3003, 373, "R-828 VHF-1", "Tuner button")
defineToggleSwitch("R828_SQUELCH", 49, 3004, 374, "R-828 VHF-1", "Squelch switch")
defineIndicatorLight("R828_TUNER_LAMP", 375, "R-828 VHF-1", "Tuner indicator lamp")
-- Signal Flare Panel
defineToggleSwitch("FLARES_RED", 52, 3002, 376, "Signal Flares", "Signal flare red button")
defineToggleSwitch("FLARES_GREEN", 52, 3001, 377, "Signal Flares", "Signal flare green button")
defineToggleSwitch("FLARES_WHITE", 52, 3003, 378, "Signal Flares", "Signal flare white button")
defineToggleSwitch("FLARES_YELLOW", 52, 3004, 379, "Signal Flares", "Signal flare yellow button")
defineToggleSwitch("FLARES_POWER", 52, 3005, 380, "Signal Flares", "Signal flare system power")


---------------------------------------------------------------------
-- Wall Panel
---------------------------------------------------------------------
-- Electrical Power Controls
defineIndicatorLight("ELEC_LAMP_AC_GROUND_POWER", 586, "Electrics Power", "AC ground power lamp")
defineIndicatorLight("ELEC_LAMP_DC_GROUND_POWER", 261, "Electrics Power", "DC ground power lamp")
defineToggleSwitch("ELEC_DC_GROUND_POWER", 2, 3001, 262, "Electrics Power", "DC ground power switch")
defineToggleSwitch("ELEC_DC_GROUND_POWER_COVER", 2, 3002, 263, "Electrics Power", "DC ground power switch cover")
defineToggleSwitch("ELEC_BATTERY_2", 2, 3003, 543, "Electrics Power", "Battery 2 switch")
defineToggleSwitch("ELEC_BATTERY_2_COVER", 2, 3004, 544, "Electrics Power", "Battery 2 switch cover")
defineToggleSwitch("ELEC_BATTERY_1", 2, 3005, 264, "Electrics Power", "Battery 1 switch")
defineToggleSwitch("ELEC_BATTERY_1_COVER", 2, 3006, 265, "Electrics Power", "Battery 1 switch cover")
defineToggleSwitch("ELEC_AC_GROUND_POWER", 2, 3007, 267, "Electrics Power", "AC ground power switch")
defineToggleSwitch("ELEC_AC_L_GEN", 2, 3008, 268, "Electrics Power", "AC left generator switch")
defineToggleSwitch("ELEC_AC_R_GEN", 2, 3009, 269, "Electrics Power", "AC right generator switch")
defineMultipositionSwitch("ELEC_DC_AC", 2, 3010, 270, 3, 0.1, "Electrics Power", "DC/AC inverter switch")
-- Radio and Data Link Power Control Panel
defineToggleSwitch("COMM_INTERCOM_POWER", 50, 3001, 284, "Comms Power", "Intercom power switch")
defineToggleSwitch("COMM_VHF1_POWER", 49, 3005, 285, "Comms Power", "VHF-1 (R828) power switch")
defineToggleSwitch("COMM_VHF2_POWER", 48, 3011, 286, "Comms Power", "VHF-2 (R-800) power switch")
defineToggleSwitch("COMM_DATALINK_TLK_POWER", 25, 3017, 287, "Comms Power", "Radio equipment datalink TLK power switch")
defineToggleSwitch("COMM_DATALINK_VHF_TLK_POWER", 25, 3018, 288, "Comms Power", "Radio equipment datalink VHF TLK power switch")
defineToggleSwitch("COMM_DATALINK_SA_TLF_POWER", 0, 3007, 289, "Comms Power", "Radio equipment datalink SA-TLF power switch (no function)")
-- Fuel Boost Pump Controls
defineToggleSwitch("FUEL_FORWARD_PUMP_POWER", 3, 3001, 271, "Fuel System", "Forward fuel tank pumps power switch")
defineToggleSwitch("FUEL_AFT_PUMP_POWER", 3, 3002, 272, "Fuel System", "Rear fuel tank pumps power switch")
defineToggleSwitch("FUEL_INNER_PUMP_POWER", 3, 3003, 273, "Fuel System", "Inner external fuel tanks pumps power switch")
defineToggleSwitch("FUEL_OUTER_PUMP_POWER", 3, 3004, 274, "Fuel System", "Outer external fuel tanks pumps power switch")
defineToggleSwitch("FUEL_METER_POWER", 3, 3005, 275, "Fuel System", "Fuelmeter power switch")
-- Fire Extinguishers Control Panel
defineIndicatorLight("FIREEXT_L_ENG_FIRE", 237, "Fire Extinguishers Control Panel", "Left engine fire lamp")
defineIndicatorLight("FIREEXT_APU_FIRE", 239, "Fire Extinguishers Control Panel", "APU fire lamp")
defineIndicatorLight("FIREEXT_HYDRAULICS_FIRE", 568, "Fire Extinguishers Control Panel", "Hydraulics fire lamp")
defineIndicatorLight("FIREEXT_R_ENG_FIRE", 241, "Fire Extinguishers Control Panel", "Right engine fire lamp")
defineIndicatorLight("FIREEXT_VENT_FIRE", 243, "Fire Extinguishers Control Panel", "Ventilator fire lamp")
defineIndicatorLight("FIREEXT_BOTTLE1", 244, "Fire Extinguishers Control Panel", "Extinguishing bottle 1 is ready lamp")
defineIndicatorLight("FIREEXT_BOTTLE2", 245, "Fire Extinguishers Control Panel", "Extinguishing bottle 2 is ready lamp")
definePushButton("FIREEXT_L_ENG_EXT", 40, 3001, 236, "Fire Extinguishers Control Panel", "Left engine extinguisher button")
definePushButton("FIREEXT_APU_EXT", 40, 3002, 238, "Fire Extinguishers Control Panel", "APU extinguisher button")
definePushButton("FIREEXT_R_ENG_EXT", 40, 3003, 240, "Fire Extinguishers Control Panel", "Right engine extinguisher button")
definePushButton("FIREEXT_VENT_EXT", 40, 3004, 242, "Fire Extinguishers Control Panel", "Ventilator extinguisher button")
defineMultipositionSwitch("FIREEXT_EXT_MODE", 40, 3005, 248, 3, 0.1, "Fire Extinguishers Control Panel", "Fire extinguisher Work / Off / Test switch")
defineToggleSwitch("FIREEXT_EXT_MODE_COVER", 40, 3007, 249, "Fire Extinguishers Control Panel", "Fire extinguisher Work / Off / Test switch cover")
defineToggleSwitch("FIREEXT_MONITOR", 40, 3008, 250, "Fire Extinguishers Control Panel", "Fire monitor switch")
defineToggleSwitch("FIREEXT_AUTO_MANUAL", 40, 3009, 246, "Fire Extinguishers Control Panel", "Fire extinguisher First (Auto) / Second (Manual) selector")
defineToggleSwitch("FIREEXT_AUTO_MANUAL_COVER", 40, 3010, 247, "Fire Extinguishers Control Panel", "Fire extinguisher First (Auto) / Second (Manual) selector cover")
defineMultipositionSwitch("FIREEXT_WARN_TEST", 40, 3011, 251, 4, 0.1, "Fire Extinguishers Control Panel", "Fire warning sensors group BIT switch")
-- Fuel Shutoff Valve Control
defineToggleSwitch("FUEL_L_ENG_VLV", 3, 3006, 276, "Fuel System", "Left engine fuel valve switch")
defineToggleSwitch("FUEL_L_ENG_VLV_COVER", 3, 3007, 277, "Fuel System", "Left engine fuel valve switch cover")
defineToggleSwitch("FUEL_R_ENG_VLV", 3, 3008, 278, "Fuel System", "Right engine fuel valve switch")
defineToggleSwitch("FUEL_R_ENG_VLV_COVER", 3, 3009, 279, "Fuel System", "Right engine fuel valve switch cover")
defineToggleSwitch("FUEL_APU_VLV", 3, 3010, 280, "Fuel System", "APU fuel valve switch")
defineToggleSwitch("FUEL_APU_VLV_COVER", 3, 3011, 281, "Fuel System", "APU fuel valve switch cover")
defineToggleSwitch("FUEL_XFEED_VLV", 3, 3012, 282, "Fuel System", "Fuel crossfeed valve switch")
defineToggleSwitch("FUEL_XFEED_VLV_COVER", 3, 3013, 283, "Fuel System", "Fuel crossfeed valve switch cover")
-- Pilot Ejection System Controls
defineToggleSwitch("EJECT_POWER_1", 6, 3001, 214, "Ejection System", "Ejecting system power 1 switch")
defineToggleSwitch("EJECT_POWER_2", 6, 3002, 215, "Ejection System", "Ejecting system power 2 switch")
defineToggleSwitch("EJECT_POWER_3", 6, 3003, 216, "Ejection System", "Ejecting system power 3 switch")
defineToggleSwitch("EJECT_POWER_COVER", 6, 3004, 217, "Ejection System", "Ejecting system power cover")
-- Engines Power Indicator
defineFloat("ENG_NOMINAL_MODE_PRESS", 592, {0, 1}, "Engines Power Indicator", "Engines nominal mode pressure")
defineFloat("ENG_L_ENG_PRESS", 234, {0, 1}, "Engines Power Indicator", "Left engine pressure")
defineFloat("ENG_R_ENG_PRESS", 235, {0, 1}, "Engines Power Indicator", "Right engine pressure")
-- Oil Pressure and Temperature Gauges
defineFloat("OIL_L_ENG_PRESS", 252, {0, 1}, "Oil Pressure and Temperature", "Left engine oil pressure")
defineFloat("OIL_R_ENG_PRESS", 253, {0, 1}, "Oil Pressure and Temperature", "Right engine oil pressure")
defineFloat("OIL_GEARBOX_PRESS", 254, {0, 1}, "Oil Pressure and Temperature", "Transmission oil pressure")
defineFloat("OIL_L_ENG_TEMP", 255, {0, 1}, "Oil Pressure and Temperature", "Left engine oil temperature")
defineFloat("OIL_R_ENG_TEMP", 256, {0, 1}, "Oil Pressure and Temperature", "Right engine oil temperature")
defineFloat("OIL_GEARBOX_TEMP", 257, {0, 1}, "Oil Pressure and Temperature", "Transmission oil temperature")
-- Onboard Equipment Control Panel
defineToggleSwitch("HYD_POWER", 5, 3001, 220, "Onboard Equipment Control Panel", "Main hydraulics power switch")
defineToggleSwitch("HYD_POWER_COVER", 5, 3002, 221, "Onboard Equipment Control Panel", "Main hydraulics power switch cover")
defineToggleSwitch("IFF_POWER", 42, 3001, 218, "Onboard Equipment Control Panel", "IFF power switch")
defineToggleSwitch("IFF_POWER_COVER", 42, 3002, 219, "Onboard Equipment Control Panel", "IFF power switch cover")
defineToggleSwitch("NAV_POWER", 59, 3001, 222, "Onboard Equipment Control Panel", "Navigation system power switch")
definePushButton("SHKVAL_WINDSCREEN_WIPER", 8, 3007, 224, "Onboard Equipment Control Panel", "SHKVAL windscreen wiper button")
defineToggleSwitch("WEAPONS_POWER", 12, 3018, 547, "Onboard Equipment Control Panel", "Weapons system power switch")
defineToggleSwitch("WEAPONS_POWER_COVER", 12, 3019, 548, "Onboard Equipment Control Panel", "Weapons system power switch cover")
defineToggleSwitch("LIGHT_BEACON", 45, 3003, 228, "Onboard Equipment Control Panel", "Anticollision beacon switch")
defineMultipositionSwitch("NAV_GYRO_MAG_MAN_HDG", 28, 3001, 229, 3, 0.1, "Onboard Equipment Control Panel", "NAV Gyro/Mag/Manual heading switch")
defineToggleSwitch("SAI_POWER", 55, 3004, 230, "Onboard Equipment Control Panel", "SAI power switch")
-- Lighting Control Panel
defineToggleSwitch("LIGHT_ROTOR_TIP", 45, 3001, 296, "Lighting Control Panel", "Rotor tip lights switch")
defineMultipositionSwitch("LIGHT_FORMATION", 45, 3002, 297, 4, 0.1, "Lighting Control Panel", "Formation lights switch")
defineToggleSwitch("LIGHT_ADI_SAI", 51, 3003, 298, "Lighting Control Panel", "ADI and SAI lighting switch")
defineToggleSwitch("LIGHT_COCKPIT_NVG", 51, 3007, 299, "Lighting Control Panel", "Night vision cockpit lighting switch")
defineToggleSwitch("LIGHT_COCKPIT", 51, 3001, 300, "Lighting Control Panel", "Cockpit panel lighting switch")
-- Electronic Engine Governors
defineToggleSwitch("ENG_L_ENG_EEG", 4, 3001, 290, "EEG", "Left engine Electronic Engine Governor switch")
defineToggleSwitch("ENG_L_ENG_EEG_COVER", 4, 3002, 291, "EEG", "Left engine Electronic Engine Governor switch cover")
defineToggleSwitch("ENG_R_ENG_EEG", 4, 3003, 292, "EEG", "Right engine Electronic Engine Governor switch")
defineToggleSwitch("ENG_R_ENG_EEG_COVER", 4, 3004, 293, "EEG", "Right engine Electronic Engine Governor switch cover")
defineToggleSwitch("ENG_EEG_GG_TEST_OPER", 4, 3015, 294, "EEG", "EEG gas generator Test / Operate switch")
defineToggleSwitch("ENG_EEG_GG_TEST_OPER_COVER", 4, 3016, 569, "EEG", "EEG gas generator Test / Operate switch cover")
defineMultipositionSwitch("ENG_EEG_PT1_OPER_PT2", 4, 3017, 295, 3, 0.1, "EEG", "EEG power turbine channel 1 test / Operate / EEG power turbine channel 2 test switch")
defineToggleSwitch("ENG_EEG_PT1_OPER_PT2_COVER", 4, 3018, 570, "EEG", "EEG power turbine channel 1 test / Operate / EEG power turbine channel 2 test switch cover")


---------------------------------------------------------------------
-- Rear Auxiliary Panel
---------------------------------------------------------------------
-- Engines Control Instruments Panel
definePushButton("ENG_L_EGT_GOVERNOR", 4, 3019, 457, "Engines Control Instruments Panel", "Left EGT control threshold governor button")
definePushButton("ENG_R_EGT_GOVERNOR", 4, 3020, 458, "Engines Control Instruments Panel", "Right EGT control threshold governor button")
definePushButton("ENG_VIBR_MONITOR", 4, 3021, 459, "Engines Control Instruments Panel", "Engines vibrations monitoring system control button")
-- Automatic Ejection System System BIT Panel
defineIndicatorLight("EJECT_SYS_TEST_LAMP", 461, "Ejection System BIT Panel", "Ejection system test lamp")
defineTumb("EJECT_SYS_SELECTOR", 6, 3005, 462, 0.1, {0, 0.6}, nil, false, "Ejection System BIT Panel", "Ejecting system circuit selector")
definePushButton("EJECT_SYS_TEST_BTN", 6, 3006, 460, "Ejection System BIT Panel", "Ejecting system circuit test button")
-- EKRAN and Voice Warning System Control
definePushButton("VOICE_MSG_SYS_TEST", 13, 3004, 442, "EKRAN and Voice Warning System Control", "Voice message system check button")
-- Hydraulic Temperature and Pressure Indicators
defineIndicatorLight("HYD_MAIN_VLV", 469, "Hydraulic Temperature and Pressure", "Main hydraulic valve lamp")
defineIndicatorLight("HYD_COMMON_VLV", 470, "Hydraulic Temperature and Pressure", "Common hydraulic valve lamp")
defineFloat("HYD_COMMON_PRESS", 471, {0, 1}, "Hydraulic Temperature and Pressure", "Common hydraulic pressure")
defineFloat("HYD_MAIN_PRESS", 472, {0, 1}, "Hydraulic Temperature and Pressure", "Main hydraulic pressure")
defineFloat("HYD_ACC_PRESS", 473, {0, 1}, "Hydraulic Temperature and Pressure", "Accumulators hydraulic pressure")
defineFloat("HYD_WHEEL_PRESS", 474, {0, 1}, "Hydraulic Temperature and Pressure", "Wheel brakes hydraulic pressure")
defineFloat("HYD_COMMON_TEMP", 475, {0, 1}, "Hydraulic Temperature and Pressure", "Common hydraulic temperature")
defineFloat("HYD_MAIN_TEMP", 476, {0, 1}, "Hydraulic Temperature and Pressure", "Main hydraulic temperature")
-- PPK-800 Systems Preparation and Check Panel
defineTumb("PPK800_ATGM_TEMP", 32, 3001, 483, 0.1, {0, 1.0}, nil, false, "PPK-800 Systems Preparation and Check Panel", "ATGM Temperature selector")
defineTumb("PPK800_BAL_DATA", 12, 3023, 484, 0.1, {0, 1.0}, nil, false, "PPK-800 Systems Preparation and Check Panel", "Unguided rocket and gun pods ballistics data settings selector")
defineTumb("PPK800_SYS_BIT", 32, 3003, 485, 0.1, {0, 0.8}, nil, false, "PPK-800 Systems Preparation and Check Panel", "Systems BIT selector")
defineToggleSwitch("PPK800_CTRL_COMP_BIT", 32, 3004, 486, "PPK-800 Systems Preparation and Check Panel", "Control computers BIT switch")
defineToggleSwitch("PPK800_INU_POWER", 15, 3001, 487, "PPK-800 Systems Preparation and Check Panel", "INU Power switch")
defineToggleSwitch("PPK800_INU_HEAT", 15, 3002, 488, "PPK-800 Systems Preparation and Check Panel", "INU Heater switch")
definePushButton("PPK800_SELF_TEST", 32, 3007, 489, "PPK-800 Systems Preparation and Check Panel", "Self test system push-button")
defineToggleSwitch("PPK800_EMER_INU_ALIGN", 32, 3008, 490, "PPK-800 Systems Preparation and Check Panel", "Emergency INU alignment switch")
defineToggleSwitch("PPK800_SLING_STAB", 32, 3009, 491, "PPK-800 Systems Preparation and Check Panel", "Stabilisation and indication of hanger cable switch")
defineToggleSwitch("PPK800_VIDEO_TAPE_REC", 32, 3010, 492, "PPK-800 Systems Preparation and Check Panel", "Video Tape Recorder switch")
-- LWS, WS and CMS Power and Test Panel
defineIndicatorLight("LWS_OPER", 582, "LWS", "Operating lamp")
definePushButton("LWS_TEST", 36, 3003, 584, "LWS", "Self-test button")
defineToggleSwitch("LWS_POWER", 36, 3002, 583, "LWS", "Power switch")
defineToggleSwitch("UV26_POWER", 22, 3010, 496, "UV-26 Power and Test Panel", "UV-26 Power switch")
defineToggleSwitch("UV26_POWER_COVER", 22, 3012, 497, "UV-26 Power and Test Panel", "UV-26 Power switch cover")
defineToggleSwitch("UV26_TEST", 22, 3011, 498, "UV-26 Power and Test Panel", "UV-26 BIT switch")
defineToggleSwitch("UV26_TEST_COVER", 22, 3013, 499, "UV-26 Power and Test Panel", "UV-26 BIT switch cover")
-- Electrical System Control Panel
definePotentiometer("ELEC_AUX_BRIGHTNESS", 51, 3006, 451, {0, 1}, "Electrical System Control Panel", "Auxiliary panel brightness knob")
defineToggleSwitch("ELEC_AUX_LIGHTS", 51, 3005, 450, "Electrical System Control Panel", "Auxiliary panel lightning switch")
defineToggleSwitch("ELEC_HYD_TRAN_EKRAN_POWER", 34, 3002, 452, "Electrical System Control Panel", "Hydraulics/transmission group and EKRAN power switch")
defineToggleSwitch("ELEC_HYD_TRAN_EKRAN_POWER_COVER", 34, 3003, 453, "Electrical System Control Panel", "Hydraulics/transmission group and EKRAN power switch cover")
-- Lighting Brightness Control Panel
definePotentiometer("LIGHT_AUX_BRIGHTNESS", 51, 3008, 507, {0, 1}, "Lighting Brightness Control Panel", "Lighting night vision cockpit brightness knob")
definePotentiometer("LIGHT_COCKPIT_BRIGHTNESS", 51, 3002, 593, {0, 1}, "Lighting Brightness Control Panel", "Lighting cockpit panel brightness knob")
definePotentiometer("LIGHT_HSI_ADI_BRIGHTNESS", 51, 3004, 508, {0, 1}, "Lighting Brightness Control Panel", "Lighting HSI and ADI brightness knob")

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