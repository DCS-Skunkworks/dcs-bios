module("A_10C", package.seeall)

local A_10C_CDU = require("Scripts.DCS-BIOS.lib.modules.displays.A_10C_CDU")
local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")
local TextDisplay = require("Scripts.DCS-BIOS.lib.modules.TextDisplay")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class A_10C: Module
local A_10C = Module:new("A-10C", 0x1000, { "A-10C", "A-10C_2" })

--v3.1a overhaul by WarLord,charliefoxtwo,talbotmcinnis&DeadMeat

function A_10C:define3PosTumbA10(msg, device_id, command, arg_number, category, description)
	self:defineTumb(msg, device_id, command, arg_number, 0.1, { 0, 0.2 }, nil, false, category, description)
end

function A_10C:defineCMSPSwitch(identifier, device_id, down_command, up_command, arg_number, category, description)
	local alloc = self:allocateInt(2, identifier)
	self:addExportHook(function(dev0)
		local arg_value = dev0:get_argument_value(arg_number) -- range is -1 to 1
		alloc:setValue(arg_value + 1)
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		SetStateInput:new(2, "set the switch position -- 0 = down, 1 = centered, 2 = held up"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "switch position: 0 - down, 1 - center, 2 - up"),
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		if toState == "0" then
			toState = -1
		elseif toState == "1" then
			toState = 0
		elseif toState == "2" then
			toState = 1
		else
			error(string.format("unrecognized toState %d", toState))
		end

		local fromState = GetDevice(0):get_argument_value(arg_number)
		local dev = GetDevice(device_id)

		if not dev then
			error(string.format("unable to get device %d for control %s", device_id, identifier))
			return
		end

		if fromState == toState then
			return -- noop
		end

		if fromState == -1 then
			-- for some reason, dev:performClickableAction(down_command, 0) doesn't seem to do anything
			dev:performClickableAction(down_command, 1)
			if toState == 1 then
				-- todo: this doesn't seem to work fully - it will go to 0, but not to 1
				dev:performClickableAction(up_command, 1)
			end
		elseif fromState == 0 then
			if toState == -1 then
				dev:performClickableAction(down_command, -1)
			elseif toState == 1 then
				dev:performClickableAction(up_command, 1)
			end
		elseif fromState == 1 then
			dev:performClickableAction(up_command, 0)

			if toState == -1 then
				dev:performClickableAction(down_command, -1)
			end
		else
			error(string.format("unrecognized fromState %d", fromState))
		end
	end)
end

function A_10C:define3Pos2CommandSwitchA10(identifier, device_id, downSwitch, upSwitch, arg_number, category, description)
	local alloc = self:allocateInt(2)
	self:addExportHook(function(dev0)
		local val = dev0:get_argument_value(arg_number)
		if val == 0 then
			alloc:setValue(0)
		elseif val == 0.5 then
			alloc:setValue(1)
		elseif val == 1 then
			alloc:setValue(2)
		end
	end)

	local control = Control:new(category, ControlType.three_pos_two_command_switch_open_close, identifier, description, {
		SetStateInput:new(2, "set the switch position"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "switch position -- 0 = Down, 1 = Mid ,  2 = UP"),
	})
	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		if toState == "0" then --downSwitch
			dev:performClickableAction(downSwitch, 0)
			dev:performClickableAction(upSwitch, 0)
			dev:performClickableAction(downSwitch, -0.5)
		elseif toState == "1" then --Stop
			dev:performClickableAction(downSwitch, 0)
			dev:performClickableAction(upSwitch, 0)
		elseif toState == "2" then --upSwitch
			dev:performClickableAction(downSwitch, 0)
			dev:performClickableAction(upSwitch, 0)
			dev:performClickableAction(upSwitch, 1)
		end
	end)
end

function A_10C:defineElectricallyHeldSwitch(identifier, device_id, pos_command, neg_command, arg_number, category, description)
	local alloc = self:allocateInt(1)
	self:addExportHook(function(dev0)
		alloc:setValue(dev0:get_argument_value(arg_number))
	end)

	local control = Control:new(category, ControlType.electrically_held_switch, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(1, "set the switch position -- 0 = off, 1 = try to turn it on"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "switch position -- 0 = off, 1 = on"),
	})
	self:addControl(control)

	self:addInputProcessor(identifier, function(action)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		if action == "PUSH" then
			dev:performClickableAction(pos_command, 1)
		elseif action == "RELEASE" then
			dev:performClickableAction(neg_command, 0)
		elseif action == "OFF" or action == "0" then
			dev:performClickableAction(pos_command, 0)
		elseif action == "1" then
			dev:performClickableAction(pos_command, 1)
			dev:performClickableAction(neg_command, 0)
		end
	end)
end

--- Defines a hat switch
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param center_command integer the dcs command to return the hat to the center position
--- @param directional_commands integer[] an array of dcs command ids for each direction of the hat
--- @param arg_number integer the dcs argument number
--- @param step number the amount to increase or decrease dcs data by with each step
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function A_10C:defineHatSwitch(identifier, device_id, center_command, directional_commands, arg_number, step, limits, category, description)
	assert(#limits == 2, "limits may only contain a min and max value")
	local max_value = ((limits[2] - limits[1]) / step)
	assert(#directional_commands == max_value) -- the center command is not included in this list

	local multiplier = 1 / step
	local alloc = self:allocateInt(max_value, identifier)

	self:addExportHook(function(dev0)
		alloc:setValue(Module.round(dev0:get_argument_value(arg_number) * multiplier))
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(max_value, "set position"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "selector position"),
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(value)
		local currentState = Module.round(GetDevice(0):get_argument_value(arg_number) * multiplier)
		local new_state
		if value == "INC" then
			new_state = (currentState + 1) % (max_value + 1)
		elseif value == "DEC" then
			new_state = (currentState - 1) % (max_value + 1)
		else
			new_state = tonumber(value) or 0
		end

		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		if new_state == 0 then
			dev:performClickableAction(center_command, 0)
		else
			dev:performClickableAction(center_command, 0)
			dev:performClickableAction(directional_commands[new_state], step * new_state)
		end
	end)
end

--- Sets the last export hook that was added to only run if func evaluates to true
--- @param func fun(): boolean
function A_10C:conditionalize_last_export(func)
	local original_hook = self.exportHooks[#self.exportHooks]
	self.exportHooks[#self.exportHooks] = function(dev0)
		if func() then
			original_hook(dev0)
		end
	end
end

local cmsp = {}

A_10C:addExportHook(function()
	cmsp = Module.parse_indication(7)
end)

local function get_cmsp_line_1()
	local tu = Functions.coerce_nil_to_string(cmsp["txt_UP"])
	return string.format("%-4s %-4s %-4s %-4s", tu:sub(0, 4), tu:sub(5, 8), tu:sub(9, 12), tu:sub(13, 16))
end

local function get_cmsp_line_2()
	return string.format("%-4s %-4s %-4s %-4s", Functions.coerce_nil_to_string(cmsp["txt_DOWN1"]), Functions.coerce_nil_to_string(cmsp["txt_DOWN2"]), Functions.coerce_nil_to_string(cmsp["txt_DOWN3"]), Functions.coerce_nil_to_string(cmsp["txt_DOWN4"]))
end

local arc_210_present = false

--- @return boolean present whether the ARC-210 is installed
local function is_arc_210_present()
	return arc_210_present
end

--- @return boolean present whether the VHF AM radio is installed
local function is_vhf_am_present()
	return not arc_210_present
end

A_10C:addExportHook(function(dev0)
	arc_210_present = dev0:get_argument_value(998) > 0.999
end)

A_10C:defineString("CMSP1", get_cmsp_line_1, 19, "CMSP", "CMSP Display Line 1")
A_10C:defineString("CMSP2", get_cmsp_line_2, 19, "CMSP", "CMSP Display Line 2")

A_10C:defineFloat("SAI_PITCH", 63, { -1, 1 }, "Standby Attitude Indicator", "SAI Pitch")
A_10C:defineFloat("SAI_BANK", 64, { -1, 1 }, "Standby Attitude Indicator", "SAI Bank")
A_10C:defineFloat("SAI_WARNING_FLAG", 65, { 0, 1 }, "Standby Attitude Indicator", "SAI Warning Flag")
A_10C:defineFloat("SAI_PITCH_ADJ", 715, { -1, 1 }, "Standby Attitude Indicator", "SAI Manual Pitch Adjustment")
A_10C:defineFloat("SAI_KNOB_ARROW", 717, { -1, 1 }, "Standby Attitude Indicator", "SAI Knob Arrow")

A_10C:defineFloat("ADI_PITCH", 17, { -1, 1 }, "ADI", "ADI Pitch")
A_10C:defineFloat("ADI_BANK", 18, { -1, 1 }, "ADI", "ADI Bank")
A_10C:defineFloat("ADI_SLIP", 24, { -1, 1 }, "ADI", "ADI Slipball Position")
A_10C:defineFloat("ADI_TURN", 23, { -1, 1 }, "ADI", "ADI Turn Needle")
A_10C:defineFloat("ADI_ATTWARN_FLAG", 25, { 0, 1 }, "ADI", "ADI Attitude Warning Flag")
A_10C:defineFloat("ADI_CRSWARN_FLAG", 19, { 0, 1 }, "ADI", "ADI Course Warning Flag")
A_10C:defineFloat("ADI_GSWARN_FLAG", 26, { 0, 1 }, "ADI", "ADI Glide Slope Warning Flag")
A_10C:defineFloat("ADI_STEER_BANK", 20, { -1, 1 }, "ADI", "ADI Bank Steering Bar")
A_10C:defineFloat("ADI_STEER_PITCH", 21, { -1, 1 }, "ADI", "ADI Pitch Steering Bar")
A_10C:defineFloat("ADI_GS", 27, { -1, 1 }, "ADI", "ADI Glide Slope Indicator")

A_10C:defineFloat("HSI_PWROFF_FLAG", 40, { 0, 1 }, "HSI", "HSI Poweroff Flag")
A_10C:defineFloat("HSI_RANGE_FLAG", 32, { 0, 1 }, "HSI", "HSI Range Flag")
A_10C:defineFloat("HSI_BEARING_FLAG", 46, { 0, 1 }, "HSI", "HSI Bearing Flag")
A_10C:defineFloat("HSI_HDG", 34, { 0, 1 }, "HSI", "HSI Heading")
A_10C:defineFloat("HSI_BEARING1", 33, { 0, 1 }, "HSI", "HSI Bearing Pointer 1")
A_10C:defineFloat("HSI_BEARING2", 35, { 0, 1 }, "HSI", "HSI Bearing Pointer 2")
A_10C:defineFloat("HSI_HDG_BUG", 36, { 0, 1 }, "HSI", "HSI Heading Bug")
A_10C:defineFloat("HSI_CRS", 47, { 0, 1 }, "HSI", "HSI Course")
A_10C:defineFloat("HSI_CC_A", 37, { 0, 1 }, "HSI", "HSI Course Counter A")
A_10C:defineFloat("HSI_CC_B", 39, { 0, 1 }, "HSI", "HSI Course Counter B")
A_10C:defineFloat("HSI_RC_A", 28, { 0, 1 }, "HSI", "HSI Range Counter A")
A_10C:defineFloat("HSI_RC_B", 29, { 0, 1 }, "HSI", "HSI Range Counter B")
A_10C:defineFloat("HSI_RC_C", 30, { 0, 1 }, "HSI", "HSI Range Counter C")
A_10C:defineFloat("HSI_RC_D", 31, { 0, 1 }, "HSI", "HSI Range Counter D")
A_10C:defineFloat("HSI_DEVIATION", 41, { -1, 1 }, "HSI", "HSI Deviation")
A_10C:defineFloat("HSI_TOFROM1", 42, { 0, 1 }, "HSI", "HSI TO/FROM 1")
A_10C:defineFloat("HSI_TOFROM2", 43, { 0, 1 }, "HSI", "HSI TO/FROM 2")
A_10C:reserveIntValue(65535)
A_10C:reserveIntValue(65535)

A_10C:defineFloat("HARS_SYNC", 269, { -1, 1 }, "HARS", "HARS Sync")

A_10C:defineFloat("VVI", 12, { -1, 1 }, "VVI", "Vertical Velocity Indicator")

A_10C:defineFloat("ACCEL_G", 15, { 0, 1 }, "Accelerometer", "G Load")
A_10C:defineFloat("ACCEL_MIN", 902, { 0, 1 }, "Accelerometer", "Accelerometer Min Pointer")
A_10C:defineFloat("ACCEL_MAX", 903, { 0, 1 }, "Accelerometer", "Accelerometer Max Pointer")

A_10C:defineFloat("AOA_PWROFF", 55, { 0, 1 }, "AOA Indicator", "AOA Poweroff Flag")
A_10C:defineFloat("AOA_UNITS", 4, { 0, 1 }, "AOA Indicator", "AOA Units")

A_10C:defineFloat("AIRSPEED_NEEDLE", 48, { 0, 1 }, "Airspeed Indicator", "Airspeed Needle")
A_10C:defineFloat("AIRSPEED_DIAL", 49, { 0, 1 }, "Airspeed Indicator", "Airspeed Dial")

A_10C:defineFloat("ALT_100FT", 51, { 0, 1 }, "Altimeter", "100 ft Pointer")
A_10C:defineFloat("ALT_10000FT_CNT", 52, { 0, 1 }, "Altimeter", "10000 FT Counter")
A_10C:defineFloat("ALT_1000FT_CNT", 53, { 0, 1 }, "Altimeter", "1000 FT Counter")
A_10C:defineFloat("ALT_100FT_CNT", 54, { 0, 1 }, "Altimeter", "100 FT Counter")
A_10C:defineFloat("ALT_PRESSURE0", 59, { 0, 1 }, "Altimeter", "Barometric Pressure Digit 0")
A_10C:defineFloat("ALT_PRESSURE1", 58, { 0, 1 }, "Altimeter", "Barometric Pressure Digit 1")
A_10C:defineFloat("ALT_PRESSURE2", 57, { 0, 1 }, "Altimeter", "Barometric Pressure Digit 2")
A_10C:defineFloat("ALT_PRESSURE3", 56, { 0, 1 }, "Altimeter", "Barometric Pressure Digit 3")

A_10C:defineIndicatorLight("CMSC_LAUNCH", 372, "CMSC", "Missile Launch Indicator (red)")
A_10C:defineIndicatorLight("CMSC_PRIO", 373, "CMSC", "Priority Status Indicator (green)")
A_10C:defineIndicatorLight("CMSC_UNKN", 374, "CMSC", "Unknown Status Indicator (green)")

local cmscData = {}
A_10C:addExportHook(function()
	cmscData = Module.parse_indication(8)
end)

local function getCmscChaffFlare()
	return Functions.coerce_nil_to_string(cmscData.txt_CHAFF_FLARE)
end

A_10C:defineString("CMSC_TXT_CHAFF_FLARE", getCmscChaffFlare, 8, "CMSC", "Chaff / Flare Amount Display")

local function getCmscJmr()
	return Functions.coerce_nil_to_string(cmscData.txt_JMR)
end

A_10C:defineString("CMSC_TXT_JMR", getCmscJmr, 8, "CMSC", "JMR Status Display")

A_10C:reserveIntValue(65535)

A_10C:defineFloat("FLAP_POS", 653, { 0, 2 / 3 }, "Landing Gear and Flap Control Panel", "Flap Position Indicator")

A_10C:defineFloat("L_ENG_FAN", 76, { 0, 1 }, "Engine Instruments", "Left Engine Fan Speed")
A_10C:defineFloat("R_ENG_FAN", 77, { 0, 1 }, "Engine Instruments", "Right Engine Fan Speed")
A_10C:defineFloat("L_ENG_CORE_T", 79, { 0, 1 }, "Engine Instruments", "Left Engine Core Speed Tenth")
A_10C:defineFloat("L_ENG_CORE", 78, { 0, 1 }, "Engine Instruments", "Left Engine Core Speed")
A_10C:defineFloat("R_ENG_CORE_T", 81, { 0, 1 }, "Engine Instruments", "Right Engine Core Speed Tenth")
A_10C:defineFloat("R_ENG_CORE", 80, { 0, 1 }, "Engine Instruments", "Right Engine Core Speed")
A_10C:defineFloat("L_ENG_FUEL_FLOW", 84, { 0, 1 }, "Engine Instruments", "Left Engine Fuel Flow")
A_10C:defineFloat("R_ENG_FUEL_FLOW", 85, { 0, 1 }, "Engine Instruments", "Right Engine Fuel Flow")
A_10C:defineFloat("L_ENG_TEMP_T", 71, { 0, 1 }, "Engine Instruments", "Left Engine Temperature Tenth")
A_10C:defineFloat("L_ENG_TEMP", 70, { 0, 1 }, "Engine Instruments", "Left Engine Temperature")
A_10C:defineFloat("R_ENG_TEMP_T", 74, { 0, 1 }, "Engine Instruments", "Right Engine Temperature Tenth")
A_10C:defineFloat("R_ENG_TEMP", 73, { 0, 1 }, "Engine Instruments", "Right Engine Temperature")
A_10C:defineFloat("L_ENG_TEMP_OFF", 72, { 0, 1 }, "Engine Instruments", "Left Engine Temperature Off")
A_10C:defineFloat("R_ENG_TEMP_OFF", 75, { 0, 1 }, "Engine Instruments", "Right Engine Temperature Off")

A_10C:defineFloat("APU_RPM", 13, { 0, 1 }, "Engine Instruments", "APU RPM Gauge")
A_10C:defineFloat("APU_TEMP", 14, { 0, 1 }, "Engine Instruments", "APU Temperature Gauge")

A_10C:defineFloat("L_HYD_PRESS", 647, { 0, 1 }, "Engine Instruments", "Left Hydraulic Pressure")
A_10C:defineFloat("R_HYD_PRESS", 648, { 0, 1 }, "Engine Instruments", "Right Hydraulic Pressure")

A_10C:defineFloat("L_OIL_PRESS", 82, { 0, 1 }, "Engine Instruments", "Left Oil Pressure")
A_10C:defineFloat("R_OIL_PRESS", 83, { 0, 1 }, "Engine Instruments", "Right Oil Pressure")

A_10C:defineFloat("FUEL_QTY_L", 88, { 0, 1 }, "Fuel Panel", "Fuel Qty Left")
A_10C:defineFloat("FUEL_QTY_R", 89, { 0, 1 }, "Fuel Panel", "Fuel Qty Right")
A_10C:defineFloat("FUEL_QTY_10000", 90, { 0, 1 }, "Fuel Panel", "Fuel Quantity Counter 10000")
A_10C:defineFloat("FUEL_QTY_1000", 91, { 0, 1 }, "Fuel Panel", "Fuel Quantity Counter 1000")
A_10C:defineFloat("FUEL_QTY_100", 92, { 0, 1 }, "Fuel Panel", "Fuel Quantity Counter 100")

A_10C:defineIndicatorLight("MASTER_CAUTION", 404, "UFC", "Master Caution Light (yellow)")

-- The caution lights begin on a 16-bit boundary
A_10C:defineIndicatorLight("AOA_INDEXER_HIGH", 540, "HUD", "AOA Indexer High (green)")
A_10C:defineIndicatorLight("AOA_INDEXER_NORMAL", 541, "HUD", "AOA Indexer Normal (green)")
A_10C:defineIndicatorLight("AOA_INDEXER_LOW", 542, "HUD", "AOA Indexer Low (green)")
A_10C:defineIndicatorLight("AIR_REFUEL_READY", 730, "HUD", "Air Refuel READY Light (green)")
A_10C:defineIndicatorLight("AIR_REFUEL_LATCHED", 731, "HUD", "Air Refuel LATCHED Light (green)")
A_10C:defineIndicatorLight("AIR_REFUEL_DISCONNECT", 732, "HUD", "Air Refuel DISCONNECT Light (green)")

A_10C:defineIndicatorLight("TAKE_OFF_TRIM", 191, "SAS Panel", "TAKEOFF TRIM Indicator Light (green)")

A_10C:defineIndicatorLight("GEAR_N_SAFE", 659, "Landing Gear and Flap Control Panel", "Nose Gear Safe (green)")
A_10C:defineIndicatorLight("GEAR_L_SAFE", 660, "Landing Gear and Flap Control Panel", "Left Gear Safe (green)")
A_10C:defineIndicatorLight("GEAR_R_SAFE", 661, "Landing Gear and Flap Control Panel", "Right Gear Safe (green)")
A_10C:defineIndicatorLight("HANDLE_GEAR_WARNING", 737, "Landing Gear and Flap Control Panel", "Handle Gear Warning Light (red)")

A_10C:defineIndicatorLight("GUN_READY", 662, "Front Dash", "GUN READY Indicator (green)")

-- Caution Lights
A_10C:defineIndicatorLight("CL_A1", 480, "Caution Lights Panel", "ENG START CYCLE Light (green)")
A_10C:defineIndicatorLight("CL_A2", 481, "Caution Lights Panel", "L-HYD PRESS Light (green)")
A_10C:defineIndicatorLight("CL_A3", 482, "Caution Lights Panel", "R-HYD PRESS Light (green)")
A_10C:defineIndicatorLight("CL_A4", 483, "Caution Lights Panel", "GUN UNSAFE Light (green)")
A_10C:defineIndicatorLight("CL_B1", 484, "Caution Lights Panel", "ANTI-SKID Light (green)")
A_10C:defineIndicatorLight("CL_B2", 485, "Caution Lights Panel", "L-HYD RES Light (green)")
A_10C:defineIndicatorLight("CL_B3", 486, "Caution Lights Panel", "R-HYD RES Light (green)")
A_10C:defineIndicatorLight("CL_B4", 487, "Caution Lights Panel", "OXY LOW Light (green)")
A_10C:defineIndicatorLight("CL_C1", 488, "Caution Lights Panel", "ELEV DISENG Light (green)")
A_10C:defineIndicatorLight("CL_C2", 489, "Caution Lights Panel", "VOID1 Light (green)")
A_10C:defineIndicatorLight("CL_C3", 490, "Caution Lights Panel", "SEAT NOT ARMED Light (green)")
A_10C:defineIndicatorLight("CL_C4", 491, "Caution Lights Panel", "BLEED AIR LEAK Light (green)")
A_10C:defineIndicatorLight("CL_D1", 492, "Caution Lights Panel", "AIL DISENG Light (green)")
A_10C:defineIndicatorLight("CL_D2", 493, "Caution Lights Panel", "L-AIL TAB Light (green)")
A_10C:defineIndicatorLight("CL_D3", 494, "Caution Lights Panel", "R-AIL TAB Light (green)")
A_10C:defineIndicatorLight("CL_D4", 495, "Caution Lights Panel", "SERVICE AIR HOT Light (green)")
A_10C:defineIndicatorLight("CL_E1", 496, "Caution Lights Panel", "PITCH SAS Light (green)")
A_10C:defineIndicatorLight("CL_E2", 497, "Caution Lights Panel", "L-ENG HOT Light (green)")
A_10C:defineIndicatorLight("CL_E3", 498, "Caution Lights Panel", "R-ENG HOT Light (green)")
A_10C:defineIndicatorLight("CL_E4", 499, "Caution Lights Panel", "WINDSHIELD HOT Light (green)")
A_10C:defineIndicatorLight("CL_F1", 500, "Caution Lights Panel", "YAW SAS Light (green)")
A_10C:defineIndicatorLight("CL_F2", 501, "Caution Lights Panel", "L-ENG OIL PRESS Light (green)")
A_10C:defineIndicatorLight("CL_F3", 502, "Caution Lights Panel", "R-ENG OIL PRESS Light (green)")
A_10C:defineIndicatorLight("CL_F4", 503, "Caution Lights Panel", "CICU Light (green)")
A_10C:defineIndicatorLight("CL_G1", 504, "Caution Lights Panel", "GCAS Light (green)")
A_10C:defineIndicatorLight("CL_G2", 505, "Caution Lights Panel", "L-MAIN PUMP Light (green)")
A_10C:defineIndicatorLight("CL_G3", 506, "Caution Lights Panel", "R-MAIN PUMP Light (green)")
A_10C:defineIndicatorLight("CL_G4", 507, "Caution Lights Panel", "VOID2 Light (green)")
A_10C:defineIndicatorLight("CL_H1", 508, "Caution Lights Panel", "LASTE Light (green)")
A_10C:defineIndicatorLight("CL_H2", 509, "Caution Lights Panel", "L-WING PUMP Light (green)")
A_10C:defineIndicatorLight("CL_H3", 510, "Caution Lights Panel", "R-WING PUMP Light (green)")
A_10C:defineIndicatorLight("CL_H4", 511, "Caution Lights Panel", "HARS Light (green)")
A_10C:defineIndicatorLight("CL_I1", 512, "Caution Lights Panel", "IFF MODE-4 Light (green)")
A_10C:defineIndicatorLight("CL_I2", 513, "Caution Lights Panel", "L-MAIN FUEL LOW Light (green)")
A_10C:defineIndicatorLight("CL_I3", 514, "Caution Lights Panel", "R-MAIN FUEL LOW Light (green)")
A_10C:defineIndicatorLight("CL_I4", 515, "Caution Lights Panel", "L-R TKS UNEQUAL Light (green)")
A_10C:defineIndicatorLight("CL_J1", 516, "Caution Lights Panel", "EAC Light (green)")
A_10C:defineIndicatorLight("CL_J2", 517, "Caution Lights Panel", "L-FUEL PRESS Light (green)")
A_10C:defineIndicatorLight("CL_J3", 518, "Caution Lights Panel", "R-FUEL PRESS Light (green)")
A_10C:defineIndicatorLight("CL_J4", 519, "Caution Lights Panel", "NAV Light (green)")
A_10C:defineIndicatorLight("CL_K1", 520, "Caution Lights Panel", "STALL SYS Light (green)")
A_10C:defineIndicatorLight("CL_K2", 521, "Caution Lights Panel", "L-CONV Light (green)")
A_10C:defineIndicatorLight("CL_K3", 522, "Caution Lights Panel", "R-CONV Light (green)")
A_10C:defineIndicatorLight("CL_K4", 523, "Caution Lights Panel", "CADC Light (green)")
A_10C:defineIndicatorLight("CL_L1", 524, "Caution Lights Panel", "APU GEN Light (green)")
A_10C:defineIndicatorLight("CL_L2", 525, "Caution Lights Panel", "L-GEN Light (green)")
A_10C:defineIndicatorLight("CL_L3", 526, "Caution Lights Panel", "R-GEN Light (green)")
A_10C:defineIndicatorLight("CL_L4", 527, "Caution Lights Panel", "INST INV Light (green)")

A_10C:defineIndicatorLight("NOSEWHEEL_STEERING", 663, "Front Dash", "Nosewheel Steering Indicator (green)")
A_10C:defineIndicatorLight("MARKER_BEACON", 664, "Front Dash", "MARKER BEACON Indicator (green)")
A_10C:defineIndicatorLight("CANOPY_UNLOCKED", 665, "Front Dash", "CANOPY UNLOCKED Indicator (green)")

A_10C:defineIndicatorLight("L_ENG_FIRE", 215, "Glare Shield", "Left Engine Fire Indicator (yellow)")
A_10C:defineIndicatorLight("APU_FIRE", 216, "Glare Shield", "APU Fire Indicator (yellow)")
A_10C:defineIndicatorLight("R_ENG_FIRE", 217, "Glare Shield", "Right Engine Fire Indicator (yellow)")

A_10C:defineIndicatorLight("L_AILERON_EMER_DISENGAGE", 178, "Emergency Flight Control Panel", "Left Aileron EMER DISENG Indicator (yellow)")
A_10C:defineIndicatorLight("R_AILERON_EMER_DISENGAGE", 179, "Emergency Flight Control Panel", "Right Aileron EMER DISENG Indicator (yellow)")
A_10C:defineIndicatorLight("L_ELEVATOR_EMER_DISENGAGE", 181, "Emergency Flight Control Panel", "Left Elevator EMER DISENG Indicator (yellow)")
A_10C:defineIndicatorLight("R_ELEVATOR_EMER_DISENGAGE", 182, "Emergency Flight Control Panel", "Right Elevator EMER DISENG Indicator (yellow)")

A_10C:defineIndicatorLight("TACAN_TEST", 260, "TACAN Panel", "TACAN Test Indicator Light (green)")

A_10C:definePushButton("LMFD_01", 2, 3001, 300, "Left MFCD", "OSB 1")
A_10C:definePushButton("LMFD_02", 2, 3002, 301, "Left MFCD", "OSB 2")
A_10C:definePushButton("LMFD_03", 2, 3003, 302, "Left MFCD", "OSB 3")
A_10C:definePushButton("LMFD_04", 2, 3004, 303, "Left MFCD", "OSB 4")
A_10C:definePushButton("LMFD_05", 2, 3005, 304, "Left MFCD", "OSB 5")
A_10C:definePushButton("LMFD_06", 2, 3006, 305, "Left MFCD", "OSB 6")
A_10C:definePushButton("LMFD_07", 2, 3007, 306, "Left MFCD", "OSB 7")
A_10C:definePushButton("LMFD_08", 2, 3008, 307, "Left MFCD", "OSB 8")
A_10C:definePushButton("LMFD_09", 2, 3009, 308, "Left MFCD", "OSB 9")
A_10C:definePushButton("LMFD_10", 2, 3010, 309, "Left MFCD", "OSB 10")
A_10C:definePushButton("LMFD_11", 2, 3011, 310, "Left MFCD", "OSB 11")
A_10C:definePushButton("LMFD_12", 2, 3012, 311, "Left MFCD", "OSB 12")
A_10C:definePushButton("LMFD_13", 2, 3013, 312, "Left MFCD", "OSB 13")
A_10C:definePushButton("LMFD_14", 2, 3014, 313, "Left MFCD", "OSB 14")
A_10C:definePushButton("LMFD_15", 2, 3015, 314, "Left MFCD", "OSB 15")
A_10C:definePushButton("LMFD_16", 2, 3016, 315, "Left MFCD", "OSB 16")
A_10C:definePushButton("LMFD_17", 2, 3017, 316, "Left MFCD", "OSB 17")
A_10C:definePushButton("LMFD_18", 2, 3018, 317, "Left MFCD", "OSB 18")
A_10C:definePushButton("LMFD_19", 2, 3019, 318, "Left MFCD", "OSB 19")
A_10C:definePushButton("LMFD_20", 2, 3020, 319, "Left MFCD", "OSB 20")
A_10C:defineRockerSwitch("LMFD_ADJ", 2, 3021, 3023, 3022, 3023, 320, "Left MFCD", "ADJ")
A_10C:defineRockerSwitch("LMFD_DSP", 2, 3024, 3026, 3025, 3026, 321, "Left MFCD", "DSP")
A_10C:defineRockerSwitch("LMFD_BRT", 2, 3027, 3029, 3028, 3029, 322, "Left MFCD", "BRT")
A_10C:defineRockerSwitch("LMFD_CON", 2, 3030, 3032, 3031, 3032, 323, "Left MFCD", "CON")
A_10C:defineRockerSwitch("LMFD_SYM", 2, 3033, 3035, 3034, 3035, 324, "Left MFCD", "SYM")
A_10C:define3PosTumbA10("LMFD_PWR", 2, 3036, 325, "Left MFCD", "PWR OFF - NT - DAY")

A_10C:definePushButton("RMFD_01", 3, 3001, 326, "Right MFCD", "OSB 1")
A_10C:definePushButton("RMFD_02", 3, 3002, 327, "Right MFCD", "OSB 2")
A_10C:definePushButton("RMFD_03", 3, 3003, 328, "Right MFCD", "OSB 3")
A_10C:definePushButton("RMFD_04", 3, 3004, 329, "Right MFCD", "OSB 4")
A_10C:definePushButton("RMFD_05", 3, 3005, 330, "Right MFCD", "OSB 5")
A_10C:definePushButton("RMFD_06", 3, 3006, 331, "Right MFCD", "OSB 6")
A_10C:definePushButton("RMFD_07", 3, 3007, 332, "Right MFCD", "OSB 7")
A_10C:definePushButton("RMFD_08", 3, 3008, 333, "Right MFCD", "OSB 8")
A_10C:definePushButton("RMFD_09", 3, 3009, 334, "Right MFCD", "OSB 9")
A_10C:definePushButton("RMFD_10", 3, 3010, 335, "Right MFCD", "OSB 10")
A_10C:definePushButton("RMFD_11", 3, 3011, 336, "Right MFCD", "OSB 11")
A_10C:definePushButton("RMFD_12", 3, 3012, 337, "Right MFCD", "OSB 12")
A_10C:definePushButton("RMFD_13", 3, 3013, 338, "Right MFCD", "OSB 13")
A_10C:definePushButton("RMFD_14", 3, 3014, 339, "Right MFCD", "OSB 14")
A_10C:definePushButton("RMFD_15", 3, 3015, 340, "Right MFCD", "OSB 15")
A_10C:definePushButton("RMFD_16", 3, 3016, 341, "Right MFCD", "OSB 16")
A_10C:definePushButton("RMFD_17", 3, 3017, 342, "Right MFCD", "OSB 17")
A_10C:definePushButton("RMFD_18", 3, 3018, 343, "Right MFCD", "OSB 18")
A_10C:definePushButton("RMFD_19", 3, 3019, 344, "Right MFCD", "OSB 19")
A_10C:definePushButton("RMFD_20", 3, 3020, 345, "Right MFCD", "OSB 20")
A_10C:defineRockerSwitch("RMFD_ADJ", 3, 3021, 3023, 3022, 3023, 346, "Right MFCD", "ADJ")
A_10C:defineRockerSwitch("RMFD_DSP", 3, 3024, 3026, 3025, 3026, 347, "Right MFCD", "DSP")
A_10C:defineRockerSwitch("RMFD_BRT", 3, 3027, 3029, 3028, 3029, 348, "Right MFCD", "BRT")
A_10C:defineRockerSwitch("RMFD_CON", 3, 3030, 3032, 3031, 3032, 349, "Right MFCD", "CON")
A_10C:defineRockerSwitch("RMFD_SYM", 3, 3033, 3035, 3034, 3035, 350, "Right MFCD", "SYM")
A_10C:define3PosTumbA10("RMFD_PWR", 3, 3036, 351, "Right MFCD", "PWR OFF - NT - DAY")

A_10C:definePushButton("CMSP_ARW1", 4, 3001, 352, "CMSP", "SET Button 1")
A_10C:definePushButton("CMSP_ARW2", 4, 3002, 353, "CMSP", "SET Button 2")
A_10C:definePushButton("CMSP_ARW3", 4, 3003, 354, "CMSP", "SET Button 3")
A_10C:definePushButton("CMSP_ARW4", 4, 3004, 355, "CMSP", "SET Button 4")
A_10C:defineRockerSwitch("CMSP_UPDN", 4, 3005, 3005, 3006, 3006, 356, "CMSP", "Cycle Program or Value Up/Down")
A_10C:definePushButton("CMSP_RTN", 4, 3007, 357, "CMSP", "RTN")
A_10C:defineToggleSwitch("CMSP_JTSN", 4, 3008, 358, "CMSP", "JTSN / OFF")
A_10C:definePotentiometer("CMSP_BRT", 4, 3009, 359, { 0.15, 0.85 }, "CMSP", "Brightness")

A_10C:defineCMSPSwitch("CMSP_MWS", 4, 3010, 3011, 360, "CMSP", "Missile Warning System OFF - ON - (MENU)")
A_10C:defineCMSPSwitch("CMSP_JMR", 4, 3012, 3013, 361, "CMSP", "Jammer OFF - ON - (MENU)")
A_10C:defineCMSPSwitch("CMSP_RWR", 4, 3014, 3015, 362, "CMSP", "Radar Warning Receiver OFF - ON - (MENU)")
A_10C:defineCMSPSwitch("CMSP_DISP", 4, 3016, 3017, 363, "CMSP", "Countermeasure Dispenser OFF - ON - (MENU)")
A_10C:defineTumb("CMSP_MODE", 4, 3018, 364, 0.1, { 0, 0.4 }, nil, false, "CMSP", "CMSP Mode Select")

A_10C:definePushButton("CMSC_JMR", 5, 3001, 365, "CMSC", "Select Jammer Program")
A_10C:definePushButton("CMSC_MWS", 5, 3002, 366, "CMSC", "Select MWS Programs (No Function)")
A_10C:definePushButton("CMSC_PRI", 5, 3003, 369, "CMSC", "Toggle between 5 and 16 Priority Threats Displayed")
A_10C:definePushButton("CMSC_SEP", 5, 3004, 370, "CMSC", "Separate RWR Symbols")
A_10C:definePotentiometer("CMSC_BRT", 5, 3006, 367, { 0.15, 0.85 }, "CMSC", "Adjust Display Brightness")
A_10C:definePotentiometer("CMSC_RWR_VOL", 5, 3007, 368, nil, "CMSC", "Adjust RWR Volume")

A_10C:define3PosTumbA10("AHCP_MASTER_ARM", 7, 3001, 375, "AHCP", "Master Arm TRAIN - SAFE - ARM")
A_10C:define3PosTumbA10("AHCP_GUNPAC", 7, 3002, 376, "AHCP", "GUN/PAC GUNARM - SAFE - ARM")
A_10C:define3PosTumbA10("AHCP_LASER_ARM", 7, 3003, 377, "AHCP", "Laser Arm TRAIN - SAFE - ARM")
A_10C:defineToggleSwitch("AHCP_TGP", 7, 3004, 378, "AHCP", "TGP OFF - ON")
A_10C:define3PosTumbA10("AHCP_ALT_SCE", 7, 3005, 379, "AHCP", "Altimeter Source RADAR - DELTA - BARO")
A_10C:defineToggleSwitch("AHCP_HUD_DAYNIGHT", 7, 3006, 380, "AHCP", "Hud Mode NIGHT - DAY")
A_10C:defineToggleSwitch("AHCP_HUD_MODE", 7, 3007, 381, "AHCP", "Hud Mode STBY - NORM")
A_10C:defineToggleSwitch("AHCP_CICU", 7, 3008, 382, "AHCP", "CICU OFF - ON")
A_10C:defineToggleSwitch("AHCP_JTRS", 7, 3009, 383, "AHCP", "JTRS OFF - ON")
A_10C:define3PosTumbA10("AHCP_IFFCC", 7, 3010, 384, "AHCP", "IFFCC OFF - TEST - ON")

A_10C:definePushButton("UFC_1", 8, 3001, 385, "UFC", "1")
A_10C:definePushButton("UFC_2", 8, 3002, 386, "UFC", "2")
A_10C:definePushButton("UFC_3", 8, 3003, 387, "UFC", "3")
A_10C:definePushButton("UFC_4", 8, 3004, 388, "UFC", "4")
A_10C:definePushButton("UFC_5", 8, 3005, 389, "UFC", "5")
A_10C:definePushButton("UFC_6", 8, 3006, 390, "UFC", "6")
A_10C:definePushButton("UFC_7", 8, 3007, 391, "UFC", "7")
A_10C:definePushButton("UFC_8", 8, 3008, 392, "UFC", "8")
A_10C:definePushButton("UFC_9", 8, 3009, 393, "UFC", "9")
A_10C:definePushButton("UFC_10", 8, 3010, 395, "UFC", "10")
A_10C:definePushButton("UFC_SPC", 8, 3011, 396, "UFC", "SPC")
A_10C:definePushButton("UFC_HACK", 8, 3012, 394, "UFC", "HACK")
A_10C:definePushButton("UFC_FUNC", 8, 3013, 397, "UFC", "FUNC")
A_10C:definePushButton("UFC_LTR", 8, 3014, 398, "UFC", "LTR")
A_10C:definePushButton("UFC_CLR", 8, 3015, 399, "UFC", "CLR")
A_10C:definePushButton("UFC_ENT", 8, 3016, 400, "UFC", "ENT")
A_10C:definePushButton("UFC_MK", 8, 3017, 401, "UFC", "MK")
A_10C:definePushButton("UFC_ALT_ALRT", 8, 3018, 402, "UFC", "ALT ALRT")
A_10C:defineRockerSwitch("UFC_STEER", 8, 3020, 3020, 3021, 3021, 405, "UFC", "STEER Up/Down")
A_10C:defineRockerSwitch("UFC_DATA", 8, 3022, 3022, 3023, 3023, 406, "UFC", "DATA Up/Down")
A_10C:defineRockerSwitch("UFC_SEL", 8, 3024, 3024, 3025, 3025, 407, "UFC", "SEL Up/Down")
A_10C:defineRockerSwitch("UFC_DEPR", 8, 3026, 3026, 3027, 3027, 408, "UFC", "DEPR Up/Down")
A_10C:defineRockerSwitch("UFC_INTEN", 8, 3028, 3028, 3029, 3029, 409, "UFC", "INTEN Incr/Decr")
A_10C:definePushButton("UFC_COM1", 8, 3030, 531, "UFC", "Control VHF UHF Radio (A-10C II)")
A_10C:definePushButton("UFC_COM_SEC", 8, 3031, 532, "UFC", "COM SEC (A-10C II)")
A_10C:definePushButton("UFC_IFF", 8, 3032, 533, "UFC", "IFF (A-10C II)")
A_10C:definePushButton("UFC_COM2", 8, 3033, 534, "UFC", "Toggle ARC-210 RT2 Status (A-10C II)")
A_10C:definePushButton("UFC_ECCM", 8, 3034, 535, "UFC", "ECCM (A-10C II)")
A_10C:definePushButton("UFC_IDM", 8, 3035, 536, "UFC", "IDM (A-10C II)")

A_10C:definePushButton("UFC_MASTER_CAUTION", 24, 3001, 403, "UFC", "Master Caution Reset")
A_10C:definePushButton("GEAR_HORN_SILENCE", 24, 3003, 127, "Landing Gear and Flap Control Panel", "Landing Gear Horn Silence")

A_10C:definePushButton("CDU_LSK_3L", 9, 3001, 410, "CDU", "LSK 3L")
A_10C:definePushButton("CDU_LSK_5L", 9, 3002, 411, "CDU", "LSK 5L")
A_10C:definePushButton("CDU_LSK_7L", 9, 3003, 412, "CDU", "LSK 7L")
A_10C:definePushButton("CDU_LSK_9L", 9, 3004, 413, "CDU", "LSK 9L")
A_10C:definePushButton("CDU_LSK_3R", 9, 3005, 414, "CDU", "LSK 3R")
A_10C:definePushButton("CDU_LSK_5R", 9, 3006, 415, "CDU", "LSK 5R")
A_10C:definePushButton("CDU_LSK_7R", 9, 3007, 416, "CDU", "LSK 7R")
A_10C:definePushButton("CDU_LSK_9R", 9, 3008, 417, "CDU", "LSK 9R")
A_10C:definePushButton("CDU_SYS", 9, 3009, 418, "CDU", "SYS")
A_10C:definePushButton("CDU_NAV", 9, 3010, 419, "CDU", "NAV")
A_10C:definePushButton("CDU_WP", 9, 3011, 420, "CDU", "WP")
A_10C:definePushButton("CDU_OSET", 9, 3012, 421, "CDU", "OSET")
A_10C:definePushButton("CDU_FPM", 9, 3013, 422, "CDU", "FPM")
A_10C:definePushButton("CDU_PREV", 9, 3014, 423, "CDU", "PREV")
A_10C:definePushButton("CDU_1", 9, 3015, 425, "CDU", "1")
A_10C:definePushButton("CDU_2", 9, 3016, 426, "CDU", "2")
A_10C:definePushButton("CDU_3", 9, 3017, 427, "CDU", "3")
A_10C:definePushButton("CDU_4", 9, 3018, 428, "CDU", "4")
A_10C:definePushButton("CDU_5", 9, 3019, 429, "CDU", "5")
A_10C:definePushButton("CDU_6", 9, 3020, 430, "CDU", "6")
A_10C:definePushButton("CDU_7", 9, 3021, 431, "CDU", "7")
A_10C:definePushButton("CDU_8", 9, 3022, 432, "CDU", "8")
A_10C:definePushButton("CDU_9", 9, 3023, 433, "CDU", "9")
A_10C:definePushButton("CDU_0", 9, 3024, 434, "CDU", "0")
A_10C:definePushButton("CDU_POINT", 9, 3025, 435, "CDU", "Decimal Point")
A_10C:definePushButton("CDU_SLASH", 9, 3026, 436, "CDU", "Slash")
A_10C:definePushButton("CDU_A", 9, 3027, 437, "CDU", "A")
A_10C:definePushButton("CDU_B", 9, 3028, 438, "CDU", "B")
A_10C:definePushButton("CDU_C", 9, 3029, 439, "CDU", "C")
A_10C:definePushButton("CDU_D", 9, 3030, 440, "CDU", "D")
A_10C:definePushButton("CDU_E", 9, 3031, 441, "CDU", "E")
A_10C:definePushButton("CDU_F", 9, 3032, 442, "CDU", "F")
A_10C:definePushButton("CDU_G", 9, 3033, 443, "CDU", "G")
A_10C:definePushButton("CDU_H", 9, 3034, 444, "CDU", "H")
A_10C:definePushButton("CDU_I", 9, 3035, 445, "CDU", "I")
A_10C:definePushButton("CDU_J", 9, 3036, 446, "CDU", "J")
A_10C:definePushButton("CDU_K", 9, 3037, 447, "CDU", "K")
A_10C:definePushButton("CDU_L", 9, 3038, 448, "CDU", "L")
A_10C:definePushButton("CDU_M", 9, 3039, 449, "CDU", "M")
A_10C:definePushButton("CDU_N", 9, 3040, 450, "CDU", "N")
A_10C:definePushButton("CDU_O", 9, 3041, 451, "CDU", "O")
A_10C:definePushButton("CDU_P", 9, 3042, 452, "CDU", "P")
A_10C:definePushButton("CDU_Q", 9, 3043, 453, "CDU", "Q")
A_10C:definePushButton("CDU_R", 9, 3044, 454, "CDU", "R")
A_10C:definePushButton("CDU_S", 9, 3045, 455, "CDU", "S")
A_10C:definePushButton("CDU_T", 9, 3046, 456, "CDU", "T")
A_10C:definePushButton("CDU_U", 9, 3047, 457, "CDU", "U")
A_10C:definePushButton("CDU_V", 9, 3048, 458, "CDU", "V")
A_10C:definePushButton("CDU_W", 9, 3049, 459, "CDU", "W")
A_10C:definePushButton("CDU_X", 9, 3050, 460, "CDU", "X")
A_10C:definePushButton("CDU_Y", 9, 3051, 461, "CDU", "Y")
A_10C:definePushButton("CDU_Z", 9, 3052, 462, "CDU", "Z")
A_10C:definePushButton("CDU_NA1", 9, 3053, 464, "CDU", "No Function 1")
A_10C:definePushButton("CDU_NA2", 9, 3054, 465, "CDU", "No Function 2")
A_10C:definePushButton("CDU_MK", 9, 3055, 466, "CDU", "MK")
A_10C:definePushButton("CDU_BCK", 9, 3056, 467, "CDU", "BCK")
A_10C:definePushButton("CDU_SPC", 9, 3057, 468, "CDU", "SPC")
A_10C:definePushButton("CDU_CLR", 9, 3058, 470, "CDU", "CLR")
A_10C:definePushButton("CDU_FA", 9, 3059, 471, "CDU", "FA")
A_10C:defineRockerSwitch("CDU_BRT", 9, 3060, 3060, 3061, 3061, 424, "CDU", "CDU Display Brightness Adjustment")
A_10C:defineRockerSwitch("CDU_PG", 9, 3062, 3062, 3063, 3063, 463, "CDU", "PG Rocker")
A_10C:defineRockerSwitch("CDU_SCROLL", 9, 3064, 3064, 3065, 3065, 469, "CDU", "Scroll Waypoint Names (Blank Rocker)")
A_10C:defineRockerSwitch("CDU_DATA", 9, 3066, 3066, 3067, 3067, 472, "CDU", "+/- Rocker")

A_10C:define3PosTumbA10("AAP_STEERPT", 22, 3001, 473, "AAP", "STEERPT FLTPLAN - MARK - MISSION")
A_10C:defineSpringloaded_3PosTumb("AAP_STEER", 22, 3003, 3002, 474, "AAP", "Toggle Steerpoint")
A_10C:defineTumb("AAP_PAGE", 22, 3004, 475, 0.1, { 0, 0.3 }, nil, false, "AAP", "PAGE OTHER - POSITION - STEER - WAYPT")
A_10C:defineToggleSwitch("AAP_CDUPWR", 22, 3005, 476, "AAP", "CDU Power")
A_10C:defineToggleSwitch("AAP_EGIPWR", 22, 3006, 477, "AAP", "EGI Power")

A_10C:definePushButton("CLOCK_SET", 15, 3001, 68, "Digital Clock", "Clock SET")
A_10C:definePushButton("CLOCK_CTRL", 15, 3002, 69, "Digital Clock", "Clock CTRL")

local lastClockData = {}
A_10C:addExportHook(function()
	lastClockData = Module.parse_indication(4)
end)

local function getClockHH()
	return Functions.coerce_nil_to_string(lastClockData.txtHours)
end

local function getClockMM()
	return Functions.coerce_nil_to_string(lastClockData.txtMinutes)
end

local function getClockSS()
	return Functions.coerce_nil_to_string(lastClockData.txtSeconds)
end

local function getClockETC()
	return (lastClockData.txtET or "  ") .. (lastClockData.txtC or " ")
end

A_10C:defineString("CLOCK_HH", getClockHH, 2, "Digital Clock", "Clock Hours (or two spaces)")
A_10C:defineString("CLOCK_MM", getClockMM, 2, "Digital Clock", "Clock Minutes (or two spaces)")
A_10C:defineString("CLOCK_SS", getClockSS, 2, "Digital Clock", "Clock Seconds (or two spaces)")
A_10C:defineString("CLOCK_ETC", getClockETC, 3, "Digital Clock", "Clock ETC display ('ET ', '  C', or three spaces)")

A_10C:defineToggleSwitch("FSCP_EXT_TANKS_WING", 36, 3001, 106, "Fuel System Control Panel", "External Wing Tanks Boost Pumps")
A_10C:defineToggleSwitch("FSCP_EXT_TANKS_FUS", 36, 3002, 107, "Fuel System Control Panel", "External Fuselage Tanks Boost Pumps")
A_10C:defineToggleSwitch("FSCP_TK_GATE", 36, 3003, 108, "Fuel System Control Panel", "Tank Gate")
A_10C:defineToggleSwitch("FSCP_CROSSFEED", 36, 3004, 109, "Fuel System Control Panel", "Crossfeed")
A_10C:defineToggleSwitch("FSCP_BOOST_WING_L", 36, 3005, 110, "Fuel System Control Panel", "Boost Pumps Left Wing")
A_10C:defineToggleSwitch("FSCP_BOOST_WING_R", 36, 3006, 111, "Fuel System Control Panel", "Boost Pumps Right Wing")
A_10C:defineToggleSwitch("FSCP_BOOST_MAIN_L", 36, 3007, 112, "Fuel System Control Panel", "Boost Pumps Main Fuselage Left")
A_10C:defineToggleSwitch("FSCP_BOOST_MAIN_R", 36, 3008, 113, "Fuel System Control Panel", "Boost Pumps Main Fuselage Right")
A_10C:defineToggleSwitch("FSCP_AMPL", 36, 3009, 114, "Fuel System Control Panel", "Signal Amplifier NORM - OVERRIDE")
A_10C:definePushButton("FSCP_LINE_CHECK", 36, 3010, 115, "Fuel System Control Panel", "Line Check")
A_10C:definePushButton("FSCP_FD_WING_L", 36, 3012, 117, "Fuel System Control Panel", "Fill Disable Wing Left")
A_10C:definePushButton("FSCP_FD_WING_R", 36, 3013, 118, "Fuel System Control Panel", "Fill Disable Wing Right")
A_10C:definePushButton("FSCP_FD_MAIN_L", 36, 3014, 119, "Fuel System Control Panel", "Fill Disable Main Left")
A_10C:definePushButton("FSCP_FD_MAIN_R", 36, 3015, 120, "Fuel System Control Panel", "Fill Disable Main Right")
A_10C:defineToggleSwitch("FSCP_RCVR_LEVER", 36, 3016, 121, "Fuel System Control Panel", "Aerial Refueling Slipway Control Lever")

A_10C:definePushButton("FQIS_TEST", 36, 3018, 646, "Fuel Panel", "Fuel Gauge Test")
A_10C:defineTumb("FQIS_SELECT", 36, 3017, 645, 0.1, { 0, 0.4 }, nil, false, "Fuel Panel", "Fuel Display Selector")

A_10C:defineToggleSwitch("ENGINE_FUEL_FLOW_L", 37, 3001, 122, "Throttle", "Fuel Flow L")
A_10C:defineToggleSwitch("ENGINE_FUEL_FLOW_R", 37, 3002, 123, "Throttle", "Fuel Flow R")
A_10C:defineSpringloaded_3PosTumb("ENGINE_OPER_L", 37, 3003, 3007, 124, "Throttle", "ENG OPER L")
A_10C:defineSpringloaded_3PosTumb("ENGINE_OPER_R", 37, 3004, 3008, 125, "Throttle", "ENG OPER R")
A_10C:defineToggleSwitch("ENGINE_APU_START", 37, 3005, 126, "Throttle", "APU START")
A_10C:definePotentiometer("ENGINE_THROTTLE_FRICTION", 37, 3006, 128, nil, "Throttle", "Friction Control")

A_10C:definePushButton("ENGINE_TEMS_DATA", 37, 3009, 652, "Landing Gear and Flap Control Panel", "TEMS Data")

A_10C:define3PosTumb("LASTE_AP_MODE", 38, 3001, 132, "LASTE Panel", "AP MODE")
A_10C:definePushButton("LASTE_AP_TOGGLE", 38, 3002, 131, "LASTE Panel", "Autopilot Engage/Disengage")
A_10C:defineElectricallyHeldSwitch("LASTE_EAC", 38, 3026, 3027, 129, "LASTE Panel", "EAC On/Off")
A_10C:defineToggleSwitch("LASTE_RDR_ALTM", 67, 3001, 130, "LASTE Panel", "Radar Altimeter")

A_10C:defineElectricallyHeldSwitch("SASP_YAW_SAS_L", 38, 3003, 3004, 185, "SAS Panel", "Yaw SAS Left OFF - ENGAGE")
A_10C:defineElectricallyHeldSwitch("SASP_YAW_SAS_R", 38, 3005, 3006, 186, "SAS Panel", "Yaw SAS Right OFF - ENGAGE")
A_10C:defineElectricallyHeldSwitch("SASP_PITCH_SAS_L", 38, 3007, 3008, 187, "SAS Panel", "Pitch SAS Left OFF - ENGAGE")
A_10C:defineElectricallyHeldSwitch("SASP_PITCH_SAS_R", 38, 3009, 3010, 188, "SAS Panel", "Pitch SAS Right OFF - ENGAGE")
A_10C:defineSpringloaded_3PosTumb("SASP_MONITOR_TEST", 38, 3011, 3033, 189, "SAS Panel", "Monitor Test Left/Right")
A_10C:definePushButton("SASP_TO_TRIM", 38, 3012, 190, "SAS Panel", "T/O Trim Button")
A_10C:definePotentiometer("SASP_YAW_TRIM", 38, 3013, 192, { -1, 1 }, "SAS Panel", "Yaw Trim")

A_10C:defineToggleSwitch("EFCP_SPDBK_EMER_RETR", 38, 3015, 174, "Emergency Flight Control Panel", "Speed Brake Emergency Retract")
A_10C:defineToggleSwitch("EFCP_TRIM_OVERRIDE", 38, 3016, 175, "Emergency Flight Control Panel", "Pitch/Roll Trim Override EMER - NORM")
A_10C:defineHatSwitch("EFCP_EMER_TRIM", 38, 3025, { 3017, 3018, 3019, 3020 }, 176, 0.1, { 0, 0.4 }, "Emergency Flight Control Panel", "Emergency Trim CENTER - NOSE DN - RWD - NOSE UP - LWD")

A_10C:define3PosTumb("EFCP_AILERON_EMER_DISENGAGE", 38, 3021, 177, "Emergency Flight Control Panel", "Aileron Emergency Disengage LEFT - OFF - RIGHT")
A_10C:define3PosTumb("EFCP_ELEVATOR_EMER_DISENGAGE", 38, 3022, 180, "Emergency Flight Control Panel", "Elevator Emergency Disengage LEFT - OFF - RIGHT")
A_10C:defineToggleSwitch("EFCP_FLAPS_EMER_RETR", 38, 3023, 183, "Emergency Flight Control Panel", "Flaps Emergency Retract")
A_10C:defineToggleSwitch("EFCP_MRFCS", 38, 3024, 184, "Emergency Flight Control Panel", "Manual Reversion Flight Control System MAN REVERSION - NORM")

A_10C:defineToggleSwitch("EPP_APU_GEN_PWR", 1, 3001, 241, "Electrical Power Panel", "APU GEN PWR")
A_10C:defineSpringloaded_3PosTumb("EPP_INVERTER", 1, 3055, 3002, 242, "Electrical Power Panel", "Inverter TEST - OFF - STBY")
A_10C:defineToggleSwitch("EPP_AC_GEN_PWR_L", 1, 3004, 244, "Electrical Power Panel", "AC GEN PWR Left")
A_10C:defineToggleSwitch("EPP_AC_GEN_PWR_R", 1, 3005, 245, "Electrical Power Panel", "AC GEN PWR Right")
A_10C:defineToggleSwitch("EPP_BATTERY_PWR", 1, 3006, 246, "Electrical Power Panel", "Battery Power")
A_10C:defineToggleSwitch("EPP_EMER_FLOOD", 49, 3007, 243, "Electrical Power Panel", "Emergency Flood Light")

A_10C:defineToggleSwitch("GEAR_LEVER", 39, 3001, 716, "Landing Gear and Flap Control Panel", "Gear Lever DOWN - UP")
A_10C:definePushButton("DOWNLOCK_OVERRIDE", 39, 3003, 651, "Landing Gear and Flap Control Panel", "Downlock Override Button")
A_10C:defineTumb("FLAPS_SWITCH", 39, 3002, 773, 0.5, { 0, 1 }, nil, false, "Throttle", "Flaps Setting DN - MVR - UP")
A_10C:defineElectricallyHeldSwitch("ANTI_SKID_SWITCH", 38, 3028, 3029, 654, "Landing Gear and Flap Control Panel", "Anti-Skid Switch")

A_10C:definePushButton("NMSP_HARS_BTN", 46, 3001, 605, "NMSP", "HARS Button")
A_10C:defineIndicatorLight("NMSP_HARS_LED", 606, "NMSP", "HARS Button LED (green)")
A_10C:definePushButton("NMSP_EGI_BTN", 46, 3002, 607, "NMSP", "EGI Button")
A_10C:defineIndicatorLight("NMSP_EGI_LED", 608, "NMSP", "EGI Button LED (green)")
A_10C:definePushButton("NMSP_TISL_BTN", 46, 3003, 609, "NMSP", "TISL Button (No Function)")
A_10C:defineIndicatorLight("NMSP_TISL_LED", 610, "NMSP", "TISL Button LED (green)")
A_10C:definePushButton("NMSP_STEERPT_BTN", 46, 3004, 611, "NMSP", "STEERPT Button")
A_10C:defineIndicatorLight("NMSP_STEERPT_LED", 612, "NMSP", "STEERPT Button LED (green)")
A_10C:definePushButton("NMSP_ANCHR_BTN", 46, 3005, 613, "NMSP", "ANCHR Button")
A_10C:defineIndicatorLight("NMSP_ANCHR_LED", 614, "NMSP", "ANCHR Button LED (green)")
A_10C:definePushButton("NMSP_TCN_BTN", 46, 3006, 615, "NMSP", "TCN Button")
A_10C:defineIndicatorLight("NMSP_TCN_LED", 616, "NMSP", "TCN Button LED (green)")
A_10C:definePushButton("NMSP_ILS_BTN", 46, 3007, 617, "NMSP", "ILS Button")
A_10C:defineIndicatorLight("NMSP_ILS_LED", 618, "NMSP", "ILS Button LED (green)")
A_10C:defineToggleSwitch("NMSP_ABLE_STOW", 46, 3008, 621, "NMSP", "Able/Stow Localizer Bars")

A_10C:defineTumb("TISL_MODE", 57, 3001, 622, 0.1, { 0, 0.4 }, nil, false, "TISL Panel", "TISL Mode (A-10C)")
A_10C:define3PosTumb("TISL_SLANT_RANGE", 57, 3002, 623, "TISL Panel", "Slant Range UNDER 5 - 5 - 10 (A-10C)")
A_10C:defineTumb("TISL_ALT_10000", 57, 3003, 624, 0.1, { 0, 1 }, { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }, "skiplast", "TISL Panel", "Altitude Above Target, 10000 ft (A-10C)")
A_10C:defineTumb("TISL_ALT_1000", 57, 3004, 626, 0.1, { 0, 1 }, { "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }, "skiplast", "TISL Panel", "Altitude Above Target, 1000 ft (A-10C)")
A_10C:defineTumb("TISL_CODE1", 57, 3005, 636, 0.05, { 0, 1 }, { "0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "0" }, "skiplast", "TISL Panel", "Code Wheel 1 (A-10C)")
A_10C:defineTumb("TISL_CODE2", 57, 3006, 638, 0.05, { 0, 1 }, { "0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "0" }, "skiplast", "TISL Panel", "Code Wheel 2 (A-10C)")
A_10C:defineTumb("TISL_CODE3", 57, 3007, 640, 0.05, { 0, 1 }, { "0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "0" }, "skiplast", "TISL Panel", "Code Wheel 3 (A-10C)")
A_10C:defineTumb("TISL_CODE4", 57, 3008, 642, 0.05, { 0, 1 }, { "0", "0.5", "1", "1.5", "2", "2.5", "3", "3.5", "4", "4.5", "5", "5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "0" }, "skiplast", "TISL Panel", "Code Wheel 4 (A-10C)")
A_10C:define3PosTumb("TISL_AUX", 57, 3009, 644, "TISL Panel", "TISL AUX Switch (A-10C)")
A_10C:definePushButton("TISL_ENTER", 57, 3010, 628, "TISL Panel", "TISL ENTER (A-10C)")
A_10C:definePushButton("TISL_BITE", 57, 3011, 632, "TISL Panel", "TISL BITE (A-10C)")

A_10C:definePushButton("EXT_STORES_JETTISON", 12, 3001, 101, "Glare Shield", "External Stores Jettison Button")

A_10C:definePushButton("LAMP_TEST_BTN", 24, 3002, 197, "Auxiliary Light Control Panel", "Signal Lights Test")

A_10C:defineToggleSwitch("GND_SAFE_OVERRIDE_COVER", 12, 3002, 709, "Misc", "Ground Safety Override Switch Cover")
A_10C:defineToggleSwitch("GND_SAFE_OVERRIDE", 12, 3003, 710, "Misc", "Ground Safety Override")

A_10C:defineSetCommandTumb("IFF_CODE", 43, 3007, 199, 0.1, { 0, 0.3 }, nil, false, "IFF", "IFF Code: ZERO - B - A - (HOLD)")
A_10C:defineTumb("IFF_MASTER", 43, 3008, 200, 0.1, { 0, 0.4 }, nil, false, "IFF", "IFF Master: OFF - STBY - LOW - NORM - EMER")
A_10C:define3PosTumb("IFF_OUT_AUDIO_LIGHT", 43, 3009, 201, "IFF", "IFF Out: LIGHT - OFF - AUDIO")
A_10C:defineRockerSwitch("IFF_TEST_M1", 43, 3010, 3010, 3041, 3041, 202, "IFF", "Test M-1")
A_10C:defineRockerSwitch("IFF_TEST_M2", 43, 3011, 3011, 3042, 3042, 203, "IFF", "Test M-2")
A_10C:defineRockerSwitch("IFF_TEST_M3", 43, 3012, 3012, 3043, 3043, 204, "IFF", "Test M-3")
A_10C:defineRockerSwitch("IFF_TEST_M4", 43, 3013, 3013, 3044, 3044, 205, "IFF", "Test M-4")
A_10C:defineRockerSwitch("IFF_RADTEST", 43, 3014, 3014, 3045, 3045, 206, "IFF", "RAD Test/Mon")
A_10C:defineRockerSwitch("IFF_MIC_IDENT", 43, 3015, 3015, 3046, 3046, 207, "IFF", "Ident/Mic")
A_10C:defineToggleSwitch("IFF_ON_OUT", 43, 3016, 208, "IFF", "IFF On/Out")
A_10C:defineTumb("IFF_MODE1_WHEEL1", 43, 3001, 209, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-1 Wheel 1")
A_10C:defineTumb("IFF_MODE1_WHEEL2", 43, 3002, 210, 0.1, { 0, 0.3 }, nil, true, "IFF", "Mode-1 Wheel 2")
A_10C:defineTumb("IFF_MODE3A_WHEEL1", 43, 3003, 211, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-3A Wheel 1")
A_10C:defineTumb("IFF_MODE3A_WHEEL2", 43, 3004, 212, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-3A Wheel 2")
A_10C:defineTumb("IFF_MODE3A_WHEEL3", 43, 3005, 213, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-3A Wheel 3")
A_10C:defineTumb("IFF_MODE3A_WHEEL4", 43, 3006, 214, 0.1, { 0, 0.7 }, nil, true, "IFF", "Mode-3A Wheel 4")
A_10C:definePushButton("IFF_REPLY_TEST", 43, 3017, 795, "IFF", "REPLY Push to Test")
A_10C:definePotentiometer("IFF_REPLY_DIM", 43, 3020, 900, { 0, 1 }, "IFF", "IFF Reply Dim")
A_10C:definePushButton("IFF_TEST_TEST", 43, 3018, 796, "IFF", "TEST Push to Test")
A_10C:definePotentiometer("IFF_TEST_DIM", 43, 3021, 901, { 0, 1 }, "IFF", "TEST Reply Dim")

A_10C:defineSpringloaded_3PosTumb("OXY_EMERGENCY", 40, 3004, 3003, 601, "Oxygen Regulator Panel", "Oxygen Flow: Emergency / Normal / Test")
A_10C:defineToggleSwitch("OXY_DILUTER", 40, 3002, 602, "Oxygen Regulator Panel", "Oxygen Normal/100%")
A_10C:defineToggleSwitch("OXY_SUPPLY", 40, 3001, 603, "Oxygen Regulator Panel", "Oxygen Supply On/Off")
A_10C:defineFloat("OXY_PRESS", 604, { 0, 1 }, "Oxygen Regulator Panel", "Oxygen Pressure Indicator")
A_10C:defineIndicatorLight("OXY_FLOW", 600, "Oxygen Regulator Panel", "Flow Indicator (on/off) (white)")

A_10C:defineFloat("OXY_VOLUME", 274, { 0, 1 }, "Environment Control Panel", "Oxygen Volume (0 to 5 liters)")
A_10C:defineFloat("CABIN_PRESS_ALT", 281, { 0, 1 }, "Environment Control Panel", "Cabin Pressure Altitude")
A_10C:definePushButton("ENVCP_OXY_TEST", 41, 3001, 275, "Environment Control Panel", "Oxygen Indicator Test")
A_10C:defineToggleSwitch("ENVCP_WINDSHIELD_DEFOG", 41, 3002, 276, "Environment Control Panel", "Windshield Defog/Deice")
A_10C:definePotentiometer("ENVCP_CANOPY_DEFOG", 41, 3003, 277, { 0, 1 }, "Environment Control Panel", "Canopy Defog")
A_10C:define3PosTumb("ENVCP_WRRW", 41, 3004, 278, "Environment Control Panel", "Windshield Rain Removal/Wash")
A_10C:defineToggleSwitch("ENVCP_PITOT_HEAT", 41, 3005, 279, "Environment Control Panel", "Pitot Heat")
A_10C:defineToggleSwitch("ENVCP_BLEED_AIR", 41, 3006, 280, "Environment Control Panel", "Bleed Air")
A_10C:define3PosTumb("ENVCP_TEMP_PRESS", 41, 3007, 282, "Environment Control Panel", "Temperature/Pressure Control")
A_10C:reserveIntValue(7)
A_10C:defineToggleSwitch("ENVCP_AIR_SUPPLY", 41, 3008, 283, "Environment Control Panel", "Main Air Supply")
A_10C:definePotentiometer("ENVCP_FLOW_LEVEL", 41, 3009, 284, { 0, 1 }, "Environment Control Panel", "Flow Level")
A_10C:definePotentiometer("ENVCP_TEMP_LEVEL", 41, 3013, 286, { 0, 1 }, "Environment Control Panel", "Temp Level Control")
A_10C:defineTumb("ENVCP_AC_OPER", 41, 3010, 285, 0.1, { 0, 0.3 }, nil, false, "Environment Control Panel", "Air Conditioner MAN/AUTO/COLD/HOT")

A_10C:definePushButton("CBP_AILERON_DISC_L", 1, 3007, 666, "Circuit Breaker Panel", "AILERON DISC L Circuit Breaker")
A_10C:definePushButton("CBP_AILERON_DISC_R", 1, 3008, 667, "Circuit Breaker Panel", "AILERON DISC R Circuit Breaker")
A_10C:definePushButton("CBP_SPS_RUDDER_AUTH_LIM", 1, 3009, 668, "Circuit Breaker Panel", "SPS RUDDER AUTH LIM Circuit Breaker")
A_10C:definePushButton("CBP_ELEVATOR_DISC_L", 1, 3010, 669, "Circuit Breaker Panel", "ELEVATOR DISC L Circuit Breaker")
A_10C:definePushButton("CBP_ELEVATOR_DISC_R", 1, 3011, 670, "Circuit Breaker Panel", "ELEVATOR DISC R Circuit Breaker")
A_10C:definePushButton("CBP_AILERON_TAB_L", 1, 3012, 671, "Circuit Breaker Panel", "AILERON TAB L Circuit Breaker")
A_10C:definePushButton("CBP_AILERON_TAB_R", 1, 3013, 672, "Circuit Breaker Panel", "AILERON TAB R Circuit Breaker")
A_10C:definePushButton("CBP_EMER_FLAP", 1, 3014, 673, "Circuit Breaker Panel", "EMER FLAP Circuit Breaker")
A_10C:definePushButton("CBP_EMER_TRIM", 1, 3015, 674, "Circuit Breaker Panel", "EMER TRIM Circuit Breaker")
A_10C:definePushButton("CBP_GEAR", 1, 3016, 675, "Circuit Breaker Panel", "GEAR Circuit Breaker")
A_10C:definePushButton("CBP_ENG_START_L", 1, 3017, 676, "Circuit Breaker Panel", "ENG START L Circuit Breaker")
A_10C:definePushButton("CBP_ENG_START_R", 1, 3018, 677, "Circuit Breaker Panel", "ENG START R Circuit Breaker")
A_10C:definePushButton("CBP_APU_CONT", 1, 3019, 678, "Circuit Breaker Panel", "APU CONT Circuit Breaker")
A_10C:definePushButton("CBP_ENG_IGNITOR_1", 1, 3020, 679, "Circuit Breaker Panel", "ENG IGNITOR 1 Circuit Breaker")
A_10C:definePushButton("CBP_ENG_IGNITOR_2", 1, 3021, 680, "Circuit Breaker Panel", "ENG IGNITOR 2 Circuit Breaker")
A_10C:definePushButton("CBP_FUEL_SHUTOFF_L", 1, 3022, 681, "Circuit Breaker Panel", "FUEL SHUTOFF L Circuit Breaker")
A_10C:definePushButton("CBP_FUEL_SHUTOFF_R", 1, 3023, 682, "Circuit Breaker Panel", "FUEL SHUTOFF R Circuit Breaker")
A_10C:definePushButton("CBP_DC_FUEL_PUMP", 1, 3024, 683, "Circuit Breaker Panel", "DC FUEL PUMP Circuit Breaker")
A_10C:definePushButton("CBP_BLEED_AIR_CONT_L", 1, 3025, 684, "Circuit Breaker Panel", "BLEED AIR CONT L Circuit Breaker")
A_10C:definePushButton("CBP_BLEED_AIR_CONT_R", 1, 3026, 685, "Circuit Breaker Panel", "BLEED AIR CONT R Circuit Breaker")
A_10C:definePushButton("CBP_EXT_STORES_JETT_1", 1, 3027, 686, "Circuit Breaker Panel", "EXT STORES JETT 1 Circuit Breaker")
A_10C:definePushButton("CBP_EXT_STORES_JETT_2", 1, 3028, 687, "Circuit Breaker Panel", "EXT STORES JETT 2 Circuit Breaker")
A_10C:definePushButton("CBP_STBY_ATT_IND", 1, 3029, 688, "Circuit Breaker Panel", "STBY ATT IND Circuit Breaker")
A_10C:definePushButton("CBP_MASTER_CAUTION", 1, 3030, 689, "Circuit Breaker Panel", "MASTER CAUTION Circuit Breaker")
A_10C:definePushButton("CBP_PITOT_HEAT_AC", 1, 3031, 690, "Circuit Breaker Panel", "PITOT HEAT AC Circuit Breaker")
A_10C:definePushButton("CBP_IFF", 1, 3032, 691, "Circuit Breaker Panel", "IFF Circuit Breaker")
A_10C:definePushButton("CBP_UHF", 1, 3033, 692, "Circuit Breaker Panel", "UHF Circuit Breaker")
A_10C:definePushButton("CBP_INTERCOM", 1, 3034, 693, "Circuit Breaker Panel", "INTERCOM Circuit Breaker")
A_10C:definePushButton("CBP_GEN_CONT_L", 1, 3035, 694, "Circuit Breaker Panel", "GEN CONT L Circuit Breaker")
A_10C:definePushButton("CBP_GEN_CONT_R", 1, 3036, 695, "Circuit Breaker Panel", "GEN CONT R Circuit Breaker")
A_10C:definePushButton("CBP_CONVERTER_L", 1, 3037, 696, "Circuit Breaker Panel", "CONVERTER L Circuit Breaker")
A_10C:definePushButton("CBP_AUX_ESS_BUS_0A", 1, 3038, 697, "Circuit Breaker Panel", "AUX ESS BUS 0A Circuit Breaker")
A_10C:definePushButton("CBP_AUX_ESS_BUS_0B", 1, 3039, 698, "Circuit Breaker Panel", "AUX ESS BUS 0B Circuit Breaker")
A_10C:definePushButton("CBP_AUX_ESS_BUS_0C", 1, 3040, 699, "Circuit Breaker Panel", "AUX ESS BUS 0C Circuit Breaker")
A_10C:definePushButton("CBP_BAT_BUS_TRANS", 1, 3041, 700, "Circuit Breaker Panel", "BAT BUS TRANS Circuit Breaker")
A_10C:definePushButton("CBP_INVERTER_PWR", 1, 3042, 701, "Circuit Breaker Panel", "INVERTER PWR Circuit Breaker")
A_10C:definePushButton("CBP_INVERTER_CONT", 1, 3043, 702, "Circuit Breaker Panel", "INVERTER CONT Circuit Breaker")
A_10C:definePushButton("CBP_AUX_ESS_BUS_TIE", 1, 3044, 703, "Circuit Breaker Panel", "AUX ESS BUS TIE Circuit Breaker")

A_10C:defineRotary("ALT_SET_PRESSURE", 35, 3001, 62, "Altimeter", "Set Pressure")
A_10C:defineSpringloaded_3PosTumb("ALT_ELECT_PNEU", 62, 3002, 3001, 60, "Altimeter", "ELECT / PNEU")

A_10C:define3PosTumb("LCP_POSITION", 49, 3008, 287, "Light System Control Panel", "Position Lights FLASH/OFF/STEADY")
-- skip 3 bits in the memory map to preserve backwards compatibility:
A_10C:reserveIntValue(7)
A_10C:definePotentiometer("LCP_FORMATION", 49, 3009, 288, { 0, 1 }, "Light System Control Panel", "Formation Lights")
A_10C:defineElectricallyHeldSwitch("LCP_ANTICOLLISION", 49, 3010, 3011, 289, "Light System Control Panel", "Anticollision Lights")
A_10C:definePotentiometer("LCP_ENG_INST", 49, 3001, 290, { 0, 1 }, "Light System Control Panel", "Engine Instrument Lights")
A_10C:defineToggleSwitch("LCP_NOSE_ILLUM", 49, 3012, 291, "Light System Control Panel", "Nose Illumination")
A_10C:definePotentiometer("LCP_FLIGHT_INST", 49, 3002, 292, { 0, 1 }, "Light System Control Panel", "Flight Instrument Lights")
A_10C:definePotentiometer("LCP_AUX_INST", 49, 3003, 293, { 0, 1 }, "Light System Control Panel", "Aux Instrument Lights")
A_10C:defineToggleSwitch("LCP_SIGNAL_LIGHTS", 49, 3013, 294, "Light System Control Panel", "Signal Lights")
A_10C:defineToggleSwitch("LCP_ACCEL_COMP", 49, 3004, 295, "Light System Control Panel", "Accelerometer and Compass Lights")
A_10C:definePotentiometer("LCP_FLOOD", 49, 3005, 296, { 0, 1 }, "Light System Control Panel", "Flood Lights")
A_10C:definePotentiometer("LCP_CONSOLE", 49, 3006, 297, { 0, 1 }, "Light System Control Panel", "Console Lights")

A_10C:define3PosTumbA10("LANDING_LIGHTS", 49, 3014, 655, "Landing Gear and Flap Control Panel", "Landing Lights TAXI/OFF/LAND")

A_10C:definePotentiometer("ALCP_RSIL", 49, 3015, 193, { 0, 1 }, "Auxiliary Light Control Panel", "Refuel Status Indexer Lights")
A_10C:definePotentiometer("ALCP_WPNSTA", 49, 3016, 195, { 0, 1 }, "Auxiliary Light Control Panel", "Weapon Station Lights (No Function)")
A_10C:define3PosTumbA10("ALCP_NVIS_LTS", 49, 3017, 194, "Auxiliary Light Control Panel", "Nightvision Lights")
A_10C:definePotentiometer("ALCP_RCVR_LTS", 49, 3018, 116, { 0, 1 }, "Auxiliary Light Control Panel", "Refueling Lighting Dial")
A_10C:defineToggleSwitch("ALCP_HARSSAS", 38, 3031, 196, "Auxiliary Light Control Panel", "HARS-SAS Override/Norm")
A_10C:definePushButton("ALCP_FDBA_TEST", 24, 3004, 198, "Auxiliary Light Control Panel", "Fire Detect Bleed Air Test")

A_10C:defineToggleSwitch("FIRE_LENG_PULL", 50, 3001, 102, "Glare Shield", "Left Engine Fire T-Handle")
A_10C:defineToggleSwitch("FIRE_APU_PULL", 50, 3002, 103, "Glare Shield", "APU Fire T-Handle")
A_10C:defineToggleSwitch("FIRE_RENG_PULL", 50, 3003, 104, "Glare Shield", "Right Engine Fire T-Handle")
A_10C:define3PosTumb("FIRE_EXT_DISCH", 50, 3004, 105, "Glare Shield", "Fire Extinguisher Discharge Left/Off/Right")

A_10C:defineVariableStepTumb("HSI_CRS_KNOB", 45, 3002, 44, 1.0, "HSI", "Course Select Knob")
A_10C:defineVariableStepTumb("HSI_HDG_KNOB", 45, 3001, 45, 1.0, "HSI", "Heading Select Knob")

A_10C:definePotentiometer("ADI_PITCH_TRIM", 47, 3001, 22, { -0.5, 0.5 }, "ADI", "ADI Pitch Trim")

A_10C:definePushButton("SAI_CAGE", 48, 3002, 67, "Standby Attitude Indicator", "Cage SAI")
A_10C:definePotentiometer("SAI_PITCH_TRIM", 48, 3003, 66, { -1, 1 }, "Standby Attitude Indicator", "SAI Pitch Trim")

local function getTacanChannel()
	local tcn_2 = GetDevice(0):get_argument_value(263) == 0 and 0 or 1
	local tcn_1 = string.format("%.1f", GetDevice(0):get_argument_value(264)):sub(3)
	local tcn_0 = string.format("%.1f", GetDevice(0):get_argument_value(265)):sub(3)
	local tcn_xy = GetDevice(0):get_argument_value(266) == 0 and "X" or "Y"

	return tcn_2 .. tcn_1 .. tcn_0 .. tcn_xy
end

A_10C:defineString("TACAN_CHANNEL", getTacanChannel, 4, "TACAN Panel", "TACAN Channel")
A_10C:definePushButton("TACAN_TEST_BTN", 74, 3004, 259, "TACAN Panel", "TACAN Test Button")
A_10C:definePotentiometer("TACAN_VOL", 74, 3005, 261, { 0, 1 }, "TACAN Panel", "TACAN Signal Volume")

A_10C:defineFixedStepTumb("TACAN_10", 74, 3001, 256, 0.1, { 0, 1 }, { -0.1, 0.1 }, nil, "TACAN Panel", "Left Channel Selector")
A_10C:defineFixedStepTumb("TACAN_1", 74, 3002, 257, 0.1, { 0, 1 }, { -0.1, 0.1 }, nil, "TACAN Panel", "Right Channel Selector")
A_10C:defineToggleSwitch("TACAN_XY", 74, 3003, 258, "TACAN Panel", "TACAN Channel X/Y Toggle")

A_10C:defineTumb("TACAN_MODE", 74, 3006, 262, 0.1, { 0, 0.4 }, nil, false, "TACAN Panel", "TACAN Mode Dial")

A_10C:definePotentiometer("STALL_VOL", 52, 3001, 704, nil, "Stall System Volume Controls", "Stall Volume")
A_10C:definePotentiometer("STALL_PEAK_VOL", 52, 3002, 705, nil, "Stall System Volume Controls", "Peak Volume")

A_10C:defineToggleSwitch("ILS_PWR", 53, 3001, 247, "ILS Panel", "ILS Power")
A_10C:defineSetCommandTumb("ILS_MHZ", 53, 3002, 248, 0.1, { 0, 0.3 }, { "108", "109", "110", "111" }, false, "ILS Panel", "ILS Frequency MHz")
A_10C:defineSetCommandTumb("ILS_KHZ", 53, 3003, 249, 0.1, { 0.0, 0.9 }, { "10", "15", "30", "35", "50", "55", "70", "75", "90", "95" }, false, "ILS Panel", "ILS Frequency KHz")
A_10C:definePotentiometer("ILS_VOL", 53, 3004, 250, { 0, 1 }, "ILS Panel", "ILS Volume")

A_10C:defineTumb("UHF_PRESET_SEL", 54, 3001, 161, 0.05, { 0, 1 }, { " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20" }, false, "UHF Radio", "UHF Preset Channel Selector")
A_10C:defineTumb("UHF_100MHZ_SEL", 54, 3002, 162, 0.1, { 0, 0.2 }, { "2", "3", "A" }, false, "UHF Radio", "UHF 100MHz Selector")
A_10C:defineTumb("UHF_10MHZ_SEL", 54, 3003, 163, 0.1, { 0, 0.9 }, nil, false, "UHF Radio", "UHF 10MHz Selector")
A_10C:defineTumb("UHF_1MHZ_SEL", 54, 3004, 164, 0.1, { 0, 0.9 }, nil, false, "UHF Radio", "UHF 1MHz Selector")
A_10C:defineTumb("UHF_POINT1MHZ_SEL", 54, 3005, 165, 0.1, { 0, 0.9 }, nil, false, "UHF Radio", "UHF 0.1MHz Selector")
A_10C:defineTumb("UHF_POINT25_SEL", 54, 3006, 166, 0.1, { 0, 0.3 }, { "00", "25", "50", "75" }, false, "UHF Radio", "UHF 0.25MHz Selector")
A_10C:define3PosTumbA10("UHF_MODE", 54, 3007, 167, "UHF Radio", "Frequency Mode Dial MNL/PRESET/GRD")
A_10C:defineTumb("UHF_FUNCTION", 54, 3008, 168, 0.1, { 0, 0.3 }, nil, false, "UHF Radio", "UHF Function Dial OFF/MAIN/BOTH/ADF")
A_10C:define3PosTumb("UHF_T_TONE", 54, 3009, 169, "UHF Radio", "T-Tone Button")
A_10C:defineToggleSwitch("UHF_SQUELCH", 54, 3010, 170, "UHF Radio", "Squelch Switch")
A_10C:definePotentiometer("UHF_VOL", 54, 3011, 171, { 0, 1 }, "UHF Radio", "UHF Volume Control")
A_10C:definePushButton("UHF_TEST", 54, 3012, 172, "UHF Radio", "Display Test Button")
A_10C:definePushButton("UHF_STATUS", 54, 3013, 173, "UHF Radio", "Status Button")
A_10C:definePushButton("UHF_LOAD", 54, 3015, 735, "UHF Radio", "Load Button")
A_10C:defineToggleSwitch("UHF_COVER", 54, 3014, 734, "UHF Radio", "Load Button Cover")

local function getUHFPreset()
	local ind = Module.parse_indication(10)
	return Functions.coerce_nil_to_string(ind["txtPresetChannel"])
end

local function getUHFFrequency()
	local ind = Module.parse_indication(11)
	local freqStatus = Functions.coerce_nil_to_string(ind["txtFreqStatus"]) -- e.g. "251000"
	return freqStatus:sub(0, 3) .. "." .. freqStatus:sub(4, 6)
end

A_10C:defineString("UHF_FREQUENCY", getUHFFrequency, 7, "UHF Radio", "UHF Frequency Display")
A_10C:defineString("UHF_PRESET", getUHFPreset, 2, "UHF Radio", "UHF Preset Display")

A_10C:defineRadioWheel("VHFAM_PRESET", 55, 3001, 3001, { -0.01, 0.01 }, 137, 0.01, { 0, 0.20 }, { " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20" }, "VHF AM Radio", "Preset Channel Selector")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:defineMultipositionSwitch("VHFAM_MODE", 55, 3003, 138, 3, 0.1, "VHF AM Radio", "Mode OFF/TR/DF")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:defineMultipositionSwitch("VHFAM_FREQEMER", 55, 3004, 135, 4, 0.1, "VHF AM Radio", "Frequency Selection Dial FM/AM/MAN/PRE")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:definePotentiometer("VHFAM_VOL", 55, 3005, 133, { 0, 1 }, "VHF AM Radio", "VHF AM Volume Control")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:definePushButton("VHFAM_LOAD", 55, 3006, 136, "VHF AM Radio", "Load Button")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:define3PosTumb("VHFAM_SQUELCH", 55, 3007, 134, "VHF AM Radio", "Squelch")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:defineRadioWheel("VHFAM_FREQ1", 55, 3009, 3010, { -0.1, 0.1 }, 143, 0.05, { 0.15, 0.80 }, { " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15" }, "VHF AM Radio", "Frequency Selector 1")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:defineRadioWheel("VHFAM_FREQ2", 55, 3011, 3012, { -0.1, 0.1 }, 144, 0.1, { 0, 1 }, nil, "VHF AM Radio", "Frequency Selector 2")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:defineRadioWheel("VHFAM_FREQ3", 55, 3013, 3014, { -0.1, 0.1 }, 145, 0.1, { 0, 1 }, nil, "VHF AM Radio", "Frequency Selector 3")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:definePushButton("VHFFM_LOAD", 56, 3006, 150, "VHF FM Radio", "Load Button")
A_10C:defineRadioWheel("VHFAM_FREQ4", 55, 3015, 3016, { -0.25, 0.25 }, 146, 0.25, { 0, 1 }, { "00", "25", "50", "75" }, "VHF AM Radio", "Frequency Selector 4")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:reserveIntValue(1)

A_10C:defineRadioWheel("VHFFM_PRESET", 56, 3001, 3001, { -0.01, 0.01 }, 151, 0.01, { 0, 0.20 }, { " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20" }, "VHF FM Radio", "Preset Channel Selector")
A_10C:defineMultipositionSwitch("VHFFM_MODE", 56, 3003, 152, 3, 0.1, "VHF FM Radio", "Mode OFF/TR/DF")
A_10C:defineMultipositionSwitch("VHFFM_FREQEMER", 56, 3004, 149, 4, 0.1, "VHF FM Radio", "Frequency Selection Dial FM/AM/MAN/PRE")
A_10C:definePotentiometer("VHFFM_VOL", 56, 3005, 147, { 0, 1 }, "VHF FM Radio", "VHF FM Volume Control")

A_10C:define3PosTumb("VHFFM_SQUELCH", 56, 3007, 148, "VHF FM Radio", "Squelch")
A_10C:defineRadioWheel("VHFFM_FREQ1", 56, 3009, 3010, { -0.1, 0.1 }, 157, 0.05, { 0.15, 0.80 }, { " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15" }, "VHF FM Radio", "Frequency Selector 1")
A_10C:defineRadioWheel("VHFFM_FREQ2", 56, 3011, 3012, { -0.1, 0.1 }, 158, 0.1, { 0, 1 }, nil, "VHF FM Radio", "Frequency Selector 2")
A_10C:defineRadioWheel("VHFFM_FREQ3", 56, 3013, 3014, { -0.1, 0.1 }, 159, 0.1, { 0, 1 }, nil, "VHF FM Radio", "Frequency Selector 3")
A_10C:defineRadioWheel("VHFFM_FREQ4", 56, 3015, 3016, { -0.25, 0.25 }, 160, 0.25, { 0, 1 }, { "00", "25", "50", "75" }, "VHF FM Radio", "Frequency Selector 4")

A_10C:defineToggleSwitch("EMER_BRAKE", 38, 3030, 772, "Misc", "Emergency Brake")
A_10C:defineTumb("INT_INT_UNMUTE", 58, 3001, 222, 1, { 0, 1 }, nil, false, "Intercom Panel", "INT Un-Mute")
A_10C:reserveIntValue(1)

A_10C:defineSpringloaded_3PosTumb("SEAT_ADJUST", 39, 3004, 3005, 770, "Misc", "Seat Adjust")
A_10C:define3Pos2CommandSwitchA10("CANOPY_OPEN", 39, 3006, 3007, 712, "Misc", "Canopy Open Switch") ----

A_10C:definePotentiometer("INT_INT_VOL", 58, 3002, 221, { 0, 1 }, "Intercom Panel", "INT Volume")
A_10C:definePotentiometer("INT_FM_VOL", 58, 3004, 223, { 0, 1 }, "Intercom Panel", "FM Volume")
A_10C:defineTumb("INT_FM_UNMUTE", 58, 3003, 224, 1, { 0, 1 }, nil, false, "Intercom Panel", "FM Un-Mute")
A_10C:definePotentiometer("INT_VHF_VOL", 58, 3006, 225, { 0, 1 }, "Intercom Panel", "VHF Volume")
A_10C:defineTumb("INT_VHF_UNMUTE", 58, 3005, 226, 1, { 0, 1 }, nil, false, "Intercom Panel", "VHF Un-Mute")
A_10C:definePotentiometer("INT_UHF_VOL", 58, 3008, 227, { 0, 1 }, "Intercom Panel", "UHF Volume")
A_10C:defineTumb("INT_UHF_UNMUTE", 58, 3007, 228, 1, { 0, 1 }, nil, false, "Intercom Panel", "UHF Un-Mute")
A_10C:definePotentiometer("INT_AIM_VOL", 58, 3010, 229, { 0, 1 }, "Intercom Panel", "AIM Volume")
A_10C:defineTumb("INT_AIM_UNMUTE", 58, 3009, 230, 1, { 0, 1 }, nil, false, "Intercom Panel", "AIM Un-Mute")
A_10C:definePotentiometer("INT_IFF_VOL", 58, 3012, 231, { 0, 1 }, "Intercom Panel", "IFF Volume")
A_10C:defineTumb("INT_IFF_UNMUTE", 58, 3011, 232, 1, { 0, 1 }, nil, false, "Intercom Panel", "IFF Un-Mute")
A_10C:definePotentiometer("INT_ILS_VOL", 58, 3014, 233, { 0, 1 }, "Intercom Panel", "ILS Volume")
A_10C:defineTumb("INT_ILS_UNMUTE", 58, 3013, 234, 1, { 0, 1 }, nil, false, "Intercom Panel", "ILS Un-Mute")
A_10C:definePotentiometer("INT_TCN_VOL", 58, 3016, 235, { 0, 1 }, "Intercom Panel", "TCN Volume")
A_10C:defineTumb("INT_TCN_UNMUTE", 58, 3015, 236, 1, { 0, 1 }, nil, false, "Intercom Panel", "TCN Un-Mute")

A_10C:defineToggleSwitch("INT_HM", 58, 3017, 237, "Intercom Panel", "HM Switch")
A_10C:definePotentiometer("INT_VOL", 58, 3018, 238, { 0, 1 }, "Intercom Panel", "Intercom Volume")
A_10C:defineTumb("INT_MODE", 58, 3019, 239, 0.1, { 0, 0.4 }, nil, false, "Intercom Panel", "Intercom Selector Switch INT/FM/VHF/HF/Blank")
A_10C:definePushButton("INT_CALL", 58, 3020, 240, "Intercom Panel", "Call Button")

A_10C:definePushButton("HARS_FAST_ERECT", 44, 3001, 711, "HARS", "HARS Fast Erect Button")
A_10C:defineToggleSwitch("HARS_SLAVE_DG", 44, 3002, 270, "HARS", "HARS SLAVE-DG Mode")
A_10C:defineToggleSwitch("HARS_NS", 44, 3003, 273, "HARS", "HARS N/S toggle switch")
A_10C:define3PosTumb("HARS_MAGVAR", 44, 3004, 272, "HARS", "HARS MAG VAR")
A_10C:definePotentiometer("HARS_LATITUDE", 44, 3005, 271, { 0, 1 }, "HARS", "HARS Latitude Dial")
A_10C:definePotentiometer("HARS_HDG", 44, 3007, 268, { 0, 1 }, "HARS", "HARS Heading")
A_10C:definePushButton("HARS_PTS", 44, 3006, 267, "HARS", "HARS Push-to-Sync")

A_10C:defineToggleSwitch("KY58_ZEROIZE_COVER", 69, 3001, 778, "Secure Voice Comms Panel", "Zeroize Switch Cover")
A_10C:defineToggleSwitch("KY58_ZEROIZE", 69, 3002, 779, "Secure Voice Comms Panel", "Zeroize Switch")
A_10C:defineToggleSwitch("KY58_DELAY", 69, 3003, 780, "Secure Voice Comms Panel", "Delay Switch")
A_10C:defineMultipositionSwitch("KY58_PLAIN", 69, 3004, 781, 3, 0.1, "Secure Voice Comms Panel", "C/RAD Switch")
A_10C:defineMultipositionSwitch("KY58_1TO5", 69, 3005, 782, 6, 0.1, "Secure Voice Comms Panel", "Full Switch")
A_10C:defineMultipositionSwitch("KY58_MODE", 69, 3006, 783, 3, 0.1, "Secure Voice Comms Panel", "Mode Switch")
A_10C:defineToggleSwitch("KY58_PWR", 69, 3007, 784, "Secure Voice Comms Panel", "Power Switch")

A_10C:defineToggleSwitch("AUX_GEAR", 39, 3008, 718, "Misc", "Auxiliary Landing Gear Handle")
A_10C:defineToggleSwitch("AUX_GEAR_LOCK", 39, 3009, 722, "Misc", "Auxiliary Landing Gear Handle Lock Button")
A_10C:defineTumb("SEAT_ARM", 39, 3010, 733, 1, { 0, 1 }, nil, false, "Misc", "Seat Arm Handle (0 = ARM, 1 = DISARM)")

A_10C:defineToggleSwitch("LADDER_EXTEND_COVER", 39, 3011, 787, "Misc", "Extend Boarding Ladder Button Cover")
A_10C:definePushButton("LADDER_EXTEND", 39, 3012, 788, "Misc", "Extend Boarding Ladder Button")

A_10C:definePushButton("ACCEL_PTS", 72, 3001, 904, "Accelerometer", "Accelerometer Button")

A_10C:defineMultipositionSwitch("DVADR_FUNCTION", 73, 3001, 789, 3, 0.1, "DVADR", "Function Control Toggle Switch")
A_10C:defineMultipositionSwitch("DVADR_VIDEO", 73, 3002, 790, 3, 0.1, "DVADR", "Video Selector Toggle Switch")
A_10C:defineIndicatorLight("DVADR_EOT", 791, "DVADR", "DVADR End of Tape Indicator Light (yellow)")
A_10C:defineIndicatorLight("DVADR_REC_REMOTE", 794, "DVADR", "DVADR Record (On) Remote Panel Indicator Light (green)")

A_10C:definePushButton("SUIT_TEST", 41, 3014, 776, "Misc", "Anti-G Suit Valve Test Button")

A_10C:defineToggleSwitch("CANOPY_DISENGAGE", 39, 3013, 777, "Misc", "Canopy actuator disengage lever")
A_10C:defineToggleSwitch("CANOPY_JTSN", 39, 3014, 785, "Misc", "Canopy Jettison")
A_10C:defineToggleSwitch("CANOPY_JTSN_UNLOCK", 39, 3015, 786, "Misc", "Canopy Jettison Unlock")

A_10C:defineMultipositionSwitch("ANT_IFF", 43, 3019, 706, 3, 0.5, "Antenna Panel", "IFF Antenna Switch")
A_10C:defineMultipositionSwitch("ANT_UHF", 54, 3016, 707, 3, 0.5, "Antenna Panel", "UHF Antenna Switch")
A_10C:defineToggleSwitch("ANT_EGIHQTOD", 54, 3017, 708, "Antenna Panel", "EGI HQ TOD Switch")

A_10C:definePotentiometer("RWR_BRT", 29, 3001, 16, { 0.15, 0.85 }, "RWR", "Display Brightness")

local cdu_indicator_data = A_10C_CDU

local cdu_lines = {}

local cdu_replace_map = {
	[string.char(26)] = string.char(0xBB),
	[string.char(27)] = string.char(0xAB),
	[string.char(18)] = string.char(0xAE),
	[string.char(20)] = string.char(0xA1),
	["©"] = string.char(0xA9),
	["°"] = string.char(0xB0),
	["ю"] = string.char(0xB6),
	["я"] = string.char(0xB1),
}

-- the wind pages inherit from a parent
local cdu_parent_map = {
	["WIND1"] = "WIND",
	["WIND2"] = "WIND",
	["WNDEDIT1"] = "WNDEDIT",
	["WNDEDIT2"] = "WNDEDIT",
}

--- Gets the current CDU page, or nil if one isn't found
--- @return string page_name the name of the current CDU page
local function get_cdu_page_name()
	local page = list_cockpit_params():match('CDU_PAGE:"([0-9A-Za-z_]+)"')
	if not page then
		return "EGI1"
	end -- special case due to ED bug that results in nil being exported instead of EGI1
	local page_name = page:sub(5)
	return page_name
end

local CDU_LINE_LEN = 24

A_10C:addExportHook(function()
	local cdu = Module.parse_indication(3)

	local cursor_pos = 2
	if cdu.ScratchString then
		cursor_pos = cursor_pos + cdu.ScratchString:len()
	end
	cdu_indicator_data["Cursor"][1].x = cursor_pos

	local display_page = get_cdu_page_name()
	cdu_lines = TextDisplay.GetDisplayLines(cdu, CDU_LINE_LEN, 10, cdu_indicator_data, display_page, cdu_replace_map, cdu_parent_map, false)
end)

A_10C:defineString("CDU_LINE0", function()
	return cdu_lines[1]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 1")
A_10C:defineString("CDU_LINE1", function()
	return cdu_lines[2]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 2")
A_10C:defineString("CDU_LINE2", function()
	return cdu_lines[3]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 3")
A_10C:defineString("CDU_LINE3", function()
	return cdu_lines[4]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 4")
A_10C:defineString("CDU_LINE4", function()
	return cdu_lines[5]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 5")
A_10C:defineString("CDU_LINE5", function()
	return cdu_lines[6]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 6")
A_10C:defineString("CDU_LINE6", function()
	return cdu_lines[7]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 7")
A_10C:defineString("CDU_LINE7", function()
	return cdu_lines[8]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 8")
A_10C:defineString("CDU_LINE8", function()
	return cdu_lines[9]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 9")
A_10C:defineString("CDU_LINE9", function()
	return cdu_lines[10]
end, CDU_LINE_LEN, "CDU Display", "CDU Line 10")

local arc_210_data = {}

A_10C:addExportHook(function()
	if is_arc_210_present() then
		arc_210_data = Module.parse_indication(18)
	end
end)

-- these ARC-210 strings are brought over from a legacy method of providing data for the device
A_10C:defineString("ARC210_EXIT_SEND", function()
	return Functions.coerce_nil_to_string(arc_210_data["EXIT/SEND"])
end, 9, "ARC-210 Display", "EXIT/SEND")
A_10C:defineString("ARC210_XMIT_RECV", function()
	return Functions.coerce_nil_to_string(arc_210_data["xmit_recv_label"])
end, 4, "ARC-210 Display", "Transmit/Receive (XMIT/RECV)")
A_10C:defineString("ARC210_COMSEC_SUBMODE", function()
	return Functions.coerce_nil_to_string(arc_210_data["comsec_submode"])
end, 5, "ARC-210 Display", "COMSEC submode (PT/CT/CT-TD)")
A_10C:defineString("ARC210_ACTIVE_ECCM_CHANNEL", function()
	return Functions.coerce_nil_to_string(arc_210_data["active_eccm_channel_index"])
end, 2, "ARC-210 Display", "Active ECCM Channel")
A_10C:defineString("ARC210_SG_TIME", function()
	return Functions.coerce_nil_to_string(arc_210_data["SG_time"])
end, 5, "ARC-210 Display", "SG Time")
A_10C:defineString("ARC210_PREV", function()
	return Functions.coerce_nil_to_string(arc_210_data["PREV"])
end, 4, "ARC-210 Display", "Previous label")
A_10C:defineString("ARC210_COMSEC_MENU_MODE", function()
	return Functions.coerce_nil_to_string(arc_210_data["ky_label"])
end, 30, "ARC-210 Display", "COMSEC menu mode (LOS/DAMA)")
A_10C:defineString("ARC210_COMSEC_MODE", function()
	return Functions.coerce_nil_to_string(arc_210_data["comsec_mode"])
end, 11, "ARC-210 Display", "COMSEC mode")
A_10C:defineString("ARC210_MORE", function()
	return Functions.coerce_nil_to_string(arc_210_data["MORE"])
end, 4, "ARC-210 Display", "More")
A_10C:defineString("ARC210_LOAD_TIME", function()
	return Functions.coerce_nil_to_string(arc_210_data["LOAD\nTIME"])
end, 9, "ARC-210 Display", "Load Time")
A_10C:defineString("ARC210_KY_SUBMODE", function()
	return Functions.coerce_nil_to_string(arc_210_data["ky_submode_label"])
end, 1, "ARC-210 Display", "KY Submode")
A_10C:defineString("ARC210_EXIT_RECV", function()
	return Functions.coerce_nil_to_string(arc_210_data["EXIT/RECV"])
end, 9, "ARC-210 Display", "EXIT/RECV")
A_10C:defineString("ARC210_PREV_MANUAL_FREQ", function()
	return Functions.coerce_nil_to_string(arc_210_data["prev_manual_freq"])
end, 7, "ARC-210 Display", "Previous manual frequency")
A_10C:defineString("ARC210_FREQ_DOT_MARK", function()
	return Functions.coerce_nil_to_string(arc_210_data["dot_mark"])
end, 1, "ARC-210 Display", "Main frequency separator (.)")
A_10C:defineString("ARC210_MODULATION", function()
	return Functions.coerce_nil_to_string(arc_210_data["modulation_label"])
end, 2, "ARC-210 Display", "Modulation (AM/FM)")
A_10C:defineString("ARC210_SELECTED_RT", function()
	return Functions.coerce_nil_to_string(arc_210_data["txt_RT"])
end, 3, "ARC-210 Display", "Selected RT")
A_10C:defineString("ARC210_FREQ_KHZ", function()
	return Functions.coerce_nil_to_string(arc_210_data["freq_label_khz"])
end, 3, "ARC-210 Display", "Main frequency (kHz)")
A_10C:defineString("ARC210_EXIT_LOAD", function()
	return Functions.coerce_nil_to_string(arc_210_data["EXIT/LOAD"])
end, 9, "ARC-210 Display", "EXIT/LOAD")
A_10C:defineString("ARC210_FREQ_MHZ", function()
	return Functions.coerce_nil_to_string(arc_210_data["freq_label_mhz"])
end, 3, "ARC-210 Display", "Main frequency (MHz)")
A_10C:defineString("ARC210_ACTIVE_CHANNEL", function()
	return Functions.coerce_nil_to_string(arc_210_data["active_channel"])
end, 2, "ARC-210 Display", "Active Channel")
A_10C:defineString("ARC210_VERIFY_WOD_ACTIVE_CHANNEL", function()
	return Functions.coerce_nil_to_string(arc_210_data["active_channel"])
end, 2, "ARC-210 Display", "Active Channel (WOD Page)")
A_10C:defineString("ARC210_TR_PRSET_ACTIVE_CHANNEL", function()
	return Functions.coerce_nil_to_string(arc_210_data["active_channel"])
end, 2, "ARC-210 Display", "Active Channel (TR_PRSET Page)")

local function getCmscMws()
	return Functions.coerce_nil_to_string(cmscData.txt_MWS)
end

A_10C:defineString("CMSC_TXT_MWS", getCmscMws, 8, "CMSC", "MWS Status Display")

A_10C:defineIndicatorLight("NMSP_UHF_LED", 619, "NMSP", "UHF LED (green)")
A_10C:defineIndicatorLight("NMSP_FM_LED", 620, "NMSP", "FM LED (green)")

A_10C:define8BitFloat("VHFAM_FREQ1_ROT", 143, { 0, 1 }, "VHF AM Radio", "Frequency Selector 1 Rotation")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:define8BitFloat("VHFAM_FREQ2_ROT", 144, { 0, 1 }, "VHF AM Radio", "Frequency Selector 2 Rotation")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:define8BitFloat("VHFAM_FREQ3_ROT", 145, { 0, 1 }, "VHF AM Radio", "Frequency Selector 3 Rotation")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:define8BitFloat("VHFAM_FREQ4_ROT", 146, { 0, 1 }, "VHF AM Radio", "Frequency Selector 4 Rotation")
A_10C:conditionalize_last_export(is_vhf_am_present)

A_10C:define8BitFloat("VHFFM_FREQ1_ROT", 157, { 0, 1 }, "VHF FM Radio", "Frequency Selector 1 Rotation")
A_10C:define8BitFloat("VHFFM_FREQ2_ROT", 158, { 0, 1 }, "VHF FM Radio", "Frequency Selector 2 Rotation")
A_10C:define8BitFloat("VHFFM_FREQ3_ROT", 159, { 0, 1 }, "VHF FM Radio", "Frequency Selector 3 Rotation")
A_10C:define8BitFloat("VHFFM_FREQ4_ROT", 160, { 0, 1 }, "VHF FM Radio", "Frequency Selector 4 Rotation")

A_10C:defineFloat("AIRSPEED_MAX_IAS", 50, { 0, 1 }, "Airspeed Indicator", "Airspeed Max IAS Dial")

A_10C:defineFloat("COMPASS_HDG", 6, { -1, 1 }, "Standby Compass", "Compass Heading")
A_10C:defineFloat("COMPASS_PITCH", 720, { -1, 1 }, "Standby Compass", "Compass Pitch")
A_10C:defineFloat("COMPASS_BANK", 721, { -1, 1 }, "Standby Compass", "Compass Bank")

A_10C:defineFloat("ALT_PNEU_FLAG", 61, { 0, 1 }, "Altimeter", "PNEU Flag")

--Externals
A_10C:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_RIGHT", 182, "External Aircraft Model", "Right Speed Brake")

A_10C:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_LEFT", 186, "External Aircraft Model", "Left Speed Brake")

A_10C:defineFloatFromDrawArgument("EXT_FORMATION_LIGHTS", 200, "External Aircraft Model", "Formation Lights (light green)")

A_10C:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
A_10C:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")

A_10C:defineBitFromDrawArgument("EXT_STROBE_TAIL", 192, "External Aircraft Model", "Tail Strobe Light (white)")
A_10C:defineBitFromDrawArgument("EXT_STROBE_LEFT", 195, "External Aircraft Model", "Left Strobe Light (white)")
A_10C:defineBitFromDrawArgument("EXT_STROBE_RIGHT", 196, "External Aircraft Model", "Right Strobe Light (white)")

A_10C:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
A_10C:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
A_10C:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

A_10C:defineFloat("CANOPY_POS", 7, { 0, 1 }, "Misc", "Canopy Position")

A_10C:definePushButton("TISL_OVERTEMP", 57, 3012, 630, "TISL Panel", "TISL OVER TEMP")
A_10C:definePushButton("TISL_TRACK", 57, 3013, 634, "TISL Panel", "TISL TRACK")
A_10C:defineIndicatorLight("TISL_ENTER_L", 629, "TISL Panel", "TISL ENTER Light")
A_10C:defineIndicatorLight("TISL_OVERTEMP_L", 631, "TISL Panel", "TISL OVER TEMP Light")
A_10C:defineIndicatorLight("TISL_BITE_L", 633, "TISL Panel", "TISL BITE Light")
A_10C:defineIndicatorLight("TISL_TRACK_L", 635, "TISL Panel", "TISL TRACK Light")
A_10C:defineIndicatorLight("IFF_REPLY", 798, "IFF", "IFF REPLY Light (green)")
A_10C:defineIndicatorLight("IFF_TEST", 799, "IFF", "IFF TEST Light (green)")
A_10C:defineIndicatorLight("DVADR_EOT_REMOTE", 793, "DVADR", "DVADR End of Tape Remote Panel Indicator Light")
A_10C:defineIndicatorLight("DVADR_REC", 792, "DVADR", "DVADR Record (On) Indicator Light (green)")

A_10C:defineFloat("ENG_THROTTLE_L", 8, { 0, 1 }, "Throttle", "Left Engine Throttle")
A_10C:defineFloat("ENG_THROTTLE_R", 9, { 0, 1 }, "Throttle", "Right Engine Throttle")
A_10C:definePushButton("CMSC_UNK", 5, 3005, 371, "CMSC", "Display Unknown Threats")

local function getILSFrequency()
	local ils_mhz_lut = {
		["0.0"] = "108",
		["0.1"] = "109",
		["0.2"] = "110",
		["0.3"] = "111",
	}
	local ils_khz_lut = {
		["0.0"] = "10",
		["0.1"] = "15",
		["0.2"] = "30",
		["0.3"] = "35",
		["0.4"] = "50",
		["0.5"] = "55",
		["0.6"] = "70",
		["0.7"] = "75",
		["0.8"] = "90",
		["0.9"] = "95",
	}
	local mhz = ils_mhz_lut[string.format("%.1f", GetDevice(0):get_argument_value(251))] or "   "
	local khz = ils_khz_lut[string.format("%.01f", GetDevice(0):get_argument_value(252))] or "   "
	return mhz .. "." .. khz
end

local vhf_lut1 = {
	["0.0"] = "3",
	["0.15"] = "3",
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
	["0.75"] = "15",
}

local function getVhfAmFreqency()
	local freq1 = vhf_lut1[string.format("%.2f", GetDevice(0):get_argument_value(143))] or "  "
	local freq2 = string.format("%1.1f", GetDevice(0):get_argument_value(144)):sub(3)
	local freq3 = string.format("%1.1f", GetDevice(0):get_argument_value(145)):sub(3)
	local freq4 = string.format("%1.2f", GetDevice(0):get_argument_value(146)):sub(3)

	return freq1 .. freq2 .. "." .. freq3 .. freq4
end

local function getVhfFmFreqency()
	local freq1 = vhf_lut1[string.format("%.2f", GetDevice(0):get_argument_value(157))] or "  "
	local freq2 = string.format("%1.1f", GetDevice(0):get_argument_value(158)):sub(3)
	local freq3 = string.format("%1.1f", GetDevice(0):get_argument_value(159)):sub(3)
	local freq4 = string.format("%1.2f", GetDevice(0):get_argument_value(160)):sub(3)

	return freq1 .. freq2 .. "." .. freq3 .. freq4
end

A_10C:defineString("ILS_FREQUENCY_S", getILSFrequency, 6, "ILS Panel", "ILS Frequency (String)")
A_10C:defineString("VHF_AM_FREQUENCY_S", getVhfAmFreqency, 7, "VHF AM Radio", "VHF AM Frequency (String)")
A_10C:conditionalize_last_export(is_vhf_am_present)
A_10C:defineString("VHF_FM_FREQUENCY_S", getVhfFmFreqency, 7, "VHF FM Radio", "VHF FM Frequency (String)")

A_10C:defineFloat("INT_CONSOLE_L_BRIGHT", 800, { 0, 1 }, "Light System Control Panel", "Console Light Brightness")
A_10C:defineFloat("INT_ENG_INST_L_BRIGHT", 801, { 0, 1 }, "Light System Control Panel", "Engine Instrument Light Brightness")
A_10C:defineFloat("INT_FLT_INST_L_BRIGHT", 802, { 0, 1 }, "Light System Control Panel", "Flight Instruments Light Brightness")
A_10C:defineFloat("INT_AUX_INST_L_BRIGHT", 803, { 0, 1 }, "Light System Control Panel", "Auxiliary Instruments Light Brightness")
A_10C:defineFloat("INT_FLOOD_L_BRIGHT", 806, { 0, 1 }, "Light System Control Panel", "Flood Light Brightness")
A_10C:defineFloat("INT_CAUTION_L_BRIGHT", 905, { 0, 1 }, "Light System Control Panel", "Caution Lights Brightness")

A_10C:defineToggleSwitch("MIRROR_TOGGLE", 0, 3001, 719, "Misc", "Toggle Mirrors")
A_10C:defineFloat("OXY_FLOW_G", 600, { 0, 1 }, "Oxygen Regulator Panel", "Flow Indicator (on/off) (as Gauge)")

-- Scorpion HMCS
A_10C:define3PosTumb("A102_HMCS_PW", 75, 3001, 550, "HMCS Panel", "Scorpion HMCS Power BAT/OFF/ON (A-10C II)")

A_10C:defineToggleSwitch("STICK_HIDE", 39, 3016, 999, "Misc", "Hide Stick toggle")

--ARC-210
A_10C:defineMultipositionSwitch("ARC210_MASTER", 55, 3043, 551, 7, 0.1, "ARC-210", "ARC-210 Master Switch")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:defineRotary("ARC210_CHN_KNB", 55, 3027, 552, "ARC-210", "ARC-210 Channel Selector Knob")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:defineMultipositionSwitch("ARC210_SEC_SW", 55, 3044, 553, 7, 0.1, "ARC-210", "ARC-210 Secondary Switch")
A_10C:conditionalize_last_export(is_arc_210_present)

A_10C:defineTumb("ARC210_100MHZ_SEL", 55, 3025, 554, 0.1, { 0, 0.3 }, nil, false, "ARC-210 Radio", "ARC-210 100MHz Selector")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:defineTumb("ARC210_10MHZ_SEL", 55, 3023, 555, 0.1, { 0, 0.9 }, nil, false, "ARC-210 Radio", "ARC-210 10MHz Selector")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:defineTumb("ARC210_1MHZ_SEL", 55, 3021, 556, 0.1, { 0, 0.9 }, nil, false, "ARC-210 Radio", "ARC-210 1MHz Selector")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:defineTumb("ARC210_100KHZ_SEL", 55, 3019, 557, 0.1, { 0, 0.9 }, nil, false, "ARC-210 Radio", "ARC-210 100KHz Selector")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:defineTumb("ARC210_25KHZ_SEL", 55, 3017, 558, 0.1, { 0, 0.3 }, { "00", "25", "50", "75" }, false, "ARC-210 Radio", "ARC-210 25KHz Selector")
A_10C:conditionalize_last_export(is_arc_210_present)

A_10C:definePushButton("ARC210_ENTER", 55, 3014, 573, "ARC-210", "ARC-210 Enter")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_OFF_FREQ", 55, 3013, 572, "ARC-210", "ARC-210 Offset Frequency")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_TRANS_REC_FUNC", 55, 3012, 571, "ARC-210", "ARC-210 Transmit / Receive Function Toggle")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_AMP_FREQ_MODUL", 55, 3011, 570, "ARC-210", "ARC-210 Amplitude / Frequency Modulation Select")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_MENU", 55, 3010, 569, "ARC-210", "ARC-210 Menu Pages")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_SQUELCH", 55, 3015, 568, "ARC-210", "ARC-210 Squelch ON/OFF")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_TRANS_REC_SEL", 55, 3004, 567, "ARC-210", "ARC-210 Select Receiver - Transmitter")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_GPS", 55, 3003, 566, "ARC-210", "ARC-210 GPS")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_TOD_REC", 55, 3002, 565, "ARC-210", "ARC-210 Time of Day Receive")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_TOD_SEND", 55, 3001, 564, "ARC-210", "ARC-210 Time of Day Send")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_FSK_UP", 55, 3005, 563, "ARC-210", "ARC-210 Upper FSK")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_FSK_MID", 55, 3006, 562, "ARC-210", "ARC-210 Middle FSK")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_FSK_LOW", 55, 3007, 561, "ARC-210", "ARC-210 Lower FSK")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_BRIGHT_INC", 55, 3008, 560, "ARC-210", "ARC-210 Brightness Increase")
A_10C:conditionalize_last_export(is_arc_210_present)
A_10C:definePushButton("ARC210_BRIGHT_DEC", 55, 3009, 559, "ARC-210", "ARC-210 Brightness Decrease")
A_10C:conditionalize_last_export(is_arc_210_present)

A_10C:defineIntegerFromGetter("ARC210_PRESENT", function(_)
	return arc_210_present and 1 or 0
end, 1, "ARC-210", "ARC-210 Present")
A_10C:defineString("ARC210_FREQUENCY", function()
	return Functions.pad_left(arc_210_data["freq_label_mhz"], 3) .. "." .. Functions.pad_right(arc_210_data["freq_label_khz"], 3)
end, 7, "ARC-210 Display", "ARC-210 Frequency (String)")

A_10C:defineBitFromDrawArgument("EXT_BOTTOM_LIGHT", 201, "External Aircraft Model", "Middle Bottom Light (white)")
A_10C:defineBitFromDrawArgument("EXT_TOP_LIGHT", 202, "External Aircraft Model", "Top Light (white)")
A_10C:defineBitFromDrawArgument("EXT_TAIL_LIGHT", 203, "External Aircraft Model", "Tail Light (white)")
A_10C:defineBitFromDrawArgument("EXT_L_RUDDER_LIGHT", 204, "External Aircraft Model", "Left Rudder Light (white)")
A_10C:defineBitFromDrawArgument("EXT_R_RUDDER_LIGHT", 205, "External Aircraft Model", "Right Rudder Light (white)")

A_10C:defineIntegerFromGetter("VHFAM_PRESENT", function(_)
	return is_vhf_am_present() and 1 or 0
end, 1, "VHF AM Radio", "VHF AM Present")

-- A_10C:defineReadWriteRadio("UHF", 54, 7, 3, 1000, "UHF radio frequency") -- disabled - 4xx.xxx should be Axx.xxx - how do we accomplish this?
-- A_10C:defineReadWriteRadio("VHF_AM", 55, 7, 3, 1000, "VHF AM radio frequency") -- disabled - last digit seems to sometimes be 1 greater (e.g. 124.001)
-- A_10C:defineReadWriteRadio("VHF_FM", 56, 7, 3, 1000, "VHF FM radio frequency") -- disabled - last digit seems to sometimes be 1 greater (e.g. 30.076)

return A_10C
