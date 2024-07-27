module("OH-58D", package.seeall)

local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class OH_58D: Module
local OH_58D = Module:new("OH-58D", 0x8A00, { "OH58D" })

local devices = {
	CONTROLS = 1,
	FUEL = 2,
	SENSORS = 3,
	FLIGHT_MODEL = 4,
	ENGINE = 5,
	RADIOALTIMETER = 6,
	ELECTRIC = 7,
	COCKPIT = 8,
	MISSION = 9,
	MPD = 10,
	RMFD = 11,
	SCAS = 12,
	HYDRAULIC = 13,
	MFK = 14,
	COMMON = 15,
	CLOCK = 16,
	FADEC = 17,
	AI = 18,
	PILOT = 19,
	COPILOT = 20,
	WEAPONS = 21,
	MMS = 22,
	LMFD = 23,
	RANGEFINDER = 24,
	IR_SEEKER = 25,
	SOUNDHOLDER = 26,
	RFD = 27,
	CSC_PILOT = 28,
	VFM1 = 29,
	UAM = 30,
	VAM = 31,
	VFM2 = 32,
	WCAS = 33,
	CSC_COPILOT = 34,
	RWR = 35,
	CI = 36,
	CMWS = 37,
	NVG = 38,
	M3P_LASER = 39,
	SYNC_DEVICE = 40,
	SYNC_MACHINE = 41,
	SYNC = 42,
	ODA_LEFT = 43,
	ODA_RIGHT = 44,
	L2_MUMS = 45,
	SYNC_MACHINE2 = 46,
	JVMF = 47,
	PDU = 48,
	AVR2 = 49,
	MACROS = 50,
	KNEEBOARD = 51,
}

local indicators = {
	MPD = 1,
	RPM_TGT_TRQ = 2,
	CLOCK = 7,
	RFI = 8,
	CMWS = 10,
}

--- @type { [string]: string }
local cockpit_params = {}

OH_58D:addExportHook(function(_)
	cockpit_params = Module.parse_cockpit_params()
end)

--- Adds a new output for the chiclet-style displays on the Kiowa
--- @param identifier string the unique identifier for the control
--- @param cockpit_parameter string the cockpit parameter for this chiclet
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param off_func (fun(): boolean)? determines whether the chiclet should not be shown because the display is off
function OH_58D:defineChiclet(identifier, cockpit_parameter, category, description, off_func)
	self:defineIntegerFromGetter(identifier, function(_)
		if off_func and off_func() then
			return 0
		end

		local val = tonumber(cockpit_params[cockpit_parameter]) or 0
		val = Module.cap(val, 0, 1) -- red chiclets go from 0-1.75 for some reason?
		return Module.valueConvert(val, { 0, 1 }, { 0, 65535 })
	end, 65535, category, description)
end

--- Adds a new output for the chiclet-style displays on the Kiowa
--- @param identifier string the unique identifier for the control
--- @param param_prefix string the start of the cockpit param names for this ladder
--- @param chiclet_index integer the index of the chiclet to display
--- @param category string the category in which the control should appear
--- @param ladder_description string a description of the ladder
--- @param color string the color of the chiclet
function OH_58D:defineLadderChiclet(identifier, param_prefix, chiclet_index, category, ladder_description, color)
	local name_prefix = param_prefix .. "_Ladder_vis"
	local cockpit_parameter = name_prefix .. tostring(chiclet_index)
	local description = ladder_description .. " Chiclet " .. tostring(chiclet_index + 1) .. " (" .. color .. ")"

	local off_func = function()
		local on_off = tonumber(cockpit_params[name_prefix .. "0"]) or 0
		-- the other chiclets continue to export, but shouldn't be shown if index 0 is off
		return on_off < 0.001
	end

	self:defineChiclet(identifier, cockpit_parameter, category, description, off_func)
end

-- Aircraft configuration (set in mission editor)
local CONFIGURATION = "Configuration"

OH_58D:defineIntegerFromGetter("CONFIGURATION_AN_ALQ_144", function(dev0)
	return dev0:get_argument_value(840) < 0 and 1 or 0
end, 1, CONFIGURATION, "AN/ALQ-144 Present")

OH_58D:defineIntegerFromGetter("CONFIGURATION_PILOT_DISPLAY_UNIT", function(dev0)
	return dev0:get_argument_value(839)
end, 1, CONFIGURATION, "Pilot Display Unit Present")

OH_58D:defineIntegerFromGetter("CONFIGURATION_DOORS", function(dev0)
	return dev0:get_argument_value(799) < 1 and 1 or 0
end, 1, CONFIGURATION, "Doors Present")

OH_58D:defineIntegerFromGetter("CONFIGURATION_PERSONAL_WEAPONS", function(dev0)
	return dev0:get_argument_value(600) > 0 and 1 or 0
end, 1, CONFIGURATION, "Personal Weapons Present")

-- Center post console (behind crew, between seats)
local CENTER_POST_CONSOLE = "Center Post Console"

-- row 1
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_HF", devices.ELECTRIC, 3008, 268, CENTER_POST_CONSOLE, "HF Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_FM", devices.ELECTRIC, 3118, 640, CENTER_POST_CONSOLE, "FM AMP Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_FM2", devices.ELECTRIC, 3119, 641, CENTER_POST_CONSOLE, "FM2 Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_VHF", devices.ELECTRIC, 3120, 642, CENTER_POST_CONSOLE, "VHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_UHF", devices.ELECTRIC, 3121, 643, CENTER_POST_CONSOLE, "UHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SATCOM_RT", devices.ELECTRIC, 3122, 644, CENTER_POST_CONSOLE, "SATCOM R/T Circuit Breaker")

-- row 2
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_ENG_ANTI_ICE", devices.ELECTRIC, 3113, 635, CENTER_POST_CONSOLE, "Engine Anti-ice Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_HF", devices.ELECTRIC, 3114, 636, CENTER_POST_CONSOLE, "SCTY HF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_UHF", devices.ELECTRIC, 3115, 637, CENTER_POST_CONSOLE, "SCTY UHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_VHF", devices.ELECTRIC, 3116, 638, CENTER_POST_CONSOLE, "SCTY VHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_IFF", devices.ELECTRIC, 3007, 269, CENTER_POST_CONSOLE, "IFF Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_IFF_CMPTR", devices.ELECTRIC, 3117, 639, CENTER_POST_CONSOLE, "IFF Computer Circuit Breaker")

-- row 3
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_RADAR_DETR", devices.ELECTRIC, 3005, 270, CENTER_POST_CONSOLE, "Radar Detector Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_RADAR_WARN", devices.ELECTRIC, 3006, 271, CENTER_POST_CONSOLE, "Radar Warning Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_RADAR_ALT", devices.ELECTRIC, 3110, 632, CENTER_POST_CONSOLE, "Radar Altimeter Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_BLOWER_COMPT", devices.ELECTRIC, 3111, 633, CENTER_POST_CONSOLE, "Blower Computer Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_CABIN_HTR", devices.ELECTRIC, 3112, 634, CENTER_POST_CONSOLE, "Cabin Heater Circuit Breaker")

-- row 4
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_IDM", devices.ELECTRIC, 3105, 627, CENTER_POST_CONSOLE, "IDM Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_ARMT_CONTR", devices.ELECTRIC, 3106, 628, CENTER_POST_CONSOLE, "Armament Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_SIGHT", devices.ELECTRIC, 3107, 629, CENTER_POST_CONSOLE, "Power Sight Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_LGUN", devices.ELECTRIC, 3108, 630, CENTER_POST_CONSOLE, "Power Left Gun Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_RKT", devices.ELECTRIC, 3109, 631, CENTER_POST_CONSOLE, "Power Rocket Circuit Breaker")

-- row 5
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_ARM", devices.ELECTRIC, 3099, 621, CENTER_POST_CONSOLE, "Hellfire Arm Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_CONTR", devices.ELECTRIC, 3100, 622, CENTER_POST_CONSOLE, "Hellfire Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_PWR", devices.ELECTRIC, 3101, 623, CENTER_POST_CONSOLE, "Hellfire Power Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_AC", devices.ELECTRIC, 3102, 624, CENTER_POST_CONSOLE, "Hellfire AC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_TAMS", devices.ELECTRIC, 3103, 625, CENTER_POST_CONSOLE, "TAMS Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SATCOM_AMP", devices.ELECTRIC, 3104, 626, CENTER_POST_CONSOLE, "SATCOM AMP Circuit Breaker")

-- row 6
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HUMS_28_VDC", devices.ELECTRIC, 3095, 617, CENTER_POST_CONSOLE, "HUMS 28 VDC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HDG_HOLD", devices.ELECTRIC, 3096, 618, CENTER_POST_CONSOLE, "Heading Hold Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_EL_LT", devices.ELECTRIC, 3097, 619, CENTER_POST_CONSOLE, "EL LT Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_L2MUM", devices.ELECTRIC, 3004, 272, CENTER_POST_CONSOLE, "L2MUM Power Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_26_VAC", devices.ELECTRIC, 3098, 620, CENTER_POST_CONSOLE, "26 VAC Circuit Breaker")

-- row 7
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCAS_28_VAC", devices.ELECTRIC, 3092, 614, CENTER_POST_CONSOLE, "SCAS 28 VAC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_STBY_ATT", devices.ELECTRIC, 3093, 615, CENTER_POST_CONSOLE, "Standby Attitude Indicator Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MCPU_BLWR", devices.ELECTRIC, 3094, 616, CENTER_POST_CONSOLE, "MCPU Blower Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PART_SEP", devices.ELECTRIC, 3001, 273, CENTER_POST_CONSOLE, "Particle Separator Circuit Breaker")

-- row 8
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_26_VAC", devices.ELECTRIC, 3088, 610, CENTER_POST_CONSOLE, "MMS 26 VAC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_DC_PWR", devices.ELECTRIC, 3089, 611, CENTER_POST_CONSOLE, "MMS DC Power Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_DC_CONTR", devices.ELECTRIC, 3090, 612, CENTER_POST_CONSOLE, "MMS DC Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_AC", devices.ELECTRIC, 3091, 613, CENTER_POST_CONSOLE, "MMS AC Circuit Breaker")

-- Overhead console (small detachment above the pilot)
local OVERHEAD_CONSOLE_PILOT = "Overhead Console (Pilot)"

OH_58D:defineToggleSwitch("PLT_OVERHEAD_IR_BEACON", devices.ELECTRIC, 3034, 274, OVERHEAD_CONSOLE_PILOT, "IR Beacon Switch")
OH_58D:definePotentiometer("PLT_OVERHEAD_FORMATION_LIGHTS", devices.ELECTRIC, 3029, 275, { 0, 1 }, OVERHEAD_CONSOLE_PILOT, "Formation Lights Brightness Dial")

OH_58D:defineToggleSwitch("PLT_OVERHEAD_IR_JAMMER_BASE", devices.ELECTRIC, 3054, 841, OVERHEAD_CONSOLE_PILOT, "IR Jammer Base Switch") -- present when AN/ALQ-144 installed
OH_58D:defineToggleSwitch("PLT_OVERHEAD_SW_CMWS", devices.ELECTRIC, 3033, 276, OVERHEAD_CONSOLE_PILOT, "CMWS Circuit Breaker Switch") -- present when AN/ALQ-144 NOT installed
OH_58D:defineToggleSwitch("PLT_OVERHEAD_CB_FUZZ_BNR", devices.ELECTRIC, 3031, 278, OVERHEAD_CONSOLE_PILOT, "Fuzz Burner Circuit Breaker Switch")
OH_58D:defineToggleSwitch("PLT_OVERHEAD_SW_BATT_CHGR", devices.ELECTRIC, 3032, 277, OVERHEAD_CONSOLE_PILOT, "Battery Charger Circuit Breaker Switch")

-- Overhead console (above crew, towards the rear)
local OVERHEAD_CONSOLE_REAR = "Overhead Console (Rear)"

-- row 1
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_INST_VS", devices.ELECTRIC, 3153, 675, OVERHEAD_CONSOLE_REAR, "INST VS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ENG_XDCR", devices.ELECTRIC, 3154, 676, OVERHEAD_CONSOLE_REAR, "Engine XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_XMSN_XDCR", devices.ELECTRIC, 3155, 677, OVERHEAD_CONSOLE_REAR, "Transmission XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ROTOR_XDCR", devices.ELECTRIC, 3156, 678, OVERHEAD_CONSOLE_REAR, "Rotor XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FUEL_QTY", devices.ELECTRIC, 3157, 679, OVERHEAD_CONSOLE_REAR, "Fuel Quantity Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MCPU_R", devices.ELECTRIC, 3158, 680, OVERHEAD_CONSOLE_REAR, "MCPU R Circuit Breaker")

-- row 2
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ICS_PLT", devices.ELECTRIC, 3147, 669, OVERHEAD_CONSOLE_REAR, "Pilot ICS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ICS_CPO", devices.ELECTRIC, 3148, 670, OVERHEAD_CONSOLE_REAR, "Copilot ICS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FM_1", devices.ELECTRIC, 3149, 671, OVERHEAD_CONSOLE_REAR, "FM 1 Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ADU", devices.ELECTRIC, 3150, 672, OVERHEAD_CONSOLE_REAR, "ADU Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_RFD", devices.ELECTRIC, 3151, 673, OVERHEAD_CONSOLE_REAR, "RFD Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MFD_PLT", devices.ELECTRIC, 3152, 674, OVERHEAD_CONSOLE_REAR, "Pilot MFD Circuit Breaker")

-- row 3
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_INV", devices.ELECTRIC, 3141, 663, OVERHEAD_CONSOLE_REAR, "Inverter Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_RECT", devices.ELECTRIC, 3142, 664, OVERHEAD_CONSOLE_REAR, "Rectifier Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DC_GEN_FIELD", devices.ELECTRIC, 3143, 665, OVERHEAD_CONSOLE_REAR, "DC Generator Field Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DC_GEN_RESET", devices.ELECTRIC, 3144, 666, OVERHEAD_CONSOLE_REAR, "DC Generator Reset Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ENG_OIL_BYPASS", devices.ELECTRIC, 3145, 667, OVERHEAD_CONSOLE_REAR, "Engine Oil Bypass Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_PITOT_HTR", devices.ELECTRIC, 3146, 668, OVERHEAD_CONSOLE_REAR, "Pitot Heater Circuit Breaker")

-- row 4
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_STBY_ATT", devices.ELECTRIC, 3135, 657, OVERHEAD_CONSOLE_REAR, "Standby Attitude Indicator Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_NVG_PWR", devices.ELECTRIC, 3136, 658, OVERHEAD_CONSOLE_REAR, "NVG Power Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_CKPT_LT", devices.ELECTRIC, 3137, 659, OVERHEAD_CONSOLE_REAR, "Cockpit Lights Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_POS_LT", devices.ELECTRIC, 3138, 660, OVERHEAD_CONSOLE_REAR, "Position Lights Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SRCH_LT_CONTR", devices.ELECTRIC, 3139, 661, OVERHEAD_CONSOLE_REAR, "Search Light Control Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SRCH_LT_PWR", devices.ELECTRIC, 3140, 662, OVERHEAD_CONSOLE_REAR, "Search Light Power Circuit Breaker")

-- row 5
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_HYD_SYS", devices.ELECTRIC, 3129, 651, OVERHEAD_CONSOLE_REAR, "Hydraulic System Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DATA_XFER", devices.ELECTRIC, 3130, 652, OVERHEAD_CONSOLE_REAR, "Data Transfer Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_JETT", devices.ELECTRIC, 3131, 653, OVERHEAD_CONSOLE_REAR, "Jettison Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FORCE_TRIM", devices.ELECTRIC, 3132, 654, OVERHEAD_CONSOLE_REAR, "Force Trim Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ANTI_COLL_LT", devices.ELECTRIC, 3133, 655, OVERHEAD_CONSOLE_REAR, "Anti-collision Light Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_BUS_INTCON", devices.ELECTRIC, 3134, 656, OVERHEAD_CONSOLE_REAR, "Bus Interconnect Circuit Breaker")

-- row 6
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SCAS_DC", devices.ELECTRIC, 3123, 645, OVERHEAD_CONSOLE_REAR, "SCAS DC Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_AIR_DATA", devices.ELECTRIC, 3124, 646, OVERHEAD_CONSOLE_REAR, "Air Data Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MAST_TRQ", devices.ELECTRIC, 3125, 647, OVERHEAD_CONSOLE_REAR, "Mast Torque Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_AIRBAG", devices.ELECTRIC, 3126, 648, OVERHEAD_CONSOLE_REAR, "Airbag Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_EGI", devices.ELECTRIC, 3127, 649, OVERHEAD_CONSOLE_REAR, "EGI Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MFD_CPO", devices.ELECTRIC, 3128, 650, OVERHEAD_CONSOLE_REAR, "Copilot MFD Circuit Breaker")

-- Overhead console (above crew, towards the front)
local OVERHEAD_CONSOLE_FRONT = "Overhead Console (Front)"

-- row 1
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_MCPU_L", devices.ELECTRIC, 3159, 681, OVERHEAD_CONSOLE_FRONT, "MCPU L Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_SW_FADEC", devices.ELECTRIC, 3002, 247, OVERHEAD_CONSOLE_FRONT, "FADEC Circuit Breaker Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_FUEL_BOOST", devices.ELECTRIC, 3160, 682, OVERHEAD_CONSOLE_FRONT, "Fuel Boost Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_START", devices.ELECTRIC, 3161, 683, OVERHEAD_CONSOLE_FRONT, "Start Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_SW_IGN", devices.ELECTRIC, 3003, 250, OVERHEAD_CONSOLE_FRONT, "Ignition Circuit Breaker Switch")

-- row 2
OH_58D:definePotentiometer("FRONT_OVERHEAD_CONSOLE_BRIGHTNESS", devices.ELECTRIC, 3011, 251, { 0, 0.8 }, OVERHEAD_CONSOLE_FRONT, "Console Lighting Brightness Dial")
OH_58D:definePotentiometer("FRONT_OVERHEAD_INSTRUMENT_BRIGHTNESS", devices.ELECTRIC, 3012, 252, { 0, 0.8 }, OVERHEAD_CONSOLE_FRONT, "Instrument Lighting Brightness Dial")

-- row 3
OH_58D:definePotentiometer("FRONT_OVERHEAD_FLOOD_BRIGHTNESS", devices.ELECTRIC, 3013, 253, { 0, 1 }, OVERHEAD_CONSOLE_FRONT, "Flood Light Brightness Dial")
OH_58D:define3PosTumb("FRONT_OVERHEAD_FLOOD_LIGHTS", devices.ELECTRIC, 3014, 279, OVERHEAD_CONSOLE_FRONT, "Flood Light Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_POSITION_LIGHTS", devices.ELECTRIC, 3010, 280, OVERHEAD_CONSOLE_FRONT, "Position Lights Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ANTI_COLL_LIGHTS", devices.ELECTRIC, 3009, 281, OVERHEAD_CONSOLE_FRONT, "Anti-Collision Lights Switch")

-- row 4
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_PITOT_HEAT", devices.ELECTRIC, 3015, 254, OVERHEAD_CONSOLE_FRONT, "Pitot Heater Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_HEATER", devices.ELECTRIC, 3016, 255, OVERHEAD_CONSOLE_FRONT, "Heater Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_DEFOG_L", devices.ELECTRIC, 3017, 256, OVERHEAD_CONSOLE_FRONT, "Left Defog Blower Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_DEFOG_R", devices.ELECTRIC, 3018, 257, OVERHEAD_CONSOLE_FRONT, "Right Defog Blower Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_COMPARTMENT_BLOWER", devices.ELECTRIC, 3019, 258, OVERHEAD_CONSOLE_FRONT, "Compartment Blower Switch")

-- row 5
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_IR_JAMMER_XMTR", devices.ELECTRIC, 3086, 842, OVERHEAD_CONSOLE_FRONT, "IR Jammer Xmit Switch") -- present when AN/ALQ-144 installed
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_FUEL_BOOST", devices.ELECTRIC, 3020, 259, OVERHEAD_CONSOLE_FRONT, "Fuel Boost Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ANTI_ICE", devices.ELECTRIC, 3021, 260, OVERHEAD_CONSOLE_FRONT, "Engine Anti Ice Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_OIL_BYPASS", devices.ELECTRIC, 3022, 261, OVERHEAD_CONSOLE_FRONT, "Engine Oil Bypass Switch")

-- row 6
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ESSENTIAL_BUS", devices.ELECTRIC, 3023, 262, OVERHEAD_CONSOLE_FRONT, "Essential Bus Run/Start Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_AC_GEN", devices.ELECTRIC, 3024, 263, OVERHEAD_CONSOLE_FRONT, "AC Generator Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_DC_GEN", devices.ELECTRIC, 3025, 264, OVERHEAD_CONSOLE_FRONT, "DC Generator Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_BATT_2", devices.ELECTRIC, 3026, 249, OVERHEAD_CONSOLE_FRONT, "Battery 2 Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_BATT_1", devices.ELECTRIC, 3027, 248, OVERHEAD_CONSOLE_FRONT, "Battery 1 Switch")

-- fuel shutoff
OH_58D:definePotentiometer("FRONT_OVERHEAD_FUEL_SHUTOFF", devices.FUEL, 3002, 245, { 0, 1 }, OVERHEAD_CONSOLE_FRONT, "Fuel Shutoff Lever")

-- Cyclic (Pilot)
local CYCLIC_PILOT = "Cyclic (Pilot)"

OH_58D:definePushButton("PLT_CYCLIC_FORCE_TRIM_INTERRUPT", devices.SYNC, 3101, 27, CYCLIC_PILOT, "Force Trim - Interrupt")
OH_58D:definePushButton("PLT_CYCLIC_SCAS_RELEASE", devices.SYNC, 3102, 29, CYCLIC_PILOT, "SCAS Release")
OH_58D:definePushButton("PLT_CYCLIC_MISSILE_ACTIVATE", devices.SYNC, 3109, 30, CYCLIC_PILOT, "Missile Activate (ATAS Only)")
OH_58D:definePushButton("PLT_CYCLIC_ODA", devices.SYNC, 3110, 34, CYCLIC_PILOT, "ODA Button")
OH_58D:definePushButton("PLT_CYCLIC_FLARE_DISPENSE", devices.CI, 3007, 41, CYCLIC_PILOT, "Flare Dispenser Button")
OH_58D:definePushButton("PLT_CYCLIC_MISSILE_STEP", devices.WEAPONS, 3013, 42, CYCLIC_PILOT, "Missile Step Button")
OH_58D:definePushButton("PLT_CYCLIC_HOVER_WAYPOINT", devices.SYNC, 3111, 51, CYCLIC_PILOT, "Hover Bob-Up/Wpt Drop Button")
OH_58D:defineToggleSwitch("PLT_CYCLIC_WEAPON_FIRE_COVER", devices.WEAPONS, 3014, 52, CYCLIC_PILOT, "Weapon Fire Cover")
OH_58D:definePushButton("PLT_CYCLIC_WEAPON_FIRE", devices.WEAPONS, 3015, 70, CYCLIC_PILOT, "Weapon Fire Button")
OH_58D:definePushButton("PLT_CYCLIC_ICS", devices.SYNC, 3095, 71, CYCLIC_PILOT, "ICS Radio Button")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_WEAPON_SELECT_UD", devices.RMFD, 3030, 3031, 90, CYCLIC_PILOT, "Weapon Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_WEAPON_SELECT_LR", devices.RMFD, 3032, 3033, 91, CYCLIC_PILOT, "Weapon Select Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_DISPLAY_SELECT_UD", devices.RMFD, 3034, 3035, 92, CYCLIC_PILOT, "Display Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_DISPLAY_SELECT_LR", devices.RMFD, 3036, 3037, 93, CYCLIC_PILOT, "Display Select Switch Left/Right")

-- Cyclic (Copilot)
local CYCLIC_COPILOT = "Cyclic (Copilot)"

-- OH_58D:definePushButton("CPLT_CYCLIC_AREA_TRACK", devices.MMS, 3022, 32, CYCLIC_COPILOT, "Area Track")
OH_58D:reserveIntValue(1) -- area track not fully clickable
OH_58D:definePushButton("CPLT_CYCLIC_LASER", devices.MMS, 3024, 35, CYCLIC_COPILOT, "Fire Laser")
OH_58D:definePushButton("CPLT_CYCLIC_POINT_TRACK", devices.MMS, 3021, 48, CYCLIC_COPILOT, "Point Track")
-- OH_58D:defineSpringloaded_3PosTumb("CPLT_CYCLIC_NAV_TARGET_DESIGNATE", devices.MMS, 3026, 3026, 43, CYCLIC_COPILOT, "Nav/Target Designate Switch")
OH_58D:reserveIntValue(2) -- nav/target designate not fully working currently

-- Collective (Pilot)
local COLLECTIVE_PILOT = "Collective (Pilot)"

OH_58D:definePushButton("PLT_COLLECTIVE_START", devices.ELECTRIC, 3028, 7, COLLECTIVE_PILOT, "Start Switch")
OH_58D:definePushButton("PLT_COLLECTIVE_THROTTLE_IDLE_RELEASE", devices.FUEL, 3009, 9, COLLECTIVE_PILOT, "Throttle Idle Release Switch")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_ENGINE_RPM_TRIM", devices.ENGINE, 3001, 3002, 15, COLLECTIVE_PILOT, "Engine Rpm Trim")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_CHANNEL_SEL_UD", devices.SYNC, 3070, 3069, 12, COLLECTIVE_PILOT, "Channel Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_CHANNEL_SEL_LR", devices.SYNC, 3071, 3072, 13, COLLECTIVE_PILOT, "Channel Select Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_13", devices.SYNC, 3075, 3073, 14, COLLECTIVE_PILOT, "Radio Select Switch 1/3")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_24", devices.SYNC, 3074, 3074, 16, COLLECTIVE_PILOT, "Radio Select Switch 2/4")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_5", devices.SYNC, 3076, 3076, 17, COLLECTIVE_PILOT, "Radio Select Switch 5") -- seems like this should just be a push button, but is in game as a 3-position switch
OH_58D:reserveIntValue(1) -- reserve an extra space in case we need to make this a push button in the future
OH_58D:defineToggleSwitch("PLT_COLLECTIVE_EMERGENCY_JETTISON_COVER", devices.CI, 3010, 46, COLLECTIVE_PILOT, "Emergency Jettison Cover")
OH_58D:definePushButton("PLT_COLLECTIVE_EMERGENCY_JETTISON", devices.CI, 3011, 47, COLLECTIVE_PILOT, "Emergency Jettison (Launch All)")
OH_58D:defineToggleSwitch("PLT_COLLECTIVE_SEARCHLIGHT", devices.ELECTRIC, 3036, 98, COLLECTIVE_PILOT, "Searchlight Switch")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT_UD", devices.ELECTRIC, 3037, 3038, 94, COLLECTIVE_PILOT, "Searchlight Control Switch Extend/Retract")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT_LR", devices.ELECTRIC, 3039, 3040, 95, COLLECTIVE_PILOT, "Searchlight Control Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SCAS_ENGAGE", devices.SCAS, 3007, 3008, 96, COLLECTIVE_PILOT, "SCAS Heading Hold Switch Engage/Disengage")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SCAS_TRIM_LR", devices.SCAS, 3009, 3010, 97, COLLECTIVE_PILOT, "SCAS Heading Hold Switch Trim Left/Trim Right")
OH_58D:definePushButton("PLT_COLLECTIVE_IZLID", devices.SYNC, 3046, 49, COLLECTIVE_PILOT, "IZLID (Gun Laser)")

-- Ignition Panel
local IGNITION_PANEL = "Ignition Panel"

OH_58D:defineToggleSwitch("IGNITION_KEY", devices.ELECTRIC, 3035, 50, IGNITION_PANEL, "Ignition Keylock Switch")

-- CMWS Panel
local CMWS_PANEL = "CMWS Panel"

OH_58D:defineToggleSwitch("CMWS_ARM", devices.CI, 3005, 44, CMWS_PANEL, "Arm/Safe Switch")
OH_58D:defineToggleSwitch("CMWS_BYPASS", devices.CI, 3006, 45, CMWS_PANEL, "Auto/Bypass Switch")

-- CSC (Pilot)
local CSC_PILOT = "CSC (Pilot)"

OH_58D:definePotentiometer("PLT_CSC_VOLUME", devices.SYNC, 3051, 173, { 0, 0.8 }, CSC_PILOT, "Volume Control Knob")
OH_58D:defineToggleSwitch("PLT_CSC_RADIO_1_INHIBIT", devices.SYNC, 3052, 174, CSC_PILOT, "Radio Monitor 1 [FM1] Inhibit On/Off")
-- volume commands disabled as they aren't properly implemented in the module
-- OH_58D:definePotentiometer("PLT_CSC_RADIO_1_VOLUME", devices.SYNC, 3053, 175, { 0, 0.8 }, CSC_PILOT, "Radio Monitor 1 [FM1] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:defineToggleSwitch("PLT_CSC_RADIO_2_INHIBIT", devices.SYNC, 3054, 176, CSC_PILOT, "Radio Monitor 2 [UHF] Inhibit On/Off")
-- OH_58D:definePotentiometer("PLT_CSC_RADIO_2_VOLUME", devices.SYNC, 3055, 177, { 0, 0.8 }, CSC_PILOT, "Radio Monitor 2 [UHF] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:defineToggleSwitch("PLT_CSC_RADIO_3_INHIBIT", devices.SYNC, 3056, 178, CSC_PILOT, "Radio Monitor 3 [VHF] Inhibit On/Off")
-- OH_58D:definePotentiometer("PLT_CSC_RADIO_3_VOLUME", devices.SYNC, 3057, 179, { 0, 0.8 }, CSC_PILOT, "Radio Monitor 3 [VHF] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:defineToggleSwitch("PLT_CSC_RADIO_4_INHIBIT", devices.SYNC, 3058, 180, CSC_PILOT, "Radio Monitor 4 [N/A] Inhibit On/Off")
-- OH_58D:definePotentiometer("PLT_CSC_RADIO_4_VOLUME", devices.SYNC, 3059, 181, { 0, 0.8 }, CSC_PILOT, "Radio Monitor 4 [N/A] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:defineToggleSwitch("PLT_CSC_RADIO_5_INHIBIT", devices.SYNC, 3060, 182, CSC_PILOT, "Radio Monitor 5 [FM2] Inhibit On/Off")
-- OH_58D:definePotentiometer("PLT_CSC_RADIO_5_VOLUME", devices.SYNC, 3061, 183, { 0, 0.8 }, CSC_PILOT, "Radio Monitor 5 [FM2] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:definePotentiometer("PLT_CSC_NAV_A_VOLUME", devices.SYNC, 3062, 184, { 0, 0.8 }, CSC_PILOT, "Radio Monitor NAV A Audio Ouput")
OH_58D:definePotentiometer("PLT_CSC_NAV_B_VOLUME", devices.SYNC, 3063, 185, { 0, 0.8 }, CSC_PILOT, "Radio Monitor NAV B Audio Ouput")
OH_58D:defineMultipositionSwitch("PLT_CSC_ICS_MODE", devices.SYNC, 3064, 186, 4, 0.1, CSC_PILOT, "ICS Rotary Switch")
OH_58D:definePotentiometer("PLT_CSC_VOX", devices.SYNC, 3065, 187, { 0, 0.8 }, CSC_PILOT, "Vox Control")
OH_58D:defineMultipositionSwitch("PLT_CSC_TRANSMIT_SELECTOR", devices.SYNC, 3066, 188, 8, 0.1, CSC_PILOT, "Transmit Selector Switch")
OH_58D:defineToggleSwitch("PLT_CSC_MIC", devices.SYNC, 3067, 189, CSC_PILOT, "MIC Switch")

-- CSC (Copilot)
local CSC_COPILOT = "CSC (Copilot)"

OH_58D:definePotentiometer("CPLT_CSC_VOLUME", devices.SYNC, 3121, 812, { 0, 0.8 }, CSC_COPILOT, "Volume Control Knob")
OH_58D:defineToggleSwitch("CPLT_CSC_RADIO_1_INHIBIT", devices.SYNC, 3122, 813, CSC_COPILOT, "Radio Monitor 1 [FM1] Inhibit On/Off")
-- volume commands disabled as they aren't properly implemented in the module
-- OH_58D:definePotentiometer("CPLT_CSC_RADIO_1_VOLUME", devices.SYNC, 3123, 814, { 0, 0.8 }, CSC_COPILOT, "Radio Monitor 1 [FM1] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:defineToggleSwitch("CPLT_CSC_RADIO_2_INHIBIT", devices.SYNC, 3124, 816, CSC_COPILOT, "Radio Monitor 2 [UHF] Inhibit On/Off")
-- OH_58D:definePotentiometer("CPLT_CSC_RADIO_2_VOLUME", devices.SYNC, 3125, 817, { 0, 0.8 }, CSC_COPILOT, "Radio Monitor 2 [UHF] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:defineToggleSwitch("CPLT_CSC_RADIO_3_INHIBIT", devices.SYNC, 3126, 818, CSC_COPILOT, "Radio Monitor 3 [VHF] Inhibit On/Off")
-- OH_58D:definePotentiometer("CPLT_CSC_RADIO_3_VOLUME", devices.SYNC, 3127, 819, { 0, 0.8 }, CSC_COPILOT, "Radio Monitor 3 [VHF] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:defineToggleSwitch("CPLT_CSC_RADIO_4_INHIBIT", devices.SYNC, 3128, 820, CSC_COPILOT, "Radio Monitor 4 [N/A] Inhibit On/Off")
-- OH_58D:definePotentiometer("CPLT_CSC_RADIO_4_VOLUME", devices.SYNC, 3129, 821, { 0, 0.8 }, CSC_COPILOT, "Radio Monitor 4 [N/A] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:defineToggleSwitch("CPLT_CSC_RADIO_5_INHIBIT", devices.SYNC, 3130, 822, CSC_COPILOT, "Radio Monitor 5 [FM2] Inhibit On/Off")
-- OH_58D:definePotentiometer("CPLT_CSC_RADIO_5_VOLUME", devices.SYNC, 3131, 823, { 0, 0.8 }, CSC_COPILOT, "Radio Monitor 5 [FM2] Audio Ouput")
OH_58D:reserveIntValue(65535)
OH_58D:definePotentiometer("CPLT_CSC_NAV_A_VOLUME", devices.SYNC, 3132, 825, { 0, 0.8 }, CSC_COPILOT, "Radio Monitor NAV A Audio Ouput")
OH_58D:definePotentiometer("CPLT_CSC_NAV_B_VOLUME", devices.SYNC, 3133, 827, { 0, 0.8 }, CSC_COPILOT, "Radio Monitor NAV B Audio Ouput")
OH_58D:defineMultipositionSwitch("CPLT_CSC_ICS_MODE", devices.SYNC, 3134, 828, 4, 0.1, CSC_COPILOT, "ICS Rotary Switch")
OH_58D:definePotentiometer("CPLT_CSC_VOX", devices.SYNC, 3135, 830, { 0, 0.8 }, CSC_COPILOT, "Vox Control")
OH_58D:defineMultipositionSwitch("CPLT_CSC_TRANSMIT_SELECTOR", devices.SYNC, 3136, 831, 8, 0.1, CSC_COPILOT, "Transmit Selector Switch")
OH_58D:defineToggleSwitch("CPLT_CSC_MIC", devices.SYNC, 3137, 832, CSC_COPILOT, "MIC Switch")

-- Remote ICS Panel
local REMOTE_ICS_PANEL = "Remote ICS Panel"

OH_58D:define3PosTumb("REMOTE_ICS", devices.SYNC, 3068, 190, REMOTE_ICS_PANEL, "Remote ICS Switch")

-- Armament Control Panel
local ARMAMENT_PANEL = "Armament Control Panel"

OH_58D:defineToggleSwitch("ARMAMENT_JETTISON_COVER_L", devices.WEAPONS, 3001, 167, ARMAMENT_PANEL, "Left Pylon Jettison Switch Guard")
OH_58D:defineToggleSwitch("ARMAMENT_JETTISON_COVER_R", devices.WEAPONS, 3002, 168, ARMAMENT_PANEL, "Right Pylon Jettison Switch Guard")
OH_58D:defineToggleSwitch("ARMAMENT_JETTISON_L", devices.WEAPONS, 3003, 169, ARMAMENT_PANEL, "Left Pylon Jettison Switch")
OH_58D:defineToggleSwitch("ARMAMENT_JETTISON_R", devices.WEAPONS, 3004, 170, ARMAMENT_PANEL, "Right Pylon Jettison Switch")
OH_58D:define3PosTumb("ARMAMENT_MASTER_ARM", devices.WEAPONS, 3005, 171, ARMAMENT_PANEL, "Master Switch")
OH_58D:defineSpringloaded_3PosTumb("ARMAMENT_GUN", devices.WEAPONS, 3006, 3012, 172, ARMAMENT_PANEL, "Gun Switch")
OH_58D:defineGatedIndicatorLight("ARMAMENT_STBY", 584, 0.4, 0.6, ARMAMENT_PANEL, "STBY Lamp (white)")
OH_58D:defineGatedIndicatorLight("ARMAMENT_ARMED", 584, 1, nil, ARMAMENT_PANEL, "ARMED Lamp (white)")

-- Multifunction Keyboard (MFK)
local MFK = "Multifunction Keyboard"

OH_58D:defineSpringloaded_3PosTumb("MFK_ACKNOWLEDGE_RECALL", devices.MFK, 3001, 3096, 192, MFK, "Acknowledge/Recall Switch")
OH_58D:defineToggleSwitch("MFK_ZEROIZE_COVER", devices.MFK, 3002, 193, MFK, "Zeroize Switch Guard")
OH_58D:defineToggleSwitch("MFK_EMERGENCY_COVER", devices.MFK, 3003, 194, MFK, "Emergency Switch Guard")
OH_58D:defineToggleSwitch("MFK_ZEROIZE", devices.MFK, 3004, 195, MFK, "Zeroize Switch")
OH_58D:defineToggleSwitch("MFK_EMERGENCY", devices.MFK, 3005, 196, MFK, "Emergency Switch")
OH_58D:definePushButton("MFK_1", devices.MFK, 3006, 197, MFK, "Num 1")
OH_58D:definePushButton("MFK_2", devices.MFK, 3007, 198, MFK, "Num 2")
OH_58D:definePushButton("MFK_3", devices.MFK, 3008, 199, MFK, "Num 3")
OH_58D:definePushButton("MFK_4", devices.MFK, 3009, 200, MFK, "Num 4")
OH_58D:definePushButton("MFK_5", devices.MFK, 3010, 201, MFK, "Num 5")
OH_58D:definePushButton("MFK_6", devices.MFK, 3011, 202, MFK, "Num 6")
OH_58D:definePushButton("MFK_7", devices.MFK, 3012, 203, MFK, "Num 7")
OH_58D:definePushButton("MFK_8", devices.MFK, 3013, 204, MFK, "Num 8")
OH_58D:definePushButton("MFK_9", devices.MFK, 3014, 205, MFK, "Num 9")
OH_58D:definePushButton("MFK_0", devices.MFK, 3015, 206, MFK, "Num 0")
OH_58D:definePushButton("MFK_DOT", devices.MFK, 3016, 207, MFK, "Num Decimal")
OH_58D:definePushButton("MFK_CLR", devices.MFK, 3017, 208, MFK, "Line Clear")
OH_58D:definePushButton("MFK_IFF", devices.MFK, 3018, 209, MFK, "IFF")
OH_58D:definePushButton("MFK_TUNE", devices.MFK, 3019, 210, MFK, "Tune")
OH_58D:definePushButton("MFK_SCAN", devices.MFK, 3020, 211, MFK, "Scan")
OH_58D:definePushButton("MFK_BLANK", devices.MFK, 3021, 212, MFK, "Space")
OH_58D:definePushButton("MFK_IDNT", devices.MFK, 3022, 213, MFK, "Ident")
OH_58D:definePushButton("MFK_ENTER", devices.MFK, 3023, 214, MFK, "Enter")
OH_58D:definePushButton("MFK_MINUS", devices.MFK, 3024, 215, MFK, "Minus/Hyphen")
OH_58D:definePushButton("MFK_A", devices.MFK, 3025, 216, MFK, "Alpha A")
OH_58D:definePushButton("MFK_B", devices.MFK, 3026, 217, MFK, "Alpha B")
OH_58D:definePushButton("MFK_C", devices.MFK, 3027, 218, MFK, "Alpha C")
OH_58D:definePushButton("MFK_D", devices.MFK, 3028, 219, MFK, "Alpha D")
OH_58D:definePushButton("MFK_E", devices.MFK, 3029, 220, MFK, "Alpha E")
OH_58D:definePushButton("MFK_F", devices.MFK, 3030, 221, MFK, "Alpha F")
OH_58D:definePushButton("MFK_G", devices.MFK, 3031, 222, MFK, "Alpha G")
OH_58D:definePushButton("MFK_H", devices.MFK, 3032, 223, MFK, "Alpha H")
OH_58D:definePushButton("MFK_I", devices.MFK, 3033, 224, MFK, "Alpha I")
OH_58D:definePushButton("MFK_J", devices.MFK, 3034, 225, MFK, "Alpha J")
OH_58D:definePushButton("MFK_K", devices.MFK, 3035, 226, MFK, "Alpha K")
OH_58D:definePushButton("MFK_L", devices.MFK, 3036, 227, MFK, "Alpha L")
OH_58D:definePushButton("MFK_M", devices.MFK, 3037, 228, MFK, "Alpha M")
OH_58D:definePushButton("MFK_N", devices.MFK, 3038, 229, MFK, "Alpha N")
OH_58D:definePushButton("MFK_O", devices.MFK, 3039, 230, MFK, "Alpha O")
OH_58D:definePushButton("MFK_P", devices.MFK, 3040, 231, MFK, "Alpha P")
OH_58D:definePushButton("MFK_Q", devices.MFK, 3041, 232, MFK, "Alpha Q")
OH_58D:definePushButton("MFK_R", devices.MFK, 3042, 233, MFK, "Alpha R")
OH_58D:definePushButton("MFK_S", devices.MFK, 3043, 234, MFK, "Alpha S")
OH_58D:definePushButton("MFK_T", devices.MFK, 3044, 235, MFK, "Alpha T")
OH_58D:definePushButton("MFK_U", devices.MFK, 3045, 236, MFK, "Alpha U")
OH_58D:definePushButton("MFK_V", devices.MFK, 3046, 237, MFK, "Alpha V")
OH_58D:definePushButton("MFK_W", devices.MFK, 3047, 238, MFK, "Alpha W")
OH_58D:definePushButton("MFK_X", devices.MFK, 3048, 239, MFK, "Alpha X")
OH_58D:definePushButton("MFK_Y", devices.MFK, 3049, 240, MFK, "Alpha Y")
OH_58D:definePushButton("MFK_Z", devices.MFK, 3050, 241, MFK, "Alpha Z")
OH_58D:definePushButton("MFK_ARROW_LEFT", devices.MFK, 3051, 242, MFK, "Arrow Left (Backspace)")
OH_58D:definePushButton("MFK_ARROW_RIGHT", devices.MFK, 3052, 243, MFK, "Arrow Right (Space)")

-- SCAS Control Panel
local SCAS_PANEL = "SCAS Control Panel"

OH_58D:defineToggleSwitch("SCAS_FORCE_TRIM", devices.SCAS, 3001, 161, SCAS_PANEL, "Force Trim Switch")
OH_58D:defineToggleSwitch("SCAS_HYDRAULIC_SYSTEM", devices.SCAS, 3002, 162, SCAS_PANEL, "Hydraulic System Switch")
OH_58D:defineToggleSwitch("SCAS_PITCH_ROLL", devices.SCAS, 3003, 163, SCAS_PANEL, "Pitch/Roll Engage Switch")
OH_58D:defineToggleSwitch("SCAS_YAW", devices.SCAS, 3004, 164, SCAS_PANEL, "Yaw Engage Switch")
OH_58D:defineToggleSwitch("SCAS_POWER", devices.SCAS, 3005, 165, SCAS_PANEL, "Power Switch")
OH_58D:definePushButton("SCAS_TEST", devices.SCAS, 3006, 166, SCAS_PANEL, "Test Button")

-- Multiparameter Display (MPD)
local MPD = "MPD"

local mpd = {}

OH_58D:addExportHook(function(_)
	mpd = Module.parse_indication(indicators.MPD)
end)

OH_58D:definePushButton("MPD_MFD_BACKUP", devices.MPD, 3001, 121, MPD, "Multifunction Display Backup Button")
OH_58D:defineSpringloaded_3PosTumb("MPD_BIT", devices.MPD, 3002, 3006, 118, MPD, "BIT/Reset Switch")
OH_58D:defineSpringloaded_3PosTumb("MPD_TEST", devices.MPD, 3003, 3003, 119, MPD, "Test/Digit Switch")
OH_58D:defineSpringloaded_3PosTumb("MPD_SELECT", devices.MPD, 3004, 3004, 120, MPD, "Select Switch")
OH_58D:definePotentiometer("MPD_BRIGHTNESS", devices.MPD, 3005, 122, { 0, 1 }, MPD, "Brightness Dial")

local NG_MAP = {
	["PN"] = "Pn",
	["ERR"] = "Err",
}

OH_58D:defineString("MPD_NG_DISPLAY", function(_)
	local text = mpd["NGParamDisplay"]
	text = NG_MAP[text] or text

	return Functions.pad_left(text, 4)
end, 4, MPD, "NG Display (no decimal)")

OH_58D:defineString("MPD_NG_DISPLAY_DECIMAL", function(_)
	local mpd_text = mpd["NGParamDisplay"] -- only show decimal if mpd text is a number
	return tonumber(mpd_text) and Functions.coerce_nil_to_string(mpd["NGParamDisplayPoint"]) or ""
end, 1, MPD, "NG Display (decimal point only)")

OH_58D:defineString("MPD_NG_DISPLAY_FULL", function(_)
	local text = Functions.pad_left(mpd["NGParamDisplay"], 4)
	local decimal = mpd["NGParamDisplayPoint"]

	-- if there's no decimal or numbers is actually text (Pn, Err) then return
	if not decimal or not tonumber(text) then
		return NG_MAP[text] or text
	end

	return text:sub(1, #text - 1) .. decimal .. text:sub(#text)
end, 5, MPD, "NG Display (including decimal if present)")

OH_58D:defineString("MPD_DISPLAY_L", function(_)
	return Functions.pad_left(mpd["LeftParamDisplay"], 3)
end, 3, MPD, "Left Parameter Display")

OH_58D:defineString("MPD_DISPLAY_R", function(_)
	return Functions.pad_left(mpd["RightParamDisplay"], 3)
end, 3, MPD, "Right Parameter Display")

OH_58D:defineIntegerFromGetter("MPD_WARN", function(_)
	local visibility = tonumber(cockpit_params["BIT_vis"])
	return visibility and visibility > 0 and 1 or 0
end, 1, MPD, "Warn Lamp (Yellow)")

-- Transmission Oil Pressure
local XMSN_OIL_PRESS = "TRANSOILPRESS"
local XMSN_OIL_PRESS_DESCRIPTION = "XMSN Oil Pressure"

OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_1", XMSN_OIL_PRESS, 0, MPD, XMSN_OIL_PRESS_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_2", XMSN_OIL_PRESS, 1, MPD, XMSN_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_3", XMSN_OIL_PRESS, 2, MPD, XMSN_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_4", XMSN_OIL_PRESS, 3, MPD, XMSN_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_5", XMSN_OIL_PRESS, 4, MPD, XMSN_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_6", XMSN_OIL_PRESS, 5, MPD, XMSN_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_7", XMSN_OIL_PRESS, 6, MPD, XMSN_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_8", XMSN_OIL_PRESS, 7, MPD, XMSN_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_9", XMSN_OIL_PRESS, 8, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_10", XMSN_OIL_PRESS, 9, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_11", XMSN_OIL_PRESS, 10, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_12", XMSN_OIL_PRESS, 11, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_13", XMSN_OIL_PRESS, 12, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_14", XMSN_OIL_PRESS, 13, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_15", XMSN_OIL_PRESS, 14, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_16", XMSN_OIL_PRESS, 15, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_PRESSURE_17", XMSN_OIL_PRESS, 16, MPD, XMSN_OIL_PRESS_DESCRIPTION, "green")

-- Transmission Oil Temperature
local XMSN_OIL_TEMP = "TRANSOILTEMP"
local XMSN_OIL_TEMP_DESCRIPTION = "XMSN Oil Temperature"

OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_1", XMSN_OIL_TEMP, 0, MPD, XMSN_OIL_TEMP_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_2", XMSN_OIL_TEMP, 1, MPD, XMSN_OIL_TEMP_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_3", XMSN_OIL_TEMP, 2, MPD, XMSN_OIL_TEMP_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_4", XMSN_OIL_TEMP, 3, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_5", XMSN_OIL_TEMP, 4, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_6", XMSN_OIL_TEMP, 5, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_7", XMSN_OIL_TEMP, 6, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_8", XMSN_OIL_TEMP, 7, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_9", XMSN_OIL_TEMP, 8, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_10", XMSN_OIL_TEMP, 9, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_11", XMSN_OIL_TEMP, 10, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_12", XMSN_OIL_TEMP, 11, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_13", XMSN_OIL_TEMP, 12, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_14", XMSN_OIL_TEMP, 13, MPD, XMSN_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_15", XMSN_OIL_TEMP, 14, MPD, XMSN_OIL_TEMP_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_16", XMSN_OIL_TEMP, 15, MPD, XMSN_OIL_TEMP_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_XMSN_OIL_TEMP_17", XMSN_OIL_TEMP, 16, MPD, XMSN_OIL_TEMP_DESCRIPTION, "red")

-- Engine Oil Pressure
local ENG_OIL_PRESS = "ENGOILPRESS"
local ENG_OIL_PRESS_DESCRIPTION = "Engine Oil Pressure"

OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_1", ENG_OIL_PRESS, 0, MPD, ENG_OIL_PRESS_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_2", ENG_OIL_PRESS, 1, MPD, ENG_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_3", ENG_OIL_PRESS, 2, MPD, ENG_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_4", ENG_OIL_PRESS, 3, MPD, ENG_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_5", ENG_OIL_PRESS, 4, MPD, ENG_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_6", ENG_OIL_PRESS, 5, MPD, ENG_OIL_PRESS_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_7", ENG_OIL_PRESS, 6, MPD, ENG_OIL_PRESS_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_8", ENG_OIL_PRESS, 7, MPD, ENG_OIL_PRESS_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_9", ENG_OIL_PRESS, 8, MPD, ENG_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_10", ENG_OIL_PRESS, 9, MPD, ENG_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_11", ENG_OIL_PRESS, 10, MPD, ENG_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_12", ENG_OIL_PRESS, 11, MPD, ENG_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_13", ENG_OIL_PRESS, 12, MPD, ENG_OIL_PRESS_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_14", ENG_OIL_PRESS, 13, MPD, ENG_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_15", ENG_OIL_PRESS, 14, MPD, ENG_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_16", ENG_OIL_PRESS, 15, MPD, ENG_OIL_PRESS_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_PRESSURE_17", ENG_OIL_PRESS, 16, MPD, ENG_OIL_PRESS_DESCRIPTION, "red")

-- Engine Oil Temperature
local ENG_OIL_TEMP = "ENGOILTEMP"
local ENG_OIL_TEMP_DESCRIPTION = "Engine Oil Temp"

OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_1", ENG_OIL_TEMP, 0, MPD, ENG_OIL_TEMP_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_2", ENG_OIL_TEMP, 1, MPD, ENG_OIL_TEMP_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_3", ENG_OIL_TEMP, 2, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_4", ENG_OIL_TEMP, 3, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_5", ENG_OIL_TEMP, 4, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_6", ENG_OIL_TEMP, 5, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_7", ENG_OIL_TEMP, 6, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_8", ENG_OIL_TEMP, 7, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_9", ENG_OIL_TEMP, 8, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_10", ENG_OIL_TEMP, 9, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_11", ENG_OIL_TEMP, 10, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_12", ENG_OIL_TEMP, 11, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_13", ENG_OIL_TEMP, 12, MPD, ENG_OIL_TEMP_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_14", ENG_OIL_TEMP, 13, MPD, ENG_OIL_TEMP_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_15", ENG_OIL_TEMP, 14, MPD, ENG_OIL_TEMP_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_16", ENG_OIL_TEMP, 15, MPD, ENG_OIL_TEMP_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_ENG_OIL_TEMP_17", ENG_OIL_TEMP, 16, MPD, ENG_OIL_TEMP_DESCRIPTION, "red")

-- Fuel Quantity
local FUEL_QTY = "FUELQTY"
local FUEL_QTY_DESCRIPTION = "Fuel Quantity"

OH_58D:defineLadderChiclet("MPD_FUEL_QTY_1", FUEL_QTY, 0, MPD, FUEL_QTY_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_2", FUEL_QTY, 1, MPD, FUEL_QTY_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_3", FUEL_QTY, 2, MPD, FUEL_QTY_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_4", FUEL_QTY, 3, MPD, FUEL_QTY_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_5", FUEL_QTY, 4, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_6", FUEL_QTY, 5, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_7", FUEL_QTY, 6, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_8", FUEL_QTY, 7, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_9", FUEL_QTY, 8, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_10", FUEL_QTY, 9, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_11", FUEL_QTY, 10, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_12", FUEL_QTY, 11, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_13", FUEL_QTY, 12, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_14", FUEL_QTY, 13, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_15", FUEL_QTY, 14, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_16", FUEL_QTY, 15, MPD, FUEL_QTY_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_FUEL_QTY_17", FUEL_QTY, 16, MPD, FUEL_QTY_DESCRIPTION, "green")

-- Fuel Quantity
local NG_PERCENT = "NG_PERCENT"
local NG_PERCENT_DESCRIPTION = "NG Percent"

OH_58D:defineLadderChiclet("MPD_NG_1", NG_PERCENT, 0, MPD, NG_PERCENT_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("MPD_NG_2", NG_PERCENT, 1, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_3", NG_PERCENT, 2, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_4", NG_PERCENT, 3, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_5", NG_PERCENT, 4, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_6", NG_PERCENT, 5, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_7", NG_PERCENT, 6, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_8", NG_PERCENT, 7, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_9", NG_PERCENT, 8, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_10", NG_PERCENT, 9, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_11", NG_PERCENT, 10, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_12", NG_PERCENT, 11, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_13", NG_PERCENT, 12, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_14", NG_PERCENT, 13, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_15", NG_PERCENT, 14, MPD, NG_PERCENT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("MPD_NG_16", NG_PERCENT, 15, MPD, NG_PERCENT_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("MPD_NG_17", NG_PERCENT, 16, MPD, NG_PERCENT_DESCRIPTION, "red")

-- Selector
OH_58D:defineChiclet("MPD_SEL_1", "BATTV_STARTV_vis", MPD, "Battery/Starter Voltage Chiclet (green)")
OH_58D:defineChiclet("MPD_SEL_2", "RECTLD_SGENLD_vis", MPD, "Rectifier/Generator Load Chiclet (green)")
OH_58D:defineChiclet("MPD_SEL_3", "ACV_RECTV_vis", MPD, "AC/Rectifier Voltage Chiclet (green)")
OH_58D:defineChiclet("MPD_SEL_4", "FUELQTY_ENGTRQ_vis", MPD, "Fuel Quantity/Engine Torque Chiclet (green)")
OH_58D:defineChiclet("MPD_SEL_5", "NG_NP_vis", MPD, "NG/NP Chiclet (green)")

-- Air Vent Control
local AIR_VENT_CONTROL = "Air Vent Control"

OH_58D:definePotentiometer("AIR_VENT_PLT", devices.SYNC, 3149, 860, { 0, 1 }, AIR_VENT_CONTROL, "Pilot Air Vent Pull")
OH_58D:definePotentiometer("AIR_VENT_CPLT", devices.SYNC, 3150, 861, { 0, 1 }, AIR_VENT_CONTROL, "Copilot Air Vent Pull")

-- Standby Attitude Indicator
local SAI = "Standby Attitude Indicator"

OH_58D:definePushButton("SAI_CAGE", devices.SENSORS, 3003, 58, SAI, "Adjustment Knob (Uncage)")
OH_58D:defineRotary("SAI_TRIM_KNOB", devices.SENSORS, 3002, 59, SAI, "Adjustment Knob (Rotate)")

OH_58D:defineFloat("SAI_TRIM_BAR", 54, { -1, 1 }, SAI, "Horizontal Indicator Position")
OH_58D:defineFloat("SAI_PITCH", 55, { -1, 1 }, SAI, "Pitch")
OH_58D:defineFloat("SAI_ROLL", 56, { -1, 1 }, SAI, "Roll")
OH_58D:defineFloat("SAI_OFF_FLAG", 57, { 0, 1 }, SAI, "OFF Flag")

-- RPM Vertical Scale Instrument
local RPM_SCALE = "RPM Vertical Scale Instrument"

-- NR
local NR_RPM = "NRRPM"
local NR_RPM_DESCRIPTION = "NR RPM"

OH_58D:defineLadderChiclet("RPM_NR_1", NR_RPM, 0, RPM_SCALE, NR_RPM_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("RPM_NR_2", NR_RPM, 1, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_3", NR_RPM, 2, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_4", NR_RPM, 3, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_5", NR_RPM, 4, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_6", NR_RPM, 5, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_7", NR_RPM, 6, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_8", NR_RPM, 7, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_9", NR_RPM, 8, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_10", NR_RPM, 9, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_11", NR_RPM, 10, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_12", NR_RPM, 11, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_13", NR_RPM, 12, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_14", NR_RPM, 13, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_15", NR_RPM, 14, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_16", NR_RPM, 15, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_17", NR_RPM, 16, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_18", NR_RPM, 17, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_19", NR_RPM, 18, RPM_SCALE, NR_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NR_20", NR_RPM, 19, RPM_SCALE, NR_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NR_21", NR_RPM, 20, RPM_SCALE, NR_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NR_22", NR_RPM, 21, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_23", NR_RPM, 22, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_24", NR_RPM, 23, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_25", NR_RPM, 24, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_26", NR_RPM, 25, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_27", NR_RPM, 26, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_28", NR_RPM, 27, RPM_SCALE, NR_RPM_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("RPM_NR_29", NR_RPM, 28, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_30", NR_RPM, 29, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_31", NR_RPM, 30, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_32", NR_RPM, 31, RPM_SCALE, NR_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NR_33", NR_RPM, 32, RPM_SCALE, NR_RPM_DESCRIPTION, "red")

-- NP
local NP_RPM = "NPRPM"
local NP_RPM_DESCRIPTION = "NP RPM"

OH_58D:defineLadderChiclet("RPM_NP_1", NP_RPM, 0, RPM_SCALE, NP_RPM_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("RPM_NP_2", NP_RPM, 1, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_3", NP_RPM, 2, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_4", NP_RPM, 3, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_5", NP_RPM, 4, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_6", NP_RPM, 5, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_7", NP_RPM, 6, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_8", NP_RPM, 7, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_9", NP_RPM, 8, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_10", NP_RPM, 9, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_11", NP_RPM, 10, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_12", NP_RPM, 11, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_13", NP_RPM, 12, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_14", NP_RPM, 13, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_15", NP_RPM, 14, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_16", NP_RPM, 15, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_17", NP_RPM, 16, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_18", NP_RPM, 17, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_19", NP_RPM, 18, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_20", NP_RPM, 19, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_21", NP_RPM, 20, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_22", NP_RPM, 21, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_23", NP_RPM, 22, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_24", NP_RPM, 23, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_25", NP_RPM, 24, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_26", NP_RPM, 25, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_27", NP_RPM, 26, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_28", NP_RPM, 27, RPM_SCALE, NP_RPM_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("RPM_NP_29", NP_RPM, 28, RPM_SCALE, NP_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NP_30", NP_RPM, 29, RPM_SCALE, NP_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NP_31", NP_RPM, 30, RPM_SCALE, NP_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NP_32", NP_RPM, 31, RPM_SCALE, NP_RPM_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("RPM_NP_33", NP_RPM, 32, RPM_SCALE, NP_RPM_DESCRIPTION, "red")

-- TGT/TRQ Indicator
local TGT_TRQ = "TGT/TRQ Indicator"

local tgt_trq = {}

OH_58D:addExportHook(function(_)
	tgt_trq = Module.parse_indication(indicators.RPM_TGT_TRQ)
end)

OH_58D:defineString("TGT_DISPLAY", function(_)
	return Functions.pad_left(tgt_trq["TGTDisplay"], 3)
end, 3, TGT_TRQ, "TGT Display")

OH_58D:defineString("TRQ_DISPLAY", function(_)
	return Functions.pad_left(tgt_trq["TRQDisplay"], 3)
end, 3, TGT_TRQ, "TRQ Display")

-- TGT
local TGT = "TGT"
local TGT_DESCRIPTION = "TGT"

OH_58D:defineLadderChiclet("TGT_1", TGT, 0, TGT_TRQ, TGT_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("TGT_2", TGT, 1, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_3", TGT, 2, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_4", TGT, 3, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_5", TGT, 4, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_6", TGT, 5, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_7", TGT, 6, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_8", TGT, 7, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_9", TGT, 8, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_10", TGT, 9, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_11", TGT, 10, TGT_TRQ, TGT_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TGT_12", TGT, 11, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_13", TGT, 12, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_14", TGT, 13, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_15", TGT, 14, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_16", TGT, 15, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_17", TGT, 16, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_18", TGT, 17, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_19", TGT, 18, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_20", TGT, 19, TGT_TRQ, TGT_DESCRIPTION, "yellow")
OH_58D:defineLadderChiclet("TGT_21", TGT, 20, TGT_TRQ, TGT_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TGT_22", TGT, 21, TGT_TRQ, TGT_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TGT_23", TGT, 22, TGT_TRQ, TGT_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TGT_24", TGT, 23, TGT_TRQ, TGT_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TGT_25", TGT, 24, TGT_TRQ, TGT_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TGT_26", TGT, 25, TGT_TRQ, TGT_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TGT_27", TGT, 26, TGT_TRQ, TGT_DESCRIPTION, "red")

-- TRQ
local TRQ = "TRQ"
local TRQ_DESCRIPTION = "TRQ"

OH_58D:defineLadderChiclet("TRQ_1", TRQ, 0, TGT_TRQ, TRQ_DESCRIPTION, "blue")
OH_58D:defineLadderChiclet("TRQ_2", TRQ, 1, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_3", TRQ, 2, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_4", TRQ, 3, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_5", TRQ, 4, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_6", TRQ, 5, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_7", TRQ, 6, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_8", TRQ, 7, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_9", TRQ, 8, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_10", TRQ, 9, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_11", TRQ, 10, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_12", TRQ, 11, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_13", TRQ, 12, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_14", TRQ, 13, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_15", TRQ, 14, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_16", TRQ, 15, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_17", TRQ, 16, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_18", TRQ, 17, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_19", TRQ, 18, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_20", TRQ, 19, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_21", TRQ, 20, TGT_TRQ, TRQ_DESCRIPTION, "green")
OH_58D:defineLadderChiclet("TRQ_22", TRQ, 21, TGT_TRQ, TRQ_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TRQ_23", TRQ, 22, TGT_TRQ, TRQ_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TRQ_24", TRQ, 23, TGT_TRQ, TRQ_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TRQ_25", TRQ, 24, TGT_TRQ, TRQ_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TRQ_26", TRQ, 25, TGT_TRQ, TRQ_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TRQ_27", TRQ, 26, TGT_TRQ, TRQ_DESCRIPTION, "red")
OH_58D:defineLadderChiclet("TRQ_28", TRQ, 27, TGT_TRQ, TRQ_DESCRIPTION, "red")

-- Pilot MFD
local MFD_PILOT = "MFD (Pilot)"

OH_58D:definePushButton("MFD_PLT_L1", devices.RMFD, 3001, 73, MFD_PILOT, "Line Address Key L1")
OH_58D:definePushButton("MFD_PLT_L2", devices.RMFD, 3002, 74, MFD_PILOT, "Line Address Key L2")
OH_58D:definePushButton("MFD_PLT_L3", devices.RMFD, 3003, 75, MFD_PILOT, "Line Address Key L3")
OH_58D:definePushButton("MFD_PLT_L4", devices.RMFD, 3004, 76, MFD_PILOT, "Line Address Key L4")
OH_58D:definePushButton("MFD_PLT_L5", devices.RMFD, 3005, 77, MFD_PILOT, "Line Address Key L5")
OH_58D:defineToggleSwitch("MFD_PLT_PRIMARY_BACKUP", devices.RMFD, 3006, 72, MFD_PILOT, "Display Mode Primary/Backup")
OH_58D:definePushButton("MFD_PLT_B1", devices.RMFD, 3008, 83, MFD_PILOT, "Line Address Key B1")
OH_58D:definePushButton("MFD_PLT_B2", devices.RMFD, 3009, 84, MFD_PILOT, "Line Address Key B2")
OH_58D:definePushButton("MFD_PLT_B3", devices.RMFD, 3010, 85, MFD_PILOT, "Line Address Key B3")
OH_58D:definePushButton("MFD_PLT_B4", devices.RMFD, 3011, 86, MFD_PILOT, "Line Address Key B4")
OH_58D:defineToggleSwitch("MFD_PLT_MANUAL_NVG", devices.RMFD, 3012, 69, MFD_PILOT, "Display Mode Manual/NVG")
OH_58D:definePushButton("MFD_PLT_R1", devices.RMFD, 3013, 78, MFD_PILOT, "Line Address Key R1")
OH_58D:definePushButton("MFD_PLT_R2", devices.RMFD, 3014, 79, MFD_PILOT, "Line Address Key R2")
OH_58D:definePushButton("MFD_PLT_R3", devices.RMFD, 3015, 80, MFD_PILOT, "Line Address Key R3")
OH_58D:definePushButton("MFD_PLT_R4", devices.RMFD, 3016, 81, MFD_PILOT, "Line Address Key R4")
OH_58D:definePushButton("MFD_PLT_R5", devices.RMFD, 3017, 82, MFD_PILOT, "Line Address Key R5")
OH_58D:definePushButton("MFD_PLT_INIT", devices.RMFD, 3019, 87, MFD_PILOT, "INIT")
OH_58D:defineSpringloaded_3PosTumb("MFD_PLT_BRIGHTNESS", devices.RMFD, 3021, 3020, 88, MFD_PILOT, "Brightness")
OH_58D:defineSpringloaded_3PosTumb("MFD_PLT_CONTRAST", devices.RMFD, 3023, 3022, 89, MFD_PILOT, "Contrast")

-- Copilot MFD
local MFD_COPILOT = "MFD (Copilot)"

OH_58D:definePushButton("MFD_CPLT_L1", devices.LMFD, 3001, 286, MFD_COPILOT, "Line Address Key L1")
OH_58D:definePushButton("MFD_CPLT_L2", devices.LMFD, 3002, 287, MFD_COPILOT, "Line Address Key L2")
OH_58D:definePushButton("MFD_CPLT_L3", devices.LMFD, 3003, 288, MFD_COPILOT, "Line Address Key L3")
OH_58D:definePushButton("MFD_CPLT_L4", devices.LMFD, 3004, 289, MFD_COPILOT, "Line Address Key L4")
OH_58D:definePushButton("MFD_CPLT_L5", devices.LMFD, 3005, 290, MFD_COPILOT, "Line Address Key L5")
OH_58D:defineToggleSwitch("MFD_CPLT_PRIMARY_BACKUP", devices.LMFD, 3006, 285, MFD_COPILOT, "Display Mode Primary/Backup")
OH_58D:definePushButton("MFD_CPLT_B1", devices.LMFD, 3008, 296, MFD_COPILOT, "Line Address Key B1")
OH_58D:definePushButton("MFD_CPLT_B2", devices.LMFD, 3009, 297, MFD_COPILOT, "Line Address Key B2")
OH_58D:definePushButton("MFD_CPLT_B3", devices.LMFD, 3010, 298, MFD_COPILOT, "Line Address Key B3")
OH_58D:definePushButton("MFD_CPLT_B4", devices.LMFD, 3011, 299, MFD_COPILOT, "Line Address Key B4")
OH_58D:defineToggleSwitch("MFD_CPLT_MANUAL_NVG", devices.LMFD, 3012, 284, MFD_COPILOT, "Display Mode Manual/NVG")
OH_58D:definePushButton("MFD_CPLT_R1", devices.LMFD, 3013, 291, MFD_COPILOT, "Line Address Key R1")
OH_58D:definePushButton("MFD_CPLT_R2", devices.LMFD, 3014, 292, MFD_COPILOT, "Line Address Key R2")
OH_58D:definePushButton("MFD_CPLT_R3", devices.LMFD, 3015, 293, MFD_COPILOT, "Line Address Key R3")
OH_58D:definePushButton("MFD_CPLT_R4", devices.LMFD, 3016, 294, MFD_COPILOT, "Line Address Key R4")
OH_58D:definePushButton("MFD_CPLT_R5", devices.LMFD, 3017, 295, MFD_COPILOT, "Line Address Key R5")
OH_58D:definePushButton("MFD_CPLT_INIT", devices.LMFD, 3019, 300, MFD_COPILOT, "INIT [L2MUM/CDS Cycle]")
OH_58D:defineSpringloaded_3PosTumb("MFD_CPLT_BRIGHTNESS", devices.LMFD, 3021, 3020, 301, MFD_COPILOT, "Brightness")
OH_58D:defineSpringloaded_3PosTumb("MFD_CPLT_CONTRAST", devices.LMFD, 3023, 3022, 302, MFD_COPILOT, "Contrast")

-- Pilot MFD Auxiliary Control Panel
local MFD_AUX_PANEL_PILOT = "MFD Auxiliary Panel (Pilot)"

OH_58D:definePushButton("MFD_PLT_AUX_INIT", devices.RMFD, 3018, 109, MFD_AUX_PANEL_PILOT, "INIT [Initial Page]")
OH_58D:defineFloat("MFD_PLT_AUX_ROLL", 107, { -1, 1 }, MFD_AUX_PANEL_PILOT, "Roll Switch Position (not clickable)")
OH_58D:defineFloat("MFD_PLT_AUX_PITCH", 108, { -1, 1 }, MFD_AUX_PANEL_PILOT, "Pitch Switch Position (not clickable)")

OH_58D:defineFloat("MFD_PLT_AUX_SLIP_BALL", 110, { -1, 1 }, MFD_AUX_PANEL_PILOT, "Slip Ball")

-- Copilot MFD Auxiliary Control Panel
local MFD_AUX_PANEL_COPILOT = "MFD Auxiliary Panel (Copilot)"

OH_58D:defineToggleSwitch("MFD_CPLT_AUX_ALFGL", devices.LMFD, 3038, 111, MFD_AUX_PANEL_COPILOT, "ALFGL Switch")
OH_58D:defineSpringloaded_3PosTumb("MFD_CPLT_AUX_WPN_ASE", devices.LMFD, 3040, 3039, 112, MFD_AUX_PANEL_COPILOT, "WPN/ASE Switch")
OH_58D:defineSpringloaded_3PosTumb("MFD_CPLT_AUX_IDM_INIT", devices.LMFD, 3042, 3041, 113, MFD_AUX_PANEL_COPILOT, "IDM/INIT Switch")
OH_58D:defineToggleSwitch("MFD_CPLT_AUX_L2MUM", devices.LMFD, 3043, 114, MFD_AUX_PANEL_COPILOT, "L2MUM Switch")
OH_58D:define3PosTumb("MFD_CPLT_AUX_TIS", devices.LMFD, 3044, 115, MFD_AUX_PANEL_COPILOT, "TIS Switch")
OH_58D:defineToggleSwitch("MFD_CPLT_AUX_LMC", devices.LMFD, 3045, 116, MFD_AUX_PANEL_COPILOT, "LMC Switch")
OH_58D:defineToggleSwitch("MFD_CPLT_AUX_ALE", devices.LMFD, 3046, 117, MFD_AUX_PANEL_COPILOT, "ALE Switch")

-- Clock
local CLOCK = "Clock"

OH_58D:definePushButton("CLOCK_RESET", devices.CLOCK, 3001, 130, CLOCK, "Reset/Set Button")
OH_58D:definePushButton("CLOCK_START_STOP", devices.CLOCK, 3002, 132, CLOCK, "Start/Stop/Advance Button")
OH_58D:definePushButton("CLOCK_MODE", devices.CLOCK, 3003, 131, CLOCK, "Mode Button")

local clock = {}

OH_58D:addExportHook(function(_)
	clock = Module.parse_indication(indicators.CLOCK)
end)

OH_58D:defineString("CLOCK_HOURS", function(_)
	return Functions.coerce_nil_to_string(clock["Hours"])
end, 2, CLOCK, "Hours display")

OH_58D:defineString("CLOCK_MINUTES", function(_)
	return Functions.coerce_nil_to_string(clock["Minutes"])
end, 2, CLOCK, "Minutes display")

OH_58D:defineString("CLOCK_SECONDS", function(_)
	return Functions.coerce_nil_to_string(clock["Seconds"])
end, 2, CLOCK, "Seconds display")

OH_58D:defineString("CLOCK_SEPARATOR", function(_)
	return Functions.coerce_nil_to_string(clock["Dots"])
end, 1, CLOCK, "Separator (between hours and minutes)")

OH_58D:defineString("CLOCK_PAGE", function(_)
	local page = nil

	if tonumber(cockpit_params["LT_vis"]) > 0 then
		page = clock["LT"]
	elseif tonumber(cockpit_params["UTC_vis"]) > 0 then
		page = clock["UTC"]
	elseif tonumber(cockpit_params["SW_vis"]) > 0 then
		page = clock["SW"]
	end

	return Functions.coerce_nil_to_string(page)
end, 3, CLOCK, "Page (LT, UTC, SW)")

-- Standby Magnetic Compass
local STANDBY_COMPASS = "Standby Magnetic Compass"

OH_58D:defineFloat("COMPASS_ROLL", 265, { -1, 1 }, STANDBY_COMPASS, "Roll")
OH_58D:defineFloat("COMPASS_HEADING", 266, { 0, 1 }, STANDBY_COMPASS, "Heading") -- this goes -1 to 1 in modelviewer, but in testing the value never drops below 0

-- AN/APR-39 Radar Indicator
local RWR = "AN/APR-39 Radar Indicator"

OH_58D:definePotentiometer("RWR_BRIGHTNESS", devices.SYNC, 3001, 36, { 0, 0.8 }, RWR, "Brightness Dial")
OH_58D:defineToggleSwitch("RWR_DAY_NIGHT", devices.SYNC, 3002, 37, RWR, "Day/Night Switch")

-- Standby Altimeter
local STANDBY_ALTIMETER = "Standby Altimeter"

OH_58D:defineRotary("ALTIMETER_KNOB", devices.SENSORS, 3001, 62, STANDBY_ALTIMETER, "Barometric Knob")

OH_58D:defineFloat("ALTIMETER_NEEDLE", 61, { 0, 1 }, STANDBY_ALTIMETER, "Needle") -- this goes -1 to 1 in modelviewer, but in testing the value never drops below 0
OH_58D:defineString("ALTIMETER_PRESSURE", function(dev0)
	return tostring(Module.build_gauge_from_arguments(dev0, { 66, 65, 64, 63 }))
end, 4, STANDBY_ALTIMETER, "Pressure Setting (inHg)")

OH_58D:defineString("ALTIMETER_VALUE", function(dev0)
	local value = Module.round(dev0:get_argument_value(68) * 10) % 10

	local ten_thousands = Module.round(dev0:get_argument_value(67) * 10) % 10

	if ten_thousands >= 2 then
		value = value + ((ten_thousands - 1) * 10)
	end

	return Functions.pad_left(tostring(value) .. "000", 5)
end, 5, STANDBY_ALTIMETER, "Barometric Altitude")

OH_58D:defineIntegerFromGetter("ALTIMETER_TEN_THOUSANDS_FLAG", function(dev0)
	local ten_thousands = Module.round(dev0:get_argument_value(67) * 10) % 10

	if ten_thousands == 0 then
		return 2
	end

	if ten_thousands == 1 then
		return 1
	end

	return 0
end, 2, STANDBY_ALTIMETER, "Ten Thousands Flag (0 = no flag, 1 = yellow, 2 = red)")

-- Standby Airspeed Indicator
local STANDBY_AIRSPEED_INDICATOR = "Standby Airspeed Indicator"

OH_58D:defineFloat("AIRSPEED_NEEDLE", 60, { 0, 1 }, STANDBY_AIRSPEED_INDICATOR, "Needle")

-- Remote Frequency Indicator
local RFI = "Remote Frequency Indicator"

OH_58D:definePushButton("RFI_CIPHER_L", devices.RFD, 3001, 123, RFI, "Left Cipher Button")
OH_58D:definePushButton("RFI_CIPHER_R", devices.RFD, 3002, 124, RFI, "Right Cipher Button")
OH_58D:definePushButton("RFI_TEST", devices.RFD, 3005, 125, RFI, "Test Button")
OH_58D:definePotentiometer("RFI_BRIGHTNESS_KNOB", devices.RFD, 3006, 126, { 0, 0.8 }, RFI, "Brightness Dial")

OH_58D:defineIntegerFromGetter("RFI_BRIGHTNESS", function(_)
	return Module.valueConvert(Module.cap(tonumber(cockpit_params["RFD_Fond_vis"]) or 0, 0, 1), { 0, 1 }, { 0, 65535 })
end, 65535, RFI, "Display Brightness")

local rfi = {}

OH_58D:addExportHook(function(_)
	rfi = Module.parse_indication(indicators.RFI)
end)

--- @private
--- Gets the number for an RFI line
--- @param index integer the line index (1-5)
--- @return string number the line number text
local function rfi_number(index)
	if tonumber(cockpit_params["RFD_text_vis"]) < 1 then
		return ""
	end

	return rfi[string.format("Number%d", index)]
end

--- @private
--- Gets the channel for an RFI line
--- @param index integer the line index (1-5)
--- @return string number the line channel text
local function rfi_channel(index)
	if tonumber(cockpit_params["RFD_text_vis"]) < 1 then
		return ""
	end

	return Functions.pad_left(rfi[string.format("CHNL%d", index)], 2)
end

--- @private
--- Gets the frequency for an RFI line
--- @param index integer the line index (1-5)
--- @return string number the line frequency text
local function rfi_frequency(index)
	if tonumber(cockpit_params["RFD_text_vis"]) < 1 then
		return ""
	end

	return Functions.pad_left(rfi[string.format("Freq%d", index)], 7)
end

--- @private
--- Gets whether a texture is visible
--- @param param_name string the name of the cockpit parameter
--- @return integer visible whether the texture is visible (0 = no, 1 = yes)
local function visibility_value(param_name)
	return Module.cap(Module.round(tonumber(cockpit_params[param_name]) or 0), 0, 1)
end

--- @private
--- Gets whether the cipher texture is shown
--- @param index integer the line index (1-5)
--- @return integer cipher whether the cipher texture is shown (0 = no, 1 = yes)
local function cipher_value(index)
	return visibility_value(string.format("Cipher_vis%d", index))
end

--- @private
--- Gets whether the pilot select texture is shown
--- @param index integer the line index (1-5)
--- @return integer cipher whether the cipher texture is shown (0 = no, 1 = yes)
local function pilot_select_value(index)
	return visibility_value(string.format("PilotSelect_vis%d", index))
end

--- @private
--- Gets whether the copilot select texture is shown
--- @param index integer the line index (1-5)
--- @return integer cipher whether the cipher texture is shown (0 = no, 1 = yes)
local function copilot_select_value(index)
	return visibility_value(string.format("CopilotSelect_vis%d", index))
end

-- line 1

OH_58D:defineString("RFI_LINE_1_NUMBER", function(_)
	return rfi_number(1)
end, 1, RFI, "Line 1 Line Number")

OH_58D:defineString("RFI_LINE_1_CHANNEL", function(_)
	return rfi_channel(1)
end, 2, RFI, "Line 1 Channel")

OH_58D:defineString("RFI_LINE_1_FREQUENCY", function(_)
	return rfi_frequency(1)
end, 7, RFI, "Line 1 Frequency")

OH_58D:defineIntegerFromGetter("RFI_LINE_1_CIPHER", function(_)
	return cipher_value(1)
end, 1, RFI, "Line 1 Cipher Visibility")

OH_58D:defineIntegerFromGetter("RFI_LINE_1_SELECT_PILOT", function(_)
	return pilot_select_value(1)
end, 1, RFI, "Line 1 Selected Arrow Visibility (Pilot)")

OH_58D:defineIntegerFromGetter("RFI_LINE_1_SELECT_COPILOT", function(_)
	return copilot_select_value(1)
end, 1, RFI, "Line 1 Selected Arrow Visibility (Copilot)")

-- line 2

OH_58D:defineString("RFI_LINE_2_NUMBER", function(_)
	return rfi_number(2)
end, 1, RFI, "Line 2 Line Number")

OH_58D:defineString("RFI_LINE_2_CHANNEL", function(_)
	return rfi_channel(2)
end, 2, RFI, "Line 2 Channel")

OH_58D:defineString("RFI_LINE_2_FREQUENCY", function(_)
	return rfi_frequency(2)
end, 7, RFI, "Line 2 Frequency")

OH_58D:defineIntegerFromGetter("RFI_LINE_2_CIPHER", function(_)
	return cipher_value(2)
end, 1, RFI, "Line 2 Cipher Visibility")

OH_58D:defineIntegerFromGetter("RFI_LINE_2_SELECT_PILOT", function(_)
	return pilot_select_value(2)
end, 1, RFI, "Line 2 Selected Arrow Visibility (Pilot)")

OH_58D:defineIntegerFromGetter("RFI_LINE_2_SELECT_COPILOT", function(_)
	return copilot_select_value(2)
end, 1, RFI, "Line 2 Selected Arrow Visibility (Copilot)")

-- line 3

OH_58D:defineString("RFI_LINE_3_NUMBER", function(_)
	return rfi_number(3)
end, 1, RFI, "Line 3 Line Number")

OH_58D:defineString("RFI_LINE_3_CHANNEL", function(_)
	return rfi_channel(3)
end, 2, RFI, "Line 3 Channel")

OH_58D:defineString("RFI_LINE_3_FREQUENCY", function(_)
	return rfi_frequency(3)
end, 7, RFI, "Line 3 Frequency")

OH_58D:defineIntegerFromGetter("RFI_LINE_3_CIPHER", function(_)
	return cipher_value(3)
end, 1, RFI, "Line 3 Cipher Visibility")

OH_58D:defineIntegerFromGetter("RFI_LINE_3_SELECT_PILOT", function(_)
	return pilot_select_value(3)
end, 1, RFI, "Line 3 Selected Arrow Visibility (Pilot)")

OH_58D:defineIntegerFromGetter("RFI_LINE_3_SELECT_COPILOT", function(_)
	return copilot_select_value(3)
end, 1, RFI, "Line 3 Selected Arrow Visibility (Copilot)")

-- line 4

OH_58D:defineString("RFI_LINE_4_NUMBER", function(_)
	return rfi_number(4)
end, 1, RFI, "Line 4 Line Number")

OH_58D:defineString("RFI_LINE_4_CHANNEL", function(_)
	return rfi_channel(4)
end, 2, RFI, "Line 4 Channel")

OH_58D:defineString("RFI_LINE_4_FREQUENCY", function(_)
	return rfi_frequency(4)
end, 7, RFI, "Line 4 Frequency")

OH_58D:defineIntegerFromGetter("RFI_LINE_4_CIPHER", function(_)
	return cipher_value(4)
end, 1, RFI, "Line 4 Cipher Visibility")

OH_58D:defineIntegerFromGetter("RFI_LINE_4_SELECT_PILOT", function(_)
	return pilot_select_value(4)
end, 1, RFI, "Line 4 Selected Arrow Visibility (Pilot)")

OH_58D:defineIntegerFromGetter("RFI_LINE_4_SELECT_COPILOT", function(_)
	return copilot_select_value(4)
end, 1, RFI, "Line 4 Selected Arrow Visibility (Copilot)")

-- line5

OH_58D:defineString("RFI_LINE_5_NUMBER", function(_)
	return rfi_number(5)
end, 1, RFI, "Line 5 Line Number")

OH_58D:defineString("RFI_LINE_5_CHANNEL", function(_)
	return rfi_channel(5)
end, 2, RFI, "Line 5 Channel")

OH_58D:defineString("RFI_LINE_5_FREQUENCY", function(_)
	return rfi_frequency(5)
end, 7, RFI, "Line 5 Frequency")

OH_58D:defineIntegerFromGetter("RFI_LINE_5_CIPHER", function(_)
	return cipher_value(5)
end, 1, RFI, "Line 5 Cipher Visibility")

OH_58D:defineIntegerFromGetter("RFI_LINE_5_SELECT_PILOT", function(_)
	return pilot_select_value(5)
end, 1, RFI, "Line 5 Selected Arrow Visibility (Pilot)")

OH_58D:defineIntegerFromGetter("RFI_LINE_5_SELECT_COPILOT", function(_)
	return copilot_select_value(5)
end, 1, RFI, "Line 5 Selected Arrow Visibility (Copilot)")

-- Dashboard Buttons (buttons on the dash without an associated panel)
local DASH_BUTTONS = "Dashboard Buttons"

OH_58D:definePushButton("DASH_FADEC", devices.FADEC, 3001, 282, DASH_BUTTONS, "FADEC Auto/Manual Switch")
OH_58D:definePushButton("DASH_EBF_FILTER", devices.ELECTRIC, 3030, 10, DASH_BUTTONS, "EBF Filter Bypass Button")

OH_58D:defineGatedIndicatorLight("DASH_FADEC_AUTO", 283, 0.45, 0.55, DASH_BUTTONS, "FADEC AUTO Lamp (green)")
OH_58D:defineGatedIndicatorLight("DASH_FADEC_MAN", 283, 0.95, nil, DASH_BUTTONS, "FADEC MAN Lamp (yellow)")

-- Channel Select Switch
local CHANNEL_SELECT_SWITCH = "Channel Select Switch"

OH_58D:defineSpringloaded_3PosTumb("CHANNEL_SELECT_UP_DOWN", devices.SYNC, 3144, 3145, 837, CHANNEL_SELECT_SWITCH, "Channel Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("CHANNEL_SELECT_LEFT_RIGHT", devices.SYNC, 3146, 3147, 838, CHANNEL_SELECT_SWITCH, "Channel Select Switch Left/Right")

-- MMS Control Panel
local MMS_CONTROL_PANEL = "MMS Control Panel"

OH_58D:definePushButton("MMS_CODE_LIST", devices.SYNC, 3011, 135, MMS_CONTROL_PANEL, "MMS Code List Button")
OH_58D:defineToggleSwitch("MMS_FIRST_LAST", devices.SYNC, 3012, 136, MMS_CONTROL_PANEL, "MMS First/Last Switch")
OH_58D:define3PosTumb("MMS_LASER_POWER", devices.SYNC, 3013, 137, MMS_CONTROL_PANEL, "MMS Laser Power Switch")
OH_58D:defineSpringloaded_3PosTumb("MMS_MFD_SYMBOLOGY_INTENSITY", devices.MMS, 3035, 3036, 138, MMS_CONTROL_PANEL, "MFD Symbology Intensity Switch")
OH_58D:defineSpringloaded_3PosTumb("MMS_SYMBOLOGY_INTENSITY", devices.MMS, 3037, 3038, 139, MMS_CONTROL_PANEL, "MMS Symbology Intensity Switch")
OH_58D:defineSpringloaded_3PosTumb("MMS_VIDEO_GAIN", devices.MMS, 3029, 3030, 140, MMS_CONTROL_PANEL, "Video Gain Switch")
OH_58D:defineSpringloaded_3PosTumb("MMS_VIDEO_FOCUS", devices.MMS, 3031, 3032, 141, MMS_CONTROL_PANEL, "Video Level Switch")
OH_58D:defineSpringloaded_3PosTumb("MMS_VIDEO_LEVEL", devices.MMS, 3033, 3034, 142, MMS_CONTROL_PANEL, "Video Focus Switch")
OH_58D:defineToggleSwitch("MMS_SYMBOLOGY_INTENSITY_AUTO", devices.MMS, 3009, 143, MMS_CONTROL_PANEL, "MMS Symbology Intensity Switch Manual/Auto")
OH_58D:defineToggleSwitch("MMS_VIDEO_GAIN_AUTO", devices.MMS, 3010, 144, MMS_CONTROL_PANEL, "Video Gain Switch Manual/Auto")
OH_58D:defineToggleSwitch("MMS_VIDEO_FOCUS_AUTO", devices.MMS, 3011, 145, MMS_CONTROL_PANEL, "Video Level Switch Manual/Auto")
OH_58D:defineToggleSwitch("MMS_VIDEO_LEVEL_AUTO", devices.MMS, 3012, 146, MMS_CONTROL_PANEL, "Video Focus Switch Manual/Auto")
OH_58D:defineMultipositionSwitch("MMS_MODE", devices.MMS, 3013, 147, 6, 1 / 5, MMS_CONTROL_PANEL, "MMS Mode Selector")

-- PDU
local PDU = "Pilot Display Unit"

OH_58D:definePushButton("PDU_BIT", devices.PDU, 3001, 310, PDU, "BIT Switch")
OH_58D:definePotentiometer("PDU_BRIGHTNESS", devices.PDU, 3002, 311, { 0, 0.8 }, PDU, "Brightness Dial")

-- CMWS
local CMWS = "CMWS"

OH_58D:defineSpringloaded_3PosTumb("CMWS_ON_OFF_TEST", devices.CI, 3004, 3001, 38, CMWS, "On/Off/Test Knob")
OH_58D:definePotentiometer("CMWS_AUDIO", devices.CI, 3002, 39, { 0, 0.75 }, CMWS, "Audio Dial")
OH_58D:definePotentiometer("CMWS_LAMP", devices.CI, 3003, 40, { 0, 0.75 }, CMWS, "Lamp Dial")

local cmws = {
	line_1 = "",
	line_2 = "",
	d = 0,
	r = 0,
	arrow_small_u = 0,
	arrow_small_ur = 0,
	arrow_small_r = 0,
	arrow_small_dr = 0,
	arrow_small_d = 0,
	arrow_small_dl = 0,
	arrow_small_l = 0,
	arrow_small_ul = 0,
	arrow_large_ur = 0,
	arrow_large_dr = 0,
	arrow_large_dl = 0,
	arrow_large_ul = 0,
}

local cmws_startup_string = string.char(127) .. string.char(127) .. string.char(127) .. string.char(127)

OH_58D:addExportHook(function(_)
	local ind = Module.parse_indication(indicators.CMWS)

	local text = ind["statusDisplay"]

	if text then
		local lines = {}
		for s in text:gmatch("[^\r\n]+") do
			table.insert(lines, s)
		end

		-- 0x007F appears on startup, but the actual display output is _basically_ 0000 (not quite, but close enough)
		cmws.line_1 = lines[1] == cmws_startup_string and "0000" or lines[1]
		cmws.line_2 = lines[2] == cmws_startup_string and "0000" or lines[2]
	else
		cmws.line_1 = ""
		cmws.line_2 = ""
	end

	cmws.d = Functions.nil_state_to_int_flag(ind["dispense"])
	cmws.r = Functions.nil_state_to_int_flag(ind["ready"])
	cmws.arrow_small_u = Functions.nil_state_to_int_flag(ind["smallArrow1"])
	cmws.arrow_small_ur = Functions.nil_state_to_int_flag(ind["smallArrow2"])
	cmws.arrow_small_r = Functions.nil_state_to_int_flag(ind["smallArrow3"])
	cmws.arrow_small_dr = Functions.nil_state_to_int_flag(ind["smallArrow4"])
	cmws.arrow_small_d = Functions.nil_state_to_int_flag(ind["smallArrow5"])
	cmws.arrow_small_dl = Functions.nil_state_to_int_flag(ind["smallArrow2"]) -- NOT a typo (well, not in bios, probably a typo in the module luas)
	cmws.arrow_small_l = Functions.nil_state_to_int_flag(ind["smallArrow7"])
	cmws.arrow_small_ul = Functions.nil_state_to_int_flag(ind["smallArrow8"])

	-- these should have a dim and bright state, but it's unclear how to get this data
	cmws.arrow_large_ur = Functions.nil_state_to_int_flag(ind["threatArrowFrontRight"])
	cmws.arrow_large_dr = Functions.nil_state_to_int_flag(ind["threatArrowRearRight"])
	cmws.arrow_large_dl = Functions.nil_state_to_int_flag(ind["threatArrowRearLeft"])
	cmws.arrow_large_ul = Functions.nil_state_to_int_flag(ind["threatArrowFrontLeft"])
end)

-- text lines
OH_58D:defineString("CMWS_LINE_1", function()
	return cmws.line_1
end, 4, CMWS, "Line 1")
OH_58D:defineString("CMWS_LINE_2", function()
	return cmws.line_2
end, 4, CMWS, "Line 2")

-- symbology lights
OH_58D:defineIntegerFromGetter("CMWS_D", function(_)
	return cmws.d
end, 1, CMWS, "Dispense Lamp (orange)")
OH_58D:defineIntegerFromGetter("CMWS_R", function(_)
	return cmws.r
end, 1, CMWS, "Ready Lamp (orange)")

OH_58D:defineIntegerFromGetter("CMWS_ARROW_SMALL_U", function(_)
	return cmws.arrow_small_u
end, 1, CMWS, "Small Arrow Forward (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_SMALL_UR", function(_)
	return cmws.arrow_small_ur
end, 1, CMWS, "Small Arrow Forward Right (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_SMALL_R", function(_)
	return cmws.arrow_small_r
end, 1, CMWS, "Small Arrow Right (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_SMALL_DR", function(_)
	return cmws.arrow_small_dr
end, 1, CMWS, "Small Arrow Aft Right (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_SMALL_D", function(_)
	return cmws.arrow_small_d
end, 1, CMWS, "Small Arrow Aft (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_SMALL_DL", function(_)
	return cmws.arrow_small_dl
end, 1, CMWS, "Small Arrow Aft Left (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_SMALL_L", function(_)
	return cmws.arrow_small_l
end, 1, CMWS, "Small Arrow Left (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_SMALL_UL", function(_)
	return cmws.arrow_small_ul
end, 1, CMWS, "Small Arrow Forward Left (orange)")

OH_58D:defineIntegerFromGetter("CMWS_ARROW_LARGE_UR", function(_)
	return cmws.arrow_large_ur
end, 1, CMWS, "Large Arrow Forward Right (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_LARGE_DR", function(_)
	return cmws.arrow_large_dr
end, 1, CMWS, "Large Arrow Aft Right (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_LARGE_DL", function(_)
	return cmws.arrow_large_dl
end, 1, CMWS, "Large Arrow Aft Left (orange)")
OH_58D:defineIntegerFromGetter("CMWS_ARROW_LARGE_UL", function(_)
	return cmws.arrow_large_ul
end, 1, CMWS, "Large Arrow Forward Left (orange)")

-- reserve values in case we can discern between dim and bright threat arrows in the future
OH_58D:reserveIntValue(2)
OH_58D:reserveIntValue(2)
OH_58D:reserveIntValue(2)
OH_58D:reserveIntValue(2)

-- Interior Lights
local INTERIOR_LIGHTS = "Interior Lights"

OH_58D:defineFloat("INTERIOR_FRONT_DASH_BRIGHTNESS", 28, { 0, 1 }, INTERIOR_LIGHTS, "Front Dash Brightness")
OH_58D:defineFloat("INTERIOR_CENTER_CONSOLE_BRIGHTNESS", 31, { 0, 1 }, INTERIOR_LIGHTS, "Center Console Brightness")
OH_58D:defineIntegerFromGetter("INTERIOR_FLOODLIGHT_GREEN", function(dev0)
	local which_floodlight = dev0:get_argument_value(304)
	if which_floodlight < 0 then
		return 0
	end
	return which_floodlight < 0.5 and Module.valueConvert(dev0:get_argument_value(26), { -0.01, 0.75 }, { 0, 65535 }) or 0
end, 65535, INTERIOR_LIGHTS, "Green Floodlight Intensity")
OH_58D:defineIntegerFromGetter("INTERIOR_FLOODLIGHT_WHITE", function(dev0)
	local which_floodlight = dev0:get_argument_value(304)
	if which_floodlight < 0 then
		return 0
	end
	return which_floodlight > 0.99 and Module.valueConvert(dev0:get_argument_value(26), { -0.01, 0.75 }, { 0, 65535 }) or 0
end, 65535, INTERIOR_LIGHTS, "White Floodlight Intensity")

-- Free Air Temperature Gauge
local FAT = "Free Air Temperature Gauge"

OH_58D:defineFloat("FAT_NEEDLE", 244, { -1, 1 }, FAT, "Guage Needle")

-- Cockpit
local COCKPIT = "Cockpit"

OH_58D:defineFloat("COCKPIT_PLT_ARMOR_PANEL", 801, { 0, 1 }, COCKPIT, "Armor Panel (Pilot)")
OH_58D:defineFloat("COCKPIT_CPLT_ARMOR_PANEL", 802, { 0, 1 }, COCKPIT, "Armor Panel (Copilot)")
OH_58D:defineFloat("COCKPIT_PLT_DOOR", 800, { 0, 1 }, COCKPIT, "Door (Pilot)")
OH_58D:defineFloat("COCKPIT_CPLT_DOOR", 803, { 0, 1 }, COCKPIT, "Door (Copilot)")
OH_58D:defineGatedIndicatorLight("COCKPIT_AIRBAGS", 836, 0.001, nil, COCKPIT, "Airbags Deployed")
OH_58D:defineGatedIndicatorLight("COCKPIT_GRENADE_L", 850, 0.001, nil, COCKPIT, "Grenade Present (Left)")
OH_58D:defineGatedIndicatorLight("COCKPIT_GRENADE_C", 851, 0.001, nil, COCKPIT, "Grenade Present (Center)")
OH_58D:defineGatedIndicatorLight("COCKPIT_GRENADE_R", 852, 0.001, nil, COCKPIT, "Grenade Present (Right)")

local function grenade_color(dev0, arg)
	local value = dev0:get_argument_value(arg)

	if value < 0.05 then
		return 0
	end

	if value < 0.15 then
		return 1
	end

	if value < 0.25 then
		return 2
	end

	if value < 0.35 then
		return 3
	end

	if value < 0.45 then
		return 4
	end

	return 5
end

OH_58D:defineIntegerFromGetter("COCKPIT_GRENADE_L_COLOR", function(dev0)
	return grenade_color(dev0, 856)
end, 5, COCKPIT, "Grenade Color (Left) (G, Y, V, B, W, R)")
OH_58D:defineIntegerFromGetter("COCKPIT_GRENADE_C_COLOR", function(dev0)
	return grenade_color(dev0, 857)
end, 5, COCKPIT, "Grenade Color (Center) (G, Y, V, B, W, R)")
OH_58D:defineIntegerFromGetter("COCKPIT_GRENADE_R_COLOR", function(dev0)
	return grenade_color(dev0, 858)
end, 5, COCKPIT, "Grenade Color (Right) (G, Y, V, B, W, R)")

OH_58D:defineFloat("COCKPIT_GREASE_PENCIL_Y", 834, { -1, 1 }, COCKPIT, "Grease Pencil (y-axis)")
OH_58D:defineFloat("COCKPIT_GREASE_PENCIL_X", 835, { -1, 1 }, COCKPIT, "Grease Pencil (x-axis)")

OH_58D:defineIndicatorLightInverted("COCKPIT_PLT_NVGS", 303, COCKPIT, "NVGs Present (Pilot)")
OH_58D:defineIndicatorLightInverted("COCKPIT_CPLT_NVGS", 760, COCKPIT, "NVGs Present (Copilot)")
OH_58D:defineIndicatorLightInverted("COCKPIT_WATER_BOTTLE", 833, COCKPIT, "Water Bottle Present")

OH_58D:defineGatedIndicatorLight("COCKPIT_FIRE_EXTINGUISHER", 601, 0.01, nil, COCKPIT, "Fire Extinguisher Present")

OH_58D:defineIndicatorLight("COCKPIT_FLAG", 930, COCKPIT, "Flag Visible")
OH_58D:defineFloat("COCKPIT_FLAG_WAVE", 931, { -1, 1 }, COCKPIT, "Flag Wave Position")

-- Copilot M4
local COPILOT_M4 = "M4 (Copilot)"

-- OH_58D:defineInputOnlyPushButton("M4_CPLT_AIM", devices.M3P_LASER, 3006, COPILOT_M4, "Aim") -- doesn't seem to do anything
OH_58D:reserveIntValue(1) -- in case aiming works and has a draw arg in the future
local m4_fire = OH_58D:definePushButton("M4_CPLT_FIRE", devices.M3P_LASER, 3007, 0, COPILOT_M4, "Fire (must decrement to fire again)")
assert(m4_fire.inputs[3].interface == "action")
m4_fire.inputs[3] = nil -- toggle won't work since there is no draw arg, so the control will never appear to be on
m4_fire.outputs[1] = nil -- there is no draw arg, so the output won't work

-- input doesn't work properly (maybe because it's not clickable?)
-- OH_58D:definePotentiometer("M4_CPLT_X", devices.M3P_LASER, 3004, 881, { -1, 1 }, COPILOT_M4, "Position (left/right)")
-- OH_58D:definePotentiometer("M4_CPLT_Y", devices.M3P_LASER, 3005, 882, { -1, 1 }, COPILOT_M4, "Position (up/down)")
OH_58D:defineFloat("M4_CPLT_X", 881, { -1, 1 }, COPILOT_M4, "Position (left/right)")
OH_58D:defineFloat("M4_CPLT_Y", 882, { -1, 1 }, COPILOT_M4, "Position (up/down)")

OH_58D:defineGatedIndicatorLight("M4_CPLT_VR_DEPLOYED", 870, 0.99, nil, COPILOT_M4, "M4 Deployed (VR)")
OH_58D:defineFloat("M4_CPLT_VR_X", 871, { -1, 1 }, COPILOT_M4, "Position (VR) (left/right)")
OH_58D:defineFloat("M4_CPLT_VR_Z", 872, { -1, 1 }, COPILOT_M4, "Position (VR) (forward/back)")
OH_58D:defineFloat("M4_CPLT_VR_Y", 873, { -1, 1 }, COPILOT_M4, "Position (VR) (up/down)")
OH_58D:defineFloat("M4_CPLT_VR_ROLL", 874, { -1, 1 }, COPILOT_M4, "Roll (VR)")
OH_58D:defineFloat("M4_CPLT_VR_PITCH", 875, { -1, 1 }, COPILOT_M4, "Pitch (VR)")
OH_58D:defineFloat("M4_CPLT_VR_YAW", 876, { -1, 1 }, COPILOT_M4, "Yaw (VR)")

OH_58D:defineInputOnlyPushButton("M4_CPLT_DEPLOY", devices.SYNC, 3047, COPILOT_M4, "Deploy/Stow M4")
OH_58D:defineGatedIndicatorLight("M4_CPLT_DEPLOYED", 869, 0.2, nil, COPILOT_M4, "M4 Deployed")

-- Exterior Lights
local EXTERIOR_LIGHTS = "Exterior Lights"

OH_58D:defineFloatFromDrawArgument("EXT_LIGHT_POSITION_LIGHT_LEFT", 190, EXTERIOR_LIGHTS, "Left Position Light (red)")
OH_58D:defineFloatFromDrawArgument("EXT_LIGHT_POSITION_LIGHT_RIGHT", 191, EXTERIOR_LIGHTS, "Right Position Light (green)")
OH_58D:defineFloatFromDrawArgument("EXT_LIGHT_TAIL", 192, EXTERIOR_LIGHTS, "Tail Light (white)")
OH_58D:defineFloatFromDrawArgument("EXT_LIGHT_ANTI_COLL_TOP", 193, EXTERIOR_LIGHTS, "Top Anti-Collision Light (red)")
OH_58D:defineFloatFromDrawArgument("EXT_LIGHT_ANTI_COLL_BOT", 194, EXTERIOR_LIGHTS, "Bottom Anti-Collision Light (red)")
OH_58D:defineBitFromDrawArgument("EXT_LIGHT_SEARCH", 208, EXTERIOR_LIGHTS, "Search Light (white)")

-- Exterior Model
local EXTERIOR_MODEL = "Exterior Model"

OH_58D:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_PITCH_LATERAL", 11, EXTERIOR_MODEL, "Blade Pitch (left/right cyclic)")
OH_58D:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_PITCH_FORWARD_AFT", 12, EXTERIOR_MODEL, "Blade Pitch (forward/aft cyclic)")
OH_58D:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_SPIN", 40, EXTERIOR_MODEL, "Rotor Position")
OH_58D:defineFullRangeFloatFromExternalDrawArgument("EXT_ANTI_TRQ_SPIN", 41, EXTERIOR_MODEL, "Anti-torque Rotor Position")
OH_58D:defineFloatFromDrawArgument("EXT_SEARCH_LIGHT_PITCH", 209, EXTERIOR_MODEL, "Search Light Pitch")
OH_58D:defineFloatFromDrawArgument("EXT_SEARCH_LIGHT_ROTATION", 210, EXTERIOR_MODEL, "Search Light Rotation")
OH_58D:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_PITCH_COLLECTIVE", 274, EXTERIOR_MODEL, "Blade Pitch (collective)")
OH_58D:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR_FLEX", 280, EXTERIOR_MODEL, "Blade Flex")
OH_58D:defineFullRangeFloatFromExternalDrawArgument("EXT_MMS_PITCH", 527, EXTERIOR_MODEL, "MMS Pitch")
OH_58D:defineFullRangeFloatFromExternalDrawArgument("EXT_MMS_YAW", 528, EXTERIOR_MODEL, "MMS Yaw")
OH_58D:defineBitFromDrawArgument("EXT_MMS_REMOVED", 850, EXTERIOR_MODEL, "MMS Removed")
OH_58D:defineBitFromDrawArgument("EXT_RAPID_DEPLOYMENT_GEAR", 851, EXTERIOR_MODEL, "Rapid Deployment Gear Installed")

-- radios
-- setting values doesn't seem to do anything currently, so these are read-only for now
OH_58D:defineReadOnlyRadio("RADIO_FM1", 29, 6, 3, 1000, "FM-1")
OH_58D:defineReadOnlyRadio("RADIO_UHF", 30, 7, 3, 1000, "UHF")
OH_58D:defineReadOnlyRadio("RADIO_VHF", 31, 7, 3, 1000, "VHF")
OH_58D:defineReadOnlyRadio("RADIO_FM2", 32, 6, 3, 1000, "FM-2")

return OH_58D
