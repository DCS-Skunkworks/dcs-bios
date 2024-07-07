module("Ka-50", package.seeall)

local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

--- @class Ka_50 : Module
local Ka_50 = Module:new("Ka-50", 0x1800, { "Ka-50", "Ka-50_3" })

--overhaul by WarLord v2.0b

-- Hide Stick Arg# 1005

--- Defines a push button LED
--- @param self Module the calling module
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
local function definePushButtonLed(self, identifier, arg_number, category, description)
	local function round(n)
		return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
	end

	local max_value = 1
	local alloc = self:allocateInt(max_value, identifier)
	assert(alloc.shiftBy ~= nil)
	self:addExportHook(function(dev0)
		alloc:setValue(round(dev0:get_argument_value(arg_number) * 10) % 2)
	end)

	local control = Control:new(category, ControlType.led, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, "0 if light is off, 1 if light is on"),
	}, nil)
	self:addControl(control)

	return control
end

----Overhead Panel
--Overhead Panel - left side
Ka_50:defineMultipositionSwitch("OP_NAV_LIGHTS", 45, 3004, 146, 5, 0.1, "Overhead Panel", "Navigation Lights 10% / 30% / 100% / Off Switch")
Ka_50:defineMultipositionSwitch("OP_WINDSHIELD_WIPER", 34, 3006, 147, 5, 0.1, "Overhead Panel", "Windshield wiper Switch")
Ka_50:defineToggleSwitch("OP_WINDSHIELD_WASH", 0, 3008, 148, "Overhead Panel", "Windshield washer fluid Switch")
Ka_50:defineToggleSwitch("OP_PITOT_PORT_HEAT", 34, 3008, 539, "Overhead Panel", "Pitot static port and AoA sensors heat Switch")
Ka_50:defineToggleSwitch("OP_PITOT_RAM_HEAT", 34, 3009, 151, "Overhead Panel", "Pitot ram air and clock heat Switch")
--Magnetic Compass
Ka_50:defineFloat("KI13_CRS", 11, { -1, 1 }, "Magnetic Compass", "Course")
Ka_50:defineFloat("KI13_PITCH", 12, { -1, 1 }, "Magnetic Compass", "Pitch")
Ka_50:defineFloat("KI13_BANK", 14, { -1, 1 }, "Magnetic Compass", "Bank")
--Overhead Panel - right side
Ka_50:defineToggleSwitch("OP_ROTOR_DEICE", 4, 3013, 153, "Overhead Panel", "Rotor de-icing system Switch")
Ka_50:defineMultipositionSwitch("OP_ENG_DEICE", 4, 3014, 154, 3, 0.5, "Overhead Panel", "Engines de-icing / dust-protection systems Switch")
Ka_50:definePushButton("OP_PITOT_HEAT_TEST", 34, 3010, 156, "Overhead Panel", "Pitot heat system test button")
--Warning and Advisory Lamps
Ka_50:defineIndicatorLight("WAL_RALT_HOLD", 170, "Warning and Advisory Lamps", "R-ALT hold (green)")
Ka_50:defineIndicatorLight("WAL_AUTO_HOVER", 175, "Warning and Advisory Lamps", "Auto hover (green)")
Ka_50:defineIndicatorLight("WAL_AUTO_DESCENT", 172, "Warning and Advisory Lamps", "Auto descent (green)")
Ka_50:defineIndicatorLight("WAL_ENR_NAV", 165, "Warning and Advisory Lamps", "Route heading steering (green)")
Ka_50:defineIndicatorLight("WAL_ENR_COURSE", 171, "Warning and Advisory Lamps", "Route course steering (green)")
Ka_50:defineIndicatorLight("WAL_NEXT_WPT", 176, "Warning and Advisory Lamps", "Next waypoint (green)")
Ka_50:defineIndicatorLight("WAL_ENR_END", 166, "Warning and Advisory Lamps", "End of route (green)")
Ka_50:defineIndicatorLight("WAL_NAV_CALC", 164, "Warning and Advisory Lamps", "Rough NAV calc (green)")
Ka_50:defineIndicatorLight("WAL_WEAPONS_ARM", 178, "Warning and Advisory Lamps", "Weapons armed (red)")
Ka_50:defineIndicatorLight("WAL_CANNON", 173, "Warning and Advisory Lamps", "Cannon away from boresight (green)")
Ka_50:defineIndicatorLight("WAL_CANNON2", 177, "Warning and Advisory Lamps", "Cannon downward away from boresight (green)")
Ka_50:defineIndicatorLight("WAL_XFEED_VLV_OPEN", 211, "Warning and Advisory Lamps", "Fuel crossfeed ON (green)")
Ka_50:defineIndicatorLight("WAL_TURBO_GEARBOX_OFF", 187, "Warning and Advisory Lamps", "Gearbox disconnected (green)")
Ka_50:defineIndicatorLight("WAL_GEARBOX_OIL_PRESS", 204, "Warning and Advisory Lamps", "Gearbox oil pressure normal (green)")
Ka_50:defineIndicatorLight("WAL_SLING_OPEN", 213, "Warning and Advisory Lamps", "Sling load lock (hook) is open (green)")
--Message Lamps
Ka_50:defineIndicatorLight("ML_MASTER_ARM", 167, "Message Lamps", "Master ARM is ON (green)")
Ka_50:defineIndicatorLight("ML_WEAPONS_TRAIN", 180, "Message Lamps", "Training mode is ON (green)")
Ka_50:defineIndicatorLight("ML_HMS_FAIL", 179, "Message Lamps", "Helmet-Mounted sight mailfunction (yellow)")
Ka_50:defineIndicatorLight("ML_HUD_NOT_READY", 188, "Message Lamps", "HUD failure or not ready (yellow)")
Ka_50:defineIndicatorLight("ML_COMPUTER_DIAG", 189, "Message Lamps", "Computers in diagnostic mode (yellow)")
Ka_50:defineIndicatorLight("ML_COMPUTER_FAIL", 206, "Message Lamps", "Computer(s) failure (yellow)")
Ka_50:defineIndicatorLight("ML_INVERTER", 212, "Message Lamps", "DC/AC inverter is ON (green)")
Ka_50:defineIndicatorLight("ML_SHKVAL_FAIL", 205, "Message Lamps", "SHKVAL failure (yellow)")
Ka_50:defineIndicatorLight("ML_L_ENG_ANTIICE", 181, "Message Lamps", "Left engine de-icing (green)")
Ka_50:defineIndicatorLight("ML_L_ENG_DUST", 190, "Message Lamps", "Left engine dust protector (green)")
Ka_50:defineIndicatorLight("ML_L_ENG_POWER_LIMIT", 207, "Message Lamps", "Left engine limited by governor (yellow)")
Ka_50:defineIndicatorLight("ML_ROTOR_ANTIICE", 183, "Message Lamps", "Rotor de-icing (green)")
Ka_50:defineIndicatorLight("ML_R_ENG_ANTIICE", 182, "Message Lamps", "Right engine deicing (green)")
Ka_50:defineIndicatorLight("ML_R_ENG_DUST", 191, "Message Lamps", "Right engine dust protector (green)")
Ka_50:defineIndicatorLight("ML_R_ENG_POWER_LIMIT", 208, "Message Lamps", "Right engine limited by governor (yellow)")
Ka_50:defineIndicatorLight("ML_WINDSHIELD_HEAT", 184, "Message Lamps", "Windshield heater is ON (green)")
Ka_50:defineIndicatorLight("ML_FWD_TANK_PUMP", 200, "Message Lamps", "Forward fuel pump ON (green)")
Ka_50:defineIndicatorLight("ML_L_ENG_VLV_CLOSED", 209, "Message Lamps", "Left engine fuel valve is closed (yellow)")
Ka_50:defineIndicatorLight("ML_L_OUTER_TANK_PUMP", 185, "Message Lamps", "Left outer fuel tank pump is ON (green)")
Ka_50:defineIndicatorLight("ML_L_INNER_TANK_PUMP", 202, "Message Lamps", "Left inner fuel tank pump is ON (green)")
Ka_50:defineIndicatorLight("ML_AFT_TANK_PUMP", 201, "Message Lamps", "Aft fuel tank pump is ON (green)")
Ka_50:defineIndicatorLight("ML_R_ENG_VLV_CLOSED", 210, "Message Lamps", "Right engine fuel valve is closed (yellow)")
Ka_50:defineIndicatorLight("ML_R_OUTER_TANK_PUMP", 186, "Message Lamps", "Right outer fuel tank pump is ON (green)")
Ka_50:defineIndicatorLight("ML_R_INNER_TANK_PUMP", 203, "Message Lamps", "Right inner fuel tank pump is ON (green)")
--PRTz Data Link Control Panel
Ka_50:defineTumb("DLNK_SEND_BTN", 25, 3001, 159, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "Send/Memory button")

definePushButtonLed(Ka_50, "DLNK_SEND_LED", 159, "Datalink Control Panel", "Send/Memory LED (yellow)")
Ka_50:defineTumb("DLNK_ESCAPE_BTN", 25, 3002, 150, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "Ingress to target button")
definePushButtonLed(Ka_50, "DLNK_ESCAPE_LED", 150, "Datalink Control Panel", "Ingress to target LED (yellow)")
Ka_50:defineTumb("DLNK_ERASE_BTN", 25, 3003, 161, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "Erase button")
definePushButtonLed(Ka_50, "DLNK_ERASE_LED", 161, "Datalink Control Panel", "Erase LED (yellow)")
Ka_50:defineTumb("DLNK_CLEAN_BTN", 25, 3004, 15, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "N/A button")
definePushButtonLed(Ka_50, "DLNK_CLEAN_LED", 15, "Datalink Control Panel", "N/A LED (green)")
Ka_50:defineTumb("DLNK_WINGMAN_ALL_BTN", 25, 3005, 16, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "To aLL button")
definePushButtonLed(Ka_50, "DLNK_WINGMAN_ALL_LED", 16, "Datalink Control Panel", "To all LED (green)")
Ka_50:defineTumb("DLNK_WINGMAN_1_BTN", 25, 3006, 17, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "To wingman 1 button")
definePushButtonLed(Ka_50, "DLNK_WINGMAN_1_LED", 17, "Datalink Control Panel", "To wingman 1 LED (green)")
Ka_50:defineTumb("DLNK_WINGMAN_2_BTN", 25, 3007, 18, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "To wingman 2 button")
definePushButtonLed(Ka_50, "DLNK_WINGMAN_2_LED", 18, "Datalink Control Panel", "To wingman 2 LED (green)")
Ka_50:defineTumb("DLNK_WINGMAN_3_BTN", 25, 3008, 19, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "To wingman 3 button")
definePushButtonLed(Ka_50, "DLNK_WINGMAN_3_LED", 19, "Datalink Control Panel", "To wingman 3 LED (green)")
Ka_50:defineTumb("DLNK_WINGMAN_4_BTN", 25, 3009, 20, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "To wingman 4 button")
definePushButtonLed(Ka_50, "DLNK_WINGMAN_4_LED", 20, "Datalink Control Panel", "To wingman 4 LED (green)")
Ka_50:defineTumb("DLNK_TARGET_VEHICLE_BTN", 25, 3010, 21, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "Target #1/Vehicle button")
definePushButtonLed(Ka_50, "DLNK_TARGET_VEHICLE_LED", 21, "Datalink Control Panel", "Target #1/Vehicle LED (green)")
Ka_50:defineTumb("DLNK_TARGET_SAM_BTN", 25, 3011, 22, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "Target #2/SAM button")
definePushButtonLed(Ka_50, "DLNK_TARGET_SAM_LED", 22, "Datalink Control Panel", "Target #2/SAM LED (green)")
Ka_50:defineTumb("DLNK_TARGET_OTHER_BTN", 25, 3012, 23, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "Target #3/Other type button")
definePushButtonLed(Ka_50, "DLNK_TARGET_OTHER_LED", 23, "Datalink Control Panel", "Target #3/Other type LED (green)")
Ka_50:defineTumb("DLNK_TARGET_POINT_BTN", 25, 3013, 50, 0.3, { 0, 0.3 }, nil, false, "Datalink Control Panel", "Ingress point button")
definePushButtonLed(Ka_50, "DLNK_TARGET_POINT_LED", 50, "Datalink Control Panel", "Ingress point LED (green)")
--Laser Warning Receiver
Ka_50:defineIndicatorLight("LWR_AZI_0", 25, "LWR", "Lamp azimuth 0 (red)")
Ka_50:defineIndicatorLight("LWR_AZI_90", 28, "LWR", "Lamp azimuth 90 (red)")
Ka_50:defineIndicatorLight("LWR_AZI_180", 26, "LWR", "Lamp azimuth 180 (red)")
Ka_50:defineIndicatorLight("LWR_AZI_270", 27, "LWR", "Lamp azimuth 270 (red)")
Ka_50:defineIndicatorLight("LWR_HEMI_UPPER", 31, "LWR", "Lamp hemisphere Upper (yellow)")
Ka_50:defineIndicatorLight("LWR_HEMI_LOWER", 32, "LWR", "Lamp hemisphere lower (yellow)")
Ka_50:defineIndicatorLight("LWR_LASER_RANGE", 33, "LWR", "Lamp laser range finder (yellow)")
Ka_50:defineIndicatorLight("LWR_LASER_TARGETING", 34, "LWR", "Lamp laser targeting system (yellow)")
Ka_50:definePushButton("LWR_RESET", 36, 3001, 35, "LWR", "Reset Button")
--UV-26 Countermeasures Control Panel
local function getUV26Display()
	local ind = Module.parse_indication(7)
	return Functions.coerce_nil_to_string(ind["txt_digits"])
end
Ka_50:defineString("UV26_DISPLAY", getUV26Display, 3, "UV-26 Control Panel", "UV-26 display")
Ka_50:defineIndicatorLight("UV26_L_DISPENSER", 541, "UV-26 Control Panel", "Left dispenser Light (red)")
Ka_50:defineIndicatorLight("UV26_R_DISPENSER", 542, "UV-26 Control Panel", "Right dispenser Light (red)")
Ka_50:defineMultipositionSwitch("UV26_DISPENSERS_SELECTOR", 22, 3001, 36, 3, 0.1, "UV-26 Control Panel", "Select Left/Both/Right board flares dispensers Switch")
Ka_50:defineMultipositionSwitch("UV26_MODE", 22, 3003, 37, 2, 0.1, "UV-26 Control Panel", "Amount flares counter/Programming Switch")
Ka_50:definePushButton("UV26_SERIES", 22, 3004, 38, "UV-26 Control Panel", "Num of sequences Button")
Ka_50:definePushButton("UV26_BURST", 22, 3005, 39, "UV-26 Control Panel", "Num in sequence Button")
Ka_50:definePushButton("UV26_INTERVAL", 22, 3006, 41, "UV-26 Control Panel", "Dispense interval Button")
Ka_50:definePushButton("UV26_START", 22, 3007, 43, "UV-26 Control Panel", "Start dispense button")
Ka_50:definePushButton("UV26_RESET", 22, 3008, 42, "UV-26 Control Panel", "Reset to default program Button")
Ka_50:definePushButton("UV26_STOP", 22, 3009, 40, "UV-26 Control Panel", "Stop dispense Button")
--Ambient Temperature
Ka_50:defineFloat("TEMP_AMBIENT", 587, { -0.946, 0.788 }, "Ambient Temperature", "Ambient temperature")

----Left Forward Panel
--System Controller
Ka_50:defineTumb("SC_MASTER_CAUTION_BTN", 14, 3001, 44, 0.3, { 0, 0.3 }, nil, false, "System Controller", "Master Caution Button")
definePushButtonLed(Ka_50, "SC_MASTER_CAUTION_LED", 44, "System Controller", "MasterCaution Button LED Brightness (red)")
Ka_50:definePushButton("SC_LAMPS_TEST", 14, 3002, 45, "System Controller", "Lamps Test Button")
Ka_50:defineTumb("SC_ROTOR_RPM_BTN", 14, 3003, 46, 0.3, { 0, 0.3 }, nil, false, "System Controller", "Rotor RPM warning Button")
definePushButtonLed(Ka_50, "SC_ROTOR_RPM_LED", 46, "System Controller", "Rotor RPM warning button LED Brightness (yellow)")
Ka_50:defineToggleSwitch("SC_ODS_MODE", 64, 3001, 49, "System Controller", "ODS Operation Mode Switch")
--Caution Lights Panel
Ka_50:defineIndicatorLight("CL_LASER_WARN", 47, "Caution Lights Panel", "Under fire warning (red)")
Ka_50:defineIndicatorLight("CL_EXTEND_GEAR", 48, "Caution Lights Panel", "Extend landing Gear (red)")
Ka_50:defineIndicatorLight("CL_L_ENG_OVERSPEED", 78, "Caution Lights Panel", "Left engine power turbine over-speed (red)")
Ka_50:defineIndicatorLight("CL_R_ENG_OVERSPEED", 79, "Caution Lights Panel", "Right engine power turbine over-speed (red)")
Ka_50:defineIndicatorLight("CL_OVER_G", 80, "Caution Lights Panel", "G over-limit (red)")
Ka_50:defineIndicatorLight("CL_L_ENG_VIBRATION", 81, "Caution Lights Panel", "Left engine vibration exceeded (red)")
Ka_50:defineIndicatorLight("CL_R_ENG_VIBRATION", 82, "Caution Lights Panel", "Right engine vibration exceeded (red)")
Ka_50:defineIndicatorLight("CL_IAS_MAX", 83, "Caution Lights Panel", "Maximum allowed IAS exceeded (red)")
Ka_50:defineIndicatorLight("CL_MAIN_GEARBOX", 84, "Caution Lights Panel", "Minimum main Gearbox oil pressure / Main Gearbox oil overheat / Oil metallic chip detected (red)")
Ka_50:defineIndicatorLight("CL_FIRE", 85, "Caution Lights Panel", "Left engine / Right engine / APU / Hydraulics bay / Main Gearbox fire (red)")
Ka_50:defineIndicatorLight("CL_IFF_FAIL", 86, "Caution Lights Panel", "IFF failure (red)")
--Attitude Director Indicator
Ka_50:definePushButton("ADI_TEST", 31, 3003, 110, "ADI", "Self-test button")
Ka_50:defineToggleSwitch("ADI_TEST_COVER", 31, 3002, 550, "ADI", "Self-test button cover")
Ka_50:defineVariableStepTumb("ADI_PITCH_TRIM", 31, 3001, 105, 0.1, "ADI", "Zero pitch trim rotary")
Ka_50:defineFloat("ADI_ROLL", 100, { -1, 1 }, "ADI", "Roll")
Ka_50:defineFloat("ADI_PITCH", 101, { -1, 1 }, "ADI", "Pitch")
Ka_50:define8BitFloat("ADI_STEER_WARN_FLAG", 102, { 0, 1 }, "ADI", "Steering warning flag")
Ka_50:define8BitFloat("ADI_ATT_WARN_FLAG", 109, { 0, 1 }, "ADI", "Attitude warning flag")
Ka_50:defineFloat("ADI_BANK_STEER", 107, { -1, 1 }, "ADI", "Bank steering bar")
Ka_50:defineFloat("ADI_PITCH_STEER", 106, { -1, 1 }, "ADI", "Pitch steering bar")
Ka_50:defineFloat("ADI_AIRSPEED_DEV", 111, { -1, 1 }, "ADI", "Airspeed deviation")
Ka_50:defineFloat("ADI_TRACK_DEV", 103, { -1, 1 }, "ADI", "Track deviation")
Ka_50:defineFloat("ADI_ALT_DEV", 526, { -1, 1 }, "ADI", "Altitude deviation")
Ka_50:defineFloat("ADI_YAW", 108, { -1, 1 }, "ADI", "Yaw indicator")
--Horizontal Situation Indicator
Ka_50:defineVariableStepTumb("HSI_COURSE_ROT", 30, 3001, 126, 1, "HSI", "Desired course rotary")
Ka_50:defineVariableStepTumb("HSI_HDG_ROT", 30, 3002, 129, 1, "HSI", "Desired heading rotary")
Ka_50:definePushButton("HSI_TEST", 30, 3003, 113, "HSI", "Self-test button")
Ka_50:defineToggleSwitch("HSI_DH_DTA_MANUAL_AUTO", 30, 3004, 54, "HSI", "DH/DTA Manual - Auto Switch")
Ka_50:defineFloat("HSI_HDG", 112, { 0, 1 }, "HSI", "Heading")
Ka_50:defineFloat("HSI_DES_COURSE", 118, { 0, 1 }, "HSI", "Desired course")
Ka_50:defineFloat("HSI_DES_HDG", 124, { 0, 1 }, "HSI", "Desired heading")
Ka_50:defineFloat("HSI_BEARING", 115, { 0, 1 }, "HSI", "Bearing to radio station")
Ka_50:define8BitFloat("HSI_HDG_WARN_FLAG", 119, { 0, 1 }, "HSI", "Heading warning flag")
Ka_50:define8BitFloat("HSI_COURSE_WARN_FLAG", 114, { 0, 1 }, "HSI", "Course warning flag")
Ka_50:define8BitFloat("HSI_GS_WARN_FLAG", 125, { 0, 1 }, "HSI", "Glideslope warning flag")
Ka_50:defineFloat("HSI_RANGE_CNT_100", 117, { 0, 1 }, "HSI", "Range counter 100")
Ka_50:defineFloat("HSI_RANGE_CNT_10", 527, { 0, 1 }, "HSI", "Range counter 10")
Ka_50:defineFloat("HSI_RANGE_CNT_1", 528, { 0, 1 }, "HSI", "Range counter 1")
Ka_50:defineFloat("HSI_COURSE_CNT_100_10", 529, { -1, 1 }, "HSI", "Course counter 100/10")
Ka_50:defineFloat("HSI_COURSE_CNT_1", 530, { 0, 1 }, "HSI", "Course counter 1")
Ka_50:defineFloat("HSI_LONG_DEV", 127, { -1, 1 }, "HSI", "Longitudinal deviation from hover position")
Ka_50:defineFloat("HSI_LAT_DEV", 128, { -1, 1 }, "HSI", "Lateral deviation from the assigned flight path or hover position")
Ka_50:define8BitFloat("HSI_RANGE_NOT_AVAIL_FLAG", 116, { 0, 1 }, "HSI", "Range unavailable flag")
Ka_50:define8BitFloat("HSI_COURSE_NOT_AVAIL_FLAG", 121, { 0, 1 }, "HSI", "Course unavailable flag")
--Laser Designator Panel
Ka_50:defineToggleSwitch("LASER_MODE", 11, 3003, 56, "Laser Designator Panel", "Laser rangefinder / designator - mode Switch")
Ka_50:defineToggleSwitch("LASER_MODE_COVER", 11, 3002, 57, "Laser Designator Panel", "Laser rangefinder / designator - mode Switch cover")
Ka_50:definePushButton("LASER_RESET", 11, 3004, 55, "Laser Designator Panel", "Laser designator reset button")
--Vertical Velocity Indicator
Ka_50:defineFloat("VARIO_SPEED", 24, { -1, 1 }, "Variometer", "Vertical speed indicator")
--Accelerometer
Ka_50:defineFloat("ACCEL_G", 97, { 0, 1 }, "Accelerometer", "G load")
Ka_50:defineFloat("ACCEL_MIN", 99, { 0, 1 }, "Accelerometer", "Accelerometer min pointer")
Ka_50:defineFloat("ACCEL_MAX", 98, { 0, 1 }, "Accelerometer", "Accelerometer max pointer")
Ka_50:definePushButton("ACCEL_RESET", 61, 3001, 572, "Accelerometer", "Accelerometer reset button")
--Radar Altimeter
Ka_50:defineVariableStepTumb("RALT_SAFE_ALT_KNOB", 38, 3001, 91, 1, "Radar Altimeter", "Safe altitude treshold rotary")
Ka_50:definePushButton("RALT_TEST", 38, 3002, 96, "Radar Altimeter", "Test button")
Ka_50:defineFloat("RALT_ALT", 94, { 0, 1 }, "Radar Altimeter", "Altitude")
Ka_50:defineFloat("RALT_SAFE_ALT_BUG", 93, { 0, 1 }, "Radar Altimeter", "Safe altitude treshold bug")
Ka_50:defineIndicatorLight("RALT_SAFE_ALT_LAMP", 92, "Radar Altimeter", "Safe altitude Lamp  (yellow)")
Ka_50:define8BitFloat("RALT_WARN_FLAG", 95, { 0, 1 }, "Radar Altimeter", "Warning flag")
--Airspeed Indicator
Ka_50:defineFloat("AIRSPEED", 51, { 0, 1 }, "Airspeed Indicator", "Airspeed indicator")
--Rotor RPM Indicator
Ka_50:defineFloat("ROTOR_RPM", 52, { 0, 1 }, "Rotor RPM Indicator", "Rotor RPM")
--Barometric Altimeter
Ka_50:definePotentiometer("ALT_QFE_KNOB", 41, 3005, 90, { 0, 1 }, "Barometric Altimeter", "QFE Knob")
Ka_50:defineFloat("ALT_1000M", 87, { 0, 1 }, "Barometric Altimeter", "Baro alt 1000 meters")
Ka_50:defineFloat("ALT_100M", 573, { 0, 1 }, "Barometric Altimeter", "Baro alt 100 meters")
Ka_50:defineFloat("ALT_QFE_PRESS", 88, { 0, 1 }, "Barometric Altimeter", "QFE pressure scale")
Ka_50:defineFloat("ALT_DESIRE_ALT", 89, { 0, 1 }, "Barometric Altimeter", "Desire altitude bug")
--Clock
Ka_50:define3PosTumb("CLK_L_LEVER", 29, 3001, 76, "Clock", "Left lever push/pull")
Ka_50:defineVariableStepTumb("CLK_L_LEVER_ROT", 29, 3003, 511, 1, "Clock", "Left lever rotary")
Ka_50:definePushButton("CLK_R_LEVER", 29, 3004, 77, "Clock", "Right lever push")
Ka_50:defineTumb("CLK_R_LEVER_ROT", 29, 3005, 525, 0.3, { -0.15, 0.15 }, nil, false, "Clock", "Right lever rotary")
Ka_50:defineFloat("CLK_CURRTIME_HOURS", 68, { 0, 1 }, "Clock", "Current time - hours")
Ka_50:defineFloat("CLK_CURRTIME_MINUTES", 69, { 0, 1 }, "Clock", "Current time - minutes")
Ka_50:defineFloat("CLK_CURRTIME_SECONDS", 70, { 0, 1 }, "Clock", "Current time - seconds")
Ka_50:defineFloat("CLK_FLIGHT_HOURS", 72, { 0, 1 }, "Clock", "Flight hours")
Ka_50:defineFloat("CLK_FLIGHT_MINUTES", 531, { 0, 1 }, "Clock", "Flight minutes")
Ka_50:define8BitFloat("CLK_FLIGHT_TIME_METER_STATUS", 75, { 0, 0.2 }, "Clock", "Flight time meter status")
Ka_50:defineFloat("CLK_STOPWATCH_MINUTES", 73, { 0, 1 }, "Clock", "Stop-watch minutes")
Ka_50:defineFloat("CLK_STOPWATCH_SECONDS", 532, { 0, 1 }, "Clock", "Stop-watch seconds")
--Rotor Pitch Indicator
Ka_50:defineFloat("ROTOR_PITCH", 53, { 0, 1 }, "Rotor Pitch Indicator", "Rotor blade pitch indicator")
--Landing Gear Control Panel
Ka_50:defineToggleSwitch("GEAR_LEVER", 34, 3001, 65, "Landing Gear Control Panel", "Gear lever")
Ka_50:defineToggleSwitch("GEAR_EMER_HYD", 34, 3004, 66, "Landing Gear Control Panel", "Emergency Gear hydraulics selector Switch")
Ka_50:defineToggleSwitch("GEAR_EMER_HYD_COVER", 34, 3005, 67, "Landing Gear Control Panel", "Emergency Gear hydraulics selector Switch cover")
Ka_50:defineFloat("GEAR_LEVER_POS", 65, { 0, 1 }, "Landing Gear Control Panel", "Gear lever position")
Ka_50:defineIndicatorLight("GEAR_NOSE_UP", 63, "Landing Gear Control Panel", "Nose Gear Up Lamp (red)")
Ka_50:defineIndicatorLight("GEAR_NOSE_DOWN", 64, "Landing Gear Control Panel", "Nose Gear down Lamp (green)")
Ka_50:defineIndicatorLight("GEAR_R_MAIN_UP", 61, "Landing Gear Control Panel", "Right main Gear Up Lamp (red)")
Ka_50:defineIndicatorLight("GEAR_R_MAIN_DOWN", 62, "Landing Gear Control Panel", "Right main Gear down Lamp (green)")
Ka_50:defineIndicatorLight("GEAR_L_MAIN_UP", 59, "Landing Gear Control Panel", "Left main Gear Up Lamp (red)")
Ka_50:defineIndicatorLight("GEAR_L_MAIN_DOWN", 60, "Landing Gear Control Panel", "Left main Gear down Lamp (green)")

----Center Panel
--HUD
Ka_50:define8BitFloat("HUD_FILTER_POS", 509, { 0, 1 }, "HUD", "Filter position")
Ka_50:define8BitFloat("HUD_FILTER_HANDLE_POS", 510, { 0, 1 }, "HUD", "Filter lever position")
Ka_50:definePotentiometer("HUD_BRIGHTNESS", 7, 3001, 8, { 0, 1 }, "HUD", "Brightness Knob")
Ka_50:define3PosTumb("HUD_MODE", 7, 3002, 9, "HUD", "Reticle/Night/Day mode selector")
Ka_50:definePushButton("HUD_TEST", 7, 3003, 7, "HUD", "Self-test button")
Ka_50:defineToggleSwitch("HUD_FILTER_HANDLE", 7, 3004, 510, "HUD", "Filter lever Switch")
--PUI-800 Weapon Status and Control Panel
Ka_50:defineToggleSwitch("WEAPONS_MASTER_ARM", 12, 3001, 387, "Weapons Control Panel", "Master arm Switch")
Ka_50:definePushButton("WEAPONS_JETTISON_AA_MIS", 12, 3002, 401, "Weapons Control Panel", "Emergency jettison of AA missiles button (no function)")
Ka_50:definePushButton("WEAPONS_JETTISON_EXT", 12, 3003, 402, "Weapons Control Panel", "External stores jettison button (except Vikhr)")
Ka_50:defineToggleSwitch("WEAPONS_JETTISON_ARM_MODE", 12, 3022, 396, "Weapons Control Panel", "Jettison arm mode - arm fuse/disarm fuse Switch")
Ka_50:defineToggleSwitch("WEAPONS_MANUAL_AUTO", 12, 3005, 403, "Weapons Control Panel", "Manual/Auto weapon system control Switch")
Ka_50:defineToggleSwitch("WEAPONS_CANNON_ROUND", 12, 3006, 399, "Weapons Control Panel", "Cannon round selector Switch HE/AP")
Ka_50:defineMultipositionSwitch("WEAPONS_CANNON_BURST", 12, 3004, 400, 3, 0.1, "Weapons Control Panel", "Long-medium-short cannon burst mode Switch")
Ka_50:defineToggleSwitch("WEAPONS_CANNON_RATE", 12, 3020, 398, "Weapons Control Panel", "Cannon rate of fire setting Switch")
Ka_50:defineToggleSwitch("WEAPONS_EXPEDITE_ATGM_JETTISON", 12, 3021, 397, "Weapons Control Panel", "Expedite emergency ATGM launch Switch")
Ka_50:defineIndicatorLight("WEAPONS_PRESENT_STATION_1", 392, "Weapons Control Panel", "Weapon is present on station 1 light (yellow)")
Ka_50:defineIndicatorLight("WEAPONS_PRESENT_STATION_2", 393, "Weapons Control Panel", "Weapon is present on station 2 light (yellow)")
Ka_50:defineIndicatorLight("WEAPONS_PRESENT_STATION_3", 394, "Weapons Control Panel", "Weapon is present on station 3 light (yellow)")
Ka_50:defineIndicatorLight("WEAPONS_PRESENT_STATION_4", 395, "Weapons Control Panel", "Weapon is present on station 4 light (yellow)")
Ka_50:defineIndicatorLight("WEAPONS_RDY_STATION_1", 388, "Weapons Control Panel", "Weapon is ready to fire on station 1 light (green)")
Ka_50:defineIndicatorLight("WEAPONS_RDY_STATION_2", 389, "Weapons Control Panel", "Weapon is ready to fire on station 2 light (green)")
Ka_50:defineIndicatorLight("WEAPONS_RDY_STATION_3", 390, "Weapons Control Panel", "Weapon is ready to fire on station 3 light (green)")
Ka_50:defineIndicatorLight("WEAPONS_RDY_STATION_4", 391, "Weapons Control Panel", "Weapon is ready to fire on station 4 light (green)")
local indPUI800 = {}

Ka_50:addExportHook(function()
	indPUI800 = Module.parse_indication(6)
end)

local function getPUI800_txt_weap_type()
	if indPUI800.txt_weap_type_AT then
		return "AT"
	end
	if indPUI800.txt_weap_type_RT then
		return "RT"
	end
	if indPUI800.txt_weap_type_Iron_Bomb then
		return "IB"
	end
	if indPUI800.txt_weap_type_Gun_Pod then
		return "GP"
	end
	return ""
end
local function getPUI800_txt_weap_count()
	return Functions.coerce_nil_to_string(indPUI800.txt_weap_count)
end
local function getPUI800_txt_cannon_count()
	return Functions.coerce_nil_to_string(indPUI800.txt_cannon_count)
end
Ka_50:defineString("WEAPONS_DISPLAY_STORE_TYPE", getPUI800_txt_weap_type, 2, "Weapons Control Panel", "Display store type")
Ka_50:defineString("WEAPONS_DISPLAY_WEAPON_REMAIN", getPUI800_txt_weap_count, 2, "Weapons Control Panel", "Display selected weapons remaining")
Ka_50:defineString("WEAPONS_DISPLAY_CANNON_REMAIN", getPUI800_txt_cannon_count, 2, "Weapons Control Panel", "Display cannon round remaining")
--Targeting Display Control Panel
Ka_50:defineToggleSwitch("SHKVAL_POLARITY", 8, 3001, 404, "Targeting Display Control Panel", "SHKVAL Black-White indication Switch")
Ka_50:definePotentiometer("HMS_BRIGHTNESS", 23, 3001, 405, { 0, 1 }, "Targeting Display Control Panel", "Helmet device Brightness Knob")
Ka_50:definePotentiometer("SHKVAL_BRIGHTNESS", 8, 3002, 406, { 0, 1 }, "Targeting Display Control Panel", "SHKVAL Brightness Knob")
Ka_50:definePotentiometer("SKHVAL_CONTRAST", 8, 3003, 407, { 0, 1 }, "Targeting Display Control Panel", "SHKVAL contrast Knob")
Ka_50:defineTumb("LASER_CODE", 12, 3007, 408, 0.1, { 0, 0.2 }, nil, false, "Targeting Display Control Panel", "Laser code selector")
Ka_50:defineToggleSwitch("HUD_DECLUTTER", 41, 3001, 409, "Targeting Display Control Panel", "HUD/TV declutter Switch")
Ka_50:defineToggleSwitch("TRACER", 8, 3004, 410, "Targeting Display Control Panel", "Tracer Switch (no function)")
Ka_50:defineTumb("SHKVAL_OPTICS_ADJ", 8, 3005, 411, 0.1, { 0, 0.7 }, nil, false, "Targeting Display Control Panel", "SHKVAL Optics adjustment selector (no function)")
--Landing Lights & Voice Warning Control Panel
Ka_50:defineMultipositionSwitch("LIGHT_LANDING_ON_RETR_OFF", 44, 3001, 382, 3, 0.5, "Landing Lights & Voice Warning Control Panel", "Landing light On/Retraction/Off Switch")
Ka_50:defineToggleSwitch("LIGHT_LANDING_MAIN_BACKUP", 44, 3002, 383, "Landing Lights & Voice Warning Control Panel", "Main/BackUp landing light Switch")
Ka_50:defineMultipositionSwitch("ADF_NDB_MODE", 46, 3003, 381, 3, 0.5, "Landing Lights & Voice Warning Control Panel", "ADF Inner-Auto-Outer NDB Switch")
Ka_50:definePushButton("VOICE_MSG_OFF", 13, 3001, 384, "Landing Lights & Voice Warning Control Panel", "Voice message system messages OFF button")
Ka_50:defineToggleSwitch("VOICE_MSG_EMER", 13, 3002, 386, "Landing Lights & Voice Warning Control Panel", "Voice message system emergency ON Switch")
Ka_50:definePushButton("VOICE_MSG_REPEAT", 13, 3003, 385, "Landing Lights & Voice Warning Control Panel", "Voice message system messages repeat button")

----Right Forward Panel
--EKRAN Warning System display

--- Splits a string into an array by newlines
--- @param inputstr string?
--- @return string[]
local function line_split(inputstr)
	local t = {}
	if inputstr then
		for str in string.gmatch(inputstr, "([^\n]+)") do
			table.insert(t, str)
		end
	end
	return t
end

local indEKRAN = {}
local ekran_txt_1 = {}
local ekran_txt_2 = {}
Ka_50:addExportHook(function()
	indEKRAN = Module.parse_indication(4)
	ekran_txt_1 = line_split(indEKRAN.txt_1)
	ekran_txt_2 = line_split(indEKRAN.txt_2)
end)
local function getEKRAN_memory()
	return Functions.nil_state_to_str_flag(indEKRAN.txt_memory)
end
local function getEKRAN_queue()
	return Functions.nil_state_to_str_flag(indEKRAN.txt_queue)
end
local function getEKRAN_failure()
	return Functions.nil_state_to_str_flag(indEKRAN.txt_failure)
end
Ka_50:defineString("EKRAN_MEMORY", getEKRAN_memory, 1, "EKRAN", "Memory message")
Ka_50:defineString("EKRAN_QUEUE", getEKRAN_queue, 1, "EKRAN", "Queue message")
Ka_50:defineString("EKRAN_FAILURE", getEKRAN_failure, 1, "EKRAN", "Failure message")

local function getEKRAN_txt1_line1()
	return Functions.coerce_nil_to_string(ekran_txt_1[1])
end
local function getEKRAN_txt1_line2()
	return Functions.coerce_nil_to_string(ekran_txt_1[2])
end
local function getEKRAN_txt1_line3()
	return Functions.coerce_nil_to_string(ekran_txt_1[3])
end
local function getEKRAN_txt1_line4()
	return Functions.coerce_nil_to_string(ekran_txt_1[4])
end
Ka_50:defineString("EKRAN_TXT1_LINE1", getEKRAN_txt1_line1, 10, "EKRAN", "EKRAN txt 1 line 1")
Ka_50:defineString("EKRAN_TXT1_LINE2", getEKRAN_txt1_line2, 10, "EKRAN", "EKRAN txt 1 line 2")
Ka_50:defineString("EKRAN_TXT1_LINE3", getEKRAN_txt1_line3, 10, "EKRAN", "EKRAN txt 1 line 3")
Ka_50:defineString("EKRAN_TXT1_LINE4", getEKRAN_txt1_line4, 10, "EKRAN", "EKRAN txt 1 line 4")
local function getEKRAN_txt2_line1()
	return Functions.coerce_nil_to_string(ekran_txt_2[1])
end
local function getEKRAN_txt2_line2()
	return Functions.coerce_nil_to_string(ekran_txt_2[2])
end
local function getEKRAN_txt2_line3()
	return Functions.coerce_nil_to_string(ekran_txt_2[3])
end
local function getEKRAN_txt2_line4()
	return Functions.coerce_nil_to_string(ekran_txt_2[4])
end
Ka_50:defineString("EKRAN_TXT2_LINE1", getEKRAN_txt2_line1, 10, "EKRAN", "EKRAN txt 2 line 1")
Ka_50:defineString("EKRAN_TXT2_LINE2", getEKRAN_txt2_line2, 10, "EKRAN", "EKRAN txt 2 line 2")
Ka_50:defineString("EKRAN_TXT2_LINE3", getEKRAN_txt2_line3, 10, "EKRAN", "EKRAN txt 2 line 3")
Ka_50:defineString("EKRAN_TXT2_LINE4", getEKRAN_txt2_line4, 10, "EKRAN", "EKRAN txt 2 line 4")
--Standby Attitude Indicator (SAI)
Ka_50:define3PosTumb("SAI_CTRL", 55, 3001, 141, "SAI", "Cage/Control handle push/pull")
Ka_50:defineVariableStepTumb("SAI_CTRL_ROT", 55, 3003, 597, 1, "SAI", "Cage/control handle rotary")
Ka_50:defineFloat("SAI_ROLL", 142, { -1, 1 }, "SAI", "Roll")
Ka_50:defineFloat("SAI_PITCH", 143, { -1, 1 }, "SAI", "Pitch")
Ka_50:defineFloat("SAI_YAW", 144, { -1, 1 }, "SAI", "Yaw")
Ka_50:define8BitFloat("SAI_WARN_FLAG", 145, { 0, 1 }, "SAI", "Warning flag")
Ka_50:defineFloat("SAI_LONG_DEV", 599, { -1, 1 }, "SAI", "Longitudinal deviation")
Ka_50:defineFloat("SAI_LAT_DEV", 613, { -1, 1 }, "SAI", "Lateral deviation")
--Exhaust Gas Temperature Indicator
Ka_50:definePushButton("ENG_RUNNING_EGT_TEST", 4, 3022, 131, "EGT Indicator", "Running engines EGT indicator test button")
Ka_50:definePushButton("ENG_STOPPED_EGT_TEST", 4, 3023, 132, "EGT Indicator", "Stopped engines EGT indicator test button")
Ka_50:defineFloat("ENG_L_ENG_TEMP_100", 133, { 0, 1 }, "EGT Indicator", "Left engine temperature 100")
Ka_50:defineFloat("ENG_L_ENG_TEMP_10", 566, { 0, 1 }, "EGT Indicator", "Left engine temperature 10")
Ka_50:defineFloat("ENG_R_ENG_TEMP_100", 134, { 0, 1 }, "EGT Indicator", "Right engine temperature 100")
Ka_50:defineFloat("ENG_R_ENG_TEMP_10", 567, { 0, 1 }, "EGT Indicator", "Right engine temperature 10")
--Engines RPM
Ka_50:defineFloat("ENG_L_RPM", 135, { 0, 1 }, "Engines RPM", "Left engine RPM")
Ka_50:defineFloat("ENG_R_RPM", 136, { 0, 1 }, "Engines RPM", "Right engine RPM")
--Fuel Quantity
Ka_50:definePushButton("FUEL_TEST", 3, 3014, 616, "Fuel Quantity", "Self test button")
Ka_50:defineFloat("FUEL_FORWARD_TANK", 137, { 0, 1 }, "Fuel Quantity", "Forward tank amount")
Ka_50:defineFloat("FUEL_REAR_TANK", 138, { 0, 1 }, "Fuel Quantity", "Rear tank amount")
Ka_50:defineIndicatorLight("FUEL_FORWARD_TANK_TEST", 139, "Fuel Quantity", "Forward tank test Lamp (yellow)")
Ka_50:defineIndicatorLight("FUEL_REAR_TANK_TEST", 140, "Fuel Quantity", "Rear tank test Lamp (yellow)")
--ABRIS Display
Ka_50:definePushButton("ABRIS_BTN_1", 9, 3001, 512, "ABRIS Display", "Button 1")
Ka_50:definePushButton("ABRIS_BTN_2", 9, 3002, 513, "ABRIS Display", "Button 2")
Ka_50:definePushButton("ABRIS_BTN_3", 9, 3003, 514, "ABRIS Display", "Button 3")
Ka_50:definePushButton("ABRIS_BTN_4", 9, 3004, 515, "ABRIS Display", "Button 4")
Ka_50:definePushButton("ABRIS_BTN_5", 9, 3005, 516, "ABRIS Display", "Button 5")
Ka_50:defineVariableStepTumb("ABRIS_CURSOR_ROT", 9, 3006, 518, 1, "ABRIS Display", "Cursor rotary")
Ka_50:definePushButton("ABRIS_CURSOR_BTN", 9, 3007, 523, "ABRIS Display", "Cursor button")
Ka_50:definePotentiometer("ABRIS_BRIGHTNESS", 9, 3008, 517, { 0, 1 }, "ABRIS Display", "Brightness Knob")
Ka_50:defineToggleSwitch("ABRIS_POWER", 9, 3009, 130, "ABRIS Display", "Power Switch")

----Left Panel
--R-800L1 VHF Radio Control System
Ka_50:defineIndicatorLight("R800_TEST_LAMP", 419, "R-800 VHF-2", "BIT Lamp (green)")
Ka_50:definePushButton("R800_TEST_BTN", 48, 3001, 418, "R-800 VHF-2", "BIT button")
Ka_50:defineToggleSwitch("R800_AM_FM", 48, 3002, 417, "R-800 VHF-2", "AM-FM toggle Switch")
Ka_50:defineToggleSwitch("R800_EMER_RCVR", 48, 3003, 421, "R-800 VHF-2", "Emergency receiver Switch")
Ka_50:defineToggleSwitch("R800_ADF", 48, 3004, 422, "R-800 VHF-2", "ADF Switch")
Ka_50:defineToggleSwitch("R800_DATA_TRANSFER_RATE", 48, 3005, 420, "R-800 VHF-2", "Data transfer rate Switch")
Ka_50:defineToggleSwitch("R800_SQUELCH", 48, 3006, 423, "R-800 VHF-2", "Squelch button")
Ka_50:defineFixedStepTumb("R800_FREQ1", 48, 3007, 424, 0.04545455, { 0, 1 }, { -1, 1 }, { "10", "11", "12", "13", "14", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39" }, "R-800 VHF-2", "Frequency 1")
Ka_50:defineFixedStepTumb("R800_FREQ2", 48, 3008, 425, 0.11111111, { 0, 1 }, { -1, 1 }, nil, "R-800 VHF-2", "Frequency 2")
Ka_50:defineFixedStepTumb("R800_FREQ3", 48, 3009, 426, 0.11111111, { 0, 1 }, { -1, 1 }, nil, "R-800 VHF-2", "Frequency 3")
Ka_50:defineFixedStepTumb("R800_FREQ4", 48, 3010, 427, 0.33333333, { 0, 1 }, { -1, 1 }, { "00", "25", "50", "75" }, "R-800 VHF-2", "Frequency 4")
Ka_50:define8BitFloat("R800_FREQ1_ROT", 577, { 0, 1 }, "R-800 VHF-2", "Frequency 1 rotary")
Ka_50:define8BitFloat("R800_FREQ2_ROT", 574, { 0, 1 }, "R-800 VHF-2", "Frequency 2 rotary")
Ka_50:define8BitFloat("R800_FREQ3_ROT", 575, { 0, 1 }, "R-800 VHF-2", "Frequency 3 rotary")
Ka_50:define8BitFloat("R800_FREQ4_ROT", 576, { 0, 1 }, "R-800 VHF-2", "Frequency 4 rotary")
--Targeting Mode Control Panel
Ka_50:defineTumb("WEAPONS_AUTO_TURN_BTN", 12, 3010, 437, 0.3, { 0, 0.3 }, nil, false, "Targeting Mode Control Panel", "Automatic turn on target button")
definePushButtonLed(Ka_50, "WEAPONS_AUTO_TURN_LED", 437, "Targeting Mode Control Panel", "Automatic turn on target LED (green)")
Ka_50:defineTumb("WEAPONS_AIRBORNE_TARGET_BTN", 12, 3011, 438, 0.3, { 0, 0.3 }, nil, false, "Targeting Mode Control Panel", "Airborne target button")
definePushButtonLed(Ka_50, "WEAPONS_AIRBORNE_TARGET_LED", 438, "Targeting Mode Control Panel", "Airborne target LED (green)")
Ka_50:defineTumb("WEAPONS_FORWARD_HEMI_TARGET_BTN", 12, 3012, 439, 0.3, { 0, 0.3 }, nil, false, "Targeting Mode Control Panel", "Head-on airborne target button")
definePushButtonLed(Ka_50, "WEAPONS_FORWARD_HEMI_TARGET_LED", 439, "Targeting Mode Control Panel", "Head-on airborne target LED (green)")
Ka_50:defineTumb("WEAPONS_GROUND_TARGET_BTN", 12, 3013, 440, 0.3, { 0, 0.3 }, nil, false, "Targeting Mode Control Panel", "Ground moving target button")
definePushButtonLed(Ka_50, "WEAPONS_GROUND_TARGET_LED", 440, "Targeting Mode Control Panel", "Ground moving target LED (green)")
Ka_50:defineTumb("WEAPONS_TARGET_RESET_BTN", 12, 3016, 441, 0.6, { 0, 0.6 }, nil, false, "Targeting Mode Control Panel", "Targeting mode reset button")
definePushButtonLed(Ka_50, "WEAPONS_TARGET_RESET_LED", 441, "Targeting Mode Control Panel", "Targeting mode reset LED (green)")
Ka_50:defineToggleSwitch("WEAPONS_TRAINING_MODE", 12, 3009, 432, "Targeting Mode Control Panel", "Training mode Switch")
Ka_50:defineToggleSwitch("K041_POWER", 59, 3002, 433, "Targeting Mode Control Panel", "K-041 power Switch")
Ka_50:defineToggleSwitch("HMS_POWER", 23, 3002, 434, "Targeting Mode Control Panel", "HMS/NVG power Switch")
Ka_50:defineToggleSwitch("WEAPONS_AUTOTRACK_GUNSIGHT", 12, 3017, 436, "Targeting Mode Control Panel", "Automatic Tracking / gun sight Switch")
Ka_50:defineToggleSwitch("LASER_STANDBY", 11, 3001, 435, "Targeting Mode Control Panel", "Laser standby ON/OFF Switch")
Ka_50:defineTumb("WEAPONS_MODE", 12, 3014, 431, 0.1, { 0, 0.4 }, nil, false, "Targeting Mode Control Panel", "Weapon system mode selector")
--Engine and APU Start-Up Controls
Ka_50:defineIndicatorLight("ENG_START_VLV_OPEN", 163, "Engines Start-Up Control Panel", "Engines start valve open Lamp (green)")
Ka_50:definePushButton("ENG_START", 4, 3005, 412, "Engines Start-Up Control Panel", "Start-Up selected engine button")
Ka_50:definePushButton("ENG_STOP", 4, 3006, 413, "Engines Start-Up Control Panel", "InterrUpt start-Up button")
Ka_50:definePushButton("ENG_APU_STOP", 4, 3007, 414, "Engines Start-Up Control Panel", "Stop APU button")
Ka_50:defineMultipositionSwitch("ENG_STARTUP_MODE", 4, 3012, 415, 3, 0.1, "Engines Start-Up Control Panel", "Engine StartUp/Crank/False Start selector")
Ka_50:defineMultipositionSwitch("ENG_SELECTOR", 4, 3008, 416, 4, 0.1, "Engines Start-Up Control Panel", "Engine selector")
--Radio Intercom SPU-9 Panel
Ka_50:defineTumb("RADIO_SELECTOR", 50, 3002, 428, 0.11, { 0, 0.33 }, nil, false, "Radio Intercom SPU-9 Panel", "Radio communicator selector")
--Auxiliary Power Unit (APU) Control
Ka_50:defineIndicatorLight("APU_FUEL_VLV_OPEN", 162, "APU control panel", "APU fuel shutoff valve is open Lamp (green)")
Ka_50:defineIndicatorLight("APU_OIL_PRESS", 168, "APU control panel", "APU oil pressure Lamp (green)")
Ka_50:defineIndicatorLight("APU_STOP_RPM", 169, "APU control panel", "APU shutdown due to RPM limit Lamp (green)")
Ka_50:defineIndicatorLight("APU_OPER", 174, "APU control panel", "APU operating Lamp (green)")
Ka_50:defineFloat("APU_TEMP", 6, { 0, 1 }, "APU control panel", "APU temperature")
--Engines Cut-Off Valves
Ka_50:defineToggleSwitch("ENG_L_CUTOFF_VLV_HANDLE", 4, 3009, 554, "Engines Cut-Off Valves", "Left engine cut-off valve handle")
Ka_50:defineToggleSwitch("ENG_R_CUTOFF_VLV_HANDLE", 4, 3010, 555, "Engines Cut-Off Valves", "Right engine cut-off valve handle")
Ka_50:define8BitFloat("ENG_L_CUTOFF_VLV_HANDLE_POS", 554, { 0, 1 }, "Engines Cut-Off Valves", "Left engine cut-off valve handle pos")
Ka_50:define8BitFloat("ENG_R_CUTOFF_VLV_HANDLE_POS", 555, { 0, 1 }, "Engines Cut-Off Valves", "Right engine cut-off valve handle pos")
Ka_50:defineToggleSwitch("ENG_ROTOR_BREAK", 4, 3011, 556, "Engines Cut-Off Valves", "Rotor break")

----Right Pane
--PVI-800 Navigation Control Panel
local indPVI = nil
Ka_50:addExportHook(function()
	indPVI = Module.parse_indication(5)
end)
local function getPVI_line1_sign()
	if not indPVI then
		return ""
	end
	return indPVI.txt_VIT_sign or ""
end
local function getPVI_line2_sign()
	if not indPVI then
		return ""
	end
	return indPVI.txt_NIT_sign or ""
end
local function getPVI_line1_text()
	if not indPVI then
		return ""
	end
	return indPVI.txt_VIT or ""
end
local function getPVI_line2_text()
	if not indPVI then
		return ""
	end
	return indPVI.txt_NIT or ""
end
local function getPVI_line1_point()
	if not indPVI then
		return ""
	end
	return indPVI.txt_OIT_PPM or ""
end
local function getPVI_line2_point()
	if not indPVI then
		return ""
	end
	return indPVI.txt_OIT_NOT or ""
end
local function getPVI_line1_apostrophe1()
	if not indPVI then
		return ""
	end
	return indPVI.txt_VIT_apostrophe1 or ""
end
local function getPVI_line1_apostrophe2()
	if not indPVI then
		return ""
	end
	return indPVI.txt_VIT_apostrophe2 or ""
end
local function getPVI_line2_apostrophe1()
	if not indPVI then
		return ""
	end
	return indPVI.txt_NIT_apostrophe1 or ""
end
local function getPVI_line2_apostrophe2()
	if not indPVI then
		return ""
	end
	return indPVI.txt_NIT_apostrophe2 or ""
end
Ka_50:defineString("PVI_LINE1_SIGN", getPVI_line1_sign, 1, "PVI-800 Control Panel", "Display top line sign")
Ka_50:defineString("PVI_LINE2_SIGN", getPVI_line2_sign, 1, "PVI-800 Control Panel", "Display bottom line sign")
Ka_50:defineString("PVI_LINE1_TEXT", getPVI_line1_text, 6, "PVI-800 Control Panel", "Display top line text")
Ka_50:defineString("PVI_LINE2_TEXT", getPVI_line2_text, 6, "PVI-800 Control Panel", "Display bottom line text")
Ka_50:defineString("PVI_LINE1_POINT", getPVI_line1_point, 1, "PVI-800 Control Panel", "Display top line waypoint")
Ka_50:defineString("PVI_LINE2_POINT", getPVI_line2_point, 1, "PVI-800 Control Panel", "Display bottom line airfield/fixed/target/correction point")
Ka_50:defineString("PVI_LINE1_APOSTROPHE1", getPVI_line1_apostrophe1, 1, "PVI-800 Control Panel", "Display top line apostrophe 1")
Ka_50:defineString("PVI_LINE1_APOSTROPHE2", getPVI_line1_apostrophe2, 1, "PVI-800 Control Panel", "Display top line apostrophe 2")
Ka_50:defineString("PVI_LINE2_APOSTROPHE1", getPVI_line2_apostrophe1, 1, "PVI-800 Control Panel", "Display bottom line apostrophe 1")
Ka_50:defineString("PVI_LINE2_APOSTROPHE2", getPVI_line2_apostrophe2, 1, "PVI-800 Control Panel", "Display bottom line apostrophe 2")
Ka_50:defineTumb("PVI_0", 20, 3001, 312, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'0' button")
Ka_50:defineTumb("PVI_1", 20, 3002, 303, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'1' button")
Ka_50:defineTumb("PVI_2", 20, 3003, 304, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'2' button")
Ka_50:defineTumb("PVI_3", 20, 3004, 305, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'3' button")
Ka_50:defineTumb("PVI_4", 20, 3005, 306, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'4' button")
Ka_50:defineTumb("PVI_5", 20, 3006, 307, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'5' button")
Ka_50:defineTumb("PVI_6", 20, 3007, 308, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'6' button")
Ka_50:defineTumb("PVI_7", 20, 3008, 309, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'7' button")
Ka_50:defineTumb("PVI_8", 20, 3009, 310, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'8' button")
Ka_50:defineTumb("PVI_9", 20, 3010, 311, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "'9' button")
Ka_50:defineTumb("PVI_WAYPOINTS_BTN", 20, 3011, 315, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Waypoints button")
definePushButtonLed(Ka_50, "PVI_WAYPOINTS_LED", 315, "PVI-800 Control Panel", "Waypoints LED (green)")
Ka_50:defineTumb("PVI_INU_INFLIGHT_REALIGN_BTN", 20, 3012, 519, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Inflight INU Realignment button")
definePushButtonLed(Ka_50, "PVI_INU_INFLIGHT_REALIGN_LED", 519, "PVI-800 Control Panel", "Inflight INU Realignment LED (green)")
Ka_50:defineTumb("PVI_FIXPOINTS_BTN", 20, 3013, 316, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Fixpoints button")
definePushButtonLed(Ka_50, "PVI_FIXPOINTS_LED", 316, "PVI-800 Control Panel", "Fixpoints LED (green)")
Ka_50:defineTumb("PVI_INU_PRECISE_ALIGN_BTN", 20, 3014, 520, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Precise INU Alignment button")
definePushButtonLed(Ka_50, "PVI_INU_PRECISE_ALIGN_LED", 520, "PVI-800 Control Panel", "Precise INU Alignment LED (green)")
Ka_50:defineTumb("PVI_AIRFIELDS_BTN", 20, 3015, 317, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Airfields button")
definePushButtonLed(Ka_50, "PVI_AIRFIELDS_LED", 317, "PVI-800 Control Panel", "Airfields LED (green)")
Ka_50:defineTumb("PVI_INU_NORMAL_ALIGN_BTN", 20, 3016, 521, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Normal INU Alignment button")
definePushButtonLed(Ka_50, "PVI_INU_NORMAL_ALIGN_LED", 521, "PVI-800 Control Panel", "Normal INU Alignment LED (green)")
Ka_50:defineTumb("PVI_TARGETS_BTN", 20, 3017, 318, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Targets button")
definePushButtonLed(Ka_50, "PVI_TARGETS_LED", 318, "PVI-800 Control Panel", "Targets LED (green)")
Ka_50:defineTumb("PVI_ENTER_BTN", 20, 3018, 313, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Enter button")
definePushButtonLed(Ka_50, "PVI_ENTER_LED", 313, "PVI-800 Control Panel", "Enter LED (yellow)")
Ka_50:defineTumb("PVI_RESET_BTN", 20, 3019, 314, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Cancel button")
definePushButtonLed(Ka_50, "PVI_RESET_LED", 314, "PVI-800 Control Panel", "Cancel LED (yellow)")
Ka_50:defineTumb("PVI_INIT_PNT_BTN", 20, 3020, 522, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Initial Nav Pos button")
definePushButtonLed(Ka_50, "PVI_INIT_PNT_LED", 522, "PVI-800 Control Panel", "Initial Nav Pos LED (green)")
Ka_50:defineTumb("PVI_SELF_COOR_BTN", 20, 3021, 319, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Self coordinates button")
definePushButtonLed(Ka_50, "PVI_SELF_COOR_LED", 319, "PVI-800 Control Panel", "Self coordinates LED (green)")
Ka_50:defineTumb("PVI_DTA_DH_BTN", 20, 3022, 320, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Course:Course Deviation/Time/Range to WPT button")
definePushButtonLed(Ka_50, "PVI_DTA_DH_LED", 320, "PVI-800 Control Panel", "Course:Course Deviation/Time/Range to WPT LED (green)")
Ka_50:defineTumb("PVI_WIND_HDG_SPEED_BTN", 20, 3023, 321, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Wind Heading/Speed button")
definePushButtonLed(Ka_50, "PVI_WIND_HDG_SPEED_LED", 321, "PVI-800 Control Panel", "Wind Heading/Speed LED (green)")
Ka_50:defineTumb("PVI_THDG_TIME_RANGE_BTN", 20, 3024, 322, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "True Heading/Time/Range to final WPT button")
definePushButtonLed(Ka_50, "PVI_THDG_TIME_RANGE_LED", 322, "PVI-800 Control Panel", "True Heading/Time/Range to final WPT LED (green)")
Ka_50:defineTumb("PVI_BEARING_RANGE_BTN", 20, 3025, 323, 0.3, { 0, 0.3 }, nil, false, "PVI-800 Control Panel", "Bearing/Range to target button")
definePushButtonLed(Ka_50, "PVI_BEARING_RANGE_LED", 323, "PVI-800 Control Panel", "Bearing/Range to target LED (green)")
Ka_50:defineToggleSwitch("PVI_INU_FIX", 20, 3028, 325, "PVI-800 Control Panel", "INU fixtaking method Switch")
Ka_50:defineToggleSwitch("PVI_POWER", 25, 3016, 326, "PVI-800 Control Panel", "Datalink power Switch")
Ka_50:defineTumb("PVI_MODES", 20, 3026, 324, 0.1, { 0, 0.6 }, nil, false, "PVI-800 Control Panel", "Master mode selector")
Ka_50:definePotentiometer("PVI_BRIGHTNESS", 20, 3029, 327, { 0, 1 }, "PVI-800 Control Panel", "Brightness Knob")
--PVTz-800 Off-Board Targeting Data Link Mode Panel
Ka_50:defineTumb("DLNK_SELF_ID", 25, 3014, 328, 0.1, { 0, 0.3 }, nil, false, "Datalink Mode Panel", "Datalink self ID selector")
Ka_50:defineTumb("DLNK_MASTER_MODE", 25, 3015, 329, 0.1, { 0, 0.3 }, nil, false, "Datalink Mode Panel", "Datalink master mode selector")
--Autopilot Panel
Ka_50:defineTumb("AP_BANK_HOLD_BTN", 33, 3001, 330, 0.3, { 0, 0.3 }, nil, false, "Autopilot Panel", "Bank hold button")
definePushButtonLed(Ka_50, "AP_BANK_HOLD_LED", 330, "Autopilot Panel", "Bank hold LED (green)")
Ka_50:defineTumb("AP_HDG_HOLD_BTN", 33, 3002, 332, 0.3, { 0, 0.3 }, nil, false, "Autopilot Panel", "Heading hold button")
definePushButtonLed(Ka_50, "AP_HDG_HOLD_LED", 332, "Autopilot Panel", "Heading hold LED (green)")
Ka_50:defineTumb("AP_PITCH_HOLD_BTN", 33, 3003, 331, 0.3, { 0, 0.3 }, nil, false, "Autopilot Panel", "Pitch hold button")
definePushButtonLed(Ka_50, "AP_PITCH_HOLD_LED", 331, "Autopilot Panel", "Pitch hold LED (green)")
Ka_50:defineTumb("AP_ALT_HOLD_BTN", 33, 3004, 333, 0.3, { 0, 0.3 }, nil, false, "Autopilot Panel", "Altitude hold button")
definePushButtonLed(Ka_50, "AP_ALT_HOLD_LED", 333, "Autopilot Panel", "Altitude hold LED (green)")
Ka_50:defineTumb("AP_FD_BTN", 33, 3005, 334, 0.3, { 0, 0.3 }, nil, false, "Autopilot Panel", "Flight director button")
definePushButtonLed(Ka_50, "AP_FD_LED", 334, "Autopilot Panel", "Flight director LED (green)")
Ka_50:defineMultipositionSwitch("AP_BARO_RALT", 33, 3006, 335, 3, 0.5, "Autopilot Panel", "BARO/RALT altitude hold mode Switch")
Ka_50:defineMultipositionSwitch("AP_DH_DT", 28, 3003, 336, 3, 0.5, "Autopilot Panel", "DH/DT Switch")
--Magnetic Variation Panel
Ka_50:defineVariableStepTumb("ZMS3_MAGVAR_SELECTOR", 58, 3001, 338, 1, "Magnetic Variation Panel", "Magnetic variation selection rotaty")
Ka_50:defineFloat("ZMS3_MAGVAR_CNT_100_10", 337, { -1, 1 }, "Magnetic Variation Panel", "Magnetic variation counter 100/10")
Ka_50:defineFloat("ZMS3_MAGVAR_CNT_1", 596, { 0, 1 }, "Magnetic Variation Panel", "Magnetic variation counter 1")
--Shkval optics scan rate
Ka_50:defineTumb("SHKVAL_OPTICS_SCAN_RATE", 8, 3006, 301, 0.1, { 0, 0.7 }, nil, false, "SHKVAL Scan Rate", "SHKVAL scan rate selector")
--Latitude Correction Panel
Ka_50:defineToggleSwitch("PSHK7_NORTH_SOUTH", 57, 3002, 341, "Latitude Correction Panel", "North/South latitude selection Switch")
Ka_50:defineVariableStepTumb("PSHK7_LAT_ROT", 57, 3001, 340, 1, "Latitude Correction Panel", "Latitude selection rotaty")
Ka_50:defineFloat("PSHK7_LAT_CNT_10", 339, { 0, 1 }, "Latitude Correction Panel", "Latitude counter 10")
Ka_50:defineFloat("PSHK7_LAT_CNT_1", 594, { 0, 1 }, "Latitude Correction Panel", "Latitude counter 1")
Ka_50:defineIndicatorLight("PSHK7_AUTO", 342, "Latitude Correction Panel", "Latitude AUTO Lamp")
--Automatic Direction Finder (ADF) ARK-22
Ka_50:defineTumb("ADF_CHANNEL", 46, 3001, 357, 0.1, { 0.0, 0.9 }, nil, true, "ADF", "Channel selector")
Ka_50:defineToggleSwitch("ADF_CMPS_ANT", 46, 3004, 356, "ADF", "COMPASS-ANTENNA modes Switch")
Ka_50:defineToggleSwitch("ADF_TLF_TLG", 46, 3005, 354, "ADF", "TLF-TLG modes Switch")
Ka_50:definePotentiometer("ADF_VOLUME", 46, 3006, 353, { 0, 1 }, "ADF", "Volume Knob")
Ka_50:definePushButton("ADF_TEST", 46, 3007, 355, "ADF", "Self-test button")
--R-828 Radio Control Panel
Ka_50:defineTumb("R828_CHANNEL", 49, 3001, 371, 0.1, { 0, 0.9 }, nil, true, "R-828 VHF-1", "Radio channel selector")
Ka_50:definePotentiometer("R828_VOLUME", 49, 3002, 372, { 0, 1 }, "R-828 VHF-1", "Radio Volume")
Ka_50:definePushButton("R828_TUNER", 49, 3003, 373, "R-828 VHF-1", "Tuner button")
Ka_50:defineToggleSwitch("R828_SQUELCH", 49, 3004, 374, "R-828 VHF-1", "Squelch Switch")
Ka_50:defineIndicatorLight("R828_TUNER_LAMP", 375, "R-828 VHF-1", "Tuner indicator Lamp (green)")
--Signal Flare Panel
Ka_50:defineToggleSwitch("FLARES_RED", 52, 3002, 376, "Signal Flares", "Signal flare red button")
Ka_50:defineToggleSwitch("FLARES_GREEN", 52, 3001, 377, "Signal Flares", "Signal flare green button")
Ka_50:defineToggleSwitch("FLARES_WHITE", 52, 3003, 378, "Signal Flares", "Signal flare white button")
Ka_50:defineToggleSwitch("FLARES_YELLOW", 52, 3004, 379, "Signal Flares", "Signal flare yellow button")
Ka_50:defineToggleSwitch("FLARES_POWER", 52, 3005, 380, "Signal Flares", "Signal flare system power")

----Wall Panel
--Electrical Power Controls
Ka_50:defineIndicatorLight("ELEC_LAMP_AC_GROUND_POWER", 586, "Electrics Power", "AC ground power Lamp (green)")
Ka_50:defineIndicatorLight("ELEC_LAMP_DC_GROUND_POWER", 261, "Electrics Power", "DC ground power Lamp")
Ka_50:defineToggleSwitch("ELEC_DC_GROUND_POWER", 2, 3001, 262, "Electrics Power", "DC ground power Switch")
Ka_50:defineToggleSwitch("ELEC_DC_GROUND_POWER_COVER", 2, 3002, 263, "Electrics Power", "DC ground power Switch cover")
Ka_50:defineToggleSwitch("ELEC_BATTERY_2", 2, 3003, 543, "Electrics Power", "Battery 2 Switch")
Ka_50:defineToggleSwitch("ELEC_BATTERY_2_COVER", 2, 3004, 544, "Electrics Power", "Battery 2 Switch cover")
Ka_50:defineToggleSwitch("ELEC_BATTERY_1", 2, 3005, 264, "Electrics Power", "Battery 1 Switch")
Ka_50:defineToggleSwitch("ELEC_BATTERY_1_COVER", 2, 3006, 265, "Electrics Power", "Battery 1 Switch cover")
Ka_50:defineToggleSwitch("ELEC_AC_GROUND_POWER", 2, 3007, 267, "Electrics Power", "AC ground power Switch")
Ka_50:defineToggleSwitch("ELEC_AC_L_GEN", 2, 3008, 268, "Electrics Power", "AC left generator Switch")
Ka_50:defineToggleSwitch("ELEC_AC_R_GEN", 2, 3009, 269, "Electrics Power", "AC right generator Switch")
Ka_50:defineMultipositionSwitch("ELEC_DC_AC", 2, 3010, 270, 3, 0.1, "Electrics Power", "DC/AC inverter Switch")
--Radio and Data Link Power Control Panel
Ka_50:defineToggleSwitch("COMM_INTERCOM_POWER", 50, 3001, 284, "Comms Power", "Intercom power Switch")
Ka_50:defineToggleSwitch("COMM_VHF1_POWER", 49, 3005, 285, "Comms Power", "VHF-1 (R828) power Switch")
Ka_50:defineToggleSwitch("COMM_VHF2_POWER", 48, 3011, 286, "Comms Power", "VHF-2 (R-800) power Switch")
Ka_50:defineToggleSwitch("COMM_DATALINK_TLK_POWER", 25, 3017, 287, "Comms Power", "Radio equipment datalink TLK power Switch")
Ka_50:defineToggleSwitch("COMM_DATALINK_VHF_TLK_POWER", 25, 3018, 288, "Comms Power", "Radio equipment datalink VHF TLK power Switch")
Ka_50:defineToggleSwitch("COMM_DATALINK_SA_TLF_POWER", 0, 3007, 289, "Comms Power", "Radio equipment datalink SA-TLF power Switch (no function)")
--Fuel Boost Pump Controls
Ka_50:defineToggleSwitch("FUEL_FORWARD_PUMP_POWER", 3, 3001, 271, "Fuel System", "Forward fuel tank pumps power Switch")
Ka_50:defineToggleSwitch("FUEL_AFT_PUMP_POWER", 3, 3002, 272, "Fuel System", "Rear fuel tank pumps power Switch")
Ka_50:defineToggleSwitch("FUEL_INNER_PUMP_POWER", 3, 3003, 273, "Fuel System", "Inner external fuel tanks pumps power Switch")
Ka_50:defineToggleSwitch("FUEL_OUTER_PUMP_POWER", 3, 3004, 274, "Fuel System", "Outer external fuel tanks pumps power Switch")
Ka_50:defineToggleSwitch("FUEL_METER_POWER", 3, 3005, 275, "Fuel System", "Fuelmeter power Switch")
--Fire Extinguishers Control Panel
Ka_50:defineIndicatorLight("FIREEXT_L_ENG_FIRE", 237, "Fire Extinguishers Control Panel", "Left engine fire Lamp (red)")
Ka_50:defineIndicatorLight("FIREEXT_APU_FIRE", 239, "Fire Extinguishers Control Panel", "APU fire Lamp (red)")
Ka_50:defineIndicatorLight("FIREEXT_HYDRAULICS_FIRE", 568, "Fire Extinguishers Control Panel", "Hydraulics fire Lamp (red)")
Ka_50:defineIndicatorLight("FIREEXT_R_ENG_FIRE", 241, "Fire Extinguishers Control Panel", "Right engine fire Lamp (red)")
Ka_50:defineIndicatorLight("FIREEXT_VENT_FIRE", 243, "Fire Extinguishers Control Panel", "Ventilator fire Lamp (red)")
Ka_50:defineIndicatorLight("FIREEXT_BOTTLE1", 244, "Fire Extinguishers Control Panel", "Extinguishing bottle 1 is ready Lamp (yellow)")
Ka_50:defineIndicatorLight("FIREEXT_BOTTLE2", 245, "Fire Extinguishers Control Panel", "Extinguishing bottle 2 is ready Lamp (yellow)")
Ka_50:definePushButton("FIREEXT_L_ENG_EXT", 40, 3001, 236, "Fire Extinguishers Control Panel", "Left engine extinguisher button")
Ka_50:definePushButton("FIREEXT_APU_EXT", 40, 3002, 238, "Fire Extinguishers Control Panel", "APU extinguisher button")
Ka_50:definePushButton("FIREEXT_R_ENG_EXT", 40, 3003, 240, "Fire Extinguishers Control Panel", "Right engine extinguisher button")
Ka_50:definePushButton("FIREEXT_VENT_EXT", 40, 3004, 242, "Fire Extinguishers Control Panel", "Ventilator extinguisher button")
Ka_50:defineMultipositionSwitch("FIREEXT_EXT_MODE", 40, 3005, 248, 3, 0.1, "Fire Extinguishers Control Panel", "Fire extinguisher Work / Off / Test Switch")
Ka_50:defineToggleSwitch("FIREEXT_EXT_MODE_COVER", 40, 3007, 249, "Fire Extinguishers Control Panel", "Fire extinguisher Work / Off / Test Switch cover")
Ka_50:defineToggleSwitch("FIREEXT_MONITOR", 40, 3008, 250, "Fire Extinguishers Control Panel", "Fire monitor Switch")
Ka_50:defineToggleSwitch("FIREEXT_AUTO_MANUAL", 40, 3009, 246, "Fire Extinguishers Control Panel", "Fire extinguisher First (Auto) / Second (Manual) selector")
Ka_50:defineToggleSwitch("FIREEXT_AUTO_MANUAL_COVER", 40, 3010, 247, "Fire Extinguishers Control Panel", "Fire extinguisher First (Auto) / Second (Manual) selector cover")
Ka_50:defineMultipositionSwitch("FIREEXT_WARN_TEST", 40, 3011, 251, 4, 0.1, "Fire Extinguishers Control Panel", "Fire warning sensors groUp BIT Switch")
--Fuel Shutoff Valve Control
Ka_50:defineToggleSwitch("FUEL_L_ENG_VLV", 3, 3006, 276, "Fuel System", "Left engine fuel valve Switch")
Ka_50:defineToggleSwitch("FUEL_L_ENG_VLV_COVER", 3, 3007, 277, "Fuel System", "Left engine fuel valve Switch cover")
Ka_50:defineToggleSwitch("FUEL_R_ENG_VLV", 3, 3008, 278, "Fuel System", "Right engine fuel valve Switch")
Ka_50:defineToggleSwitch("FUEL_R_ENG_VLV_COVER", 3, 3009, 279, "Fuel System", "Right engine fuel valve Switch cover")
Ka_50:defineToggleSwitch("FUEL_APU_VLV", 3, 3010, 280, "Fuel System", "APU fuel valve Switch")
Ka_50:defineToggleSwitch("FUEL_APU_VLV_COVER", 3, 3011, 281, "Fuel System", "APU fuel valve Switch cover")
Ka_50:defineToggleSwitch("FUEL_XFEED_VLV", 3, 3012, 282, "Fuel System", "Fuel crossfeed valve Switch")
Ka_50:defineToggleSwitch("FUEL_XFEED_VLV_COVER", 3, 3013, 283, "Fuel System", "Fuel crossfeed valve Switch cover")
--Pilot Ejection System Controls
Ka_50:defineToggleSwitch("EJECT_POWER_1", 6, 3001, 214, "Ejection System", "Ejecting system power 1 Switch")
Ka_50:defineToggleSwitch("EJECT_POWER_2", 6, 3002, 215, "Ejection System", "Ejecting system power 2 Switch")
Ka_50:defineToggleSwitch("EJECT_POWER_3", 6, 3003, 216, "Ejection System", "Ejecting system power 3 Switch")
Ka_50:defineToggleSwitch("EJECT_POWER_COVER", 6, 3004, 217, "Ejection System", "Ejecting system power cover")
--Engines Power Indicator
Ka_50:defineFloat("ENG_NOMINAL_MODE_PRESS", 592, { 0, 1 }, "Engines Power Indicator", "Engines nominal mode pressure")
Ka_50:defineFloat("ENG_L_ENG_PRESS", 234, { 0, 1 }, "Engines Power Indicator", "Left engine pressure")
Ka_50:defineFloat("ENG_R_ENG_PRESS", 235, { 0, 1 }, "Engines Power Indicator", "Right engine pressure")
--Oil Pressure and Temperature Gauges
Ka_50:defineFloat("OIL_L_ENG_PRESS", 252, { 0, 1 }, "Oil Pressure and Temperature", "Left engine oil pressure")
Ka_50:defineFloat("OIL_R_ENG_PRESS", 253, { 0, 1 }, "Oil Pressure and Temperature", "Right engine oil pressure")
Ka_50:defineFloat("OIL_GEARBOX_PRESS", 254, { 0, 1 }, "Oil Pressure and Temperature", "Transmission oil pressure")
Ka_50:defineFloat("OIL_L_ENG_TEMP", 255, { 0, 1 }, "Oil Pressure and Temperature", "Left engine oil temperature")
Ka_50:defineFloat("OIL_R_ENG_TEMP", 256, { 0, 1 }, "Oil Pressure and Temperature", "Right engine oil temperature")
Ka_50:defineFloat("OIL_GEARBOX_TEMP", 257, { 0, 1 }, "Oil Pressure and Temperature", "Transmission oil temperature")
--Onboard Equipment Control Panel
Ka_50:defineToggleSwitch("HYD_POWER", 5, 3001, 220, "Onboard Equipment Control Panel", "Main hydraulics power Switch")
Ka_50:defineToggleSwitch("HYD_POWER_COVER", 5, 3002, 221, "Onboard Equipment Control Panel", "Main hydraulics power Switch cover")
Ka_50:defineToggleSwitch("IFF_POWER", 42, 3001, 218, "Onboard Equipment Control Panel", "IFF power Switch")
Ka_50:defineToggleSwitch("IFF_POWER_COVER", 42, 3002, 219, "Onboard Equipment Control Panel", "IFF power Switch cover")
Ka_50:defineToggleSwitch("NAV_POWER", 59, 3001, 222, "Onboard Equipment Control Panel", "Navigation system power Switch")
Ka_50:definePushButton("SHKVAL_WINDSCREEN_WIPER", 8, 3007, 224, "Onboard Equipment Control Panel", "SHKVAL windscreen wiper button")
Ka_50:defineToggleSwitch("WEAPONS_POWER", 12, 3018, 547, "Onboard Equipment Control Panel", "Weapons system power Switch")
Ka_50:defineToggleSwitch("WEAPONS_POWER_COVER", 12, 3019, 548, "Onboard Equipment Control Panel", "Weapons system power Switch cover")
Ka_50:defineToggleSwitch("LIGHT_BEACON", 45, 3003, 228, "Onboard Equipment Control Panel", "Anticollision beacon Switch")
Ka_50:defineMultipositionSwitch("NAV_GYRO_MAG_MAN_HDG", 28, 3001, 229, 3, 0.1, "Onboard Equipment Control Panel", "NAV Gyro/Mag/Manual heading Switch")
Ka_50:defineToggleSwitch("SAI_POWER", 55, 3004, 230, "Onboard Equipment Control Panel", "SAI power Switch")
--Lighting Control Panel
Ka_50:defineToggleSwitch("LIGHT_ROTOR_TIP", 45, 3001, 296, "Lighting Control Panel", "Rotor tip lights Switch")
Ka_50:defineMultipositionSwitch("LIGHT_FORMATION", 45, 3002, 297, 4, 0.1, "Lighting Control Panel", "Formation lights Switch")
Ka_50:defineToggleSwitch("LIGHT_ADI_SAI", 51, 3003, 298, "Lighting Control Panel", "ADI and SAI lighting Switch")
Ka_50:defineToggleSwitch("LIGHT_COCKPIT_NVG", 51, 3007, 299, "Lighting Control Panel", "Night vision cockpit lighting Switch")
Ka_50:defineToggleSwitch("LIGHT_COCKPIT", 51, 3001, 300, "Lighting Control Panel", "Cockpit panel lighting Switch")
--Electronic Engine Governors
Ka_50:defineToggleSwitch("ENG_L_ENG_EEG", 4, 3001, 290, "EEG", "Left engine Electronic Engine Governor Switch")
Ka_50:defineToggleSwitch("ENG_L_ENG_EEG_COVER", 4, 3002, 291, "EEG", "Left engine Electronic Engine Governor Switch cover")
Ka_50:defineToggleSwitch("ENG_R_ENG_EEG", 4, 3003, 292, "EEG", "Right engine Electronic Engine Governor Switch")
Ka_50:defineToggleSwitch("ENG_R_ENG_EEG_COVER", 4, 3004, 293, "EEG", "Right engine Electronic Engine Governor Switch cover")
Ka_50:defineToggleSwitch("ENG_EEG_GG_TEST_OPER", 4, 3015, 294, "EEG", "EEG gas generator Test / Operate Switch")
Ka_50:defineToggleSwitch("ENG_EEG_GG_TEST_OPER_COVER", 4, 3016, 569, "EEG", "EEG gas generator Test / Operate Switch cover")
Ka_50:defineMultipositionSwitch("ENG_EEG_PT1_OPER_PT2", 4, 3017, 295, 3, 0.1, "EEG", "EEG power turbine channel 1 test / Operate / EEG power turbine channel 2 test Switch")
Ka_50:defineToggleSwitch("ENG_EEG_PT1_OPER_PT2_COVER", 4, 3018, 570, "EEG", "EEG power turbine channel 1 test / Operate / EEG power turbine channel 2 test Switch cover")

----Rear Auxiliary Panel
--Engines Control Instruments Panel
Ka_50:definePushButton("ENG_L_EGT_GOVERNOR", 4, 3019, 457, "Engines Control Instruments Panel", "Left EGT control threshold governor button")
Ka_50:definePushButton("ENG_R_EGT_GOVERNOR", 4, 3020, 458, "Engines Control Instruments Panel", "Right EGT control threshold governor button")
Ka_50:definePushButton("ENG_VIBR_MONITOR", 4, 3021, 459, "Engines Control Instruments Panel", "Engines vibrations monitoring system control button")
--Automatic Ejection System System BIT Panel
Ka_50:defineIndicatorLight("EJECT_SYS_TEST_LAMP", 461, "Ejection System BIT Panel", "Ejection system test Lamp (green)")
Ka_50:defineTumb("EJECT_SYS_SELECTOR", 6, 3005, 462, 0.1, { 0, 0.6 }, nil, false, "Ejection System BIT Panel", "Ejecting system circuit selector")
Ka_50:definePushButton("EJECT_SYS_TEST_BTN", 6, 3006, 460, "Ejection System BIT Panel", "Ejecting system circuit test button")
--EKRAN and Voice Warning System Control
Ka_50:definePushButton("VOICE_MSG_SYS_TEST", 13, 3004, 442, "EKRAN and Voice Warning System Control", "Voice message system check button")
--Hydraulic Temperature and Pressure Indicators
Ka_50:defineIndicatorLight("HYD_MAIN_VLV", 469, "Hydraulic Temperature and Pressure", "Main hydraulic valve Lamp (green)")
Ka_50:defineIndicatorLight("HYD_COMMON_VLV", 470, "Hydraulic Temperature and Pressure", "Common hydraulic valve Lamp (green)")
Ka_50:defineFloat("HYD_COMMON_PRESS", 471, { 0, 1 }, "Hydraulic Temperature and Pressure", "Common hydraulic pressure")
Ka_50:defineFloat("HYD_MAIN_PRESS", 472, { 0, 1 }, "Hydraulic Temperature and Pressure", "Main hydraulic pressure")
Ka_50:defineFloat("HYD_ACC_PRESS", 473, { 0, 1 }, "Hydraulic Temperature and Pressure", "Accumulators hydraulic pressure")
Ka_50:defineFloat("HYD_WHEEL_PRESS", 474, { 0, 1 }, "Hydraulic Temperature and Pressure", "Wheel brakes hydraulic pressure")
Ka_50:defineFloat("HYD_COMMON_TEMP", 475, { 0, 1 }, "Hydraulic Temperature and Pressure", "Common hydraulic temperature")
Ka_50:defineFloat("HYD_MAIN_TEMP", 476, { 0, 1 }, "Hydraulic Temperature and Pressure", "Main hydraulic temperature")
--PPK-800 Systems Preparation and Check Panel
Ka_50:defineTumb("PPK800_ATGM_TEMP", 32, 3001, 483, 0.1, { 0, 1.0 }, nil, false, "PPK-800 Systems Preparation and Check Panel", "ATGM Temperature selector")
Ka_50:defineTumb("PPK800_BAL_DATA", 12, 3023, 484, 0.1, { 0, 1.0 }, nil, false, "PPK-800 Systems Preparation and Check Panel", "Unguided rocket and gun pods ballistics data settings selector")
Ka_50:defineTumb("PPK800_SYS_BIT", 32, 3003, 485, 0.1, { 0, 0.8 }, nil, false, "PPK-800 Systems Preparation and Check Panel", "Systems BIT selector")
Ka_50:defineToggleSwitch("PPK800_CTRL_COMP_BIT", 32, 3004, 486, "PPK-800 Systems Preparation and Check Panel", "Control computers BIT Switch")
Ka_50:defineToggleSwitch("PPK800_INU_POWER", 15, 3001, 487, "PPK-800 Systems Preparation and Check Panel", "INU Power Switch")
Ka_50:defineToggleSwitch("PPK800_INU_HEAT", 15, 3002, 488, "PPK-800 Systems Preparation and Check Panel", "INU Heater Switch")
Ka_50:definePushButton("PPK800_SELF_TEST", 32, 3007, 489, "PPK-800 Systems Preparation and Check Panel", "Self test system push-button")
Ka_50:defineToggleSwitch("PPK800_EMER_INU_ALIGN", 32, 3008, 490, "PPK-800 Systems Preparation and Check Panel", "Emergency INU alignment Switch")
Ka_50:defineToggleSwitch("PPK800_SLING_STAB", 32, 3009, 491, "PPK-800 Systems Preparation and Check Panel", "Stabilisation and indication of hanger cable Switch")
Ka_50:defineToggleSwitch("PPK800_VIDEO_TAPE_REC", 32, 3010, 492, "PPK-800 Systems Preparation and Check Panel", "Video Tape Recorder Switch")
--LWS, WS and CMS Power and Test Panel
Ka_50:defineIndicatorLight("LWS_OPER", 582, "LWS", "Operating Lamp (green)")
Ka_50:definePushButton("LWS_TEST", 36, 3003, 584, "LWS", "Self-test button")
Ka_50:defineToggleSwitch("LWS_POWER", 36, 3002, 583, "LWS", "Power Switch")
Ka_50:defineToggleSwitch("UV26_POWER", 22, 3010, 496, "UV-26 Power and Test Panel", "UV-26 Power Switch")
Ka_50:defineToggleSwitch("UV26_POWER_COVER", 22, 3012, 497, "UV-26 Power and Test Panel", "UV-26 Power Switch cover")
Ka_50:defineToggleSwitch("UV26_TEST", 22, 3011, 498, "UV-26 Power and Test Panel", "UV-26 BIT Switch")
Ka_50:defineToggleSwitch("UV26_TEST_COVER", 22, 3013, 499, "UV-26 Power and Test Panel", "UV-26 BIT Switch cover")
--Electrical System Control Panel
Ka_50:definePotentiometer("ELEC_AUX_BRIGHTNESS", 51, 3006, 451, { 0, 1 }, "Electrical System Control Panel", "Auxiliary panel Brightness Knob")
Ka_50:defineToggleSwitch("ELEC_AUX_LIGHTS", 51, 3005, 450, "Electrical System Control Panel", "Auxiliary panel lightning Switch")
Ka_50:defineToggleSwitch("ELEC_HYD_TRAN_EKRAN_POWER", 34, 3002, 452, "Electrical System Control Panel", "Hydraulics/transmission groUp and EKRAN power Switch")
Ka_50:defineToggleSwitch("ELEC_HYD_TRAN_EKRAN_POWER_COVER", 34, 3003, 453, "Electrical System Control Panel", "Hydraulics/transmission groUp and EKRAN power Switch cover")
--Lighting Brightness Control Panel
Ka_50:definePotentiometer("LIGHT_AUX_BRIGHTNESS", 51, 3008, 507, { 0, 1 }, "Lighting Brightness Control Panel", "Lighting night vision cockpit Brightness Knob (blue)")
Ka_50:definePotentiometer("LIGHT_COCKPIT_BRIGHTNESS", 51, 3002, 593, { 0, 1 }, "Lighting Brightness Control Panel", "Lighting cockpit panel Brightness Knob")
Ka_50:definePotentiometer("LIGHT_HSI_ADI_BRIGHTNESS", 51, 3004, 508, { 0, 1 }, "Lighting Brightness Control Panel", "Lighting HSI and ADI Brightness Knob")

--Externals
Ka_50:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
Ka_50:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
Ka_50:defineBitFromDrawArgument("EXT_STROBE", 193, "External Aircraft Model", "Strobe Light")
Ka_50:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
Ka_50:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
Ka_50:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

Ka_50:defineIndicatorLight("PLAFOND_LAMP", 1000, "Lighting Control Panel", "Plafond Lamp (rear left) (yellow)") -------
Ka_50:defineToggleSwitch("LIGHT_CPT_INT", 51, 3009, 1001, "Lighting Control Panel", "Lighting cockpit interior Lamp Switch")
Ka_50:defineToggleSwitch("REDU_GEAR_OIL_PRESS", 4, 3024, 258, "Right Panel", "Reducing Gear box oil pressure indication selector") ---action=3024, stop_action=3025
Ka_50:defineToggleSwitch("SLING_AUT_MAN", 41, 3004, 259, "Right Panel", "Sling load Auto/Manual")
Ka_50:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTORS", 40, "External Aircraft Model", "Rotors Move")

Ka_50:defineFloat("DOOR_POS_L", 533, { 0, 1 }, "Cockpit", "Door Position Left")
Ka_50:defineFloat("DOOR_POS_T", 535, { 0, 1 }, "Cockpit", "Door Position Top")
Ka_50:defineIndicatorLight("OP_PITOT_L_LAMP", 155, "Overhead Panel", "Pitot Lamp Left (green)")
Ka_50:defineIndicatorLight("HEAT_SYS_OK_L", 537, "Defrost Panel", "Heating System Intact (green)")
Ka_50:defineIndicatorLight("HEAT_ICE_L", 538, "Defrost Panel", "Ice detected (green)")
Ka_50:defineIndicatorLight("ABRIS_BTN_1_L", 561, "ABRIS Display", "Button 1 Light (green)")
Ka_50:defineIndicatorLight("ABRIS_BTN_2_L", 562, "ABRIS Display", "Button 2 Light (green)")
Ka_50:defineIndicatorLight("ABRIS_BTN_3_L", 563, "ABRIS Display", "Button 3 Light (green)")
Ka_50:defineIndicatorLight("ABRIS_BTN_4_L", 564, "ABRIS Display", "Button 4 Light (green)")
Ka_50:defineIndicatorLight("ABRIS_BTN_5_L", 565, "ABRIS Display", "Button 5 Light (green)")
Ka_50:defineIndicatorLight("LWS_BIT_L", 582, "LWS", "Weapon system built-in test (green)")
Ka_50:defineFloat("BACK_L_BTN", 551, { 0, 1 }, "Lighting Control Panel", "Button Backlights (white)")
Ka_50:defineFloat("BACK_L_PIT", 803, { 0, 1 }, "Lighting Control Panel", "Cockpit Backlights (white)")
Ka_50:defineFloat("BACK_L_SCREEN", 900, { 0, 1 }, "Lighting Control Panel", "Target Screen Backlights (white)")
Ka_50:defineFloat("BACK_L_SAI", 802, { 0, 1 }, "Lighting Control Panel", "SAI Backlights (white)")
Ka_50:defineFloat("BACK_L_ADI", 798, { 0, 1 }, "Lighting Control Panel", "ADI Backlights (white)")
Ka_50:defineIndicatorLight("OP_PITOT_R_LAMP", 157, "Overhead Panel", "Pitot Lamp Right (green)")
Ka_50:defineFloat("SC_MASTER_CAUTION_BRT", 1015, { 0, 1 }, "System Controller", "Master Caution LED Brightness (red)")
Ka_50:defineFloat("SC_ROTOR_RPM_BRT", 1016, { 0, 1 }, "System Controller", "Rotor RPM warning LED Brightness (yellow)")
Ka_50:definePotentiometer("OP_WARNLIGHTS_BRIGHTNESS", 14, 3005, 149, { 0, 1 }, "Overhead Panel", "Warning Lights Brightness Knob")
Ka_50:defineFloat("HMD_PRIS_ROT", 1010, { 0, 1 }, "Cockpit", "HMD Prisma Rotation")
Ka_50:defineToggleSwitch("DOOR_HDL", 34, 3018, 1020, "Cockpit", "Door handle")

Ka_50:defineReadWriteRadio("R800L1_RADIO", 48, 7, 3, 1000, "R-800L1 VHF Radio")
Ka_50:defineReadWriteRadio("R828_RADIO", 49, 7, 3, 1000, "R-828 VHF Radio")

return Ka_50
