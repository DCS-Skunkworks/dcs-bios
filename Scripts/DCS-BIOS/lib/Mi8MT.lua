BIOS.protocol.beginModule("Mi-8MT", 0x2600)
BIOS.protocol.setExportModuleAircrafts({"Mi-8MT"})

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

local start_command   = 3000
local cb_start_cmd = 3031
local cb_end_cmd = cb_start_cmd + 63
--###############################################Electrical system############################################

--defineTumb(msg, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
defineTumb("GEN1_SWITCH", 1, start_command + 15, 538, 1, {0, 1}, nil, false, "Electrical system", "Generator 1 Switch, ON/OFF")
defineTumb("GEN2_SWITCH", 1, start_command + 16, 539, 1, {0, 1}, nil, false, "Electrical system", "Generator 2 Switch, ON/OFF")

defineTumb("AC_GRND_PWR_SWITCH", 1, start_command + 14, 540, 1, {0, 1}, nil, false, "Electrical system", "AC Ground Power Switch, ON/OFF")
defineTumb("115V_INV_SWITCH", 1, start_command + 12, 541, 1, {-1, 1}, nil, false, "Electrical system", "115V Inverter Switch, MANUAL/OFF/AUTO")
defineTumb("36V_INV_SWITCH", 1, start_command + 13, 542, 1, {-1, 1}, nil, false, "Electrical system", "36V Inverter Switch, MANUAL/OFF/AUTO")
defineTumb("AC_VOLT_SEL", 1, start_command + 17, 535, 0.1, {0, 1.0}, nil, false, "Electrical system", "AC Voltmeter Selector")
defineTumb("DC_VOLT_SEL", 1, start_command + 8, 494, 0.1, {0, 0.7}, nil, false, "Electrical system", "DC Voltmeter Selector")
defineTumb("BATT1_SWITCH", 1, start_command + 3, 495, 1, {0, 1}, nil, false, "Electrical system", "Battery 1 Switch, ON/OFF")
defineTumb("BATT2_SWITCH", 1, start_command + 2, 496, 1, {0, 1}, nil, false, "Electrical system", "Battery 2 Switch, ON/OFF")
defineTumb("STBY_GEN_SWITCH", 1, start_command + 1, 497, 1, {0, 1}, nil, false, "Electrical system", "Standby Generator Switch, ON/OFF")
defineTumb("RECT1_SWITCH", 1, start_command + 7, 499, 1, {0, 1}, nil, false, "Electrical system", "Rectifier 1 Switch, ON/OFF")
defineTumb("RECT2_SWITCH", 1, start_command + 5, 500, 1, {0, 1}, nil, false, "Electrical system", "Rectifier 2 Switch, ON/OFF")
defineTumb("RECT3_SWITCH", 1, start_command + 6, 501, 1, {0, 1}, nil, false, "Electrical system", "Rectifier 3 Switch, ON/OFF")
defineTumb("DC_GRND_PWR_SWITCH", 1, start_command + 4, 502, 1, {0, 1}, nil, false, "Electrical system", "DC Ground Power Switch, ON/OFF")
defineTumb("EQ_TST_SWITCH", 1, start_command + 9, 503, 1, {0, 1}, nil, false, "Electrical system", "Equipment Test Switch, ON/OFF")
defineTumb("NET_RECT_COVER", 1, start_command + 21, 147, 1, {0, 1}, nil, false, "Electrical system", "Net on Rectifier Switch Cover, OPEN/CLOSE")
defineTumb("NET_RECT_SWITCH", 1, start_command + 19, 148, 1, {0, 1}, nil, false, "Electrical system", "Net on Rectifier Switch, ON/OFF")
defineTumb("36V_TRANS_SWITCH", 1, start_command + 20, 149, 1, {-1, 1}, nil, false, "Electrical system", "36V Transformer Switch, MAIN/OFF/AUXILIARY")
definePotentiometer("STB_GEN_RHEO", 1, start_command + 10, 498, {0, 1}, "Electrical system", "Standby Generator Voltage Adjustment Rheostat")
definePotentiometer("GEN1_RHEO", 1, start_command + 11, 536, {0, 1}, "Electrical system", "Generator 1 Voltage Adjustment Rheostat")
definePotentiometer("GEN2_RHEO", 1, start_command + 18, 537, {0, 1}, "Electrical system", "Generator 2 Voltage Adjustment Rheostat")

--NOT WORKING!?
--defineTumb("BATT_HEAT_SWITCH", 1, cb_start_cmd + 75, 522, 1, {0, 1}, nil, false, "Electrical system", "Battery Heating Switch, ON/OFF")
--default_2_position_tumb(_("Battery Heating Switch, ON/OFF"), devices.ELEC_INTERFACE, cb_start_cmd + 75, 522)

--###############################################AZS Left Panel Line 1############################################

defineTumb("CB_BW_ESBR", 1, cb_start_cmd, 590, 1, {0, 1}, nil, false, "AZS Left Panel Line 1", "CB BW ESBR, ON/OFF")
defineTumb("CB_EXPLODE", 1, cb_start_cmd + 1, 591, 1, {0, 1}, nil, false, "AZS Left Panel Line 1", "CB Explode, ON/OFF")
defineTumb("CB_CTRL", 1, cb_start_cmd + 2, 592, 1, {0, 1}, nil, false, "AZS Left Panel Line 1", "CB Control, ON/OFF_mi8")
defineTumb("CB_EQUIP", 1, cb_start_cmd + 3, 593, 1, {0, 1}, nil, false, "AZS Left Panel Line 1", "CB Equipment, ON/OFF")
defineTumb("CB_RS_GUV_FIRE", 1, cb_start_cmd + 4, 594, 1, {0, 1}, nil, false, "AZS Left Panel Line 1", "CB RS/GUV Fire, ON/OFF")
defineTumb("CB_RS_GUV_WARN", 1, cb_start_cmd + 5, 595, 1, {0, 1}, nil, false, "AZS Left Panel Line 1", "CB RS/GUV Warning, ON/OFF")
defineTumb("CB_ESBR_HEAT", 1, cb_start_cmd + 6, 596, 1, {0, 1}, nil, false, "AZS Left Panel Line 1", "CB ESBR Heating, ON/OFF")

--################################################AZS Left Panel Line 2###########################################

defineTumb("CB_311", 1, cb_start_cmd + 7, 597, 1, {0, 1}, nil, false, "AZS Left Panel Line 2", "CB 311, ON/OFF")
defineTumb("CB_GUV_OUTER_LEFT", 1, cb_start_cmd + 8, 598, 1, {0, 1}, nil, false, "AZS Left Panel Line 2", "CB GUV: Outer 800 Left, ON/OFF")
defineTumb("CB_GUV_OUTER_RIGHT", 1, cb_start_cmd + 9, 599, 1, {0, 1}, nil, false, "AZS Left Panel Line 2", "CB GUV: Outer 800 Right, ON/OFF")
defineTumb("CB_GUV_622_LEFT_INNER_LEFT", 1, cb_start_cmd + 10, 600, 1, {0, 1}, nil, false, "AZS Left Panel Line 2", "CB GUV: Inner Left 622 Left, ON/OFF")
defineTumb("CB_GUV_622_LEFT_INNER_RIGHT", 1, cb_start_cmd + 11, 601, 1, {0, 1}, nil, false, "AZS Left Panel Line 2", "CB GUV: Inner Left 622 Right, ON/OFF")
defineTumb("CB_GUV_622_RIGHT_INNER_LEFT", 1, cb_start_cmd + 12, 602, 1, {0, 1}, nil, false, "AZS Left Panel Line 2", "CB GUV: Inner Right 622 Left, ON/OFF")
defineTumb("CB_GUV_622_RIGHT_INNER_RIGHT", 1, cb_start_cmd + 13, 603, 1, {0, 1}, nil, false, "AZS Left Panel Line 2", "CB GUV: Inner Right 622 Right, ON/OFF")

--################################################AZS Left Panel Line 3###########################################

defineTumb("CB_ELEC_LAUNCH_LEFT", 1, cb_start_cmd + 14, 604, 1, {0, 1}, nil, false, "AZS Left Panel Line 3", "CB Electric Launch 800 Left, ON/OFF")
defineTumb("CB_ELEC_LAUNCH_RIGHT", 1, cb_start_cmd + 15, 605, 1, {0, 1}, nil, false, "AZS Left Panel Line 3", "CB Electric Launch 800 Right, ON/OFF")
defineTumb("CB_PKT", 1, cb_start_cmd + 16, 606, 1, {0, 1}, nil, false, "AZS Left Panel Line 3", "CB PKT, ON/OFF")
defineTumb("CB_JET_BOMB_GUV", 1, cb_start_cmd + 17, 607, 1, {0, 1}, nil, false, "AZS Left Panel Line 3", "CB Emergency Jettison: Bombs and GUV, ON/OFF")
defineTumb("CB_JET_PWR", 1, cb_start_cmd + 18, 608, 1, {0, 1}, nil, false, "AZS Left Panel Line 3", "CB Emergency Jettison: Power, ON/OFF")
defineTumb("CB_JET_ARM", 1, cb_start_cmd + 19, 609, 1, {0, 1}, nil, false, "AZS Left Panel Line 3", "CB Emergency Jettison: Armed, ON/OFF")
defineTumb("CB_SIG_FLARE", 1, cb_start_cmd + 20, 610, 1, {0, 1}, nil, false, "AZS Left Panel Line 3", "CB Signal Flare, ON/OFF")

--################################################AZS Right Panel Left Line 1###########################################

defineTumb("CB_APU_START", 1, cb_start_cmd + 21, 611, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB APU Start, ON/OFF")
defineTumb("CB_APU_IGN", 1, cb_start_cmd + 22, 612, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB APU Ignition, ON/OFF")
defineTumb("CB_ENG_START", 1, cb_start_cmd + 23, 613, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB Engine Start, ON/OFF")
defineTumb("CB_ENG_IGN", 1, cb_start_cmd + 24, 614, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB Engine Ignition, ON/OFF")
defineTumb("CB_RPM", 1, cb_start_cmd + 25, 615, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB RPM CONTROL, ON/OFF")
defineTumb("CB_NONAME", 1, cb_start_cmd + 26, 616, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB NONAME, ON/OFF")
defineTumb("CB_CTRL_MAIN", 1, cb_start_cmd + 27, 617, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB Lock Opening Control Main, ON/OFF")
defineTumb("CB_CTRL_RES", 1, cb_start_cmd + 28, 618, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB Lock Opening Control Reserve, ON/OFF")
defineTumb("CB_TURN", 1, cb_start_cmd + 29, 619, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 1", "CB TURN INDICATOR, ON/OFF")

--################################################AZS Right Panel Left Line 2###########################################

defineTumb("CB_FUEL_BYPASS", 1, cb_start_cmd + 39, 629, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB Fuel System: Bypass Valve, ON/OFF")
defineTumb("CB_FUEL_LEFT_VALVE", 1, cb_start_cmd + 40, 630, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB Fuel System: Left Valve, ON/OFF")
defineTumb("CB_FUEL_RIGHT_VALVE", 1, cb_start_cmd + 41, 631, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB Fuel System: Right Valve, ON/OFF")
defineTumb("CB_FUEL_METER", 1, cb_start_cmd + 42, 632, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB Fuel System: Fuelmeter, ON/OFF")
defineTumb("CB_FUEL_CENTER_PUMP", 1, cb_start_cmd + 43, 633, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB Fuel System: Center Tank Pump, ON/OFF")
defineTumb("CB_FUEL_LEFT_PUMP", 1, cb_start_cmd + 44, 634, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB Fuel System: Left Tank Pump, ON/OFF")
defineTumb("CB_FUEL_RIGHT_PUMP", 1, cb_start_cmd + 45, 635, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB Fuel System: Right Tank Pump, ON/OFF")
defineTumb("CB_T819", 1, cb_start_cmd + 46, 636, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB T-819, ON/OFF")
defineTumb("CB_SPUU52", 1, cb_start_cmd + 47, 637, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 2", "CB SPUU-52, ON/OFF")

--################################################AZS Right Panel Left Line 3###########################################

defineTumb("CB_LIGHTS_LEFT_CTRL", 1, cb_start_cmd + 57, 647, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB Headlights: Left: Control, ON/OFF")
defineTumb("CB_LIGHTS_LEFT_LIGHT", 1, cb_start_cmd + 58, 648, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB Headlights: Left: Light, ON/OFF")
defineTumb("CB_LIGHTS_RIGHT_CTRL", 1, cb_start_cmd + 59, 649, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB Headlights: Right: Control, ON/OFF")
defineTumb("CB_LIGHTS_RIGHT_LIGHT", 1, cb_start_cmd + 60, 650, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB Headlights: Right: Light, ON/OFF")
defineTumb("CB_ANO", 1, cb_start_cmd + 61, 651, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB ANO, ON/OFF")

defineTumb("CB_WING_LIGHTS", 1, cb_start_cmd + 62, 652, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB Wing Lights, ON/OFF")
defineTumb("CB_CHECK_LAMP", 1, cb_start_cmd + 63, 653, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB Check Lamps/Flasher, ON/OFF")
defineTumb("CB_PRF4_LEFT", 1, cb_start_cmd + 64, 918, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB PRF-4 Light Left, ON/OFF")
defineTumb("CB_PRF4_RIGHT", 1, cb_start_cmd + 65, 919, 1, {0, 1}, nil, false, "AZS Right Panel Left Line 3", "CB PRF-4 Light Right, ON/OFF")

--################################################AZS Right Panel Right Line 1###########################################

defineTumb("CB_AUTO_PILOT_MAIN", 1, cb_start_cmd + 30, 620, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Autopilot: Main, ON/OFF")
defineTumb("CB_AUTO_PILOT_FRICTION", 1, cb_start_cmd + 31, 621, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Autopilot: Friction, ON/OFF")
defineTumb("CB_AUTO_PILOT_CLUTCH", 1, cb_start_cmd + 32, 622, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Autopilot: Electric Clutches, ON/OFF")
defineTumb("CB_HYDR_MAIN", 1, cb_start_cmd + 33, 623, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Hydraulics: Main, ON/OFF")
defineTumb("CB_HYDR_AUX", 1, cb_start_cmd + 34, 624, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Hydraulics: Auxiliary, ON/OFF")
defineTumb("CB_SPU", 1, cb_start_cmd + 35, 625, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Radio: SPU (Intercom), ON/OFF")
defineTumb("CB_ALTIMETER", 1, cb_start_cmd + 36, 626, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Radio: Altimeter, ON/OFF")
defineTumb("CB_R863", 1, cb_start_cmd + 37, 627, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Radio: Command Radio Station (R-863), ON/OFF")
defineTumb("CB_6201", 1, cb_start_cmd + 38, 628, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 1", "CB Radio: 6201, ON/OFF")

--################################################AZS Right Panel Right Line 2###########################################

defineTumb("CB_FIRE_SIG", 1, cb_start_cmd + 48, 638, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Fire Protection System: Signalization, ON/OFF")
defineTumb("CB_FIRE_1_LEFT", 1, cb_start_cmd + 49, 639, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Fire Protection System: 1 Queue Left, ON/OFF")
defineTumb("CB_FIRE_1_RIGHT", 1, cb_start_cmd + 50, 640, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Fire Protection System: 1 Queue Right, ON/OFF")
defineTumb("CB_FIRE_2_LEFT", 1, cb_start_cmd + 51, 641, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Fire Protection System: 2 Queue Left, ON/OFF")
defineTumb("CB_FIRE_2_RIGHT", 1, cb_start_cmd + 52, 642, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Fire Protection System: 2 Queue Right, ON/OFF")
defineTumb("CB_ARC9", 1, cb_start_cmd + 53, 643, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Radio: Radio Compass MW(ARC-9), ON/OFF")
defineTumb("CB_ARCUD", 1, cb_start_cmd + 54, 644, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Radio: Radio Compass VHF(ARC-UD), ON/OFF")
defineTumb("CB_DOPPLER", 1, cb_start_cmd + 55, 645, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Radio: Doppler Navigator, ON/OFF")
defineTumb("CB_RADIO_METER", 1, cb_start_cmd + 56, 646, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 2", "CB Radio: Radio Meter, ON/OFF")


--################################################AZS Right Panel Right Line 3###########################################

defineTumb("CB_DFRST_CTRL", 1, cb_start_cmd + 66, 656, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB Defrost System: Control, ON/OFF")
defineTumb("CB_DFRST_LEFT", 1, cb_start_cmd + 67, 657, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB Defrost System: Left Engine, ON/OFF")
defineTumb("CB_DFRST_RIGHT", 1, cb_start_cmd + 68, 658, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB Defrost System: Right Engine, ON/OFF")
defineTumb("CB_DFRST_RIO3", 1, cb_start_cmd + 69, 659, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB Defrost System: RIO-3, ON/OFF")
defineTumb("CB_DFRST_GLASS", 1, cb_start_cmd + 70, 660, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB Defrost System: Glass, ON/OFF")
defineTumb("CB_WPR_LEFT", 1, cb_start_cmd + 71, 661, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB Wiper Left, ON/OFF")
defineTumb("CB_WPR_RIGHT", 1, cb_start_cmd + 72, 662, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB Wiper Right, ON/OFF")
defineTumb("CB_RIO3", 1, cb_start_cmd + 73, 663, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB RIO-3, ON/OFF")
defineTumb("CB_KO50", 1, cb_start_cmd + 74, 664, 1, {0, 1}, nil, false, "AZS Right Panel Right Line 3", "CB Heater KO-50, ON/OFF")

--################################################AZS PANEL GROUP BUTTONS###########################################

defineToggleSwitch("AZS_GRP_BTN1", 1, start_command + 22, 882, "AZS Panel Group Buttons", "Group 1 On")
defineToggleSwitch("AZS_GRP_BTN2", 1, start_command + 25, 883, "AZS Panel Group Buttons", "Group 2 On")
defineToggleSwitch("AZS_GRP_BTN3", 1, start_command + 28, 884, "AZS Panel Group Buttons", "Group 3 On")
defineToggleSwitch("AZS_GRP_BTN4", 1, start_command + 23, 885, "AZS Panel Group Buttons", "Group 4 On")
defineToggleSwitch("AZS_GRP_BTN5", 1, start_command + 26, 886, "AZS Panel Group Buttons", "Group 5 On")
defineToggleSwitch("AZS_GRP_BTN6", 1, start_command + 29, 887, "AZS Panel Group Buttons", "Group 6 On")
defineToggleSwitch("AZS_GRP_BTN7", 1, start_command + 24, 888, "AZS Panel Group Buttons", "Group 7 On")
defineToggleSwitch("AZS_GRP_BTN8", 1, start_command + 27, 889, "AZS Panel Group Buttons", "Group 8 On")
defineToggleSwitch("AZS_GRP_BTN9", 1, start_command + 30, 890, "AZS Panel Group Buttons", "Group 9 On")

--################################################FUEL SYSTEM###########################################

defineTumb("FUEL_FEED_PUMP", 2, start_command + 6, 438, 1, {0, 1}, nil, false, "Fuel System", "Feed Tank Pump Switch, ON/OFF")
defineTumb("FUEL_LEFT_PUMP", 2, start_command + 3, 439, 1, {0, 1}, nil, false, "Fuel System", "Left Tank Pump Switch, ON/OFF")
defineTumb("FUEL_RIGTH_PUMP", 2, start_command + 5, 440, 1, {0, 1}, nil, false, "Fuel System", "Right Tank Pump Switch, ON/OFF")
defineTumb("FUEL_LEFT_SHUTOFF", 2, start_command + 1, 427, 1, {0, 1}, nil, false, "Fuel System", "Left Shutoff Valve Switch, ON/OFF")
defineTumb("FUEL_RIGTH_SHUTOFF", 2, start_command + 2, 429, 1, {0, 1}, nil, false, "Fuel System", "Right Shutoff Valve Switch, ON/OFF")
defineTumb("FUEL_LEFT_COVER", 2, start_command + 9, 426, 1, {0, 1}, nil, false, "Fuel System", "Left Shutoff Valve Switch Cover, OPEN/CLOSE")
defineTumb("FUEL_RIGHT_COVER", 2, start_command + 10, 428, 1, {0, 1}, nil, false, "Fuel System", "Right Shutoff Valve Switch Cover, OPEN/CLOSE")
defineTumb("FUEL_CROSSFEED", 2, start_command + 4, 431, 1, {0, 1}, nil, false, "Fuel System", "Crossfeed Switch, ON/OFF")
defineTumb("FUEL_CROSSFEED_COVER", 2, start_command + 11, 430, 1, {0, 1}, nil, false, "Fuel System", "Crossfeed Switch Cover, OPEN/CLOSE")
defineTumb("FUEL_BYPASS", 2, start_command + 7, 433, 1, {0, 1}, nil, false, "Fuel System", "Bypass Switch, ON/OFF")
defineTumb("FUEL_BYPASS_COVER", 2, start_command + 12, 432, 1, {0, 1}, nil, false, "Fuel System", "Bypass Switch Cover, OPEN/CLOSE")
defineTumb("FUEL_REFUEL", 2, start_command + 14, 437, 0.5, {0, 1}, nil, false, "Fuel System", "Refueling Control Switch, REFUEL/OFF/CHECK")

--################################################Engine start panel - APU Launch Panel###########################################

defineTumb("APU_START_MODE", 3, start_command + 12, 412, 1, {-1, 1}, nil, false, "APU Launch Panel", "APU Start Mode Switch, START/COLD CRANKING/FALSE START")
defineTumb("APU_START", 3, start_command + 26, 413, 1, {0, 1}, nil, false, "APU Launch Panel", "APU Start Button - Push to start APU")
defineTumb("APU_STOP", 3, start_command + 7, 415, 1, {0, 1}, nil, false, "APU Launch Panel", "APU Stop Button - Push to stop APU")

--################################################Engine start panel - Engines Launch Panel###########################################

defineTumb("ENG_START", 3, start_command + 5, 419, 1, {0, 1}, nil, false, "Engines Launch Panel", "Engine Start Button - Push to start engine")
defineTumb("ENG_ABORT_START", 3, start_command + 6, 421, 1, {0, 1}, nil, false, "Engines Launch Panel", "Abort Start Engine Button - Push to abort start")
defineTumb("ENG_SEL", 3, start_command + 8, 422, 1, {-1, 1}, nil, false, "Engines Launch Panel", "Engine Selector Switch, LEFT/OFF/RIGHT")
defineTumb("ENG_START_MODE", 3, start_command + 27, 423, 1, {-1, 1}, nil, false, "Engines Launch Panel", "Engine Start Mode Switch, START/OFF/COLD CRANKING")
defineTumb("ENG_IGN_CHK", 3, start_command + 74, 425, 1, {-1, 1}, nil, false, "Engines Launch Panel", "Engine Ignition Check Switch, LEFT/OFF/RIGHT")

--################################################Engine management###########################################

defineTumb("ENG_LEFT_STOP", 3, start_command + 9, 204, 1, {0, 1}, nil, false, "Engines management", "Left Engine Stop Lever")
defineTumb("ENG_RIGHT_STOP", 3, start_command + 10, 206, 1, {0, 1}, nil, false, "Engines management", "Right Engine Stop Lever")
defineTumb("ENG_RTR_BRAKE", 3, start_command + 11, 208, 1, {0, 1}, nil, false, "Engines management", "Rotor Brake Handle, UP/DOWN")
defineTumb("ENG_VBR_SENS_TEST", 3, start_command + 21, 310, 1, {0, 1}, nil, false, "Engines management", "Vibration Sensor Test Button - Push to test")
defineTumb("ENG_COLD_TMP_SENS_TEST", 3, start_command + 23, 311, 1, {0, 1}, nil, false, "Engines management", "Cold Temperature Sensor Test Button - Push to test")
defineTumb("ENG_HOT_TMP_SENS_TEST", 3, start_command + 22, 312, 1, {0, 1}, nil, false, "Engines management", "Hot Temperature Sensor Test Button - Push to test")
defineTumb("ENG_LEFT_REG_TEMP_TEST", 3, start_command + 19, 313, 1, {0, 1}, nil, false, "Engines management", "Left Engine Temperature Regulator Test Button - Push to test")
defineTumb("ENG_RIGHT_REG_TEMP_TEST", 3, start_command + 20, 314, 1, {0, 1}, nil, false, "Engines management", "Right Engine Temperature Regulator Test Button - Push to test")
defineTumb("ENG_LEFT_FREE_TURB_RPM", 3, start_command + 63, 202, 1, {-1, 1}, nil, false, "Engines management", "Readjust Left Free Turbine RPM Switch, MORE/OFF/LESS")
defineTumb("ENG_RIGHT_FREE_TURB_RPM", 3, start_command + 64, 867, 1, {-1, 1}, nil, false, "Engines management", "Readjust Right Free Turbine RPM Switch, MORE/OFF/LESS")

--TODO NOT IMPLEMENTED
--ENG_LEFT_THROTTLE
--ENG_RIGHT_THROTTLE

--################################################Center Console###########################################

defineTumb("ENG_LEFT_ECC", 3, start_command + 1, 167, 1, {0, 1}, nil, false, "Center Console", "Left Engine EEC Switch, ON/OFF")
defineTumb("ENG_RIGHT_ECC", 3, start_command + 3, 173, 1, {0, 1}, nil, false, "Center Console", "Right Engine EEC Switch, ON/OFF")
defineTumb("ENG_LEFT_ER", 3, start_command + 52, 168, 1, {0, 1}, nil, false, "Center Console", "Left Engine ER Switch, ON/OFF")
defineTumb("ENG_RIGHT_ER", 3, start_command + 53, 172, 1, {0, 1}, nil, false, "Center Console", "Right Engine ER Switch, ON/OFF")
defineTumb("ENG_LEFT_FT_CHECK", 3, start_command + 50, 169, 1, {-1, 1}, nil, false, "Center Console", "Left Engine FT Check Switch, ST1/WORK/ST2")
defineTumb("ENG_RIGHT_FT_CHECK", 3, start_command + 51, 171, 1, {-1, 1}, nil, false, "Center Console", "Right Engine FT Check Switch, ST1/WORK/ST2")
defineTumb("ENG_CT_CHECK", 3, start_command + 54, 170, 1, {-1, 1}, nil, false, "Center Console", "CT Check Switch, RIGHT/WORK/LEFT")

--################################################Hydraulic system###########################################

defineTumb("HYDR_MAIN_SWITCH", 4, start_command + 1, 406, 1, {0, 1}, nil, false, "Hydraulic system", "Main Hydraulic Switch, ON/OFF")
defineTumb("HYDR_AUX_SWITCH", 4, start_command + 2, 410, 1, {0, 1}, nil, false, "Hydraulic system", "Auxiliary Hydraulic Switch, ON/OFF")
defineTumb("HYDR_AUX_COVER", 4, start_command + 6, 409, 1, {0, 1}, nil, false, "Hydraulic system", "Auxiliary Hydraulic Switch Cover, OPEN/CLOSE")
defineTumb("HYDR_AUX_OFF", 4, start_command + 3, 411, 1, {0, 1}, nil, false, "Hydraulic system", "Auxiliary Hydraulic Shut Off Button - Push to shut off")

--################################################Autopilot###########################################

definePushButton("AUTOPILOT_HDG_ON", 16, start_command + 3, 134, "Autopilot", "Autopilot Heading ON Button")
definePotentiometer("AUTOPILOT_HDG_ON_LMP", 16, start_command + 19, 868, {0.0, 1.0}, "Autopilot", "Autopilot Heading ON Lamp Dimmer")

definePushButton("AUTOPILOT_HDG_OFF", 16, start_command + 5, 135, "Autopilot", "Autopilot Heading OFF Button")
definePotentiometer("AUTOPILOT_HDG_OFF_LMP", 16, start_command + 20, 869, {0.0, 1.0}, "Autopilot", "Autopilot Heading OFF Lamp Dimmer")
definePushButton("AUTOPILOT_PITCH_ROLL_ON", 16, start_command + 2, 138, "Autopilot", "Autopilot Pitch / Roll ON Button")
definePotentiometer("AUTOPILOT_PITCH_ROLL_ON_LMP", 16, start_command + 21, 870, {0.0, 1.0}, "Autopilot", "Autopilot Pitch / Roll ON Lamp Dimmer")
definePushButton("AUTOPILOT_ALT_ON", 16, start_command + 1, 144, "Autopilot", "Autopilot Altitude ON Button")
definePotentiometer("AUTOPILOT_ALT_ON_LMP", 16, start_command + 22, 871, {0.0, 1.0}, "Autopilot", "Autopilot Altitude ON Lamp Dimmer")
definePushButton("AUTOPILOT_ALT_OFF", 16, start_command + 4, 145, "Autopilot", "Autopilot Altitude OFF Button")
definePotentiometer("AUTOPILOT_ALT_OFF_LMP", 16, start_command + 23, 872, {0.0, 1.0}, "Autopilot", "Autopilot Altitude OFF Lamp Dimmer")
defineTumb("AUTOPILOT_ALT_CHNL", 16, start_command + 7, 146, 1, {-1, 1}, nil, false, "Autopilot", "Autopilot Altitude Channel Control")
defineRotary("AUTOPILOT_HDG_ADJ", 16, start_command + 9, 136, "Autopilot", "Autopilot Heading Adjustment Knob")
defineRotary("AUTOPILOT_ROLL_ADJ", 16, start_command + 8, 140, "Autopilot", "Autopilot Roll Adjustment Knob")
defineRotary("AUTOPILOT_PITCH_ADJ", 16, start_command + 10, 142, "Autopilot", "Autopilot Pitch Adjustment Knob")
defineTumb("AUTOPILOT_OFF_LEFT", 16, start_command + 29, 183, 1, {0, 1}, nil, false, "Autopilot", "Autopilot Off Left Button")
defineTumb("AUTOPILOT_OFF_LEFT", 16, start_command + 29, 183, 1, {0, 1}, nil, false, "Autopilot", "Autopilot Off Left Button")
defineTumb("AUTOPILOT_OFF_RIGHT", 16, start_command + 30, 226, 1, {0, 1}, nil, false, "Autopilot", "Autopilot Off Right Button")

--NOT WORKING PROPERLY TRIMS LEFT ONLY
defineTumb("AUTOPILOT_TRM_LEFT", 16, start_command + 31, 184, 1, {-1, 1}, nil, false, "Autopilot", "Trimmer Left Button")

--NOT WORKING PROPERLY TRIMS LEFT ONLY
defineTumb("AUTOPILOT_TRM_RIGHT", 16, start_command + 32, 227, 1, {-1, 1}, nil, false, "Autopilot", "Trimmer Right Button")

--################################################Radar altimeter###########################################
defineTumb("RADAR_ALT_TEST", 18, start_command + 2, 32, 1, {0, 1}, nil, false, "Radar altimeter", "Radio Altimeter Test Button - Push to test")
defineRotary("RADAR_ALT_DANGER_ALT", 18, start_command + 1, 29, "Autopilot", "Dangerous RALT Knob")

defineTumb("RADAR_ALT_PWR", 18, start_command + 3, 35, 1, {0, 1}, nil, false, "Radar altimeter", "Radar Altimeter Power Switch, ON/OFF")

--###########################################################################################

defineTumb("EMG_BOMB_RLS",12, start_command + 32, 709, 1, {0,1}, nil, false, "Weapons", "Emergency Bomb Release Switch, ON/OFF")
defineTumb("EMG_BOMB_RLS_CVR",12, start_command + 50, 708, 1, {0,1}, nil, false, "Weapons", "Emergency Bomb Release Switch Cover, OPEN/CLOSE")

--################################################WEAPONS ###########################################
defineTumb("WPN_ARM",12, start_command + 27, 921, 1, {0,1}, nil, false, "Weapons", "Weapon Safe/Armed Switch, ON/OFF")
defineTumb("WPN_EMGR_EXPLODE",12, start_command + 7, 707, 1, {0,1}, nil, false, "Weapons", "Emergency Explode Switch, ON/OFF")
defineTumb("WPN_EMGR_EXPLODE_COVER",12, start_command + 49, 706, 1, {0,1}, nil, false, "Weapons", "Emergency Explode Switch Cover, OPEN/CLOSE")
defineTumb("WPN_EMGR_BMB_RLS",12, start_command + 32, 709, 1, {0,1}, nil, false, "Weapons", "Emergency Bomb Release Switch, ON/OFF")
defineTumb("WPN_EMGR_BMB_RLS_COVER",12, start_command + 50, 708, 1, {0,1}, nil, false, "Weapons", "Emergency Bomb Release Switch Cover, OPEN/CLOSE")
defineTumb("WPN_BOMBS_SWITCH",12, start_command + 2, 717, 1, {0,1}, nil, false, "Weapons", "Main Bombs Switch, ON/OFF")
defineTumb("WPN_BOMBS_CHECK",12, start_command + 14, 718, 1, {0,1}, nil, false, "Weapons", "Lamps Check Button - Push to check")
defineTumb("WPN_ESBR_HEAT",12, start_command + 12, 720, 1, {0,1}, nil, false, "Weapons", "ESBR Heating Switch, ON/OFF")
defineTumb("WPN_ESBR_SWITCH",12, start_command + 28, 731, 1, {0,1}, nil, false, "Weapons", "ESBR Switch, ON/OFF")
defineTumb("WPN_EMG_EXPLODE",12, start_command + 4, 570, 1, {0,1}, nil, false, "Weapons", "Emergency Explode Switch, ON/OFF")
defineTumb("WPN_EMG_RLS",12, start_command + 5, 572, 1, {0,1}, nil, false, "Weapons", "Emergency Release Switch")
defineTumb("WPN_EMG_EXPLODE_COVER",12, start_command + 51, 569, 1, {0,1}, nil, false, "Weapons", "Emergency Explode Switch Cover, OPEN/CLOSE")
defineTumb("WPN_EMG_RLS_COVER",12, start_command + 52, 571, 1, {0,1}, nil, false, "Weapons", "Emergency Release Switch Cover, OPEN/CLOSE")
defineTumb("WPN_RS_GUV_SEL",12, start_command + 30, 575, 1, {0,1}, nil, false, "Weapons", "RS/GUV Selector Switch, ON/OFF")
defineTumb("WPN_LAMPS_CHK",12, start_command + 26, 576, 1, {0,1}, nil, false, "Weapons", "Lamps Check Button - Push to check")
defineTumb("WPN_PUS_ARM",12, start_command + 31, 574, 1, {0,1}, nil, false, "Weapons", "PUS Arming Button - Push to arm")
defineTumb("WPN_AMOUNT1",12, start_command + 20, 342, 1, {-1,1}, nil, false, "Weapons", "8/16/4 Switch")
defineTumb("WPN_AMOUNT2",12, start_command + 21, 343, 1, {-1,1}, nil, false, "Weapons", "1-2-5-6/AUTO/3-4 Switch")
defineTumb("WPN_SEL",12, start_command + 22, 344, 1, {-1,1}, nil, false, "Weapons", "UPK/PKT/RS Switch")
defineTumb("WPN_CUTOFF",12, start_command + 6, 345, 1, {-1,1}, nil, false, "Weapons", "CUTOFF Switch, ON/OFF")
defineTumb("WPN_SEL2",12, start_command + 41, 349, 1, {0,1}, nil, false, "Weapons", "800_or_624_622_800 Switch")
defineTumb("WPN_SEL2_COVER",12, start_command + 53, 348, 1, {0,1}, nil, false, "Weapons", "800 or 624_622_800 Switch Cover, OPEN/CLOSE")
defineTumb("WPN_MINE_ARM",12, start_command + 76, 573, 1, {0,1}, nil, false, "Weapons", "Mine Arms Main Switch, ON/OFF")
defineTumb("WPN_PKT_SEL",12, start_command + 77, 905, 1, {0,1}, nil, false, "Weapons", "PKT Selector Switch, FLIGHT ENGINEER/PILOT")
defineTumb("WPN_LEFT_RS_COVER",12, start_command + 84, 185, 1, {0,1}, nil, false, "Weapons", "Left Fire RS Button Cover, OPEN/CLOSE")
defineTumb("WPN_RIGHT_RS_COVER",12, start_command + 85, 228, 1, {0,1}, nil, false, "Weapons", "Right Fire RS Button Cover, OPEN/CLOSE")
defineTumb("WPN_LEFT_RS_FIRE",12, start_command + 82, 186, 1, {0,1}, nil, false, "Weapons", "Left Fire RS Button")
defineTumb("WPN_RIGHT_RS_FIRE",12, start_command + 83, 229, 1, {0,1}, nil, false, "Weapons", "Right Fire RS Button")
defineTumb("WPN_GUN_CAM",12, start_command + 98, 352, 1, {0,1}, nil, false, "Weapons", "Gun Camera Switch, ON/OFF")

--################################################ ###########################################
defineTumb("SAS_FLASH",21, start_command + 5, 523, 1, {0,1}, nil, false, "SAS", "Flasher Switch, ON/OFF")
defineTumb("SAS_TRANS",21, start_command + 6, 525, 1, {0,1}, nil, false, "SAS", "Transparent Switch, DAY/NIGHT")
defineTumb("SAS_CHK",21, start_command + 7, 150, 1, {-1,1}, nil, false, "SAS", "Check Switch, LAMPS/OFF/FLASHER")

--################################################ ###########################################
defineTumb("SPUU52_PWR",8, start_command + 5, 332, 1, {0,1}, nil, false, "SPUU-52", "SPUU-52 Power Switch, ON/OFF")
defineTumb("SPUU52_ENGAGE",8, start_command + 1, 127, 1, {0,1}, nil, false, "SPUU-52", "SPUU-52 Control Engage Button")

--################################################ ###########################################
defineTumb("DCHARGE_LEFT_ENG",19, start_command + 1, 389, 1, {0,1}, nil, false, "Something", "Main Discharge Left Engine Button")
defineTumb("DCHARGE_RIGHT_ENG",19, start_command + 2, 390, 1, {0,1}, nil, false, "Something", "Main Discharge Right Engine Button")
defineTumb("DCHARGE_KO50",19, start_command + 3, 391, 1, {0,1}, nil, false, "Something", "Main Discharge KO-50 Button")
defineTumb("DCHARGE_APU",19, start_command + 4, 392, 1, {0,1}, nil, false, "Something", "Main Discharge APU GEAR Button")
defineTumb("DCHARGE_ALT_LEFT_ENG",19, start_command + 5, 393, 1, {0,1}, nil, false, "Something", "Alternate Discharge Left Engine Button")
defineTumb("DCHARGE_ALT_RIGHT_ENG",19, start_command + 6, 394, 1, {0,1}, nil, false, "Something", "Alternate Discharge Right Engine Button")
defineTumb("DCHARGE_ALT_KO50",19, start_command + 7, 395, 1, {0,1}, nil, false, "Something", "Alternate Discharge KO-50 Button")
defineTumb("DCHARGE_ALT_APU",19, start_command + 8, 396, 1, {0,1}, nil, false, "Something", "Alternate Discharge APU GEAR Button")
defineTumb("DCHARGE_FIRE_BTN",19, start_command + 9, 397, 1, {0,1}, nil, false, "Something", "Turn Off Fire Signal Button")
defineTumb("DCHARGE_FIRE_DETECT_TEST",19, start_command + 10, 399, 1, {0,1}, nil, false, "Something", "Fire Detector Test Switch")
defineTumb("DCHARGE_SQUIB_TEST",19, start_command + 11, 400, 1, {0,1}, nil, false, "Something", "Squib Test Switch")

--################################################ ###########################################
defineTumb("DEFROST_MODE",3, start_command + 30, 353, 1, {0,1}, nil, false, "Heating", "Defrost Mode Switch, AUTO/MANUAL")
defineTumb("DEFROST_OFF",3, start_command + 31, 354, 1, {0,1}, nil, false, "Heating", "Defrost OFF Button - Push to turn off")
defineTumb("DEFROST_LEFT_ENG_HEAT",3, start_command + 32, 355, 1, {0,1}, nil, false, "Heating", "Left Engine Heater Switch, ON/OFF")
defineTumb("DEFROST_RIGHT_ENG_HEAT",3, start_command + 33, 356, 1, {0,1}, nil, false, "Heating", "Right Engine Heater Switch, MANUAL/AUTO")
defineTumb("DEFROST_GLASS_HEAT",3, start_command + 34, 357, 1, {0,1}, nil, false, "Heating", "Glass Heater Switch, MANUAL/AUTO")
defineTumb("DEFROST_ICE_DET",3, start_command + 35, 358, 1, {0,1}, nil, false, "Heating", "Ice Detector Heater Switch, MANUAL/AUTO")
defineTumb("DEFROST_ICE_DET_TEST",3, start_command + 36, 359, 1, {0,1}, nil, false, "Heating", "Ice Detector Heater Test Button - Push to test")
defineTumb("DEFROST_LEFT_PITOT",3, start_command + 38, 519, 1, {0,1}, nil, false, "Heating", "Left Pitot Heater Switch, ON/OFF")
defineTumb("DEFROST_RIGHT_PITOT",3, start_command + 39, 520, 1, {0,1}, nil, false, "Heating", "Right Pitot Heater Switch, ON/OFF")
defineTumb("DEFROST_LEFT_PITOT_TEST",3, start_command + 40, 339, 1, {0,1}, nil, false, "Heating", "Left Pitot Heater Test Button - Push to test")
defineTumb("DEFROST_RIGHT_PITOT_TEST",3, start_command + 41, 482, 1, {0,1}, nil, false, "Heating", "Right Pitot Heater Test Button - Push to test")

--################################################ ###########################################
defineTumb("DPL_PWR",15, start_command + 1, 483, 1, {0,1}, nil, false, "Navigation", "Doppler Navigator Power Switch, ON/OFF")
defineTumb("DPL_OFF_COORD",15, start_command + 2, 818, 1, {0,1}, nil, false, "Navigation", "Turn Off Coordinates Calculator Button")
defineTumb("DPL_ON_COORD",15, start_command + 3, 819, 1, {0,1}, nil, false, "Navigation", "Turn On Coordinates Calculator Button")
defineTumb("DPL_DEC_ANGLE",15, start_command + 4, 815, 1, {0,1}, nil, false, "Navigation", "Decrease Map Angle Button")
defineTumb("DPL_INC_ANGLE",15, start_command + 5, 816, 1, {0,1}, nil, false, "Navigation", "Increase Map Angle Button")
defineTumb("DPL_DEC_PATH",15, start_command + 6, 809, 1, {0,1}, nil, false, "Navigation", "Decrease Path KM Button")
defineTumb("DPL_INC_PATH",15, start_command + 7, 810, 1, {0,1}, nil, false, "Navigation", "Increase Path KM Button")
defineTumb("DPL_DEC_DEV",15, start_command + 8, 803, 1, {0,1}, nil, false, "Navigation", "Decrease Deviation KM Button")
defineTumb("DPL_INC_DEV",15, start_command + 9, 804, 1, {0,1}, nil, false, "Navigation", "Increase Deviation KM Button")

--################################################ ###########################################
defineTumb("ADI_R_ATT_PWR",7, start_command + 4, 487, 1, {0,1}, nil, false, "ADI", "Right Attitude Indicator Power Switch, ON/OFF")
defineTumb("ADI_L_ATT_PWR",6, start_command + 4, 335, 1, {0,1}, nil, false, "ADI", "Left Attitude Indicator Power Switch, ON/OFF")
defineTumb("ADI_L_ATT_KNOB",6, start_command + 2, 11, 1, {0,1}, nil, false, "ADI", "Left Attitude Indicator Cage Knob - Push to cage")
defineTumb("ADI_R_ATT_KNOB",7, start_command + 2, 90, 1, {0,1}, nil, false, "ADI", "Right Attitude Indicator Cage Knob - Push to cage")
defineTumb("ADI_VK53_PWR",32, start_command + 1, 336, 1, {0,1}, nil, false, "ADI", "VK-53 Power Switch, ON/OFF")

--################################################ ###########################################
defineTumb("GMC_PWR",14, start_command + 1, 485, 1, {0,1}, nil, false, "GMC", "GMC Power Switch, ON/OFF")
defineTumb("GMC_HEM_SEL",14, start_command + 2, 470, 1, {0,1}, nil, false, "GMC", "GMC Hemisphere Selection Switch, NORTH/SOUTH")
defineTumb("GMC_MODE",14, start_command + 4, 472, 1, {-1,1}, nil, false, "GMC", "GMC Mode Switch, MC/DG/AC(N/F)")

--################################################ ###########################################
defineTumb("ENG_L_ENG_DUST",3, start_command + 28, 517, 1, {0,1}, nil, false, "Engine Control", "Left Engine Dust Protection Switch, ON/OFF")
defineTumb("ENG_R_ENG_DUST",3, start_command + 29, 518, 1, {0,1}, nil, false, "Engine Control", "Right Engine Dust Protection Switch, ON/OFF")

--################################################ ###########################################
defineTumb("LGHT_ANO",9, start_command + 12, 513, 1, {-1,1}, nil, false, "Lights", "ANO Switch, BRIGHT/OFF/DIM")
defineTumb("LGHT_FRM",9, start_command + 13, 514, 1, {-1,1}, nil, false, "Lights", "Formation Lights Switch, BRIGHT/OFF/DIM")
defineTumb("LGHT_TIP",9, start_command + 14, 515, 1, {0,1}, nil, false, "Lights", "Tip Lights Switch, ON/OFF")
defineTumb("LGHT_STROBE",9, start_command + 15, 516, 1, {0,1}, nil, false, "Lights", "Strobe Light Switch, ON/OFF")
defineTumb("LGHT_ANO_CODE",9, start_command + 16, 322, 1, {0,1}, nil, false, "Lights", "ANO Code Button")
defineTumb("LGHT_TAXI",9, start_command + 17, 836, 1, {0,1}, nil, false, "Lights", "Taxi Light Switch, ON/OFF")
defineTumb("LGHT_L_LAND",9, start_command + 18, 837, 1, {-1,1}, nil, false, "Lights", "Left Landing Light Switch, LIGHT/OFF/RETRACT")
defineTumb("LGHT_R_LAND",9, start_command + 19, 838, 1, {-1,1}, nil, false, "Lights", "Right Landing Light Switch, LIGHT/OFF/RETRACT")

--################################################ ###########################################
defineTumb("LGHT_L_CEIL",46, start_command + 2, 333, 1, {-1,1}, nil, false, "Lights", "Left Ceiling Light Switch, RED/OFF/WHITE")
defineTumb("LGHT_R_CEIL",46, start_command + 3, 489, 1, {-1,1}, nil, false, "Lights", "Right Ceiling Light Switch, RED/OFF/WHITE")
defineTumb("LGHT_5_5V",46, start_command + 4, 479, 1, {0,1}, nil, false, "Lights", "5.5V Lights Switch, ON/OFF")
defineTumb("LGHT_CARGO",46, start_command + 22, 511, 1, {0,1}, nil, false, "Lights", "Cargo Cabin Duty Lights Switch, ON/OFF")
defineTumb("LGHT_CARGO2",46, start_command + 23, 512, 1, {0,1}, nil, false, "Lights", "Cargo Cabin Common Lights Switch, ON/OFF")

--################################################ SPU-7###########################################

defineTumb("SPU7_L_ICS",36, start_command + 4, 553, 1, {0,1}, nil, false, "SPU-7", "Radio/ICS Switch")
defineTumb("SPU7_L_NETWORK",36, start_command + 7, 551, 1, {0,1}, nil, false, "SPU-7", "Network 1/2 Switch (N/F)")
defineTumb("SPU7_L_CIRC_CALL",36, start_command + 8, 552, 1, {0,1}, nil, false, "SPU-7", "Circular Call Button (N/F)")
defineTumb("SPU7_R_ICS",36, start_command + 12, 845, 1, {0,1}, nil, false, "SPU-7", "Radio/ICS Switch")
defineTumb("SPU7_R_NETWORK",36, start_command + 13, 843, 1, {0,1}, nil, false, "SPU-7", "Network 1/2 Switch (N/F)")
defineTumb("SPU7_R_CIRC_CALL",36, start_command + 14, 846, 1, {0,1}, nil, false, "SPU-7", "Circular Call Button (N/F)")
defineTumb("SPU7_LARYNG",36, start_command + 6, 480, 1, {0,1}, nil, false, "SPU-7", "Laryngophone Switch, ON/OFF")

--################################################ ###########################################

defineTumb("R863_MOD",38, start_command + 1, 369, 1, {0,1}, nil, false, "R-863", "R-863, Modulation Switch, FM/AM")

--################################################ ###########################################

defineTumb("R828_TUNER",39, start_command + 3, 738, 1, {0,1}, nil, false, "R-828", "R-828, Radio Tuner Button")

--################################################ ###########################################

defineTumb("JAD1A_PWR",37, start_command + 13, 484, 1, {0,1}, nil, false, "Jadro-1A", "Jadro-1A, Power Switch, ON/OFF")
defineTumb("JAD1A_CTRL",37, start_command + 9, 742, 1, {0,1}, nil, false, "Jadro-1A", "Jadro-1A, Control Button")

--################################################ ###########################################

defineTumb("RI65_PWR",11, start_command + 6, 338, 1, {0,1}, nil, false, "RI-65", "RI-65 Power Switch, ON/OFF")
defineTumb("RI65_OFF",11, start_command + 5, 292, 1, {0,1}, nil, false, "RI-65", "RI-65 OFF Button")
defineTumb("RI65_RPT",11, start_command + 3, 293, 1, {0,1}, nil, false, "RI-65", "RI-65 Repeat Button")
defineTumb("RI65_CHK",11, start_command + 4, 294, 1, {0,1}, nil, false, "RI-65", "RI-65 Check Button")
defineTumb("RI65_AMP",36, start_command + 21, 295, 1, {0,1}, nil, false, "RI-65", "RI-65 Amplifier Switch, ON/OFF")

--################################################ ###########################################

defineTumb("ARCUD_SENS",41, start_command + 2, 453, 1, {0,1}, nil, false, "ARC-UD", "ARC-UD, Sensitivity Switch, MORE/LESS")
defineTumb("ARCUD_WAVE",41, start_command + 3, 454, 1, {0,1}, nil, false, "ARC-UD", "ARC-UD, Wave Switch, MW/DW")
defineTumb("ARCUD_CTRL",41, start_command + 6, 672, 1, {0,1}, nil, false, "ARC-UD", "ARC-UD, Control Button")
defineTumb("ARCUD_L_ANT",41, start_command + 7, 673, 1, {0,1}, nil, false, "ARC-UD", "ARC-UD, Left Antenna Button")
defineTumb("ARCUD_R_ANT",41, start_command + 8, 674, 1, {0,1}, nil, false, "ARC-UD", "ARC-UD, Right Antenna Button")
defineTumb("ARCUD_LCK",41, start_command + 12, 481, 1, {0,1}, nil, false, "ARC-UD", "ARC-UD, Lock Switch, LOCK/UNLOCK")

--################################################ ###########################################

defineTumb("PKV_DBL",47, start_command + 5, 0, 1, {0,1}, nil, false, "PKV Sight", "Sight Double")

--################################################ ###########################################

defineTumb("CLOCK_HEAT",45, start_command + 6, 521, 1, {0,1}, nil, false, "Clock", "Clock Heating Switch, ON/OFF")

--################################################ ###########################################

defineTumb("UV26_SEQ",48, start_command + 4, 914, 1, {0,1}, nil, false, "UV-26", "CMD Num of Sequences Button")
defineTumb("UV26_RST",48, start_command + 8, 864, 1, {0,1}, nil, false, "UV-26", "CMD Reset to Default Program Button")
defineTumb("UV26_STOP_DSP",48, start_command + 9, 865, 1, {0,1}, nil, false, "UV-26", "CMD Stop Dispense Button")

--################################################ ###########################################

defineTumb("BLST_L_OPEN",17, start_command + 15, 215, 1, {0,1}, nil, false, "UV-26", "Left Blister, OPEN/CLOSE")
defineTumb("BLST_R_OPEN",17, start_command + 16, 216, 1, {0,1}, nil, false, "UV-26", "Right Blister, OPEN/CLOSE")

--################################################ ###########################################

defineTumb("BRK_WHEEN",17, start_command + 17, 881, 1, {0,1}, nil, false, "Brakes", "Wheel Brakes Handle")
defineTumb("BRK_PARK",17, start_command + 24, 930, 1, {0,1}, nil, false, "Brakes", "Parking Brake Handle")
defineTumb("ACC_RST",17, start_command + 6, 925, 1, {0,1}, nil, false, "Something", "Accelerometer Reset Button - Push to reset")
defineTumb("CPIT_AIR_L_FAN",17, start_command + 20, 334, 1, {0,1}, nil, false, "Cockpit Air", "Left Fan Switch, ON/OFF")
defineTumb("CPIT_AIR_R_FAN",17, start_command + 21, 488, 1, {0,1}, nil, false, "Cockpit Air", "Right Fan Switch, ON/OFF")

--################################################ ###########################################

defineTumb("ARC9",40, start_command + 11, 469, 1, {0,1}, nil, false, "ARC-9", "ARC-9, Dialer Switch, MAIN/BACKUP")
defineTumb("ARC9",40, start_command + 2, 444, 1, {0,1}, nil, false, "ARC-9", "ARC-9, TLF/TLG Switch")

--################################################ ###########################################

defineTumb("CARGO_RLS_CVR",51, start_command + 2, 199, 1, {0,1}, nil, false, "External Cargo Equipment", "Tactical Cargo Release Button Cover, OPEN/CLOSE")
defineTumb("CARGO_EMG_RLS_CVR",51, start_command + 4, 197, 1, {0,1}, nil, false, "External Cargo Equipment", "Emergency Cargo Release Button Cover, OPEN/CLOSE")
defineTumb("CARGO_AUTO_DROP",51, start_command + 5, 324, 1, {0,1}, nil, false, "External Cargo Equipment", "External Cargo Automatic Dropping, ON/OFF")

--################################################ ###########################################

defineTumb("SIG_CASS_1",52, start_command + 1, 282, 1, {0,1}, nil, false, "Signal Flares", "Signal Flares Cassette 1 Power Switch, ON/OFF")
defineTumb("SIG_CASS_2",52, start_command + 6, 283, 1, {0,1}, nil, false, "Signal Flares", "Signal Flares Cassette 2 Power Switch, ON/OFF")

--################################################ ###########################################

defineTumb("KO50_START",53, start_command + 1, 464, 1, {0,1}, nil, false, "KO-50", "KO-50 Heater Start Button - Push to start")
defineTumb("KO50_FAN",53, start_command + 2, 467, 1, {0,1}, nil, false, "KO-50", "KO-50 Fan Switch, ON/OFF")
defineTumb("KO50_MODE",53, start_command + 3, 465, 1, {-1,1}, nil, false, "KO-50", "KO-50 Heater Mode Switch, MANUAL/OFF/AUTO")
defineTumb("KO50_REGIME",53, start_command + 4, 466, 1, {-1,1}, nil, false, "KO-50", "KO-50 Heater Regime Switch, FILLING/FULL/MEDIUM")

--################################################ ###########################################

defineTumb("SARPP_MODE",55, start_command + 1, 315, 1, {0,1}, nil, false, "SARPP", "SARPP-12 Mode Switch, MANUAL/AUTO")

--################################################ ###########################################

defineTumb("P503B_PWR",56, start_command + 1, 305, 1, {0,1}, nil, false, "Recorder P-503B", "Recorder P-503B Power Switch, ON/OFF")

--################################################ ###########################################

defineTumb("IFF_SEL",57, start_command + 2, 301, 1, {0,1}, nil, false, "IFF", "IFF Transponder Device Selector Switch, WORK/RESERVE")
defineTumb("IFF_MODE",57, start_command + 3, 300, 1, {0,1}, nil, false, "IFF", "IFF Transponder Device Mode Switch, 1/2")
defineTumb("IFF_ERASE_COVER",57, start_command + 4, 296, 1, {0,1}, nil, false, "IFF", "IFF Transponder Erase Button Cover, OPEN/CLOSE")
defineTumb("IFF_ERASE",57, start_command + 5, 297, 1, {0,1}, nil, false, "IFF", "IFF Transponder Erase Button - Push to erase")
defineTumb("IFF_DIS_COVER",57, start_command + 6, 298, 1, {0,1}, nil, false, "IFF", "IFF Transponder Disaster Switch Cover, OPEN/CLOSE")
defineTumb("IFF_DIS",57, start_command + 7, 299, 1, {0,1}, nil, false, "IFF", "IFF Transponder Disaster Switch, ON/OFF")

--################################################ ###########################################

defineTumb("JMP_SIREN",20, start_command + 1, 323, 1, {0,1}, nil, false, "Jump Siren", "Alarm Bell Button - Push to turn on")

--################################################ ###########################################

defineRotary("BAR_L_QFE",26, start_command + 1, 18, "Bariometer", "Baro Pressure QFE Knob")
defineRotary("BAR_R_QFE",27, start_command + 1, 97, "Bariometer", "Baro Pressure QFE Knob")

defineRotary("VAR_L_ADJ",30, start_command + 1, 17, "Variometer", "Variometer Adjustment Knob")
defineRotary("VAR_L_ADJ",31, start_command + 1, 96, "Variometer", "Variometer Adjustment Knob")

defineRotary("HSI_L_CRS",34, start_command + 1, 26, "HSI", "HSI Course Set Knob")
defineRotary("HSI_R_CRS",35, start_command + 1, 102, "HSI", "HSI Course Set Knob")
defineRotary("SPUU52_ADJ",8, start_command + 2, 128, "SPUU-52", "SPUU-52 Adjustment Knob")

defineTumb("HSI_COMP_SEL",34, start_command + 3, 858, 1, {0,1}, nil, false, "HSI", "HSI Radio Compass Selector Switch, ARC-9/ARC-UD")
defineTumb("MISC_TST_WORK",15, start_command + 11, 797, 1, {0,1}, nil, false, "Misc", "Test/Work Switch")
defineTumb("MISC_LAND_SEA",15, start_command + 12, 798, 1, {0,1}, nil, false, "Misc", "Land/Sea Switch")
defineTumb("R863_UNIT_SWITCH",38, start_command + 2, 132, 1, {0,1}, nil, false, "R-863", "R-863, Unit Switch, DIAL/MEMORY")
defineTumb("R863_SQL_SWITCH",38, start_command + 4, 155, 1, {0,1}, nil, false, "R-863", "R-863, Squelch Switch, ON/OFF")
defineTumb("R863_EMG_RCVR",38, start_command + 10, 153, 1, {0,1}, nil, false, "R-863", "R-863, Emergency Receiver Switch, ON/OFF (N/F)")
defineTumb("R863_ARC",38, start_command + 11, 154, 1, {0,1}, nil, false, "R-863", "R-863, ARC Switch, ON/OFF (N/F)")
defineTumb("R828_SQL_SWITCH",39, start_command + 4, 739, 1, {0,1}, nil, false, "R-828", "R-828, Squelch Switch, ON/OFF")
defineTumb("R828_PWR",39, start_command + 5, 756, 1, {0,1}, nil, false, "R-828", "R-828, Power Switch, ON/OFF")
defineTumb("R828_COMP_SWITCH",39, start_command + 6, 757, 1, {0,1}, nil, false, "R-828", "R-828, Compass Switch, COMM/NAV")
defineTumb("CMD_PWR",48, start_command + 10, 910, 1, {0,1}, nil, false, "CMD", "CMD Power Switch, ON/OFF")
defineTumb("CMD_FLRS_AMOUNT",48, start_command + 3, 913, 1, {0,1}, nil, false, "CMD", "CMD Flares Amount Switch, COUNTER/PROGRAMMING")

defineTumb("AC_VOLT_SEL", 1, start_command + 17, 535, 0.1,   { 0, 1.0}, nil, false, "Electrical system", "AC Voltmeter Selector")
defineTumb("FUEL_METER_SWITCH",2, start_command + 8, 61, 0.1,{0, 0.5}, nil, false,  "FUEL", "Fuel Meter Switch, OFF/SUM/LEFT/RIGHT/FEED/ADDITIONAL")
defineTumb("POD_VAR_SEL",12, start_command + 13, 719, 0.1,{0, 0.5}, nil, false, "PODS", "Pod Variants Selector Switch")
defineTumb("ESBR_POS",12, start_command + 29, 730, 0.0555,{0, 0.8325}, nil, false, "ESBR", "ESBR Position Selector Switch")
defineTumb("POD_SEL_SWITH",12, start_command + 42, 347, 0.1,{0, 0.3}, nil, false, "PODS", "In800Out/800inOr624/622 Switch")
defineTumb("PYRO_L",12, start_command + 44, 350, 0.1,{0, 0.3}, nil, false, "PODS", "Left PYROCARTRIDGE Switch, I/II/III")
defineTumb("PYRO_R",12, start_command + 45, 351, 0.1,{0, 0.3}, nil, false, "PODS", "Right PYROCARTRIDGE Switch, I/II/III")
defineTumb("FIRE_CHECK_CIRC",19, start_command + 12, 401, 0.1,{0, 0.7}, nil, false, "FIRE", "Check Fire Circuits Switch, OFF/CONTROL/1/2/3/4/5/6")
defineTumb("DFRST_AMP_SEL",3, start_command + 37, 372, 0.1,{0, 0.9}, nil, false, "HEATING", "Defrost System Amperemeter Selector Switch")
defineTumb("DOP_NAV_MODE",15, start_command + 10, 826, 0.1,{0, 0.4}, nil, false, "Navigation", "Doppler Navigator Mode Switch")
defineTumb("RADIO_SEL_L",36, start_command + 3, 550, 0.1,{0, 0.5}, nil, false, "Radios", "Radio Source Selector Switch, R-863/JADRO-1A/R-828/NF/ARC-9/ARC-UD")
defineTumb("RADIO_SEL_R",36, start_command + 11, 842, 0.1,{0, 0.5}, nil, false, "Radios", "Radio Source Selector Switch, R-863/JADRO-1A/R-828/NF/ARC-9/ARC-UD")
defineTumb("JADR1A_MODE",37, start_command + 1, 744, 0.5,{-0.5, 1}, nil, false, "Jadro-1A", "Jadro-1A, Mode Switch, OFF/OM/AM")
defineTumb("ARCUD_MODE",41, start_command + 1, 456, 0.1,{0, 0.4}, nil, false, "ARC-UD", "ARC-UD, Mode Switch, OFF/NARROW/WIDE/PULSE/RC")
defineTumb("ARCUD_CHL",41, start_command + 4, 457, 0.1,{0, 0.5}, nil, false, "ARC-UD", "ARC-UD, Channel Selector Switch, 1/2/3/4/5/6")
defineTumb("ARC9_MODE",40, start_command + 3, 446, 0.1,{0, 0.3}, nil, false, "ARC-9", "ARC-9, Mode Selector Switch, OFF/COMP/ANT/LOOP")

definePotentiometer("NAV_L_ATT_KNOB",6, start_command + 3, 10, {0, 1},"Navigation", "Left Attitude Indicator Zero Pitch Knob")
definePotentiometer("WPN_BURST_LEN",12, start_command + 43, 346, {0, 1},"Weapons", "Burst Length Knob")
definePotentiometer("NAV_R_ATT_KNOB",7, start_command + 3, 89, {0, 1},"Navigation", "Right Attitude Indicator Zero Pitch Knob")
definePotentiometer("NAV_GMC_LAT_SEL",14, start_command + 6, 474, {0.0, 0.728},"Navigation", "GMC Latitude Selection Knob")
definePotentiometer("L_RED_LGHT_1",46, start_command + 5, 280, {0.0, 1.0},"Lights", "Left Red Lights Brightness Group 1 Rheostat")
definePotentiometer("L_RED_LGHT_2",46, start_command + 6, 281, {0.0, 1.0},"Lights", "Left Red Lights Brightness Group 2 Rheostat")
definePotentiometer("R_RED_LGHT_1",46, start_command + 7, 491, {0.0, 1.0},"Lights", "Right Red Lights Brightness Group 1 Rheostat")
definePotentiometer("R_RED_LGHT_2",46, start_command + 8, 492, {0.0, 1.0},"Lights", "Right Red Lights Brightness Group 2 Rheostat")
definePotentiometer("C_RED_LGHT_1",46, start_command + 9, 894, {0.0, 1.0},"Lights", "Central Red Lights Brightness Group 1 Rheostat")
definePotentiometer("C_RED_LGHT_2",46, start_command + 10, 895, {0.0, 1.0},"Lights", "Central Red Lights Brightness Group 2 Rheostat")
definePotentiometer("55V_LGHT",46, start_command + 11, 924, {0.0, 1.0},"Lights", "5.5V Lights Brightness Rheostat")
definePotentiometer("SGHT_KNOB",47, start_command + 3, 855, {0, 0.807},"Weapons", "Sight Limb Knob")
definePotentiometer("ARC9_BCK_TUNE",40, start_command + 4, 449, {-0.2, 0.4},"ARC-9", "ARC-9, Backup Frequency Tune Knob")
definePotentiometer("ARC9_MAIN_TUNE",40, start_command + 7, 451,{-0.2,0.4},"ARC-9", "ARC-9, Main Frequency Tune Knob")
definePotentiometer("KO50_TRG_TEMP",53, start_command + 5, 468, {0,1},"KO-50", "KO-50 Target Temperature Knob")
definePotentiometer("FR_BCK_LGHT",56, start_command + 2, 308, {0, 0.8},"P-503B", "Recorder P-503B Backlight Brightness Knob")

definePotentiometer("VOL_KNOB_L",36, start_command + 9, 841,{ 0, 1},"Radio Volume", "Common Volume Knob")
definePotentiometer("VOL_KNOB_R",36, start_command + 1, 549,{ 0, 1},"Radio Volume", "Common Volume Knob")
definePotentiometer("LST_VOL_KNOB_L",36, start_command + 2, 548,{ 0, 1},"Radio Volume", "Listening Volume Knob")
definePotentiometer("LST_VOL_KNOB_R",36, start_command + 10, 840,{ 0, 1},"Radio Volume", "Listening Volume Knob")
definePotentiometer("R863_VOL",38, start_command + 5, 156,{ 0, 1},"Radio Volume", "R-863, Volume Knob")
definePotentiometer("R828_VOL",39, start_command + 2, 737,{ 0, 1},"Radio Volume", "R-828, Volume Knob")
definePotentiometer("JADR1A_VOL",37, start_command + 7, 743,{ 0, 1},"Radio Volume", "Jadro-1A, Volume Knob")
definePotentiometer("ARCUD_VOL",41, start_command + 5, 455,{ 0, 1},"Radio Volume", "ARC-UD, Volume Knob")
definePotentiometer("SGT_BRIGHT",47, start_command + 1, 589,{ 0, 1},"Weapons", "Sight Brightness Knob")
definePotentiometer("ARC9_VOL",40, start_command + 1, 448,{ 0, 1},"Radio Volume", "ARC-9, Volume Knob")

defineTumb("SPUU52_TEST", 8, start_command + 3, 129, 1, {-1, 1}, nil, false, "SPUU-52", "SPUU-52 Test Switch, P/OFF/t)")
defineTumb("GMC_CTRL_SWITCH", 14, start_command + 3, 476, 1, {-1, 1}, nil, false, "GMC", "GMC Control Switch, 0/CONTROL/300")
defineTumb("GMC_CRS_SWITCH", 14, start_command + 5, 477, 1, {-1, 1}, nil, false, "GMC", "GMC Course Setting Switch, CCW/OFF/CW)")
defineTumb("R_863_CNL_SEL", 38, start_command + 3, 370, 0.05, {0, 0.949768}, nil, false, "R-863", "R-863, Radio Channel Selector Knob")


--defineTumb(msg, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
--defineSetCommandTumb(msg, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
--defineToggleSwitch(msg, device_id, command, arg_number, category, description)
--defineToggleSwitchToggleOnly(msg, device_id, command, arg_number, category, description)
--defineFixedStepTumb(msg, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)
--defineFixedStepInput(msg, device_id, command, rel_args, category, description)
--defineVariableStepTumb(msg, device_id, command, arg_number, max_step, category, description)
--defineRockerSwitch(msg, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
--defineMultipositionSwitch(msg, device_id, device_command, arg_number, num_positions, increment, category, description)
--defineRotary(msg, device_id, command, arg_number, category, description)
--definePotentiometer(msg, device_id, command, arg_number, limits, category, description)
--definePushButton(msg, device_id, device_command, arg_number, category, description)
--defineIndicatorLight(msg, arg_number, category, description)


--radio_wheel_1(hint_,device_,command1_,arg_, arg_value_, arg_lim_, slave_)
defineFixedStepTumb("R863_10MHZ", 38, start_command + 6, 157, 0.1, {0, 1}, {-0.1, 0.1}, nil, "R-863", "R-863, 10MHz Rotary Knob")
defineFixedStepTumb("R863_1MHZ", 38, start_command + 7, 158, 0.1, {0, 1}, {-0.1, 0.1}, nil, "R-863", "R-863, 1MHz Rotary Knob")
defineFixedStepTumb("R863_100KHZ", 38, start_command + 8, 159, 0.1, {0, 1}, {-0.1, 0.1}, nil, "R-863", "R-863, 100KHz Rotary Knob")
defineFixedStepTumb("R863_1KHZ", 38, start_command + 9, 160, 0.1, {0, 1}, {-0.1, 0.1}, nil, "R-863", "R-863, 1KHz Rotary Knob")
--TODO GET R-863 FREQ

defineTumb("R828_PRST_CHAN_SEL", 39, start_command + 1, 735, 0.1, {0, 0.9}, nil, "R-863", "R-828, Radio Channel Selector Knob")
defineFixedStepTumb("JADRO1A_1MHZ", 37, start_command + 2, 745, 0.1, {0, 1}, {-0.1, 0.1}, nil, "Jadro-1A", "Jadro-1A, Frequency Selector, 1MHz")
defineFixedStepTumb("JADRO1A_100KHZ", 37, start_command + 3, 746, 0.1, {0, 1}, {-0.1, 0.1}, nil, "Jadro-1A", "Jadro-1A, Frequency Selector, 100kHz")
defineFixedStepTumb("JADRO1A_10KHZ", 37, start_command + 4, 747, 0.1, {0, 1}, {-0.1, 0.1}, nil, "Jadro-1A", "Jadro-1A, Frequency Selector, 10kHz")
defineFixedStepTumb("JADRO1A_1KHZ", 37, start_command + 5, 748, 0.1, {0, 1}, {-0.1, 0.1}, nil, "Jadro-1A", "Jadro-1A, Frequency Selector, 1kHz")
defineFixedStepTumb("JADRO1A_100HZ", 37, start_command + 6, 749, 0.1, {0, 1}, {-0.1, 0.1}, nil, "Jadro-1A", "Jadro-1A, Frequency Selector, 100Hz")
defineTumb("JADRO1A_SQL", 37, start_command + 8, 741, 0.7, {0, 0.7}, nil, "Jadro-1A", "Jadro-1A, Squelch Switch")
--TODO GET JADRO FREQ

defineTumb("WPN_SIGHT_DBL", 47, start_command + 5, 856, 0.5, {0, 0.5}, nil, "Weapons", "PKV Sight Double")

defineTumb("WPN_SIGHT_SUN", 47, start_command + 6, 903, 1, {0, 1}, nil, "Weapons", "PKV Sun Filter")
--TODO Mech clock (CO-Pilot)


defineTumb("STC_PRS_SYSTEM", 25, start_command + 1, 839, 0.1, {0, 0.2}, nil, "Pitot", "Static Pressure System Mode Selector, LEFT/COMMON/RIGHT")
defineTumb("CMD_FLARE_SEL", 48, start_command + 2, 859, 0.5, {0, 1}, nil, "Dispenser", "CMD Board Flares Dispensers Switch, LEFT/BOTH/RIGHT")
defineTumb("CMD_INTERVAL", 48, start_command + 6, 862, 1, {0, 1}, nil, "Dispenser", "CMD Dispense Interval Button")
defineTumb("CMD_FLARE_NUM", 48, start_command + 5, 863, 1, {0, 1}, nil, "Dispenser", "CMD Num in Sequence Button")
defineTumb("CMD_FLARE_START", 48, start_command + 7, 866, 1, {0, 1}, nil, "Dispenser", "CMD Start Dispense Button")
defineTumb("CMD_FLARE_START_STOP", 48, start_command + 13, 911, 1, {0, 1}, nil, "Dispenser", "CMD Start/Stop Dispense Button")
defineTumb("WIPER_L_OFF", 17, start_command + 25, 331, 0.1, {0, 0}, nil, "Windscreen", "Left Windscreen Wiper Control Switch, OFF")
defineTumb("WIPER_L_ON", 17, start_command + 25, 331, 0.1, {0, 0.1}, nil, "Windscreen", "Left Windscreen Wiper Control Switch, ON")
defineTumb("WIPER_L_RST", 17, start_command + 25, 331, 0.2, {0, 0.2}, nil, "Windscreen", "Left Windscreen Wiper Control Switch, RESET")
defineTumb("WIPER_L_SPD_1", 17, start_command + 25, 331, 0.3, {0, 0.3}, nil, "Windscreen", "Left Windscreen Wiper Control Switch, SPEED 1")
defineTumb("WIPER_L_SPD_2", 17, start_command + 25, 331, 0.4, {0, 0.4}, nil, "Windscreen", "Left Windscreen Wiper Control Switch, SPEED 2")
defineTumb("WIPER_R_OFF", 17, start_command + 26, 478, 0.1, {0, 0}, nil, "Windscreen", "Right Windscreen Wiper Control Switch, OFF")
defineTumb("WIPER_R_ON", 17, start_command + 26, 478, 0.1, {0, 0.1}, nil, "Windscreen", "Right Windscreen Wiper Control Switch, ON")
defineTumb("WIPER_R_RST", 17, start_command + 26, 478, 0.2, {0, 0.2}, nil, "Windscreen", "Right Windscreen Wiper Control Switch, RESET")
defineTumb("WIPER_R_SPD_1", 17, start_command + 26, 478, 0.3, {0, 0.3}, nil, "Windscreen", "Right Windscreen Wiper Control Switch, SPEED 1")
defineTumb("WIPER_R_SPD_2", 17, start_command + 26, 478, 0.4, {0, 0.4}, nil, "Windscreen", "Right Windscreen Wiper Control Switch, SPEED 2")
defineTumb("ARC_9_LOOP", 40, start_command + 10, 447, 1, {-1, 1}, nil, "ARC-9", "ARC-9, Loop Control Switch, LEFT/OFF/RIGHT")
defineTumb("ARC_BCK_100KHZ", 40, start_command + 5, 675, 0.05, {0, 0.55}, nil, "ARC-9", "ARC-9, Backup 100kHz Rotary Knob")
defineTumb("ARC_BCK_10KHZ", 40, start_command + 6, 450, 0.1, {0, 0.9}, nil, "ARC-9", "ARC-9, Backup 10kHz Rotary Knob")
defineTumb("ARC_MAIN_100KHZ", 40, start_command + 8, 678, 0.05, {0, 0.55}, nil, "ARC-9", "ARC-9, Main 100kHz Rotary Knob")
defineTumb("ARC_MAIN_10KHZ", 40, start_command + 9, 452, 0.1, {0, 0.9}, nil, "ARC-9", "ARC-9, Main 10kHz Rotary Knob")
defineTumb("CARGO_TACT_REL", 51, start_command + 1, 200, 1, {0, 1}, nil, "External Cargo", "Tactical Cargo Release Button - Push to release")
defineTumb("CARGO_TACT_REL", 51, start_command + 3, 198, 1, {0, 1}, nil, "External Cargo", "Tactical Cargo Release Button - Push to release")
defineTumb("IFF_MODE", 57, start_command + 1, 304, 0.1, {0, 0.3}, nil, "IFF", "IFF Transponder Mode Selector Switch, AUTO/KD/+-15/KP")
defineTumb("SIG_CAS1_RED", 52, start_command + 3, 284, 1, {0, 1}, nil, "Signal Flares", "Signal Flares Cassette 1 Launch Red Button")
defineTumb("SIG_CAS1_GREEN", 52, start_command + 2, 285, 1, {0, 1}, nil, "Signal Flares", "Signal Flares Cassette 1 Launch Green Button")
defineTumb("SIG_CAS1_YELLOW", 52, start_command + 5, 286, 1, {0, 1}, nil, "Signal Flares", "Signal Flares Cassette 1 Launch Yellow Button")
defineTumb("SIG_CAS1_WHITE", 52, start_command + 4, 287, 1, {0, 1}, nil, "Signal Flares", "Signal Flares Cassette 1 Launch White Button")
defineTumb("SIG_CAS2_RED", 52, start_command + 8, 288, 1, {0, 1}, nil, "Signal Flares", "Signal Flares Cassette 2 Launch Red Button")
defineTumb("SIG_CAS2_GREEN", 52, start_command + 7, 289, 1, {0, 1}, nil, "Signal Flares", "Signal Flares Cassette 2 Launch Green Button")
defineTumb("SIG_CAS2_YELLOW", 52, start_command + 10, 290, 1, {0, 1}, nil, "Signal Flares", "Signal Flares Cassette 2 Launch Yellow Button")
defineTumb("SIG_CAS2_WHITE", 52, start_command + 9, 291, 1, {0, 1}, nil, "Signal Flares", "Signal Flares Cassette 2 Launch White Button")

--? Cannot test
defineTumb("TRG_L_RADIO_ICS", 36, start_command + 23, 182, 0.5, {0, 0.5}, nil, "Radio", "Left Trigger Button, RADIO/ICS")
defineTumb("TRG_R_RADIO_ICS", 36, start_command + 24, 225, 0.5, {0, 0.5}, nil, "Radio", "Right Trigger Button, RADIO/ICS")


defineIndicatorLight("LMP_AP_HDG_ON",781, "Lamps", "AP heading on")
defineIndicatorLight("LMP_AP_HEADING_OFF",782, "Lamps", "AP heading off")
defineIndicatorLight("LMP_AP_PITCH_ROLL_ON",783, "Lamps", "AP pitch roll_on")
defineIndicatorLight("LMP_AP_HEIGHT_ON",784, "Lamps", "AP height on")
defineIndicatorLight("LMP_AP_HEIGHT_OFF",785, "Lamps", "AP height off")
defineIndicatorLight("LMP_ENGINE_RT_LEFT_ON",316, "Lamps", "ENGINE_RT_LEFT_ON")
defineIndicatorLight("LMP_ENGINE_RT_RIGHT_ON",317, "Lamps", "ENGINE_RT_RIGHT_ON")
defineIndicatorLight("LMP_SARPP_ON",318, "Lamps", "SARPP_ON")
defineIndicatorLight("LMP_DESCENT_SIREN",325, "Lamps", "Descent_Siren")
defineIndicatorLight("LMP_LOCK_OPEN",326, "Lamps", "LOCK_OPEN")
defineIndicatorLight("LMP_DOORS_OPEN",327, "Lamps", "DOORS_OPEN")
defineIndicatorLight("LMP_TURN_ON_RI65",340, "Lamps", "TURN_ON_RI_65")
defineIndicatorLight("LMP_FROST",360, "Lamps", "FROST")
defineIndicatorLight("LMP_LEFT_ENG_HEATING",362, "Lamps", "LEFT_ENG_HEATING")
defineIndicatorLight("LMP_RIGHT_ENG_HEATING",363, "Lamps", "RIGHT_ENG_HEATING")
defineIndicatorLight("LMP_ANTI_ICE_ON",361, "Lamps", "ANTI_ICE_ON")
defineIndicatorLight("LMP_LEFT_PZU_FRONT",364, "Lamps", "LEFT_PZU_FRONT")
defineIndicatorLight("LMP_RIGHT_PZU_FRONT",365, "Lamps", "RIGHT_PZU_FRONT")
defineIndicatorLight("LMP_LEFT_PZU_BACK",366, "Lamps", "LEFT_PZU_BACK")
defineIndicatorLight("LMP_RIGHT_PZU_BACK",367, "Lamps", "RIGHT_PZU_BACK")
defineIndicatorLight("LMP_SECTION_1",373, "Lamps", "SECTION_1")
defineIndicatorLight("LMP_SECTION_2",375, "Lamps", "SECTION_2")
defineIndicatorLight("LMP_SECTION_3",374, "Lamps", "SECTION_3")
defineIndicatorLight("LMP_SECTION_4",376, "Lamps", "SECTION_4")
defineIndicatorLight("LMP_RIO_HEATING_OK",368, "Lamps", "RIO_heating_ok")
defineIndicatorLight("LMP_LEFT_ENG_FIRE",377, "Lamps", "LEFT_ENG_FIRE")
defineIndicatorLight("LMP_RIGHT_ENG_FIRE",378, "Lamps", "RIGHT_ENG_FIRE")
defineIndicatorLight("LMP_KO50_FIRE",379, "Lamps", "KO50_FIRE")
defineIndicatorLight("LMP_REDUC_AI9_FIRE",380, "Lamps", "REDUC_AI9_FIRE")
defineIndicatorLight("LMP_FIRE_LENG_1_QUEUE",381, "Lamps", "FIRE_LENG_1_QUEUE")
defineIndicatorLight("LMP_FIRE_RENG_1_QUEUE",382, "Lamps", "FIRE_RENG_1_QUEUE")
defineIndicatorLight("LMP_FIRE_KO50_1_QUEUE",383, "Lamps", "FIRE_KO50_1_QUEUE")
defineIndicatorLight("LMP_FIRE_REDUCT_1_QUEUE",384, "Lamps", "FIRE_REDUCT_1_QUEUE")
defineIndicatorLight("LMP_FIRE_LENG_2_QUEUE",385, "Lamps", "FIRE_LENG_2_QUEUE")
defineIndicatorLight("LMP_FIRE_RENG_2_QUEUE",386, "Lamps", "FIRE_RENG_2_QUEUE")
defineIndicatorLight("LMP_FIRE_KO50_2_QUEUE",387, "Lamps", "FIRE_KO50_2_QUEUE")
defineIndicatorLight("LMP_FIRE_REDUCT_2_QUEUE",388, "Lamps", "FIRE_REDUCT_2_QUEUE")
defineIndicatorLight("LMP_CHECK_SENSORS",398, "Lamps", "CHECK_SENSORS")
defineIndicatorLight("LMP_HYDRO_MAIN_ON",407, "Lamps", "HYDRO_main_on")
defineIndicatorLight("LMP_HYDRO_AUX_ON",408, "Lamps", "HYDRO_aux_on")
defineIndicatorLight("LMP_APD9_ON",414, "Lamps", "APD9_on")
defineIndicatorLight("LMP_APD9_OIL_PRESSURE",416, "Lamps", "APD9_oil_pressure")
defineIndicatorLight("LMP_APD9_RPM",417, "Lamps", "APD9_rpm")
defineIndicatorLight("LMP_APD9_RPM_HIGH",418, "Lamps", "APD9_rpm_high")
defineIndicatorLight("LMP_APD_ON",420, "Lamps", "APD_on")
defineIndicatorLight("LMP_APD_STARTER_ON",424, "Lamps", "APD_starter_on")
defineIndicatorLight("LMP_FUEL_LEFT_CLOSED",434, "Lamps", "FUEL_left_closed")
defineIndicatorLight("LMP_FUEL_RIGHT_CLOSED",435, "Lamps", "FUEL_right_closed")
defineIndicatorLight("LMP_FUEL_RING_CLOSED",436, "Lamps", "FUEL_ring_closed")
defineIndicatorLight("LMP_FUEL_CENTER_ON",441, "Lamps", "FUEL_center_on")
defineIndicatorLight("LMP_FUEL_LEFT_ON",442, "Lamps", "FUEL_left_on")
defineIndicatorLight("LMP_FUEL_RIGHT_ON",443, "Lamps", "FUEL_right_on")
defineIndicatorLight("LMP_HEATER",461, "Lamps", "HEATER")
defineIndicatorLight("LMP_IGNITION",462, "Lamps", "IGNITION")
defineIndicatorLight("LMP_KO50_ON",463, "Lamps", "KO50_ON")
defineIndicatorLight("LMP_LEFT_PITOT_HEATER_OK",341, "Lamps", "LEFT_PITOT_HEATER_OK")
defineIndicatorLight("LMP_RIGHT_PITOT_HEATER_OK",490, "Lamps", "RIGHT_PITOT_HEATER_OK")
defineIndicatorLight("LMP_LEFT_PZU_ON",509, "Lamps", "LEFT_PZU_ON")
defineIndicatorLight("LMP_RIGHT_PZU_ON",510, "Lamps", "RIGHT_PZU_ON")
defineIndicatorLight("LMP_ELEC_TURN_VU1",504, "Lamps", "ELEC_turn_VU1")
defineIndicatorLight("LMP_ELEC_TURN_VU2",505, "Lamps", "ELEC_turn_VU2")
defineIndicatorLight("LMP_ELEC_TURN_VU3",506, "Lamps", "ELEC_turn_VU3")
defineIndicatorLight("LMP_ELEC_DC_GROUND",507, "Lamps", "ELEC_DC_ground")
defineIndicatorLight("LMP_ELEC_TEST_EQUIPMENT",508, "Lamps", "ELEC_test_equipment")
defineIndicatorLight("LMP_ELEC_GEN1_FAIL",543, "Lamps", "ELEC_gen1_fail")
defineIndicatorLight("LMP_ELEC_GEN2_FAIL",544, "Lamps", "ELEC_gen2_fail")
defineIndicatorLight("LMP_ELEC_AC_GROUND",545, "Lamps", "ELEC_AC_ground")
defineIndicatorLight("LMP_ELEC_PO_500",546, "Lamps", "ELEC_PO_500")
defineIndicatorLight("LMP_CIRCUIT_FROM_BATTERY",86, "Lamps", "CIRCUIT_FROM_BATTERY")
defineIndicatorLight("LMP_CLOG_TF_LEFT",68, "Lamps", "CLOG_TF_LEFT")
defineIndicatorLight("LMP_CLOG_TF_RIGHT",69, "Lamps", "CLOG_TF_RIGHT")
defineIndicatorLight("LMP_CHIP_LEFT_ENG",70, "Lamps", "CHIP_LEFT_ENG")
defineIndicatorLight("LMP_CHIP_RIGHT_ENG",71, "Lamps", "CHIP_RIGHT_ENG")
defineIndicatorLight("LMP_VIBRATION_LEFT_HIGH",72, "Lamps", "VIBRATION_LEFT_HIGH")
defineIndicatorLight("LMP_VIBRATION_RIGHT_HIGH",73, "Lamps", "VIBRATION_RIGHT_HIGH")
defineIndicatorLight("LMP_FIRE",74, "Lamps", "FIRE")
defineIndicatorLight("LMP_LEFT_ENG_TURN_OFF",76, "Lamps", "LEFT_ENG_TURN_OFF")
defineIndicatorLight("LMP_RIGHT_ENG_TURN_OFF",77, "Lamps", "RIGHT_ENG_TURN_OFF")
defineIndicatorLight("LMP_FT_LEFT_HIGH",78, "Lamps", "FT_LEFT_HIGH")
defineIndicatorLight("LMP_FT_RIGHT_HIGH",79, "Lamps", "FT_RIGHT_HIGH")
defineIndicatorLight("LMP_OIL_PRESSURE_LEFT",80, "Lamps", "OIL_PRESSURE_LEFT")
defineIndicatorLight("LMP_OIL_PRESSURE_RIGHT",81, "Lamps", "OIL_PRESSURE_RIGHT")
defineIndicatorLight("LMP_ER_LEFT",82, "Lamps", "ER_LEFT")
defineIndicatorLight("LMP_ER_RIGHT",83, "Lamps", "ER_RIGHT")
defineIndicatorLight("LMP_EEC_LEFT_OFF",84, "Lamps", "EEC_LEFT_OFF")
defineIndicatorLight("LMP_EEC_RIGHT_OFF",85, "Lamps", "EEC_RIGHT_OFF")
defineIndicatorLight("LMP_CHIP_MAIN_REDUCTOR",873, "Lamps", "CHIP_MAIN_REDUCTOR")
defineIndicatorLight("LMP_CHIP_INTER_REDUCTOR",874, "Lamps", "CHIP_INTER_REDUCTOR")
defineIndicatorLight("LMP_CHIP_TAIL_REDUCTOR",875, "Lamps", "CHIP_TAIL_REDUCTOR")
defineIndicatorLight("LMP_300_LEFT",64, "Lamps", "300_Left")
defineIndicatorLight("LMP_DISS_OFF",65, "Lamps", "DISS_OFF")
defineIndicatorLight("LMP_BD1",555, "Lamps", "BD1")
defineIndicatorLight("LMP_BD2",556, "Lamps", "BD2")
defineIndicatorLight("LMP_BD3",557, "Lamps", "BD3")
defineIndicatorLight("LMP_BD4",558, "Lamps", "BD4")
defineIndicatorLight("LMP_BD5",559, "Lamps", "BD5")
defineIndicatorLight("LMP_BD6",560, "Lamps", "BD6")
defineIndicatorLight("LMP_BD1Bomb",711, "Lamps", "BD1Bomb")
defineIndicatorLight("LMP_BD2Bomb",712, "Lamps", "BD2Bomb")
defineIndicatorLight("LMP_BD3Bomb",713, "Lamps", "BD3Bomb")
defineIndicatorLight("LMP_BD4Bomb",714, "Lamps", "BD4Bomb")
defineIndicatorLight("LMP_BD5Bomb",715, "Lamps", "BD5Bomb")
defineIndicatorLight("LMP_BD6Bomb",716, "Lamps", "BD6Bomb")
defineIndicatorLight("LMP_PUS1",562, "Lamps", "PUS1")
defineIndicatorLight("LMP_PUS3",563, "Lamps", "PUS3")
defineIndicatorLight("LMP_PUS4",564, "Lamps", "PUS4")
defineIndicatorLight("LMP_PUS6",565, "Lamps", "PUS6")
defineIndicatorLight("LMP_EMERGEXPLODE",561, "Lamps", "EmergExplode")
defineIndicatorLight("LMP_EMERGEXPLODESEC",705, "Lamps", "EmergExplodeSec")
defineIndicatorLight("LMP_BV_NET_ON",710, "Lamps", "BV_Net_On")
defineIndicatorLight("LMP_RS_NET_ON",566, "Lamps", "RS_Net_On")
defineIndicatorLight("LMP_GUV_NET_ON",567, "Lamps", "GUV_Net_On")
defineIndicatorLight("LMP_FKP_ON",568, "Lamps", "FKP_On")
defineIndicatorLight("LMP_CAUTION_WEAP",778, "Lamps", "Caution_Weap")
defineIndicatorLight("LMP_READY1",586, "Lamps", "Ready1")
defineIndicatorLight("LMP_READY2",587, "Lamps", "Ready2")
defineIndicatorLight("LMP_READY3",588, "Lamps", "Ready3")
defineIndicatorLight("LMP_RECORD_P503B",306, "Lamps", "Record_P503B")
defineIndicatorLight("LMP_IFF_KD",302, "Lamps", "IFF_KD")
defineIndicatorLight("LMP_IFF_KP",303, "Lamps", "IFF_KP")
defineIndicatorLight("LMP_IFF_TURNONRESERVE",912, "Lamps", "IFF_TurnOnReserve")
defineIndicatorLight("LMP_IFF_FAILURE",87, "Lamps", "IFF_Failure")
BIOS.protocol.endModule()
