module("NS430", package.seeall)

local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local MomentaryPositions = require("Scripts.DCS-BIOS.lib.modules.documentation.MomentaryPositions")
local PhysicalVariant = require("Scripts.DCS-BIOS.lib.modules.documentation.PhysicalVariant")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

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
	"F-86F Sabre",
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

-- v2.0 by Celemourn

function NS430:defineDoubleCommandButton(identifier, device_id, start_command, stop_command, arg_number, category, description)
	local alloc = self:allocateInt(1, identifier)
	self:addExportHook(function(dev0)
		alloc:setValue(dev0:get_argument_value(arg_number))
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
	}, {}, MomentaryPositions.first_and_last, PhysicalVariant.push_button)
	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)
		if toState == "INC" then
			dev:performClickableAction(start_command, 1)
		end
		if toState == "DEC" then
			dev:performClickableAction(stop_command, 1)
			dev:performClickableAction(stop_command, 0)
		end
	end)
end

function NS430:defineMomentaryRockerSwitch(identifier, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	local alloc = self:allocateInt(2, identifier)
	self:addExportHook(function(dev0)
		local lut = { [-1] = 0, [0] = 1, [1] = 2 }
		alloc:setValue(lut[Module.round(dev0:get_argument_value(arg_number))])
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(2, "set the switch position -- 0 = held left/down, 1 = centered, 2 = held right/up"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "button position"),
	}, MomentaryPositions.first_and_last, PhysicalVariant.rocker_switch)
	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		if toState == "0" then
			toState = -1
		elseif toState == "1" then
			toState = 0
		elseif toState == "2" then
			toState = 1
		else
			return
		end
		local dev = GetDevice(device_id)
		if toState == 0 then
			dev:performClickableAction(pos_stop_command, 1)
			dev:performClickableAction(pos_stop_command, 0)
			dev:performClickableAction(neg_stop_command, 1)
			dev:performClickableAction(neg_stop_command, 0)
		end
		if toState == 1 then
			dev:performClickableAction(neg_stop_command, 1)
			dev:performClickableAction(neg_stop_command, 0)
			dev:performClickableAction(pos_command, 1)
		end
		if toState == -1 then
			dev:performClickableAction(pos_stop_command, 1)
			dev:performClickableAction(pos_stop_command, 0)
			dev:performClickableAction(neg_command, -1)
		end
	end)
end

NS430:defineDoubleCommandButton("NS430_PWR_VOL_SQ_PUSH", 257, 3001, 3001, 1, "NS430", "PWR-VOL PUSH-SQ")
NS430:defineDoubleCommandButton("NS430_PWR_VOL_SQ_POWER", 257, 3002, 3002, 1, "NS430", "PWR-VOL Power ON OFF")

NS430:defineDoubleCommandButton("NS430_VOL_PUSH_ID_PUSH", 257, 3004, 3031, 3, "NS430", "VOL_PUSH-ID VLOC Push")
NS430:defineDoubleCommandButton("NS430_SMALL_LEFT_BTN_PUSH", 257, 3009, 3032, 5, "NS430", "SMALL_LEFT_BTN Push")
NS430:defineDoubleCommandButton("NS430_COM_FLIP_FLOP", 257, 3012, 3033, 7, "NS430", "COM flip-flop")
NS430:defineDoubleCommandButton("NS430_VLOC_FLIP_FLOP", 257, 3013, 3034, 8, "NS430", "VLOC flip-flop")
NS430:defineDoubleCommandButton("NS430_CDI", 257, 3014, 3035, 9, "NS430", "CDI")
NS430:defineDoubleCommandButton("NS430_OBS", 257, 3015, 3036, 10, "NS430", "OBS")
NS430:defineDoubleCommandButton("NS430_OBS1", 257, 3015, 3036, 10, "NS430", "OBS1")
NS430:defineDoubleCommandButton("NS430_MSG", 257, 3016, 3037, 11, "NS430", "MSG")
NS430:defineDoubleCommandButton("NS430_FPL", 257, 3017, 3038, 12, "NS430", "FPL")
NS430:defineDoubleCommandButton("NS430_PROC", 257, 3018, 3039, 13, "NS430", "PROC")
NS430:defineDoubleCommandButton("NS430_DIRECT_TO", 257, 3021, 3042, 15, "NS430", "DIRECT-TO")
NS430:defineDoubleCommandButton("NS430_MENU", 257, 3022, 3043, 16, "NS430", "MENU")
NS430:defineDoubleCommandButton("NS430_CLR", 257, 3023, 3044, 17, "NS430", "CLR")
NS430:defineDoubleCommandButton("NS430_ENT", 257, 3024, 3045, 18, "NS430", "ENT")
NS430:defineDoubleCommandButton("NS430_SMALL_RIGHT_BTN_PUSH", 257, 3027, 3046, 20, "NS430", "SMALL_RIGHT_BTN Push")

NS430:definePotentiometer("NS430_PWR_VOL_PUSH_SQ_VOL", 257, 3002, 0, { 0, 1 }, "NS430", "PWR-VOL_PUSH-SQ COM Volume")
NS430:definePotentiometer("NS430_VOL_PUSH_ID_VOL", 257, 3005, 2, { 0, 1 }, "NS430", "VOL_PUSH-ID VLOC Volume")
NS430:defineRotary("NS430_BIG_LEFT_BTN", 257, 3007, 4, "NS430", "BIG_LEFT_BTN")
NS430:defineRotary("NS430_SMALL_LEFT_BTN_ROT", 257, 3010, 6, "NS430", "SMALL_LEFT_BTN rotate")
NS430:defineRotary("NS430_BIG_RIGHT_BTN", 257, 3025, 19, "NS430", "BIG_RIGHT_BTN")
NS430:defineRotary("NS430_SMALL_RIGHT_BTN_ROT", 257, 3028, 21, "NS430", "SMALL_RIGHT_BTN rotate")

NS430:defineMomentaryRockerSwitch("NS430_RNG_RKR", 257, 3020, 3041, 3019, 3040, 14, "NS430", "RNG Rocker") -- todo: can this just use defineRockerSwitch? Does this need to be custom?

NS430:defineIndicatorLight("GLOW", 70, "NS430", "Glow (green)")

return NS430
