module("FA-18C_hornet", package.seeall)

local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class FA_18C_hornet: Module
local FA_18C_hornet = Module:new("FA-18C_hornet", 0x7400, { "FA-18C_hornet", "EA-18G", "FA-18E", "FA-18F" }) -- FA-18C + Mods

--v1.8 F/A-18 Module created by AndrewW, modified by WarLord,charliefoxtwo&DeadMeat

-- remove Arg# Pilot 540

--------------------------
-- todo: seems like position 1 doesn't work here, and the parking brake pull control doesn't work at all
--- Adds a specific control for the F/A-18C's parking brake
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param emergency_command integer the dcs command to set the parking brake to emergency mode
--- @param park_command integer the dcs command to set the parking brake to park
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function FA_18C_hornet:defineEmergencyParkingBrake(identifier, device_id, emergency_command, park_command, arg_number, category, description)
	local alloc = self:allocateInt(2)
	self:addExportHook(function(dev0)
		if dev0:get_argument_value(arg_number) < 0.64 then
			alloc:setValue(0)
		elseif dev0:get_argument_value(arg_number) > 0.66 then
			alloc:setValue(2)
		else
			alloc:setValue(1)
		end
	end)

	local control = Control:new(category, "emergency_parking_brake", identifier, description, {
		SetStateInput:new(2, "set the switch position -- 0 = emergency, 1 = park, 2 = release"),
	}, {
		IntegerOutput:new(alloc, "", "switch position -- 0 = emergency, 1 = parking, 2 = release"),
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		dev:performClickableAction(emergency_command, 0)
		dev:performClickableAction(park_command, 0)
		if toState == "0" then --Emerg
			dev:performClickableAction(emergency_command, -1)
		elseif toState == "1" then --release Park
			dev:performClickableAction(park_command, 1)
			dev:performClickableAction(park_command, 0)
		elseif toState == "2" then --Park
			dev:performClickableAction(park_command, 1)
		end
	end)
end
--------------------------
--- Adds a 3-position toggle switch specific to the F/A-18C mission computer switch
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param mc1_off_command integer the dcs command to move the switch down
--- @param mc2_off_command integer the dcs command to move the switch up
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function FA_18C_hornet:defineMissionComputerSwitch(identifier, device_id, mc1_off_command, mc2_off_command, arg_number, category, description)
	local alloc = self:allocateInt(2)
	self:addExportHook(function(dev0)
		local val = dev0:get_argument_value(arg_number)
		if val == -1 then
			alloc:setValue(0)
		elseif val == 0 then
			alloc:setValue(1)
		elseif val == 1 then
			alloc:setValue(2)
		end
	end)

	local control = Control:new(category, ControlType.mission_computer_switch, identifier, description, {
		SetStateInput:new(2, "set the switch position -- 0 = 1OFF, 1 = NORM, 2 = 2OFF"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "switch position -- 0 = 1OFF, 1 = NORM, 2 = 2OFF"),
	})

	self:addControl(control)

	-- todo: this seems to only partially work - attempting to set state from 2 to 0 results in the switch being in position 1 (same from 0 to 2)
	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		dev:performClickableAction(mc1_off_command, 0)
		dev:performClickableAction(mc2_off_command, 0)
		if toState == "0" then
			dev:performClickableAction(mc2_off_command, -1)
		elseif toState == "2" then
			dev:performClickableAction(mc1_off_command, 1)
		end
	end)
end

local comm_channel_map = {
	[" 1"] = 1,
	[" 2"] = 2,
	[" 3"] = 3,
	[" 4"] = 4,
	[" 5"] = 5,
	[" 6"] = 6,
	[" 7"] = 7,
	[" 8"] = 8,
	[" 9"] = 9,
	["`0"] = 10,
	["`1"] = 11,
	["`2"] = 12,
	["`3"] = 13,
	["`4"] = 14,
	["`5"] = 15,
	["`6"] = 16,
	["`7"] = 17,
	["`8"] = 18,
	["`9"] = 19,
	["~0"] = 20,
	["G"] = 21,
	["M"] = 22,
	["C"] = 23,
	["S"] = 24,
}

local function processUfcTwoDigitDisplay(s)
	s = Functions.coerce_nil_to_string(s)
	if s == "_" then
		s = "--"
	elseif s == "d" then -- receiving(?), show triangle symbol
		s = "<>"
	else
		s = s:gsub("^`", "1")
		s = s:gsub("^~", "2")
	end

	return Functions.pad_left(s, 2)
end

local ufc = {}

-- parse UFC
FA_18C_hornet:addExportHook(function()
	ufc = Module.parse_indication(6) or {}
end)

local comm_channel_cache = {}

local function get_comm_channel(channel)
	local display_value = channel == 1 and ufc.UFC_Comm1Display or ufc.UFC_Comm2Display

	if display_value == "d" then -- receiving(?), comm channel hasn't changed
		return comm_channel_cache[channel] or 0
	end

	local value = comm_channel_map[display_value] or 0
	comm_channel_cache[channel] = value

	return value
end

-- radio freqs: by Capt Zeen

FA_18C_hornet:defineIntegerFromGetter("COMM1_FREQ", function()
	return GetDevice(38):get_frequency() / 10000
end, 65535, "Comms frequency", "COMM1 FREQ")
FA_18C_hornet:defineIntegerFromGetter("COMM2_FREQ", function()
	return GetDevice(39):get_frequency() / 10000
end, 65535, "Comms frequency", "COMM2 FREQ")
FA_18C_hornet:defineIntegerFromGetter("COMM1_CHANNEL_NUMERIC", function()
	return get_comm_channel(1)
end, 24, "Comms frequency", "Comm 1 Channel as number")
FA_18C_hornet:reserveIntValue(2047) -- previous control reserved 65535, new control reserves 24
FA_18C_hornet:defineIntegerFromGetter("COMM2_CHANNEL_NUMERIC", function()
	return get_comm_channel(2)
end, 24, "Comms frequency", "Comm 2 Channel as number")
FA_18C_hornet:reserveIntValue(2047) -- previous control reserved 65535, new control reserves 24

---- INSTRUMENT PANEL
-- 1. Lock/Shoot Lights
FA_18C_hornet:defineIndicatorLight("LS_LOCK", 1, "Lock Shoot Lights", "LOCK (green)")
FA_18C_hornet:defineIndicatorLight("LS_SHOOT", 2, "Lock Shoot Lights", "SHOOT (green)")
FA_18C_hornet:defineIndicatorLight("LS_SHOOT_STROBE", 3, "Lock Shoot Lights", "SHOOT STROBE (green)")

-- 3. Angle of Attack Indexer Lights
FA_18C_hornet:defineIndicatorLight("AOA_INDEXER_HIGH", 4, "Angle of Attack Indexer Lights", "AOA Indexer High (green)")
FA_18C_hornet:defineIndicatorLight("AOA_INDEXER_NORMAL", 5, "Angle of Attack Indexer Lights", "AOA Indexer Normal (yellow)")
FA_18C_hornet:defineIndicatorLight("AOA_INDEXER_LOW", 6, "Angle of Attack Indexer Lights", "AOA Indexer Low (red)")

-- 4. Left Engine Fire Warning / Extinguisher Light
FA_18C_hornet:defineIndicatorLight("FIRE_LEFT_LT", 10, "Left Engine Fire Warning Extinguisher Light", "FIRE LEFT (red)")
FA_18C_hornet:definePushButton("LEFT_FIRE_BTN", 12, 3010, 11, "Left Engine Fire Warning Extinguisher Light", "Left Engine/AMAD Fire Warning/Extinguisher Light")
FA_18C_hornet:defineToggleSwitch("LEFT_FIRE_BTN_COVER", 12, 3012, 12, "Left Engine Fire Warning Extinguisher Light", "Left Engine/AMAD Fire Warning Cover")

-- 5. Master Caution Light
FA_18C_hornet:defineIndicatorLight("MASTER_CAUTION_LT", 13, "Master Caution Light", "MASTER CAUTION (yellow)")
FA_18C_hornet:defineToggleSwitch("MASTER_CAUTION_RESET_SW", 9, 3008, 14, "Master Caution Light", "MASTER CAUTION Reset Button - Press to reset")

-- 6. LH Advisory and Threat Warning Indicator Panel
FA_18C_hornet:defineIndicatorLight("LH_ADV_L_BLEED", 17, "LH Advisory Panel", "L BLEED (red)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_R_BLEED", 18, "LH Advisory Panel", "R BLEED (red)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_SPD_BRK", 19, "LH Advisory Panel", "SPD BRK (green)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_STBY", 20, "LH Advisory Panel", "STBY (green)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_L_BAR_RED", 21, "LH Advisory Panel", "L BAR (red)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_REC", 22, "LH Advisory Panel", "REC (green)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_L_BAR_GREEN", 23, "LH Advisory Panel", "L BAR (green)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_XMIT", 24, "LH Advisory Panel", "XMIT (green)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_ASPJ_OH", 25, "LH Advisory Panel", "ASPJ OH (yellow)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_GO", 15, "LH Advisory Panel", "GO (green)")
FA_18C_hornet:defineIndicatorLight("LH_ADV_NO_GO", 16, "LH Advisory Panel", "NO GO (yellow)")

-- 7. HUD Video Bit Panel
FA_18C_hornet:definePushButton("HUD_VIDEO_BIT", 0, 3107, 7, "HUD Video Bit Panel", "HUD Video BIT Initiate Pushbutton - Push to initiate BIT")

-- 8. RH Advisory and Threat Warning Indicator Panel
FA_18C_hornet:defineIndicatorLight("RH_ADV_RCDR_ON", 31, "RH Advisory Panel", "RCDR ON (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_DISP", 32, "RH Advisory Panel", "DISP (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_SAM", 38, "RH Advisory Panel", "SAM (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_AI", 39, "RH Advisory Panel", "AI (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_AAA", 40, "RH Advisory Panel", "AAA (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_CW", 41, "RH Advisory Panel", "CW (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_SPARE_RH1", 33, "RH Advisory Panel", "SPARE RH1 (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_SPARE_RH2", 34, "RH Advisory Panel", "SPARE RH2 (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_SPARE_RH3", 35, "RH Advisory Panel", "SPARE RH3 (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_SPARE_RH4", 36, "RH Advisory Panel", "SPARE RH4 (green)")
FA_18C_hornet:defineIndicatorLight("RH_ADV_SPARE_RH5", 37, "RH Advisory Panel", "SPARE RH5 (green)")

-- 9. APU Fire Warning / Extinguisher Light
FA_18C_hornet:defineIndicatorLight("FIRE_APU_LT", 29, "APU Fire Warning Extinguisher Light", "FIRE APU (red)")
FA_18C_hornet:definePushButton("APU_FIRE_BTN", 12, 3009, 30, "APU Fire Warning Extinguisher Light", "APU Fire Warning/Extinguisher Light")

-- 10. Right Engine Fire Warning / Extinguisher Light
FA_18C_hornet:defineIndicatorLight("FIRE_RIGHT_LT", 26, "Right Engine Fire Warning Extinguisher Light", "FIRE RIGHT (red)")
FA_18C_hornet:definePushButton("RIGHT_FIRE_BTN", 12, 3011, 27, "Right Engine Fire Warning Extinguisher Light", "Right Engine/AMAD Fire Warning/Extinguisher Light")
FA_18C_hornet:defineToggleSwitch("RIGHT_FIRE_BTN_COVER", 12, 3013, 28, "Right Engine Fire Warning Extinguisher Light", "Right Engine/AMAD Fire Warning Cover")

-- 11. Canopy Internal Jettison Handle
FA_18C_hornet:defineToggleSwitch("CANOPY_JETT_HANDLE_UNLOCK", 7, 3004, 43, "Canopy Internal Jettison Handle", "Canopy Jettison Handle Unlock Button - Press to unlock")
FA_18C_hornet:defineToggleSwitch("CANOPY_JETT_HANDLE_PULL", 7, 3003, 42, "Canopy Internal Jettison Handle", "Canopy Jettison Handle Unlock Button - Press to jettison")

-- 12. Master Arm Panel
FA_18C_hornet:defineIndicatorLight("MASTER_MODE_AA_LT", 47, "Master Arm Panel", "AA Light (green)")
FA_18C_hornet:defineIndicatorLight("MASTER_MODE_AG_LT", 48, "Master Arm Panel", "AG Light (green)")
FA_18C_hornet:definePushButton("MASTER_MODE_AA", 23, 3001, 458, "Master Arm Panel", "Master Mode Button, A/A")
FA_18C_hornet:definePushButton("MASTER_MODE_AG", 23, 3002, 459, "Master Arm Panel", "Master Mode Button, A/G")
FA_18C_hornet:defineToggleSwitch("MASTER_ARM_SW", 23, 3003, 49, "Master Arm Panel", "Master Arm Switch, ARM/SAFE")
FA_18C_hornet:defineIndicatorLight("MC_DISCH", 45, "Master Arm Panel", "DISCH Light (green)")
FA_18C_hornet:defineIndicatorLight("MC_READY", 44, "Master Arm Panel", "READY Light (yellow)")
FA_18C_hornet:definePushButton("FIRE_EXT_BTN", 12, 3008, 46, "Fire Systems", "Fire Extinguisher Pushbutton")

-- 13. Left DDI
FA_18C_hornet:defineTumb("LEFT_DDI_BRT_SELECT", 35, 3001, 51, 0.1, { 0, 0.2 }, nil, false, "Left DDI", "Brightness Selector Knob, OFF/NIGHT/DAY")
FA_18C_hornet:definePotentiometer("LEFT_DDI_BRT_CTL", 35, 3002, 52, { 0, 1 }, "Left DDI", "Brightness Control Knob")
FA_18C_hornet:definePotentiometer("LEFT_DDI_CONT_CTL", 35, 3003, 53, { 0, 1 }, "Left DDI", "Contrast Control Knob")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_01", 35, 3011, 54, "Left DDI", "Pushbutton 1")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_02", 35, 3012, 55, "Left DDI", "Pushbutton 2")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_03", 35, 3013, 56, "Left DDI", "Pushbutton 3")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_04", 35, 3014, 57, "Left DDI", "Pushbutton 4")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_05", 35, 3015, 58, "Left DDI", "Pushbutton 5")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_06", 35, 3016, 59, "Left DDI", "Pushbutton 6")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_07", 35, 3017, 60, "Left DDI", "Pushbutton 7")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_08", 35, 3018, 61, "Left DDI", "Pushbutton 8")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_09", 35, 3019, 62, "Left DDI", "Pushbutton 9")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_10", 35, 3020, 63, "Left DDI", "Pushbutton 10")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_11", 35, 3021, 64, "Left DDI", "Pushbutton 11")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_12", 35, 3022, 65, "Left DDI", "Pushbutton 12")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_13", 35, 3023, 66, "Left DDI", "Pushbutton 13")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_14", 35, 3024, 67, "Left DDI", "Pushbutton 14")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_15", 35, 3025, 68, "Left DDI", "Pushbutton 15")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_16", 35, 3026, 69, "Left DDI", "Pushbutton 16")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_17", 35, 3027, 70, "Left DDI", "Pushbutton 17")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_18", 35, 3028, 72, "Left DDI", "Pushbutton 18")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_19", 35, 3029, 73, "Left DDI", "Pushbutton 19")
FA_18C_hornet:definePushButton("LEFT_DDI_PB_20", 35, 3030, 75, "Left DDI", "Pushbutton 20")

-- 14. Up Front Controller (UFC)
FA_18C_hornet:definePushButton("UFC_AP", 25, 3001, 128, "Up Front Controller (UFC)", "Function Selector Pushbutton, A/P")
FA_18C_hornet:definePushButton("UFC_IFF", 25, 3002, 129, "Up Front Controller (UFC)", "Function Selector Pushbutton, IFF")
FA_18C_hornet:definePushButton("UFC_TCN", 25, 3003, 130, "Up Front Controller (UFC)", "Function Selector Pushbutton, TCN")
FA_18C_hornet:definePushButton("UFC_ILS", 25, 3004, 131, "Up Front Controller (UFC)", "Function Selector Pushbutton, ILS")
FA_18C_hornet:definePushButton("UFC_DL", 25, 3005, 132, "Up Front Controller (UFC)", "Function Selector Pushbutton, D/L")
FA_18C_hornet:definePushButton("UFC_BCN", 25, 3006, 133, "Up Front Controller (UFC)", "Function Selector Pushbutton, BCN")
FA_18C_hornet:definePushButton("UFC_ONOFF", 25, 3007, 134, "Up Front Controller (UFC)", "Function Selector Pushbutton, ON/OFF")
FA_18C_hornet:definePushButton("UFC_COMM1_PULL", 25, 3008, 125, "Up Front Controller (UFC)", "COMM 1 Channel Selector Knob Pull")
FA_18C_hornet:definePushButton("UFC_COMM2_PULL", 25, 3009, 127, "Up Front Controller (UFC)", "COMM 2 Channel Selector Knob Pull")
FA_18C_hornet:definePushButton("UFC_OS1", 25, 3010, 100, "Up Front Controller (UFC)", "Option Select Pushbutton 1")
FA_18C_hornet:definePushButton("UFC_OS2", 25, 3011, 101, "Up Front Controller (UFC)", "Option Select Pushbutton 2")
FA_18C_hornet:definePushButton("UFC_OS3", 25, 3012, 102, "Up Front Controller (UFC)", "Option Select Pushbutton 3")
FA_18C_hornet:definePushButton("UFC_OS4", 25, 3013, 103, "Up Front Controller (UFC)", "Option Select Pushbutton 4")
FA_18C_hornet:definePushButton("UFC_OS5", 25, 3014, 106, "Up Front Controller (UFC)", "Option Select Pushbutton 5")
FA_18C_hornet:definePushButton("UFC_IP", 25, 3015, 99, "Up Front Controller (UFC)", "I/P Pushbutton")
FA_18C_hornet:define3PosTumb("UFC_ADF", 25, 3016, 107, "Up Front Controller (UFC)", "ADF Function Select Switch, 1/OFF/2")
FA_18C_hornet:definePushButton("UFC_EMCON", 25, 3017, 110, "Up Front Controller (UFC)", "Emission Control Pushbutton")
FA_18C_hornet:definePushButton("UFC_0", 25, 3018, 120, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 0")
FA_18C_hornet:definePushButton("UFC_1", 25, 3019, 111, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 1")
FA_18C_hornet:definePushButton("UFC_2", 25, 3020, 112, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 2")
FA_18C_hornet:definePushButton("UFC_3", 25, 3021, 113, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 3")
FA_18C_hornet:definePushButton("UFC_4", 25, 3022, 114, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 4")
FA_18C_hornet:definePushButton("UFC_5", 25, 3023, 115, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 5")
FA_18C_hornet:definePushButton("UFC_6", 25, 3024, 116, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 6")
FA_18C_hornet:definePushButton("UFC_7", 25, 3025, 117, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 7")
FA_18C_hornet:definePushButton("UFC_8", 25, 3026, 118, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 8")
FA_18C_hornet:definePushButton("UFC_9", 25, 3027, 119, "Up Front Controller (UFC)", "UFC Keyboard Pushbutton, 9")
FA_18C_hornet:definePushButton("UFC_CLR", 25, 3028, 121, "Up Front Controller (UFC)", "Keyboard Pushbutton, CLR")
FA_18C_hornet:definePushButton("UFC_ENT", 25, 3029, 122, "Up Front Controller (UFC)", "Keyboard Pushbutton, ENT")
FA_18C_hornet:definePotentiometer("UFC_COMM1_VOL", 25, 3030, 108, { 0, 1 }, "Up Front Controller (UFC)", "COMM 1 Volume Control Knob")
FA_18C_hornet:definePotentiometer("UFC_COMM2_VOL", 25, 3031, 123, { 0, 1 }, "Up Front Controller (UFC)", "COMM 2 Volume Control Knob")
FA_18C_hornet:definePotentiometer("UFC_BRT", 25, 3032, 109, { 0, 1 }, "Up Front Controller (UFC)", "Brightness Control Knob")

FA_18C_hornet:reserveIntValue(65535) -- previous duplicate UFC_COMM1_CHANNEL_SELECT
FA_18C_hornet:reserveIntValue(65535) -- previous duplicate UFC_COMM2_CHANNEL_SELECT
FA_18C_hornet:defineFixedStepInput("UFC_COMM1_CHANNEL_SELECT", 25, 3033, { -0.03, 0.03 }, "Up Front Controller (UFC)", "COMM 1 Channel Select Knob")
FA_18C_hornet:defineFixedStepInput("UFC_COMM2_CHANNEL_SELECT", 25, 3034, { -0.03, 0.03 }, "Up Front Controller (UFC)", "COMM 2 Channel Select Knob")

FA_18C_hornet:defineString("UFC_COMM1_DISPLAY", function()
	return processUfcTwoDigitDisplay(ufc.UFC_Comm1Display)
end, 2, "Up Front Controller (UFC)", "Comm 1 Display")
FA_18C_hornet:defineString("UFC_COMM2_DISPLAY", function()
	return processUfcTwoDigitDisplay(ufc.UFC_Comm2Display)
end, 2, "Up Front Controller (UFC)", "Comm 2 Display")
FA_18C_hornet:defineString("UFC_OPTION_CUEING_1", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionCueing1)
end, 1, "Up Front Controller (UFC)", "Option Cueing 1")
FA_18C_hornet:defineString("UFC_OPTION_CUEING_2", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionCueing2)
end, 1, "Up Front Controller (UFC)", "Option Cueing 2")
FA_18C_hornet:defineString("UFC_OPTION_CUEING_3", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionCueing3)
end, 1, "Up Front Controller (UFC)", "Option Cueing 3")
FA_18C_hornet:defineString("UFC_OPTION_CUEING_4", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionCueing4)
end, 1, "Up Front Controller (UFC)", "Option Cueing 4")
FA_18C_hornet:defineString("UFC_OPTION_CUEING_5", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionCueing5)
end, 1, "Up Front Controller (UFC)", "Option Cueing 5")
FA_18C_hornet:defineString("UFC_OPTION_DISPLAY_1", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionDisplay1)
end, 4, "Up Front Controller (UFC)", "Option Display 1")
FA_18C_hornet:defineString("UFC_OPTION_DISPLAY_2", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionDisplay2)
end, 4, "Up Front Controller (UFC)", "Option Display 2")
FA_18C_hornet:defineString("UFC_OPTION_DISPLAY_3", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionDisplay3)
end, 4, "Up Front Controller (UFC)", "Option Display 3")
FA_18C_hornet:defineString("UFC_OPTION_DISPLAY_4", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionDisplay4)
end, 4, "Up Front Controller (UFC)", "Option Display 4")
FA_18C_hornet:defineString("UFC_OPTION_DISPLAY_5", function()
	return Functions.coerce_nil_to_string(ufc.UFC_OptionDisplay5)
end, 4, "Up Front Controller (UFC)", "Option Display 5")
FA_18C_hornet:defineString("UFC_SCRATCHPAD_NUMBER_DISPLAY", function()
	return Functions.pad_left(ufc.UFC_ScratchPadNumberDisplay, 8)
end, 8, "Up Front Controller (UFC)", "Scratchpad Number Display")
FA_18C_hornet:defineString("UFC_SCRATCHPAD_STRING_1_DISPLAY", function()
	return processUfcTwoDigitDisplay(ufc.UFC_ScratchPadString1Display)
end, 2, "Up Front Controller (UFC)", "Scratchpad String 1 Display")
FA_18C_hornet:defineString("UFC_SCRATCHPAD_STRING_2_DISPLAY", function()
	return processUfcTwoDigitDisplay(ufc.UFC_ScratchPadString2Display)
end, 2, "Up Front Controller (UFC)", "Scratchpad String 2 Display")

-- 15. Right DDI
FA_18C_hornet:defineTumb("RIGHT_DDI_BRT_SELECT", 36, 3001, 76, 0.1, { 0, 0.2 }, nil, false, "Right DDI", "Brightness Selector Knob, OFF/NIGHT/DAY")
FA_18C_hornet:definePotentiometer("RIGHT_DDI_BRT_CTL", 36, 3002, 77, { 0, 1 }, "Right DDI", "Brightness Control Knob")
FA_18C_hornet:definePotentiometer("RIGHT_DDI_CONT_CTL", 36, 3003, 78, { 0, 1 }, "Right DDI", "Contrast Control Knob")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_01", 36, 3011, 79, "Right DDI", "Pushbutton 1")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_02", 36, 3012, 80, "Right DDI", "Pushbutton 2")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_03", 36, 3013, 81, "Right DDI", "Pushbutton 3")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_04", 36, 3014, 82, "Right DDI", "Pushbutton 4")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_05", 36, 3015, 83, "Right DDI", "Pushbutton 5")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_06", 36, 3016, 84, "Right DDI", "Pushbutton 6")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_07", 36, 3017, 85, "Right DDI", "Pushbutton 7")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_08", 36, 3018, 86, "Right DDI", "Pushbutton 8")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_09", 36, 3019, 87, "Right DDI", "Pushbutton 9")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_10", 36, 3020, 88, "Right DDI", "Pushbutton 10")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_11", 36, 3021, 89, "Right DDI", "Pushbutton 11")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_12", 36, 3022, 90, "Right DDI", "Pushbutton 12")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_13", 36, 3023, 91, "Right DDI", "Pushbutton 13")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_14", 36, 3024, 92, "Right DDI", "Pushbutton 14")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_15", 36, 3025, 93, "Right DDI", "Pushbutton 15")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_16", 36, 3026, 94, "Right DDI", "Pushbutton 16")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_17", 36, 3027, 95, "Right DDI", "Pushbutton 17")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_18", 36, 3028, 96, "Right DDI", "Pushbutton 18")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_19", 36, 3029, 97, "Right DDI", "Pushbutton 19")
FA_18C_hornet:definePushButton("RIGHT_DDI_PB_20", 36, 3030, 98, "Right DDI", "Pushbutton 20")

-- 16. Map Gain/Spin Recovery Panel
FA_18C_hornet:defineIndicatorLight("SPIN_LT", 137, "Map Gain/Spin Recovery Panel", "Spin Light (yellow)")
FA_18C_hornet:defineToggleSwitch("SPIN_RECOVERY_COVER", 2, 3008, 139, "Map Gain/Spin Recovery Panel", "Spin Recovery Switch Cover, OPEN/CLOSE")
FA_18C_hornet:defineToggleSwitch("SPIN_RECOVERY_SW", 2, 3009, 138, "Map Gain/Spin Recovery Panel", "Spin Recovery Switch, RCVY/NORM")
FA_18C_hornet:definePotentiometer("HMD_OFF_BRT", 58, 3001, 136, { 0, 0.75 }, "Map Gain/Spin Recovery Panel", "HMD OFF/BRT Knob")
FA_18C_hornet:defineTumb("IR_COOL_SW", 23, 3013, 135, 0.1, { 0, 0.2 }, nil, false, "Map Gain/Spin Recovery Panel", "IR Cooling Switch, ORIDE/NORM/OFF")

-- 17. Emergency Jettison Button
FA_18C_hornet:definePushButton("EMER_JETT_BTN", 23, 3004, 50, "Emergency Jettison Button", "Emergency Jettison Button")

-- 18. HUD Control Panel
FA_18C_hornet:defineTumb("HUD_SYM_REJ_SW", 34, 3001, 140, 0.1, { 0, 0.2 }, nil, false, "HUD Control Panel", "HUD Symbology Reject Switch, NORM/REJ 1/REJ 2")
FA_18C_hornet:definePotentiometer("HUD_SYM_BRT", 34, 3002, 141, { 0, 1 }, "HUD Control Panel", "HUD Symbology Brightness Control Knob")
FA_18C_hornet:defineToggleSwitch("HUD_SYM_BRT_SELECT", 34, 3003, 142, "HUD Control Panel", "HUD Symbology Brightness Selector Knob, DAY/NIGHT")
FA_18C_hornet:definePotentiometer("HUD_BLACK_LVL", 34, 3004, 143, { 0, 1 }, "HUD Control Panel", "Black Level Control Knob")
FA_18C_hornet:defineTumb("HUD_VIDEO_CONTROL_SW", 34, 3005, 144, 0.1, { 0, 0.2 }, nil, false, "HUD Control Panel", "HUD Video Control Switch, W/B /VID/OFF")
FA_18C_hornet:definePotentiometer("HUD_BALANCE", 34, 3006, 145, { 0, 1 }, "HUD Control Panel", "Balance Control Knob")
FA_18C_hornet:definePotentiometer("HUD_AOA_INDEXER", 34, 3007, 146, { 0, 1 }, "HUD Control Panel", "AOA Indexer Control Knob")
FA_18C_hornet:defineToggleSwitch("HUD_ALT_SW", 34, 3008, 147, "HUD Control Panel", "Altitude Switch, BARO/RDR")
FA_18C_hornet:define3PosTumb("HUD_ATT_SW", 34, 3009, 148, "HUD Control Panel", "Attitude Selector Switch, INS/AUTO/STBY")

-- 19. Standby Magnetic Compass
FA_18C_hornet:defineFloat("SBY_COMPASS_HDG", 149, { 0, 1 }, "Standby Compass", "Standby Compass Heading")
FA_18C_hornet:defineFloat("SBY_COMPASS_PITCH", 150, { -1, 1 }, "Standby Compass", "Standby Compass Pitch")
FA_18C_hornet:defineFloat("SBY_COMPASS_BANK", 151, { -1, 1 }, "Standby Compass", "Standby Compass Bank")

-- 20. Station Jettison Select
FA_18C_hornet:definePushButton("SJ_CTR", 23, 3005, 153, "Station Jettison Select", "Station Jettison Select Button, CENTER")
FA_18C_hornet:definePushButton("SJ_LI", 23, 3006, 155, "Station Jettison Select", "Station Jettison Select Button, LEFT IN")
FA_18C_hornet:definePushButton("SJ_LO", 23, 3007, 157, "Station Jettison Select", "Station Jettison Select Button, LEFT OUT")
FA_18C_hornet:definePushButton("SJ_RI", 23, 3008, 159, "Station Jettison Select", "Station Jettison Select Button, RIGHT IN")
FA_18C_hornet:definePushButton("SJ_RO", 23, 3009, 161, "Station Jettison Select", "Station Jettison Select Button, RIGHT OUT")
FA_18C_hornet:defineIndicatorLight("SJ_CTR_LT", 152, "Station Jettison Select", "CTR Light (green)")
FA_18C_hornet:defineIndicatorLight("SJ_LI_LT", 154, "Station Jettison Select", "LI Light (green)")
FA_18C_hornet:defineIndicatorLight("SJ_LO_LT", 156, "Station Jettison Select", "LO Light (green)")
FA_18C_hornet:defineIndicatorLight("SJ_RI_LT", 158, "Station Jettison Select", "RI Light (green)")
FA_18C_hornet:defineIndicatorLight("SJ_RO_LT", 160, "Station Jettison Select", "RO Light (green)")

-- 21. Flaps, Landing Gear and Stores Indicator Panel
FA_18C_hornet:defineIndicatorLight("FLP_LG_NOSE_GEAR_LT", 166, "Flaps, Landing Gear, Stores Indicator Panel", "NOSE GEAR (green)")
FA_18C_hornet:defineIndicatorLight("FLP_LG_LEFT_GEAR_LT", 165, "Flaps, Landing Gear, Stores Indicator Panel", "LEFT GEAR (green)")
FA_18C_hornet:defineIndicatorLight("FLP_LG_RIGHT_GEAR_LT", 167, "Flaps, Landing Gear, Stores Indicator Panel", "RIGHT GEAR (green)")
FA_18C_hornet:defineIndicatorLight("FLP_LG_HALF_FLAPS_LT", 163, "Flaps, Landing Gear, Stores Indicator Panel", "HALF FLAPS (green)")
FA_18C_hornet:defineIndicatorLight("FLP_LG_FULL_FLAPS_LT", 164, "Flaps, Landing Gear, Stores Indicator Panel", "FULL FLAPS (green)")
FA_18C_hornet:defineIndicatorLight("FLP_LG_FLAPS_LT", 162, "Flaps, Landing Gear, Stores Indicator Panel", "FLAPS (yellow)")

-- 22. Integrated Fuel/Engine Indicator (IFEI)
FA_18C_hornet:definePushButton("IFEI_MODE_BTN", 33, 3001, 168, "Integrated Fuel/Engine Indicator (IFEI)", "Mode Button")
FA_18C_hornet:definePushButton("IFEI_QTY_BTN", 33, 3002, 169, "Integrated Fuel/Engine Indicator (IFEI)", "QTY Button")
FA_18C_hornet:definePushButton("IFEI_UP_BTN", 33, 3003, 170, "Integrated Fuel/Engine Indicator (IFEI)", "Up Arrow Button")
FA_18C_hornet:definePushButton("IFEI_DWN_BTN", 33, 3004, 171, "Integrated Fuel/Engine Indicator (IFEI)", "Down Arrow Button")
FA_18C_hornet:definePushButton("IFEI_ZONE_BTN", 33, 3005, 172, "Integrated Fuel/Engine Indicator (IFEI)", "ZONE Button")
FA_18C_hornet:definePushButton("IFEI_ET_BTN", 33, 3006, 173, "Integrated Fuel/Engine Indicator (IFEI)", "ET Button")

local ifei = {}

FA_18C_hornet:addExportHook(function()
	ifei = Module.parse_indication(5) or {}
end)

FA_18C_hornet:defineString("IFEI_BINGO", function()
	return Functions.pad_left(ifei.txt_BINGO, 5)
end, 5, "Integrated Fuel/Engine Indicator (IFEI)", "BINGO")
FA_18C_hornet:defineString("IFEI_CLOCK_H", function()
	return Functions.pad_left(ifei.txt_CLOCK_H, 2)
end, 2, "Integrated Fuel/Engine Indicator (IFEI)", "CLOCK_H")
FA_18C_hornet:defineString("IFEI_CLOCK_M", function()
	return Functions.pad_left(ifei.txt_CLOCK_M, 2)
end, 2, "Integrated Fuel/Engine Indicator (IFEI)", "CLOCK_M")
FA_18C_hornet:defineString("IFEI_CLOCK_S", function()
	return Functions.pad_left(ifei.txt_CLOCK_S, 2)
end, 2, "Integrated Fuel/Engine Indicator (IFEI)", "CLOCK_S")
FA_18C_hornet:defineString("IFEI_TIMER_H", function()
	return Functions.pad_left(ifei.txt_TIMER_H, 2)
end, 2, "Integrated Fuel/Engine Indicator (IFEI)", "TIMER_H")
FA_18C_hornet:defineString("IFEI_TIMER_M", function()
	return Functions.pad_left(ifei.txt_TIMER_M, 2)
end, 2, "Integrated Fuel/Engine Indicator (IFEI)", "TIMER_M")
FA_18C_hornet:defineString("IFEI_TIMER_S", function()
	return Functions.pad_left(ifei.txt_TIMER_S, 2)
end, 2, "Integrated Fuel/Engine Indicator (IFEI)", "TIMER_S")
FA_18C_hornet:defineString("IFEI_DD_1", function()
	return Functions.pad_left(ifei.txt_DD_1, 1)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "DD_1")
FA_18C_hornet:defineString("IFEI_DD_2", function()
	return Functions.pad_left(ifei.txt_DD_2, 1)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "DD_2")
FA_18C_hornet:defineString("IFEI_DD_3", function()
	return Functions.pad_left(ifei.txt_DD_3, 1)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "DD_3")
FA_18C_hornet:defineString("IFEI_DD_4", function()
	return Functions.pad_left(ifei.txt_DD_4, 1)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "DD_4")
FA_18C_hornet:defineString("IFEI_FF_L", function()
	return Functions.pad_left(ifei.txt_FF_L, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "FF_L")
FA_18C_hornet:defineString("IFEI_FF_R", function()
	return Functions.pad_left(ifei.txt_FF_R, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "FF_R")
FA_18C_hornet:defineString("IFEI_FUEL_DOWN", function()
	return Functions.pad_left(ifei.txt_FUEL_DOWN, 6)
end, 6, "Integrated Fuel/Engine Indicator (IFEI)", "FUEL_DOWN")
FA_18C_hornet:defineString("IFEI_FUEL_UP", function()
	return Functions.pad_left(ifei.txt_FUEL_UP, 6)
end, 6, "Integrated Fuel/Engine Indicator (IFEI)", "FUEL_UP")
FA_18C_hornet:defineString("IFEI_OIL_PRESS_L", function()
	return Functions.pad_left(ifei.txt_OilPress_L, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "OilPress_L")
FA_18C_hornet:defineString("IFEI_OIL_PRESS_R", function()
	return Functions.pad_left(ifei.txt_OilPress_R, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "OilPress_R")
FA_18C_hornet:defineString("IFEI_RPM_L", function()
	return Functions.pad_left(ifei.txt_RPM_L, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "RPM_L")
FA_18C_hornet:defineString("IFEI_RPM_R", function()
	return Functions.pad_left(ifei.txt_RPM_R, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "RPM_R")
FA_18C_hornet:defineString("IFEI_TEMP_L", function()
	return Functions.pad_left(ifei.txt_TEMP_L, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "TEMP_L")
FA_18C_hornet:defineString("IFEI_TEMP_R", function()
	return Functions.pad_left(ifei.txt_TEMP_R, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "TEMP_R")
FA_18C_hornet:defineString("IFEI_CODES", function()
	return Functions.pad_left(ifei.txt_Codes, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "Codes")
FA_18C_hornet:defineString("IFEI_SP", function()
	return Functions.pad_left(ifei.txt_SP, 3)
end, 3, "Integrated Fuel/Engine Indicator (IFEI)", "SP")
FA_18C_hornet:defineString("IFEI_TIME_SET_MODE", function()
	return Functions.pad_left(ifei.txt_TimeSetMode, 6)
end, 6, "Integrated Fuel/Engine Indicator (IFEI)", "Time Set Mode")
FA_18C_hornet:defineString("IFEI_RPM_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.RPMTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "RPM Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_TEMP_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.TempTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Temp Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_FF_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.FFTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "FF Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_NOZ_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.NOZTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "NOZZLE Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_OIL_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.OILTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "OIL Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_BINGO_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.BINGOTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "BINGO Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_LSCALE_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.LScaleTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Left Scale Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_RSCALE_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.RScaleTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Right Scale Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_L0_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.L0Texture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Left 0 Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_R0_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.R0Texture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Right 0 Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_L50_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.L50Texture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Left 50 Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_R50_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.R50Texture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Right 50 Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_L100_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.L100Texture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Left 100 Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_R100_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.R100Texture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Right 100 Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_LPOINTER_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.LPointerTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Left Pointer Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_RPOINTER_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.RPointerTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Right Pointer Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_Z_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.ZTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Zulu Texture Visible: 1 = yes, 0 = no")

-- 23. HUD Video Record Panel
FA_18C_hornet:definePotentiometer("IFEI", 33, 3007, 174, { 0, 1 }, "HUD Video Record Panel", "Brightness Control Knob")
FA_18C_hornet:define3PosTumb("SELECT_HMD_LDDI_RDDI", 0, 3104, 175, "HUD Video Record Panel", "Selector Switch, HMD/LDDI/RDDI")
FA_18C_hornet:define3PosTumb("SELECT_HUD_LDDI_RDDI", 0, 3105, 176, "HUD Video Record Panel", "Selector Switch, HUD/LDIR/RDDI")
FA_18C_hornet:define3PosTumb("MODE_SELECTOR_SW", 0, 3106, 314, "HUD Video Record Panel", "Mode Selector Switch, MAN/OFF/AUTO")

-- 24. AMPCD
FA_18C_hornet:definePotentiometer("AMPCD_BRT_CTL", 37, 3001, 203, { 0, 1 }, "AMPCD", "Brightness Control Knob")
FA_18C_hornet:define3PosTumb("AMPCD_NIGHT_DAY", 37, 3002, 177, "AMPCD", "Night/Day Brightness Selector")
FA_18C_hornet:define3PosTumb("AMPCD_SYM_SW", 37, 3004, 179, "AMPCD", "Symbology Control Switch")
FA_18C_hornet:define3PosTumb("AMPCD_CONT_SW", 37, 3006, 182, "AMPCD", "Contrast Control Switch")
FA_18C_hornet:define3PosTumb("AMPCD_GAIN_SW", 37, 3008, 180, "AMPCD", "Gain Control Switch")
FA_18C_hornet:definePushButton("AMPCD_PB_01", 37, 3011, 183, "AMPCD", "Pushbutton 1")
FA_18C_hornet:definePushButton("AMPCD_PB_02", 37, 3012, 184, "AMPCD", "Pushbutton 2")
FA_18C_hornet:definePushButton("AMPCD_PB_03", 37, 3013, 185, "AMPCD", "Pushbutton 3")
FA_18C_hornet:definePushButton("AMPCD_PB_04", 37, 3014, 186, "AMPCD", "Pushbutton 4")
FA_18C_hornet:definePushButton("AMPCD_PB_05", 37, 3015, 187, "AMPCD", "Pushbutton 5")
FA_18C_hornet:definePushButton("AMPCD_PB_06", 37, 3016, 188, "AMPCD", "Pushbutton 6")
FA_18C_hornet:definePushButton("AMPCD_PB_07", 37, 3017, 189, "AMPCD", "Pushbutton 7")
FA_18C_hornet:definePushButton("AMPCD_PB_08", 37, 3018, 190, "AMPCD", "Pushbutton 8")
FA_18C_hornet:definePushButton("AMPCD_PB_09", 37, 3019, 191, "AMPCD", "Pushbutton 9")
FA_18C_hornet:definePushButton("AMPCD_PB_10", 37, 3020, 192, "AMPCD", "Pushbutton 10")
FA_18C_hornet:definePushButton("AMPCD_PB_11", 37, 3021, 193, "AMPCD", "Pushbutton 11")
FA_18C_hornet:definePushButton("AMPCD_PB_12", 37, 3022, 194, "AMPCD", "Pushbutton 12")
FA_18C_hornet:definePushButton("AMPCD_PB_13", 37, 3023, 195, "AMPCD", "Pushbutton 13")
FA_18C_hornet:definePushButton("AMPCD_PB_14", 37, 3024, 196, "AMPCD", "Pushbutton 14")
FA_18C_hornet:definePushButton("AMPCD_PB_15", 37, 3025, 197, "AMPCD", "Pushbutton 15")
FA_18C_hornet:definePushButton("AMPCD_PB_16", 37, 3026, 198, "AMPCD", "Pushbutton 16")
FA_18C_hornet:definePushButton("AMPCD_PB_17", 37, 3027, 199, "AMPCD", "Pushbutton 17")
FA_18C_hornet:definePushButton("AMPCD_PB_18", 37, 3028, 200, "AMPCD", "Pushbutton 18")
FA_18C_hornet:definePushButton("AMPCD_PB_19", 37, 3029, 201, "AMPCD", "Pushbutton 19")
FA_18C_hornet:definePushButton("AMPCD_PB_20", 37, 3030, 202, "AMPCD", "Pushbutton 20")

-- 25. Standby Attitude Reference Indicator
FA_18C_hornet:definePushButton("SAI_TEST_BTN", 32, 3001, 215, "Standby Attitude Reference Indicator", "SAI Test Button")
FA_18C_hornet:definePushButton("SAI_CAGE", 32, 3002, 213, "Standby Attitude Reference Indicator", "SAI Pull to uncage")
FA_18C_hornet:defineRotary("SAI_SET", 32, 3003, 214, "Standby Attitude Reference Indicator", "SAI Adjust Attitude")
FA_18C_hornet:defineFloat("SAI_PITCH", 205, { -1, 1 }, "Standby Attitude Reference Indicator", "SAI Pitch")
FA_18C_hornet:defineFloat("SAI_BANK", 206, { -1, 1 }, "Standby Attitude Reference Indicator", "SAI Bank")
FA_18C_hornet:defineFloat("SAI_ATT_WARNING_FLAG", 209, { 0, 1 }, "Standby Attitude Reference Indicator", "SAI Attitude Warning Flag")
FA_18C_hornet:defineFloat("SAI_MAN_PITCH_ADJ", 210, { -1, 1 }, "Standby Attitude Reference Indicator", "SAI Manual Pitch Adjustment")
FA_18C_hornet:defineFloat("SAI_SLIP_BALL", 207, { -1, 1 }, "Standby Attitude Reference Indicator", "SAI Slip Ball")
FA_18C_hornet:defineFloat("SAI_RATE_OF_TURN", 208, { -1, 1 }, "Standby Attitude Reference Indicator", "SAI Rate Of Turn")

-- 27. Standby Airspeed Indicator
FA_18C_hornet:defineFloat("STBY_ASI_AIRSPEED", 217, { 0, 1 }, "Standby Airspeed Indicator", "Airspeed")

-- 28. Standby Altimeter
FA_18C_hornet:defineRotary("STBY_PRESS_ALT", 26, 3001, 224, "Standby Altimeter", "Pressure Setting Knob")
FA_18C_hornet:defineFloat("STBY_ALT_100_FT_PTR", 218, { 0, 1 }, "Standby Altimeter", "100 ft pointer")
FA_18C_hornet:defineFloat("STBY_ALT_10000_FT_CNT", 220, { 0, 1 }, "Standby Altimeter", "10000 ft count")
FA_18C_hornet:defineFloat("STBY_ALT_1000_FT_CNT", 219, { 0, 1 }, "Standby Altimeter", "1000 ft count")
FA_18C_hornet:defineFloat("STBY_PRESS_SET_0", 221, { 0, 1 }, "Standby Altimeter", "Pressure Setting 1")
FA_18C_hornet:defineFloat("STBY_PRESS_SET_1", 222, { 0, 1 }, "Standby Altimeter", "Pressure Setting 2")
FA_18C_hornet:defineFloat("STBY_PRESS_SET_2", 223, { 0, 1 }, "Standby Altimeter", "Pressure Setting 3")

-- 29. Standby Rate of Climb Indicator
FA_18C_hornet:defineFloat("VSI", 225, { -1, 1 }, "Standby Rate of Climb Indicator", "Vertical Speed")

-- 30. Environment Control Louver
FA_18C_hornet:definePotentiometer("LEFT_LOUVER", 11, 3010, 505, { 0, 1 }, "Environment Control Louver", "Left Louver")
FA_18C_hornet:definePotentiometer("RIGHT_LOUVER", 11, 3011, 506, { 0, 1 }, "Environment Control Louver", "Right Louver")

-- 31. Landing Gear Handle and Warning Tone Silence
FA_18C_hornet:defineIndicatorLight("LANDING_GEAR_HANDLE_LT", 227, "Landing Gear Handle and Warning Tone Silence", "Landing Gear Handle Light")
FA_18C_hornet:defineToggleSwitch("GEAR_LEVER", 5, 3001, 226, "Landing Gear Handle and Warning Tone Silence", "Gear Lever")
FA_18C_hornet:defineToggleSwitch("EMERGENCY_GEAR_ROTATE", 5, 3002, 228, "Landing Gear Handle and Warning Tone Silence", "Emergency Gear Rotate")
FA_18C_hornet:definePushButton("GEAR_DOWNLOCK_OVERRIDE_BTN", 5, 3003, 229, "Landing Gear Handle and Warning Tone Silence", "Landing Gear Override")
FA_18C_hornet:definePushButton("GEAR_SILENCE_BTN", 40, 3018, 230, "Landing Gear Handle and Warning Tone Silence", "Warning Tone Silence Button - Push to silence")

-- 32. Select Jettison Button
FA_18C_hornet:definePushButton("SEL_JETT_BTN", 23, 3010, 235, "Select Jettison Button", "Selective Jettison Pushbutton")
FA_18C_hornet:defineTumb("SEL_JETT_KNOB", 23, 3011, 236, 0.1, { -0.1, 0.3 }, nil, false, "Select Jettison Button", "Selective Jettison Knob, L FUS MSL/SAFE/R FUS MSL/ RACK/LCHR /STORES")
FA_18C_hornet:defineToggleSwitch("ANTI_SKID_SW", 5, 3004, 238, "Select Jettison Button", "Anti Skid")
FA_18C_hornet:defineToggleSwitchToggleOnly("LAUNCH_BAR_SW", 5, 3008, 233, "Select Jettison Button", "Launch Bar")
FA_18C_hornet:defineToggleSwitchToggleOnly("HOOK_BYPASS_SW", 9, 3009, 239, "Select Jettison Button", "HOOK BYPASS Switch, FIELD/CARRIER")
FA_18C_hornet:define3PosTumb("FLAP_SW", 2, 3007, 234, "Select Jettison Button", "FLAP Switch, AUTO/HALF/FULL")
FA_18C_hornet:defineToggleSwitch("LDG_TAXI_SW", 8, 3004, 237, "Select Jettison Button", "LDG/TAXI LIGHT Switch")
FA_18C_hornet:defineFloat("HYD_IND_BRAKE", 242, { 0, 1 }, "Select Jettison Button", "HYD Indicator Brake")

-- 34. Emergency and Parking Brake Handle
FA_18C_hornet:defineToggleSwitch("EMERGENCY_PARKING_BRAKE_PULL", 5, 3005, 240, "Emergency and Parking Brake Handle", "Emergency/Parking Brake Pull")
FA_18C_hornet:defineEmergencyParkingBrake("EMERGENCY_PARKING_BRAKE_ROTATE", 5, 3007, 3006, 241, "Emergency and Parking Brake Handle", "Emergency/Parking Brake Rotate")

-- 35. Dispenser/EMC Panel
FA_18C_hornet:defineTumb("CMSD_DISPENSE_SW", 54, 3001, 517, 0.1, { 0, 0.2 }, nil, false, "Dispenser/EMC Panel", "DISPENSER Switch, BYPASS/ON/OFF")
FA_18C_hornet:definePushButton("CMSD_JET_SEL_BTN", 54, 3003, 515, "Dispenser/EMC Panel", "ECM JETT JETT SEL Button - Push to jettison")
FA_18C_hornet:defineTumb("ECM_MODE_SW", 66, 3001, 248, 0.1, { 0, 0.4 }, nil, false, "Dispenser/EMC Panel", "ECM Mode Switch, XMIT/REC/BIT/STBY/OFF")
FA_18C_hornet:defineToggleSwitch("AUX_REL_SW", 23, 3012, 258, "Dispenser/EMC Panel", "Auxiliary Release Switch, ENABLE/NORM")

-- 36. RWR Control Indicator
FA_18C_hornet:definePushButton("RWR_POWER_BTN", 53, 3001, 277, "RWR Control Indicator", "ALR-67 POWER Pushbutton")
FA_18C_hornet:definePushButton("RWR_DISPLAY_BTN", 53, 3002, 275, "RWR Control Indicator", "ALR-67 DISPLAY Pushbutton")
FA_18C_hornet:definePushButton("RWR_SPECIAL_BTN", 53, 3003, 272, "RWR Control Indicator", "ALR-67 SPECIAL Pushbutton")
FA_18C_hornet:definePushButton("RWR_OFFSET_BTN", 53, 3004, 269, "RWR Control Indicator", "ALR-67 OFFSET Pushbutton")
FA_18C_hornet:definePushButton("RWR_BIT_BTN", 53, 3005, 266, "RWR Control Indicator", "ALR-67 BIT Pushbutton")
FA_18C_hornet:definePotentiometer("RWR_DMR_CTRL", 53, 3006, 263, { 0, 1 }, "RWR Control Indicator", "ALR-67 DMR Control Knob")
FA_18C_hornet:defineTumb("RWR_DIS_TYPE_SW", 53, 3007, 261, 0.1, { 0, 0.4 }, nil, false, "RWR Control Indicator", "ALR-67 DIS TYPE Switch, N/I/A/U/F")
FA_18C_hornet:definePotentiometer("RWR_RWR_INTESITY", 53, 3008, 216, { 0, 1 }, "RWR Control Indicator", "RWR Intensity Knob")
FA_18C_hornet:defineIndicatorLight("RWR_LOWER_LT", 276, "RWR Control Indicator", "ALR-67 POWER Light ON (green)")
FA_18C_hornet:defineIndicatorLight("RWR_LIMIT_LT", 273, "RWR Control Indicator", "ALR-67 LIMIT Light (green)")
FA_18C_hornet:defineIndicatorLight("RWR_DISPLAY_LT", 274, "RWR Control Indicator", "ALR-67 DISPLAY Light (green)")
FA_18C_hornet:defineIndicatorLight("RWR_SPECIAL_EN_LT", 270, "RWR Control Indicator", "ALR-67 SPECIAL ENABLE Light (green)")
FA_18C_hornet:defineIndicatorLight("RWR_SPECIAL_LT", 271, "RWR Control Indicator", "ALR-67 SPECIAL Light (green)")
FA_18C_hornet:defineIndicatorLight("RWR_ENABLE_LT", 267, "RWR Control Indicator", "ALR-67 ENABLE Light (green)")
FA_18C_hornet:defineIndicatorLight("RWR_OFFSET_LT", 268, "RWR Control Indicator", "ALR-67 OFFSET Light (green)")
FA_18C_hornet:defineIndicatorLight("RWR_FAIL_LT", 264, "RWR Control Indicator", "ALR-67 FAIL Light (red)")
FA_18C_hornet:defineIndicatorLight("RWR_BIT_LT", 265, "RWR Control Indicator", "ALR-67 BIT Light (green)")

-- 37. Clock
FA_18C_hornet:defineFloat("CLOCK_HOURS", 278, { 0, 1 }, "Clock", "Hours")
FA_18C_hornet:defineFloat("CLOCK_MINUTES", 289, { 0, 1 }, "Clock", "Minutes")
FA_18C_hornet:defineFloat("CLOCK_ELAPSED_MINUTES", 281, { 0, 1 }, "Clock", "Elapsed Minutes")
FA_18C_hornet:defineFloat("CLOCK_ELAPSED_SECONDS", 280, { 0, 1 }, "Clock", "Elapsed Seconds")

-- 38. Rudder Pedal Adjust Level
FA_18C_hornet:defineToggleSwitch("RUDDER_PEDAL_ADJUST", 7, 3012, 260, "Rudder Pedal Adjust Level", "Rudder Pedal Adjust Lever")

-- 39. Cockpit Altimeter
FA_18C_hornet:defineFloat("PRESSURE_ALT", 285, { 0, 1 }, "Cockpit Altimeter", "Pressure Altitude")

-- 41. Radar Altimeter
FA_18C_hornet:definePushButton("RADALT_TEST_SW", 30, 3001, 292, "Radar Altimeter", "Push to Test Switch")
FA_18C_hornet:defineRotary("RADALT_HEIGHT", 30, 3002, 291, "Radar Altimeter", "Set low altitude pointer")
FA_18C_hornet:defineIndicatorLight("LOW_ALT_WARN_LT", 290, "Radar Altimeter", "Low Alt Warning (red)")
FA_18C_hornet:defineFloat("RADALT_MIN_HEIGHT_PTR", 287, { 0, 1 }, "Radar Altimeter", "Min Height Pointer")
FA_18C_hornet:defineFloat("RADALT_ALT_PTR", 286, { 0, 1 }, "Radar Altimeter", "Altitude Pointer")
FA_18C_hornet:defineFloat("RADALT_OFF_FLAG", 288, { 0, 1 }, "Radar Altimeter", "OFF Flag")
FA_18C_hornet:defineIndicatorLight("RADALT_GREEN_LAMP", 289, "Radar Altimeter", "Radar Altimeter Green Lamp (green)")

-- 43. Arresting Hook Handle and Light
FA_18C_hornet:defineToggleSwitch("HOOK_LEVER", 5, 3009, 293, "Arresting Hook Handle and Light", "Hook Lever")
FA_18C_hornet:defineIndicatorLight("ARRESTING_HOOK_LT", 294, "Arresting Hook Handle and Light", "Hook Light")

-- 44. Wing Fold Switch
FA_18C_hornet:defineToggleSwitch("WING_FOLD_PULL", 2, 3010, 296, "Wing Fold Switch", "Wing Fold Control Handle Pull")
FA_18C_hornet:define3PosTumb("WING_FOLD_ROTATE", 2, 3011, 295, "Wing Fold Switch", "Wing Fold Control Handle, FOLD/HOLD/UNFOLD")

-- 45. Flight Computer Cool Switch
FA_18C_hornet:defineToggleSwitch("AV_COOL_SW", 11, 3008, 297, "Flight Computer Cool Switch", "AV COOL Switch, NORM/EMERG")

-- 46. Caution Lights Panel
FA_18C_hornet:defineIndicatorLight("CLIP_CK_SEAT_LT", 298, "Caution Light Panel", "CK SEAT (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_APU_ACC_LT", 299, "Caution Light Panel", "APU ACC (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_BATT_SW_LT", 300, "Caution Light Panel", "BATT SW (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_FCS_HOT_LT", 301, "Caution Light Panel", "FCS HOT (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_GEN_TIE_LT", 302, "Caution Light Panel", "GEN TIE (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_SPARE_CTN1_LT", 303, "Caution Light Panel", "SPARE CTN1 (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_FUEL_LO_LT", 304, "Caution Light Panel", "FUEL LO (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_FCES_LT", 305, "Caution Light Panel", "FCES (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_SPARE_CTN2_LT", 306, "Caution Light Panel", "SPARE CTN2 (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_L_GEN_LT", 307, "Caution Light Panel", "L GEN (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_R_GEN_LT", 308, "Caution Light Panel", "R GEN (yellow)")
FA_18C_hornet:defineIndicatorLight("CLIP_SPARE_CTN3_LT", 309, "Caution Light Panel", "SPARE CTN3 (yellow)")

-- 47. HYD 1 and HYD Pressure Indicator
FA_18C_hornet:defineFloat("HYD_IND_LEFT", 310, { 0, 1 }, "HYD 1 and HYD Pressure Indicator", "HYD Indicator Left")
FA_18C_hornet:defineFloat("HYD_IND_RIGHT", 311, { 0, 1 }, "HYD 1 and HYD Pressure Indicator", "HYD Indicator Right")

-- 48. Heading and Course Set Switches
FA_18C_hornet:defineRockerSwitch("LEFT_DDI_HDG_SW", 35, 3004, 3004, 3005, 3005, 312, "Heading and Course Set Switches", "Heading Set Switch")
FA_18C_hornet:defineRockerSwitch("LEFT_DDI_CRS_SW", 35, 3006, 3006, 3007, 3007, 313, "Heading and Course Set Switches", "Course Set Switch")

---- LEFT CONSOLE
-- 1. Fire Test Panel
FA_18C_hornet:defineRockerSwitch("FIRE_TEST_SW", 12, 3006, 3006, 3007, 3007, 331, "Fire Test Panel", "Fire and Bleed Air Test Switch, (RMB) TEST A/(LMB) TEST B")

-- 2. Ground Power Panel
FA_18C_hornet:defineRockerSwitch("EXT_PWR_SW", 3, 3005, 3005, 3004, 3004, 336, "Ground Power Panel", "External Power Switch, RESET/NORM/OFF")
FA_18C_hornet:defineRockerSwitch("GND_PWR_1_SW", 3, 3008, 3008, 3009, 3009, 332, "Ground Power Panel", "Ground Power Switch 1, A ON/AUTO/B ON")
FA_18C_hornet:defineRockerSwitch("GND_PWR_2_SW", 3, 3010, 3010, 3011, 3011, 333, "Ground Power Panel", "Ground Power Switch 2, A ON/AUTO/B ON")
FA_18C_hornet:defineRockerSwitch("GND_PWR_3_SW", 3, 3012, 3012, 3013, 3013, 334, "Ground Power Panel", "Ground Power Switch 3, A ON/AUTO/B ON")
FA_18C_hornet:defineRockerSwitch("GND_PWR_4_SW", 3, 3014, 3014, 3015, 3015, 335, "Ground Power Panel", "Ground Power Switch 4, A ON/AUTO/B ON")

-- 3. Throttle Quadrant
FA_18C_hornet:definePotentiometer("THROTTLE_FRICTION", 2, 3012, 504, { 0, 1 }, "Throttle Quadrant", "Throttles Friction Adjusting Lever")

-- 4. Exterior Lights Panel
FA_18C_hornet:definePotentiometer("POSITION_DIMMER", 8, 3001, 338, { 0, 1 }, "Exterior Lights Panel", "Position Lights Dimmer")
FA_18C_hornet:definePotentiometer("FORMATION_DIMMER", 8, 3002, 337, { 0, 1 }, "Exterior Lights Panel", "Formation Lights Dimmer")
FA_18C_hornet:define3PosTumb("STROBE_SW", 8, 3003, 339, "Exterior Lights Panel", "Strobe Lights Switch")
FA_18C_hornet:defineToggleSwitch("INT_WNG_TANK_SW", 6, 3001, 340, "Exterior Lights Panel", "Internal Wing Tank Fuel Control Switch, INHIBIT/NORM")

-- 5. Fuel Panel
FA_18C_hornet:define3PosTumb("PROBE_SW", 6, 3002, 341, "Fuel Panel", "Probe Control Switch, EXTEND/RETRACT/EMERG EXTD")
FA_18C_hornet:defineToggleSwitchToggleOnly("FUEL_DUMP_SW", 6, 3003, 344, "Fuel Panel", "Fuel Dump Switch, ON/OFF")
FA_18C_hornet:define3PosTumb("EXT_CNT_TANK_SW", 6, 3004, 343, "Fuel Panel", "External Centerline Tank Fuel Control Switch, STOP/NORM/ORIDE")
FA_18C_hornet:define3PosTumb("EXT_WNG_TANK_SW", 6, 3005, 342, "Fuel Panel", "External Wing Tanks Fuel Control Switch, STOP/NORM/ORIDE")

-- 6. Flight Control System Panel
FA_18C_hornet:definePotentiometer("RUD_TRIM", 2, 3001, 345, { -1, 1 }, "Flight Control System Panel", "RUD TRIM Control")
FA_18C_hornet:defineToggleSwitch("TO_TRIM_BTN", 2, 3002, 346, "Flight Control System Panel", "T/O TRIM Button")
FA_18C_hornet:defineToggleSwitch("FCS_RESET_BTN", 2, 3003, 349, "Flight Control System Panel", "FCS RESET Button")
FA_18C_hornet:defineToggleSwitch("GAIN_SWITCH_COVER", 2, 3005, 348, "Flight Control System Panel", "GAIN Switch Cover")
FA_18C_hornet:defineToggleSwitch("GAIN_SWITCH", 2, 3006, 347, "Flight Control System Panel", "GAIN Switch")

-- 7. Communication Panel
FA_18C_hornet:definePotentiometer("COM_VOX", 40, 3002, 357, { 0, 1 }, "Communication Panel", "VOX Volume Control Knob")
FA_18C_hornet:definePotentiometer("COM_ICS", 40, 3003, 358, { 0, 1 }, "Communication Panel", "ICS Volume Control Knob")
FA_18C_hornet:definePotentiometer("COM_RWR", 40, 3004, 359, { 0, 1 }, "Communication Panel", "RWR Volume Control Knob")
FA_18C_hornet:definePotentiometer("COM_WPN", 40, 3005, 360, { 0, 1 }, "Communication Panel", "WPN Volume Control Knob")
FA_18C_hornet:definePotentiometer("COM_MIDS_A", 40, 3006, 362, { 0, 1 }, "Communication Panel", "MIDS A Volume Control Knob")
FA_18C_hornet:definePotentiometer("COM_MIDS_B", 40, 3007, 361, { 0, 1 }, "Communication Panel", "MIDS B Volume Control Knob")
FA_18C_hornet:definePotentiometer("COM_TACAN", 40, 3008, 363, { 0, 1 }, "Communication Panel", "TACAN Volume Control Knob")
FA_18C_hornet:definePotentiometer("COM_AUX", 40, 3009, 364, { 0, 1 }, "Communication Panel", "AUX Volume Control Knob")
FA_18C_hornet:define3PosTumb("COM_COMM_RELAY_SW", 40, 3010, 350, "Communication Panel", "Comm Relay Switch, CIPHER/OFF/PLAIN")
FA_18C_hornet:define3PosTumb("COM_COMM_G_XMT_SW", 40, 3011, 351, "Communication Panel", "COMM G XMT Switch, COMM 1/OFF/COMM 2")
FA_18C_hornet:defineToggleSwitch("COM_IFF_MASTER_SW", 40, 3012, 356, "Communication Panel", "IFF Master Switch, EMER/NORM")
FA_18C_hornet:define3PosTumb("COM_IFF_MODE4_SW", 40, 3013, 355, "Communication Panel", "IFF Mode 4 Switch, DIS/AUD /DIS/OFF")
FA_18C_hornet:defineRockerSwitch("COM_CRYPTO_SW", 40, 3015, 3015, 3014, 3014, 354, "Communication Panel", "CRYPTO Switch, HOLD/NORM/ZERO")
FA_18C_hornet:defineToggleSwitch("COM_ILS_UFC_MAN_SW", 40, 3016, 353, "Communication Panel", "ILS UFC/MAN Switch, UFC/MAN")
FA_18C_hornet:defineTumb("COM_ILS_CHANNEL_SW", 40, 3017, 352, 0.05, { 0, 0.95 }, nil, false, "Communication Panel", "ILS Channel Selector Switch")

-- 8. LOX Indicator
FA_18C_hornet:defineToggleSwitch("OBOGS_SW", 10, 3001, 365, "LOX Indicator", "OBOGS Control Switch, ON/OFF")
FA_18C_hornet:definePotentiometer("OXY_FLOW", 10, 3002, 366, { 0, 1 }, "LOX Indicator", "OXY Flow Knob")

-- 12. Mission Computer and Hydraulic Isolate Panel
FA_18C_hornet:defineMissionComputerSwitch("MC_SW", 3, 3025, 3026, 368, "Mission Computer and Hydraulic Isolate Panel", "MC Switch, 1 OFF/NORM/2 OFF")
FA_18C_hornet:defineToggleSwitch("HYD_ISOLATE_OVERRIDE_SW", 4, 3001, 369, "Mission Computer and Hydraulic Isolate Panel", "Hydraulic Isolate Override Switch, NORM/ORIDE")

-- 13. Antenna Select Panel
FA_18C_hornet:define3PosTumb("COMM1_ANT_SELECT_SW", 50, 3001, 373, "Antenna Select Panel", "COMM 1 Antenna Selector Switch, UPPER/AUTO/LOWER")
FA_18C_hornet:define3PosTumb("IFF_ANT_SELECT_SW", 50, 3002, 374, "Antenna Select Panel", "IFF Antenna Selector Switch, UPPER/BOTH/LOWER")

-- 14. Auxiliary Power Unit Panel
FA_18C_hornet:defineToggleSwitchToggleOnly("APU_CONTROL_SW", 12, 3001, 375, "Auxiliary Power Unit Panel", "APU Control Switch, ON/OFF")
FA_18C_hornet:defineRockerSwitch("ENGINE_CRANK_SW", 12, 3003, 3003, 3002, 3002, 377, "Auxiliary Power Unit Panel", "Engine Crank Switch, LEFT/OFF/RIGHT")
FA_18C_hornet:defineIndicatorLight("APU_READY_LT", 376, "Auxiliary Power Unit Panel", "APU Ready Light (green)")

-- 15. Generator Tie Control Switch
FA_18C_hornet:defineToggleSwitch("GEN_TIE_COVER", 3, 3007, 379, "Generator Tie Control Switch", "Generator TIE Control Switch Cover, OPEN/CLOSE")
FA_18C_hornet:defineToggleSwitch("GEN_TIE_SW", 3, 3006, 378, "Generator Tie Control Switch", "Generator TIE Control Switch, NORM/RESET")

-- 16. ECM Dispenser Button
FA_18C_hornet:definePushButton("CMSD_DISPENSE_BTN", 54, 3002, 380, "ECM Dispenser Button", "Dispense Button - Push to dispense flares and chaff")

-- 18. Left Essential Circuit Breakers
FA_18C_hornet:definePushButton("CB_FCS_CHAN1", 3, 3017, 381, "Left Essential Circuit Breakers", "CB FCS CHAN 1, ON/OFF")
FA_18C_hornet:definePushButton("CB_FCS_CHAN2", 3, 3018, 382, "Left Essential Circuit Breakers", "CB FCS CHAN 2, ON/OFF")
FA_18C_hornet:definePushButton("CB_SPD_BRK", 3, 3019, 383, "Left Essential Circuit Breakers", "CB SPD BRK, ON/OFF")
FA_18C_hornet:definePushButton("CB_LAUNCH_BAR", 3, 3020, 384, "Left Essential Circuit Breakers", "CB LAUNCH BAR, ON/OFF")

---- RIGHT CONSOLE
-- 1. Electrical Power Panel
FA_18C_hornet:define3PosTumb("BATTERY_SW", 3, 3001, 404, "Electrical Power Panel", "Battery Switch, ON/OFF/ORIDE")
FA_18C_hornet:defineToggleSwitch("L_GEN_SW", 3, 3002, 402, "Electrical Power Panel", "Left Generator Control Switch, NORM/OFF")
FA_18C_hornet:defineToggleSwitch("R_GEN_SW", 3, 3003, 403, "Electrical Power Panel", "Right Generator Control Switch, NORM/OFF")
FA_18C_hornet:defineFloat("VOLT_U", 400, { 0, 1 }, "Electrical Power Panel", "Battery U Volts")
FA_18C_hornet:defineFloat("VOLT_E", 401, { 0, 1 }, "Electrical Power Panel", "Battery E Volts")

-- 2. Environment Control System Panel
FA_18C_hornet:defineTumb("BLEED_AIR_KNOB", 11, 3001, 411, 0.1, { 0, 0.3 }, nil, true, "Environment Control System Panel", "Bleed Air Knob, R OFF/NORM/L OFF/OFF")
FA_18C_hornet:defineToggleSwitch("BLEED_AIR_PULL", 11, 3002, 412, "Environment Control System Panel", "Bleed Air Knob, AUG PULL")
FA_18C_hornet:define3PosTumb("ECS_MODE_SW", 11, 3003, 405, "Environment Control System Panel", "ECS Mode Switch, AUTO/MAN/ OFF/RAM")
FA_18C_hornet:define3PosTumb("CABIN_PRESS_SW", 11, 3004, 408, "Environment Control System Panel", "Cabin Pressure Switch, NORM/DUMP/ RAM/DUMP")
FA_18C_hornet:definePotentiometer("CABIN_TEMP", 11, 3006, 407, { 0, 1 }, "Environment Control System Panel", "Cabin Temperature Knob")
FA_18C_hornet:definePotentiometer("SUIT_TEMP", 11, 3007, 406, { 0, 1 }, "Environment Control System Panel", "Suit Temperature Knob")
FA_18C_hornet:define3PosTumb("ENG_ANTIICE_SW", 12, 3014, 410, "Environment Control System Panel", "Engine Anti-Ice Switch, ON/OFF/TEST")
FA_18C_hornet:defineToggleSwitchToggleOnly("PITOT_HEAT_SW", 3, 3016, 409, "Environment Control System Panel", "Pitot Heater Switch, ON/AUTO")

-- 3. Interior Lights Panel
FA_18C_hornet:definePotentiometer("CONSOLES_DIMMER", 9, 3001, 413, { 0, 1 }, "Interior Lights Panel", "CONSOLES Lights Dimmer")
FA_18C_hornet:definePotentiometer("INST_PNL_DIMMER", 9, 3002, 414, { 0, 1 }, "Interior Lights Panel", "INST PNL Dimmer")
FA_18C_hornet:definePotentiometer("FLOOD_DIMMER", 9, 3003, 415, { 0, 1 }, "Interior Lights Panel", "FLOOD Light Dimmer")
FA_18C_hornet:define3PosTumb("COCKKPIT_LIGHT_MODE_SW", 9, 3004, 419, "Interior Lights Panel", "MODE Switch, NVG/NITE/DAY")
FA_18C_hornet:definePotentiometer("CHART_DIMMER", 9, 3005, 418, { 0, 1 }, "Interior Lights Panel", "CHART Light Dimmer")
FA_18C_hornet:definePotentiometer("WARN_CAUTION_DIMMER", 9, 3006, 417, { 0, 1 }, "Interior Lights Panel", "WARN/CAUTION Light Dimmer")
FA_18C_hornet:defineToggleSwitch("LIGHTS_TEST_SW", 9, 3007, 416, "Interior Lights Panel", "Lights Test Switch, TEST/OFF")

-- 5. Sensor Panel
FA_18C_hornet:define3PosTumb("FLIR_SW", 62, 3001, 439, "Sensor Panel", "FLIR Switch, ON/STBY/OFF")
FA_18C_hornet:defineToggleSwitch("LTD_R_SW", 62, 3002, 441, "Sensor Panel", "LTD/R Switch, ARM/SAFE")
FA_18C_hornet:defineToggleSwitch("LST_NFLR_SW", 62, 3003, 442, "Sensor Panel", "LST/NFLR Switch, ON/OFF")
FA_18C_hornet:defineTumb("RADAR_SW", 42, 3001, 440, 0.1, { 0, 0.3 }, nil, false, "Sensor Panel", "RADAR Switch Change ,OFF/STBY/OPR/EMERG(PULL)")
FA_18C_hornet:definePushButton("RADAR_SW_PULL", 42, 3002, 440, "Sensor Panel", "RADAR Switch Pull (MW to pull), OFF/STBY/OPR/EMERG(PULL)")
FA_18C_hornet:defineTumb("INS_SW", 44, 3001, 443, 0.1, { 0, 0.7 }, nil, false, "Sensor Panel", "INS Switch, OFF/CV/GND/NAV/IFA/GYRO/GB/TEST")

-- 6. KY-58 Control
FA_18C_hornet:defineTumb("KY58_MODE_SELECT", 41, 3001, 444, 0.1, { 0, 0.3 }, nil, false, "KY-58 Control", "KY-58 Mode Select Knob, P/C/LD/RV")
FA_18C_hornet:definePotentiometer("KY58_VOLUME", 41, 3005, 445, { 0, 1 }, "KY-58 Control", "KY-58 Volume Control Knob")
FA_18C_hornet:defineTumb("KY58_FILL_SELECT", 41, 3002, 446, 0.1, { 0, 0.7 }, nil, false, "KY-58 Control", "KY-58 Fill Select Knob, Z 1-5/1/2/3/4/5/6/Z ALL")
FA_18C_hornet:defineTumb("KY58_POWER_SELECT", 41, 3004, 447, 0.1, { 0, 0.2 }, nil, false, "KY-58 Control", "KY-58 Power Select Knob, OFF/ON/TD")

-- 11. Defog Panel
FA_18C_hornet:definePotentiometer("DEFOG_HANDLE", 11, 3005, 451, { -1, 1 }, "Defog Panel", "Defog Handle")
FA_18C_hornet:define3PosTumb("WSHIELD_ANTI_ICE_SW", 11, 3009, 452, "Defog Panel", "Windshield Anti-Ice/Rain Switch, ANTI ICE/OFF/RAIN")

-- 12. Internal Canopy Switch
FA_18C_hornet:defineRockerSwitch("CANOPY_SW", 7, 3001, 3001, 3002, 3002, 453, "Internal Canopy Switch", "Canopy Control Switch, OPEN/HOLD/CLOSE")

-- 13. Right Essential Circuit Breakers
FA_18C_hornet:definePushButton("CB_FCS_CHAN3", 3, 3021, 454, "Right Essential Circuit Breakers", "CB FCS CHAN 3, ON/OFF")
FA_18C_hornet:definePushButton("CB_FCS_CHAN4", 3, 3022, 455, "Right Essential Circuit Breakers", "CB FCS CHAN 4, ON/OFF")
FA_18C_hornet:definePushButton("CB_HOOOK", 3, 3023, 456, "Right Essential Circuit Breakers", "CB HOOK, ON/OFF")
FA_18C_hornet:definePushButton("CB_LG", 3, 3024, 457, "Right Essential Circuit Breakers", "CB LG, ON/OFF")
FA_18C_hornet:defineToggleSwitch("FCS_BIT_SW", 2, 3004, 470, "Right Essential Circuit Breakers", "FCS BIT Switch")

---- COCKPIT CONTROLS
FA_18C_hornet:defineFloat("CANOPY_POS", 181, { 0, 1 }, "Internal Canopy Switch", "Canopy Position")

-- 1. Ejection Seat
FA_18C_hornet:defineEjectionHandleSwitch("EJECTION_HANDLE_SW", 7, 3008, 510, "Ejection Seat", "Ejection Control Handle")
FA_18C_hornet:defineToggleSwitch("EJECTION_SEAT_ARMED", 7, 3006, 511, "Ejection Seat", "Ejection Seat SAFE/ARMED Handle, SAFE/ARMED")
FA_18C_hornet:defineToggleSwitch("EJECTION_SEAT_MNL_OVRD", 7, 3007, 512, "Ejection Seat", "Ejection Seat Manual Override Handle, PULL/PUSH")
FA_18C_hornet:defineToggleSwitch("SHLDR_HARNESS_SW", 7, 3009, 513, "Ejection Seat", "Shoulder Harness Control Handle, LOCK/UNLOCK")
FA_18C_hornet:defineRockerSwitch("SEAT_HEIGHT_SW", 7, 3011, 3011, 3010, 3010, 514, "Ejection Seat", "Seat Height Adjustment Switch, UP/HOLD/DOWN")
FA_18C_hornet:defineToggleSwitch("HIDE_STICK_TOGGLE", 7, 3013, 575, "Ejection Seat", "Hide Stick toggle")

-- 2. TODO
FA_18C_hornet:definePushButton("LEFT_VIDEO_BIT", 0, 3127, 315, "TODO", "Left Video Sensor BIT Initiate Pushbutton - Push to initiate BIT")
FA_18C_hornet:definePushButton("RIGHT_VIDEO_BIT", 0, 3128, 318, "TODO", "Right Video Sensor BIT Initiate Pushbutton - Push to initiate BIT")
FA_18C_hornet:definePotentiometer("RWR_AUDIO_CTRL", 0, 3130, 262, { 0, 1 }, "RWR Control Indicator", "ALR-67 AUDIO Control Knob")
FA_18C_hornet:defineToggleSwitch("NUC_WPN_SW", 0, 3100, 507, "TODO", "NUC WPN Switch, ENABLE/DISABLE (no function)")

-- HOTAS STICK
FA_18C_hornet:definePushButton("STICK_WEAP_REL_BTN", 13, 3003, 475, "Stick", "Stick Weapon Release Button")
FA_18C_hornet:definePushButton("STICK_RECCE_SW", 13, 3004, 477, "Stick", "Stick RECCE Event Mark Switch")
FA_18C_hornet:definePushButton("STICK_GUN_TRIGGER2", 13, 3002, 479, "Stick", "Stick Gun Trigger, SECOND DETENT (Press to shoot)")
FA_18C_hornet:definePushButton("STICK_PADDLE_SW", 13, 3018, 482, "Stick", "Stick Autopilot/Nosewheel Steering Disengage (Paddle) Switch")
FA_18C_hornet:definePushButton("STICK_N_WHEEL_SW", 13, 3013, 480, "Stick", "Stick Undesignate/Nose Wheel Steer Switch")

-- HOTAS THROTTLE
FA_18C_hornet:definePushButton("THROTTLE_CAGE_BTN", 13, 3031, 487, "Throttle Quadrant", "Throttle Cage/Uncage Button")
FA_18C_hornet:defineRockerSwitch("THROTTLE_DISP_SW", 13, 3032, 3032, 3033, 3033, 488, "Throttle Quadrant", "Throttle Dispense Switch, Aft(FLARE)/Center(OFF)/Forward(CHAFF)")
FA_18C_hornet:define3PosTumb("THROTTLE_SPEED_BRK", 13, 3035, 489, "Throttle Quadrant", "Throttle Speed Brake Switch, EXTEND/OFF/RETRACT")
FA_18C_hornet:definePushButton("THROTTLE_ATC_SW", 13, 3037, 491, "Throttle Quadrant", "Throttle ATC Engage/Disengage Switch")
FA_18C_hornet:definePushButton("THROTTLE_FOV_SEL_SW", 13, 3034, 492, "Throttle Quadrant", "Throttle RAID/FLIR FOV Select Button")
FA_18C_hornet:definePotentiometer("THROTTLE_RADAR_ELEV", 13, 3026, 493, { -1, 1 }, "Throttle Quadrant", "Throttle Radar Elevation Control")
FA_18C_hornet:defineTumb("THROTTLE_EXT_L_SW", 13, 3041, 494, 2, { -1, 1 }, nil, false, "Throttle Quadrant", "Throttle Exterior Lights Switch, ON/OFF")

FA_18C_hornet:defineFloat("CONSOLE_INT_LT", 460, { 0, 1 }, "Internal Lights", "Console Lightning (light green)")
FA_18C_hornet:defineFloat("FLOOD_INT_LT", 461, { 0, 1 }, "Internal Lights", "Flood Lightning (light green)")
FA_18C_hornet:defineFloat("NVG_FLOOD_INT_LT", 462, { 0, 1 }, "Internal Lights", "Nvg Flood Lightning (light green)")
FA_18C_hornet:defineFloat("CHART_INT_LT", 463, { 0, 1 }, "Internal Lights", "Chart Lightning (light green)")
FA_18C_hornet:defineIndicatorLight("EMERG_INSTR_INT_LT", 464, "Internal Lights", "Emergency Instrument Lightning (light green)")
FA_18C_hornet:defineIndicatorLight("ENG_INSTR_INT_LT", 465, "Internal Lights", "Eng Instrument Flood Lightning (light green)")
FA_18C_hornet:defineFloat("INSTR_INT_LT", 466, { 0, 1 }, "Internal Lights", "Instrument Lightning (light green)")
FA_18C_hornet:defineFloat("STBY_COMPASS_INT_LT", 467, { 0, 1 }, "Internal Lights", "Stby Compass Lightning (light green)")
FA_18C_hornet:defineFloat("IFEI_DISP_INT_LT", 468, { 0, 1 }, "Internal Lights", "IFEI Display Lightning (light green)")
FA_18C_hornet:defineFloat("IFEI_BTN_INT_LT", 469, { 0, 1 }, "Internal Lights", "IFEI Buttons Lightning (light green)")
FA_18C_hornet:defineIndicatorLight("CMSD_JET_SEL_L", 516, "Dispenser/EMC Panel", "ECM JETT JETT SEL Button Light (green)")
FA_18C_hornet:defineFloat("RWR_LT_BRIGHT", 520, { 0, 1 }, "RWR Control Indicator", "RWR Lights Brightness")

FA_18C_hornet:defineFloat("SAI_POINTER_VER", 211, { -1, 1 }, "Standby Attitude Reference Indicator", "SAI Vertical Pointer")
FA_18C_hornet:defineFloat("SAI_POINTER_HOR", 212, { -1, 1 }, "Standby Attitude Reference Indicator", "SAI Horisontal Pointer")

FA_18C_hornet:defineIndicatorLightInverted("SAI_ATT_WARN_FLAG_L", 209, "Standby Attitude Reference Indicator", "SAI Attitude Warning Flag as Light")

--Externals
FA_18C_hornet:defineFloatFromDrawArgument("EXT_SPEED_BRAKE", 21, "External Aircraft Model", "Speed Brake")
FA_18C_hornet:defineFloatFromDrawArgument("EXT_WING_FOLDING", 8, "External Aircraft Model", "Wing Folding")
FA_18C_hornet:defineFloatFromDrawArgument("EXT_STAIR", 323, "External Aircraft Model", "Stair")
FA_18C_hornet:defineFloatFromDrawArgument("EXT_REFUEL_PROBE", 22, "External Aircraft Model", "Refuel Probe")
FA_18C_hornet:defineBitFromDrawArgument("EXT_REFUEL_PROBE_LIGHT", 212, "External Aircraft Model", "Refuel Probe Light (white)")
FA_18C_hornet:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
FA_18C_hornet:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
FA_18C_hornet:defineFloatFromDrawArgument("EXT_FORMATION_LIGHTS", 88, "External Aircraft Model", "Formation Lights (light green)")
FA_18C_hornet:defineBitFromDrawArgument("EXT_TAIL_LIGHT", 192, "External Aircraft Model", "Tail Light (white)")
FA_18C_hornet:defineBitFromDrawArgument("EXT_STROBE_LIGHTS", 193, "External Aircraft Model", "Strobe Lights (red)")
FA_18C_hornet:defineFloatFromDrawArgument("EXT_NOZZLE_POS_R", 89, "External Aircraft Model", "Right Nozzle Position")
FA_18C_hornet:defineFloatFromDrawArgument("EXT_NOZZLE_POS_L", 90, "External Aircraft Model", "Left Nozzle Position")
FA_18C_hornet:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
FA_18C_hornet:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
FA_18C_hornet:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

FA_18C_hornet:defineString("IFEI_T", function()
	return Functions.pad_left(ifei.txt_T, 6)
end, 6, "Integrated Fuel/Engine Indicator (IFEI)", "T")
FA_18C_hornet:defineString("IFEI_L_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.LTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Left Texture Visible: 1 = yes, 0 = no")
FA_18C_hornet:defineString("IFEI_R_TEXTURE", function()
	return Functions.nil_state_to_str_flag(ifei.RTexture)
end, 1, "Integrated Fuel/Engine Indicator (IFEI)", "Right Texture Visible: 1 = yes, 0 = no")

FA_18C_hornet:defineFloatFromDrawArgument("EXT_HOOK", 25, "External Aircraft Model", "Hook")

FA_18C_hornet:defineFloat("INT_THROTTLE_LEFT", 104, { 0, 1 }, "Throttle Quadrant", "Left Throttle Position")
FA_18C_hornet:defineFloat("INT_THROTTLE_RIGHT", 105, { 0, 1 }, "Throttle Quadrant", "Right Throttle Position")
FA_18C_hornet:defineFloat("AOA_INDEXER_HIGH_F", 4, { 0, 1 }, "Angle of Attack Indexer Lights", "AOA Indexer High as Float (green)")
FA_18C_hornet:defineFloat("AOA_INDEXER_NORMAL_F", 5, { 0, 1 }, "Angle of Attack Indexer Lights", "AOA Indexer Normal as Float (yellow)")
FA_18C_hornet:defineFloat("AOA_INDEXER_LOW_F", 6, { 0, 1 }, "Angle of Attack Indexer Lights", "AOA Indexer Low as Float (red)")

FA_18C_hornet:defineToggleSwitch("KY58_FILL_SEL_PULL", 41, 3003, 0, "KY-58 Control", "KY-58 Fill Select Knob, Pull")

FA_18C_hornet:defineReadWriteRadio("COMM1", 38, 7, 3, 1000, "COMM1 Radio")
FA_18C_hornet:defineReadWriteRadio("COMM2", 39, 7, 3, 1000, "COMM2 Radio")

FA_18C_hornet:defineString("HUD_LTDR", function()
	return Functions.coerce_nil_to_string(Module.parse_indication(1)["MPD_FLIR_LaserStatus_label"])
end, 5, "HUD", "Laser Status")

return FA_18C_hornet
