BIOS.protocol.beginModule("UH-1H", 0x1400)

local inputProcessors = moduleBeingDefined.inputProcessors
local lowFrequencyMap = moduleBeingDefined.lowFrequencyMap
local highFrequencyMap = moduleBeingDefined.highFrequencyMap
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication


local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineRelativeTumb = BIOS.util.defineRelativeTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch


defineIndicatorLight("CL_A0", 91, "Caution Lights Panel", "ENGINE OIL PRESS")
defineIndicatorLight("CL_B0", 92, "Caution Lights Panel", "ENGINE ICING")
defineIndicatorLight("CL_C0", 93, "Caution Lights Panel", "ENGINE ICE JET")
defineIndicatorLight("CL_D0", 94, "Caution Lights Panel", "ENGINE CHIP DET")
defineIndicatorLight("CL_E0", 95, "Caution Lights Panel", "LEFT FUEL BOOST")
defineIndicatorLight("CL_F0", 96, "Caution Lights Panel", "RIGHT FUEL BOOST")
defineIndicatorLight("CL_G0", 97, "Caution Lights Panel", "ENG FUEL PUMP")
defineIndicatorLight("CL_H0", 98, "Caution Lights Panel", "20 MIN FUEL")
defineIndicatorLight("CL_I0", 99, "Caution Lights Panel", "FUEL FILTER")
defineIndicatorLight("CL_J0", 100, "Caution Lights Panel", "GOV EMER")

defineIndicatorLight("CL_A1", 101, "Caution Lights Panel", "AUX FUEL LOW")
defineIndicatorLight("CL_B1", 102, "Caution Lights Panel", "XMSN OIL PRESS")
defineIndicatorLight("CL_C1", 103, "Caution Lights Panel", "XMSN OIL HOT")
defineIndicatorLight("CL_D1", 104, "Caution Lights Panel", "HYD PRESSURE")
defineIndicatorLight("CL_E1", 105, "Caution Lights Panel", "ENGINE INLET AIR")
defineIndicatorLight("CL_F1", 106, "Caution Lights Panel", "INST INVERTER")
defineIndicatorLight("CL_G1", 107, "Caution Lights Panel", "DC GENERATOR")
defineIndicatorLight("CL_H1", 108, "Caution Lights Panel", "EXTERNAL POWER")
defineIndicatorLight("CL_I1", 109, "Caution Lights Panel", "CHIP DETECTOR")
defineIndicatorLight("CL_J1", 110, "Caution Lights Panel", "IFF")

defineIndicatorLight("ARMED_IND", 254, "Armament Panel", "ARMED Indicator")
defineIndicatorLight("SAFE_IND", 255, "Armament Panel", "SAFE Indicator")
defineIndicatorLight("FIRE_IND", 275, "Front Dash", "FIRE Warning Light")
defineIndicatorLight("LOW_RPM_IND", 276, "Front Dash", "Low RPM Warning Light")
defineIndicatorLight("MASTER_CAUTION_IND", 277, "Front Dash", "MASTER CAUTION Light")

defineIndicatorLight("IFF_REPLY_IND", 76, "IFF", "IFF Reply Indicator Lamp")
defineIndicatorLight("IFF_TEST_IND", 77, "IFF", "IFF Test Indicator Lamp")


defineToggleSwitch("BAT_SW", 1, 3001, 219, "Electrical System", "Battery Switch")
defineToggleSwitch("STARTER_GEN_SW", 1, 3003, 220, "Electrical System", "Starter/Stdby GEN")
defineMultipositionSwitch("DC_VM_SRC", 1, 3004, 218, 5, 0.1, "Electrical System", "DC Voltmeter Source")
defineToggleSwitch("NON_ESS_BUS_SW", 1, 3005, 221, "Electrical System", "NON ESS BUS Switch")
defineMultipositionSwitch("AC_VM_SRC", 1, 3007, 214, 3, 0.1, "Electrical System", "AC Voltmeter Source")
defineTumb("INVERTER_SW", 1, 3008, 215, 1, {-1, 1}, {"0", "1", "2"}, false, "Electrical System", "Inverter Switch")

local cb_start_cmd = 3021
defineToggleSwitch("CB_IFF_APX1", 1, cb_start_cmd, 285, "Circuit Breakers", "IFF APX 1 (No Function)")
defineToggleSwitch("CB_IFF_APX2", 1, cb_start_cmd + 1, 287, "Circuit Breakers", "IFF APX 2 (No Function)")
defineToggleSwitch("CB_PORX_WARN", 1, cb_start_cmd + 2, 289, "Circuit Breakers", "Prox. warn. (No Function)")
defineToggleSwitch("CB_MARKER_BEACON", 1, cb_start_cmd + 3, 291, "Circuit Breakers", "Marker Beacon")
defineToggleSwitch("CB_VHF_NAV", 1, cb_start_cmd + 4, 293, "Circuit Breakers", "VHF Nav. (ARN-82)")
defineToggleSwitch("CB_LF_NAV", 1, cb_start_cmd + 5, 295, "Circuit Breakers", "LF Nav. (ARN-83)")
defineToggleSwitch("CB_INT_CPLT", 1, cb_start_cmd + 6, 297, "Circuit Breakers", "Intercom Copilot (No Function)")
defineToggleSwitch("CB_INT_PLT", 1, cb_start_cmd + 7, 299, "Circuit Breakers", "Intercom Pilot")
defineToggleSwitch("CB_ARC_102", 1, cb_start_cmd + 8, 349, "Circuit Breakers", "ARC-102 HF Static Inverter (No Function)")
defineToggleSwitch("CB_HF_ANT", 1, cb_start_cmd + 9, 351, "Circuit Breakers", "HF ANT COUPLR (No Function)")
defineToggleSwitch("CB_HF_ARC_102", 1, cb_start_cmd + 10, 353, "Circuit Breakers", "HF ARC-102 (No Function)")
defineToggleSwitch("CB_FM_RADIO", 1, cb_start_cmd + 11, 355, "Circuit Breakers", "FM Radio")
defineToggleSwitch("CB_UHF_RADIO", 1, cb_start_cmd + 12, 357, "Circuit Breakers", "UHF Radio")
defineToggleSwitch("CB_FM2_RADIO", 1, cb_start_cmd + 13, 359, "Circuit Breakers", "FM 2 Radio (No Function)")
defineToggleSwitch("CB_AM_RADIO", 1, cb_start_cmd + 14, 361, "Circuit Breakers", "VHF AM Radio")

defineToggleSwitch("CB_PITOT_TUBE", 1, cb_start_cmd + 16, 321, "Circuit Breakers", "Pitot tube (No Function)")

defineToggleSwitch("CB_RESCUE_CONT", 1, cb_start_cmd + 18, 345, "Circuit Breakers", "Rescue hoist CTL (No Function)")
defineToggleSwitch("CB_CABLE", 1, cb_start_cmd + 19, 347, "Circuit Breakers", "Rescoue hoist cable cutter (No Function)")

defineToggleSwitch("CB_WIPER_CPLT", 1, cb_start_cmd + 20, 301, "Circuit Breakers", "Wind wiper CPLT")
defineToggleSwitch("CB_WIPER_PLT", 1, cb_start_cmd + 21, 303, "Circuit Breakers", "Wind wiper PLT")
defineToggleSwitch("CB_KY20", 1, cb_start_cmd + 22, 305, "Circuit Breakers", "KY-28 Secure Radio (No Function)")
defineToggleSwitch("CB_STARTER", 1, cb_start_cmd + 23, 403, "Circuit Breakers", "Starter Relay (No Function)")
defineToggleSwitch("CB_SL_PWR", 1, cb_start_cmd + 24, 307, "Circuit Breakers", "Search Light power (No Function)")
defineToggleSwitch("CB_LDGLTS", 1, cb_start_cmd + 25, 309, "Circuit Breakers", "Landing Lights power (No Function)")
defineToggleSwitch("CB_SL_CTL", 1, cb_start_cmd + 26, 311, "Circuit Breakers", "Landing and Search Lights Control (No Function)")
defineToggleSwitch("CB_ANTICOLL", 1, cb_start_cmd + 27, 313, "Circuit Breakers", "Anticollision light (No Function)")
defineToggleSwitch("CB_FUS_LTS", 1, cb_start_cmd + 28, 363, "Circuit Breakers", "Fuselage lights (No Function)")
defineToggleSwitch("CB_NAV_LTS", 1, cb_start_cmd + 29, 365, "Circuit Breakers", "Navigation lights (No Function)")
defineToggleSwitch("CB_DOME_LTS", 1, cb_start_cmd + 30, 367, "Circuit Breakers", "Dome lights (No Function)")
defineToggleSwitch("CB_COCKPIT_LTS", 1, cb_start_cmd + 31, 369, "Circuit Breakers", "Cockpit lights (No Function)")
defineToggleSwitch("CB_CAUTION_LTS", 1, cb_start_cmd + 32, 371, "Circuit Breakers", "Caution lights (No Function)")
defineToggleSwitch("CB_CONSOLE_LTS", 1, cb_start_cmd + 33, 373, "Circuit Breakers", "Console lights (No Function)")
defineToggleSwitch("CB_INST_LTS", 1, cb_start_cmd + 34, 375, "Circuit Breakers", "INST Panel lights (No Function)")
defineToggleSwitch("CB_INST_SEC_LTS", 1, cb_start_cmd + 35, 377, "Circuit Breakers", "INST SEC lights (No Function)")
defineToggleSwitch("CB_OUTLET_VALVE", 1, cb_start_cmd + 36, 323, "Circuit Breakers", "Cabin Heater Outlet Valve (No Function)")
defineToggleSwitch("CB_AIR_VALVE", 1, cb_start_cmd + 37, 325, "Circuit Breakers", "Cabin Heater Air Valve (No Function)")
defineToggleSwitch("CB_RESCUE_PWR", 1, cb_start_cmd + 38, 343, "Circuit Breakers", "Rescue Hoist Power (No Function)")
defineToggleSwitch("CB_RPM_WARN", 1, cb_start_cmd + 39, 327, "Circuit Breakers", "RPM Warning System (No Function)")
defineToggleSwitch("CB_ANTI_ICE", 1, cb_start_cmd + 40, 329, "Circuit Breakers", "Engine anti-ice (No Function)")
defineToggleSwitch("CB_FIRE", 1, cb_start_cmd + 41, 331, "Circuit Breakers", "Fire detector (No Function)")
defineToggleSwitch("CB_LH_FUEL", 1, cb_start_cmd + 42, 333, "Circuit Breakers", "LH fuel boost pump (No Function)")
defineToggleSwitch("CB_TURN_SLIP", 1, cb_start_cmd + 43, 335, "Circuit Breakers", "Turn & Slip Indicator")
defineToggleSwitch("CB_TEMP", 1, cb_start_cmd + 44, 337, "Circuit Breakers", "TEMP indicator (No Function)")
defineToggleSwitch("CB_HYDCTL", 1, cb_start_cmd + 45, 339, "Circuit Breakers", "HYD Control (No Function)")
defineToggleSwitch("CB_TRIM", 1, cb_start_cmd + 47, 341, "Circuit Breakers", "Force Trim (No Function)")
defineToggleSwitch("CB_HOOK", 1, cb_start_cmd + 48, 379, "Circuit Breakers", "Cargo hook release (No Function)")
defineToggleSwitch("CB_JTSN", 1, cb_start_cmd + 49, 381, "Circuit Breakers", "EXT Stores jettison (No Function)")
defineToggleSwitch("CB_SPARE_INVTR", 1, cb_start_cmd + 50, 383, "Circuit Breakers", "Spare Inverter (No Function)")
defineToggleSwitch("CB_INVTR", 1, cb_start_cmd + 51, 385, "Circuit Breakers", "Inverter CTRL (No Function)")
defineToggleSwitch("CB_MAIN_INVTR", 1, cb_start_cmd + 52, 387, "Circuit Breakers", "Main Inverter PWR (No Function)")
defineToggleSwitch("CB_GEN_BUS", 1, cb_start_cmd + 53, 389, "Circuit Breakers", "Generator & Bus Reset (No Function)")
defineToggleSwitch("CB_STBY_GEN", 1, cb_start_cmd + 54, 391, "Circuit Breakers", "STBY Generator Field (No Function)")
defineToggleSwitch("CB_GOV", 1, cb_start_cmd + 55, 393, "Circuit Breakers", "Governor Control (No Function)")
defineToggleSwitch("CB_IDLE_STOP", 1, cb_start_cmd + 56, 395, "Circuit Breakers", "IDLE Stop release (No Function)")
defineToggleSwitch("CB_RH_FUEL", 1, cb_start_cmd + 57, 397, "Circuit Breakers", "RH fuel boost pumps (No Function)")
defineToggleSwitch("CB_FUEL_TRANS", 1, cb_start_cmd + 58, 399, "Circuit Breakers", "Fuel TRANS (No Function)")
defineToggleSwitch("CB_FUEL_VALVES", 1, cb_start_cmd + 59, 401, "Circuit Breakers", "Fuel valves (No Function)")

defineToggleSwitch("CB_HEATED_BLANKET1", 1, cb_start_cmd + 60, 315, "Circuit Breakers", "Heated blanket 1 (No Function)")
defineToggleSwitch("CB_HEATED_BLANKET2", 1, cb_start_cmd + 61, 317, "Circuit Breakers", "Heated blanket 2 (No Function)")
defineToggleSwitch("CB_VM", 1, cb_start_cmd + 62, 319, "Circuit Breakers", "Voltmeter Non Ess Bus (No Function)")

defineToggleSwitch("CB_IGN", 1, cb_start_cmd + 64, 405, "Circuit Breakers", "Ignition system (No Function)")

defineToggleSwitch("CB_PLT_ATTD1", 1, cb_start_cmd + 65, 423, "Circuit Breakers", "Pilot ATTD1 (No Function)")
defineToggleSwitch("CB_PLT_ATTD2", 1, cb_start_cmd + 66, 424, "Circuit Breakers", "Pilot ATTD2 (No Function)")
defineToggleSwitch("CB_CPLT_ATTD1", 1, cb_start_cmd + 67, 425, "Circuit Breakers", "Copilot ATTD1 (No Function)")
defineToggleSwitch("CB_CPLT_ATTD2", 1, cb_start_cmd + 68, 426, "Circuit Breakers", "Coilot ATTD2 (No Function)")
defineToggleSwitch("CB_PLT_ATTD1", 1, cb_start_cmd + 65, 423, "Circuit Breakers", "Pilot ATTD1 (No Function)")
defineToggleSwitch("CB_GYRO", 1, cb_start_cmd + 69, 427, "Circuit Breakers", "Gyro Compass (No Function)")
defineToggleSwitch("CB_FUEL_QTY", 1, cb_start_cmd + 70, 428, "Circuit Breakers", "Fuel Quantity (No Function)")
defineToggleSwitch("CB_28V", 1, cb_start_cmd + 71, 429, "Circuit Breakers", "28V Trans (No Function)")
defineToggleSwitch("CB_FAIL_RELAY", 1, cb_start_cmd + 72, 430, "Circuit Breakers", "Fail Relay (No Function)")
defineToggleSwitch("CB_FUEL", 1, cb_start_cmd + 73, 431, "Circuit Breakers", "Pressure Fuel (No Function)")
defineToggleSwitch("CB_TORQ", 1, cb_start_cmd + 74, 432, "Circuit Breakers", "Pressure Torque (No Function)")
defineToggleSwitch("CB_XMSN", 1, cb_start_cmd + 75, 433, "Circuit Breakers", "Pressure XMSN (No Function)")
defineToggleSwitch("CB_ENG", 1, cb_start_cmd + 76, 434, "Circuit Breakers", "Pressure Eng (No Function)")
defineToggleSwitch("CB_CRSIND", 1, cb_start_cmd + 77, 435, "Circuit Breakers", "Course Ind (No Function)")


defineToggleSwitch("PITOT_HEAT", 1, 3016, 238, "Overhead Panel", "Pitot Heater")
defineTumb("MAIN_GEN_SW", 1, 3002, 216, 1, {-1, 1}, {"0", "1", "2"}, false, "Overhead Panel", "Main Generator RESET/OFF/ON")
defineToggleSwitch("MAIN_GEN_COVER", 1, 3019, 217, "Overhead Panel", "Main Generator Switch Cover")

defineRockerSwitch("CLP_RESET_TEST_SW", 16, 3001, 3001, 3001, 3001, 111, "Caution Lights Panel", "Test/Reset Rocker Switch")
defineRockerSwitch("CLP_BRIGHT_DIM_SW", 16, 3002, 3002, 3002, 3002, 112, "Caution Lights Panel", "Bright/Dim Rocker Switch")

defineToggleSwitch("MAIN_FUEL_SW", 2, 3001, 81, "Fuel System", "Main Fuel Switch")
definePushButton("TEST_FUEL_GAUGE_BTN", 2, 3002, 240, "Fuel System", "Test Fuel Gauge Button")

defineRelativeTumb("IFF_CODE", 17, 3007, 58, 0.1, {0.0, 0.3}, {1, -1}, nil, "IFF", "IFF Code: ZERO - B - A - (HOLD)")
defineMultipositionSwitch("IFF_MASTER", 17, 3008, 59, 5, 0.1, "IFF", "IFF Master")
defineTumb("IFF_OUT_AUDIO_LIGHT", 17, 3009, 60, 1, {-1, 1}, {"0", "1", "2"}, false, "IFF", "IFF Out: LIGHT - OFF - AUDIO")
defineTumb("IFF_TEST_M1", 17, 3010, 61, 1, {-1, 1}, {"0", "1", "2"}, true, "IFF", "Test M-1")
defineTumb("IFF_TEST_M2", 17, 3011, 62, 1, {-1, 1}, {"0", "1", "2"}, true, "IFF", "Test M-2")
defineTumb("IFF_TEST_M3", 17, 3012, 63, 1, {-1, 1}, {"0", "1", "2"}, true, "IFF", "Test M-3")
defineTumb("IFF_TEST_M4", 17, 3013, 64, 1, {-1, 1}, {"0", "1", "2"}, true, "IFF", "Test M-4")
defineTumb("IFF_RADTEST", 17, 3014, 65, 1, {-1, 1}, {"0", "1", "2"}, true, "IFF", "RAD Test/Mon")
defineTumb("IFF_MIC_IDENT", 17, 3015, 66, 1, {-1, 1}, {"0", "1", "2"}, true, "IFF", "RAD Test/Mon")
defineToggleSwitch("IFF_ON_OUT", 17, 3016, 67, "IFF", "IFF On/Out")
defineTumb("IFF_MODE1_WHEEL1", 17, 3001, 68, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-1 Wheel 1")
defineTumb("IFF_MODE1_WHEEL2", 17, 3002, 69, 0.1, {0.0, 0.3}, nil, true, "IFF", "Mode-1 Wheel 2")
defineTumb("IFF_MODE3A_WHEEL1", 17, 3003, 70, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-3A Wheel 1")
defineTumb("IFF_MODE3A_WHEEL2", 17, 3004, 71, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-3A Wheel 2")
defineTumb("IFF_MODE3A_WHEEL3", 17, 3005, 72, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-3A Wheel 3")
defineTumb("IFF_MODE3A_WHEEL4", 17, 3006, 73, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-3A Wheel 4")
definePushButton("IFF_REPLY_TEST", 17, 3017, 74, "IFF", "REPLY Push to Test")
definePotentiometer("IFF_REPLY_DIM", 17, 3020, 78, {0.0, 1.0}, "IFF", "IFF Reply Dim")
definePushButton("IFF_TEST_TEST", 17, 3018, 75, "IFF", "TEST Push to Test")
definePotentiometer("IFF_TEST_DIM", 17, 3021, 79, {0.0, 1.0}, "IFF", "TEST Reply Dim")



defineToggleSwitchToggleOnly("CLOCK_ADJUST_PULL", 30, 3001, 131, "Clock", "Adjustment Dial Pull")
defineRotary("CLOCK_ADJUST", 30, 3002, 130, "Clock", "Adjustment Dial")

definePotentiometer("THROTTLE", 3, 3024, 250, {-1.0, 0.4}, "Collective", "Throttle Axis")
defineToggleSwitch("THROTTLE_STOP", 3, 3027, 206, "Collective", "Throttle Stop")

defineToggleSwitch("ENG_DEICE", 3, 3002, 84, "Engine Panel", "De-Ice Switch")
defineToggleSwitch("LOW_RPM_AUDIO", 3, 3021, 80, "Engine Panel", "Low RPM Audio Switch")
defineRockerSwitch("CHIP_DET_SW", 3, 3013, 3013, 3013, 3013, 86, "Center Console", "Chip Detector Rocker Switch")
defineToggleSwitch("EMER_GOV_SW", 3, 3014, 85, "Engine Panel", "Emergency Govenor Switch")
defineToggleSwitch("HYD_CONT_SW", 4, 3003, 90, "Center Console", "Hydraulic Control Switch")
defineToggleSwitch("FORCE_TRIM_SW", 4, 3004, 89, "Center Console", "Force Trim Enable Switch")

defineRockerSwitch("GOV_RPM_SW", 3, 3015, 3015, 3015, 3015, 203, "Collective", "Governor RPM Rocker Switch")

definePushButton("FIRE_TEST_BTN", 3, 3023, 278, "Front Dash", "Fire Test Button")

definePushButton("CPLT_ADI_CAGE", 6, 3001, 140, "Front Dash", "Cage Copilot ADI")

--definePotentiometer("ADI_PITCH_ADJ", 6, 3002, 146, {0, 1}, "Front Dash", "ADI Pitch Adjust")

definePotentiometer("ADI_PITCH_TRIM", 5, 3001, 145, {0, 1}, "Front Dash", "ADI Pitch Trim Knob")
definePotentiometer("ADI_PITCH_TRIM", 5, 3002, 144, {0, 1}, "Front Dash", "ADI Roll Trim Knob")

defineRotary("ALT_ADJ_CPLT", 19, 3001, 172, "Front Dash", "Copilot Altimeter Pressure Adjustment")

defineRotary("ALT_ADJ_PLT", 18, 3001, 181, "Front Dash", "Pilot Altimeter Pressure Adjustment")

definePushButton("VHFCOMM_TEST_SW", 20, 3002, 6, "VHF Radio", "Communication Test Button")

defineTumb("VHFCOMM_PWR", 20, 3001, 7, 0.15, {0.85, 1.0}, nil, false, "VHF COMM Radio", "Power")
document { msg = "VHFCOMM_MHZ", category = "VHF COMM Radio", description = "MHz", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["VHFCOMM_MHZ"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("1%.0f%.0f", a(1)*10, a(2)*10)
end
inputProcessors["VHFCOMM_MHZ"] = function(state)
	if state == "INC" then
		GetDevice(20):performClickableAction(3004, 1)
	elseif state == "DEC" then
		GetDevice(20):performClickableAction(3004, -1)
	end
end

definePotentiometer("VHFCOMM_VOL", 20, 3003, 8, {0, 0.65}, "VHF COMM Radio", "Volume Control")
document { msg = "VHFCOMM_KHZ", category = "VHF COMM Radio", description = "KHz", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["VHFCOMM_KHZ"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("%.0f%02.0f", a(3)*10, a(4)*100)
end
inputProcessors["VHFCOMM_KHZ"] = function(state)
	if state == "INC" then
		GetDevice(20):performClickableAction(3005, 1)
	elseif state == "DEC" then
		GetDevice(20):performClickableAction(3005, -1)
	end
end


definePotentiometer("INT_VOL", 21, 3007, 29, {0.3, 1.0}, "Intercom Panel", "Intercom Volume")
defineToggleSwitch("INT_RCVR1_SW", 21, 3001, 23, "Intercom Panel", "Receiver 1 Switch (VHF AM)")
defineToggleSwitch("INT_RCVR2_SW", 21, 3002, 24, "Intercom Panel", "Receiver 2 Switch (UHF)")
defineToggleSwitch("INT_RCVR3_SW", 21, 3003, 25, "Intercom Panel", "Receiver 3 Switch (VHF FM)")
defineToggleSwitch("INT_RECVR4_SW", 21, 3004, 26, "Intercom Panel", "Receiver 4 Switch (No Function)")
defineToggleSwitch("INT_INT_SW", 21, 3005, 27, "Intercom Panel", "INT Receiver Switch")
defineToggleSwitch("INT_NAV_SW", 21, 3006, 28, "Intercom Panel", "NAV Receiver Switch")
defineMultipositionSwitch("INT_MODE", 21, 3008, 30, 6, 0.1, "Intercom Mode: PVT - INT - 1 - 2 - 3 - 4")

defineToggleSwitch("RADIO_ICS_SW", 21, 3009, 194, "Cyclic", "Radio/ICS Switch")


defineTumb("UHF_PRESET", 22, 3001, 16, 0.05, {0.0, 0.95}, {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, false, "UHF Radio", "Preset Channel Selector")


document { msg = "UHF_10MHZ", category = "UHF Radio", description = "10 MHz", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["UHF_10MHZ"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("%.0f%.0f", 2+a(10), a(11)*10)
	--return string.format("%.0f%.0f%.0f.%.0f%.0f", 2+a(10), a(11)*10, a(12)*10, a(13)*10, a(14)*10)
end
inputProcessors["UHF_10MHZ"] = function(state)
	if state == "INC" then
		GetDevice(22):performClickableAction(3002, -1)
	elseif state == "DEC" then
		GetDevice(22):performClickableAction(3002, 1)
	end
end


document { msg = "UHF_1MHZ", category = "UHF Radio", description = "1 MHz", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["UHF_1MHZ"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("%.0f", a(12)*10)
end
inputProcessors["UHF_1MHZ"] = function(state)
	if state == "INC" then
		GetDevice(22):performClickableAction(3003, -1)
	elseif state == "DEC" then
		GetDevice(22):performClickableAction(3003, 1)
	end
end


document { msg = "UHF_50KHZ", category = "UHF Radio", description = "50 KHz", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["UHF_50KHZ"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("%.0f%.0f", a(13)*10, a(14)*10)
end
inputProcessors["UHF_50KHZ"] = function(state)
	if state == "INC" then
		GetDevice(22):performClickableAction(3004, -1)
	elseif state == "DEC" then
		GetDevice(22):performClickableAction(3004, 1)
	end
end
--defineTumb("UHF_10MHZ", 22, 3002, 18, 0.1, {0, 0.9}, nil, true, "UHF Radio", "UHF 10 MHz Selector")
--defineTumb("UHF_1MHZ", 22, 3003, 19, 0.1, {0, 0.9}, nil, true, "UHF Radio", "UHF 1 MHz Selector")
--defineTumb("UHF_50KHZ", 22, 3004, 20, 0.1, {0, 0.9}, nil, true, "UHF Radio", "UHF 50 KHz Selector")
defineMultipositionSwitch("UHF_MODE", 22, 3005, 15, 3, 0.1, "UHF Radio", "Frequency Mode Select")
defineMultipositionSwitch("UHF_FUNCTION", 22, 3006, 17, 4, 0.1, "UHF Radio", "Function Dial")
defineToggleSwitch("UHF_SQUELCH_SW", 22, 3007, 22, "UHF Radio", "Squelch Switch")
definePotentiometer("UHF_VOL", 22, 3008, 21, {0, 1}, "UHF Radio", "Volume Control")


defineTumb("VHFFM_FREQ1", 23, 3001, 31, 0.1, {0.3, 0.7}, {"3", "4", "5", "6", "7"}, false, "VHF FM Radio", "Frequency Tens of MHz")
defineTumb("VHFFM_FREQ2", 23, 3002, 32, 0.1, {0.0, 0.9}, nil, false, "VHF FM Radio", "Frequency 1 MHz")
defineTumb("VHFFM_FREQ3", 23, 3003, 33, 0.1, {0.0, 0.9}, nil, false, "VHF FM Radio", "Frequency Decimals MHz")
defineTumb("VHFFM_FREQ4", 23, 3004, 34, 0.1, {0.0, 0.1}, {"0", "5"}, "VHF FM Radio", "Frequency Hundreds of MHz")
defineMultipositionSwitch("VHFFM_MODE", 23, 3007, 35, 4, 0.1, "VHF FM Radio", "Mode Dial: OFF / T/R / RETRAN / HOME")
defineTumb("VHFFM_SQUELCH", 23, 3005, 36, 0.1, {0.0, 0.2}, nil, false, "VHF FM Radio", "Squelch Mode: DIS / CARR / TONE")
definePotentiometer("VHFFM_VOL", 23, 3006, 37, {0.3, 1}, "VHF FM Radio", "Volume Control")



defineTumb("VHFNAV_PWR", 25, 3003, 52, 0.2, {0.8, 1.0}, nil, false, "VHF NAV Radio", "Power")

document { msg = "VHFNAV_MHZ", category = "VHF NAV Radio", description = "MHz", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["VHFNAV_MHZ"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("%.0f%.0f%.0f", a(46)*10, a(47)*10, a(48)*10)
end
inputProcessors["VHFNAV_MHZ"] = function(state)
	if state == "INC" then
		GetDevice(25):performClickableAction(3001, -1)
	elseif state == "DEC" then
		GetDevice(25):performClickableAction(3001, 1)
	end
end

definePotentiometer("VHFNAV_VOL", 25, 3004, 53, {0, 0.7}, "VHF NAV Radio", "Volume Control")
document { msg = "VHFNAV_KHZ", category = "VHF Radio", description = "KHz", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["VHFNAV_KHZ"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("%.0f%.0f", a(49)*10, a(50)*10)
end
inputProcessors["VHFNAV_KHZ"] = function(state)
	if state == "INC" then
		GetDevice(25):performClickableAction(3002, -1)
	elseif state == "DEC" then
		GetDevice(25):performClickableAction(3002, 1)
	end
end


definePotentiometer("BEACON_VOL", 26, 3001, 57, {0, 1}, "Front Dash", "Marker Beacon Volume")
defineToggleSwitch("BEACON_SENSING_SW", 26, 3002, 55, "Front Dash", "Marker Beacon Sensing LOW / HIGH")


defineTumb("ADF_LOOP_LR", 27, 3005, 42, 0.1, {0.0, 0.4}, nil, false, "ADF", "ADF LOOP Left Low Speed / Left High Speed /Center / Right Low Speed / Right High Speed")

defineToggleSwitch("ADF_BFO_SW", 27, 3006, 41, "ADF", "BFO Switch")

defineMultipositionSwitch("ADF_MODE", 27, 3001, 43, 3, 0.1, "ADF", "ADF Mode OFF / ADF / ANT / LOOP")
definePotentiometer("ADF_GAIN", 27, 3004, 44, {0, 1}, "ADF", "ADF Frequency")

defineTumb("ADF_BAND", 27, 3002, 38, 1, {-1, 1}, {"0", "1", "2"}, false, "ADF", "ADF Band")
defineRotary("ADF_TUNE", 27, 3003, 39, "ADF", "ADF Tune")


defineMultipositionSwitch("NVG_POS_LTS", 7, 3001, 222, 6, 0.1, "Overhead Panel", "NVG Position Lights")
defineTumb("NAV_LTS_SW", 7, 3002, 223, 1, {-1, 1}, {"0", "1", "2"}, false, "Overhead Panel", "Navigation Lights STEADY - OFF - FLASH")
defineToggleSwitch("POS_LTS_SW", 7, 3003, 224, "Overhead Panel", "Position LIghts DIM / BRT")
defineToggleSwitch("ANTICOLL_LTS_SW", 7, 3004, 225, "Overhead Panel", "Anticollision Lights OFF / ON")
defineToggleSwitch("LDG_LIGHT_SW", 7, 3005, 202, "Collective", "Landing Lights Switch")
defineTumb("SEARCH_LIGHT_SW", 7, 3006, 201, 1, {-1, 1}, {"0", "1", "2"}, false, "Collective", "Search Light STOW / OFF / ON")
defineTumb("LDG_LT_CTRL", 7, 3007, 205, 1, {-1, 1}, {"0", "1", "2"}, false, "Collective", "Landing Lights Control Switch")

definePotentiometer("BRT_CONSOLE", 7, 3015, 230, {0, 1}, "Overhead Panel", "Overhead Console Panel Lights Brightness")
definePotentiometer("BRT_PED", 7, 3016, 231, {0, 1}, "Overhead Panel", "Pedestal Lights Brightness")
definePotentiometer("BRT_SEC", 7, 3017, 232, {0, 1}, "Overhead Panel", "Secondary Instrument Lights Brightness")
definePotentiometer("BRT_ENGINE", 7, 3018, 233, {0, 1}, "Overhead Panel", "Engine Instrument Lights Brightness")
definePotentiometer("BRT_COPILOT", 7, 3019, 234, {0, 1}, "Overhead Panel", "Copilot Instrument Lights Brightness")
definePotentiometer("BRT_PILOT", 7, 3020, 235, {0, 1}, "Overhead Panel", "Pilot Instrument Lights Brightness")
defineTumb("DOME_LIGHT_SW", 7, 3021, 226, 1, {-1, 1}, {"0", "1", "2"}, false, "Overhead Panel", "Dome Light Switch WHITE / OFF / GREEN")

defineMultipositionSwitch("BLEED_AIR_SW", 47, 3001, 236, 5, 0.1, "Overhead Panel", "Bleed Air Dial")

definePotentiometer("HDG_SET", 10, 3003, 163, {0, 1}, "Front Dash", "HDG SET Knob")
definePotentiometer("HDG_SYNC", 10, 3005, 161, {0.05, 1}, "Front Dash", "Compass Synchronizing")
defineToggleSwitch("ADF_VOR_SW", 10, 3004, 164, "Front Dash", "ADF / VOR Switch: VOR / ADF")
defineToggleSwitch("GYRO_MODE_SW", 10, 3002, 241, "Front Dash", "DG / Slave Gyro Mode: MAG / DG")

defineRotary("CRS_KNOB", 29, 3001, 155, "Front Dash", "CDI CRS Selector Knob")

defineTumb("MASTER_ARM_SW", 9, 3008, 252, 1, {-1, 1}, {"0", "1", "2"}, false, "Armament Panel", "Master Arm OFF - SAFE - ARMED")
defineTumb("GUN_SEL", 9, 3009, 253, 1, {-1, 1}, {"0", "1", "2"}, false, "Armament Panel", "Gun Selector LEFT / BOTH / RIGHT")
defineTumb("ROCKET_SEL", 9, 3010, 256, 1, {-1, 1}, {"0", "1", "2"}, false, "Armament Panel", "7.62 / 2.75 / 40")
defineMultipositionSwitch("ROCKET_PAIR", 9, 3011, 257, 8, 0.1, "Armament Panel", "Rocket Pair")
definePushButton("ROCKET_RESET", 9, 3012, 258, "Armament Panel", "Rocket Reset")
defineTumb("JTSN_COVER", 9, 3013, 259, 1, {-1, 1}, {"0", "1", "2"}, false, "Armament Panel", "Jettison Switch Cover")
definePushButton("JTSN_BTN", 9, 3014, 260, "Armament Panel", "Jettison Switch")

definePotentiometer("SIGHT_INTEN_CPLT", 32, 3001, 281, {0, 1}, "Flex Sight", "Copilot Sighting System Intensity Knob")
defineTumb("SIGHT_LAMP_SW", 32, 3003, 408, 1, {-1, 1}, {"0", "1", "2"}, false, "Flex Sight", "Sighting Station Lamp Switch BACKUP / OFF / MAIN")

defineToggleSwitch("SIGHT_ARM_PLT", 49, 3005, 0, "Flex Sight", "Pilot Sight Armed / Safe")
defineToggleSwitch("SIGHT_PWR_PLT", 49, 3006, 439, "Flex Sight", "Pilot Sight Off / On")
definePotentiometer("SIGHT_INTEN_PLT", 49, 3001, 440, {0, 1}, "Flex Sight", "Pilot Sight Intensity Knob")
definePotentiometer("SIGHT_ELEV_PLT", 49, 3003, 441, {-1, 1}, "Flex Sight", "Pilot Sight Elevation")


defineTumb("WIPER_SEL", 12, 3002, 227, 1, {-1, 1}, {"0", "1", "2"}, false, "Overhead Panel", "Wiper PILOT / BOTH / OPERATOR")
defineRelativeTumb("WIPER_SPD", 12, 3001, 229, 0.1, {0.0, 0.4}, {1, -1}, nil, "Overhead Panel", "Wiper Speed PARK - STOP - SLOW - MED - HIGH")


definePushButton("TRIM_PLT", 41, 3001, 189, "Cyclic", "Force Trim (Pilot Side)")
definePushButton("TRIM_CPLT", 41, 3002, 193, "Cyclic", "Force Trim (Copilot Side)")


defineToggleSwitch("CM_RIPPLE_COVER", 50, 3001, 450, "Countermeasures", "Ripple Fire Cover")
defineToggleSwitch("CM_RIPPLE_SW", 50, 3002, 451, "Countermeasures", "Ripple Fire Switch")
defineToggleSwitch("CM_ARM_SW", 50, 3005, 456, "Countermeasures", "SAFE / ARMED Switch")
defineToggleSwitch("CM_MAN_PGRM_SW", 50, 3009, 459, "Countermeasures", "MAN / PGRM Switch")
definePushButton("CM_FLARE_BTN", 50, 3006, 464, "Countermeasures", "Flare Button")
definePushButton("CM_ARMED_TEST", 50, 3010, 457, "Countermeasures", "Armed Lamp Test")

definePushButton("CM_FLARECNT_RESET", 50, 3003, 453, "Countermeasures", "Flare Counter Reset Button")
document { msg = "CM_FLARECNT", category = "Countermeasures", description = "Flare Counter", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["CM_FLARECNT"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("%.0f%.0f", a(460)*10, a(461)*10)
end
inputProcessors["CM_FLARECNT"] = function(state)
	if state == "INC" then
		GetDevice(50):performClickableAction(3004, 1)
	elseif state == "DEC" then
		GetDevice(50):performClickableAction(3004, -1)
	end
end

definePushButton("CM_CHAFFCNT_RESET", 50, 3007, 455, "Countermeasures", "Chaff Counter Reset Button")
document { msg = "CM_CHAFFCNT", category = "Countermeasures", description = "Chaff Counter", msg_type = "string", value_type = "string", can_set = false, actions = {"DEC", "INC"} }
lowFrequencyMap["CM_CHAFFCNT"] = function(dev0)
	local function a(n) return dev0:get_argument_value(n) end
	return string.format("%.0f%.0f", a(462)*10, a(463)*10)
end
inputProcessors["CM_CHAFFCNT"] = function(state)
	if state == "INC" then
		GetDevice(50):performClickableAction(3008, 1)
	elseif state == "DEC" then
		GetDevice(50):performClickableAction(3008, -1)
	end
end


defineToggleSwitch("RADAR_ALT_PWR", 13, 3007, 449, "Overhead Panel", "Radar Altimeter Power")
defineRotary("RADAR_ALT_LO", 13, 3002, 445, "Front Dash", "Radar Altimeter Low Setting")
defineRotary("RADAR_ALT_HI", 13, 3003, 464, "Front Dash", "Radar Altimeter High Setting")
definePushButton("RADAR_ALT_TEST", 13, 3001, 446, "Front Dash", "Radar Altimeter Test")


BIOS.protocol.endModule()