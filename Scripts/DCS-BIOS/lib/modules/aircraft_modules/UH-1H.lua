module("UH-1H", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class UH_1H: Module
local UH_1H = Module:new("UH-1H", 0x1400, { "UH-1H", "Bell47_2" })

--v2.0

-- MAIN_PANEL/electric_system_gauges.lua:
UH_1H:defineFloat("DC_VOLTAGE", 526, { 0, 1 }, "Gauges", "DC Voltage")
UH_1H:defineFloat("AC_VOLTAGE", 532, { 0, 1 }, "Gauges", "AC Voltage")
UH_1H:defineFloat("DC_BAT1_CURRENT", 527, { 0, 1 }, "Gauges", "DC Battery 1 Current")
UH_1H:defineFloat("DC_BAT2_CURRENT", 528, { 0, 1 }, "Gauges", "DC Battery 2 Current")
UH_1H:defineFloat("DC_VU1_CURRENT", 529, { 0, 1 }, "Gauges", "DC VU 1 Current")
UH_1H:defineFloat("DC_VU2_CURRENT", 530, { 0, 1 }, "Gauges", "DC VU 2 Current")
UH_1H:defineFloat("DC_VU3_CURRENT", 531, { 0, 1 }, "Gauges", "DC VU 3 Current")
UH_1H:defineFloat("AC_GEN1_CURRENT", 533, { 0, 1 }, "Gauges", "AC GEN 1 Current")
UH_1H:defineFloat("AC_GEN2_CURRENT", 534, { 0, 1 }, "Gauges", "AC GEN 2 Current")
UH_1H:defineFloat("ANTI_ICE_AMP", 371, { 0, 1 }, "Gauges", "Anti-Ice Amperemeter")

--  MAIN_PANEL/lamps.lua
UH_1H:defineIndicatorLight("CL_A0", 91, "Caution Lights Panel", "ENGINE OIL PRESS (yellow)")
UH_1H:defineIndicatorLight("CL_B0", 92, "Caution Lights Panel", "ENGINE ICING (yellow)")
UH_1H:defineIndicatorLight("CL_C0", 93, "Caution Lights Panel", "ENGINE ICE JET (yellow)")
UH_1H:defineIndicatorLight("CL_D0", 94, "Caution Lights Panel", "ENGINE CHIP DET (yellow)")
UH_1H:defineIndicatorLight("CL_E0", 95, "Caution Lights Panel", "LEFT FUEL BOOST (yellow)")
UH_1H:defineIndicatorLight("CL_F0", 96, "Caution Lights Panel", "RIGHT FUEL BOOST (yellow)")
UH_1H:defineIndicatorLight("CL_G0", 97, "Caution Lights Panel", "ENG FUEL PUMP (yellow)")
UH_1H:defineIndicatorLight("CL_H0", 98, "Caution Lights Panel", "20 MIN FUEL (yellow)")
UH_1H:defineIndicatorLight("CL_I0", 99, "Caution Lights Panel", "FUEL FILTER (yellow)")
UH_1H:defineIndicatorLight("CL_J0", 100, "Caution Lights Panel", "GOV EMER (yellow)")
UH_1H:defineIndicatorLight("CL_A1", 101, "Caution Lights Panel", "AUX FUEL LOW (yellow)")
UH_1H:defineIndicatorLight("CL_B1", 102, "Caution Lights Panel", "XMSN OIL PRESS (yellow)")
UH_1H:defineIndicatorLight("CL_C1", 103, "Caution Lights Panel", "XMSN OIL HOT (yellow)")
UH_1H:defineIndicatorLight("CL_D1", 104, "Caution Lights Panel", "HYD PRESSURE (yellow)")
UH_1H:defineIndicatorLight("CL_E1", 105, "Caution Lights Panel", "ENGINE INLET AIR (yellow)")
UH_1H:defineIndicatorLight("CL_F1", 106, "Caution Lights Panel", "INST INVERTER (yellow)")
UH_1H:defineIndicatorLight("CL_G1", 107, "Caution Lights Panel", "DC GENERATOR (yellow)")
UH_1H:defineIndicatorLight("CL_H1", 108, "Caution Lights Panel", "EXTERNAL POWER (yellow)")
UH_1H:defineIndicatorLight("CL_I1", 109, "Caution Lights Panel", "CHIP DETECTOR (yellow)")
UH_1H:defineIndicatorLight("CL_J1", 110, "Caution Lights Panel", "IFF (yellow)")
UH_1H:defineIndicatorLight("ARMED_IND", 254, "Armament Panel", "ARMED Indicator (red)")
UH_1H:defineIndicatorLight("SAFE_IND", 255, "Armament Panel", "SAFE Indicator (green)")
UH_1H:defineIndicatorLight("FIRE_IND", 275, "Front Dash", "FIRE Warning Light (yellow)")
UH_1H:defineIndicatorLight("LOW_RPM_IND", 276, "Front Dash", "Low RPM Warning Light (yellow)")
UH_1H:defineIndicatorLight("MASTER_CAUTION_IND", 277, "Front Dash", "MASTER CAUTION Light (yellow)")
UH_1H:defineIndicatorLight("IFF_REPLY_IND", 76, "IFF", "IFF Reply Indicator Lamp (green)")
UH_1H:defineIndicatorLight("IFF_TEST_IND", 77, "IFF", "IFF Test Indicator Lamp (green)")

-- mainpanel_init.lua:
UH_1H:defineFloat("CI_VBAR", 151, { -0.7, 0.7 }, "Course Indicator", "Vertical Bar")
UH_1H:defineFloat("CI_HBAR", 152, { -0.7, 0.7 }, "Course Indicator", "Horizontal Bar")
UH_1H:defineFloat("CI_TO", 153, { 0, 1 }, "Course Indicator", "To Marker")
UH_1H:defineFloat("CI_FROM", 154, { 0, 1 }, "Course Indicator", "From Marker")
UH_1H:defineFloat("CI_COURSE_CARD", 156, { 0, 1 }, "Course Indicator", "Rotating Course Card")
UH_1H:defineFloat("CI_VOFF", 157, { 0, 1 }, "Course Indicator", "Vertical OFF Warning Flag")
UH_1H:defineFloat("CI_HOFF", 158, { 0, 1 }, "Course Indicator", "Horizontal OFF Warning Flag")

UH_1H:defineFloat("ADF_FREQ", 45, { 0, 0.55 }, "ADF", "ADF Frequency")
UH_1H:defineFloat("ADF_SIGNAL", 40, { 0, 1 }, "ADF", "ADF Signal Level")

UH_1H:defineFloat("GMC_CRS1", 159, { 0, 1 }, "GMC", "GMC Course Pointer 1")
UH_1H:defineFloat("GMC_CRS2", 160, { 0, 1 }, "GMC", "GMC Course Pointer 2")
UH_1H:defineFloat("GMC_HDG_MARKER", 162, { 0, 1 }, "GMC", "GMC Heading Marker")
UH_1H:defineFloat("GMC_HDG", 165, { 0, 1 }, "GMC", "GMC Heading")
UH_1H:defineFloat("GMC_ANNUNCIATOR", 166, { -1, 1 }, "GMC", "GMC Annunciator")
UH_1H:defineFloat("GMC_PWRFAIL", 167, { 0, 1 }, "GMC", "GMC Power Fail")

UH_1H:defineFloat("RMI_CRS1", 266, { 0, 1 }, "Copilot RMI", "RMI Course Pointer 1")
UH_1H:defineFloat("RMI_CRS2", 267, { 0, 1 }, "Copilot RMI", "RMI Course Pointer 2")
UH_1H:defineFloat("RMI_HDG", 269, { 0, 1 }, "Copilot RMI", "RMI Heading")

UH_1H:defineFloat("OALT_PTR", 168, { 0, 1 }, "Altimeter (Operator)", "Altimeter Pointer")
UH_1H:defineFloat("OALT_10000", 169, { 0, 1 }, "Altimeter (Operator)", "10000 Foot Counter")
UH_1H:defineFloat("OALT_1000", 170, { 0, 1 }, "Altimeter (Operator)", "1000 Foot Counter")
UH_1H:defineFloat("OALT_100", 171, { 0, 1 }, "Altimeter (Operator)", "100 Foot Counter")

UH_1H:defineFloat("OALT_PRESS2", 174, { 0, 1 }, "Altimeter (Operator)", "Pressure Drum Counter 2")
UH_1H:defineFloat("OALT_PRESS1", 175, { 0, 1 }, "Altimeter (Operator)", "Pressure Drum Counter 1")
UH_1H:defineFloat("OALT_PRESS0", 176, { 0, 1 }, "Altimeter (Operator)", "Pressure Drum Counter 0")

UH_1H:defineFloat("OALT_CODE_OFF_FLAG", 177, { 0, 1 }, "Altimeter (Operator)", "Code Off Flag")

UH_1H:defineFloat("PALT_10000", 178, { 0, 1 }, "Altimeter (Pilot)", "10000 Foot Counter")
UH_1H:defineFloat("PALT_1000", 179, { 0, 1 }, "Altimeter (Pilot)", "1000 Foot Counter")
UH_1H:defineFloat("PALT_100", 180, { 0, 1 }, "Altimeter (Pilot)", "100 Foot Counter")

UH_1H:defineFloat("PALT_PRESS", 182, { 0, 1 }, "Altimeter (Pilot)", "Pressure Indicator")

UH_1H:defineFloat("ENG_OIL_PRESS", 113, { 0, 1 }, "Front Dash", "Engine Oil Pressure")
UH_1H:defineFloat("ENG_OIL_TEMP", 114, { 0, 1 }, "Front Dash", "Engine Oil Temperature")
UH_1H:defineFloat("TRANS_OIL_PRESS", 115, { 0, 1 }, "Front Dash", "Transmission Oil Pressure")
UH_1H:defineFloat("TRANS_OIL_TEMP", 116, { 0, 1 }, "Front Dash", "Transmission Oil Temperature")

UH_1H:defineFloat("IAS_NOSE", 117, { 0, 1 }, "Gauges", "IAS Front")
UH_1H:defineFloat("IAS_ROOF", 118, { 0, 1 }, "Gauges", "IAS Roof")

UH_1H:defineFloat("EXHAUST_TEMP", 121, { 0, 1 }, "Front Dash", "Exhaust Temperature")
UH_1H:defineFloat("ENG_RPM", 122, { 0, 1 }, "Front Dash", "Engine RPM")
UH_1H:defineFloat("ROTOR_RPM", 123, { 0, 1 }, "Front Dash", "Rotor RPM")
UH_1H:defineFloat("GAS_RPM_T", 119, { 0, 1 }, "Front Dash", "Gas Producer RPM Tenths")
UH_1H:defineFloat("GAS_RPM", 120, { 0, 1 }, "Front Dash", "Gas Producer RPM")
UH_1H:defineFloat("TORQUE_PRESS", 124, { 0, 1 }, "Front Dash", "Torque Pressure")
UH_1H:defineFloat("DC_V", 149, { 0, 1 }, "Front Dash", "DC Voltage")
UH_1H:defineFloat("AC_V", 150, { 0, 1 }, "Front Dash", "AC Voltage")
UH_1H:defineFloat("MAIN_GEN_LOAD", 436, { 0, 1 }, "Front Dash", "Main Generator Load")
UH_1H:defineFloat("STBY_GEN_LOAD", 125, { 0, 1 }, "Front Dash", "STBY Generator Load")
UH_1H:defineFloat("FUEL_PRESS", 126, { 0, 1 }, "Front Dash", "Fuel Pressure")
UH_1H:defineFloat("FUEL_QTY", 239, { 0, 1 }, "Front Dash", "Fuel Quantity")
UH_1H:defineFloat("CLOCK_H", 127, { 0, 1 }, "Front Dash", "Clock Hours")
UH_1H:defineFloat("CLOCK_M", 128, { 0, 1 }, "Front Dash", "Clock Seconds")
UH_1H:defineFloat("CLOCK_S", 129, { 0, 1 }, "Front Dash", "Clock Seconds")
UH_1H:defineFloat("TURN_PTR", 132, { -1, 1 }, "Front Dash", "Turn Indicator")
UH_1H:defineFloat("SIDESLIP", 133, { -1, 1 }, "Front Dash", "Side Slip")
UH_1H:defineFloat("VVI_P", 134, { -1, 1 }, "Front Dash", "Vertical Velocity Indicator (Pilot)")
UH_1H:defineFloat("VVI_O", 251, { -1, 1 }, "Front Dash", "Vertical Velocity Indicator (Operator)")
UH_1H:defineFloat("PADI_ROLL", 142, { -1, 1 }, "Front Dash - ADI (Pilot)", "Roll")
UH_1H:defineFloat("PADI_PITCH", 143, { -1, 1 }, "Front Dash - ADI (Pilot)", "Pitch")
UH_1H:defineFloat("PADI_OFF", 148, { 0, 1 }, "Front Dash - ADI (Pilot)", "Off Warning Flag")
UH_1H:defineFloat("OADI_ROLL", 135, { -1, 1 }, "Front Dash - ADI (Operator)", "Roll")
UH_1H:defineFloat("OADI_PITCH", 136, { -1, 1 }, "Front Dash - ADI (Operator)", "Pitch")
UH_1H:defineFloat("OADI_OFF", 141, { 0, 1 }, "Front Dash - ADI (Operator)", "Off Warning Flag")

UH_1H:defineFloat("ADI_PITCH_SHIFT", 138, { -1, 1 }, "Gauges", "Attitude Pitch Shift")

UH_1H:defineFloat("MARKER_BEACON", 56, { 0, 0.9 }, "Gauges", "Marker Beacon")

UH_1H:defineFloat("WIPER_P", 284, { 0, 1 }, "Windshield Wipers", "Windshield Wiper (Pilot)")
UH_1H:defineFloat("WIPER_O", 283, { 0, 1 }, "Windshield Wipers", "Windshield Wiper (Operator)")

UH_1H:defineFloat("CONSOLE_LIGHT", 279, { 0, 1 }, "Lights", "Console Light")
UH_1H:defineFloat("DOME_LIGHT", 410, { 0, 1 }, "Lights", "Dome Light")
UH_1H:defineFloat("DOME_LIGHT_GREEN", 411, { 0, 1 }, "Lights", "Dome Light Green")

UH_1H:defineFloat("RAM_TEMP", 437, { 0, 1 }, "Gauges", "RamTemp")

UH_1H:defineFloat("RALT_NEEDLE", 443, { 0, 1 }, "Radar Altimeter", "Needle")
UH_1H:defineFloat("RALT_OFF", 467, { 0, 1 }, "Radar Altimeter", "Off Warning Flag")
UH_1H:defineIndicatorLight("RALT_LO_LAMP", 447, "Radar Altimeter", "LO Lamp (blue)")
UH_1H:defineIndicatorLight("RALT_HI_LAMP", 465, "Radar Altimeter", "HI Lamp (blue)")
UH_1H:defineFloat("RALT_LO_IDX", 444, { 0, 1 }, "Radar Altimeter", "LO Index")
UH_1H:defineFloat("RALT_HI_IDX", 466, { 0, 1 }, "Radar Altimeter", "HI Index")

local function getRadarAlt(dev0)
	local digit1 = string.format("%.0f", dev0:get_argument_value(468) * 10)
	if digit1 == "10" then
		digit1 = " "
	end
	local digit2 = string.format("%.0f", dev0:get_argument_value(469) * 10)
	if digit2 == "10" then
		digit2 = " "
	end
	local digit3 = string.format("%.0f", dev0:get_argument_value(470) * 10)
	if digit3 == "10" then
		digit3 = " "
	end
	local digit4 = string.format("%.0f", dev0:get_argument_value(471) * 10)
	if digit4 == "10" then
		digit4 = " "
	end
	return digit1 .. digit2 .. digit3 .. digit4
end
UH_1H:defineString("RALT_DISPLAY_STR", getRadarAlt, 4, "Radar Altimeter", "Display (String)")

-- clickabledata.lua:
UH_1H:defineToggleSwitch("BAT_SW", 1, 3001, 219, "Electrical System", "Battery Switch")
UH_1H:defineToggleSwitch("STARTER_GEN_SW", 1, 3003, 220, "Electrical System", "Starter/Stdby GEN")
UH_1H:defineMultipositionSwitch("DC_VM_SRC", 1, 3004, 218, 5, 0.1, "Electrical System", "DC Voltmeter Source")
UH_1H:defineToggleSwitch("NON_ESS_BUS_SW", 1, 3005, 221, "Electrical System", "NON ESS BUS Switch")
UH_1H:defineMultipositionSwitch("AC_VM_SRC", 1, 3007, 214, 3, 0.1, "Electrical System", "AC Voltmeter Source")
UH_1H:define3PosTumb("INVERTER_SW", 1, 3008, 215, "Electrical System", "Inverter Switch")

UH_1H:defineToggleSwitch("CB_IFF_APX1", 1, 3021, 285, "Circuit Breakers", "IFF APX 1 (No Function)")
UH_1H:defineToggleSwitch("CB_IFF_APX2", 1, 3022, 287, "Circuit Breakers", "IFF APX 2 (No Function)")
UH_1H:defineToggleSwitch("CB_PORX_WARN", 1, 3023, 289, "Circuit Breakers", "Prox. warn. (No Function)")
UH_1H:defineToggleSwitch("CB_MARKER_BEACON", 1, 3024, 291, "Circuit Breakers", "Marker Beacon")
UH_1H:defineToggleSwitch("CB_VHF_NAV", 1, 3025, 293, "Circuit Breakers", "VHF Nav. (ARN-82)")
UH_1H:defineToggleSwitch("CB_LF_NAV", 1, 3026, 295, "Circuit Breakers", "LF Nav. (ARN-83)")
UH_1H:defineToggleSwitch("CB_INT_CPLT", 1, 3027, 297, "Circuit Breakers", "Intercom Copilot (No Function)")
UH_1H:defineToggleSwitch("CB_INT_PLT", 1, 3028, 299, "Circuit Breakers", "Intercom Pilot")
UH_1H:defineToggleSwitch("CB_ARC_102", 1, 3029, 349, "Circuit Breakers", "ARC-102 HF Static Inverter (No Function)")
UH_1H:defineToggleSwitch("CB_HF_ANT", 1, 3030, 351, "Circuit Breakers", "HF ANT COUPLR (No Function)")
UH_1H:defineToggleSwitch("CB_HF_ARC_102", 1, 3031, 353, "Circuit Breakers", "HF ARC-102 (No Function)")
UH_1H:defineToggleSwitch("CB_FM_RADIO", 1, 3032, 355, "Circuit Breakers", "FM Radio")
UH_1H:defineToggleSwitch("CB_UHF_RADIO", 1, 3033, 357, "Circuit Breakers", "UHF Radio")
UH_1H:defineToggleSwitch("CB_FM2_RADIO", 1, 3034, 359, "Circuit Breakers", "FM 2 Radio (No Function)")
UH_1H:defineToggleSwitch("CB_AM_RADIO", 1, 3035, 361, "Circuit Breakers", "VHF AM Radio")
UH_1H:defineToggleSwitch("CB_PITOT_TUBE", 1, 3037, 321, "Circuit Breakers", "Pitot tube (No Function)")
UH_1H:defineToggleSwitch("CB_RESCUE_CONT", 1, 3039, 345, "Circuit Breakers", "Rescue hoist CTL (No Function)")
UH_1H:defineToggleSwitch("CB_CABLE", 1, 3040, 347, "Circuit Breakers", "Rescoue hoist cable cutter (No Function)")
UH_1H:defineToggleSwitch("CB_WIPER_CPLT", 1, 3041, 301, "Circuit Breakers", "Wind wiper CPLT")
UH_1H:defineToggleSwitch("CB_WIPER_PLT", 1, 3042, 303, "Circuit Breakers", "Wind wiper PLT")
UH_1H:defineToggleSwitch("CB_KY20", 1, 3043, 305, "Circuit Breakers", "KY-28 Secure Radio (No Function)")
UH_1H:defineToggleSwitch("CB_STARTER", 1, 3044, 403, "Circuit Breakers", "Starter Relay (No Function)")
UH_1H:defineToggleSwitch("CB_SL_PWR", 1, 3045, 307, "Circuit Breakers", "Search Light power (No Function)")
UH_1H:defineToggleSwitch("CB_LDGLTS", 1, 3046, 309, "Circuit Breakers", "Landing Lights power (No Function)")
UH_1H:defineToggleSwitch("CB_SL_CTL", 1, 3047, 311, "Circuit Breakers", "Landing and Search Lights Control (No Function)")
UH_1H:defineToggleSwitch("CB_ANTICOLL", 1, 3048, 313, "Circuit Breakers", "Anticollision light (No Function)")
UH_1H:defineToggleSwitch("CB_FUS_LTS", 1, 3049, 363, "Circuit Breakers", "Fuselage lights (No Function)")
UH_1H:defineToggleSwitch("CB_NAV_LTS", 1, 3050, 365, "Circuit Breakers", "Navigation lights (No Function)")
UH_1H:defineToggleSwitch("CB_DOME_LTS", 1, 3051, 367, "Circuit Breakers", "Dome lights (No Function)")
UH_1H:defineToggleSwitch("CB_COCKPIT_LTS", 1, 3052, 369, "Circuit Breakers", "Cockpit lights (No Function)")
UH_1H:defineToggleSwitch("CB_CAUTION_LTS", 1, 3053, 371, "Circuit Breakers", "Caution lights (No Function)")
UH_1H:defineToggleSwitch("CB_CONSOLE_LTS", 1, 3054, 373, "Circuit Breakers", "Console lights (No Function)")
UH_1H:defineToggleSwitch("CB_INST_LTS", 1, 3055, 375, "Circuit Breakers", "INST Panel lights (No Function)")
UH_1H:defineToggleSwitch("CB_INST_SEC_LTS", 1, 3056, 377, "Circuit Breakers", "INST SEC lights (No Function)")
UH_1H:defineToggleSwitch("CB_OUTLET_VALVE", 1, 3057, 323, "Circuit Breakers", "Cabin Heater Outlet Valve (No Function)")
UH_1H:defineToggleSwitch("CB_AIR_VALVE", 1, 3058, 325, "Circuit Breakers", "Cabin Heater Air Valve (No Function)")
UH_1H:defineToggleSwitch("CB_RESCUE_PWR", 1, 3059, 343, "Circuit Breakers", "Rescue Hoist Power (No Function)")
UH_1H:defineToggleSwitch("CB_RPM_WARN", 1, 3060, 327, "Circuit Breakers", "RPM Warning System (No Function)")
UH_1H:defineToggleSwitch("CB_ANTI_ICE", 1, 3061, 329, "Circuit Breakers", "Engine anti-ice (No Function)")
UH_1H:defineToggleSwitch("CB_FIRE", 1, 3062, 331, "Circuit Breakers", "Fire detector (No Function)")
UH_1H:defineToggleSwitch("CB_LH_FUEL", 1, 3063, 333, "Circuit Breakers", "LH fuel boost pump (No Function)")
UH_1H:defineToggleSwitch("CB_TURN_SLIP", 1, 3064, 335, "Circuit Breakers", "Turn & Slip Indicator")
UH_1H:defineToggleSwitch("CB_TEMP", 1, 3065, 337, "Circuit Breakers", "TEMP indicator (No Function)")
UH_1H:defineToggleSwitch("CB_HYDCTL", 1, 3066, 339, "Circuit Breakers", "HYD Control (No Function)")
UH_1H:defineToggleSwitch("CB_TRIM", 1, 3068, 341, "Circuit Breakers", "Force Trim (No Function)")
UH_1H:defineToggleSwitch("CB_HOOK", 1, 3069, 379, "Circuit Breakers", "Cargo hook release (No Function)")
UH_1H:defineToggleSwitch("CB_JTSN", 1, 3070, 381, "Circuit Breakers", "EXT Stores jettison (No Function)")
UH_1H:defineToggleSwitch("CB_SPARE_INVTR", 1, 3071, 383, "Circuit Breakers", "Spare Inverter (No Function)")
UH_1H:defineToggleSwitch("CB_INVTR", 1, 3072, 385, "Circuit Breakers", "Inverter CTRL (No Function)")
UH_1H:defineToggleSwitch("CB_MAIN_INVTR", 1, 3073, 387, "Circuit Breakers", "Main Inverter PWR (No Function)")
UH_1H:defineToggleSwitch("CB_GEN_BUS", 1, 3074, 389, "Circuit Breakers", "Generator & Bus Reset (No Function)")
UH_1H:defineToggleSwitch("CB_STBY_GEN", 1, 3075, 391, "Circuit Breakers", "STBY Generator Field (No Function)")
UH_1H:defineToggleSwitch("CB_GOV", 1, 3076, 393, "Circuit Breakers", "Governor Control (No Function)")
UH_1H:defineToggleSwitch("CB_IDLE_STOP", 1, 3077, 395, "Circuit Breakers", "IDLE Stop release (No Function)")
UH_1H:defineToggleSwitch("CB_RH_FUEL", 1, 3078, 397, "Circuit Breakers", "RH fuel boost pumps (No Function)")
UH_1H:defineToggleSwitch("CB_FUEL_TRANS", 1, 3079, 399, "Circuit Breakers", "Fuel TRANS (No Function)")
UH_1H:defineToggleSwitch("CB_FUEL_VALVES", 1, 3080, 401, "Circuit Breakers", "Fuel valves (No Function)")
UH_1H:defineToggleSwitch("CB_HEATED_BLANKET1", 1, 3081, 315, "Circuit Breakers", "Heated blanket 1 (No Function)")
UH_1H:defineToggleSwitch("CB_HEATED_BLANKET2", 1, 3082, 317, "Circuit Breakers", "Heated blanket 2 (No Function)")
UH_1H:defineToggleSwitch("CB_VM", 1, 3083, 319, "Circuit Breakers", "Voltmeter Non Ess Bus (No Function)")
UH_1H:defineToggleSwitch("CB_IGN", 1, 3085, 405, "Circuit Breakers", "Ignition system (No Function)")
UH_1H:defineToggleSwitch("CB_PLT_ATTD1", 1, 3086, 423, "Circuit Breakers", "Pilot ATTD1 (No Function)")
UH_1H:defineToggleSwitch("CB_PLT_ATTD2", 1, 3087, 424, "Circuit Breakers", "Pilot ATTD2 (No Function)")
UH_1H:defineToggleSwitch("CB_CPLT_ATTD1", 1, 3088, 425, "Circuit Breakers", "Copilot ATTD1 (No Function)")
UH_1H:defineToggleSwitch("CB_CPLT_ATTD2", 1, 3089, 426, "Circuit Breakers", "Coilot ATTD2 (No Function)")
UH_1H:defineToggleSwitch("CB_GYRO", 1, 3090, 427, "Circuit Breakers", "Gyro Compass (No Function)")
UH_1H:defineToggleSwitch("CB_FUEL_QTY", 1, 3091, 428, "Circuit Breakers", "Fuel Quantity (No Function)")
UH_1H:defineToggleSwitch("CB_28V", 1, 3092, 429, "Circuit Breakers", "28V Trans (No Function)")
UH_1H:defineToggleSwitch("CB_FAIL_RELAY", 1, 3093, 430, "Circuit Breakers", "Fail Relay (No Function)")
UH_1H:defineToggleSwitch("CB_FUEL", 1, 3094, 431, "Circuit Breakers", "Pressure Fuel (No Function)")
UH_1H:defineToggleSwitch("CB_TORQ", 1, 30295, 432, "Circuit Breakers", "Pressure Torque (No Function)")
UH_1H:defineToggleSwitch("CB_XMSN", 1, 3096, 433, "Circuit Breakers", "Pressure XMSN (No Function)")
UH_1H:defineToggleSwitch("CB_ENG", 1, 3097, 434, "Circuit Breakers", "Pressure Eng (No Function)")
UH_1H:defineToggleSwitch("CB_CRSIND", 1, 3098, 435, "Circuit Breakers", "Course Ind (No Function)")

UH_1H:defineToggleSwitch("PITOT_HEAT", 1, 3016, 238, "Overhead Panel", "Pitot Heater")
UH_1H:define3PosTumb("MAIN_GEN_SW", 1, 3002, 216, "Overhead Panel", "Main Generator RESET/OFF/ON")
UH_1H:defineToggleSwitch("MAIN_GEN_COVER", 1, 3019, 217, "Overhead Panel", "Main Generator Switch Cover")

UH_1H:defineRockerSwitch("CLP_RESET_TEST_SW", 15, 3001, 3001, 3001, 3001, 111, "Caution Lights Panel", "Test/Reset Rocker Switch")
UH_1H:defineRockerSwitch("CLP_BRIGHT_DIM_SW", 15, 3002, 3002, 3002, 3002, 112, "Caution Lights Panel", "Bright/Dim Rocker Switch")

UH_1H:defineToggleSwitch("MAIN_FUEL_SW", 2, 3001, 81, "Fuel System", "Main Fuel Switch")
UH_1H:definePushButton("TEST_FUEL_GAUGE_BTN", 2, 3002, 240, "Fuel System", "Test Fuel Gauge Button")

UH_1H:defineFixedStepTumb("IFF_CODE", 17, 3007, 58, 0.1, { 0, 0.3 }, { 1, -1 }, nil, "IFF", "IFF Code: ZERO - B - A - (HOLD)")
UH_1H:defineMultipositionSwitch("IFF_MASTER", 17, 3008, 59, 5, 0.1, "IFF", "IFF Master")
UH_1H:define3PosTumb("IFF_OUT_AUDIO_LIGHT", 17, 3009, 60, "IFF", "IFF Out: LIGHT - OFF - AUDIO")
UH_1H:defineTumb("IFF_TEST_M1", 17, 3010, 61, 1, { -1, 1 }, nil, true, "IFF", "Test M-1")
UH_1H:defineTumb("IFF_TEST_M2", 17, 3011, 62, 1, { -1, 1 }, nil, true, "IFF", "Test M-2")
UH_1H:defineTumb("IFF_TEST_M3", 17, 3012, 63, 1, { -1, 1 }, nil, true, "IFF", "Test M-3")
UH_1H:defineTumb("IFF_TEST_M4", 17, 3013, 64, 1, { -1, 1 }, nil, true, "IFF", "Test M-4")
UH_1H:defineTumb("IFF_RADTEST", 17, 3014, 65, 1, { -1, 1 }, nil, true, "IFF", "RAD Test/Mon")
UH_1H:defineTumb("IFF_MIC_IDENT", 17, 3015, 66, 1, { -1, 1 }, nil, true, "IFF", "Ident/Mic Switch")
UH_1H:defineToggleSwitch("IFF_ON_OUT", 17, 3016, 67, "IFF", "IFF On/Out")
UH_1H:defineTumb("IFF_MODE1_WHEEL1", 17, 3001, 68, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-1 Wheel 1")
UH_1H:defineTumb("IFF_MODE1_WHEEL2", 17, 3002, 69, 0.1, { 0, 0.3 }, nil, true, "IFF", "Mode-1 Wheel 2")
UH_1H:defineTumb("IFF_MODE3A_WHEEL1", 17, 3003, 70, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-3A Wheel 1")
UH_1H:defineTumb("IFF_MODE3A_WHEEL2", 17, 3004, 71, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-3A Wheel 2")
UH_1H:defineTumb("IFF_MODE3A_WHEEL3", 17, 3005, 72, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-3A Wheel 3")
UH_1H:defineTumb("IFF_MODE3A_WHEEL4", 17, 3006, 73, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-3A Wheel 4")
UH_1H:definePushButton("IFF_REPLY_TEST", 17, 3017, 74, "IFF", "REPLY Push to Test")
UH_1H:definePotentiometer("IFF_REPLY_DIM", 17, 3020, 78, { 0, 1 }, "IFF", "IFF Reply Dim")
UH_1H:definePushButton("IFF_TEST_TEST", 17, 3018, 75, "IFF", "TEST Push to Test")
UH_1H:definePotentiometer("IFF_TEST_DIM", 17, 3021, 79, { 0, 1 }, "IFF", "TEST Reply Dim")

UH_1H:defineToggleSwitch("CLOCK_ADJUST_PULL", 30, 3001, 131, "Clock", "Adjustment Dial Pull")
UH_1H:defineRotary("CLOCK_ADJUST", 30, 3002, 130, "Clock", "Adjustment Dial")

UH_1H:definePotentiometer("THROTTLE", 3, 3024, 250, { -1.0, 0.4 }, "Collective", "Throttle Axis")
UH_1H:defineToggleSwitch("THROTTLE_STOP", 3, 3027, 206, "Collective", "Throttle Stop Switch, ON/OFF")

UH_1H:defineToggleSwitch("ENG_DEICE", 3, 3002, 84, "Engine Panel", "De-Ice Switch")
UH_1H:defineToggleSwitch("LOW_RPM_AUDIO", 3, 3021, 80, "Engine Panel", "Low RPM Audio Switch")
UH_1H:defineRockerSwitch("CHIP_DET_SW", 3, 3013, 3013, 3013, 3013, 86, "Center Console", "Chip Detector Rocker Switch")
UH_1H:defineToggleSwitch("EMER_GOV_SW", 3, 3014, 85, "Engine Panel", "Emergency Govenor Switch")
UH_1H:defineToggleSwitch("HYD_CONT_SW", 4, 3003, 90, "Center Console", "Hydraulic Control Switch")
UH_1H:defineToggleSwitch("FORCE_TRIM_SW", 4, 3004, 89, "Center Console", "Force Trim Enable Switch")

UH_1H:defineRockerSwitch("GOV_RPM_SW", 3, 3015, 3015, 3015, 3015, 203, "Collective", "Governor RPM Rocker Switch")

UH_1H:definePushButton("FIRE_TEST_BTN", 3, 3023, 278, "Front Dash", "Fire Test Button")

UH_1H:definePushButton("CPLT_ADI_CAGE", 6, 3001, 140, "Front Dash", "Copilot ADI Cage")
UH_1H:definePotentiometer("ADI_PITCH_TRIM_CPLT", 6, 3002, 146, { 0, 1 }, "Front Dash", "Copilot ADI Pitch Trim Knob")

UH_1H:definePotentiometer("ADI_ROLL_TRIM", 5, 3001, 145, { -1, 1 }, "Front Dash", "ADI Roll Trim Knob")
UH_1H:definePotentiometer("ADI_PITCH_TRIM", 5, 3002, 144, { -1, 1 }, "Front Dash", "ADI Pitch Trim Knob")

UH_1H:defineRotary("ALT_ADJ_CPLT", 19, 3001, 172, "Front Dash", "Copilot Altimeter Pressure Adjustment")
UH_1H:defineRotary("ALT_ADJ_PLT", 18, 3001, 181, "Front Dash", "Pilot Altimeter Pressure Adjustment")

UH_1H:definePushButton("VHFCOMM_TEST_SW", 20, 3002, 6, "VHF COMM Radio", "VHF Communication Test Button")

UH_1H:defineTumb("VHFCOMM_PWR", 20, 3001, 5, 0.15, { 0.85, 1.0 }, nil, false, "VHF COMM Radio", "VHF Power")
local vhf_comm_vol = UH_1H:definePotentiometer("VHFCOMM_VOL", 20, 3003, 9, { 0, 0.65 }, "VHF COMM Radio", "VHF Volume Control (step size less than 8192 may not work)")
local vhf_comm_vol_var_step_input = vhf_comm_vol.inputs[2] --[[@as VariableStepInput]]
vhf_comm_vol_var_step_input.suggested_step = 8192

local function getVhfCommFreq(dev0)
	local function a(n)
		return dev0:get_argument_value(n)
	end
	return string.format("1%.0f%.0f", a(1) * 10, a(2) * 10) .. "." .. string.format("%.0f%02.0f", a(3) * 10, a(4) * 100)
end
UH_1H:defineString("VHFCOMM_FREQ", getVhfCommFreq, 7, "VHF COMM Radio", "VHF Frequency")

UH_1H:defineFixedStepTumb("VHFCOMM_MHZ", 20, 3004, 7, 0.1, { 0, 1 }, { -0.1, 0.1 }, nil, "VHF COMM Radio", "VHF MHz Selector")
UH_1H:defineFixedStepTumb("VHFCOMM_KHZ", 20, 3005, 8, 0.1, { 0, 1 }, { -0.1, 0.1 }, nil, "VHF COMM Radio", "VHF KHz Selector")

UH_1H:definePotentiometer("INT_VOL", 21, 3007, 29, { 0.3, 1.0 }, "Intercom Panel", "Intercom Volume")
UH_1H:defineToggleSwitch("INT_RCVR1_SW", 21, 3001, 23, "Intercom Panel", "Receiver 1 Switch (VHF AM)")
UH_1H:defineToggleSwitch("INT_RCVR2_SW", 21, 3002, 24, "Intercom Panel", "Receiver 2 Switch (UHF)")
UH_1H:defineToggleSwitch("INT_RCVR3_SW", 21, 3003, 25, "Intercom Panel", "Receiver 3 Switch (VHF FM)")
UH_1H:defineToggleSwitch("INT_RECVR4_SW", 21, 3004, 26, "Intercom Panel", "Receiver 4 Switch (No Function)")
UH_1H:defineToggleSwitch("INT_INT_SW", 21, 3005, 27, "Intercom Panel", "INT Receiver Switch")
UH_1H:defineToggleSwitch("INT_NAV_SW", 21, 3006, 28, "Intercom Panel", "NAV Receiver Switch")
UH_1H:defineMultipositionSwitch("INT_MODE", 21, 3008, 30, 6, 0.1, "Intercom Panel", "Intercom Mode: PVT - INT - 1 - 2 - 3 - 4")

UH_1H:defineToggleSwitch("RADIO_ICS_SW", 21, 3009, 194, "Cyclic", "Radio/ICS Switch")

UH_1H:defineTumb("UHF_PRESET", 22, 3001, 16, 0.05, { 0, 0.95 }, { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20" }, false, "UHF Radio", "UHF Preset Channel Selector")

local function getUhfFreq(dev0)
	local function a(n)
		return dev0:get_argument_value(n)
	end
	return string.format("%.0f%.0f%.0f.%.0f%.0f", 2 + a(10), a(11) * 10, a(12) * 10, a(13) * 10, a(14) * 10) .. "." .. string.format("%.0f", a(12) * 10)
end
UH_1H:defineString("UHF_FREQ", getUhfFreq, 6, "UHF Radio", "UHF Frequency")

UH_1H:defineFixedStepInput("UHF_10MHZ", 22, 3002, { 0.1, -0.1 }, "UHF Radio", "UHF 10 MHz Selector") --18
UH_1H:defineFixedStepInput("UHF_1MHZ", 22, 3003, { 0.1, -0.1 }, "UHF Radio", "UHF 1 MHz Selector") --19
UH_1H:defineFixedStepInput("UHF_50KHZ", 22, 3004, { 0.1, -0.1 }, "UHF Radio", "UHF 50 KHz Selector") --20
UH_1H:defineMultipositionSwitch("UHF_MODE", 22, 3005, 15, 3, 0.1, "UHF Radio", "UHF Frequency Mode Select")
UH_1H:defineMultipositionSwitch("UHF_FUNCTION", 22, 3006, 17, 4, 0.1, "UHF Radio", "UHF Function Dial")
UH_1H:defineToggleSwitch("UHF_SQUELCH_SW", 22, 3007, 22, "UHF Radio", "UHF Squelch Switch")
UH_1H:definePotentiometer("UHF_VOL", 22, 3008, 21, { 0, 1 }, "UHF Radio", "UHF Volume Control")

UH_1H:defineTumb("VHFFM_FREQ1", 23, 3001, 31, 0.1, { 0.3, 0.7 }, { "3", "4", "5", "6", "7" }, false, "VHF FM Radio", "VHF FM Frequency Tens of MHz")
UH_1H:defineTumb("VHFFM_FREQ2", 23, 3002, 32, 0.1, { 0.0, 0.9 }, nil, false, "VHF FM Radio", "VHF FM Frequency 1 MHz")
UH_1H:defineTumb("VHFFM_FREQ3", 23, 3003, 33, 0.1, { 0.0, 0.9 }, nil, false, "VHF FM Radio", "VHF FM Frequency Decimals MHz")
UH_1H:defineTumb("VHFFM_FREQ4", 23, 3004, 34, 0.1, { 0.0, 0.1 }, { "0", "5" }, false, "VHF FM Radio", "VHF FM Frequency Hundreds of MHz")
UH_1H:defineMultipositionSwitch("VHFFM_MODE", 23, 3007, 35, 4, 0.1, "VHF FM Radio", "VHF FM Mode Dial: OFF / T/R / RETRAN / HOME")
UH_1H:defineTumb("VHFFM_SQUELCH", 23, 3005, 36, 0.1, { 0, 0.2 }, nil, false, "VHF FM Radio", "VHF FM Squelch Mode: DIS / CARR / TONE")
UH_1H:definePotentiometer("VHFFM_VOL", 23, 3006, 37, { 0.3, 1 }, "VHF FM Radio", "VHF FM Volume Control")

UH_1H:defineTumb("VHFNAV_PWR", 25, 3003, 51, 0.1, { 0.8, 1.0 }, nil, false, "VHF NAV Radio", "VHF NAV Off / On / Test")

local function getVhfNavFreq(dev0)
	local function a(n)
		return dev0:get_argument_value(n)
	end
	return string.format("%.0f%.0f%.0f", a(46) * 10, a(47) * 10, a(48) * 10) .. "." .. string.format("%.0f%.0f", a(49) * 10, a(50) * 10)
end
UH_1H:defineString("VHFNAV_FREQ", getVhfNavFreq, 6, "VHF NAV Radio", "VHF NAV Frequency")

UH_1H:defineFixedStepTumb("VHFNAV_MHZ", 25, 3001, 52, 0.1, { 0, 1 }, { 0.1, -0.1 }, nil, "VHF NAV Radio", "VHF NAV MHz Selector")
UH_1H:defineFixedStepTumb("VHFNAV_KHZ", 25, 3002, 53, 0.1, { 0, 1 }, { 0.1, -0.1 }, nil, "VHF NAV Radio", "VHF NAV KHz Selector")

local vhf_nav_vol = UH_1H:definePotentiometer("VHFNAV_VOL", 25, 3004, 54, { 0, 0.65 }, "VHF NAV Radio", "VHF NAV Volume Control (step size less than 8192 may not work)")
local vhf_nav_vol_var_step_input = vhf_nav_vol.inputs[2] --[[@as VariableStepInput]]
vhf_nav_vol_var_step_input.suggested_step = 8192

UH_1H:definePotentiometer("BEACON_VOL", 26, 3001, 57, { 0, 1 }, "Front Dash", "Marker Beacon Volume")
UH_1H:defineToggleSwitch("BEACON_SENSING_SW", 26, 3002, 55, "Front Dash", "Marker Beacon Sensing LOW / HIGH")

UH_1H:defineTumb("ADF_LOOP_LR", 27, 3005, 42, 0.1, { 0, 0.4 }, nil, false, "ADF", "ADF LOOP Left Low Speed / Left High Speed /Center / Right Low Speed / Right High Speed")
UH_1H:defineToggleSwitch("ADF_BFO_SW", 27, 3006, 41, "ADF", "BFO Switch")
UH_1H:defineMultipositionSwitch("ADF_MODE", 27, 3001, 43, 4, 0.1, "ADF", "ADF Mode OFF / ADF / ANT / LOOP")
UH_1H:definePotentiometer("ADF_GAIN", 27, 3004, 44, { 0, 1 }, "ADF", "ADF Gain")
UH_1H:define3PosTumb("ADF_BAND", 27, 3002, 38, "ADF", "ADF Band")
UH_1H:defineRotary("ADF_TUNE", 27, 3003, 39, "ADF", "ADF Tune")

UH_1H:defineMultipositionSwitch("NVG_POS_LTS", 7, 3001, 222, 6, 0.1, "Overhead Panel", "NVG Position Lights")
UH_1H:define3PosTumb("NAV_LTS_SW", 7, 3002, 223, "Overhead Panel", "Navigation Lights STEADY - OFF - FLASH")
UH_1H:defineToggleSwitch("POS_LTS_SW", 7, 3003, 224, "Overhead Panel", "Position LIghts DIM / BRT")
UH_1H:defineToggleSwitch("ANTICOLL_LTS_SW", 7, 3004, 225, "Overhead Panel", "Anticollision Lights OFF / ON")
UH_1H:defineToggleSwitch("LDG_LIGHT_SW", 7, 3005, 202, "Collective", "Landing Lights Switch")
UH_1H:define3PosTumb("SEARCH_LIGHT_SW", 7, 3006, 201, "Collective", "Search Light STOW / OFF / ON")
UH_1H:define3PosTumb("LDG_LT_CTRL", 7, 3007, 205, "Collective", "Landing Lights Control Switch")
UH_1H:definePotentiometer("BRT_CONSOLE", 7, 3015, 230, { 0, 1 }, "Overhead Panel", "Overhead Console Panel Lights Brightness")
UH_1H:definePotentiometer("BRT_PED", 7, 3016, 231, { 0, 1 }, "Overhead Panel", "Pedestal Lights Brightness")
UH_1H:definePotentiometer("BRT_SEC", 7, 3017, 232, { 0, 1 }, "Overhead Panel", "Secondary Instrument Lights Brightness")
UH_1H:definePotentiometer("BRT_ENGINE", 7, 3018, 233, { 0, 1 }, "Overhead Panel", "Engine Instrument Lights Brightness")
UH_1H:definePotentiometer("BRT_COPILOT", 7, 3019, 234, { 0, 1 }, "Overhead Panel", "Copilot Instrument Lights Brightness")
UH_1H:definePotentiometer("BRT_PILOT", 7, 3020, 235, { 0, 1 }, "Overhead Panel", "Pilot Instrument Lights Brightness")
UH_1H:define3PosTumb("DOME_LIGHT_SW", 7, 3021, 226, "Overhead Panel", "Dome Light Switch WHITE / OFF / GREEN")
UH_1H:defineMultipositionSwitch("BLEED_AIR_SW", 47, 3001, 236, 5, 0.1, "Overhead Panel", "Bleed Air Dial")

UH_1H:defineRotary("HDG_SET", 10, 3003, 163, "Front Dash", "HDG SET Knob")
UH_1H:defineRotary("HDG_SYNC", 10, 3005, 161, "Front Dash", "Compass Synchronizing")
UH_1H:defineToggleSwitch("ADF_VOR_SW", 10, 3004, 164, "Front Dash", "ADF / VOR Switch: VOR / ADF")
UH_1H:defineToggleSwitch("GYRO_MODE_SW", 10, 3002, 241, "Front Dash", "DG / Slave Gyro Mode: MAG / DG")
UH_1H:defineRotary("CRS_KNOB", 29, 3001, 155, "Front Dash", "CDI CRS Selector Knob")

UH_1H:define3PosTumb("MASTER_ARM_SW", 9, 3008, 252, "Armament Panel", "Master Arm OFF - SAFE - ARMED")
UH_1H:define3PosTumb("GUN_SEL", 9, 3009, 253, "Armament Panel", "Gun Selector LEFT / BOTH / RIGHT")
UH_1H:define3PosTumb("ROCKET_SEL", 9, 3010, 256, "Armament Panel", "7.62 / 2.75 / 40")
UH_1H:defineMultipositionSwitch("ROCKET_PAIR", 9, 3011, 257, 8, 0.1, "Armament Panel", "Rocket Pair")
UH_1H:definePushButton("ROCKET_RESET", 9, 3012, 258, "Armament Panel", "Rocket Reset")
UH_1H:defineToggleSwitch("JTSN_COVER", 9, 3013, 259, "Armament Panel", "Jettison Switch Cover")
UH_1H:definePushButton("JTSN_BTN", 9, 3014, 260, "Armament Panel", "Jettison Switch")

UH_1H:definePotentiometer("SIGHT_INTEN_CPLT", 32, 3001, 281, { 0, 1 }, "Flex Sight", "Copilot Sighting System Intensity Knob")
UH_1H:define3PosTumb("SIGHT_LAMP_SW", 32, 3003, 408, "Flex Sight", "Sighting Station Lamp Switch BACKUP / OFF / MAIN")
UH_1H:defineToggleSwitch("SIGHT_ARM_PLT", 49, 3005, 438, "Flex Sight", "Pilot Sight Armed / Safe")
UH_1H:defineToggleSwitch("SIGHT_PWR_PLT", 49, 3006, 439, "Flex Sight", "Pilot Sight Off / On")
UH_1H:definePotentiometer("SIGHT_INTEN_PLT", 49, 3001, 440, { 0, 1 }, "Flex Sight", "Pilot Sight Intensity Knob")
UH_1H:definePotentiometer("SIGHT_ELEV_PLT", 49, 3003, 441, { -1, 1 }, "Flex Sight", "Pilot Sight Elevation")

UH_1H:define3PosTumb("WIPER_SEL", 12, 3002, 227, "Overhead Panel", "Wiper PILOT / BOTH / OPERATOR")
UH_1H:defineFixedStepTumb("WIPER_SPD", 12, 3001, 229, 0.1, { 0, 0.4 }, { -1, 1 }, nil, "Overhead Panel", "Wiper Speed PARK - STOP - SLOW - MED - HIGH")

UH_1H:definePushButton("TRIM_PLT", 41, 3001, 189, "Cyclic", "Force Trim (Pilot Side)")
UH_1H:definePushButton("TRIM_CPLT", 41, 3002, 193, "Cyclic", "Force Trim (Copilot Side)")

local function getFlareCount(dev0)
	return string.format("%.0f%.0f", dev0:get_argument_value(460) * 10, dev0:get_argument_value(461) * 10)
end

UH_1H:defineToggleSwitch("CM_RIPPLE_COVER", 50, 3001, 450, "Countermeasures", "Ripple Fire Cover")
UH_1H:defineToggleSwitch("CM_RIPPLE_SW", 50, 3002, 451, "Countermeasures", "Ripple Fire Switch")
UH_1H:defineToggleSwitch("CM_ARM_SW", 50, 3005, 456, "Countermeasures", "SAFE / ARMED Switch")
UH_1H:defineToggleSwitch("CM_MAN_PGRM_SW", 50, 3009, 459, "Countermeasures", "MAN / PGRM Switch")
UH_1H:definePushButton("CM_FLARE_BTN", 50, 3006, 464, "Countermeasures", "Flare Button")
UH_1H:definePushButton("CM_ARMED_TEST", 50, 3010, 457, "Countermeasures", "Armed Lamp Test")
UH_1H:defineString("CM_FLARECNT_DISPLAY_STR", getFlareCount, 2, "Countermeasures", "Flare Counter (String)")
UH_1H:definePushButton("CM_FLARECNT_RESET", 50, 3003, 453, "Countermeasures", "Flare Counter Reset Button")
UH_1H:defineFixedStepInput("CM_FLARECNT", 50, 3004, { -1, 1 }, "Countermeasures", "Flare Counter Decrease/Increase")

UH_1H:definePushButton("CM_CHAFFCNT_RESET", 50, 3007, 455, "Countermeasures", "Chaff Counter Reset Button")
local function getChaffCount(dev0)
	return string.format("%.0f%.0f", dev0:get_argument_value(462) * 10, dev0:get_argument_value(463) * 10)
end
UH_1H:defineString("CM_CHAFFCNT_DISPLAY_STR", getChaffCount, 2, "Countermeasures", "Chaff Counter (String)")
UH_1H:defineFixedStepInput("CM_CHAFFCNT", 50, 3008, { -1, 1 }, "Countermeasures", "Chaff Counter Decrease/Increase")

UH_1H:defineToggleSwitch("RADAR_ALT_PWR", 13, 3007, 449, "Overhead Panel", "Radar Altimeter Power")
UH_1H:defineRotary("RADAR_ALT_LO", 13, 3002, 445, "Front Dash", "Radar Altimeter Low Setting")
UH_1H:defineRotary("RADAR_ALT_HI", 13, 3003, 448, "Front Dash", "Radar Altimeter High Setting")
UH_1H:definePushButton("RADAR_ALT_TEST", 13, 3001, 446, "Front Dash", "Radar Altimeter Test")

UH_1H:defineIndicatorLight("X130_ARMED", 458, "Armament Panel", "X130 Armed Lamp (blue)")

UH_1H:defineFloat("SIGHTS_FOR_CIVIL", 473, { 0, 1 }, "Gauges", "SIGHTS_FOR_CIVIL / controllers.Civil_Heli")

--Doors
UH_1H:definePushButton("DOOR_L_PTR", 12, 3005, 419, "Doors", "Door Handle Left")
UH_1H:definePushButton("DOOR_R_PTR", 12, 3006, 421, "Doors", "Door Handle Right")

--Externals
UH_1H:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
UH_1H:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
UH_1H:defineBitFromDrawArgument("EXT_STROBE", 193, "External Aircraft Model", "Strobe Light (red)")
UH_1H:defineBitFromDrawArgument("EXT_WOW_SKID", 104, "External Aircraft Model", "Weight ON Skids")

-- Radar Altimeter Display, Chaff and Flare counters as numeric values
local function getRadarAltAsNumber(dev0)
	return Module.build_gauge_from_arguments(dev0, { 471, 470, 469, 468 })
end
UH_1H:defineIntegerFromGetter("RALT_DISPLAY", getRadarAltAsNumber, 65000, "Radar Altimeter", "Radar Altitude Display (Number)")

UH_1H:defineFloat("RALT_DIGIT_1", 468, { 0, 1 }, "Radar Altimeter", "Radar Altimeter 1.Digit")
UH_1H:defineFloat("RALT_DIGIT_2", 469, { 0, 1 }, "Radar Altimeter", "Radar Altimeter 2.Digit")
UH_1H:defineFloat("RALT_DIGIT_3", 470, { 0, 1 }, "Radar Altimeter", "Radar Altimeter 3.Digit")
UH_1H:defineFloat("RALT_DIGIT_4", 471, { 0, 1 }, "Radar Altimeter", "Radar Altimeter 4.Digit")

local function getFlareCountAsNumber(dev0)
	return Module.build_gauge_from_arguments(dev0, { 461, 460 })
end
UH_1H:defineIntegerFromGetter("CM_FLARECNT_DISPLAY", getFlareCountAsNumber, 60, "Countermeasures", "Flare Counter Display (Number)")

local function getChaffCountAsNumber(dev0)
	return Module.build_gauge_from_arguments(dev0, { 463, 462 })
end
UH_1H:defineIntegerFromGetter("CM_CHAFFCNT_DISPLAY", getChaffCountAsNumber, 60, "Countermeasures", "Chaff Counter Display (Number)")

UH_1H:definePotentiometer("THROTTLE2", 3, 3030, 250, { -1.0, 0.4 }, "Collective", "Copilot Throttle Axis")
UH_1H:defineToggleSwitch("THROTTLE_STOP2", 3, 3031, 213, "Collective", "Copilot Throttle Stop Switch, ON/OFF")
UH_1H:defineRockerSwitch("GOV_RPM_SW2", 3, 3029, 3029, 3029, 3029, 210, "Collective", "Copilot Governor RPM Rocker Switch")

UH_1H:defineToggleSwitch("LDG_LIGHT_SW2", 7, 3034, 209, "Collective", "Copilot Landing Lights Switch")
UH_1H:define3PosTumb("SEARCH_LIGHT_SW2", 7, 3035, 208, "Collective", "Copilot Search Light STOW / OFF / ON")
UH_1H:define3PosTumb("LDG_LT_CTRL2", 7, 3036, 212, "Collective", "Copilot Landing Lights Control Switch")

UH_1H:defineFloat("SBY_COMPASS_HDG", 272, { -1, 1 }, "Front Dash", "Standby Compass Heading")
UH_1H:defineFloat("SBY_COMPASS_PITCH", 274, { -1, 1 }, "Front Dash", "Standby Compass Pitch")
UH_1H:defineFloat("SBY_COMPASS_BANK", 273, { -1, 1 }, "Front Dash", "Standby Compass Bank")

UH_1H:definePushButton("CARGO_REL_P", 52, 3001, 195, "Cyclic", "Cargo Release Pilot")
UH_1H:definePushButton("CARGO_REL_CP", 52, 3002, 198, "Cyclic", "Cargo Release CoPilot")
UH_1H:defineToggleSwitch("CARGO_REL_SAFE", 52, 3003, 228, "Overhead Panel", "Cargo Safety OFF / ARM")

UH_1H:defineFloat("DOOR_POS_L", 420, { 0, 1 }, "Cockpit", "Door Position Left")
UH_1H:defineFloat("DOOR_POS_R", 422, { 0, 1 }, "Cockpit", "Door Position Right")

UH_1H:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR", 40, "External Aircraft Model", "Rotor Move")
UH_1H:defineBitFromDrawArgument("EXT_LAND_LIGHT_F", 208, "External Aircraft Model", "Landing Light Front (white)")
UH_1H:defineBitFromDrawArgument("EXT_LAND_LIGHT_M", 209, "External Aircraft Model", "Landing Light Mid (white)")
UH_1H:defineBitFromDrawArgument("EXT_LIGHT_TAIL", 192, "External Aircraft Model", "Tail Light (white)")

UH_1H:defineReadWriteRadio("VHF_ARC134", 20, 7, 3, 1000, "VHF ARC-134 Radio")
UH_1H:defineReadWriteRadio("UHF_ARC51", 22, 7, 3, 1000, "UHF ARC-51 Radio")
UH_1H:defineReadWriteRadio("VHF_ARC131", 23, 5, 2, 10000, "VHF ARC-131 Radio")

UH_1H:defineSeatPosition("SEAT", 4, "Player's current seat position (0 = Pilot, 1 = Copilot, 2 = Left Door, 3 = Right Door)")

return UH_1H
