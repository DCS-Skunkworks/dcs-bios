module("NS430", package.seeall)

local ApiVariant = require("Scripts.DCS-BIOS.lib.modules.documentation.ApiVariant")
local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")
local VariableStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.VariableStepInput")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local ns430_aircraft = {
	"A-10A",
	"AJS37",
	"AV8BNA",
	"Bf-109K-4",
	"C-101CC",
	"C-101EB",
	"Christen Eagle II",
	"F-14A-135-GR",
	"F-14B",
	"F-15C",
	"F-5E-3",
	"F-5E-3_FC",
	"F-86F Sabre",
	"F-86F_FC",
	"FW-190A8",
	"FW-190D9",
	"I-16",
	"J-11A",
	"JF-17",
	"L-39C",
	"L-39ZA",
	"M-2000C",
	"Mi-8MT",
	"Mi-24P",
	"MiG-15bis",
	"MiG-15bis_FC",
	"MiG-19P",
	"MiG-21Bis",
	"MiG-29A",
	"MiG-29G",
	"MiG-29S",
	"P-47D-30",
	"P-47D-30bl1",
	"P-47D-40",
	"P-51D",
	"P-51D-30-NA",
	"SA342L",
	"SA342M",
	"SA342Minigun",
	"SA342Mistral",
	"SpitfireLFMkIX",
	"SpitfireLFMkIXCW",
	"Su-25",
	"Su-25T",
	"Su-27",
	"Su-33",
	"TF-51D",
	"UH-1H",
	"Yak-52",
}
--- @class NS430: Module
local NS430 = Module:new("NS430", 0x0600, ns430_aircraft)
NS430.dev0_required = false

-- v2.0 by Celemourn
-- v3.0 ArturDCS

function NS430:defineDoubleCommandButton(identifier, ns430_device_id, device_id, start_command, stop_command, arg_number, category, description)
	local alloc = self:allocateInt(1, identifier)

	self:addExportHook(function(_)
		local dev = GetDevice(ns430_device_id)
		if not dev then
			return -- if the ns430 is not owned, dev is nil
		end
		alloc:setValue(dev:get_argument_value(arg_number))
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
	}, { IntegerOutput:new(alloc, Suffix.none, "selector position") }, "multiturn")
	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		if toState == "INC" then
			dev:performClickableAction(start_command, 1)
		end
		if toState == "DEC" then
			dev:performClickableAction(stop_command, 0)
		end
	end)
end

function NS430:defineMomentaryRockerSwitch(identifier, ns430_device_id, device_id, action_left_command, ui_left_command, action_right_command, ui_right_command, arg_number, category, description)
	local alloc = self:allocateInt(2, identifier)
	local min_value = -1
	local max_value = 1

	self:addExportHook(function(_)
		local dev = GetDevice(ns430_device_id)
		if not dev then
			return
		end
		alloc:setValue(dev:get_argument_value(arg_number) + 1)
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(2, "set the switch position -- 0 = held left/down, 1 = centered, 2 = held right/up"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "button position"),
	})
	self:addControl(control)

	self:addInputProcessor(identifier, function(value)
		local dev1 = GetDevice(ns430_device_id)
		if not dev1 then
			return
		end
		local toState = dev1:get_argument_value(arg_number)

		if value == "INC" then
			toState = toState + 1
		elseif value == "DEC" then
			toState = toState - 1
		end

		if toState > max_value or toState < min_value then
			return
		end

		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		if toState == 0 then
			dev:performClickableAction(ui_left_command, 0)
		end
		if toState == 1 then
			dev:performClickableAction(action_left_command, arg_number)
			dev:performClickableAction(ui_left_command, 1)
		end
		if toState == -1 then
			dev:performClickableAction(action_right_command, arg_number)
			dev:performClickableAction(ui_right_command, -1)
		end
	end)
end

--- Adds a new rotary potentiometer with values between 0 and 65535
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param limits number[]? a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function NS430:definePotentiometer2(identifier, ns430_device_id, device_id, command, arg_number, limits, category, description)
	local max_value = 65535
	limits = limits or { 0, 1 }

	local intervalLength = limits[2] - limits[1]
	self:addInputProcessor(identifier, function(value)
		local dev = GetDevice(ns430_device_id)
		if not dev then
			return
		end
		local newValue = ((dev:get_argument_value(arg_number) - limits[1]) / intervalLength) * max_value
		if value:match("-[0-9]+") or value:match("%+[0-9]+") then
			newValue = Module.cap(newValue + tonumber(value), 0, max_value)
		elseif value:match("[0-9]+") then
			newValue = Module.cap(tonumber(value) or 0, 0, max_value)
		end

		GetDevice(device_id):performClickableAction(command, newValue / max_value * intervalLength + limits[1])
	end)

	local value = self:allocateInt(max_value, identifier)

	self:addExportHook(function(_)
		local dev = GetDevice(ns430_device_id)
		if not dev then
			return
		end
		value:setValue(((dev:get_argument_value(arg_number) - limits[1]) / intervalLength) * max_value)
	end)

	local control = Control:new(category, ControlType.limited_dial, identifier, description, {
		SetStateInput:new(max_value, "set the position of the dial"),
		VariableStepInput:new(3200, max_value, "turn the dial left or right"),
	}, {
		IntegerOutput:new(value, Suffix.none, "position of the potentiometer"),
	})
	self:addControl(control)

	return control
end

--- Adds an infitely-looping rotary, like an encoder
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function NS430:defineRotary2(identifier, ns430_device_id, device_id, command, arg_number, category, description)
	local max_value = 65535

	self:addInputProcessor(identifier, function(value)
		GetDevice(device_id):performClickableAction(command, tonumber(value) / max_value)
	end)

	local value = self:allocateInt(max_value, identifier)

	local control = Control:new(category, ControlType.analog_dial, identifier, description, {
		VariableStepInput:new(3200, max_value, "turn the dial left or right"),
	}, {
		IntegerOutput:new(value, Suffix.knob_pos, "the rotation of the knob in the cockpit (not the value that is controlled by this knob!)"),
	}, ApiVariant.multiturn)
	self:addControl(control)

	self:addExportHook(function(_)
		local dev = GetDevice(ns430_device_id)
		if not dev then
			return
		end
		value:setValue(dev:get_argument_value(arg_number) * max_value)
	end)

	return control
end

NS430:defineDoubleCommandButton("NS430_LEFT_COM_PWR_VOL_PUSH", 256, 257, 3001, 3030, 1, "NS430", "COM Power/Volume Push")
NS430:definePotentiometer2("NS430_LEFT_COM_PWR_VOL_ROTATE", 256, 257, 3002, 0, { 0, 1 }, "NS430", "COM Power/Volume Rotate")

NS430:defineDoubleCommandButton("NS430_LEFT_VLOC_VOL_PUSH", 256, 257, 3004, 3031, 3, "NS430", "VOR/Localizer receiver Volume Push")
NS430:definePotentiometer2("NS430_LEFT_VLOC_VOLUME", 256, 257, 3005, 2, { 0, 1 }, "NS430", "VOR/Localizer receiver Volume Rotate")

NS430:defineDoubleCommandButton("NS430_LEFT_SMALL_BTN_PUSH", 256, 257, 3009, 3032, 5, "NS430", "Small Left Button Push")
NS430:defineRotary2("NS430_LEFT_SMALL_BTN_ROT", 256, 257, 3010, 6, "NS430", "Small Left Button Rotate")
NS430:defineRotary2("NS430_LEFT_BIG_BTN_ROTATE", 256, 257, 3007, 4, "NS430", "Big Left Button Rotate")

NS430:defineDoubleCommandButton("NS430_LEFT_COM_FLIP_FLOP", 256, 257, 3012, 3012, 7, "NS430", "COM flip-flop")
NS430:defineDoubleCommandButton("NS430_LEFT_VLOC_FLIP_FLOP", 256, 257, 3013, 3013, 8, "NS430", "VOR/Localizer flip-flop")

NS430:defineDoubleCommandButton("NS430_BTM_CDI", 256, 257, 3014, 3014, 9, "NS430", "[CDI] Course Deviation Indicator")
NS430:defineDoubleCommandButton("NS430_BTM_OBS", 256, 257, 3015, 3015, 10, "NS430", "[OBS] Activate Suspend Mode")
NS430:defineDoubleCommandButton("NS430_BTM_MSG", 256, 257, 3016, 3016, 11, "NS430", "[MSG] Message Button")
NS430:defineDoubleCommandButton("NS430_BTM_FPL", 256, 257, 3017, 3017, 12, "NS430", "[FPL] Create / Edit Flight plans")
NS430:defineDoubleCommandButton("NS430_BTM_PROC", 256, 257, 3018, 3018, 13, "NS430", "[PROC] Select Airport Procedure")

NS430:defineMomentaryRockerSwitch("NS430_RIGHT_RNG_ROCKER", 256, 257, 3020, 3041, 3019, 3040, 14, "NS430", "Range / Zoom Rocker Switch")

NS430:defineDoubleCommandButton("NS430_RIGHT_DIRECT_TO", 256, 257, 3021, 3042, 15, "NS430", "DIRECT-TO Button")
NS430:defineDoubleCommandButton("NS430_RIGHT_MENU", 256, 257, 3022, 3043, 16, "NS430", "MENU Button")

NS430:defineDoubleCommandButton("NS430_RIGHT_CLR", 256, 257, 3023, 3044, 17, "NS430", "CLR Button")
NS430:defineDoubleCommandButton("NS430_RIGHT_ENT", 256, 257, 3024, 3045, 18, "NS430", "ENT Button")

NS430:defineDoubleCommandButton("NS430_RIGHT_SMALL_BTN_PUSH", 256, 257, 3027, 3046, 20, "NS430", "Small Right Button Push")
NS430:defineRotary2("NS430_RIGHT_SMALL_BTN_ROT", 256, 257, 3028, 21, "NS430", "Small Right Button Rotate")
NS430:defineRotary2("NS430_RIGHT_BIG_BTN_ROTATE", 256, 257, 3025, 19, "NS430", "Big Right Button Rotate")

return NS430
