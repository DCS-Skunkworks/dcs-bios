BIOS.protocol.beginModule("A-10C", 0x1000)
BIOS.protocol.setExportModuleAircrafts({"A-10C"})

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication


local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local define3PosTumb = BIOS.util.define3PosTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineElectricallyHeldSwitch = BIOS.util.defineElectricallyHeldSwitch
local defineFloat = BIOS.util.defineFloat
local define8BitFloat = BIOS.util.define8BitFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--local function defineElectricallyHeldSwitch(msg, device_id, pos_command, neg_command, arg_number, category, description)
--	document { identifier = msg, category = category, description = description, control_type = "electrically_held_switch", value_type = "enum", value_enum = {"0", "1"}, can_set = false, actions = {"PUSH", "RELEASE", "OFF"} }
--	--moduleBeingDefined.lowFrequencyMap[msg] = function(dev0) return string.format("%.0f", dev0:get_argument_value(arg_number)) end
--	moduleBeingDefined.inputProcessors[msg] = function(action)
--		if action == "PUSH" then GetDevice(device_id):performClickableAction(pos_command, 1) end
--		if action == "RELEASE" then GetDevice(device_id):performClickableAction(neg_command, 0) end
--		if action == "OFF" then GetDevice(device_id):performClickableAction(pos_command, 0) end
--	end
--end

local function defineRadioWheel(msg, device_id, command1, command2, command_args, arg_number, step, limits, output_map, category, description)
	defineTumb(msg, device_id, command1, arg_number, step, limits, output_map, "skiplast", category, description)
	local docentry = moduleBeingDefined.documentation[category][msg]
	assert(docentry.inputs[2].interface == "set_state")
	docentry.inputs[2] = nil
	moduleBeingDefined.documentation[category][msg].control_type = "discrete_dial"
	inputProcessors[msg] = function(state)
		if state == "INC" then
			GetDevice(device_id):performClickableAction(command2, command_args[2])
		end
		if state == "DEC" then
			GetDevice(device_id):performClickableAction(command1, command_args[1])
		end
	end
end

local function define3PosTumb1(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 0.1, {0.0, 0.2}, nil, false, category, description)
end


local function getCMSPDisplayLines(dev0)
	local cmsp = BIOS.util.parse_indication(7)
	if not cmsp then
		local emptyline = string.format("%19s", "") -- 19 spaces
		return emptyline, emptyline
	else
		local tu = cmsp["txt_UP"]
		local line1 = string.format("%-4s", tu:sub(0, 4))..
				 " "..string.format("%-4s", tu:sub(5, 8))..
				 " "..string.format("%-4s", tu:sub(9, 12))..
				 " "..string.format("%-4s", tu:sub(13, 16))
		local line2 = string.format("%-4s", cmsp["txt_DOWN1"])..
				 " "..string.format("%-4s", cmsp["txt_DOWN2"])..
				 " "..string.format("%-4s", cmsp["txt_DOWN3"])..
				 " "..string.format("%-4s", cmsp["txt_DOWN4"])
		return line1, line2
	end
end

local function getUHFPreset()
    local ind = parse_indication(10)
    if ind == nil then return " " end
    return ind["txtPresetChannel"]
end

local function getUHFFrequency()
    local ind = parse_indication(11)
    if ind == nil then return "       " end
    local freqStatus = ind["txtFreqStatus"] -- e.g. "251000"
    return freqStatus:sub(0,3) .. "." .. freqStatus:sub(4,6)
end



local vhf_lut1 = {
    ["0.15"] = " 3",
    ["0.20"] = "4",
    ["0.25"] = "5",
    ["0.30"] = "6",
    ["0.35"] = "7",
    ["0.40"] = "8",
    ["0.45"] = "9",
    ["0.50"] = "10",
    ["0.55"] = "11",
    ["0.60"] = "12",
    ["0.65"] = "13",
    ["0.70"] = "14",
    ["0.75"] = "15"
}

local function getVhfAmFreqency()
    local freq1 = vhf_lut1[string.format("%.2f",GetDevice(0):get_argument_value(143))]
    local freq2 = string.format("%1.1f", GetDevice(0):get_argument_value(144)):sub(3)
    local freq3 = string.format("%1.1f", GetDevice(0):get_argument_value(145)):sub(3)
    local freq4 = string.format("%1.2f", GetDevice(0):get_argument_value(146)):sub(3)

    return freq1 .. freq2 .. "." .. freq3 .. freq4
end

local function getVhfFmFreqency()
    local freq1 = vhf_lut1[string.format("%.2f",GetDevice(0):get_argument_value(157))]
    local freq2 = string.format("%1.1f", GetDevice(0):get_argument_value(158)):sub(3)
    local freq3 = string.format("%1.1f", GetDevice(0):get_argument_value(159)):sub(3)
    local freq4 = string.format("%1.2f", GetDevice(0):get_argument_value(160)):sub(3)

    return freq1 .. freq2 .. "." .. freq3 .. freq4
end




local function getTacanChannel()
    local tcn_2 = ""
    if GetDevice(0):get_argument_value(263) == 0 then
        tcn_2 = "0"
    else
    	tcn_2 = "1"    
    end
    local tcn_1 = string.format("%.1f", GetDevice(0):get_argument_value(264)):sub(3)
    local tcn_0 = string.format("%.1f", GetDevice(0):get_argument_value(265)):sub(3)

	local tcn_xy = ""
	if GetDevice(0):get_argument_value(266) == 0 then
		tcn_xy = "X"
	else
		tcn_xy = "Y"
	end

    return tcn_2 .. tcn_1 .. tcn_0 .. tcn_xy
end

local function getILSFrequency()
    local ils_mhz_lut = {
        ["0.0"] = "108",
        ["0.1"] = "109",
        ["0.2"] = "110",
        ["0.3"] = "111"
    }
    local ils_khz_lut = {["0.0"] = 0.10,
        ["0.1"] = ".15",
        ["0.2"] = ".30",
        ["0.3"] = ".35",
        ["0.4"] = ".50",
        ["0.5"] = ".55",
        ["0.6"] = ".70",
        ["0.7"] = ".75",
        ["0.8"] = ".90",
        ["0.9"] = ".95"
    }
    local mhz = ils_mhz_lut[string.format("%.1f", GetDevice(0):get_argument_value(251))]
    local khz = ils_khz_lut[string.format("%.01f", GetDevice(0):get_argument_value(252))]
    return mhz .. khz
end



local cmsp1Alloc = moduleBeingDefined.memoryMap:allocateString{ maxLength = 19 }
local cmsp2Alloc = moduleBeingDefined.memoryMap:allocateString{ maxLength = 19 }
document {
	identifier = "CMSP1",
	category = "CMSP",
	description = "CMSP Display Line 1",
	control_type = "display",
	inputs = {},
	outputs = {
		{ ["type"] = "string",
		  suffix = "",
		  address = cmsp1Alloc.address,
		  mask = cmsp1Alloc.mask,
		  shift_by = cmsp1Alloc.shiftBy,
		  max_length = cmsp1Alloc.maxLength,
		  description = "CMSP Display Line 1 (19 characters)"
		}
	}
}
document {
	identifier = "CMSP2",
	category = "CMSP",
	description = "CMSP Display Line 2",
	control_type = "display",
	inputs = {},
	outputs = {
		{ ["type"] = "string",
		  suffix = "",
		  address = cmsp2Alloc.address,
		  mask = cmsp2Alloc.mask,
		  shift_by = cmsp2Alloc.shiftBy,
		  max_length = cmsp2Alloc.maxLength,
		  description = "CMSP Display Line 2 (19 characters)"
		}
	}
}
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
	
	local line1, line2 = getCMSPDisplayLines(dev0)
	cmsp1Alloc:setValue(line1)
	cmsp2Alloc:setValue(line2)
	
end

defineFloat("SAI_PITCH", 63, {-1, 1}, "Standby Attitude Indicator", "SAI Pitch")
defineFloat("SAI_BANK", 64, {-1, 1}, "Standby Attitude Indicator", "SAI Bank")
defineFloat("SAI_WARNING_FLAG", 65, {0, 1}, "Standby Attitude Indicator", "SAI Warning Flag")
defineFloat("SAI_PITCH_ADJ", 715, {-1, 1}, "Standby Attitude Indicator", "SAI Manual Pitch Adjustment")
defineFloat("SAI_KNOB_ARROW", 717, {-1, 1}, "Standby Attitude Indicator", "SAI Knob Arrow")

defineFloat("ADI_PITCH", 17, {-1, 1}, "ADI", "ADI Pitch")
defineFloat("ADI_BANK", 18, {-1, 1}, "ADI", "ADI Bank")
defineFloat("ADI_SLIP", 24, {-1, 1}, "ADI", "ADI Slipball Position")
defineFloat("ADI_TURN", 23, {-1, 1}, "ADI", "ADI Turn Needle")
defineFloat("ADI_ATTWARN_FLAG", 25, {0, 1}, "ADI", "ADI Attitude Warning Flag")
defineFloat("ADI_CRSWARN_FLAG", 19, {0, 1}, "ADI", "ADI Course Warning Flag")
defineFloat("ADI_GSWARN_FLAG", 26, {0, 1}, "ADI", "ADI Glide Slope Warning Flag")
defineFloat("ADI_STEER_BANK", 20, {-1, 1}, "ADI", "ADI Bank Steering Bar")
defineFloat("ADI_STEER_PITCH", 21, {-1, 1}, "ADI", "ADI Pitch Steering Bar")
defineFloat("ADI_GS", 27, {-1, 1}, "ADI", "ADI Glide Slope Indicator")

defineFloat("HSI_PWROFF_FLAG", 40, {0, 1}, "HSI", "HSI Poweroff Flag")
defineFloat("HSI_RANGE_FLAG", 32, {0, 1}, "HSI", "HSI Range Flag")
defineFloat("HSI_BEARING_FLAG", 46, {0, 1}, "HSI", "HSI Bearing Flag")
defineFloat("HSI_HDG", 34, {0, 1}, "HSI", "HSI Heading")
defineFloat("HSI_BEARING1", 33, {0, 1}, "HSI", "HSI Bearing Pointer 1")
defineFloat("HSI_BEARING2", 35, {0, 1}, "HSI", "HSI Bearing Pointer 2")
defineFloat("HSI_HDG_BUG", 36, {0, 1}, "HSI", "HSI Heading Bug")
defineFloat("HSI_CRS", 47, {0, 1}, "HSI", "HSI Course")
defineFloat("HSI_CC_A", 37, {0, 1}, "HSI", "HSI Course Counter A")
defineFloat("HSI_CC_B", 39, {0, 1}, "HSI", "HSI Course Counter B")
defineFloat("HSI_RC_A", 28, {0, 1}, "HSI", "HSI Range Counter A")
defineFloat("HSI_RC_B", 29, {0, 1}, "HSI", "HSI Range Counter B")
defineFloat("HSI_RC_C", 30, {0, 1}, "HSI", "HSI Range Counter C")
defineFloat("HSI_RC_D", 31, {0, 1}, "HSI", "HSI Range Counter D")
defineFloat("HSI_DEVIATION", 41, {-1, 1}, "HSI", "HSI Deviation")
defineFloat("HSI_TOFROM1", 42, {0, 1}, "HSI", "HSI TO/FROM 1")
defineFloat("HSI_TOFROM2", 43, {0, 1}, "HSI", "HSI TO/FROM 2")
local dummyAlloc = moduleBeingDefined.memoryMap:allocateInt { maxValue = 65535 }
local dummyAlloc = moduleBeingDefined.memoryMap:allocateInt { maxValue = 65535 }

defineFloat("HARS_SYNC", 269, {-1, 1}, "HARS", "HARS Sync")

defineFloat("VVI", 12, {-1, 1}, "VVI", "Vertical Velocity Indicator")

defineFloat("ACCEL_G", 15, {0, 1}, "Accelerometer", "G Load")
defineFloat("ACCEL_MIN", 902, {0, 1}, "Accelerometer", "Accelerometer Min Pointer")
defineFloat("ACCEL_MAX", 903, {0, 1}, "Accelerometer", "Accelerometer Max Pointer")

defineFloat("AOA_PWROFF", 55, {0, 1}, "AOA Indicator", "AOA Poweroff Flag")
defineFloat("AOA_UNITS", 4, {0, 1}, "AOA Indicator", "AOA Units")

defineFloat("AIRSPEED_NEEDLE", 48, {0, 1}, "Airspeed Indicator", "Airspeed Needle")
defineFloat("AIRSPEED_DIAL", 49, {0, 1}, "Airspeed Indicator", "Airspeed Dial")

defineFloat("ALT_100FT", 51, {0, 1}, "Altimeter", "100 ft Pointer")
defineFloat("ALT_10000FT_CNT", 52, {0, 1}, "Altimeter", "10000 FT Counter")
defineFloat("ALT_1000FT_CNT", 53, {0, 1}, "Altimeter", "1000 FT Counter")
defineFloat("ALT_100FT_CNT", 54, {0, 1}, "Altimeter", "100 FT Counter")
defineFloat("ALT_PRESSURE0", 59, {0, 1}, "Altimeter", "Barometric Pressure Digit 0")
defineFloat("ALT_PRESSURE1", 58, {0, 1}, "Altimeter", "Barometric Pressure Digit 1")
defineFloat("ALT_PRESSURE2", 57, {0, 1}, "Altimeter", "Barometric Pressure Digit 2")
defineFloat("ALT_PRESSURE3", 56, {0, 1}, "Altimeter", "Barometric Pressure Digit 3")

defineIndicatorLight("CMSC_LAUNCH", 372, "CMSC", "Missile Launch Indicator")
defineIndicatorLight("CMSC_PRIO", 373, "CMSC", "Priority Status Indicator")
defineIndicatorLight("CMSC_UNKN", 374, "CMSC", "Unknown Status Indicator")
local cmscData = nil
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	cmscData = parse_indication(8)
end
local function getCmscChaffFlare()
	if not cmscData then return "        " end
	return cmscData.txt_CHAFF_FLARE or "        "
end
defineString("CMSC_TXT_CHAFF_FLARE", getCmscChaffFlare, 8, "CMSC", "Chaff / Flare Amount Display")

local function getCmscJmr()
	if not cmscData then return "        " end
	return cmscData.txt_JMR or "        "
end
defineString("CMSC_TXT_JMR", getCmscJmr, 8, "CMSC", "JMR Status Display")

local dummy = moduleBeingDefined.memoryMap:allocateInt{ maxValue = 65535 }

defineFloat("FLAP_POS", 653, {0, 2/3}, "Landing Gear and Flap Control Panel", "Flap Position Indicator")

defineFloat("L_ENG_FAN", 76, {0, 1}, "Engine Instruments", "Left Engine Fan Speed")
defineFloat("R_ENG_FAN", 77, {0, 1}, "Engine Instruments", "Right Engine Fan Speed")
defineFloat("L_ENG_CORE_T", 79, {0, 1}, "Engine Instruments", "Left Engine Core Speed Tenth")
defineFloat("L_ENG_CORE", 78, {0, 1}, "Engine Instruments", "Left Engine Core Speed")
defineFloat("R_ENG_CORE_T", 81, {0, 1}, "Engine Instruments", "Right Engine Core Speed Tenth")
defineFloat("R_ENG_CORE", 80, {0, 1}, "Engine Instruments", "Right Engine Core Speed")
defineFloat("L_ENG_FUEL_FLOW", 84, {0, 1}, "Engine Instruments", "Left Engine Fuel Flow")
defineFloat("R_ENG_FUEL_FLOW", 85, {0, 1}, "Engine Instruments", "Right Engine Fuel Flow")
defineFloat("L_ENG_TEMP_T", 71, {0, 1}, "Engine Instruments", "Left Engine Temperature Tenth")
defineFloat("L_ENG_TEMP", 70, {0, 1}, "Engine Instruments", "Left Engine Temperature")
defineFloat("R_ENG_TEMP_T", 74, {0, 1}, "Engine Instruments", "Right Engine Temperature Tenth")
defineFloat("R_ENG_TEMP", 73, {0, 1}, "Engine Instruments", "Right Engine Temperature")
defineFloat("L_ENG_TEMP_OFF", 72, {0, 1}, "Engine Instruments", "Left Engine Temperature Off")
defineFloat("R_ENG_TEMP_OFF", 75, {0, 1}, "Engine Instruments", "Right Engine Temperature Off")

defineFloat("APU_RPM", 13, {0, 1}, "Engine Instruments", "APU RPM Gauge")
defineFloat("APU_TEMP", 14, {0, 1}, "Engine Instruments", "APU Temperature Gauge")

defineFloat("L_HYD_PRESS", 647, {0, 1}, "Engine Instruments", "Left Hydraulic Pressure")
defineFloat("R_HYD_PRESS", 648, {0, 1}, "Engine Instruments", "Right Hydraulic Pressure")

defineFloat("L_OIL_PRESS", 82, {0, 1}, "Engine Instruments", "Left Oil Pressure")
defineFloat("R_OIL_PRESS", 83, {0, 1}, "Engine Instruments", "Right Oil Pressure")

defineFloat("FUEL_QTY_L", 88, {0, 1}, "Fuel Panel", "Fuel Qty Left")
defineFloat("FUEL_QTY_R", 89, {0, 1}, "Fuel Panel", "Fuel Qty Right")
defineFloat("FUEL_QTY_10000", 90, {0, 1}, "Fuel Panel", "Fuel Quantity Counter 10000")
defineFloat("FUEL_QTY_1000", 91, {0, 1}, "Fuel Panel", "Fuel Quantity Counter 1000")
defineFloat("FUEL_QTY_100", 92, {0, 1}, "Fuel Panel", "Fuel Quantity Counter 100")

defineFloat("CANOPY_VALUE", 7, {0.0, 1.0}, "Misc", "Canopy Position")

defineIndicatorLight("MASTER_CAUTION", 404, "UFC", "Master Caution Light")

-- The order in this file roughly follows clickabledata.lua
-- the following 12 indicators are "out of order" to ensure that
-- the caution lights begin on a 16-bit boundary
defineIndicatorLight("AOA_INDEXER_HIGH", 540, "HUD", "AOA Indexer High")
defineIndicatorLight("AOA_INDEXER_NORMAL", 541, "HUD", "AOA Indexer Normal")
defineIndicatorLight("AOA_INDEXER_LOW", 542, "HUD", "AOA Indexer Low")
defineIndicatorLight("AIR_REFUEL_READY", 730, "HUD", "Air Refuel READY")
defineIndicatorLight("AIR_REFUEL_LATCHED", 731, "HUD", "Air Refuel LATCHED")
defineIndicatorLight("AIR_REFUEL_DISCONNECT", 732, "HUD", "Air Refuel DISCONNECT")

defineIndicatorLight("TAKE_OFF_TRIM", 191, "SAS Panel", "TAKEOFF TRIM Indicator Light")

defineIndicatorLight("GEAR_N_SAFE", 659, "Landing Gear and Flap Control Panel", "Nose Gear Safe")
defineIndicatorLight("GEAR_L_SAFE", 660, "Landing Gear and Flap Control Panel", "Left Gear Safe")
defineIndicatorLight("GEAR_R_SAFE", 661, "Landing Gear and Flap Control Panel", "Right Gear Safe")
defineIndicatorLight("HANDLE_GEAR_WARNING", 737, "Landing Gear and Flap Control Panel", "Handle Gear Warning Light")

defineIndicatorLight("GUN_READY", 662, "Front Dash", "GUN READY Indicator")

-- caution lights
defineIndicatorLight("CL_A1", 480, "Caution Lights Panel", "ENG START CYCLE")
defineIndicatorLight("CL_A2", 481, "Caution Lights Panel", "L-HYD PRESS")
defineIndicatorLight("CL_A3", 482, "Caution Lights Panel", "R-HYD PRESS")
defineIndicatorLight("CL_A4", 483, "Caution Lights Panel", "GUN UNSAFE")
defineIndicatorLight("CL_B1", 484, "Caution Lights Panel", "ANTI-SKID")
defineIndicatorLight("CL_B2", 485, "Caution Lights Panel", "L-HYD RES")
defineIndicatorLight("CL_B3", 486, "Caution Lights Panel", "R-HYD RES")
defineIndicatorLight("CL_B4", 487, "Caution Lights Panel", "OXY LOW")
defineIndicatorLight("CL_C1", 488, "Caution Lights Panel", "ELEV DISENG")
defineIndicatorLight("CL_C2", 489, "Caution Lights Panel", "VOID1")
defineIndicatorLight("CL_C3", 490, "Caution Lights Panel", "SEAT NOT ARMED")
defineIndicatorLight("CL_C4", 491, "Caution Lights Panel", "BLEED AIR LEAK")
defineIndicatorLight("CL_D1", 492, "Caution Lights Panel", "AIL DISENG")
defineIndicatorLight("CL_D2", 493, "Caution Lights Panel", "L-AIL TAB")
defineIndicatorLight("CL_D3", 494, "Caution Lights Panel", "R-AIL TAB")
defineIndicatorLight("CL_D4", 495, "Caution Lights Panel", "SERVICE AIR HOT")
defineIndicatorLight("CL_E1", 496, "Caution Lights Panel", "PITCH SAS")
defineIndicatorLight("CL_E2", 497, "Caution Lights Panel", "L-ENG HOT")
defineIndicatorLight("CL_E3", 498, "Caution Lights Panel", "R-ENG HOT")
defineIndicatorLight("CL_E4", 499, "Caution Lights Panel", "WINDSHIELD HOT")
defineIndicatorLight("CL_F1", 500, "Caution Lights Panel", "YAW SAS")
defineIndicatorLight("CL_F2", 501, "Caution Lights Panel", "L-ENG OIL PRESS")
defineIndicatorLight("CL_F3", 502, "Caution Lights Panel", "R-ENG OIL PRESS")
defineIndicatorLight("CL_F4", 503, "Caution Lights Panel", "CICU")
defineIndicatorLight("CL_G1", 504, "Caution Lights Panel", "GCAS")
defineIndicatorLight("CL_G2", 505, "Caution Lights Panel", "L-MAIN PUMP")
defineIndicatorLight("CL_G3", 506, "Caution Lights Panel", "R-MAIN PUMP")
defineIndicatorLight("CL_G4", 507, "Caution Lights Panel", "VOID2")
defineIndicatorLight("CL_H1", 508, "Caution Lights Panel", "LASTE")
defineIndicatorLight("CL_H2", 509, "Caution Lights Panel", "L-WING PUMP")
defineIndicatorLight("CL_H3", 510, "Caution Lights Panel", "R-WING PUMP")
defineIndicatorLight("CL_H4", 511, "Caution Lights Panel", "HARS")
defineIndicatorLight("CL_I1", 512, "Caution Lights Panel", "IFF MODE-4")
defineIndicatorLight("CL_I2", 513, "Caution Lights Panel", "L-MAIN FUEL LOW")
defineIndicatorLight("CL_I3", 514, "Caution Lights Panel", "R-MAIN FUEL LOW")
defineIndicatorLight("CL_I4", 515, "Caution Lights Panel", "L-R TKS UNEQUAL")
defineIndicatorLight("CL_J1", 516, "Caution Lights Panel", "EAC")
defineIndicatorLight("CL_J2", 517, "Caution Lights Panel", "L-FUEL PRESS")
defineIndicatorLight("CL_J3", 518, "Caution Lights Panel", "R-FUEL PRESS")
defineIndicatorLight("CL_J4", 519, "Caution Lights Panel", "NAV")
defineIndicatorLight("CL_K1", 520, "Caution Lights Panel", "STALL SYS")
defineIndicatorLight("CL_K2", 521, "Caution Lights Panel", "L-CONV")
defineIndicatorLight("CL_K3", 522, "Caution Lights Panel", "R-CONV")
defineIndicatorLight("CL_K4", 523, "Caution Lights Panel", "CADC")
defineIndicatorLight("CL_L1", 524, "Caution Lights Panel", "APU GEN")
defineIndicatorLight("CL_L2", 525, "Caution Lights Panel", "L-GEN")
defineIndicatorLight("CL_L3", 526, "Caution Lights Panel", "R-GEN")
defineIndicatorLight("CL_L4", 527, "Caution Lights Panel", "INST INV")

defineIndicatorLight("NOSEWHEEL_STEERING", 663, "Front Dash", "Nosewheel Steering Indicator")
defineIndicatorLight("MARKER_BEACON", 664, "Front Dash", "MARKER BEACON Indicator")
defineIndicatorLight("CANOPY_UNLOCKED", 665, "Front Dash", "CANOPY UNLOCKED Indicator")

defineIndicatorLight("L_ENG_FIRE", 215, "Glare Shield", "Left Engine Fire Indicator")
defineIndicatorLight("APU_FIRE", 216, "Glare Shield", "APU Fire Indicator")
defineIndicatorLight("R_ENG_FIRE", 217, "Glare Shield", "Right Engine Fire Indicator")

defineIndicatorLight("L_AILERON_EMER_DISENGAGE", 178, "Emergency Flight Control Panel", "Left Aileron EMER DISENG Indicator")
defineIndicatorLight("R_AILERON_EMER_DISENGAGE", 179, "Emergency Flight Control Panel", "Right Aileron EMER DISENG Indicator")
defineIndicatorLight("L_ELEVATOR_EMER_DISENGAGE", 181, "Emergency Flight Control Panel", "Left Elevator EMER DISENG Indicator")
defineIndicatorLight("R_ELEVATOR_EMER_DISENGAGE", 182, "Emergency Flight Control Panel", "Right Elevator EMER DISENG Indicator")

defineIndicatorLight("TACAN_TEST", 260, "TACAN Panel", "TACAN Test Indicator Light")



definePushButton("LMFD_01", 2, 3001, 300, "Left MFCD", "OSB 1")
definePushButton("LMFD_02", 2, 3002, 301, "Left MFCD", "OSB 2")
definePushButton("LMFD_03", 2, 3003, 302, "Left MFCD", "OSB 3")
definePushButton("LMFD_04", 2, 3004, 303, "Left MFCD", "OSB 4")
definePushButton("LMFD_05", 2, 3005, 304, "Left MFCD", "OSB 5")
definePushButton("LMFD_06", 2, 3006, 305, "Left MFCD", "OSB 6")
definePushButton("LMFD_07", 2, 3007, 306, "Left MFCD", "OSB 7")
definePushButton("LMFD_08", 2, 3008, 307, "Left MFCD", "OSB 8")
definePushButton("LMFD_09", 2, 3009, 308, "Left MFCD", "OSB 9")
definePushButton("LMFD_10", 2, 3010, 309, "Left MFCD", "OSB 10")
definePushButton("LMFD_11", 2, 3011, 310, "Left MFCD", "OSB 11")
definePushButton("LMFD_12", 2, 3012, 311, "Left MFCD", "OSB 12")
definePushButton("LMFD_13", 2, 3013, 312, "Left MFCD", "OSB 13")
definePushButton("LMFD_14", 2, 3014, 313, "Left MFCD", "OSB 14")
definePushButton("LMFD_15", 2, 3015, 314, "Left MFCD", "OSB 15")
definePushButton("LMFD_16", 2, 3016, 315, "Left MFCD", "OSB 16")
definePushButton("LMFD_17", 2, 3017, 316, "Left MFCD", "OSB 17")
definePushButton("LMFD_18", 2, 3018, 317, "Left MFCD", "OSB 18")
definePushButton("LMFD_19", 2, 3019, 318, "Left MFCD", "OSB 19")
definePushButton("LMFD_20", 2, 3020, 319, "Left MFCD", "OSB 20")
defineRockerSwitch("LMFD_ADJ", 2, 3021, 3023, 3022, 3023, 320, "Left MFCD", "ADJ")
defineRockerSwitch("LMFD_DSP", 2, 3024, 3026, 3025, 3026, 321, "Left MFCD", "DSP")
defineRockerSwitch("LMFD_BRT", 2, 3027, 3029, 3028, 3029, 322, "Left MFCD", "BRT")
defineRockerSwitch("LMFD_CON", 2, 3030, 3032, 3031, 3032, 323, "Left MFCD", "CON")
defineRockerSwitch("LMFD_SYM", 2, 3033, 3035, 3034, 3035, 324, "Left MFCD", "SYM")
defineTumb("LMFD_PWR", 2, 3036, 325, 0.1, {0.0, 0.2}, nil, false, "Left MFCD", "PWR OFF - NT - DAY")

definePushButton("RMFD_01", 3, 3001, 326, "Right MFCD", "OSB 1")
definePushButton("RMFD_02", 3, 3002, 327, "Right MFCD", "OSB 2")
definePushButton("RMFD_03", 3, 3003, 328, "Right MFCD", "OSB 3")
definePushButton("RMFD_04", 3, 3004, 329, "Right MFCD", "OSB 4")
definePushButton("RMFD_05", 3, 3005, 330, "Right MFCD", "OSB 5")
definePushButton("RMFD_06", 3, 3006, 331, "Right MFCD", "OSB 6")
definePushButton("RMFD_07", 3, 3007, 332, "Right MFCD", "OSB 7")
definePushButton("RMFD_08", 3, 3008, 333, "Right MFCD", "OSB 8")
definePushButton("RMFD_09", 3, 3009, 334, "Right MFCD", "OSB 9")
definePushButton("RMFD_10", 3, 3010, 335, "Right MFCD", "OSB 10")
definePushButton("RMFD_11", 3, 3011, 336, "Right MFCD", "OSB 11")
definePushButton("RMFD_12", 3, 3012, 337, "Right MFCD", "OSB 12")
definePushButton("RMFD_13", 3, 3013, 338, "Right MFCD", "OSB 13")
definePushButton("RMFD_14", 3, 3014, 339, "Right MFCD", "OSB 14")
definePushButton("RMFD_15", 3, 3015, 340, "Right MFCD", "OSB 15")
definePushButton("RMFD_16", 3, 3016, 341, "Right MFCD", "OSB 16")
definePushButton("RMFD_17", 3, 3017, 342, "Right MFCD", "OSB 17")
definePushButton("RMFD_18", 3, 3018, 343, "Right MFCD", "OSB 18")
definePushButton("RMFD_19", 3, 3019, 344, "Right MFCD", "OSB 19")
definePushButton("RMFD_20", 3, 3020, 345, "Right MFCD", "OSB 20")
defineRockerSwitch("RMFD_ADJ", 3, 3021, 3023, 3022, 3023, 346, "Right MFCD", "ADJ")
defineRockerSwitch("RMFD_DSP", 3, 3024, 3026, 3025, 3026, 347, "Right MFCD", "DSP")
defineRockerSwitch("RMFD_BRT", 3, 3027, 3029, 3028, 3029, 348, "Right MFCD", "BRT")
defineRockerSwitch("RMFD_CON", 3, 3030, 3032, 3031, 3032, 349, "Right MFCD", "CON")
defineRockerSwitch("RMFD_SYM", 3, 3033, 3035, 3034, 3035, 350, "Right MFCD", "SYM")
defineTumb("RMFD_PWR", 3, 3036, 351, 0.1, {0.0, 0.2}, nil, false, "Right MFCD", "PWR OFF - NT - DAY")


definePushButton("CMSP_ARW1", 4, 3001, 352, "CMSP", "SET Button 1")
definePushButton("CMSP_ARW2", 4, 3002, 353, "CMSP", "SET Button 2")
definePushButton("CMSP_ARW3", 4, 3003, 354, "CMSP", "SET Button 3")
definePushButton("CMSP_ARW4", 4, 3004, 355, "CMSP", "SET Button 4")
defineRockerSwitch("CMSP_UPDN", 4, 3005, 3005, 3006, 3006, 356, "CMSP", "Cycle Program or Value Up/Down")
definePushButton("CMSP_RTN", 4, 3007, 357, "CMSP", "RTN")
defineToggleSwitch("CMSP_JTSN", 4, 3008, 358, "CMSP", "JTSN / OFF")
definePotentiometer("CMSP_BRT", 4, 3009, 359, {0.15, 0.85}, "CMSP", "Brightness")

local function defineCMSPSwitch(msg, device_id, down_command, up_command, arg_number, category, description)
	
	local alloc = moduleBeingDefined.memoryMap:allocateInt{ maxValue = 2 }
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		local lut = {["0.0"] = "0", ["0.1"] = "1", ["0.2"] = "2"}
		alloc:setValue(lut[string.format("%.1f", dev0:get_argument_value(arg_number))])
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "selector",
		momentary_positions = "last",
		physical_variant = "toggle_switch",
		inputs = {
			{ interface = "set_state", max_value = 2, description = "set the switch position -- 0 = down, 1 = centered, 2 = held up" },
		},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = alloc.address,
			  mask = alloc.mask,
			  shift_by = alloc.shiftBy,
			  max_value = 2,
			  description = "switch position: 0 - down, 1 - center, 2 - up"
			}
		}
	}
	moduleBeingDefined.inputProcessors[msg] = function(toState)
		if toState == "0" then
			toState = -1
		elseif toState == "1" then
			toState = 0
		elseif toState == "2" then
			toState = 1
		else
			return
		end
		local fromState = string.format("%.1f", GetDevice(0):get_argument_value(arg_number))
		local fslut = {["0.0"] = -1, ["0.1"] = 0, ["0.2"] = 1}
		fromState = fslut[fromState]
		local dev = GetDevice(device_id)
		if fromState == 0 and toState == 1 then dev:performClickableAction(up_command, 0.2) end
		if fromState == 1 and toState == 0 then dev:performClickableAction(up_command, 0.1) end
		if fromState == 0 and toState == -1 then dev:performClickableAction(down_command, 0.0) end
		if fromState == -1 and toState == 0 then dev:performClickableAction(down_command, 0.1) end
		if fromState == -1 and toState == 1 then
			dev:performClickableAction(down_command, 0.1)
			dev:performClickableAction(up_command, 0.2)
		end
		if fromState == 1 and toState == -1 then
			dev:performClickableAction(up_command, 0.1)
			dev:performClickableAction(down_command, 0.0)
		end
	end
end
defineCMSPSwitch("CMSP_MWS", 4, 3010, 3011, 360, "CMSP", "Missile Warning System OFF - ON - (MENU)")
defineCMSPSwitch("CMSP_JMR", 4, 3012, 3013, 361, "CMSP", "Jammer OFF - ON - (MENU)")
defineCMSPSwitch("CMSP_RWR", 4, 3014, 3015, 362, "CMSP", "Radar Warning Receiver OFF - ON - (MENU)")
defineCMSPSwitch("CMSP_DISP", 4, 3016, 3017, 363, "CMSP", "Countermeasure Dispenser OFF - ON - (MENU)")
defineTumb("CMSP_MODE", 4, 3018, 364, 0.1, {0.0, 0.4}, nil, false, "CMSP", "CMSP Mode Select")


definePushButton("CMSC_JMR", 5, 3001, 365, "CMSC", "Select Jammer Program")
definePushButton("CMSC_MWS", 5, 3002, 366, "CMSC", "Select MWS Programs (No Function)")
definePushButton("CMSC_PRI", 5, 3003, 369, "CMSC", "Toggle between 5 and 16 Priority Threats Displayed")
definePushButton("CMSC_SEP", 5, 3004, 370, "CMSC", "Separate RWR Symbols")
--definePushButton("CMSC_UNK", 5, 3005, 371, "CMSC", "Display Unknown Threats")
definePotentiometer("CMSC_BRT", 5, 3006, 367, {0.15, 0.85}, "CMSC", "Adjust Display Brightness")
definePotentiometer("CMSC_RWR_VOL", 5, 5007, 368, nil, "CMSC", "Adjust RWR Volume")


defineTumb("AHCP_MASTER_ARM", 7, 3001, 375, 0.1, {0.0, 0.2}, nil, false, "AHCP", "Master Arm TRAIN - SAFE - ARM")
defineTumb("AHCP_GUNPAC", 7, 3002, 376, 0.1, {0.0, 0.2}, nil, false, "AHCP", "GUN/PAC GUNARM - SAFE - ARM")
defineTumb("AHCP_LASER_ARM", 7, 3003, 377, 0.1, {0.0, 0.2}, nil, false, "AHCP", "Laser Arm TRAIN - SAFE - ARM")
defineToggleSwitch("AHCP_TGP", 7, 3004, 378, "AHCP", "TGP OFF - ON")
defineTumb("AHCP_ALT_SCE", 7, 3005, 379, 0.1, {0.0, 0.2}, nil, false, "AHCP", "Altimeter Source RADAR - DELTA - BARO")
defineToggleSwitch("AHCP_HUD_DAYNIGHT", 7, 3006, 380, "AHCP", "Hud Mode NIGHT - DAY")
defineToggleSwitch("AHCP_HUD_MODE", 7, 3007, 381, "AHCP", "Hud Mode STBY - NORM")
defineToggleSwitch("AHCP_CICU", 7, 3008, 382, "AHCP", "CICU OFF - ON")
defineToggleSwitch("AHCP_JTRS", 7, 3009, 383, "AHCP", "JTRS OFF - ON")
defineTumb("AHCP_IFFCC", 7, 3010, 384, 0.1, {0.0, 0.2}, nil, false, "AHCP", "IFFCC OFF - TEST - ON")


definePushButton("UFC_1", 8, 3001, 385, "UFC", "1")
definePushButton("UFC_2", 8, 3002, 386, "UFC", "2")
definePushButton("UFC_3", 8, 3003, 387, "UFC", "3")
definePushButton("UFC_4", 8, 3004, 388, "UFC", "4")
definePushButton("UFC_5", 8, 3005, 389, "UFC", "5")
definePushButton("UFC_6", 8, 3006, 390, "UFC", "6")
definePushButton("UFC_7", 8, 3007, 391, "UFC", "7")
definePushButton("UFC_8", 8, 3008, 392, "UFC", "8")
definePushButton("UFC_9", 8, 3009, 393, "UFC", "9")
definePushButton("UFC_10", 8, 3010, 394, "UFC", "10")
definePushButton("UFC_SPC", 8, 3011, 396, "UFC", "SPC")
definePushButton("UFC_HACK", 8, 3012, 394, "UFC", "HACK")
definePushButton("UFC_FUNC", 8, 3013, 397, "UFC", "FUNC")
definePushButton("UFC_LTR", 8, 3014, 398, "UFC", "LTR")
definePushButton("UFC_CLR", 8, 3015, 399, "UFC", "CLR")
definePushButton("UFC_ENT", 8, 3016, 400, "UFC", "ENT")
definePushButton("UFC_MK", 8, 3017, 401, "UFC", "MK")
definePushButton("UFC_ALT_ALRT", 8, 3018, 402, "UFC", "ALT ALRT")
defineRockerSwitch("UFC_STEER", 8, 3020, 3020, 3021, 3021, 405, "UFC", "STEER Up/Down")
defineRockerSwitch("UFC_DATA", 8, 3022, 3022, 3023, 3023, 406, "UFC", "DATA Up/Down")
defineRockerSwitch("UFC_SEL", 8, 3024, 3024, 3025, 3025, 407, "UFC", "SEL Up/Down")
defineRockerSwitch("UFC_DEPR", 8, 3026, 3026, 3027, 3027, 408, "UFC", "DEPR Up/Down")
defineRockerSwitch("UFC_INTEN", 8, 3028, 3028, 3029, 3029, 409, "UFC", "INTEN Incr/Decr")
definePushButton("UFC_NA1", 8, 3030, 531, "UFC", "No Function 1")
definePushButton("UFC_NA2", 8, 3031, 532, "UFC", "No Function 2")
definePushButton("UFC_NA3", 8, 3032, 533, "UFC", "No Function 3")
definePushButton("UFC_NA4", 8, 3033, 534, "UFC", "No Function 4")
definePushButton("UFC_NA5", 8, 3034, 535, "UFC", "No Function 5")
definePushButton("UFC_NA6", 8, 3035, 536, "UFC", "No Function 6")

definePushButton("UFC_MASTER_CAUTION", 24, 3001, 403, "UFC", "Master Caution Reset")
definePushButton("GEAR_HORN_SILENCE", 24, 3003, 127, "Landing Gear and Flap Control Panel", "Landing Gear Horn Silence")

definePushButton("CDU_LSK_3L", 9, 3001, 410, "CDU", "LSK 3L")
definePushButton("CDU_LSK_5L", 9, 3002, 411, "CDU", "LSK 5L")
definePushButton("CDU_LSK_7L", 9, 3003, 412, "CDU", "LSK 7L")
definePushButton("CDU_LSK_9L", 9, 3004, 413, "CDU", "LSK 9L")
definePushButton("CDU_LSK_3R", 9, 3005, 414, "CDU", "LSK 3R")
definePushButton("CDU_LSK_5R", 9, 3006, 415, "CDU", "LSK 5R")
definePushButton("CDU_LSK_7R", 9, 3007, 416, "CDU", "LSK 7R")
definePushButton("CDU_LSK_9R", 9, 3008, 417, "CDU", "LSK 9R")
definePushButton("CDU_SYS", 9, 3009, 418, "CDU", "SYS")
definePushButton("CDU_NAV", 9, 3010, 419, "CDU", "NAV")
definePushButton("CDU_WP", 9, 3011, 420, "CDU", "WP")
definePushButton("CDU_OSET", 9, 3012, 421, "CDU", "OSET")
definePushButton("CDU_FPM", 9, 3013, 422, "CDU", "FPM")
definePushButton("CDU_PREV", 9, 3014, 423, "CDU", "PREV")
definePushButton("CDU_1", 9, 3015, 425, "CDU", "1")
definePushButton("CDU_2", 9, 3016, 426, "CDU", "2")
definePushButton("CDU_3", 9, 3017, 427, "CDU", "3")
definePushButton("CDU_4", 9, 3018, 428, "CDU", "4")
definePushButton("CDU_5", 9, 3019, 429, "CDU", "5")
definePushButton("CDU_6", 9, 3020, 430, "CDU", "6")
definePushButton("CDU_7", 9, 3021, 431, "CDU", "7")
definePushButton("CDU_8", 9, 3022, 432, "CDU", "8")
definePushButton("CDU_9", 9, 3023, 433, "CDU", "9")
definePushButton("CDU_0", 9, 3024, 434, "CDU", "0")
definePushButton("CDU_POINT", 9, 3025, 435, "CDU", "Decimal Point")
definePushButton("CDU_SLASH", 9, 3026, 436, "CDU", "Slash")
definePushButton("CDU_A", 9, 3027, 437, "CDU", "A")
definePushButton("CDU_B", 9, 3028, 438, "CDU", "B")
definePushButton("CDU_C", 9, 3029, 439, "CDU", "C")
definePushButton("CDU_D", 9, 3030, 440, "CDU", "D")
definePushButton("CDU_E", 9, 3031, 441, "CDU", "E")
definePushButton("CDU_F", 9, 3032, 442, "CDU", "F")
definePushButton("CDU_G", 9, 3033, 443, "CDU", "G")
definePushButton("CDU_H", 9, 3034, 444, "CDU", "H")
definePushButton("CDU_I", 9, 3035, 445, "CDU", "I")
definePushButton("CDU_J", 9, 3036, 446, "CDU", "J")
definePushButton("CDU_K", 9, 3037, 447, "CDU", "K")
definePushButton("CDU_L", 9, 3038, 448, "CDU", "L")
definePushButton("CDU_M", 9, 3039, 449, "CDU", "M")
definePushButton("CDU_N", 9, 3040, 450, "CDU", "N")
definePushButton("CDU_O", 9, 3041, 451, "CDU", "O")
definePushButton("CDU_P", 9, 3042, 452, "CDU", "P")
definePushButton("CDU_Q", 9, 3043, 453, "CDU", "Q")
definePushButton("CDU_R", 9, 3044, 454, "CDU", "R")
definePushButton("CDU_S", 9, 3045, 455, "CDU", "S")
definePushButton("CDU_T", 9, 3046, 456, "CDU", "T")
definePushButton("CDU_U", 9, 3047, 457, "CDU", "U")
definePushButton("CDU_V", 9, 3048, 458, "CDU", "V")
definePushButton("CDU_W", 9, 3049, 459, "CDU", "W")
definePushButton("CDU_X", 9, 3050, 460, "CDU", "X")
definePushButton("CDU_Y", 9, 3051, 461, "CDU", "Y")
definePushButton("CDU_Z", 9, 3052, 462, "CDU", "Z")
definePushButton("CDU_NA1", 9, 3053, 464, "CDU", "No Function 1")
definePushButton("CDU_NA2", 9, 3054, 465, "CDU", "No Function 2")
definePushButton("CDU_MK", 9, 3055, 466, "CDU", "MK")
definePushButton("CDU_BCK", 9, 3056, 467, "CDU", "BCK")
definePushButton("CDU_SPC", 9, 3057, 468, "CDU", "SPC")
definePushButton("CDU_CLR", 9, 3058, 470, "CDU", "CLR")
definePushButton("CDU_FA", 9, 3059, 471, "CDU", "FA")
defineRockerSwitch("CDU_BRT", 9, 3060, 3060, 3061, 3061, 424, "CDU", "DIMBRT Rocker (No Function)")
defineRockerSwitch("CDU_PG", 9, 3062, 3062, 3063, 3063, 463, "CDU", "PG Rocker")
defineRockerSwitch("CDU_SCROLL", 9, 3064, 3064, 3065, 3065, 469, "CDU", "Scroll Waypoint Names (Blank Rocker)")
defineRockerSwitch("CDU_DATA", 9, 3066, 3066, 3067, 3067, 472, "CDU", "+/- Rocker")

defineTumb("AAP_STEERPT", 22, 3001, 473, 0.1, {0.0, 0.2}, nil, false, "AAP", "STEERPT FLTPLAN - MARK - MISSION")
defineRockerSwitch("AAP_STEER", 22, 3003, 3003, 3002, 3002, 474, "AAP", "Toggle Steerpoint")
defineTumb("AAP_PAGE", 22, 3004, 475, 0.1, {0.0, 0.3}, nil, false, "AAP", "PAGE OTHER - POSITION - STEER - WAYPT")
defineToggleSwitch("AAP_CDUPWR", 22, 3005, 476, "AAP", "CDU Power")
defineToggleSwitch("AAP_EGIPWR", 22, 3006, 477, "AAP", "EGI Power")

definePushButton("CLOCK_SET", 15, 3001, 68, "Digital Clock", "Clock SET")
definePushButton("CLOCK_CTRL", 15, 3002, 69, "Digital Clock", "Clock CTRL")
local lastClockData = nil
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	lastClockData = parse_indication(4)
end
local function getClockHH()
	if not lastClockData then return "  " end
	return lastClockData.txtHours or "  "
end
local function getClockMM()
	if not lastClockData then return "  " end
	return lastClockData.txtMinutes or "  "
end
local function getClockSS()
	if not lastClockData then return "  " end
	return lastClockData.txtSeconds or "  "
end
local function getClockETC()
	if not lastClockData then return "   " end
	return (lastClockData.txtET or "  ") .. (lastClockData.txtC or " ")
end
defineString("CLOCK_HH", getClockHH, 2, "Digital Clock", "Clock Hours (or two spaces)")
defineString("CLOCK_MM", getClockMM, 2, "Digital Clock", "Clock Minutes (or two spaces)")
defineString("CLOCK_SS", getClockSS, 2, "Digital Clock", "Clock Seconds (or two spaces)")
defineString("CLOCK_ETC", getClockETC, 3, "Digital Clock", "Clock ETC display ('ET ', '  C', or three spaces)")

defineToggleSwitch("FSCP_EXT_TANKS_WING", 36, 3001, 106, "Fuel System Control Panel", "External Wing Tanks Boost Pumps")
defineToggleSwitch("FSCP_EXT_TANKS_FUS", 36, 3002, 107, "Fuel System Control Panel", "External Fuselage Tanks Boost Pumps")
defineToggleSwitch("FSCP_TK_GATE", 36, 3003, 108, "Fuel System Control Panel", "TK Gate")
defineToggleSwitch("FSCP_CROSSFEED", 36, 3004, 109, "Fuel System Control Panel", "Crossfeed")
defineToggleSwitch("FSCP_BOOST_WING_L", 36, 3005, 110, "Fuel System Control Panel", "Boost Pumps Left Wing")
defineToggleSwitch("FSCP_BOOST_WING_R", 36, 3006, 111, "Fuel System Control Panel", "Boost Pumps Right Wing")
defineToggleSwitch("FSCP_BOOST_MAIN_L", 36, 3007, 112, "Fuel System Control Panel", "Boost Pumps Main Fuselage Left")
defineToggleSwitch("FSCP_BOOST_MAIN_R", 36, 3008, 113, "Fuel System Control Panel", "Boost Pumps Main Fuselage Right")
defineToggleSwitch("FSCP_AMPL", 36, 3009, 114, "Fuel System Control Panel", "Signal Amplifier NORM - OVERRIDE")
definePushButton("FSCP_LINE_CHECK", 36, 3010, 115, "Fuel System Control Panel", "Line Check")
definePushButton("FSCP_FD_WING_L", 36, 3012, 117, "Fuel System Control Panel", "Fill Disable Wing Left")
definePushButton("FSCP_FD_WING_R", 36, 3013, 118, "Fuel System Control Panel", "Fill Disable Wing Right")
definePushButton("FSCP_FD_MAIN_L", 36, 3014, 119, "Fuel System Control Panel", "Fill Disable Main Left")
definePushButton("FSCP_FD_MAIN_R", 36, 3015, 120, "Fuel System Control Panel", "Fill Disable Main Right")
defineToggleSwitch("FSCP_RCVR_LEVER", 36, 3016, 121, "Fuel System Control Panel", "Aerial Refueling Slipway Control Lever")

definePushButton("FQIS_TEST", 36, 3018, 646, "Fuel Panel", "Fuel Gauge Test")
defineTumb("FQIS_SELECT", 36, 3017, 645, 0.1, {0.0, 0.4}, nil, false, "Fuel Panel", "Fuel Display Selector")

defineToggleSwitch("ENGINE_FUEL_FLOW_L", 37, 3001, 122, "Throttle", "Fuel Flow L")
defineToggleSwitch("ENGINE_FUEL_FLOW_R", 37, 3002, 123, "Throttle", "Fuel Flow R")
defineRockerSwitch("ENGINE_OPER_L", 37, 3003, 3003, 3007, 3007, 124, "Throttle", "ENG OPER L")
defineRockerSwitch("ENGINE_OPER_R", 37, 3004, 3004, 3008, 3008, 125, "Throttle", "ENG OPER R")
defineToggleSwitch("ENGINE_APU_START", 37, 3005, 126, "Throttle", "APU START")
definePotentiometer("ENGINE_THROTTLE_FRICTION", 37, 3006, 128, nil, "Throttle", "Friction Control")

definePushButton("ENGINE_TEMS_DATA", 37, 3009, 652, "Landing Gear and Flap Control Panel", "TEMS Data")

defineTumb("LASTE_AP_MODE", 38, 3001, 132, 1, {-1, 1}, nil, false, "LASTE Panel", "AP MODE")
definePushButton("LASTE_AP_TOGGLE", 38, 3002, 131, "LASTE Panel", "Autopilot Engage/Disengage")
defineElectricallyHeldSwitch("LASTE_EAC", 38, 3026, 3027, 129, "LASTE Panel", "EAC On/Off")
defineToggleSwitch("LASTE_RDR_ALTM", 67, 3001, 130, "LASTE Panel", "Radar Altimeter")

defineElectricallyHeldSwitch("SASP_YAW_SAS_L", 38, 3003, 3004, 185, "SAS Panel", "Yaw SAS Left OFF - ENGAGE")
defineElectricallyHeldSwitch("SASP_YAW_SAS_R", 38, 3005, 3006, 186, "SAS Panel", "Yaw SAS Right OFF - ENGAGE")
defineElectricallyHeldSwitch("SASP_PITCH_SAS_L", 38, 3007, 3008, 187, "SAS Panel", "Pitch SAS Left OFF - ENGAGE")
defineElectricallyHeldSwitch("SASP_PITCH_SAS_R", 38, 3009, 3010, 188, "SAS Panel", "Pitch SAS Right OFF - ENGAGE")
defineTumb("SASP_MONITOR_TEST", 38, 3011, 189, 1, {-1, 1}, nil, false, "SAS Panel", "Monitor Test Left/Right")
definePushButton("SASP_TO_TRIM", 38, 3012, 190, "SAS Panel", "T/O Trim Button")
definePotentiometer("SASP_YAW_TRIM", 38, 3013, 192, {-1, 1}, "SAS Panel", "Yaw Trim")


defineToggleSwitch("EFCP_SPDBK_EMER_RETR", 38, 3015, 174, "Emergency Flight Control Panel", "Speed Brake Emergency Retract")
defineToggleSwitch("EFCP_TRIM_OVERRIDE", 38, 3016, 175, "Emergency Flight Control Panel", "Pitch/Roll Trim Override EMER - NORM")
defineTumb("EFCP_EMER_TRIM", 38, 3025, 176, 0.1, {0.0, 0.4}, nil, false, "Emergency Flight Control Panel", "Emergency Trim CENTER - NOSE DN - RWD - NOSE UP - LWD")
moduleBeingDefined.inputProcessors["EFCP_EMER_TRIM"] = function(args)
	local currentState = tonumber(string.format("%1.1f", GetDevice(0):get_argument_value(176)):sub(3))
	if args == "INC" then
		args = tostring(currentState + 1)
		if args == "5" then args = "0" end
	elseif args == "DEC" then
		args = tostring(currentState - 1)
		if args == "-1" then args = "4" end
	end
	
	if args == "0" then
		GetDevice(38):performClickableAction(3025, 0)
	elseif args == "1" then
		GetDevice(38):performClickableAction(3025, 0)
		GetDevice(38):performClickableAction(3017, 0.1)
	elseif args == "2" then
		GetDevice(38):performClickableAction(3025, 0)
		GetDevice(38):performClickableAction(3018, 0.2)
	elseif args == "3" then
		GetDevice(38):performClickableAction(3025, 0)
		GetDevice(38):performClickableAction(3019, 0.3)
	elseif args == "4" then
		GetDevice(38):performClickableAction(3025, 0)
		GetDevice(38):performClickableAction(3020, 0.4)
	end
	
	
end
defineTumb("EFCP_AILERON_EMER_DISENGAGE", 38, 3021, 177, 1, {-1, 1}, nil, false, "Emergency Flight Control Panel", "Aileron Emergency Disengage LEFT - OFF - RIGHT")
defineTumb("EFCP_ELEVATOR_EMER_DISENGAGE", 38, 3022, 180, 1, {-1, 1}, nil, false, "Emergency Flight Control Panel", "Elevator Emergency Disengage LEFT - OFF - RIGHT")
defineToggleSwitch("EFCP_FLAPS_EMER_RETR", 38, 3023, 183, "Emergency Flight Control Panel", "Flaps Emergency Retract")
defineToggleSwitch("EFCP_MRFCS", 38, 3024, 184, "Emergency Flight Control Panel", "Manual Reversion Flight Control System MAN REVERSION - NORM")


defineToggleSwitch("EPP_APU_GEN_PWR", 1, 3001, 241, "Electrical Power Panel", "APU GEN PWR")
defineTumb("EPP_INVERTER", 1, 3002, 242, 1, {-1, 1}, nil, false, "Electrical Power Panel", "Inverter TEST - OFF - STBY")
defineToggleSwitch("EPP_AC_GEN_PWR_L", 1, 3004, 244, "Electrical Power Panel", "AC GEN PWR Left")
defineToggleSwitch("EPP_AC_GEN_PWR_R", 1, 3005, 245, "Electrical Power Panel", "AC GEN PWR Right")
defineToggleSwitch("EPP_BATTERY_PWR", 1, 3006, 246, "Electrical Power Panel", "Battery Power")
defineToggleSwitch("EPP_EMER_FLOOD", 49, 3007, 243, "Electrical Power Panel", "Emergency Flood Light")

defineToggleSwitch("GEAR_LEVER", 39, 3001, 716, "Landing Gear and Flap Control Panel", "Gear Lever DOWN - UP")
definePushButton("DOWNLOCK_OVERRIDE", 39, 3003, 651, "Landing Gear and Flap Control Panel", "Downlock Override Button")
defineTumb("FLAPS_SWITCH", 39, 3002, 773, 0.5, {0.0, 1.0}, nil, false, "Throttle", "Flaps Setting DN - MVR - UP")
defineElectricallyHeldSwitch("ANTI_SKID_SWITCH", 38, 3028, 3029, 654, "Landing Gear and Flap Control Panel", "Anti-Skid Switch")


definePushButton("NMSP_HARS_BTN", 46, 3001, 605, "NMSP", "HARS Button")
defineIndicatorLight("NMSP_HARS_LED", 606, "NMSP", "HARS Button LED")
definePushButton("NMSP_EGI_BTN", 46, 3002, 607, "NMSP", "EGI Button")
defineIndicatorLight("NMSP_EGI_LED", 608, "NMSP", "EGI Button LED")
definePushButton("NMSP_TISL_BTN", 46, 3003, 609, "NMSP", "TISL Button (No Function)")
defineIndicatorLight("NMSP_TISL_LED", 610, "NMSP", "TISL Button LED")
definePushButton("NMSP_STEERPT_BTN", 46, 3004, 611, "NMSP", "STEERPT Button")
defineIndicatorLight("NMSP_STEERPT_LED", 612, "NMSP", "STEERPT Button LED")
definePushButton("NMSP_ANCHR_BTN", 46, 3005, 613, "NMSP", "ANCHR Button")
defineIndicatorLight("NMSP_ANCHR_LED", 614, "NMSP", "ANCHR Button LED")
definePushButton("NMSP_TCN_BTN", 46, 3006, 615, "NMSP", "TCN Button")
defineIndicatorLight("NMSP_TCN_LED", 616, "NMSP", "TCN Button LED")
definePushButton("NMSP_ILS_BTN", 46, 3007, 617, "NMSP", "ILS Button")
defineIndicatorLight("NMSP_ILS_LED", 618, "NMSP", "ILS Button LED")
defineToggleSwitch("NMSP_ABLE_STOW", 46, 3008, 621, "NMSP", "Able/Stow Localizer Bars")


defineTumb("TISL_MODE", 57, 3001, 622, 0.1, {0.0, 0.4}, nil, false, "TISL Panel", "TISL Mode")
defineTumb("TISL_SLANT_RANGE", 57, 3002, 623, 1, {-1, 1}, nil, false, "TISL Panel", "Slant Range UNDER 5 - 5 - 10")
defineTumb("TISL_ALT_10000", 57, 3003, 624, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, "skiplast", "TISL Panel", "Altitude Above Target, 10000 ft")
defineTumb("TISL_ALT_1000", 57, 3004, 626, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, "skiplast", "TISL Panel", "Altitude Above Target, 1000 ft")
defineTumb("TISL_CODE1", 57, 3005, 636, 0.05, {0, 1}, {"0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "0"}, "skiplast", "TISL Panel", "Code Wheel 1")
defineTumb("TISL_CODE2", 57, 3006, 638, 0.05, {0, 1}, {"0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "0"}, "skiplast", "TISL Panel", "Code Wheel 2")
defineTumb("TISL_CODE3", 57, 3007, 640, 0.05, {0, 1}, {"0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "0"}, "skiplast", "TISL Panel", "Code Wheel 3")
defineTumb("TISL_CODE4", 57, 3008, 642, 0.05, {0, 1}, {"0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "0"}, "skiplast", "TISL Panel", "Code Wheel 4")
defineTumb("TISL_AUX", 57, 3009, 644, 1, {-1, 1}, nil, false, "TISL Panel", "TISL AUX Switch")
definePushButton("TISL_ENTER", 57, 3010, 628, "TISL Panel", "TISL ENTER")
definePushButton("TISL_BITE", 57, 3011, 632, "TISL Panel", "TISL BITE")
--definePushButton("TISL_OVERTEMP", 57, 3012, 630, "TISL Panel", "TISL OVER TEMP")
--definePushButton("TISL_TRACK", 57, 3013, 634, "TISL Panel", "TISL TRACK")
defineIndicatorLight("TISL_ENTER_L", 629, "TISL Panel", "TISL ENTER Light")
defineIndicatorLight("TISL_OVERTEMP_L", 631, "TISL Panel", "TISL OVER TEMP Light")
defineIndicatorLight("TISL_BITE_L", 633, "TISL Panel", "TISL BITE Light")
defineIndicatorLight("TISL_TRACK_L", 635, "TISL Panel", "TISL TRACK Light")


definePushButton("EXT_STORES_JETTISON", 12, 3001, 101, "Glare Shield", "External Stores Jettison Button")

definePushButton("LAMP_TEST_BTN", 24, 3002, 197, "Auxiliary Light Control Panel", "Signal Lights Test")

defineToggleSwitch("GND_SAFE_OVERRIDE_COVER", 12, 3002, 709, "Misc", "Ground Safety Override Switch Cover")
defineToggleSwitch("GND_SAFE_OVERRIDE", 12, 3003, 710, "Misc", "Ground Safety Override")

defineFixedStepTumb("IFF_CODE", 43, 3007, 199, 0.1, {0.0, 0.3}, {1, -1}, nil, "IFF", "IFF Code: ZERO - B - A - (HOLD)")
defineTumb("IFF_MASTER", 43, 3008, 200, 0.1, {0, 0.4}, nil, true, "IFF", "IFF Master: OFF - STBY - LOW - NORM - EMER")
define3PosTumb("IFF_OUT_AUDIO_LIGHT", 43, 3009, 201, "IFF", "IFF Out: LIGHT - OFF - AUDIO")
defineTumb("IFF_TEST_M1", 43, 3010, 202, 1, {-1, 1}, nil, true, "IFF", "Test M-1")
defineTumb("IFF_TEST_M2", 43, 3011, 203, 1, {-1, 1}, nil, true, "IFF", "Test M-2")
defineTumb("IFF_TEST_M3", 43, 3012, 204, 1, {-1, 1}, nil, true, "IFF", "Test M-3")
defineTumb("IFF_TEST_M4", 43, 3013, 205, 1, {-1, 1}, nil, true, "IFF", "Test M-4")
defineTumb("IFF_RADTEST", 43, 3014, 206, 1, {-1, 1}, nil, true, "IFF", "RAD Test/Mon")
defineTumb("IFF_MIC_IDENT", 43, 3015, 207, 1, {-1, 1}, nil, true, "IFF", "RAD Test/Mon")
defineToggleSwitch("IFF_ON_OUT", 43, 3016, 208, "IFF", "IFF On/Out")
defineTumb("IFF_MODE1_WHEEL1", 43, 3001, 209, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-1 Wheel 1")
defineTumb("IFF_MODE1_WHEEL2", 43, 3002, 210, 0.1, {0.0, 0.3}, nil, true, "IFF", "Mode-1 Wheel 2")
defineTumb("IFF_MODE3A_WHEEL1", 43, 3003, 211, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-3A Wheel 1")
defineTumb("IFF_MODE3A_WHEEL2", 43, 3004, 212, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-3A Wheel 2")
defineTumb("IFF_MODE3A_WHEEL3", 43, 3005, 213, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-3A Wheel 3")
defineTumb("IFF_MODE3A_WHEEL4", 43, 3006, 214, 0.1, {0.0, 0.7}, nil, true, "IFF", "Mode-3A Wheel 4")
definePushButton("IFF_REPLY_TEST", 43, 3017, 795, "IFF", "REPLY Push to Test")
definePotentiometer("IFF_REPLY_DIM", 43, 3020, 900, {0.0, 1.0}, "IFF", "IFF Reply Dim")
definePushButton("IFF_TEST_TEST", 43, 3018, 796, "IFF", "TEST Push to Test")
definePotentiometer("IFF_TEST_DIM", 43, 3021, 901, {0.0, 1.0}, "IFF", "TEST Reply Dim")


defineTumb("OXY_EMERGENCY", 40, 3003, 601, 1, {-1, 1}, nil, false, "Oxygen Regulator Panel", "Oxygen Flow: Emergency / Normal / Test")
defineToggleSwitch("OXY_DILUTER", 40, 3002, 602, "Oxygen Regulator Panel", "Oxygen Normal/100%")
defineToggleSwitch("OXY_SUPPLY", 40, 3001, 603, "Oxygen Regulator Panel", "Oxygen Supply On/Off")
defineFloat("OXY_PRESS", 604, {0, 1}, "Oxygen Regulator Panel", "Oxygen Pressure Indicator")
defineIndicatorLight("OXY_FLOW", 600, "Oxygen Regulator Panel", "Flow Indicator (on/off)")

defineFloat("OXY_VOLUME", 274, {0, 1}, "Environment Control Panel", "Oxygen Volume (0 to 5 liters)")
defineFloat("CABIN_PRESS_ALT", 281, {0, 1}, "Environment Control Panel", "Cabin Pressure Altitude")
definePushButton("ENVCP_OXY_TEST", 41, 3001, 275, "Environment Control Panel", "Oxygen Indicator Test")
defineToggleSwitch("ENVCP_WINDSHIELD_DEFOG", 41, 3002, 276, "Environment Control Panel", "Windshield Defog/Deice")
definePotentiometer("ENVCP_CANOPY_DEFOG", 41, 3003, 277, {0.0, 1.0}, "Environment Control Panel", "Canopy Defog")
define3PosTumb("ENVCP_WRRW", 41, 3004, 278, "Environment Control Panel", "Windshield Rain Removal/Wash")
defineToggleSwitch("ENVCP_PITOT_HEAT", 41, 3005, 279, "Environment Control Panel", "Pitot Heat")
defineToggleSwitch("ENVCP_BLEED_AIR", 41, 3006, 280, "Environment Control Panel", "Bleed Air")
define3PosTumb("ENVCP_TEMP_PRESS", 41, 3007, 282, "Environment Control Panel", "Temperature/Pressure Control")
local dummyAlloc = moduleBeingDefined.memoryMap:allocateInt { maxValue = 7 }
defineToggleSwitch("ENVCP_AIR_SUPPLY", 41, 3008, 283, "Environment Control Panel", "Main Air Supply")
definePotentiometer("ENVCP_FLOW_LEVEL", 41, 3009, 284, {0.0, 1.0}, "Environment Control Panel", "Flow Level")
definePotentiometer("ENVCP_TEMP_LEVEL", 41, 3013, 286, {0.0, 1.0}, "Environment Control Panel", "Temp Level Control")
defineTumb("ENVCP_AC_OPER", 41, 3010, 285, 0.1, {0.0, 0.3}, nil, false, "Environment Control Panel", "Air Conditioner MAN/AUTO/COLD/HOT")

do
	local function breaker(msg, command, arg_number, description)
		definePushButton(msg, 1, command, arg_number, "Circuit Breaker Panel", description.." Circuit Breaker")
	end
	local breakers = {
	"AILERON DISC L",
	"AILERON DISC R",
	"SPS RUDDER AUTH LIM",
	"ELEVATION DISC L",
	"ELEVATION DISC R",
	"AILERON TAB L",
	"AILERON TAB R",
	"EMER FLAP",
	"EMER TRIM",
	"GEAR",
	"ENG START L",
	"ENG START R",
	"APU CONT",
	"ENG IGNITOR 1",
	"ENG IGNITOR 2",
	"FUEL SHUTOFF L",
	"FUEL SHUTOFF R",
	"DC FUEL PUMP",
	"BLEED AIR CONT L",
	"BLEED AIR CONT R",
	"EXT STORES JETT 1",
	"EXT STORES JETT 2",
	"STBY ATT IND",
	"MASTER CAUTION",
	"PITOT HEAT AC",
	"IFF",
	"UHF",
	"INTERCOM",
	"GEN CONT L",
	"GEN CONT R",
	"CONVERTER L",
	"AUX ESS BUS 0A",
	"AUX ESS BUS 0B",
	"AUX ESS BUS 0C",
	"BAT BUS TRANS",
	"INVERTER PWR",
	"INVERTER CONT",
	"AUX ESS BUS TIE"
	}
	for k, v in ipairs(breakers) do
		breaker("CBP_"..v:gsub(" ", "_"), 3006 + k, 665 + k, v)
	end
end


defineRotary("ALT_SET_PRESSURE", 35, 3001, 62, "Altimeter", "Set Pressure")
defineRockerSwitch("ALT_ELECT_PNEU", 62, 3002, 3002, 3001, 3001, 60, "Altimeter", "ELECT / PNEU")


defineTumb("LCP_POSITION", 49, 3008, 287, 1, {-1, 1}, nil, false, "Light System Control Panel", "Position Lights FLASH/OFF/STEADY")
-- skip 3 bits in the memory map to preserve backwards compatibility:
local dummyAlloc = moduleBeingDefined.memoryMap:allocateInt{ maxValue = 7 }
definePotentiometer("LCP_FORMATION", 49, 3009, 288, {0, 1}, "Light System Control Panel", "Formation Lights")
defineElectricallyHeldSwitch("LCP_ANTICOLLISION", 49, 3010, 3011, 289, "Light System Control Panel", "Anticollision Lights")
definePotentiometer("LCP_ENG_INST", 49, 3001, 290, {0, 1}, "Light System Control Panel", "Engine Instrument Lights")
defineToggleSwitch("LCP_NOSE_ILLUM", 49, 3012, 291, "Light System Control Panel", "Nose Illumination")
definePotentiometer("LCP_FLIGHT_INST", 49, 3002, 292, {0, 1}, "Light System Control Panel", "Flight Instrument Lights")
definePotentiometer("LCP_AUX_INST", 49, 3003, 293, {0, 1}, "Light System Control Panel", "Aux Instrument Lights")
defineToggleSwitch("LCP_SIGNAL_LIGHTS", 49, 3013, 294, "Light System Control Panel", "Signal Lights")
defineToggleSwitch("LCP_ACCEL_COMP", 49, 3004, 295, "Light System Control Panel", "Accelerometer and Compass Lights")
definePotentiometer("LCP_FLOOD", 49, 3005, 296, {0, 1}, "Light System Control Panel", "Flood Lights")
definePotentiometer("LCP_CONSOLE", 49, 3006, 297, {0, 1}, "Light System Control Panel", "Console Lights")

define3PosTumb1("LANDING_LIGHTS", 49, 3014, 655, "Landing Gear and Flap Control Panel", "Landing Lights TAXI/OFF/LAND")

definePotentiometer("ALCP_RSIL", 49, 3015, 193, {0, 1}, "Auxiliary Light Control Panel", "Refuel Status Indexer Lights")
definePotentiometer("ALCP_WPNSTA", 49, 3016, 195, {0, 1}, "Auxiliary Light Control Panel", "Weapon Station Lights (No Function)")
define3PosTumb1("ALCP_NVIS_LTS", 49, 3017, 194, "Auxiliary Light Control Panel", "Nightvision Lights")
definePotentiometer("ALCP_RCVR_LTS", 49, 3018, 116, {0, 1}, "Auxiliary Light Control Panel", "Refueling Lighting Dial")
defineToggleSwitch("ALCP_HARSSAS", 38, 3031, 196, "Auxiliary Light Control Panel", "HARS-SAS Override/Norm")
definePushButton("ALCP_FDBA_TEST", 24, 3004, 198, "Auxiliary Light Control Panel", "Fire Detect Bleed Air Test")


defineToggleSwitch("FIRE_LENG_PULL", 50, 3001, 102, "Glare Shield", "Left Engine Fire T-Handle")
defineToggleSwitch("FIRE_APU_PULL", 50, 3002, 103, "Glare Shield", "APU Fire T-Handle")
defineToggleSwitch("FIRE_RENG_PULL", 50, 3003, 104, "Glare Shield", "Right Engine Fire T-Handle")
define3PosTumb1("FIRE_EXT_DISCH", 50, 3004, 105, "Glare Shield", "Fire Extinguisher Discharge Left/Off/Right")

defineVariableStepTumb("HSI_CRS_KNOB", 45, 3002, 44, 1.0, "HSI", "Course Select Knob")
defineVariableStepTumb("HSI_HDG_KNOB", 45, 3001, 45, 1.0, "HSI", "Heading Select Knob")

definePotentiometer("ADI_PITCH_TRIM", 47, 3001, 22, {-.5, .5}, "ADI", "ADI Pitch Trim")

definePushButton("SAI_CAGE", 48, 3002, 67, "Standby Attitude Indicator", "Cage SAI")
defineRotary("SAI_PITCH_TRIM", 48, 3003, 66, "Standby Attitude Indicator", "SAI Pitch Trim")

defineString("TACAN_CHANNEL", getTacanChannel, 4, "TACAN Panel", "TACAN Channel")
definePushButton("TACAN_TEST_BTN", 74, 3004, 259, "TACAN Panel", "TACAN Test Button")
definePotentiometer("TACAN_VOL", 74, 3005, 261, {0, 1}, "TACAN Panel", "TACAN Signal Volume")

defineFixedStepTumb("TACAN_10", 74, 3001, 256, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Left Channel Selector")
defineFixedStepTumb("TACAN_1", 74, 3002, 257, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Right Channel Selector")
defineToggleSwitch("TACAN_XY", 74, 3003, 258, "TACAN Panel", "TACAN Channel X/Y Toggle")

local docentry = moduleBeingDefined.documentation["TACAN Panel"]["TACAN_1"]
docentry.inputs[#docentry.inputs+1] = { interface = "action", argument = "TOGGLE_XY", description = "Toggle TACAN Channel X/Y" }
local oldInputHandler = moduleBeingDefined.inputProcessors["TACAN_1"]
moduleBeingDefined.inputProcessors["TACAN_1"] = function(args)
	if args == "TOGGLE_XY" then
		if GetDevice(0):get_argument_value(266) == 0 then
			GetDevice(74):performClickableAction(3003, 1)
		else
			GetDevice(74):performClickableAction(3003, 0)
		end	
	else
		oldInputHandler(args)
	end
end

defineTumb("TACAN_MODE", 74, 3006, 262, 0.1, {0.0, 0.4}, nil, false, "TACAN Panel", "TACAN Mode Dial")


definePotentiometer("STALL_VOL", 52, 3001, 704, nil, "Stall System Volume Controls", "Stall Volume")
definePotentiometer("STALL_PEAK_VOL", 52, 3002, 705, nil, "Stall System Volume Controls", "Peak Volume")


defineToggleSwitch("ILS_PWR", 53, 3001, 247, "ILS Panel", "ILS Power")
defineSetCommandTumb("ILS_MHZ", 53, 3002, 248, 0.1, {0.0, 0.3}, {"108", "109", "110", "111"}, false, "ILS Panel", "ILS Frequency MHz")
defineSetCommandTumb("ILS_KHZ", 53, 3003, 249, 0.1, {0.0, 0.9}, {"10", "15", "30", "35", "50", "55", "70", "75", "90", "95"}, false, "ILS Panel", "ILS Frequency KHz")
definePotentiometer("ILS_VOL", 53, 3004, 250, {0, 1}, "ILS Panel", "ILS Volume")
--defineString("ILS_FREQUENCY", getILSFrequency, "ILS Panel", "ILS Frequency")


defineTumb("UHF_PRESET_SEL", 54, 3001, 161, 0.05, {0.0, 1.0}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, false, "UHF Radio", "UHF Preset Channel Selector")
defineTumb("UHF_100MHZ_SEL", 54, 3002, 162, 0.1, {0.0, 0.2}, {"2", "3", "A"}, false, "UHF Radio", "UHF 100MHz Selector")
defineTumb("UHF_10MHZ_SEL", 54, 3003, 163, 0.1, {0.0, 0.9}, nil, false, "UHF Radio", "UHF 10MHz Selector")
defineTumb("UHF_1MHZ_SEL", 54, 3004, 164, 0.1, {0.0, 0.9}, nil, false, "UHF Radio", "UHF 1MHz Selector")
defineTumb("UHF_POINT1MHZ_SEL", 54, 3005, 165, 0.1, {0.0, 0.9}, nil, false, "UHF Radio", "UHF 0.1MHz Selector")
defineTumb("UHF_POINT25_SEL", 54, 3006, 166, 0.1, {0.0, 0.3}, {"00", "25", "50", "75"}, false, "UHF Radio", "UHF 0.25MHz Selector")
define3PosTumb1("UHF_MODE", 54, 3007, 167, "UHF Radio", "Frequency Mode Dial MNL/PRESET/GRD")
defineTumb("UHF_FUNCTION", 54, 3008, 168, 0.1, {0.0, 0.3}, nil, false, "UHF Radio", "UHF Function Dial OFF/MAIN/BOTH/ADF")
defineTumb("UHF_T_TONE", 54, 3009, 169, 1, {-1, 1}, nil, false, "UHF Radio", "T-Tone Button")
defineToggleSwitch("UHF_SQUELCH", 54, 3010, 170, "UHF Radio", "Squelch Switch")
definePotentiometer("UHF_VOL", 54, 3011, 171, {0, 1}, "UHF Radio", "UHF Volume Control")
definePushButton("UHF_TEST", 54, 3012, 172, "UHF Radio", "Display Test Button")
definePushButton("UHF_STATUS", 54, 3013, 173, "UHF Radio", "Status Button")
definePushButton("UHF_LOAD", 54, 3015, 735, "UHF Radio", "Load Button")
defineToggleSwitch("UHF_COVER", 54, 3014, 734, "UHF Radio", "Load Button Cover")
defineString("UHF_FREQUENCY", getUHFFrequency, 7, "UHF Radio", "UHF Frequency Display")
defineString("UHF_PRESET", getUHFPreset, 2, "UHF Radio", "UHF Preset Display")

moduleBeingDefined.inputProcessors["SET_UHF"] = function(freq)
	freq = freq:gsub("%.", "")
	freq = tonumber(freq)
	if type(freq) == "nil" then return end
	
	GetDevice(54):set_frequency(freq*1000)
end

defineSetCommandTumb("VHFAM_PRESET", 55, 3001, 137, 0.01, {0.0, 0.19}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, true, "VHF AM Radio", "Preset Channel Selector")
defineMultipositionSwitch("VHFAM_MODE", 55, 3003, 138, 3, 0.1, "VHF AM Radio", "Mode OFF/TR/DF")
defineMultipositionSwitch("VHFAM_FREQEMER", 55, 3004, 135, 4, 0.1, "VHF AM Radio", "Frequency Selection Dial FM/AM/MAN/PRE")
definePotentiometer("VHFAM_VOL", 55, 3005, 133, {0, 1}, "VHF AM Radio", "VHF AM Volume Control")
definePushButton("VHFAM_LOAD", 55, 3006, 136, "VHF AM Radio", "Load Button")
defineTumb("VHFAM_SQUELCH", 55, 3007, 134, 1, {-1, 1}, nil, false, "VHF AM Radio", "Squelch")
defineRadioWheel("VHFAM_FREQ1", 55, 3009, 3010, {-0.1, 0.1}, 143, 0.05, {0.15, 0.80}, {" 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15"}, "VHF AM Radio", "Frequency Selector 1")
defineRadioWheel("VHFAM_FREQ2", 55, 3011, 3012, {-0.1, 0.1}, 144, 0.1, {0, 1.0}, nil, "VHF AM Radio", "Frequency Selector 2")
defineRadioWheel("VHFAM_FREQ3", 55, 3013, 3014, {-0.1, 0.1}, 145, 0.1, {0, 1.0}, nil, "VHF AM Radio", "Frequency Selector 3")
defineRadioWheel("VHFAM_FREQ4", 55, 3015, 3016, {-0.25, 0.25}, 146, 0.25, {0, 1.0}, {"00", "25", "50", "75"}, "VHF AM Radio", "Frequency Selector 4")

moduleBeingDefined.inputProcessors["SET_VHF_AM"] = function(freq)
	freq = freq:gsub("%.", "")
	freq = tonumber(freq)
	if type(freq) == "nil" then return end
	
	GetDevice(55):set_frequency(freq*1000)
end

--defineString("VHF_AM_FREQUENCY", getVhfAmFreqency, "VHF AM Radio", "VHF AM Frequency")

defineSetCommandTumb("VHFFM_PRESET", 56, 3001, 151, 0.01, {0.0, 0.19}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, true, "VHF FM Radio", "Preset Channel Selector")
defineMultipositionSwitch("VHFFM_MODE", 56, 3003, 152, 3, 0.1, "VHF FM Radio", "Mode OFF/TR/DF")
defineMultipositionSwitch("VHFFM_FREQEMER", 56, 3004, 149, 4, 0.1, "VHF FM Radio", "Frequency Selection Dial FM/AM/MAN/PRE")
definePotentiometer("VHFFM_VOL", 56, 3005, 147, {0, 1}, "VHF FM Radio", "VHF FM Volume Control")
definePushButton("VHFFM_LOAD", 56, 3006, 150, "VHF FM Radio", "Load Button")
defineTumb("VHFFM_SQUELCH", 56, 3007, 148, 1, {-1, 1}, nil, false, "VHF FM Radio", "Squelch")
defineRadioWheel("VHFFM_FREQ1", 56, 3009, 3010, {-0.1, 0.1}, 157, 0.05, {0.15, 0.80}, {" 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15"}, "VHF FM Radio", "Frequency Selector 1")
defineRadioWheel("VHFFM_FREQ2", 56, 3011, 3012, {-0.1, 0.1}, 158, 0.1, {0, 1.0}, nil, "VHF FM Radio", "Frequency Selector 2")
defineRadioWheel("VHFFM_FREQ3", 56, 3013, 3014, {-0.1, 0.1}, 159, 0.1, {0, 1.0}, nil, "VHF FM Radio", "Frequency Selector 3")
defineRadioWheel("VHFFM_FREQ4", 56, 3015, 3016, {-0.25, 0.25}, 160, 0.25, {0, 1.0}, {"00", "25", "50", "75"}, "VHF FM Radio", "Frequency Selector 4")

moduleBeingDefined.inputProcessors["SET_VHF_FM"] = function(freq)
	freq = freq:gsub("%.", "")
	freq = tonumber(freq)
	if type(freq) == "nil" then return end
	
	GetDevice(56):set_frequency(freq*1000)
end


--defineString("VHF_FM_FREQUENCY", getVhfFmFreqency, "VHF FM Radio", "VHF FM Frequency")


defineRockerSwitch("SEAT_ADJUST", 39, 3004, 3004, 3005, 3005, 770, "Misc", "Seat Adjust")
--defineString("T", function(d) return string.format("%f", d:get_argument_value(712)) end)
defineTumb("CANOPY_OPEN", 39, 3007, 712, 0.5, {0.0, 1.0}, nil, false, "Misc", "Canopy Open Switch")

defineToggleSwitch("EMER_BRAKE", 38, 3030, 772, "Misc", "Emergency Brake")

definePotentiometer("INT_INT_VOL", 58, 3002, 221, {0, 1}, "Intercom Panel", "INT Volume")
defineTumb("INT_INT_UNMUTE", 58, 3001, 222, 1, {0, 1}, nil, false, "Intercom Panel", "INT Un-Mute")
definePotentiometer("INT_FM_VOL", 58, 3004, 223, {0, 1}, "Intercom Panel", "FM Volume")
defineTumb("INT_FM_UNMUTE", 58, 3003, 224, 1, {0, 1}, nil, false, "Intercom Panel", "FM Un-Mute")
definePotentiometer("INT_VHF_VOL", 58, 3006, 225, {0, 1}, "Intercom Panel", "VHF Volume")
defineTumb("INT_VHF_UNMUTE", 58, 3005, 226, 1, {0, 1}, nil, false, "Intercom Panel", "VHF Un-Mute")
definePotentiometer("INT_UHF_VOL", 58, 3008, 227, {0, 1}, "Intercom Panel", "UHF Volume")
defineTumb("INT_UHF_UNMUTE", 58, 3007, 228, 1, {0, 1}, nil, false, "Intercom Panel", "UHF Un-Mute")
definePotentiometer("INT_AIM_VOL", 58, 3010, 229, {0, 1}, "Intercom Panel", "AIM Volume")
defineTumb("INT_AIM_UNMUTE", 58, 3009, 230, 1, {0, 1}, nil, false, "Intercom Panel", "AIM Un-Mute")
definePotentiometer("INT_IFF_VOL", 58, 3012, 231, {0, 1}, "Intercom Panel", "IFF Volume")
defineTumb("INT_IFF_UNMUTE", 58, 3011, 232, 1, {0, 1}, nil, false, "Intercom Panel", "IFF Un-Mute")
definePotentiometer("INT_ILS_VOL", 58, 3014, 233, {0, 1}, "Intercom Panel", "ILS Volume")
defineTumb("INT_ILS_UNMUTE", 58, 3013, 234, 1, {0, 1}, nil, false, "Intercom Panel", "ILS Un-Mute")
definePotentiometer("INT_TCN_VOL", 58, 3016, 235, {0, 1}, "Intercom Panel", "TCN Volume")
defineTumb("INT_TCN_UNMUTE", 58, 3015, 236, 1, {0, 1}, nil, false, "Intercom Panel", "TCN Un-Mute")

defineToggleSwitch("INT_HM", 58, 3017, 237, "Intercom Panel", "HM Switch")
definePotentiometer("INT_VOL", 58, 3018, 238, {0, 1}, "Intercom Panel", "Intercom Volume")
defineTumb("INT_MODE", 58, 3019, 239, 0.1, {0.0, 0.4}, nil, false, "Intercom Panel", "Intercom Selector Switch: INT / FM / VHF / HF / Blank")
definePushButton("INT_CALL", 58, 3020, 240, "Intercom Panel", "Call Button")

definePushButton("HARS_FAST_ERECT", 44, 3001, 711, "HARS", "HARS Fast Erect Button")
defineToggleSwitch("HARS_SLAVE_DG", 44, 3002, 270, "HARS", "HARS SLAVE-DG Mode")
defineToggleSwitch("HARS_NS", 44, 3003, 273, "HARS", "HARS N/S toggle switch")
define3PosTumb1("HARS_MAGVAR", 44, 3004, 272, "HARS", "HARS MAG VAR")
definePotentiometer("HARS_LATITUDE", 44, 3005, 271, {0, 1}, "HARS", "HARS Latitude Dial")
definePotentiometer("HARS_HDG", 44, 3007, 268, {0, 1}, "HARS", "HARS Heading")
definePushButton("HARS_PTS", 44, 3006, 267, "HARS", "HARS Push-to-Sync")


defineToggleSwitch("KY58_ZEROIZE_COVER", 69, 3001, 778, "Secure Voice Comms Panel", "Zeroize Switch Cover")
defineToggleSwitch("KY58_ZEROIZE", 69, 3002, 779, "Secure Voice Comms Panel", "Zeroize Switch")
defineToggleSwitch("KY58_DELAY", 69, 3003, 780, "Secure Voice Comms Panel", "Delay Switch")
defineMultipositionSwitch("KY58_PLAIN", 69, 3004, 781, 3, 0.1, "Secure Voice Comms Panel", "C/RAD Switch")
defineMultipositionSwitch("KY58_1TO5", 69, 3005, 782, 6, 0.1, "Secure Voice Comms Panel", "Full Switch")
defineMultipositionSwitch("KY58_MODE", 69, 3006, 783, 3, 0.1, "Secure Voice Comms Panel", "Mode Switch")
defineToggleSwitch("KY58_PWR", 69, 3007, 784, "Secure Voice Comms Panel", "Power Switch")


defineToggleSwitch("AUX_GEAR", 39, 3008, 718, "Misc", "Auxiliary Landing Gear Handle")
defineToggleSwitch("AUX_GEAR_LOCK", 39, 3009, 722, "Misc", "Auxiliary Landing Gear Handle Lock Button")
defineTumb("SEAT_ARM", 39, 3010, 733, 1, {0, 1}, nil, false, "Misc", "Seat Arm Handle (0 = ARM, 1 = DISARM)")

defineToggleSwitch("LADDER_EXTEND_COVER", 39, 3011, 787, "Misc", "Extend Boarding Ladder Button Cover")
definePushButton("LADDER_EXTEND", 39, 3012, 788, "Misc", "Extend Boarding Ladder Button")

definePushButton("ACCEL_PTS", 72, 3001, 904, "Accelerometer", "Push to Set")

defineMultipositionSwitch("DVADR_FUNCTION", 73, 3001, 789, 3, 0.1, "DVADR", "Function Control Toggle Switch")
defineMultipositionSwitch("DVADR_VIDEO", 73, 3002, 790, 3, 0.1, "DVADR", "Video Selector Toggle Switch")
defineIndicatorLight("DVADR_EOT", 791, "DVADR", "DVADR End of Tape Indicator Light")
defineIndicatorLight("DVADR_REC", 794, "DVADR", "DVADR Record (On) Indicator Light")

definePushButton("SUIT_TEST", 41, 3014, 776, "Misc", "Anti-G Suit Valve Test Button")

defineToggleSwitch("CANOPY_DISENGAGE", 39, 3013, 777, "Misc", "Canopy actuator disengage lever")
defineToggleSwitch("CANOPY_JTSN", 39, 3014, 785, "Misc", "Canopy Jettison")
defineToggleSwitch("CANOPY_JTSN_UNLOCK", 39, 3015, 786, "Misc", "Canopy Jettison Unlock")


defineMultipositionSwitch("ANT_IFF", 43, 3019, 706, 3, 0.5, "Antenna Panel", "IFF Antenna Switch")
defineMultipositionSwitch("ANT_UHF", 54, 3016, 707, 3, 0.5, "Antenna Panel", "UHF Antenna Switch")
defineToggleSwitch("ANT_EGIHQTOD", 54, 3017, 708, "Antenna Panel", "EGI HQ TOD Switch")


definePotentiometer("RWR_BRT", 29, 3001, 16, {0.15, 0.85}, "RWR", "Display Brightness")


local JSON = loadfile([[Scripts\JSON.lua]])()
local cdu_indicator_data_file = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\lib\CDU.json]], "r")
local cdu_indicator_data = JSON:decode(cdu_indicator_data_file:read("*a"))
cdu_indicator_data_file:close()
cdu_indicator_data_file = nil

cdu_indicator_data["ScratchBorders"] = {
	[1] = {
		alignment = "LFT",
		x = 1,
		y = 10
	}
}
cdu_indicator_data["ScratchString"] = {
	[1] = {
		alignment = "LFT",
		x = 2,
		y = 10
	}
}
cdu_indicator_data["PAGE"] = {
	[1] = {
		alignment = "LFT",
		x = 19,
		y = 10
	}
}
cdu_indicator_data["PAGE_NUM"] = {
	[1] = {
		alignment = "LFT",
		x = 20,
		y = 10
	}
}

local symbols = {
 BRANCH_L	= string.char(26),
BRANCH_R	= string.char(27),
ROTARY		= string.char(18),
DATA_ENTRY	= string.char(20),
SYS_ACTION	= "©",
DEGREE		= "°",
FILLED 		= "ю",
INC_DEC		= "я"
}
local function replace_symbols(s)
	s = s:gsub(symbols.BRANCH_L, string.char(0xBB))
	s = s:gsub(symbols.BRANCH_R, string.char(0xAB))
	s = s:gsub(symbols.ROTARY, string.char(0xAE))
	s = s:gsub(symbols.DATA_ENTRY, string.char(0xA1))
	s = s:gsub(symbols.SYS_ACTION, string.char(0xA9))
	s = s:gsub(symbols.DEGREE, string.char(0xB0))
	s = s:gsub(symbols.FILLED, string.char(0xB6))
	s = s:gsub(symbols.INC_DEC, string.char(0xB1))
	return s
end
local cdu_lines = {}
BIOS.dbg_cdu_lines = cdu_lines
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local cdu = parse_indication(3)
	local empty_line = "                        " -- 24 spaces
	cdu_lines[1] = empty_line
	cdu_lines[2] = empty_line
	cdu_lines[3] = empty_line
	cdu_lines[4] = empty_line
	cdu_lines[5] = empty_line
	cdu_lines[6] = empty_line
	cdu_lines[7] = empty_line
	cdu_lines[8] = empty_line
	cdu_lines[9] = empty_line
	cdu_lines[10] = empty_line
	if not cdu then
		return
	end
	
	local cdu_page = list_cockpit_params():match('CDU_PAGE:"([0-9A-Za-z_]+)"')
	local cursor_pos = 2
	if cdu.ScratchString then cursor_pos = cdu.ScratchString:len()+2 end
	--cdu.Cursor = "X"
	cdu_indicator_data["Cursor"] = {
		[1] = {
			alignment = "LFT",
			x = cursor_pos,
			y = 10
		}
	}
	
	for k, v in pairs(cdu) do
		local candidates = cdu_indicator_data[k]
		if candidates then
			v = replace_symbols(v) -- make sure that 1 char == 1 byte
			local render_instructions = nil
			if #candidates == 1 then
				render_instructions = candidates[1]
			else
				for _, ri in pairs(candidates) do
					for _, page in pairs(ri.cdu_pages) do
						if cdu_page == "CDU_"..page then
							render_instructions = ri
							break
						end
					end
				end
			end
			if render_instructions then
				local i
				local ri = render_instructions
				local old_line = cdu_lines[ri.y]
				local replacements = {}
				if ri.alignment == "LFT" then
					for i = 1, v:len(), 1 do
						local c = v:sub(i,i)
						if c ~= " " then replacements[ri.x + i - 1] = c end
					end
				elseif ri.alignment == "RGHT" then
					for i = 1, v:len(), 1 do
						local c = v:sub(i,i)
						if c ~= " " then replacements[ri.x - (v:len() - i)] = c end
					end
				end
				local new_line = ""
				for i = 1, 24, 1 do
					new_line = new_line .. (replacements[i] or old_line:sub(i,i))
				end
				cdu_lines[ri.y] = new_line
			end
		end
	end
end

defineString("CDU_LINE0", function() return cdu_lines[1] end, 24, "CDU Display", "CDU Line 1")
defineString("CDU_LINE1", function() return cdu_lines[2] end, 24, "CDU Display", "CDU Line 2")
defineString("CDU_LINE2", function() return cdu_lines[3] end, 24, "CDU Display", "CDU Line 3")
defineString("CDU_LINE3", function() return cdu_lines[4] end, 24, "CDU Display", "CDU Line 4")
defineString("CDU_LINE4", function() return cdu_lines[5] end, 24, "CDU Display", "CDU Line 5")
defineString("CDU_LINE5", function() return cdu_lines[6] end, 24, "CDU Display", "CDU Line 6")
defineString("CDU_LINE6", function() return cdu_lines[7] end, 24, "CDU Display", "CDU Line 7")
defineString("CDU_LINE7", function() return cdu_lines[8] end, 24, "CDU Display", "CDU Line 8")
defineString("CDU_LINE8", function() return cdu_lines[9] end, 24, "CDU Display", "CDU Line 9")
defineString("CDU_LINE9", function() return cdu_lines[10] end, 24, "CDU Display", "CDU Line 10")

local function getCmscMws()
	if not cmscData then return "        " end
	return cmscData.txt_MWS or "        "
end
defineString("CMSC_TXT_MWS", getCmscMws, 8, "CMSC", "MWS Status Display")

defineIndicatorLight("NMSP_UHF_LED", 619, "NMSP", "UHF LED")
defineIndicatorLight("NMSP_FM_LED", 620, "NMSP", "FM LED")

define8BitFloat("VHFAM_FREQ1_ROT", 143, {0, 1}, "VHF AM Radio", "Frequency Selector 1 Rotation")
define8BitFloat("VHFAM_FREQ2_ROT", 144, {0, 1}, "VHF AM Radio", "Frequency Selector 2 Rotation")
define8BitFloat("VHFAM_FREQ3_ROT", 145, {0, 1}, "VHF AM Radio", "Frequency Selector 3 Rotation")
define8BitFloat("VHFAM_FREQ4_ROT", 146, {0, 1}, "VHF AM Radio", "Frequency Selector 4 Rotation")

define8BitFloat("VHFFM_FREQ1_ROT", 157, {0, 1}, "VHF FM Radio", "Frequency Selector 1 Rotation")
define8BitFloat("VHFFM_FREQ2_ROT", 158, {0, 1}, "VHF FM Radio", "Frequency Selector 2 Rotation")
define8BitFloat("VHFFM_FREQ3_ROT", 159, {0, 1}, "VHF FM Radio", "Frequency Selector 3 Rotation")
define8BitFloat("VHFFM_FREQ4_ROT", 160, {0, 1}, "VHF FM Radio", "Frequency Selector 4 Rotation")

defineFloat("AIRSPEED_MAX_IAS", 50, {0, 1}, "Airspeed Indicator", "Airspeed Max IAS Dial")

defineFloat("COMPASS_HDG", 6, {-1, 1}, "Standby Compass", "Compass Heading")
defineFloat("COMPASS_PITCH", 720, {-1, 1}, "Standby Compass", "Compass Pitch")
defineFloat("COMPASS_BANK", 721, {-1, 1}, "Standby Compass", "Compass Bank")

defineFloat("ALT_PNEU_FLAG", 61, {0, 1}, "Altimeter", "PNEU Flag")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(186)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
end, 65535, "External Aircraft Model", "Formation Lights")


defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")


defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light")
defineIntegerFromGetter("EXT_STROBE_LEFT", function()
	if LoGetAircraftDrawArgumentValue(195) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Strobe Light")
defineIntegerFromGetter("EXT_STROBE_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(196) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Strobe Light")


BIOS.protocol.endModule()