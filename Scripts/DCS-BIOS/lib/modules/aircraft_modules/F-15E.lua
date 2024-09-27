module("F-15E", package.seeall)

local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_15E: Module
local F_15E = Module:new("F-15E", 0x9200, { "F-15ESE" })

--by WarLord,Maverick87Shaka&RafaPolit v1.2c

--UFC DISPLAY (ID: 8)
local F_UFC_LINE1 = ""
local F_UFC_LINE2 = ""
local F_UFC_LINE3 = ""
local F_UFC_LINE4 = ""
local F_UFC_LINE5 = ""
local F_UFC_LINE6 = ""
local F_UFC_LINE1_dots = ""
local F_UFC_LINE2_dots = ""
local F_UFC_LINE3_dots = ""
local F_UFC_LINE4_dots = ""
local F_UFC_LINE5_dots = ""
local F_UFC_LINE6_dots = ""
local F_UFC_ActiveUHF1 = ""
local F_UFC_ActiveUHF2 = ""

--REAR SEAT UFC DISPLAY (ID:20)
local R_UFC_LINE1 = ""
local R_UFC_LINE2 = ""
local R_UFC_LINE3 = ""
local R_UFC_LINE4 = ""
local R_UFC_LINE5 = ""
local R_UFC_LINE6 = ""
local R_UFC_LINE1_dots = ""
local R_UFC_LINE2_dots = ""
local R_UFC_LINE3_dots = ""
local R_UFC_LINE4_dots = ""
local R_UFC_LINE5_dots = ""
local R_UFC_LINE6_dots = ""
local R_UFC_ActiveUHF1 = ""
local R_UFC_ActiveUHF2 = ""

local ufc_string_length = 20

-- remove Arg# Pilot 1020 / WSO 1021 / WSO INSTR 1039

----FRONT COCKPIT
---MAIN INSTRUMENTS PANEL
--UFC Panel
F_15E:definePushButton("F_UFC_B1", 56, 3001, 270, "Front UFC", "FRONT UFC Push Button 1")
F_15E:definePushButton("F_UFC_B2", 56, 3002, 271, "Front UFC", "FRONT UFC Push Button 2")
F_15E:definePushButton("F_UFC_B3", 56, 3003, 272, "Front UFC", "FRONT UFC Push Button 3")
F_15E:definePushButton("F_UFC_B4", 56, 3004, 273, "Front UFC", "FRONT UFC Push Button 4")
F_15E:definePushButton("F_UFC_B5", 56, 3005, 274, "Front UFC", "FRONT UFC Push Button 5")
F_15E:definePushButton("F_UFC_B10", 56, 3010, 275, "Front UFC", "FRONT UFC Push Button 10")
F_15E:definePushButton("F_UFC_B9", 56, 3009, 276, "Front UFC", "FRONT UFC Push Button 9")
F_15E:definePushButton("F_UFC_B8", 56, 3008, 277, "Front UFC", "FRONT UFC Push Button 8")
F_15E:definePushButton("F_UFC_B7", 56, 3007, 278, "Front UFC", "FRONT UFC Push Button 7")
F_15E:definePushButton("F_UFC_B6", 56, 3006, 279, "Front UFC", "FRONT UFC Push Button 6")

F_15E:definePushButton("F_UFC_PRE_CHAN_L_PULL", 56, 3055, 680, "Front UFC", "FRONT Left UHF Preset Channel Switch")
F_15E:defineRotary("F_UFC_PRE_CHAN_L_SEL", 56, 3011, 280, "Front UFC", "FRONT Left UHF Preset Channel Selector")
F_15E:definePushButton("F_UFC_PRE_CHAN_R_PULL", 56, 3056, 681, "Front UFC", "FRONT Right UHF Preset Channel Switch")
F_15E:defineRotary("F_UFC_PRE_CHAN_R_SEL", 56, 3012, 281, "Front UFC", "FRONT Right UHF Preset Channel Selector")

F_15E:definePotentiometer("F_UFC_COM1_VOL", 56, 3013, 282, { 0, 1 }, "Front UFC", "FRONT UHF Radio 1 Volume")
F_15E:definePotentiometer("F_UFC_COM2_VOL", 56, 3014, 283, { 0, 1 }, "Front UFC", "FRONT UHF Radio 2 Volume")
F_15E:definePotentiometer("F_UFC_COM3_VOL", 56, 3015, 284, { 0, 1 }, "Front UFC", "FRONT UHF Radio 3 Volume")
F_15E:definePotentiometer("F_UFC_COM4_VOL", 56, 3016, 285, { 0, 1 }, "Front UFC", "FRONT UHF Radio 4 Volume")

F_15E:definePotentiometer("F_UFC_LCD_BRIGHT", 56, 3017, 286, { 0, 1 }, "Front UFC", "FRONT UFC LCD Brightness")
F_15E:definePushButton("F_UFC_EMISL_BTN", 56, 3018, 287, "Front UFC", "FRONT UFC Emission Limit Button")

F_15E:definePushButton("F_UFC_KEY_L_GUARD", 56, 3019, 288, "Front UFC", "FRONT Left Guard Receiver - Channel/Manual Key")
F_15E:definePushButton("F_UFC_KEY_A1", 56, 3020, 289, "Front UFC", "FRONT A/1 Key")
F_15E:definePushButton("F_UFC_KEY_N2", 56, 3021, 290, "Front UFC", "FRONT N/2 Key")
F_15E:definePushButton("F_UFC_KEY_B3", 56, 3022, 291, "Front UFC", "FRONT B/3 Key")
F_15E:definePushButton("F_UFC_KEY_R_GUARD", 56, 3023, 292, "Front UFC", "FRONT Right Guard Receiver - Channel/Manual Key")
F_15E:definePushButton("F_UFC_KEY_MARK", 56, 3024, 293, "Front UFC", "FRONT Mark Key")
F_15E:definePushButton("F_UFC_KEY_W4", 56, 3025, 294, "Front UFC", "FRONT W/4 Key")
F_15E:definePushButton("F_UFC_KEY_M5", 56, 3026, 295, "Front UFC", "FRONT M/5 Key")
F_15E:definePushButton("F_UFC_KEY_E6", 56, 3027, 296, "Front UFC", "FRONT E/6 Key")
F_15E:definePushButton("F_UFC_KEY_IP", 56, 3028, 297, "Front UFC", "FRONT I/P Key")
F_15E:definePushButton("F_UFC_KEY_DOT", 56, 3029, 298, "Front UFC", "FRONT Decimal Point Key")
F_15E:definePushButton("F_UFC_KEY_7", 56, 3030, 299, "Front UFC", "FRONT :/7 Key")
F_15E:definePushButton("F_UFC_KEY_S8", 56, 3031, 300, "Front UFC", "FRONT S/8 Key")
F_15E:definePushButton("F_UFC_KEY_C9", 56, 3032, 301, "Front UFC", "FRONT C/9 Key")
F_15E:definePushButton("F_UFC_KEY_SHF", 56, 3033, 302, "Front UFC", "FRONT Shift Key")
F_15E:definePushButton("F_UFC_KEY_AP", 56, 3034, 303, "Front UFC", "FRONT A/P Key")
F_15E:definePushButton("F_UFC_KEY_CLR", 56, 3035, 304, "Front UFC", "FRONT Clear Key")
F_15E:definePushButton("F_UFC_KEY_0", 56, 3036, 305, "Front UFC", "FRONT -/0 Key")
F_15E:definePushButton("F_UFC_KEY_DATA", 56, 3037, 306, "Front UFC", "FRONT Data Key")
F_15E:definePushButton("F_UFC_KEY_MENU", 56, 3038, 307, "Front UFC", "FRONT Menu Key")

local function replaceSpecial(str, result)
	local special = result or ""
	local i = str.find(str, "[:.`]")

	if i ~= nil then
		special = string.format("%s%" .. i - 1 .. "s", special, string.sub(str, i, i))
		replaceSpecial(string.sub(str, i + 1), special)
	end

	return special
end

local function prepareCharsAndSpecial(str)
	str = str:gsub("°", "`")
	local strChars = str:gsub("[:.`]", "")
	local strSpecial = string.len(strChars) > 0 and string.format("%-" .. string.len(strChars) .. "s", replaceSpecial(str)) or ""

	return str, strChars, strSpecial
end

local function replaceCharAtIndex(str, index, character)
	local startChars = string.sub(str, 1, index - 1)
	local remainingChars = string.sub(str, index + 1)
	return string.format("%s%s%s", startChars, character, remainingChars)
end

local function replaceIndexIfValue(str, charValue, index)
	local charData = Functions.coerce_nil_to_string(charValue):gsub("°", "`")

	if string.len(charData) > 0 then
		return replaceCharAtIndex(str, index, charData):gsub("`", "'")
	end

	return str
end

local function combine_ufc_line(left, center, right, centerStart)
	left = Functions.coerce_nil_to_string(left)
	right = Functions.coerce_nil_to_string(right)
	center = Functions.coerce_nil_to_string(center)

	local _, leftChars, leftSpecial = prepareCharsAndSpecial(left)
	local _, rightChars, rightSpecial = prepareCharsAndSpecial(right)
	local _, centerChars, centerSpecial = prepareCharsAndSpecial(center)

	local paddingSpaces = ufc_string_length - string.len(rightChars)

	local lineChars = string.format("%-" .. paddingSpaces .. "s%s", leftChars, rightChars)
	local lineSpecial = string.format("%-" .. paddingSpaces .. "s%s", leftSpecial, rightSpecial)

	local centerCharsLen = string.len(centerChars)

	if centerCharsLen > 0 then
		centerStart = centerStart or math.floor((ufc_string_length - centerCharsLen) / 2) + 1

		for i = 0, centerCharsLen - 1 do
			lineChars = replaceCharAtIndex(lineChars, centerStart + i, string.sub(centerChars, i + 1, i + 1))
			lineSpecial = replaceCharAtIndex(lineSpecial, centerStart + i, string.sub(centerSpecial, i + 1, i + 1))
		end
	end

	return lineChars, lineSpecial:gsub("`", "'")
end

-- UFC Line 1
local function build_ufc_line_1(ufcData)
	local lineChars, lineSpecial = combine_ufc_line(ufcData.UFC_SC_01, ufcData.UFC_CC_01, ufcData.UFC_SC_12)

	-- Special Characters and their indexes
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_R23R3, 14)
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_R1, 17)

	return lineChars, lineSpecial
end

-- UFC Line 2
local function build_ufc_line_2(ufcData)
	local lineChars, lineSpecial = combine_ufc_line(ufcData.UFC_SC_02, ufcData.UFC_CC_02, ufcData.UFC_SC_11)

	-- Special Characters and their indexes
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_02A, 3)
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_02B, 5)
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_11_SPA, 16)
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_11_SPB, 18)

	return lineChars, lineSpecial
end

-- UFC Line 3
local function build_ufc_line_3(ufcData)
	local lineChars, lineSpecial = combine_ufc_line(ufcData.UFC_SC_03, ufcData.UFC_CC_03, ufcData.UFC_SC_10)

	-- Special Characters and their indexes
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_03L1, 4)
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_03L2, 6)
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_03ILS, 7)

	return lineChars, lineSpecial
end

-- UFC Line 4
local function build_ufc_line_4(ufcData)
	local lineChars, lineSpecial = combine_ufc_line(ufcData.UFC_SC_04, nil, ufcData.UFC_SC_09)

	-- Special Characters and their indexes
	-- Currently none

	return lineChars, lineSpecial
end

-- UFC Line 5
local function build_ufc_line_5(ufcData)
	local lineChars, lineSpecial = combine_ufc_line(ufcData.UFC_SC_05, nil, ufcData.UFC_SC_08)

	-- Special Characters and their indexes
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_05A, 5)
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_SC_08A, 16)

	return lineChars, lineSpecial
end

-- UFC Line 6
local function build_ufc_line_6(ufcData)
	local lineChars, lineSpecial = combine_ufc_line(ufcData.UFC_SC_06, ufcData.UFC_CC_04, ufcData.UFC_SC_07, 6)

	local userInput = Functions.coerce_nil_to_string(ufcData.UFC_CC_04):gsub("°", "`")
	local specialOffset = string.find(userInput, "[EW]") == 1 and 1 or 0

	-- Special Characters and their indexes
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_LL_INPUT_DEG, 8 + specialOffset)
	lineSpecial = replaceIndexIfValue(lineSpecial, ufcData.UFC_LL_INPUT_MIN, 10 + specialOffset)

	return lineChars, lineSpecial
end

-- UFC Active Radios
local function determine_active_radios(line5, line6)
	local activeUHF1
	local activeUHF2

	if line6:find("*") == 1 then
		activeUHF1 = line6:sub(2, 4)
	elseif line5:find("*") == 1 then
		activeUHF1 = line5:sub(2, 5) .. "." .. line5:sub(6, 8)
	else
		activeUHF1 = line5:sub(2, 7)
	end

	if line6:reverse():find("*") == 1 then
		activeUHF2 = line6:sub(18, 19):gsub("^%s*(.-)%s*$", "%1")
	elseif line5:reverse():find("*") == 1 then
		activeUHF2 = line5:sub(13, 16) .. "." .. line5:sub(17, 19)
	else
		activeUHF2 = line5:sub(14, 19)
	end

	return activeUHF1, activeUHF2
end

F_15E:addExportHook(function()
	local f_ufc = Module.parse_indication(9)
	if not f_ufc then
		return
	end

	local r_ufc = Module.parse_indication(18)
	if not r_ufc then
		return
	end

	-- F_UFC Lines
	F_UFC_LINE1, F_UFC_LINE1_dots = build_ufc_line_1(f_ufc)
	F_UFC_LINE2, F_UFC_LINE2_dots = build_ufc_line_2(f_ufc)
	F_UFC_LINE3, F_UFC_LINE3_dots = build_ufc_line_3(f_ufc)
	F_UFC_LINE4, F_UFC_LINE4_dots = build_ufc_line_4(f_ufc)
	F_UFC_LINE5, F_UFC_LINE5_dots = build_ufc_line_5(f_ufc)
	F_UFC_LINE6, F_UFC_LINE6_dots = build_ufc_line_6(f_ufc)
	F_UFC_ActiveUHF1, F_UFC_ActiveUHF2 = determine_active_radios(F_UFC_LINE5, F_UFC_LINE6)

	--REAR UFC
	R_UFC_LINE1, R_UFC_LINE1_dots = build_ufc_line_1(r_ufc)
	R_UFC_LINE2, R_UFC_LINE2_dots = build_ufc_line_2(r_ufc)
	R_UFC_LINE3, R_UFC_LINE3_dots = build_ufc_line_3(r_ufc)
	R_UFC_LINE4, R_UFC_LINE4_dots = build_ufc_line_4(r_ufc)
	R_UFC_LINE5, R_UFC_LINE5_dots = build_ufc_line_5(r_ufc)
	R_UFC_LINE6, R_UFC_LINE6_dots = build_ufc_line_6(r_ufc)
	R_UFC_ActiveUHF1, R_UFC_ActiveUHF2 = determine_active_radios(R_UFC_LINE5, R_UFC_LINE6)
end)

F_15E:defineString("F_UFC_LINE1_DISPLAY", function()
	return F_UFC_LINE1
end, 20, "Front UFC Display", "Line 1")
F_15E:defineString("F_UFC_LINE2_DISPLAY", function()
	return F_UFC_LINE2
end, 20, "Front UFC Display", "Line 2")
F_15E:defineString("F_UFC_LINE3_DISPLAY", function()
	return F_UFC_LINE3
end, 20, "Front UFC Display", "Line 3")
F_15E:defineString("F_UFC_LINE4_DISPLAY", function()
	return F_UFC_LINE4
end, 20, "Front UFC Display", "Line 4")
F_15E:defineString("F_UFC_LINE5_DISPLAY", function()
	return F_UFC_LINE5
end, 20, "Front UFC Display", "Line 5")
F_15E:defineString("F_UFC_LINE6_DISPLAY", function()
	return F_UFC_LINE6
end, 20, "Front UFC Display", "Line 6")
F_15E:defineString("F_UFC_LINE1_DISPLAY_DOTS", function()
	return F_UFC_LINE1_dots
end, 20, "Front UFC Display", "Line 1 (special characters)")
F_15E:defineString("F_UFC_LINE2_DISPLAY_DOTS", function()
	return F_UFC_LINE2_dots
end, 20, "Front UFC Display", "Line 2 (special characters)")
F_15E:defineString("F_UFC_LINE3_DISPLAY_DOTS", function()
	return F_UFC_LINE3_dots
end, 20, "Front UFC Display", "Line 3 (special characters)")
F_15E:defineString("F_UFC_LINE4_DISPLAY_DOTS", function()
	return F_UFC_LINE4_dots
end, 20, "Front UFC Display", "Line 4 (special characters)")
F_15E:defineString("F_UFC_LINE5_DISPLAY_DOTS", function()
	return F_UFC_LINE5_dots
end, 20, "Front UFC Display", "Line 5 (special characters)")
F_15E:defineString("F_UFC_LINE6_DISPLAY_DOTS", function()
	return F_UFC_LINE6_dots
end, 20, "Front UFC Display", "Line 6 (special characters)")
F_15E:defineString("F_UFC_ACTIVE_UHF1", function()
	return F_UFC_ActiveUHF1
end, 8, "Front UFC Display", "Active UHF 1 (special)")
F_15E:defineString("F_UFC_ACTIVE_UHF2", function()
	return F_UFC_ActiveUHF2
end, 8, "Front UFC Display", "Active UHF 2 (special)")

--HUD Control Panel
F_15E:definePotentiometer("F_HUD_BRIGHT", 55, 3120, 120, { 0, 1 }, "Front HUD Control Panel", "FRONT HUD Brightness Control")
F_15E:defineMultipositionSwitch("F_HUD_SYM_MODE", 55, 3121, 121, 3, 0.5, "Front HUD Control Panel", "FRONT HUD Symbology Reject Mode")
F_15E:define3PosTumb("F_HUD_D_A_N_MODE", 55, 3122, 122, "Front HUD Control Panel", "FRONT HUD DAY/AUTO/NIGHT Mode Selector")
F_15E:definePushButton("F_HUD_BIT", 55, 3123, 123, "Front HUD Control Panel", "FRONT HUD BIT Button")
F_15E:definePotentiometer("F_HUD_VID_BRIGHT", 55, 3124, 124, { 0, 1 }, "Front HUD Control Panel", "FRONT HUD Video Brightness Control")
F_15E:definePotentiometer("F_HUD_CONT", 55, 3125, 125, { 0, 1 }, "Front HUD Control Panel", "FRONT HUD Contrast Control")

F_15E:definePushButton("F_HUD_MM_AA_SEL", 32, 3126, 126, "Front HUD Control Panel", "FRONT HUD A/A Master Mode Selector")
F_15E:definePushButton("F_HUD_MM_AG_SEL", 32, 3127, 127, "Front HUD Control Panel", "FRONT HUD A/G Master Mode Selector")
F_15E:definePushButton("F_HUD_MM_NAV_SEL", 32, 3128, 128, "Front HUD Control Panel", "FRONT HUD NAV Master Mode Selector")
F_15E:definePushButton("F_HUD_MM_INST_SEL", 32, 3129, 129, "Front HUD Control Panel", "FRONT HUD INST Master Mode Selector")

F_15E:defineIndicatorLight("F_HUD_MM_AA_L", 326, "Front HUD Control Panel Lights", "FRONT HUD Master Mode AA Light (white)")
F_15E:defineIndicatorLight("F_HUD_MM_AG_L", 327, "Front HUD Control Panel Lights", "FRONT HUD Master Mode AG Light (white)")
F_15E:defineIndicatorLight("F_HUD_MM_NAV_L", 328, "Front HUD Control Panel Lights", "FRONT HUD Master Mode NAV Light (white)")
F_15E:defineIndicatorLight("F_HUD_MM_INST_L", 329, "Front HUD Control Panel Lights", "FRONT HUD Master Mode INST Light (white)")

--AMAD Panel
F_15E:define3PosTumb("F_AMAD_FIRE_EXT", 15, 3314, 314, "Front AMAD Panel", "FRONT AMAD Fire Extinguisher Switch")
F_15E:defineToggleSwitch("F_AMAD_FIRE_SW_CVR", 15, 3315, 315, "Front AMAD Panel", "FRONT AMAD Fire Switch Cover")
F_15E:defineToggleSwitch("F_AMAD_FIRE_SW", 15, 3316, 316, "Front AMAD Panel", "FRONT AMAD Fire Switch")
F_15E:defineToggleSwitch("F_AMAD_L_ENG_FIRE_SW_CVR", 15, 3317, 317, "Front AMAD Panel", "FRONT AMAD Left Engine Fire Switch Cover")
F_15E:defineToggleSwitch("F_AMAD_L_ENG_FIRE_SW", 15, 3318, 318, "Front AMAD Panel", "FRONT AMAD Left Engine Fire Switch")
F_15E:defineToggleSwitch("F_AMAD_R_ENG_FIRE_SW_CVR", 15, 3319, 319, "Front AMAD Panel", "FRONT AMAD Right Engine Fire Switch Cover")
F_15E:defineToggleSwitch("F_AMAD_R_ENG_FIRE_SW", 15, 3320, 320, "Front AMAD Panel", "FRONT AMAD Right Engine Fire Switch")

F_15E:defineIndicatorLight("F_AMAD_FIRE_L", 130, "Front AMAD Panel Lights", "FRONT AMAD Fire Light (red)")
F_15E:defineIndicatorLight("F_AMAD_L_ENG_FIRE_L", 131, "Front AMAD Panel Lights", "FRONT AMAD Left Engine Fire Light (red)")
F_15E:defineIndicatorLight("F_AMAD_R_ENG_FIRE_L", 132, "Front AMAD Panel Lights", "FRONT AMAD Right Engine Fire Light (red)")
F_15E:defineIndicatorLight("F_AMAD_L_ENG_BURN_L", 133, "Front AMAD Panel Lights", "FRONT AMAD Left Engine Burn Throu Light (red)")
F_15E:defineIndicatorLight("F_AMAD_R_ENG_BURN_L", 134, "Front AMAD Panel Lights", "FRONT AMAD Right Engine Burn Throu Light (red)")

--Armament Panel
F_15E:defineToggleSwitch("F_ARM_MASTER_ARM", 44, 3323, 323, "Front Armament Panel", "FRONT Armament Panel Master Arm")
F_15E:defineTumb("F_ARM_JETT_SEL", 44, 3321, 321, 0.3, { -0.9, 0.9 }, nil, false, "Front Armament Panel", "FRONT Armament Jettison Selector")
F_15E:definePushButton("F_ARM_JETT_BTN", 44, 3322, 322, "Front Armament Panel", "FRONT Armament Jettison Button")
F_15E:definePushButton("F_ARM_EMERG_JETT_BTN", 44, 3340, 340, "Front Armament Panel", "FRONT Armament Emergency Jettison Button")

--Fuel Monitor Panel
F_15E:defineTumb("F_FUEL_TOTAL", 17, 3381, 381, 0.1, { -0.1, 0.5 }, nil, false, "Front Fuel Monitor Panel", "FRONT Fuel Totalizer Selector")
F_15E:defineRotary("F_FUEL_BINGO", 17, 3385, 385, "Front Fuel Monitor Panel", "FRONT Fuel Bingo Selection")

--Landing Gear Panel
F_15E:defineToggleSwitch("F_LG_GEAR", 21, 3324, 324, "Front Landing Gear Panel", "FRONT Landing Gear Lever")
F_15E:definePushButton("F_LG_GEAR_TONE", 29, 3325, 325, "Front Landing Gear Panel", "FRONT Landing Gear Warning Tone Silence Switch")
F_15E:defineToggleSwitch("F_LG_EMERG_GEAR_PULL", 21, 3337, 337, "Front Landing Gear Panel", "FRONT Emergency Landing Gear Handle PUSH/PULL")
F_15E:defineToggleSwitch("F_LG_EMERG_GEAR_ROT", 21, 3431, 431, "Front Landing Gear Panel", "FRONT Emergency Landing Gear Handle ROTATE")
F_15E:defineGatedIndicatorLight("F_LG_NOSE_R_L", 330, 0.1, 0.6, "Front Landing Gear Panel Lights", "FRONT Langing Gear NOSE Light (red)")
F_15E:defineGatedIndicatorLight("F_LG_NOSE_G_L", 330, 0.61, nil, "Front Landing Gear Panel Lights", "FRONT Langing Gear NOSE Light (green)")
F_15E:defineGatedIndicatorLight("F_LG_LEFT_R_L", 331, 0.1, 0.6, "Front Landing Gear Panel Lights", "FRONT Langing Gear LEFT Light (red)")
F_15E:defineGatedIndicatorLight("F_LG_LEFT_G_L", 331, 0.61, nil, "Front Landing Gear Panel Lights", "FRONT Langing Gear LEFT Light (green)")
F_15E:defineGatedIndicatorLight("F_LG_RIGHT_R_L", 332, 0.1, 0.6, "Front Landing Gear Panel Lights", "FRONT Langing Gear RIGHT Light (red)")
F_15E:defineGatedIndicatorLight("F_LG_RIGHT_G_L", 332, 0.61, nil, "Front Landing Gear Panel Lights", "FRONT Langing Gear RIGHT Light (green)")
F_15E:defineIndicatorLight("F_LG_HND_L", 333, "Front Landing Gear Panel Lights", "FRONT Langing Gear Handle Light (red)")

--Flight Instruments
F_15E:defineToggleSwitch("F_FI_PITCH_RATE", 18, 3335, 335, "Front Flight Instruments", "FRONT Pitch Ratio Switch")
F_15E:definePotentiometer("F_FI_BAK_ADI_CAGE_KNOB", 17, 3351, 351, { -1, 1 }, "Front Flight Instruments", "FRONT Backup ADI Cage/Pitch Adjust Knob")
F_15E:definePushButton("F_FI_BAK_ADI_CAGE_PULL", 17, 3350, 350, "Front Flight Instruments", "FRONT Backup ADI Cage/Pitch Adjust Pull")
F_15E:defineRotary("F_FI_ALT_ADJ", 17, 3360, 360, "Front Flight Instruments", "FRONT Altitude Adjust")
F_15E:definePotentiometer("F_FI_CLOCK_ADJ", 17, 3366, 366, { 0, 1 }, "Front Flight Instruments", "FRONT Clock Adjust")
F_15E:definePotentiometer("F_FI_CLOCK_STOP", 17, 3367, 367, { 0, 1 }, "Front Flight Instruments", "FRONT Timer Stop")

F_15E:defineFloat("F_FI_PITCH_RATE_G", 334, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Pitch Ratio Gauge")
F_15E:defineFloat("F_FI_AIRSPEED_G", 345, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Standby Airspeed Indicator")
F_15E:defineFloat("F_FI_AOA_G", 346, { 0, 0.5 }, "Front Flight Instruments Gauges", "FRONT Angle of Attack Indicator")
F_15E:defineFloat("F_FI_SAI_OFF_FLAG_G", 347, { 0, 1 }, "Front Attitute Gauge", "FRONT SAI Off Flag")
F_15E:defineFloat("F_FI_SAI_BANK_G", 348, { -1, 1 }, "Front Attitute Gauge", "FRONT SAI Bank")
F_15E:defineFloat("F_FI_SAI_PITCH_G", 349, { -1, 1 }, "Front Attitute Gauge", "FRONT SAI Pitch")
F_15E:defineFloat("F_FI_SAI_AIRCRAFTREF_G", 351, { -1, 1 }, "Front Attitute Gauge", "FRONT SAI Aircraft Reference Symbol")
F_15E:defineFloat("F_FI_ALT_NEEDLE_G", 352, { 0, 1 }, "Front Altimeter Gauge", "FRONT Altimeter Needle")
F_15E:defineFloat("F_FI_ALT_100_G", 353, { 0, 1 }, "Front Altimeter Gauge", "FRONT Altimeter 100 ft count")
F_15E:defineFloat("F_FI_ALT_1000_G", 354, { 0, 1 }, "Front Altimeter Gauge", "FRONT Altimeter 1000 ft count")
F_15E:defineFloat("F_FI_ALT_10000_G", 355, { 0, 1 }, "Front Altimeter Gauge", "FRONT Altimeter 10000 ft count")
F_15E:defineFloat("F_FI_ALT_PRESS_0_G", 356, { 0, 1 }, "Front Altimeter Gauge", "FRONT Altimeter Pressure Drum 0")
F_15E:defineFloat("F_FI_ALT_PRESS_1_G", 357, { 0, 1 }, "Front Altimeter Gauge", "FRONT Altimeter Pressure Drum 1")
F_15E:defineFloat("F_FI_ALT_PRESS_2_G", 358, { 0, 1 }, "Front Altimeter Gauge", "FRONT Altimeter Pressure Drum 2")
F_15E:defineFloat("F_FI_ALT_PRESS_3_G", 359, { 0, 1 }, "Front Altimeter Gauge", "FRONT Altimeter Pressure Drum 3")
F_15E:defineFloat("F_FI_CAB_PRESS_G", 361, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Cabin Pressure Indicator")
F_15E:defineFloat("F_FI_VVI_G", 362, { -1, 1 }, "Front Flight Instruments Gauges", "FRONT Vertical Velocity Indicator")
F_15E:defineFloat("F_FI_CLOCK_S_G", 363, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Clock Seconds")
F_15E:defineFloat("F_FI_CLOCK_M_G", 364, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Clock Minutes")
F_15E:defineFloat("F_FI_CLOCK_H_G", 365, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Clock Hours")
F_15E:defineFloat("F_FI_HYD_UTIL_G", 388, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Utility Hydraulic Pressure Gauge")
F_15E:defineFloat("F_FI_HYD_PC1_G", 389, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT PC 1 Hydraulic Pressure Gauge")
F_15E:defineFloat("F_FI_HYD_PC2_G", 390, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT PC 2 Hydraulic Pressure Gauge")
F_15E:defineIndicatorLight("F_DTM_CART_G", 60, "Front Flight Instruments Gauges", "FRONT DTM Cartridge")
F_15E:defineFloat("F_DTM_CART_POS_G", 63, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT DTM Cartridge Pos")
F_15E:defineFloat("F_AIRVENT_V_G", 433, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Airvent Position Vertical")
F_15E:defineFloat("F_AIRVENT_H_G", 434, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Airvent Position Horizontal")
F_15E:defineIndicatorLight("F_LIGHT_FILTER_G", 1013, "Front Flight Instruments Gauges", "FRONT Lightfilter")
F_15E:defineFloat("F_COMP_NS_G", 753, { 0, 1 }, "Front Flight Instruments Gauges", "FRONT Compassrose N-S")
F_15E:defineFloat("F_COMP_UD_G", 754, { -1, 1 }, "Front Flight Instruments Gauges", "FRONT Compassrose Up/Down")
F_15E:defineFloat("F_COMP_BANK_G", 755, { -1, 1 }, "Front Flight Instruments Gauges", "FRONT Compassrose Bank")

F_15E:defineIndicatorLight("F_FLAP_Y_L", 338, "Front Flight Instruments Lights", "FRONT FLAP Light (yellow)")
F_15E:defineIndicatorLight("F_FLAP_G_L", 339, "Front Flight Instruments Lights", "FRONT FLAP Light (green)")

--Engine Monitor Display
F_15E:defineFloat("F_EMD_L_RPM_1_G", 1100, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left RPM 1")
F_15E:defineFloat("F_EMD_L_RPM_10_G", 1101, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left RPM 10")
F_15E:defineFloat("F_EMD_L_RPM_100_G", 1102, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left RPM 100")
F_15E:defineFloat("F_EMD_R_RPM_1_G", 1103, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right RPM 1")
F_15E:defineFloat("F_EMD_R_RPM_10_G", 1104, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right RPM 10")
F_15E:defineFloat("F_EMD_R_RPM_100_G", 1105, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right RPM 100")
F_15E:defineFloat("F_EMD_L_TEMP_1_G", 1106, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Temperature 1")
F_15E:defineFloat("F_EMD_L_TEMP_10_G", 1107, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Temperature 10")
F_15E:defineFloat("F_EMD_L_TEMP_100_G", 1108, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Temperature 100")
F_15E:defineFloat("F_EMD_L_TEMP_1000_G", 1109, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Temperature 1000")
F_15E:defineFloat("F_EMD_R_TEMP_1_G", 1110, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Temperature 1")
F_15E:defineFloat("F_EMD_R_TEMP_10_G", 1111, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Temperature 10")
F_15E:defineFloat("F_EMD_R_TEMP_100_G", 1112, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Temperature 100")
F_15E:defineFloat("F_EMD_R_TEMP_1000_G", 1113, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Temperature 1000")
F_15E:defineFloat("F_EMD_L_FUEL_1_G", 1114, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Fuel Flow 1")
F_15E:defineFloat("F_EMD_L_FUEL_10_G", 1115, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Fuel Flow 10")
F_15E:defineFloat("F_EMD_L_FUEL_100_G", 1116, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Fuel Flow 100")
F_15E:defineFloat("F_EMD_L_FUEL_1000_G", 1117, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Fuel Flow 1000")
F_15E:defineFloat("F_EMD_L_FUEL_10000_G", 1118, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Fuel Flow 10000")
F_15E:defineFloat("F_EMD_R_FUEL_1_G", 1119, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Fuel Flow 1")
F_15E:defineFloat("F_EMD_R_FUEL_10_G", 1120, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Fuel Flow 10")
F_15E:defineFloat("F_EMD_R_FUEL_100_G", 1121, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Fuel Flow 100")
F_15E:defineFloat("F_EMD_R_FUEL_1000_G", 1122, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Fuel Flow 1000")
F_15E:defineFloat("F_EMD_R_FUEL_10000_G", 1123, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Fuel Flow 10000")
F_15E:defineFloat("F_EMD_L_OIL_PRESS_1_G", 1124, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Oli Pressure 1")
F_15E:defineFloat("F_EMD_L_OIL_PRESS_10_G", 1125, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Oli Pressure 10")
F_15E:defineFloat("F_EMD_L_OIL_PRESS_100_G", 1126, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Oli Pressure 100")
F_15E:defineFloat("F_EMD_R_OIL_PRESS_1_G", 1127, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Oli Pressure 1")
F_15E:defineFloat("F_EMD_R_OIL_PRESS_10_G", 1128, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Oli Pressure 10")
F_15E:defineFloat("F_EMD_R_OIL_PRESS_100_G", 1129, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Oli Pressure 100")
F_15E:defineFloat("F_EMD_L_NOZZLEPOS_G", 1130, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Left Nozzle Posistion")
F_15E:defineFloat("F_EMD_R_NOZZLEPOS_G", 1131, { 0, 1 }, "Front Engine Monitor Display", "FRONT EMD Right Nozzle Posistion")
F_15E:defineIndicatorLight("F_EMD_ON", 1132, "Front Engine Monitor Display", "FRONT Engine Monitor Display ON")

--Emergency Jettison and Misc Handles
F_15E:defineToggleSwitch("F_HOOK", 21, 3336, 336, "Front Misc", "FRONT Arresting Hook Handle")
F_15E:defineToggleSwitch("F_EMERG_BRAKE_STEER", 21, 3341, 341, "Front Misc", "FRONT Emergency Brake/Steering Handle")
F_15E:definePushButton("F_RUDDER_PED_ADJ", 18, 3342, 342, "Front Misc", "FRONT Rudder Pedal Ajust Handle")
F_15E:defineToggleSwitch("F_EMERG_VENT", 26, 3427, 427, "Front Misc", "FRONT Emergency Vent Handle")
F_15E:definePushButton("F_MASTER_CAUTION_BTN", 29, 3401, 401, "Front Misc", "FRONT Master Caution Button")

--Jet Fuel Starter/Brake Panel
F_15E:definePushButton("F_B_JFS_CONT_PULL", 6, 3386, 386, "Front Brake Panel", "FRONT JFS Control Handle PULL")
F_15E:defineToggleSwitch("F_B_JFS_CONT_ROT", 6, 3430, 430, "Front Brake Panel", "FRONT JFS Control Handle ROTATE")
F_15E:defineToggleSwitch("F_B_P_BRAKE", 21, 3387, 387, "Front Brake Panel", "FRONT Parking Brake Switch")

--LEFT MPD
F_15E:definePushButton("F_MPD_L_B1", 34, 3061, 204, "Front Left MPD", "FRONT Left MPD Push Button 1")
F_15E:definePushButton("F_MPD_L_B2", 34, 3062, 203, "Front Left MPD", "FRONT Left MPD Push Button 2")
F_15E:definePushButton("F_MPD_L_B3", 34, 3063, 202, "Front Left MPD", "FRONT Left MPD Push Button 3")
F_15E:definePushButton("F_MPD_L_B4", 34, 3064, 201, "Front Left MPD", "FRONT Left MPD Push Button 4")
F_15E:definePushButton("F_MPD_L_B5", 34, 3065, 200, "Front Left MPD", "FRONT Left MPD Push Button 5")
F_15E:definePushButton("F_MPD_L_B6", 34, 3066, 219, "Front Left MPD", "FRONT Left MPD Push Button 6")
F_15E:definePushButton("F_MPD_L_B7", 34, 3067, 218, "Front Left MPD", "FRONT Left MPD Push Button 7")
F_15E:definePushButton("F_MPD_L_B8", 34, 3068, 217, "Front Left MPD", "FRONT Left MPD Push Button 8")
F_15E:definePushButton("F_MPD_L_B9", 34, 3069, 216, "Front Left MPD", "FRONT Left MPD Push Button 9")
F_15E:definePushButton("F_MPD_L_B10", 34, 3070, 215, "Front Left MPD", "FRONT Left MPD Push Button 10")
F_15E:definePushButton("F_MPD_L_B11", 34, 3071, 214, "Front Left MPD", "FRONT Left MPD Push Button 11")
F_15E:definePushButton("F_MPD_L_B12", 34, 3072, 213, "Front Left MPD", "FRONT Left MPD Push Button 12")
F_15E:definePushButton("F_MPD_L_B13", 34, 3073, 212, "Front Left MPD", "FRONT Left MPD Push Button 13")
F_15E:definePushButton("F_MPD_L_B14", 34, 3074, 211, "Front Left MPD", "FRONT Left MPD Push Button 14")
F_15E:definePushButton("F_MPD_L_B15", 34, 3075, 210, "Front Left MPD", "FRONT Left MPD Push Button 15")
F_15E:definePushButton("F_MPD_L_B16", 34, 3076, 209, "Front Left MPD", "FRONT Left MPD Push Button 16")
F_15E:definePushButton("F_MPD_L_B17", 34, 3077, 208, "Front Left MPD", "FRONT Left MPD Push Button 17")
F_15E:definePushButton("F_MPD_L_B18", 34, 3078, 207, "Front Left MPD", "FRONT Left MPD Push Button 18")
F_15E:definePushButton("F_MPD_L_B19", 34, 3079, 206, "Front Left MPD", "FRONT Left MPD Push Button 19")
F_15E:definePushButton("F_MPD_L_B20", 34, 3080, 205, "Front Left MPD", "FRONT Left MPD Push Button 20")
F_15E:defineSpringloaded_3PosTumb("F_MPD_L_PW", 34, 3081, 3081, 221, "Front Left MPD", "FRONT Left MPD Power Switch")
F_15E:defineSpringloaded_3PosTumb("F_MPD_L_BRIGHT", 34, 3083, 3083, 222, "Front Left MPD", "FRONT Left MPD Brightness Control")
F_15E:defineSpringloaded_3PosTumb("F_MPD_L_CONT", 34, 3082, 3082, 223, "Front Left MPD", "FRONT Left MPD Contrast Control")

--CENTER MPCD
F_15E:definePushButton("F_MPCD_C_B1", 35, 3061, 251, "Front Center MPCD", "FRONT Center MPCD Push Button 1")
F_15E:definePushButton("F_MPCD_C_B2", 35, 3062, 250, "Front Center MPCD", "FRONT Center MPCD Push Button 2")
F_15E:definePushButton("F_MPCD_C_B3", 35, 3063, 249, "Front Center MPCD", "FRONT Center MPCD Push Button 3")
F_15E:definePushButton("F_MPCD_C_B4", 35, 3064, 248, "Front Center MPCD", "FRONT Center MPCD Push Button 4")
F_15E:definePushButton("F_MPCD_C_B5", 35, 3065, 247, "Front Center MPCD", "FRONT Center MPCD Push Button 5")
F_15E:definePushButton("F_MPCD_C_B6", 35, 3066, 266, "Front Center MPCD", "FRONT Center MPCD Push Button 6")
F_15E:definePushButton("F_MPCD_C_B7", 35, 3067, 265, "Front Center MPCD", "FRONT Center MPCD Push Button 7")
F_15E:definePushButton("F_MPCD_C_B8", 35, 3068, 264, "Front Center MPCD", "FRONT Center MPCD Push Button 8")
F_15E:definePushButton("F_MPCD_C_B9", 35, 3069, 263, "Front Center MPCD", "FRONT Center MPCD Push Button 9")
F_15E:definePushButton("F_MPCD_C_B10", 35, 3070, 262, "Front Center MPCD", "FRONT Center MPCD Push Button 10")
F_15E:definePushButton("F_MPCD_C_B11", 35, 3071, 261, "Front Center MPCD", "FRONT Center MPCD Push Button 11")
F_15E:definePushButton("F_MPCD_C_B12", 35, 3072, 260, "Front Center MPCD", "FRONT Center MPCD Push Button 12")
F_15E:definePushButton("F_MPCD_C_B13", 35, 3073, 259, "Front Center MPCD", "FRONT Center MPCD Push Button 13")
F_15E:definePushButton("F_MPCD_C_B14", 35, 3074, 258, "Front Center MPCD", "FRONT Center MPCD Push Button 14")
F_15E:definePushButton("F_MPCD_C_B15", 35, 3075, 257, "Front Center MPCD", "FRONT Center MPCD Push Button 15")
F_15E:definePushButton("F_MPCD_C_B16", 35, 3076, 256, "Front Center MPCD", "FRONT Center MPCD Push Button 16")
F_15E:definePushButton("F_MPCD_C_B17", 35, 3077, 255, "Front Center MPCD", "FRONT Center MPCD Push Button 17")
F_15E:definePushButton("F_MPCD_C_B18", 35, 3078, 254, "Front Center MPCD", "FRONT Center MPCD Push Button 18")
F_15E:definePushButton("F_MPCD_C_B19", 35, 3079, 253, "Front Center MPCD", "FRONT Center MPCD Push Button 19")
F_15E:definePushButton("F_MPCD_C_B20", 35, 3080, 252, "Front Center MPCD", "FRONT Center MPCD Push Button 20")
F_15E:defineSpringloaded_3PosTumb("F_MPCD_C_PW", 35, 3081, 3081, 267, "Front Center MPCD", "FRONT Center MPCD Power Switch")
F_15E:defineSpringloaded_3PosTumb("F_MPCD_C_BRIGHT", 35, 3083, 3083, 268, "Front Center MPCD", "FRONT Center MPCD Brightness Control")
F_15E:defineSpringloaded_3PosTumb("F_MPCD_C_CONT", 35, 3082, 3082, 269, "Front Center MPCD", "FRONT Center MPCD Contrast Control")

--RIGHT MFD
F_15E:definePushButton("F_MPD_R_B1", 36, 3061, 228, "Front Right MPD", "FRONT Right MPD Push Button 1")
F_15E:definePushButton("F_MPD_R_B2", 36, 3062, 227, "Front Right MPD", "FRONT Right MPD Push Button 2")
F_15E:definePushButton("F_MPD_R_B3", 36, 3063, 226, "Front Right MPD", "FRONT Right MPD Push Button 3")
F_15E:definePushButton("F_MPD_R_B4", 36, 3064, 225, "Front Right MPD", "FRONT Right MPD Push Button 4")
F_15E:definePushButton("F_MPD_R_B5", 36, 3065, 224, "Front Right MPD", "FRONT Right MPD Push Button 5")
F_15E:definePushButton("F_MPD_R_B6", 36, 3066, 243, "Front Right MPD", "FRONT Right MPD Push Button 6")
F_15E:definePushButton("F_MPD_R_B7", 36, 3067, 242, "Front Right MPD", "FRONT Right MPD Push Button 7")
F_15E:definePushButton("F_MPD_R_B8", 36, 3068, 241, "Front Right MPD", "FRONT Right MPD Push Button 8")
F_15E:definePushButton("F_MPD_R_B9", 36, 3069, 240, "Front Right MPD", "FRONT Right MPD Push Button 9")
F_15E:definePushButton("F_MPD_R_B10", 36, 3070, 239, "Front Right MPD", "FRONT Right MPD Push Button 10")
F_15E:definePushButton("F_MPD_R_B11", 36, 3071, 238, "Front Right MPD", "FRONT Right MPD Push Button 11")
F_15E:definePushButton("F_MPD_R_B12", 36, 3072, 237, "Front Right MPD", "FRONT Right MPD Push Button 12")
F_15E:definePushButton("F_MPD_R_B13", 36, 3073, 236, "Front Right MPD", "FRONT Right MPD Push Button 13")
F_15E:definePushButton("F_MPD_R_B14", 36, 3074, 235, "Front Right MPD", "FRONT Right MPD Push Button 14")
F_15E:definePushButton("F_MPD_R_B15", 36, 3075, 234, "Front Right MPD", "FRONT Right MPD Push Button 15")
F_15E:definePushButton("F_MPD_R_B16", 36, 3076, 233, "Front Right MPD", "FRONT Right MPD Push Button 16")
F_15E:definePushButton("F_MPD_R_B17", 36, 3077, 232, "Front Right MPD", "FRONT Right MPD Push Button 17")
F_15E:definePushButton("F_MPD_R_B18", 36, 3078, 231, "Front Right MPD", "FRONT Right MPD Push Button 18")
F_15E:definePushButton("F_MPD_R_B19", 36, 3079, 230, "Front Right MPD", "FRONT Right MPD Push Button 19")
F_15E:definePushButton("F_MPD_R_B20", 36, 3080, 229, "Front Right MPD", "FRONT Right MPD Push Button 20")
F_15E:defineSpringloaded_3PosTumb("F_MPD_R_PW", 36, 3081, 3081, 244, "Front Right MPD", "FRONT Right MPD Power Switch")
F_15E:defineSpringloaded_3PosTumb("F_MPD_R_BRIGHT", 36, 3083, 3083, 245, "Front Right MPD", "FRONT Right MPD Brightness Control")
F_15E:defineSpringloaded_3PosTumb("F_MPD_R_CONT", 36, 3082, 3082, 246, "Front Right MPD", "FRONT Right MPD Contrast Control")

---LEFT INSTRUMENTS PANEL
--NUC
F_15E:defineToggleSwitch("F_NUC_N_CONS_CVR", 17, 3450, 450, "Front NUC", "FRONT Nuclear Consent Switch Cover")
F_15E:define3PosTumb("F_NUC_N_CONS_SWITCH", 17, 3451, 451, "Front NUC", "FRONT Nuclear Consent Switch")

--CAS
F_15E:defineMultipositionSwitch("F_CAS_YAW", 18, 3452, 452, 3, 0.25, "Front CAS", "FRONT Yaw CAS Switch")
F_15E:defineMultipositionSwitch("F_CAS_ROLL", 18, 3453, 453, 3, 0.25, "Front CAS", "FRONT Roll CAS Switch")
F_15E:defineMultipositionSwitch("F_CAS_PITCH", 18, 3454, 454, 3, 0.25, "Front CAS", "FRONT Pitch CAS Switch")
F_15E:definePushButton("F_CAS_BIT", 18, 3455, 455, "Front CAS", "FRONT CAS BIT Button")
F_15E:defineToggleSwitch("F_CAS_TF_COUP", 65, 3456, 456, "Front CAS", "FRONT CAS TF Couple Switch")
F_15E:definePushButton("F_CAS_TO_TRIM", 18, 3457, 457, "Front CAS", "FRONT CAS T/O Trim Button")

F_15E:defineIndicatorLight("F_CAS_TRIM_L", 458, "Front CAS Lights", "FRONT CAS Trim Light (green)")

--MISC
F_15E:defineToggleSwitch("F_ROLL_RATE", 18, 3534, 534, "Front Misc", "FRONT Roll Ratio Switch")
F_15E:defineToggleSwitch("F_IN_RAMP_L_SW", 15, 3535, 535, "Front Misc", "FRONT Left Inlet Ramp Switch")
F_15E:defineToggleSwitch("F_IN_RAMP_R_SW", 15, 3536, 536, "Front Misc", "FRONT Right Inlet Ramp Switch")
F_15E:defineMultipositionSwitch("F_ANTI_SKID", 21, 3537, 537, 3, 0.5, "Front Misc", "FRONT Anti Skid Switch")

--FUEL
F_15E:define3PosTumb("F_FUEL_W_CONTL", 16, 3527, 527, "Front Fuel", "FRONT Fuel Control: Wing Tanks")
F_15E:define3PosTumb("F_FUEL_CENT_CONTL", 16, 3528, 528, "Front Fuel", "FRONT Fuel Control: Centerline Tanks")
F_15E:define3PosTumb("F_FUEL_CONF_CONTL", 16, 3529, 529, "Front Fuel", "FRONT Fuel Control: Conformal Tanks")
F_15E:defineToggleSwitch("F_FUEL_DUMP", 16, 3530, 530, "Front Fuel", "FRONT Fuel Dump")
F_15E:define3PosTumb("F_FUEL_CONF_EMG_TRANS", 16, 3531, 531, "Front Fuel", "FRONT Fuel Conformal Tanks Emergency Transfer")
F_15E:defineToggleSwitch("F_FUEL_EXT_TRANS", 16, 3532, 532, "Front Fuel", "FRONT External Fuel Transfer")
F_15E:defineMultipositionSwitch("F_FUEL_AR_SLIP", 16, 3533, 533, 3, 0.5, "Front Fuel", "FRONT Fuel A/R Slipway")

F_15E:defineFloat("F_FUEL_TOTAL_10K_G", 368, { 0, 1 }, "Front Fuel Gauges", "FRONT Fuel Totalizer Counter 10K")
F_15E:defineFloat("F_FUEL_TOTAL_1K_G", 369, { 0, 1 }, "Front Fuel Gauges", "FRONT Fuel Totalizer Counter 1K")
F_15E:defineFloat("F_FUEL_TOTAL_100_G", 370, { 0, 1 }, "Front Fuel Gauges", "FRONT Fuel Totalizer Counter 100")
F_15E:defineFloat("F_FUEL_COUNT_L_1K_G", 373, { 0, 1 }, "Front Fuel Gauges", "FRONT Left Fuel Counter 1K")
F_15E:defineFloat("F_FUEL_COUNT_L_100_G", 374, { 0, 1 }, "Front Fuel Gauges", "FRONT Left Fuel Counter 100")
F_15E:defineFloat("F_FUEL_COUNT_R_1K_G", 377, { 0, 1 }, "Front Fuel Gauges", "FRONT Right Fuel Counter 1K")
F_15E:defineFloat("F_FUEL_COUNT_R_100_G", 378, { 0, 1 }, "Front Fuel Gauges", "FRONT Right Fuel Counter 100")
F_15E:defineFloat("F_FUEL_OFF_FLAG_G", 382, { 0, 1 }, "Front Fuel Gauges", "FRONT Fuel OFF Flag")
F_15E:defineFloat("F_FUEL_NEEDLE_G", 383, { 0, 1 }, "Front Fuel Gauges", "FRONT Fuel Needle")
F_15E:defineFloat("F_FUEL_ARROW_G", 383, { 0, 1 }, "Front Fuel Gauges", "FRONT Fuel Arrow")

--Throttle Quadrant
F_15E:defineToggleSwitch("F_TQ_FLAP_CONTL", 18, 3459, 459, "Front Throttle Quadrant", "FRONT Throttle Flaps Control Switch")
F_15E:define3PosTumb("F_TQ_RDR_TRIM", 18, 3460, 460, "Front Throttle Quadrant", "FRONT Throttle Rudder Trim Switch")
F_15E:definePushButton("F_TQ_L_FINGER", 15, 3697, 697, "Front Throttle Quadrant", "FRONT Throttle Left Throttle Finger Lift")
F_15E:definePushButton("F_TQ_R_FINGER", 15, 3698, 698, "Front Throttle Quadrant", "FRONT Throttle Right Throttle Finger Lift")

--VOL
F_15E:definePotentiometer("F_VOL_CAUTION", 59, 3501, 502, { 0, 1 }, "Front Volume", "FRONT Caution Volume")
F_15E:definePotentiometer("F_VOL_LAUNCH", 59, 3502, 503, { 0, 1 }, "Front Volume", "FRONT Launch Volume")
F_15E:definePotentiometer("F_VOL_ICS", 13, 3503, 504, { 0, 1 }, "Front Volume", "FRONT ICS Volume")
F_15E:definePotentiometer("F_VOL_WPN", 13, 3504, 505, { 0, 1 }, "Front Volume", "FRONT WPN Volume")
F_15E:definePotentiometer("F_VOL_ILS", 11, 3505, 506, { 0, 1 }, "Front Volume", "FRONT ILS Volume")
F_15E:definePotentiometer("F_VOL_TCN", 10, 3506, 507, { 0, 1 }, "Front Volume", "FRONT TACAN Volume")

--MICS
F_15E:define3PosTumb("F_MIC_CRYPT", 68, 3508, 508, "Front MICS", "FRONT MICS Crypto Switch")
F_15E:defineMultipositionSwitch("F_MIC_SW", 13, 3509, 509, 3, 0.5, "Front MICS", "FRONT MIC Switch")
F_15E:definePushButton("F_MIC_VW_SILENT", 29, 3510, 510, "Front MICS", "FRONT MICS VW/Tone Silence Switch")
--F_15E:definePushButton("F_DMT_BTN", X, 3XXX, 59, "Front MICS", "FRONT DMT Button")

--RADIO
F_15E:defineToggleSwitch("F_R_UHF_ANT", 17, 3511, 511, "Front Radio", "FRONT Radio UHF Antenna Switch")
F_15E:defineToggleSwitch("F_R_VHF_ANT", 17, 3512, 512, "Front Radio", "FRONT Radio VHF Antenna Switch")
F_15E:defineToggleSwitch("F_R_TONE", 17, 3513, 513, "Front Radio", "FRONT Radio Tone Switch")
F_15E:defineToggleSwitch("F_R_CYP_TXT", 68, 3514, 514, "Front Radio", "FRONT Radio Cypher Text Switch")

--IFF
F_15E:define3PosTumb("F_IFF_MODE", 68, 3515, 515, "Front IFF", "FRONT IFF Mode Switch")
F_15E:defineMultipositionSwitch("F_IFF_REPLY", 68, 3516, 516, 3, 0.5, "Front IFF", "FRONT IFF Reply Switch")
F_15E:define3PosTumb("F_IFF_MASTER", 68, 3517, 517, "Front IFF", "FRONT IFF Master Switch")

F_15E:defineIndicatorLight("F_IFF_REPLY_L", 541, "Front IFF Lights", "FRONT IFF REPLY Light (white)")

--EXT LT
F_15E:define3PosTumb("F_EXTL_LAND_TAXI", 22, 3538, 538, "Front External Lights Panel", "FRONT Landing/Taxi Light Switch")
F_15E:defineMultipositionSwitch("F_EXTL_FORMATION", 22, 3465, 465, 7, 0.17, "Front External Lights Panel", "FRONT Formation Lights Knob")
F_15E:defineToggleSwitch("F_EXTL_ANTI_COL", 22, 3466, 466, "Front External Lights Panel", "FRONT Anti Collison Light Switch")
F_15E:defineMultipositionSwitch("F_EXTL_POS", 22, 3467, 467, 7, 0.17, "Front External Lights Panel", "FRONT Position Lights Knob")
F_15E:defineMultipositionSwitch("F_EXTL_T_FLOOD", 22, 3468, 468, 3, 0.5, "Front External Lights Panel", "FRONT Tail Flood Lights Knob")

--SENSOR
F_15E:defineMultipositionSwitch("F_S_RDR_TER_FOL", 65, 3469, 469, 3, 0.5, "Front Sensor", "FRONT Terrrain Follow Radar Switch")
F_15E:defineMultipositionSwitch("F_S_RDR_ALT", 67, 3470, 470, 3, 0.5, "Front Sensor", "FRONT Radar Altitude Switch")
F_15E:defineMultipositionSwitch("F_S_RDR_MODE", 3, 3471, 471, 4, 0.33, "Front Sensor", "FRONT Radar Mode Selector")
F_15E:defineMultipositionSwitch("F_S_INS", 42, 3472, 472, 4, 0.33, "Front Sensor", "FRONT INS Knob")
F_15E:definePotentiometer("F_S_NAV_FLIR_GAIN", 50, 3473, 473, { 0, 1 }, "Front Sensor", "FRONT Nav FLIR Gain")
F_15E:definePotentiometer("F_S_NAV_FLIR_LVL", 50, 3474, 474, { 0, 1 }, "Front Sensor", "FRONT Nav FLIR Level")
F_15E:defineMultipositionSwitch("F_S_NAV_FLIR_SW", 50, 3475, 475, 3, 0.5, "Front Sensor", "FRONT Nav FLIR Switch")
F_15E:defineMultipositionSwitch("F_S_JTIDS", 1, 3476, 476, 5, 0.25, "Front Sensor", "FRONT JTIDS Knob")
F_15E:definePushButton("F_S_CC_RESET", 1, 3477, 477, "Front Sensor", "FRONT CC Reset")

--Ground Power
F_15E:defineToggleSwitch("F_GP_SW2", 6, 3478, 478, "Front Ground Power", "FRONT Ground Power 2 Switch")
F_15E:defineToggleSwitch("F_GP_SW3", 6, 3479, 479, "Front Ground Power", "FRONT Ground Power 3 Switch")
F_15E:defineToggleSwitch("F_GP_SW4", 6, 3480, 480, "Front Ground Power", "FRONT Ground Power 4 Switch")
F_15E:define3PosTumb("F_GP_PACS", 6, 3481, 481, "Front Ground Power", "FRONT PACS Switch")
F_15E:define3PosTumb("F_GP_SW1", 6, 3483, 483, "Front Ground Power", "FRONT Ground Power 1 Switch")
F_15E:define3PosTumb("F_GP_MPDP", 6, 3484, 484, "Front Ground Power", "FRONT MPDP/A1U Switch")

---LEFT BULKHEAD PANEL
F_15E:defineToggleSwitch("F_BH_ARMSAFE_OVER", 17, 3485, 485, "Front Left Bulkhead Panel", "FRONT Armament Safety Override Switch")
F_15E:defineToggleSwitch("F_BH_EMERG_AR_CVR", 16, 3539, 539, "Front Left Bulkhead Panel", "FRONT Emergency A/R Switch Cover")
F_15E:defineToggleSwitch("F_BH_EMERG_AR", 16, 3540, 540, "Front Left Bulkhead Panel", "FRONT Emergency A/R Switch")
F_15E:defineToggleSwitch("F_BH_EWWS_CVR", 17, 3518, 518, "Front Left Bulkhead Panel", "FRONT EWWS Enable Switch Cover")
F_15E:defineToggleSwitch("F_BH_EWWS", 17, 3519, 519, "Front Left Bulkhead Panel", "FRONT EWWS Enable Switch")
F_15E:define3PosTumb("F_BH_IFF_ANT", 68, 3520, 520, "Front Left Bulkhead Panel", "FRONT IFF Antenna Select Switch")
F_15E:reserveIntValue(2)
F_15E:defineToggleSwitch("F_BH_FLYUP_CVR", 65, 3522, 522, "Front Left Bulkhead Panel", "FRONT Flyup Enable Switch Cover")
F_15E:defineToggleSwitch("F_BH_FLYUP", 65, 3523, 523, "Front Left Bulkhead Panel", "FRONT Flyup Enable Switch")
F_15E:defineToggleSwitch("F_BH_NCTR", 3, 3524, 524, "Front Left Bulkhead Panel", "FRONT NCTR AUTO EID Enable Switch")
F_15E:define3PosTumb("F_BH_SEAT_ADJ", 24, 3521, 521, "Front Left Bulkhead Panel", "FRONT Seat Adjust Switch")
F_15E:defineToggleSwitch("F_BH_VMAX_CVR", 15, 3525, 525, "Front Left Bulkhead Panel", "FRONT VMAX Switch Cover")
F_15E:defineToggleSwitch("F_BH_VMAX", 15, 3526, 526, "Front Left Bulkhead Panel", "FRONT VMAX Switch")
F_15E:defineToggleSwitch("F_BH_SEAT_ARM", 24, 3800, 800, "Front Left Bulkhead Panel", "FRONT Seat Arm Handle")

---RIGHT INSTRUMENTS PANEL
--OXYGEN
F_15E:define3PosTumb("F_OXY_TEST", 26, 3551, 551, "Front Oxygen Control Panel", "FRONT Oxygen Emergency/Normal/Test Switch")
F_15E:defineToggleSwitch("F_OXY_NORM_100", 26, 3552, 552, "Front Oxygen Control Panel", "FRONT Oxygen 100%/Normal Switch")
F_15E:defineMultipositionSwitch("F_OXY_MODE", 26, 3553, 553, 3, 0.5, "Front Oxygen Control Panel", "FRONT Oxygen Supply/Mode Control Switch")

F_15E:defineFloat("F_OXY_NEEDLE_G", 554, { 0, 1 }, "Front Oxygen Control Panel Gauges", "FRONT Oxygen Pressure Needle")
F_15E:defineFloat("F_OXY_FLOW_G", 555, { 0, 1 }, "Front Oxygen Control Panel Gauges", "FRONT Oxygen FLOW Indicator")

F_15E:defineIndicatorLight("F_OXY_FLOW_L", 555, "Front Oxygen Control Panel Lights", "FRONT Oxygen FLOW Indicator as Light (white)")

--ECS
F_15E:defineToggleSwitch("F_ECS_OXY_TEST", 26, 3556, 556, "Front ECS Panel", "FRONT Oxygen TEST")
F_15E:defineMultipositionSwitch("F_ECS_ANTI_FOG", 26, 3558, 558, 3, 0.5, "Front ECS Panel", "FRONT Anti-Fog")

--ENGINE
F_15E:defineToggleSwitch("F_ENG_L_CONTL", 15, 3590, 590, "Front Engine Panel", "FRONT Left Engine Control Switch")
F_15E:defineToggleSwitch("F_ENG_R_CONTL", 15, 3591, 591, "Front Engine Panel", "FRONT Right Engine Control Switch")
F_15E:defineToggleSwitch("F_ENG_L_MASTER_CVR", 15, 3592, 592, "Front Engine Panel", "FRONT Left Engine Master Switch Cover")
F_15E:defineToggleSwitch("F_ENG_L_MASTER", 15, 3593, 593, "Front Engine Panel", "FRONT Left Engine Master Switch")
F_15E:defineToggleSwitch("F_ENG_R_MASTER_CVR", 15, 3597, 597, "Front Engine Panel", "FRONT Right Engine Master Switch Cover")
F_15E:defineToggleSwitch("F_ENG_R_MASTER", 15, 3598, 598, "Front Engine Panel", "FRONT Right Engine Master Switch")

--Generators
F_15E:defineToggleSwitch("F_GEN_L", 6, 3587, 587, "Front Generators", "FRONT Left Generator")
F_15E:defineToggleSwitch("F_GEN_R", 6, 3588, 588, "Front Generators", "FRONT Right Generator")
F_15E:defineMultipositionSwitch("F_GEN_EMERG", 6, 3589, 589, 3, 0.5, "Front Generators", "FRONT Emergency Generator")
F_15E:define3PosTumb("F_GEN_EXT_PW", 6, 3594, 594, "Front Generators", "FRONT External Power Switch")
F_15E:defineToggleSwitch("F_GEN_JET_START", 6, 3595, 595, "Front Generators", "FRONT Jet Starter")

F_15E:defineIndicatorLight("F_GEN_STARTER_L", 596, "Front Generators Lights", "FRONT Starter Ready Light (green)")

--ANTI ICE
F_15E:defineToggleSwitch("F_AICE_WIND", 26, 3559, 559, "Front Anti Ice", "FRONT Windshield Anti-ice Switch")
F_15E:defineToggleSwitch("F_AICE_PITOT", 26, 3560, 560, "Front Anti Ice", "FRONT Pitot Heat Switch")
F_15E:define3PosTumb("F_AICE_ENG", 26, 3561, 561, "Front Anti Ice", "FRONT Engine Heat Switch")

--AIR COND
F_15E:defineMultipositionSwitch("F_AC_AUTO_MAN_OFF", 26, 3562, 562, 3, 0.5, "Front Air Condition", "FRONT Air Condition Auto/Manual/Off")
F_15E:defineMultipositionSwitch("F_AC_MAX_NORM_MIN", 26, 3563, 563, 3, 0.5, "Front Air Condition", "FRONT Air Condition Max/Norm/Min")
F_15E:definePotentiometer("F_AC_COLD_HOT", 26, 3564, 564, { 0, 1 }, "Front Air Condition", "FRONT Air Condition Cold/Hot")
F_15E:defineMultipositionSwitch("F_AC_SOURCE", 26, 3565, 565, 4, 0.25, "Front Air Condition", "FRONT Air Conditioning Source")

--INT LT
F_15E:definePotentiometer("F_INTL_CONSOLE", 23, 3566, 566, { 0, 1 }, "Front Internal Lights Panel", "FRONT Console Lights")
F_15E:definePotentiometer("F_INTL_INSTR", 23, 3567, 567, { 0, 1 }, "Front Internal Lights Panel", "FRONT Instruments Panel Lights")
F_15E:definePotentiometer("F_INTL_BACK", 23, 3568, 568, { 0, 1 }, "Front Internal Lights Panel", "FRONT Gauges/UFC Backlights")
F_15E:definePushButton("F_INTL_WARN_TEST", 23, 3569, 569, "Front Internal Lights Panel", "FRONT Warning/Caution Lights Test")
F_15E:defineToggleSwitch("F_INTL_COMPASS", 23, 3570, 570, "Front Internal Lights Panel", "FRONT Compass Lights")
F_15E:defineToggleSwitch("F_INTL_DN_MODE", 23, 3571, 571, "Front Internal Lights Panel", "FRONT Day/Night Mode Selector")
F_15E:definePotentiometer("F_INTL_CHARTS", 23, 3572, 572, { 0, 1 }, "Front Internal Lights Panel", "FRONT Charts Spot Light")
F_15E:definePotentiometer("F_INTL_WARN", 23, 3573, 573, { 0, 1 }, "Front Internal Lights Panel", "FRONT Warning/Caution Lights")
F_15E:definePushButton("F_INTL_WARN_RESET", 23, 3473, 573, "Front Internal Lights Panel", "FRONT Warning/Caution Lights Reset")
F_15E:definePotentiometer("F_INTL_STORM", 23, 3574, 574, { 0, 1 }, "Front Internal Lights Panel", "FRONT Storm FLood Lights")
F_15E:definePotentiometer("F_INTL_CHART", 23, 3575, 186, { 0, 1 }, "Front Internal Lights Panel", "FRONT Chart Spot Lamp")

F_15E:defineFloat("F_INTL_UFC_BL_FL", 178, { 0, 1 }, "Front Internal Lights", "FRONT UFC Backlight (red)")
F_15E:defineFloat("F_INTL_FRONT_FL", 179, { 0, 1 }, "Front Internal Lights", "FRONT Front Panel Backlight (white)")
F_15E:defineFloat("F_INTL_FLOOD_G_FL", 180, { 0, 1 }, "Front Internal Lights", "FRONT Flood Light (green)")
F_15E:defineFloat("F_INTL_IND_FL", 181, { 0, 1 }, "Front Internal Lights", "FRONT Indicator Lights (multi)")
F_15E:defineFloat("F_INTL_INSTR_FL", 182, { 0, 1 }, "Front Internal Lights", "FRONT Instrument Light (white)")
F_15E:defineFloat("F_INTL_PANEL_FL", 183, { 0, 1 }, "Front Internal Lights", "FRONT Panel Light (white)")
F_15E:defineFloat("F_INTL_COMP_FL", 184, { 0, 1 }, "Front Internal Lights", "FRONT Compass Light (white)")
F_15E:defineFloat("F_INTL_CAN_FL", 185, { 0, 1 }, "Front Internal Lights", "FRONT Canopy Lamp (green)")

---CANOPY
F_15E:defineTumb("CANOPY_F_HND", 24, 3599, 599, 0.5, { -0.5, 1 }, nil, false, "Canopy", "FRONT Canopy Handle")
F_15E:defineTumb("CANOPY_R_HND", 24, 3600, 1479, 0.5, { -0.5, 1 }, nil, false, "Canopy", "REAR Canopy Handle")
F_15E:defineToggleSwitch("CANOPY_F_EMRG_JETT", 24, 3428, 428, "Canopy", "FRONT Emergency Canopy Jettison")
F_15E:defineToggleSwitch("CANOPY_R_EMRG_JETT", 24, 3385, 1385, "Canopy", "REAR Emergency Canopy Jettison")
F_15E:defineMultipositionSwitch("CANOPY_R_EJECT_SEL", 24, 3386, 1386, 3, 0.5, "Canopy", "REAR Eject Selector Handle")

F_15E:defineFloat("CANOPY_POS", 38, { 0, 1 }, "Canopy Gauges", "Canopy Position")
F_15E:defineFloat("CANOPY_LAMP_F_POS", 186, { -1, 1 }, "Canopy Gauges", "FRONT Canopy Lamp Position")
F_15E:defineFloat("CANOPY_LAMP_R_POS", 188, { -1, 1 }, "Canopy Gauges", "REAR Canopy Lamp Position")

F_15E:defineFloat("CANOPY_F_LOCK_FL", 195, { 0, 1 }, "Canopy Lights", "FRONT LOCK / SHOOT Lights Brightness (yellow)")
F_15E:defineIndicatorLight("CANOPY_F_LOCK_L", 196, "Canopy Lights", "FRONT LOCK / SHOOT Lights (yellow)")
F_15E:defineIndicatorLight("CANOPY_F_AAR_L", 197, "Canopy Lights", "FRONT Refuel Ready Light (green)")

----REAR COCKPIT
---MAIN INSTRUMENTS PANEL

--Flight Instruments
F_15E:definePushButton("R_FI_MASTER_CATION", 29, 3176, 1176, "Rear Flight Instruments", "REAR Master Caution Button")
F_15E:definePotentiometer("R_FI_BAK_ADI_CAGE_KNOB", 17, 3402, 1355, { 0, 1 }, "Rear Flight Instruments", "REAR Backup ADI Cage/Pitch Adjust Knob")
F_15E:definePushButton("R_FI_BAK_ADI_CAGE_PULL", 17, 3401, 1354, "Rear Flight Instruments", "REAR Backup ADI Cage/Pitch Adjust Pull")
F_15E:definePotentiometer("R_FI_ALT_ADJ", 17, 3403, 1364, { 0, 1 }, "Rear Flight Instruments", "REAR Altitude adjust")
F_15E:definePotentiometer("R_FI_CLOCK_ADJ", 17, 3404, 1382, { 0, 1 }, "Rear Flight Instruments", "REAR Clock adjust")
F_15E:definePotentiometer("R_FI_CLOCK_STOP", 17, 3405, 1383, { 0, 1 }, "Rear Flight Instruments", "REAR Timer Stop")

F_15E:defineIndicatorLight("R_LIGHT_FILTER_G", 1014, "Rear Flight Instruments Gauges", "REAR Lightfilter")

F_15E:defineFloat("R_FI_CAB_PRESS_G", 1349, { 0, 1 }, "Rear Flight Instruments Gauges", "REAR Cabin Pressure Indicator")
F_15E:defineFloat("R_FI_AIRSPEED_G", 1350, { 0, 1 }, "Rear Flight Instruments Gauges", "REAR Standby Airspeed Indicator")
F_15E:defineFloat("R_FI_SAI_OFF_FLAG_G", 1351, { 0, 1 }, "Rear Attitute Gauge", "REAR SAI Off Flag")
F_15E:defineFloat("R_FI_SAI_BANK_G", 1352, { -1, 1 }, "Rear Attitute Gauge", "REAR SAI Bank")
F_15E:defineFloat("R_FI_SAI_PITCH_G", 1353, { -1, 1 }, "Rear Attitute Gauge", "REAR SAI Pitch")
F_15E:defineFloat("R_FI_SAI_AIRCRAFTREF_G", 1355, { -1, 1 }, "Rear Attitute Gauge", "REAR SAI Aircraft Reference Symbol")

F_15E:defineFloat("R_FI_ALT_NEEDLE_G", 1357, { 0, 1 }, "Rear Altimeter Gauge", "REAR Altimeter Needle")
F_15E:defineFloat("R_FI_ALT_100_G", 1357, { 0, 1 }, "Rear Altimeter Gauge", "REAR Altimeter 100 ft count")
F_15E:defineFloat("R_FI_ALT_1000_G", 1358, { 0, 1 }, "Rear Altimeter Gauge", "REAR Altimeter 1000 ft count")
F_15E:defineFloat("R_FI_ALT_10000_G", 1359, { 0, 1 }, "Rear Altimeter Gauge", "REAR Altimeter 10000 ft count")
F_15E:defineFloat("R_FI_ALT_PRESS_0_G", 1360, { 0, 1 }, "Rear Altimeter Gauge", "REAR Altimeter Pressure Drum 0")
F_15E:defineFloat("R_FI_ALT_PRESS_1_G", 1361, { 0, 1 }, "Rear Altimeter Gauge", "REAR Altimeter Pressure Drum 1")
F_15E:defineFloat("R_FI_ALT_PRESS_2_G", 1362, { 0, 1 }, "Rear Altimeter Gauge", "REAR Altimeter Pressure Drum 2")
F_15E:defineFloat("R_FI_ALT_PRESS_3_G", 1363, { 0, 1 }, "Rear Altimeter Gauge", "REAR Altimeter Pressure Drum 3")
F_15E:defineFloat("R_FI_VVI_G", 1365, { -1, 1 }, "Rear Flight Instruments Gauges", "REAR Vertical Velocity Indicator")
F_15E:defineFloat("R_FUEL_NEEDLE_G", 1372, { 0, 1 }, "Rear Fuel Gauges", "REAR Fuel Needle")
F_15E:defineFloat("R_FUEL_TOTAL_10K_G", 1374, { 0, 1 }, "Rear Fuel Gauges", "REAR Fuel Totalizer Counter 10K")
F_15E:defineFloat("R_FUEL_TOTAL_1K_G", 1375, { 0, 1 }, "Rear Fuel Gauges", "REAR Fuel Totalizer Counter 1K")
F_15E:defineFloat("R_FUEL_TOTAL_100_G", 1376, { 0, 1 }, "Rear Fuel Gauges", "REAR Fuel Totalizer Counter 100")
F_15E:defineFloat("R_FI_CLOCK_S_G", 1379, { 0, 1 }, "Rear Flight Instruments Gauges", "REAR Clock Seconds")
F_15E:defineFloat("R_FI_CLOCK_M_G", 1380, { 0, 1 }, "Rear Flight Instruments Gauges", "REAR Clock Minutes")
F_15E:defineFloat("R_FI_CLOCK_H_G", 1381, { 0, 1 }, "Rear Flight Instruments Gauges", "REAR Clock Hours")
F_15E:defineFloat("R_AIRVENT_V_G", 1387, { 0, 1 }, "Rear Flight Instruments Gauges", "REAR Airvent Position Vertical")
F_15E:defineFloat("R_AIRVENT_H_G", 1388, { 0, 1 }, "Rear Flight Instruments Gauges", "REAR Airvent Position Horizontal")

F_15E:defineIndicatorLight("R_HUD_MM_AA_L", 1333, "Rear Flight Instruments Lights", "REAR HUD Master Mode AA Light (white)")
F_15E:defineIndicatorLight("R_HUD_MM_AG_L", 1334, "Rear Flight Instruments Lights", "REAR HUD Master Mode AG Light (white)")
F_15E:defineIndicatorLight("R_HUD_MM_NAV_L", 1335, "Rear Flight Instruments Lights", "REAR HUD Master Mode NAV Light (white)")
F_15E:defineIndicatorLight("R_HUD_MM_INST_L", 1336, "Rear Flight Instruments Lights", "REAR HUD Master Mode INST Light (white)")
F_15E:defineIndicatorLight("R_LG_NOSE_L", 1337, "Rear Flight Instruments Lights", "REAR Langing Gear NOSE Light (green)")
F_15E:defineIndicatorLight("R_LG_LEFT_L", 1338, "Rear Flight Instruments Lights", "REAR Langing Gear LEFT Light (green)")
F_15E:defineIndicatorLight("R_LG_RIGHT_L", 1339, "Rear Flight Instruments Lights", "REAR Langing Gear RIGHT Light (green)")
F_15E:defineIndicatorLight("R_LG_UNSAFE_L", 1340, "Rear Flight Instruments Lights", "REAR Langing Gear UNSAFE Light (yellow)")
F_15E:defineIndicatorLight("R_FLAP_Y_L", 1343, "Rear Flight Instruments Lights", "REAR FLAP Light (yellow)")
F_15E:defineIndicatorLight("R_FLAP_G_L", 1344, "Rear Flight Instruments Lights", "REAR FLAP Light (green)")

--UFC Panel
F_15E:definePushButton("R_UFC_B1", 57, 3001, 1293, "Rear UFC", "REAR UFC Push Button 1")
F_15E:definePushButton("R_UFC_B2", 57, 3002, 1294, "Rear UFC", "REAR UFC Push Button 2")
F_15E:definePushButton("R_UFC_B3", 57, 3003, 1295, "Rear UFC", "REAR UFC Push Button 3")
F_15E:definePushButton("R_UFC_B4", 57, 3004, 1296, "Rear UFC", "REAR UFC Push Button 4")
F_15E:definePushButton("R_UFC_B5", 57, 3005, 1297, "Rear UFC", "REAR UFC Push Button 5")
F_15E:definePushButton("R_UFC_B10", 57, 3010, 1298, "Rear UFC", "REAR UFC Push Button 10")
F_15E:definePushButton("R_UFC_B9", 57, 3009, 1299, "Rear UFC", "REAR UFC Push Button 9")
F_15E:definePushButton("R_UFC_B8", 57, 3008, 1300, "Rear UFC", "REAR UFC Push Button 8")
F_15E:definePushButton("R_UFC_B7", 57, 3007, 1301, "Rear UFC", "REAR UFC Push Button 7")
F_15E:definePushButton("R_UFC_B6", 57, 3006, 1302, "Rear UFC", "REAR UFC Push Button 6")

F_15E:definePushButton("R_UFC_PRE_CHAN_L_PULL", 57, 3055, 1304, "Rear UFC", "REAR Left UHF Preset Channel Switch")
F_15E:defineRotary("R_UFC_PRE_CHAN_L_SEL", 57, 3011, 1303, "Rear UFC", "REAR Left UHF Preset Channel Selector")
F_15E:definePushButton("R_UFC_PRE_CHAN_R_PULL", 57, 3056, 1306, "Rear UFC", "REAR Right UHF Preset Channel Switch")
F_15E:defineRotary("R_UFC_PRE_CHAN_R_SEL", 57, 3012, 1305, "Rear UFC", "REAR Right UHF Preset Channel Selector")

F_15E:definePotentiometer("R_UFC_COM1_VOL", 57, 3013, 1307, { 0, 1 }, "Rear UFC", "REAR UHF Radio 1 Volume")
F_15E:definePotentiometer("R_UFC_COM2_VOL", 57, 3014, 1308, { 0, 1 }, "Rear UFC", "REAR UHF Radio 2 Volume")
F_15E:definePotentiometer("R_UFC_COM3_VOL", 57, 3015, 1309, { 0, 1 }, "Rear UFC", "REAR UHF Radio 3 Volume")
F_15E:definePotentiometer("R_UFC_COM4_VOL", 57, 3016, 1310, { 0, 1 }, "Rear UFC", "REAR UHF Radio 4 Volume")

F_15E:definePotentiometer("R_UFC_LCD_BRIGHT", 57, 3017, 1311, { 0, 1 }, "Rear UFC", "REAR UFC LCD Brightness")
F_15E:definePushButton("R_UFC_EMISL_BTN", 57, 3018, 1312, "Rear UFC", "REAR UFC Emission Limit Button")

F_15E:definePushButton("R_UFC_KEY_L_GUARD", 57, 3019, 1313, "Rear UFC", "REAR Left Guard Receiver - Channel/Manual Key")
F_15E:definePushButton("R_UFC_KEY_A1", 57, 3020, 1314, "Rear UFC", "REAR A/1 Key")
F_15E:definePushButton("R_UFC_KEY_N2", 57, 3021, 1315, "Rear UFC", "REAR N/2 Key")
F_15E:definePushButton("R_UFC_KEY_B3", 57, 3022, 1316, "Rear UFC", "REAR B/3 Key")
F_15E:definePushButton("R_UFC_KEY_R_GUARD", 57, 3023, 1317, "Rear UFC", "REAR Right Guard Receiver - Channel/Manual Key")
F_15E:definePushButton("R_UFC_KEY_MARK", 57, 3024, 1318, "Rear UFC", "REAR Mark Key")
F_15E:definePushButton("R_UFC_KEY_W4", 57, 3025, 1319, "Rear UFC", "REAR W/4 Key")
F_15E:definePushButton("R_UFC_KEY_M5", 57, 3026, 1320, "Rear UFC", "REAR M/5 Key")
F_15E:definePushButton("R_UFC_KEY_E6", 57, 3027, 1321, "Rear UFC", "REAR E/6 Key")
F_15E:definePushButton("R_UFC_KEY_IP", 57, 3028, 1322, "Rear UFC", "REAR I/P Key")
F_15E:definePushButton("R_UFC_KEY_DOT", 57, 3029, 1323, "Rear UFC", "REAR Decimal Point Key")
F_15E:definePushButton("R_UFC_KEY_7", 57, 3030, 1324, "Rear UFC", "REAR :/7 Key")
F_15E:definePushButton("R_UFC_KEY_S8", 57, 3031, 1325, "Rear UFC", "REAR S/8 Key")
F_15E:definePushButton("R_UFC_KEY_C9", 57, 3032, 1326, "Rear UFC", "REAR C/9 Key")
F_15E:definePushButton("R_UFC_KEY_SHF", 57, 3033, 1327, "Rear UFC", "REAR Shift Key")
F_15E:definePushButton("R_UFC_KEY_AP", 57, 3034, 1328, "Rear UFC", "REAR A/P Key")
F_15E:definePushButton("R_UFC_KEY_CLR", 57, 3035, 1329, "Rear UFC", "REAR Clear Key")
F_15E:definePushButton("R_UFC_KEY_0", 57, 3036, 1330, "Rear UFC", "REAR -/0 Key")
F_15E:definePushButton("R_UFC_KEY_DATA", 57, 3037, 1331, "Rear UFC", "REAR Data Key")
F_15E:definePushButton("R_UFC_KEY_MENU", 57, 3038, 1332, "Rear UFC", "REAR Menu Key")

--UFC DISPLAY REAR
F_15E:defineString("R_UFC_LINE1_DISPLAY", function()
	return R_UFC_LINE1
end, 20, "Rear UFC Display", "Line 1")
F_15E:defineString("R_UFC_LINE2_DISPLAY", function()
	return R_UFC_LINE2
end, 20, "Rear UFC Display", "Line 2")
F_15E:defineString("R_UFC_LINE3_DISPLAY", function()
	return R_UFC_LINE3
end, 20, "Rear UFC Display", "Line 3")
F_15E:defineString("R_UFC_LINE4_DISPLAY", function()
	return R_UFC_LINE4
end, 20, "Rear UFC Display", "Line 4")
F_15E:defineString("R_UFC_LINE5_DISPLAY", function()
	return R_UFC_LINE5
end, 20, "Rear UFC Display", "Line 5")
F_15E:defineString("R_UFC_LINE6_DISPLAY", function()
	return R_UFC_LINE6
end, 20, "Rear UFC Display", "Line 6")
F_15E:defineString("R_UFC_LINE1_DISPLAY_DOTS", function()
	return R_UFC_LINE1_dots
end, 20, "Rear UFC Display", "Line 1 (special characters)")
F_15E:defineString("R_UFC_LINE2_DISPLAY_DOTS", function()
	return R_UFC_LINE2_dots
end, 20, "Rear UFC Display", "Line 2 (special characters)")
F_15E:defineString("R_UFC_LINE3_DISPLAY_DOTS", function()
	return R_UFC_LINE3_dots
end, 20, "Rear UFC Display", "Line 3 (special characters)")
F_15E:defineString("R_UFC_LINE4_DISPLAY_DOTS", function()
	return R_UFC_LINE4_dots
end, 20, "Rear UFC Display", "Line 4 (special characters)")
F_15E:defineString("R_UFC_LINE5_DISPLAY_DOTS", function()
	return R_UFC_LINE5_dots
end, 20, "Rear UFC Display", "Line 5 (special characters)")
F_15E:defineString("R_UFC_LINE6_DISPLAY_DOTS", function()
	return R_UFC_LINE6_dots
end, 20, "Rear UFC Display", "Line 6 (special characters)")
F_15E:defineString("R_UFC_ACTIVE_UHF1", function()
	return R_UFC_ActiveUHF1
end, 8, "Rear UFC Display", "Active UHF 1 (special)")
F_15E:defineString("R_UFC_ACTIVE_UHF2", function()
	return R_UFC_ActiveUHF2
end, 8, "Rear UFC Display", "Active UHF 2 (special)")

--Emergency Jettison and Misc Handles
F_15E:definePushButton("R_RUDDER_PED_ADJ", 18, 3346, 1346, "Rear Misc", "REAR Rudder Pedal Ajust Handle")
F_15E:defineToggleSwitch("R_HOOK", 21, 3344, 1341, "Rear Misc", "REAR Arresting Hook Handle")
F_15E:defineToggleSwitch("R_EMERG_GEAR", 21, 3342, 1342, "Rear Misc", "REAR Emergency Landing Gear Handle")
F_15E:defineToggleSwitch("R_EMERG_BRAKE_STEER", 21, 3345, 1345, "Rear Misc", "REAR Emergency Brake/Steering Handle")

--LEFT MPCD
F_15E:definePushButton("R_MPCD_L_B1", 37, 3061, 1204, "Rear Left MPCD", "REAR Left MPCD Push Button 1")
F_15E:definePushButton("R_MPCD_L_B2", 37, 3062, 1203, "Rear Left MPCD", "REAR Left MPCD Push Button 2")
F_15E:definePushButton("R_MPCD_L_B3", 37, 3063, 1202, "Rear Left MPCD", "REAR Left MPCD Push Button 3")
F_15E:definePushButton("R_MPCD_L_B4", 37, 3064, 1201, "Rear Left MPCD", "REAR Left MPCD Push Button 4")
F_15E:definePushButton("R_MPCD_L_B5", 37, 3065, 1200, "Rear Left MPCD", "REAR Left MPCD Push Button 5")
F_15E:definePushButton("R_MPCD_L_B6", 37, 3066, 1219, "Rear Left MPCD", "REAR Left MPCD Push Button 6")
F_15E:definePushButton("R_MPCD_L_B7", 37, 3067, 1218, "Rear Left MPCD", "REAR Left MPCD Push Button 7")
F_15E:definePushButton("R_MPCD_L_B8", 37, 3068, 1217, "Rear Left MPCD", "REAR Left MPCD Push Button 8")
F_15E:definePushButton("R_MPCD_L_B9", 37, 3069, 1216, "Rear Left MPCD", "REAR Left MPCD Push Button 9")
F_15E:definePushButton("R_MPCD_L_B10", 37, 3070, 1215, "Rear Left MPCD", "REAR Left MPCD Push Button 10")
F_15E:definePushButton("R_MPCD_L_B11", 37, 3071, 1214, "Rear Left MPCD", "REAR Left MPCD Push Button 11")
F_15E:definePushButton("R_MPCD_L_B12", 37, 3072, 1213, "Rear Left MPCD", "REAR Left MPCD Push Button 12")
F_15E:definePushButton("R_MPCD_L_B13", 37, 3073, 1212, "Rear Left MPCD", "REAR Left MPCD Push Button 13")
F_15E:definePushButton("R_MPCD_L_B14", 37, 3074, 1211, "Rear Left MPCD", "REAR Left MPCD Push Button 14")
F_15E:definePushButton("R_MPCD_L_B15", 37, 3075, 1210, "Rear Left MPCD", "REAR Left MPCD Push Button 15")
F_15E:definePushButton("R_MPCD_L_B16", 37, 3076, 1209, "Rear Left MPCD", "REAR Left MPCD Push Button 16")
F_15E:definePushButton("R_MPCD_L_B17", 37, 3077, 1208, "Rear Left MPCD", "REAR Left MPCD Push Button 17")
F_15E:definePushButton("R_MPCD_L_B18", 37, 3078, 1207, "Rear Left MPCD", "REAR Left MPCD Push Button 18")
F_15E:definePushButton("R_MPCD_L_B19", 37, 3079, 1206, "Rear Left MPCD", "REAR Left MPCD Push Button 19")
F_15E:definePushButton("R_MPCD_L_B20", 37, 3080, 1205, "Rear Left MPCD", "REAR Left MPCD Push Button 20")
F_15E:defineSpringloaded_3PosTumb("R_MPCD_L_PW", 37, 3081, 3081, 1221, "Rear Left MPCD", "REAR Left MPCD Power Switch")
F_15E:defineSpringloaded_3PosTumb("R_MPCD_L_BRIGHT", 37, 3083, 3083, 1222, "Rear Left MPCD", "REAR Left MPCD Brightness Control")
F_15E:defineSpringloaded_3PosTumb("R_MPCD_L_CONT", 37, 3082, 3082, 1223, "Rear Left MPCD", "REAR Left MPCD Contrast Control")

--LEFT MPD
F_15E:definePushButton("R_MPD_L_B1", 38, 3061, 1228, "Rear Left MPD", "REAR Left MPD Push Button 1")
F_15E:definePushButton("R_MPD_L_B2", 38, 3062, 1227, "Rear Left MPD", "REAR Left MPD Push Button 2")
F_15E:definePushButton("R_MPD_L_B3", 38, 3063, 1226, "Rear Left MPD", "REAR Left MPD Push Button 3")
F_15E:definePushButton("R_MPD_L_B4", 38, 3064, 1225, "Rear Left MPD", "REAR Left MPD Push Button 4")
F_15E:definePushButton("R_MPD_L_B5", 38, 3065, 1224, "Rear Left MPD", "REAR Left MPD Push Button 5")
F_15E:definePushButton("R_MPD_L_B6", 38, 3066, 1243, "Rear Left MPD", "REAR Left MPD Push Button 6")
F_15E:definePushButton("R_MPD_L_B7", 38, 3067, 1242, "Rear Left MPD", "REAR Left MPD Push Button 7")
F_15E:definePushButton("R_MPD_L_B8", 38, 3068, 1241, "Rear Left MPD", "REAR Left MPD Push Button 8")
F_15E:definePushButton("R_MPD_L_B9", 38, 3069, 1240, "Rear Left MPD", "REAR Left MPD Push Button 9")
F_15E:definePushButton("R_MPD_L_B10", 38, 3070, 1239, "Rear Left MPD", "REAR Left MPD Push Button 10")
F_15E:definePushButton("R_MPD_L_B11", 38, 3071, 1238, "Rear Left MPD", "REAR Left MPD Push Button 11")
F_15E:definePushButton("R_MPD_L_B12", 38, 3072, 1237, "Rear Left MPD", "REAR Left MPD Push Button 12")
F_15E:definePushButton("R_MPD_L_B13", 38, 3073, 1236, "Rear Left MPD", "REAR Left MPD Push Button 13")
F_15E:definePushButton("R_MPD_L_B14", 38, 3074, 1235, "Rear Left MPD", "REAR Left MPD Push Button 14")
F_15E:definePushButton("R_MPD_L_B15", 38, 3075, 1234, "Rear Left MPD", "REAR Left MPD Push Button 15")
F_15E:definePushButton("R_MPD_L_B16", 38, 3076, 1233, "Rear Left MPD", "REAR Left MPD Push Button 16")
F_15E:definePushButton("R_MPD_L_B17", 38, 3077, 1232, "Rear Left MPD", "REAR Left MPD Push Button 17")
F_15E:definePushButton("R_MPD_L_B18", 38, 3078, 1231, "Rear Left MPD", "REAR Left MPD Push Button 18")
F_15E:definePushButton("R_MPD_L_B19", 38, 3079, 1230, "Rear Left MPD", "REAR Left MPD Push Button 19")
F_15E:definePushButton("R_MPD_L_B20", 38, 3080, 1229, "Rear Left MPD", "REAR Left MPD Push Button 20")
F_15E:defineSpringloaded_3PosTumb("R_MPD_L_PW", 38, 3081, 3081, 1244, "Rear Left MPD", "REAR Left MPD Power Switch")
F_15E:defineSpringloaded_3PosTumb("R_MPD_L_BRIGHT", 38, 3083, 3083, 1245, "Rear Left MPD", "REAR Left MPD Brightness Control")
F_15E:defineSpringloaded_3PosTumb("R_MPD_L_CONT", 38, 3082, 3082, 1246, "Rear Left MPD", "REAR Left MPD Contrast Control")

--RIGHT MPD
F_15E:definePushButton("R_MPD_R_B1", 39, 3061, 1251, "Rear Right MPD", "REAR Right MPD Push Button 1")
F_15E:definePushButton("R_MPD_R_B2", 39, 3062, 1250, "Rear Right MPD", "REAR Right MPD Push Button 2")
F_15E:definePushButton("R_MPD_R_B3", 39, 3063, 1249, "Rear Right MPD", "REAR Right MPD Push Button 3")
F_15E:definePushButton("R_MPD_R_B4", 39, 3064, 1248, "Rear Right MPD", "REAR Right MPD Push Button 4")
F_15E:definePushButton("R_MPD_R_B5", 39, 3065, 1247, "Rear Right MPD", "REAR Right MPD Push Button 5")
F_15E:definePushButton("R_MPD_R_B6", 39, 3066, 1266, "Rear Right MPD", "REAR Right MPD Push Button 6")
F_15E:definePushButton("R_MPD_R_B7", 39, 3067, 1265, "Rear Right MPD", "REAR Right MPD Push Button 7")
F_15E:definePushButton("R_MPD_R_B8", 39, 3068, 1264, "Rear Right MPD", "REAR Right MPD Push Button 8")
F_15E:definePushButton("R_MPD_R_B9", 39, 3069, 1263, "Rear Right MPD", "REAR Right MPD Push Button 9")
F_15E:definePushButton("R_MPD_R_B10", 39, 3070, 1262, "Rear Right MPD", "REAR Right MPD Push Button 10")
F_15E:definePushButton("R_MPD_R_B11", 39, 3071, 1261, "Rear Right MPD", "REAR Right MPD Push Button 11")
F_15E:definePushButton("R_MPD_R_B12", 39, 3072, 1260, "Rear Right MPD", "REAR Right MPD Push Button 12")
F_15E:definePushButton("R_MPD_R_B13", 39, 3073, 1259, "Rear Right MPD", "REAR Right MPD Push Button 13")
F_15E:definePushButton("R_MPD_R_B14", 39, 3074, 1258, "Rear Right MPD", "REAR Right MPD Push Button 14")
F_15E:definePushButton("R_MPD_R_B15", 39, 3075, 1257, "Rear Right MPD", "REAR Right MPD Push Button 15")
F_15E:definePushButton("R_MPD_R_B16", 39, 3076, 1256, "Rear Right MPD", "REAR Right MPD Push Button 16")
F_15E:definePushButton("R_MPD_R_B17", 39, 3077, 1255, "Rear Right MPD", "REAR Right MPD Push Button 17")
F_15E:definePushButton("R_MPD_R_B18", 39, 3078, 1254, "Rear Right MPD", "REAR Right MPD Push Button 18")
F_15E:definePushButton("R_MPD_R_B19", 39, 3079, 1253, "Rear Right MPD", "REAR Right MPD Push Button 19")
F_15E:definePushButton("R_MPD_R_B20", 39, 3080, 1252, "Rear Right MPD", "REAR Right MPD Push Button 20")
F_15E:defineSpringloaded_3PosTumb("R_MPD_R_PW", 39, 3081, 3081, 1267, "Rear Right MPD", "REAR Right MPD Power Switch")
F_15E:defineSpringloaded_3PosTumb("R_MPD_R_BRIGHT", 39, 3083, 3083, 1268, "Rear Right MPD", "REAR Right MPD Brightness Control")
F_15E:defineSpringloaded_3PosTumb("R_MPD_R_CONT", 39, 3082, 3082, 1269, "Rear Right MPD", "REAR Right MPD Contrast Control")

--RIGHT MPCD
F_15E:definePushButton("R_MPCD_R_B1", 40, 3061, 1274, "Rear Right MPCD", "REAR Right MPCD Push Button 1")
F_15E:definePushButton("R_MPCD_R_B2", 40, 3062, 1273, "Rear Right MPCD", "REAR Right MPCD Push Button 2")
F_15E:definePushButton("R_MPCD_R_B3", 40, 3063, 1272, "Rear Right MPCD", "REAR Right MPCD Push Button 3")
F_15E:definePushButton("R_MPCD_R_B4", 40, 3064, 1271, "Rear Right MPCD", "REAR Right MPCD Push Button 4")
F_15E:definePushButton("R_MPCD_R_B5", 40, 3065, 1270, "Rear Right MPCD", "REAR Right MPCD Push Button 5")
F_15E:definePushButton("R_MPCD_R_B6", 40, 3066, 1289, "Rear Right MPCD", "REAR Right MPCD Push Button 6")
F_15E:definePushButton("R_MPCD_R_B7", 40, 3067, 1288, "Rear Right MPCD", "REAR Right MPCD Push Button 7")
F_15E:definePushButton("R_MPCD_R_B8", 40, 3068, 1287, "Rear Right MPCD", "REAR Right MPCD Push Button 8")
F_15E:definePushButton("R_MPCD_R_B9", 40, 3069, 1286, "Rear Right MPCD", "REAR Right MPCD Push Button 9")
F_15E:definePushButton("R_MPCD_R_B10", 40, 3070, 1285, "Rear Right MPCD", "REAR Right MPCD Push Button 10")
F_15E:definePushButton("R_MPCD_R_B11", 40, 3071, 1284, "Rear Right MPCD", "REAR Right MPCD Push Button 11")
F_15E:definePushButton("R_MPCD_R_B12", 40, 3072, 1283, "Rear Right MPCD", "REAR Right MPCD Push Button 12")
F_15E:definePushButton("R_MPCD_R_B13", 40, 3073, 1282, "Rear Right MPCD", "REAR Right MPCD Push Button 13")
F_15E:definePushButton("R_MPCD_R_B14", 40, 3074, 1281, "Rear Right MPCD", "REAR Right MPCD Push Button 14")
F_15E:definePushButton("R_MPCD_R_B15", 40, 3075, 1280, "Rear Right MPCD", "REAR Right MPCD Push Button 15")
F_15E:definePushButton("R_MPCD_R_B16", 40, 3076, 1279, "Rear Right MPCD", "REAR Right MPCD Push Button 16")
F_15E:definePushButton("R_MPCD_R_B17", 40, 3077, 1278, "Rear Right MPCD", "REAR Right MPCD Push Button 17")
F_15E:definePushButton("R_MPCD_R_B18", 40, 3078, 1277, "Rear Right MPCD", "REAR Right MPCD Push Button 18")
F_15E:definePushButton("R_MPCD_R_B19", 40, 3079, 1276, "Rear Right MPCD", "REAR Right MPCD Push Button 19")
F_15E:definePushButton("R_MPCD_R_B20", 40, 3080, 1275, "Rear Right MPCD", "REAR Right MPCD Push Button 20")
F_15E:defineSpringloaded_3PosTumb("R_MPCD_R_PW", 40, 3081, 3081, 1290, "Rear Right MPCD", "REAR Right MPCD Power Switch")
F_15E:defineSpringloaded_3PosTumb("R_MPCD_R_BRIGHT", 40, 3083, 3083, 1291, "Rear Right MPCD", "REAR Right MPCD Brightness Control")
F_15E:defineSpringloaded_3PosTumb("R_MPCD_R_CONT", 40, 3082, 3082, 1292, "Rear Right MPCD", "REAR Right MPCD Contrast Control")

---LEFT INSTRUMENTS PANEL
--NUC
F_15E:defineToggleSwitch("R_NUC_N_CONS_CVR", 17, 3452, 1401, "Rear NUC", "REAR Nuclear Consent Switch Cover")
F_15E:define3PosTumb("R_NUC_N_CONS_SWITCH", 17, 3453, 1402, "Rear NUC", "REAR Nuclear Consent Switch")

--TPOD Panel
F_15E:defineMultipositionSwitch("R_TGP_PW", 54, 3413, 1413, 3, 0.5, "Rear TPOD Panel", "REAR TGP Power Switch OFF/STBY/ON")
F_15E:definePotentiometer("R_TGP_GAIN", 54, 3414, 1414, { 0, 1 }, "Rear TPOD Panel", "REAR TGP FLIR Gain")
F_15E:definePotentiometer("R_TGP_LVL", 54, 3415, 1415, { 0, 1 }, "Rear TPOD Panel", "REAR TGP FLIR Level")
F_15E:defineToggleSwitch("R_TGP_LASER", 54, 3416, 1416, "Rear TPOD Panel", "REAR TGP Laser Switch SAFE/ARM")

--EW Panel
F_15E:defineToggleSwitch("R_EW_RWR_ICS_MODE", 59, 3931, 1417, "Rear EW Panel", "REAR RWR/ICS Mode Switch COMBAT/TRNG")
F_15E:defineToggleSwitch("R_EW_ECM_PODS_MODE", 61, 3932, 1418, "Rear EW Panel", "REAR ECM PODS Mode Switch XMIT/STBY")
F_15E:defineMultipositionSwitch("R_EW_ICS_OP_MODE", 61, 3933, 1419, 3, 0.5, "Rear EW Panel", "REAR ICS Operational Mode Switch STBY/AUTO/MAN")

--VOL
F_15E:definePotentiometer("R_VOL_CAUTION", 59, 3601, 1420, { 0, 1 }, "Rear Volume", "REAR Caution Volume")
F_15E:definePotentiometer("R_VOL_LAUNCH", 59, 3602, 1421, { 0, 1 }, "Rear Volume", "REAR Launch Volume")
F_15E:definePotentiometer("R_VOL_ICS", 13, 3603, 1422, { 0, 1 }, "Rear Volume", "REAR ICS Volume")
F_15E:definePotentiometer("R_VOL_WPN", 13, 3604, 1423, { 0, 1 }, "Rear Volume", "REAR WPN Volume")
F_15E:definePotentiometer("R_VOL_ILS", 11, 3605, 1424, { 0, 1 }, "Rear Volume", "REAR ILS Volume")
F_15E:definePotentiometer("R_VOL_TCN", 10, 3606, 1425, { 0, 1 }, "Rear Volume", "REAR TACAN Volume")

--MICS
F_15E:define3PosTumb("R_MIC_CRYPT", 17, 3426, 1426, "Rear MICS", "REAR MICS Crypto Switch")
F_15E:defineMultipositionSwitch("R_MIC_SW", 17, 3427, 1427, 3, 0.5, "Rear MICS", "REAR MIC Switch")
F_15E:definePushButton("R_MIC_VW_SILENT", 29, 3428, 1428, "Rear MICS", "REAR MICS VW/Tone Silence Switch")

--RADIO
F_15E:defineToggleSwitch("R_R_TONE", 17, 3429, 1429, "Rear Radio", "REAR Radio Tone Switch")
F_15E:defineToggleSwitch("R_R_CYP_TXT", 17, 3430, 1430, "Rear Radio", "REAR Radio Cypher Text Switch")

--Throttle Quadrant
F_15E:define3PosTumb("R_TQ_RDR_TRIM", 18, 3403, 1403, "Rear Throttle Quadrant", "REAR Throttle Rudder Trim Switch")
F_15E:define3PosTumb("R_TQ_SEAT_ADJ", 24, 3431, 1431, "Rear Throttle Quadrant", "REAR Throttle Seat Adjust Switch")
F_15E:defineToggleSwitch("R_TQ_SEAT_ARM", 24, 3802, 802, "Rear Throttle Quadrant", "REAR Throttle Seat Arm Handle")

---RIGHT INSTRUMENTS PANEL
--OXYGEN Control Panel
F_15E:define3PosTumb("R_OXY_TEST", 26, 3571, 1450, "Rear Oxygen Control Panel", "REAR Oxygen Emergency/Normal/Test Switch")
F_15E:defineToggleSwitch("R_OXY_NORM_100", 26, 3572, 1451, "Rear Oxygen Control Panel", "REAR Oxygen 100%/Normal Switch")
F_15E:defineMultipositionSwitch("R_OXY_MODE", 26, 3573, 1452, 3, 0.5, "Rear Oxygen Control Panel", "REAR Oxygen Supply/Mode Control Switch")

F_15E:defineFloat("R_OXY_NEEDLE_G", 1453, { 0, 1 }, "Rear Oxygen Control Panel Gauges", "REAR Oxygen Pressure Needle")
F_15E:defineFloat("R_OXY_FLOW_G", 1454, { 0, 1 }, "Rear Oxygen Control Panel Gauges", "REAR Oxygen FLOW Indicator")

F_15E:defineIndicatorLight("R_OXY_FLOW_L", 1454, "Rear Oxygen Control Panel Lights", "REAR Oxygen FLOW Indicator as Light (white)")

--INT LT Control Panel
F_15E:definePotentiometer("R_INTL_CONSOLE", 23, 3456, 1456, { 0, 1 }, "Rear Internal Lights Panel", "REAR Console Lights")
F_15E:definePotentiometer("R_INTL_INSTR", 23, 3457, 1457, { 0, 1 }, "Rear Internal Lights Panel", "REAR Instruments Panel Lights")
F_15E:definePotentiometer("R_INTL_BACK", 23, 3458, 1458, { 0, 1 }, "Rear Internal Lights Panel", "REAR Gauges/UFC Backlights")
F_15E:definePushButton("R_INTL_WARN_TEST", 23, 3459, 1459, "Rear Internal Lights Panel", "REAR Warning/Caution Lights Test")
F_15E:defineToggleSwitch("R_INTL_COMPASS", 23, 3460, 1460, "Rear Internal Lights Panel", "REAR Compass Lights")
F_15E:defineToggleSwitch("R_INTL_DN_MODE", 23, 3461, 1461, "Rear Internal Lights Panel", "REAR Day/Night Mode Selector")
F_15E:definePotentiometer("R_INTL_CHARTS", 23, 3462, 1462, { 0, 1 }, "Rear Internal Lights Panel", "REAR Charts Spot Light")
F_15E:definePotentiometer("R_INTL_WARN", 23, 3463, 1463, { 0, 1 }, "Rear Internal Lights Panel", "REAR Warning/Caution Lights")
F_15E:definePushButton("R_INTL_WARN_RESET", 23, 3463, 1463, "Rear Internal Lights Panel", "REAR Warning/Caution Lights Reset")
F_15E:definePotentiometer("R_INTL_STORM", 23, 3464, 1464, { 0, 1 }, "Rear Internal Lights Panel", "REAR Storm FLood Lights")
F_15E:definePotentiometer("R_INTL_CHART", 23, 3188, 188, { 0, 1 }, "Rear Internal Lights Panel", "REAR Chart Spot Lamp")

F_15E:defineFloat("R_INTL_CAN_FL", 187, { 0, 1 }, "Rear Internal Lights", "REAR Canopy Lamp (green)")
F_15E:defineFloat("R_INTL_UFC_BL_FL", 189, { 0, 1 }, "Rear Internal Lights", "REAR UFC Backlight (red)")
F_15E:defineFloat("R_INTL_UFC_FL", 190, { 0, 1 }, "Rear Internal Lights", "REAR UFC Panel Lights (white)")
F_15E:defineFloat("R_INTL_FLOOD_FL", 191, { 0, 1 }, "Rear Internal Lights", "REAR Flood Lights (green)")
F_15E:defineFloat("R_INTL_IND_FL", 192, { 0, 1 }, "Rear Internal Lights", "REAR Indicator Lights (multi)")
F_15E:defineFloat("R_INTL_INSTR_FL", 193, { 0, 1 }, "Rear Internal Lights", "REAR Instrument Lights (white)")
F_15E:defineFloat("R_INTL_PANEL_FL", 194, { 0, 1 }, "Rear Internal Lights", "REAR Panel Lights (white)")

--TEWS Control Panel
F_15E:defineToggleSwitch("R_TEWS_ICS_PW", 61, 3921, 1465, "Rear TEWS Control Panel", "REAR TEWS ICS ON/OFF Switch")
F_15E:defineToggleSwitch("R_TEWS_ICS_SET1", 61, 3922, 1466, "Rear TEWS Control Panel", "REAR TEWS ICS SET 1 MAN/AUTO Switch")
F_15E:defineToggleSwitch("R_TEWS_ICS_SET2", 61, 3923, 1467, "Rear TEWS Control Panel", "REAR TEWS ICS SET 2 MAN/AUTO Switch")
F_15E:defineToggleSwitch("R_TEWS_ICS_SET3", 61, 3924, 1468, "Rear TEWS Control Panel", "REAR TEWS ICS SET 3 MAN/AUTO Switch")
F_15E:defineToggleSwitch("R_TEWS_RWR_PW", 59, 3901, 1469, "Rear TEWS Control Panel", "REAR TEWS RWR ON/OFF Switch")
F_15E:defineToggleSwitch("R_TEWS_EWWS_PW", 59, 3902, 1470, "Rear TEWS Control Panel", "REAR TEWS EWWS ON/OFF Switch")
F_15E:defineToggleSwitch("R_TEWS_EWWS_TONE", 59, 3903, 1471, "Rear TEWS Control Panel", "REAR TEWS EWWS TONE/DEFEAT Switch")

F_15E:defineIndicatorLight("R_TEWS_FAIL_L", 1472, "Rear TEWS Control Panel Lights", "REAR TEWS 3x FAIL Lights (white)")

--CMD Control Panel
F_15E:defineMultipositionSwitch("R_CMD_DISP_SEL", 60, 3911, 1475, 3, 0.5, "Rear CMD Control Panel", "REAR CMD Dispenser Selection Switch FLARE/BOTH/CHAFF")
F_15E:defineMultipositionSwitch("R_CMD_OP_MODE", 60, 3912, 1476, 5, 0.25, "Rear CMD Control Panel", "REAR CMD Operational Mode OFF/STBY/MAN/SEMI/AUTO")
F_15E:defineToggleSwitch("R_EW_FLARE_JETT_CVR", 60, 3913, 1477, "Rear EW Panel", "REAR Flare Jettison Switch Cover")
F_15E:definePushButton("R_EW_FLARE_JETT", 60, 3914, 1478, "Rear EW Panel", "REAR Flare Jettison Switch NORM/JETT")

----MISC CONTROLS
F_15E:defineToggleSwitch("F_SHOW_CONTRL", 24, 3001, 1001, "Misc Controls", "Show/Hide Controls")
F_15E:definePotentiometer("F_MIRROR_C_AD", 24, 3910, 10, { 0, 1 }, "Misc Controls", "Mirror Center Adjust Angle")
F_15E:defineToggleSwitch("F_MIRROR_C_TG", 24, 3010, 10, "Misc Controls", "Mirror Center Rendering Toggle")
F_15E:definePotentiometer("F_MIRROR_L_AD", 24, 3911, 11, { 0, 1 }, "Misc Controls", "Mirror Left Adjust Angle")
F_15E:defineToggleSwitch("F_MIRROR_L_TG", 24, 3011, 11, "Misc Controls", "Mirror Left Rendering Toggle")
F_15E:definePotentiometer("F_MIRROR_R_AD", 24, 3912, 12, { 0, 1 }, "Misc Controls", "Mirror Right Adjust Angle")
F_15E:defineToggleSwitch("F_MIRROR_R_TG", 24, 3012, 12, "Misc Controls", "Mirror Right Rendering Toggle")

--WARNING / CAUTION / ADVISORY LIGHTS
F_15E:defineIndicatorLight("F_MASTER_CAUTION_L", 402, "Front Warn, Caution and IndicatorLights", "FRONT MASTER CAUTION Light (yellow)")
F_15E:defineIndicatorLight("F_EMS_LMT_L", 403, "Front Warn, Caution and IndicatorLights", "FRONT EMIS LMT Light (yellow)")
F_15E:defineIndicatorLight("F_LSR_ARM_L", 409, "Front Warn, Caution and IndicatorLights", "FRONT LASER ARMED Light (red)")
F_15E:defineIndicatorLight("F_AP_L", 410, "Front Warn, Caution and IndicatorLights", "FRONT Auto Pilot Light (yellow)")
F_15E:defineIndicatorLight("F_AI_L", 404, "Front Warn, Caution and IndicatorLights", "FRONT AI Light (red)")
F_15E:defineIndicatorLight("F_SAM_L", 405, "Front Warn, Caution and IndicatorLights", "FRONT SAM Light (red)")
F_15E:defineIndicatorLight("F_LALT_L", 406, "Front Warn, Caution and IndicatorLights", "FRONT LOW ALT Light (red)")
F_15E:defineIndicatorLight("F_TF_FAIL_L", 407, "Front Warn, Caution and IndicatorLights", "FRONT TF FAIL Light (red)")
F_15E:defineIndicatorLight("F_CAN_UL_L", 408, "Front Warn, Caution and IndicatorLights", "FRONT CAN UNLCKD Light (red)")
F_15E:defineIndicatorLight("F_OBST_L", 429, "Front Warn, Caution and IndicatorLights", "FRONT OBST Light (red)")

F_15E:defineIndicatorLight("F_MC_PROG_L", 411, "Front Main Caution Lights Panel", "FRONT PROGRAM Light (green)")
F_15E:defineIndicatorLight("F_MC_MIN_L", 412, "Front Main Caution Lights Panel", "FRONT MINIMUM Light (white)")
F_15E:defineIndicatorLight("F_MC_CHAFF_L", 413, "Front Main Caution Lights Panel", "FRONT CHAFF Light (white)")
F_15E:defineIndicatorLight("F_MC_FLARE_L", 414, "Front Main Caution Lights Panel", "FRONT FLARE Light (white)")
F_15E:defineIndicatorLight("F_MC_EMERG_BST_L", 415, "Front Main Caution Lights Panel", "FRONT EMER BST ON Light (white)")
F_15E:defineIndicatorLight("F_MC_BST_SYS_L", 416, "Front Main Caution Lights Panel", "FRONT BST SYS MAL Light (white)")
F_15E:defineIndicatorLight("F_MC_NUC_L", 417, "Front Main Caution Lights Panel", "FRONT NUCLEAR Light (white)")
F_15E:defineIndicatorLight("F_MC_FUEL_L_L", 418, "Front Main Caution Lights Panel", "FRONT FUEL LOW Light (yellow)")
F_15E:defineIndicatorLight("F_MC_L_GEN_L", 419, "Front Main Caution Lights Panel", "FRONT L GEN Light (yellow)")
F_15E:defineIndicatorLight("F_MC_R_GEN_L", 420, "Front Main Caution Lights Panel", "FRONT R GEN Light (white)")
F_15E:defineIndicatorLight("F_MC_ENG_L", 421, "Front Main Caution Lights Panel", "FRONT ENGINE Light (white)")
F_15E:defineIndicatorLight("F_MC_FLT_CONT_L", 422, "Front Main Caution Lights Panel", "FRONT FLT CONTR Light (white)")
F_15E:defineIndicatorLight("F_MC_HYD_L", 423, "Front Main Caution Lights Panel", "FRONT HYD Light (white)")
F_15E:defineIndicatorLight("F_MC_AV_BIT_L", 424, "Front Main Caution Lights Panel", "FRONT AV BIT Light (white)")
F_15E:defineIndicatorLight("F_MC_DSPFLOLO_L", 425, "Front Main Caution Lights Panel", "FRONT DSPFLOLO Light (white)")
F_15E:defineIndicatorLight("F_MC_OXY_L", 426, "Front Main Caution Lights Panel", "FRONT OXYGEN Light (white)")
F_15E:defineIndicatorLight("F_MC_SPARE_L", 432, "Front Main Caution Lights Panel", "FRONT 4x SPARE Lights (white)")

F_15E:defineIndicatorLight("R_MC_L_ENG_FIRE_L", 1171, "Rear Main Caution Lights Panel", "REAR ENG FIRE LEFT Light (red)")
F_15E:defineIndicatorLight("R_MC_R_ENG_FIRE_L", 1172, "Rear Main Caution Lights Panel", "REAR ENG FIRE RIGHT Light (red)")
F_15E:defineIndicatorLight("R_MC_CAN_UNLOCK_L", 1173, "Rear Main Caution Lights Panel", "REAR CANOPY UNLOCKED Light (red)")
F_15E:defineIndicatorLight("R_MC_LOW_ALT_L", 1174, "Rear Main Caution Lights Panel", "REAR LOW ALT Light (red)")
F_15E:defineIndicatorLight("R_MC_MASTER_CAUTION_L", 1177, "Rear Main Caution Lights Panel", "REAR MASTER CAUTION Light (yellow)")
F_15E:defineIndicatorLight("R_MC_TF_FAIL_L", 1178, "Rear Main Caution Lights Panel", "REAR TF FAIL Light (red)")
F_15E:defineIndicatorLight("R_MC_ENG_L", 1179, "Rear Main Caution Lights Panel", "REAR ENGINE Light (yellow)")
F_15E:defineIndicatorLight("R_MC_HYD_L", 1180, "Rear Main Caution Lights Panel", "REAR HYD Light (yellow)")
F_15E:defineIndicatorLight("R_MC_FLT_CONT_L", 1181, "Rear Main Caution Lights Panel", "REAR FLT CONTROL Light (yellow)")
F_15E:defineIndicatorLight("R_MC_AV_BIT_L", 1182, "Rear Main Caution Lights Panel", "REAR AV BIT Light (yellow)")
F_15E:defineIndicatorLight("R_MC_MASTER_ARM_L", 1183, "Rear Main Caution Lights Panel", "REAR MASTER ARM Light (green)")
F_15E:defineIndicatorLight("R_MC_AP_L", 1184, "Rear Main Caution Lights Panel", "REAR A/P Light (green)")
F_15E:defineIndicatorLight("R_MC_PROGRAM_L", 1185, "Rear Main Caution Lights Panel", "REAR PROGRAM Light (green)")
F_15E:defineIndicatorLight("R_MC_MIN_L", 1186, "Rear Main Caution Lights Panel", "REAR MINIMUM Light (yellow)")
F_15E:defineIndicatorLight("R_MC_DSPFLOLO_L", 1187, "Rear Main Caution Lights Panel", "REAR DISPLAY FLOW LOW Light (yellow)")
F_15E:defineIndicatorLight("R_MC_AI_L", 1188, "Rear Main Caution Lights Panel", "REAR AI Light (red)")
F_15E:defineIndicatorLight("R_MC_SAM_L", 1189, "Rear Main Caution Lights Panel", "REAR SAM Light (red)")
F_15E:defineIndicatorLight("R_MC_OBST_L", 1190, "Rear Main Caution Lights Panel", "REAR OBST Light (red)")
F_15E:defineIndicatorLight("R_MC_L_GEN_L", 1191, "Rear Main Caution Lights Panel", "REAR L GEN Light (yellow)")
F_15E:defineIndicatorLight("R_MC_R_GEN_L", 1192, "Rear Main Caution Lights Panel", "REAR R GEN Light (yellow)")
F_15E:defineIndicatorLight("R_MC_EMIS_L", 1193, "Rear Main Caution Lights Panel", "REAR EMIS LMT Light (yellow)")
F_15E:defineIndicatorLight("R_MC_FUEL_L_L", 1194, "Rear Main Caution Lights Panel", "REAR FUEL LOW Light (yellow)")
F_15E:defineIndicatorLight("R_MC_NUC_L", 1195, "Rear Main Caution Lights Panel", "REAR NUCLEAR Light (yellow)")
F_15E:defineIndicatorLight("R_MC_UNARM_ATF_L", 1196, "Rear Main Caution Lights Panel", "REAR UNARMED NO ATF Light (yellow)")
F_15E:defineIndicatorLight("R_MC_CHAFF_L", 1197, "Rear Main Caution Lights Panel", "REAR CHAFF Light (yellow)")
F_15E:defineIndicatorLight("R_MC_FLARE_L", 1198, "Rear Main Caution Lights Panel", "REAR FLARE Light (yellow)")
F_15E:defineIndicatorLight("R_MC_OXY_L", 1199, "Rear Main Caution Lights Panel", "REAR OXYGEN Light (yellow)")

--Externals
F_15E:defineFloatFromDrawArgument("EXT_SPEED_BRAKE", 182, "External Aircraft Model", "Speed Brake")
F_15E:defineBitFromDrawArgument("EXT_POSITION_LIGHT_L", 190, "External Aircraft Model", "Position Light Left (red)")
F_15E:defineBitFromDrawArgument("EXT_POSITION_LIGHT_R", 191, "External Aircraft Model", "Position Light Right (green)")
F_15E:defineBitFromDrawArgument("EXT_POSITION_LIGHT_T", 191, "External Aircraft Model", "Position Light Tail (White)")
F_15E:defineFloatFromDrawArgument("EXT_FORMATION_LIGHT_NL", 200, "External Aircraft Model", "Formation Light Nose Left (green)")
F_15E:defineFloatFromDrawArgument("EXT_FORMATION_LIGHT_NR", 201, "External Aircraft Model", "Formation Light Nose Right (green)")
F_15E:defineFloatFromDrawArgument("EXT_FORMATION_LIGHT_WL", 202, "External Aircraft Model", "Formation Light Wing Left (green)")
F_15E:defineFloatFromDrawArgument("EXT_FORMATION_LIGHT_WR", 203, "External Aircraft Model", "Formation Light Wing Right (green)")
F_15E:defineFloatFromDrawArgument("EXT_FORMATION_LIGHT_TL", 204, "External Aircraft Model", "Formation Light Tail Left (green)")
F_15E:defineFloatFromDrawArgument("EXT_FORMATION_LIGHT_TR", 205, "External Aircraft Model", "Formation Light Tail Right (green)")
F_15E:defineBitFromDrawArgument("EXT_RUDDER_LIGHT", 206, "External Aircraft Model", "Rudder Lights (white)")
F_15E:defineBitFromDrawArgument("EXT_STROBE", 198, "External Aircraft Model", "Strobe Lights (red)")
F_15E:defineBitFromDrawArgument("EXT_LAND_LIGHT_L", 208, "External Aircraft Model", "Landing Light low (white)")
F_15E:defineBitFromDrawArgument("EXT_LAND_LIGHT_H", 209, "External Aircraft Model", "Landing Light high (white)")
F_15E:defineBitFromDrawArgument("EXT_TANK_LIGHT", 210, "External Aircraft Model", "Tank Light (white)")
F_15E:defineFloatFromDrawArgument("EXT_HOOK", 25, "External Aircraft Model", "Hook")
F_15E:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
F_15E:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
F_15E:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

--Laser Code Panel
F_15E:defineMultipositionSwitch("R_LCP_LASER_DIG_2", 44, 3071, 71, 3, 0.1, "Rear Laser Code Panel", "REAR Laser Digit 2")
F_15E:defineMultipositionSwitch("R_LCP_LASER_DIG_3", 44, 3072, 72, 8, 0.1, "Rear Laser Code Panel", "REAR Laser Digit 3")
F_15E:defineMultipositionSwitch("R_LCP_LASER_DIG_4", 44, 3073, 73, 8, 0.1, "Rear Laser Code Panel", "REAR Laser Digit 4")

F_15E:defineReadWriteRadio("UHF_RADIO", 7, 7, 3, 1000, "UHF RADIO")
F_15E:defineReadWriteRadio("ARC_210_RADIO", 8, 7, 3, 1000, "ARC-210 RADIO")

local F_MPDL_BUTTONS = {}

local F_MPCD_BUTTONS = {}

local F_MPDR_BUTTONS = {}

local function split(stringvalue, delimiter)
	local result = {}
	for match in (stringvalue .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match)
	end
	return result
end

--[[ types PB entries may be missing ; write entries only if they're nil,  "`" or "^" ; add child values with $ for splitting ; only acceptable suffix is _LABEL ;
PB%d 							PB1 to PB9
PB%d%d 							PB01 to PB20 or PB10 to PB20
[random prefix]_PB%d%d_LABEL 	PACS_PB01-20_LABEL
PB%d%d-%d%d						PB01-02 for split on PB01 and PB02
PB%d%d_PB%d%d					PB12_PB13 for split on PB12 and PB13
[any prefix]_PB%d				TFR_PB5
[any prefix]_PB%d%d				TFR_PB15 or TPOD_PB01 to TPOD_PB20 or SWPN_PB04
PB%d%d_Value					is data begins 3 lines after "children are {" line
PB%d%d%d%d						PB0405 for split between 04 and 05
PB%d%d_%d%d						PB13_14 for split between 13 and 14
]]
--

-- matches for various pushbutton label names
local matchers = {
	{ "^PB(%d[%d]?)$", false },
	{ "^[%a+_]+PB(%d+)[_LABEL]-$", false },
	{ "^PB(%d+)%-%d+$", true },
	{ "^PB(%d%d)[%d%d|_PB%d%d|_%d%d]+$", true },
}

-- function for matching the "PB____" button descriptors
local function match_button_descriptors(val)
	for _, pair in ipairs(matchers) do
		local pos = string.match(val, pair[1])
		if pos then
			return tonumber(pos), pair[2]
		end
	end
	return nil, nil
end

-- function for parsing the button labels
local function parseMFDButtons(indicationID)
	local input = split(list_indication(indicationID), "%c")
	if not input then
		return nil
	end
	local values = {}
	for numline, checkline in pairs(input) do
		if checkline and string.sub(checkline, 1, 1) == "-" then -- a line of dashes denotes the start/end of a value grouping
			local start = numline + 1
			local val = input[start]
			if val then
				local num, double = match_button_descriptors(val) -- check if its one of the PB lines
				if num then
					local combine = ""
					for i = start + 1, #input do -- real values start 1 line after the PB___ stuff
						local line = input[i]
						if line then
							if line == "children are {" then -- check for sub-value (child)
								combine = combine .. "$"
								for j = i + 3, #input do -- sub-values start 3 lines after the beginning "children are" line
									local childline = input[j]
									if line and string.sub(childline, 1, 1) ~= "}" then -- sub-values end with }
										combine = combine .. childline
									else
										break
									end
								end
							elseif string.sub(line, 1, 1) ~= "-" then -- check if value group ended with dashes
								combine = combine .. line
							else
								break
							end
						end
					end
					if double then
						if (not values[num] and not values[num + 1]) or (string.match(values[num], "^[`%^]$") and string.match(values[num + 1], "^[`%^]$")) then
							local startnum = string.find(combine, "%d")
							if startnum then
								values[num + (num > 10 and 1 or 0)] = string.sub(combine, 1, startnum - 1) -- if the buttons is on the right or top, reverse the order so the top has text
								values[num + (num > 10 and 0 or 1)] = string.sub(combine, startnum, #combine) -- and the bottom has the number (like how its displayed)
							end
						end
					else
						if (not values[num] or string.match(values[num], "^[`%^]$")) and combine ~= "" then -- up/down arrows are ´/^ so they should be overwritten
							values[num] = combine
						end
					end
				end
			end
		end
	end

	for i = 1, 20 do -- fill the rest with spaces
		if not values[i] then
			values[i] = " "
		end
	end
	return values
end

F_15E:addExportHook(function()
	local output = parseMFDButtons(3)
	if not output then
		return
	end
	F_MPDL_BUTTONS = output
end)

F_15E:addExportHook(function()
	local output = parseMFDButtons(5)
	if not output then
		return
	end
	F_MPCD_BUTTONS = output
end)

F_15E:addExportHook(function()
	local output = parseMFDButtons(7)
	if not output then
		return
	end
	F_MPDR_BUTTONS = output
end)

F_15E:defineString("F_MPDL_PBLABEL_01", function()
	return F_MPDL_BUTTONS[1]
end, 10, "Front Left MPD Labels", "PB 01")
F_15E:defineString("F_MPDL_PBLABEL_02", function()
	return F_MPDL_BUTTONS[2]
end, 10, "Front Left MPD Labels", "PB 02")
F_15E:defineString("F_MPDL_PBLABEL_03", function()
	return F_MPDL_BUTTONS[3]
end, 10, "Front Left MPD Labels", "PB 03")
F_15E:defineString("F_MPDL_PBLABEL_04", function()
	return F_MPDL_BUTTONS[4]
end, 10, "Front Left MPD Labels", "PB 04")
F_15E:defineString("F_MPDL_PBLABEL_05", function()
	return F_MPDL_BUTTONS[5]
end, 10, "Front Left MPD Labels", "PB 05")
F_15E:defineString("F_MPDL_PBLABEL_06", function()
	return F_MPDL_BUTTONS[6]
end, 10, "Front Left MPD Labels", "PB 06")
F_15E:defineString("F_MPDL_PBLABEL_07", function()
	return F_MPDL_BUTTONS[7]
end, 10, "Front Left MPD Labels", "PB 07")
F_15E:defineString("F_MPDL_PBLABEL_08", function()
	return F_MPDL_BUTTONS[8]
end, 10, "Front Left MPD Labels", "PB 08")
F_15E:defineString("F_MPDL_PBLABEL_09", function()
	return F_MPDL_BUTTONS[9]
end, 10, "Front Left MPD Labels", "PB 09")
F_15E:defineString("F_MPDL_PBLABEL_10", function()
	return F_MPDL_BUTTONS[10]
end, 10, "Front Left MPD Labels", "PB 10")
F_15E:defineString("F_MPDL_PBLABEL_11", function()
	return F_MPDL_BUTTONS[11]
end, 10, "Front Left MPD Labels", "PB 11")
F_15E:defineString("F_MPDL_PBLABEL_12", function()
	return F_MPDL_BUTTONS[12]
end, 10, "Front Left MPD Labels", "PB 12")
F_15E:defineString("F_MPDL_PBLABEL_13", function()
	return F_MPDL_BUTTONS[13]
end, 10, "Front Left MPD Labels", "PB 13")
F_15E:defineString("F_MPDL_PBLABEL_14", function()
	return F_MPDL_BUTTONS[14]
end, 10, "Front Left MPD Labels", "PB 14")
F_15E:defineString("F_MPDL_PBLABEL_15", function()
	return F_MPDL_BUTTONS[15]
end, 10, "Front Left MPD Labels", "PB 15")
F_15E:defineString("F_MPDL_PBLABEL_16", function()
	return F_MPDL_BUTTONS[16]
end, 10, "Front Left MPD Labels", "PB 16")
F_15E:defineString("F_MPDL_PBLABEL_17", function()
	return F_MPDL_BUTTONS[17]
end, 10, "Front Left MPD Labels", "PB 17")
F_15E:defineString("F_MPDL_PBLABEL_18", function()
	return F_MPDL_BUTTONS[18]
end, 10, "Front Left MPD Labels", "PB 18")
F_15E:defineString("F_MPDL_PBLABEL_19", function()
	return F_MPDL_BUTTONS[19]
end, 10, "Front Left MPD Labels", "PB 19")
F_15E:defineString("F_MPDL_PBLABEL_20", function()
	return F_MPDL_BUTTONS[20]
end, 10, "Front Left MPD Labels", "PB 20")

F_15E:defineString("F_MPCD_PBLABEL_01", function()
	return F_MPCD_BUTTONS[1]
end, 10, "Front Center MPCD Labels", "PB 01")
F_15E:defineString("F_MPCD_PBLABEL_02", function()
	return F_MPCD_BUTTONS[2]
end, 10, "Front Center MPCD Labels", "PB 02")
F_15E:defineString("F_MPCD_PBLABEL_03", function()
	return F_MPCD_BUTTONS[3]
end, 10, "Front Center MPCD Labels", "PB 03")
F_15E:defineString("F_MPCD_PBLABEL_04", function()
	return F_MPCD_BUTTONS[4]
end, 10, "Front Center MPCD Labels", "PB 04")
F_15E:defineString("F_MPCD_PBLABEL_05", function()
	return F_MPCD_BUTTONS[5]
end, 10, "Front Center MPCD Labels", "PB 05")
F_15E:defineString("F_MPCD_PBLABEL_06", function()
	return F_MPCD_BUTTONS[6]
end, 10, "Front Center MPCD Labels", "PB 06")
F_15E:defineString("F_MPCD_PBLABEL_07", function()
	return F_MPCD_BUTTONS[7]
end, 10, "Front Center MPCD Labels", "PB 07")
F_15E:defineString("F_MPCD_PBLABEL_08", function()
	return F_MPCD_BUTTONS[8]
end, 10, "Front Center MPCD Labels", "PB 08")
F_15E:defineString("F_MPCD_PBLABEL_09", function()
	return F_MPCD_BUTTONS[9]
end, 10, "Front Center MPCD Labels", "PB 09")
F_15E:defineString("F_MPCD_PBLABEL_10", function()
	return F_MPCD_BUTTONS[10]
end, 10, "Front Center MPCD Labels", "PB 10")
F_15E:defineString("F_MPCD_PBLABEL_11", function()
	return F_MPCD_BUTTONS[11]
end, 10, "Front Center MPCD Labels", "PB 11")
F_15E:defineString("F_MPCD_PBLABEL_12", function()
	return F_MPCD_BUTTONS[12]
end, 10, "Front Center MPCD Labels", "PB 12")
F_15E:defineString("F_MPCD_PBLABEL_13", function()
	return F_MPCD_BUTTONS[13]
end, 10, "Front Center MPCD Labels", "PB 13")
F_15E:defineString("F_MPCD_PBLABEL_14", function()
	return F_MPCD_BUTTONS[14]
end, 10, "Front Center MPCD Labels", "PB 14")
F_15E:defineString("F_MPCD_PBLABEL_15", function()
	return F_MPCD_BUTTONS[15]
end, 10, "Front Center MPCD Labels", "PB 15")
F_15E:defineString("F_MPCD_PBLABEL_16", function()
	return F_MPCD_BUTTONS[16]
end, 10, "Front Center MPCD Labels", "PB 16")
F_15E:defineString("F_MPCD_PBLABEL_17", function()
	return F_MPCD_BUTTONS[17]
end, 10, "Front Center MPCD Labels", "PB 17")
F_15E:defineString("F_MPCD_PBLABEL_18", function()
	return F_MPCD_BUTTONS[18]
end, 10, "Front Center MPCD Labels", "PB 18")
F_15E:defineString("F_MPCD_PBLABEL_19", function()
	return F_MPCD_BUTTONS[19]
end, 10, "Front Center MPCD Labels", "PB 19")
F_15E:defineString("F_MPCD_PBLABEL_20", function()
	return F_MPCD_BUTTONS[20]
end, 10, "Front Center MPCD Labels", "PB 20")

F_15E:defineString("F_MPDR_PBLABEL_01", function()
	return F_MPDR_BUTTONS[1]
end, 10, "Front Right MPD Labels", "PB 01")
F_15E:defineString("F_MPDR_PBLABEL_02", function()
	return F_MPDR_BUTTONS[2]
end, 10, "Front Right MPD Labels", "PB 02")
F_15E:defineString("F_MPDR_PBLABEL_03", function()
	return F_MPDR_BUTTONS[3]
end, 10, "Front Right MPD Labels", "PB 03")
F_15E:defineString("F_MPDR_PBLABEL_04", function()
	return F_MPDR_BUTTONS[4]
end, 10, "Front Right MPD Labels", "PB 04")
F_15E:defineString("F_MPDR_PBLABEL_05", function()
	return F_MPDR_BUTTONS[5]
end, 10, "Front Right MPD Labels", "PB 05")
F_15E:defineString("F_MPDR_PBLABEL_06", function()
	return F_MPDR_BUTTONS[6]
end, 10, "Front Right MPD Labels", "PB 06")
F_15E:defineString("F_MPDR_PBLABEL_07", function()
	return F_MPDR_BUTTONS[7]
end, 10, "Front Right MPD Labels", "PB 07")
F_15E:defineString("F_MPDR_PBLABEL_08", function()
	return F_MPDR_BUTTONS[8]
end, 10, "Front Right MPD Labels", "PB 08")
F_15E:defineString("F_MPDR_PBLABEL_09", function()
	return F_MPDR_BUTTONS[9]
end, 10, "Front Right MPD Labels", "PB 09")
F_15E:defineString("F_MPDR_PBLABEL_10", function()
	return F_MPDR_BUTTONS[10]
end, 10, "Front Right MPD Labels", "PB 10")
F_15E:defineString("F_MPDR_PBLABEL_11", function()
	return F_MPDR_BUTTONS[11]
end, 10, "Front Right MPD Labels", "PB 11")
F_15E:defineString("F_MPDR_PBLABEL_12", function()
	return F_MPDR_BUTTONS[12]
end, 10, "Front Right MPD Labels", "PB 12")
F_15E:defineString("F_MPDR_PBLABEL_13", function()
	return F_MPDR_BUTTONS[13]
end, 10, "Front Right MPD Labels", "PB 13")
F_15E:defineString("F_MPDR_PBLABEL_14", function()
	return F_MPDR_BUTTONS[14]
end, 10, "Front Right MPD Labels", "PB 14")
F_15E:defineString("F_MPDR_PBLABEL_15", function()
	return F_MPDR_BUTTONS[15]
end, 10, "Front Right MPD Labels", "PB 15")
F_15E:defineString("F_MPDR_PBLABEL_16", function()
	return F_MPDR_BUTTONS[16]
end, 10, "Front Right MPD Labels", "PB 16")
F_15E:defineString("F_MPDR_PBLABEL_17", function()
	return F_MPDR_BUTTONS[17]
end, 10, "Front Right MPD Labels", "PB 17")
F_15E:defineString("F_MPDR_PBLABEL_18", function()
	return F_MPDR_BUTTONS[18]
end, 10, "Front Right MPD Labels", "PB 18")
F_15E:defineString("F_MPDR_PBLABEL_19", function()
	return F_MPDR_BUTTONS[19]
end, 10, "Front Right MPD Labels", "PB 19")
F_15E:defineString("F_MPDR_PBLABEL_20", function()
	return F_MPDR_BUTTONS[20]
end, 10, "Front Right MPD Labels", "PB 20")

local R_MPCDL_BUTTONS = {}

local R_MPDL_BUTTONS = {}

local R_MPDR_BUTTONS = {}

local R_MPCDR_BUTTONS = {}

F_15E:addExportHook(function()
	local output = parseMFDButtons(10)
	if not output then
		return
	end
	R_MPCDL_BUTTONS = output
end)

F_15E:addExportHook(function()
	local output = parseMFDButtons(12)
	if not output then
		return
	end

	R_MPDL_BUTTONS = output
end)

F_15E:addExportHook(function()
	local output = parseMFDButtons(14)
	if not output then
		return
	end

	R_MPDR_BUTTONS = output
end)

F_15E:addExportHook(function()
	local output = parseMFDButtons(16)
	if not output then
		return
	end

	R_MPCDR_BUTTONS = output
end)

F_15E:defineString("R_MPCDL_PBLABEL_01", function()
	return R_MPCDL_BUTTONS[1]
end, 10, "Rear Left MPCD Labels", "PB 01")
F_15E:defineString("R_MPCDL_PBLABEL_02", function()
	return R_MPCDL_BUTTONS[2]
end, 10, "Rear Left MPCD Labels", "PB 02")
F_15E:defineString("R_MPCDL_PBLABEL_03", function()
	return R_MPCDL_BUTTONS[3]
end, 10, "Rear Left MPCD Labels", "PB 03")
F_15E:defineString("R_MPCDL_PBLABEL_04", function()
	return R_MPCDL_BUTTONS[4]
end, 10, "Rear Left MPCD Labels", "PB 04")
F_15E:defineString("R_MPCDL_PBLABEL_05", function()
	return R_MPCDL_BUTTONS[5]
end, 10, "Rear Left MPCD Labels", "PB 05")
F_15E:defineString("R_MPCDL_PBLABEL_06", function()
	return R_MPCDL_BUTTONS[6]
end, 10, "Rear Left MPCD Labels", "PB 06")
F_15E:defineString("R_MPCDL_PBLABEL_07", function()
	return R_MPCDL_BUTTONS[7]
end, 10, "Rear Left MPCD Labels", "PB 07")
F_15E:defineString("R_MPCDL_PBLABEL_08", function()
	return R_MPCDL_BUTTONS[8]
end, 10, "Rear Left MPCD Labels", "PB 08")
F_15E:defineString("R_MPCDL_PBLABEL_09", function()
	return R_MPCDL_BUTTONS[9]
end, 10, "Rear Left MPCD Labels", "PB 9")
F_15E:defineString("R_MPCDL_PBLABEL_10", function()
	return R_MPCDL_BUTTONS[10]
end, 10, "Rear Left MPCD Labels", "PB 10")
F_15E:defineString("R_MPCDL_PBLABEL_11", function()
	return R_MPCDL_BUTTONS[11]
end, 10, "Rear Left MPCD Labels", "PB 11")
F_15E:defineString("R_MPCDL_PBLABEL_12", function()
	return R_MPCDL_BUTTONS[12]
end, 10, "Rear Left MPCD Labels", "PB 12")
F_15E:defineString("R_MPCDL_PBLABEL_13", function()
	return R_MPCDL_BUTTONS[13]
end, 10, "Rear Left MPCD Labels", "PB 13")
F_15E:defineString("R_MPCDL_PBLABEL_14", function()
	return R_MPCDL_BUTTONS[14]
end, 10, "Rear Left MPCD Labels", "PB 14")
F_15E:defineString("R_MPCDL_PBLABEL_15", function()
	return R_MPCDL_BUTTONS[15]
end, 10, "Rear Left MPCD Labels", "PB 15")
F_15E:defineString("R_MPCDL_PBLABEL_16", function()
	return R_MPCDL_BUTTONS[16]
end, 10, "Rear Left MPCD Labels", "PB 16")
F_15E:defineString("R_MPCDL_PBLABEL_17", function()
	return R_MPCDL_BUTTONS[17]
end, 10, "Rear Left MPCD Labels", "PB 17")
F_15E:defineString("R_MPCDL_PBLABEL_18", function()
	return R_MPCDL_BUTTONS[18]
end, 10, "Rear Left MPCD Labels", "PB 18")
F_15E:defineString("R_MPCDL_PBLABEL_19", function()
	return R_MPCDL_BUTTONS[19]
end, 10, "Rear Left MPCD Labels", "PB 19")
F_15E:defineString("R_MPCDL_PBLABEL_20", function()
	return R_MPCDL_BUTTONS[20]
end, 10, "Rear Left MPCD Labels", "PB 20")

F_15E:defineString("R_MPDL_PBLABEL_01", function()
	return R_MPDL_BUTTONS[1]
end, 10, "Rear Left MPD Labels", "PB 01")
F_15E:defineString("R_MPDL_PBLABEL_02", function()
	return R_MPDL_BUTTONS[2]
end, 10, "Rear Left MPD Labels", "PB 02")
F_15E:defineString("R_MPDL_PBLABEL_03", function()
	return R_MPDL_BUTTONS[3]
end, 10, "Rear Left MPD Labels", "PB 03")
F_15E:defineString("R_MPDL_PBLABEL_04", function()
	return R_MPDL_BUTTONS[4]
end, 10, "Rear Left MPD Labels", "PB 04")
F_15E:defineString("R_MPDL_PBLABEL_05", function()
	return R_MPDL_BUTTONS[5]
end, 10, "Rear Left MPD Labels", "PB 05")
F_15E:defineString("R_MPDL_PBLABEL_06", function()
	return R_MPDL_BUTTONS[6]
end, 10, "Rear Left MPD Labels", "PB 06")
F_15E:defineString("R_MPDL_PBLABEL_07", function()
	return R_MPDL_BUTTONS[7]
end, 10, "Rear Left MPD Labels", "PB 07")
F_15E:defineString("R_MPDL_PBLABEL_08", function()
	return R_MPDL_BUTTONS[8]
end, 10, "Rear Left MPD Labels", "PB 08")
F_15E:defineString("R_MPDL_PBLABEL_09", function()
	return R_MPDL_BUTTONS[9]
end, 10, "Rear Left MPD Labels", "PB 09")
F_15E:defineString("R_MPDL_PBLABEL_10", function()
	return R_MPDL_BUTTONS[10]
end, 10, "Rear Left MPD Labels", "PB 10")
F_15E:defineString("R_MPDL_PBLABEL_11", function()
	return R_MPDL_BUTTONS[11]
end, 10, "Rear Left MPD Labels", "PB 11")
F_15E:defineString("R_MPDL_PBLABEL_12", function()
	return R_MPDL_BUTTONS[12]
end, 10, "Rear Left MPD Labels", "PB 12")
F_15E:defineString("R_MPDL_PBLABEL_13", function()
	return R_MPDL_BUTTONS[13]
end, 10, "Rear Left MPD Labels", "PB 13")
F_15E:defineString("R_MPDL_PBLABEL_14", function()
	return R_MPDL_BUTTONS[14]
end, 10, "Rear Left MPD Labels", "PB 14")
F_15E:defineString("R_MPDL_PBLABEL_15", function()
	return R_MPDL_BUTTONS[15]
end, 10, "Rear Left MPD Labels", "PB 15")
F_15E:defineString("R_MPDL_PBLABEL_16", function()
	return R_MPDL_BUTTONS[16]
end, 10, "Rear Left MPD Labels", "PB 16")
F_15E:defineString("R_MPDL_PBLABEL_17", function()
	return R_MPDL_BUTTONS[17]
end, 10, "Rear Left MPD Labels", "PB 17")
F_15E:defineString("R_MPDL_PBLABEL_18", function()
	return R_MPDL_BUTTONS[18]
end, 10, "Rear Left MPD Labels", "PB 18")
F_15E:defineString("R_MPDL_PBLABEL_19", function()
	return R_MPDL_BUTTONS[19]
end, 10, "Rear Left MPD Labels", "PB 19")
F_15E:defineString("R_MPDL_PBLABEL_20", function()
	return R_MPDL_BUTTONS[20]
end, 10, "Rear Left MPD Labels", "PB 20")

F_15E:defineString("R_MPDR_PBLABEL_01", function()
	return R_MPDR_BUTTONS[1]
end, 10, "Rear Right MPD Labels", "PB 01")
F_15E:defineString("R_MPDR_PBLABEL_02", function()
	return R_MPDR_BUTTONS[2]
end, 10, "Rear Right MPD Labels", "PB 02")
F_15E:defineString("R_MPDR_PBLABEL_03", function()
	return R_MPDR_BUTTONS[3]
end, 10, "Rear Right MPD Labels", "PB 03")
F_15E:defineString("R_MPDR_PBLABEL_04", function()
	return R_MPDR_BUTTONS[4]
end, 10, "Rear Right MPD Labels", "PB 04")
F_15E:defineString("R_MPDR_PBLABEL_05", function()
	return R_MPDR_BUTTONS[5]
end, 10, "Rear Right MPD Labels", "PB 05")
F_15E:defineString("R_MPDR_PBLABEL_06", function()
	return R_MPDR_BUTTONS[6]
end, 10, "Rear Right MPD Labels", "PB 06")
F_15E:defineString("R_MPDR_PBLABEL_07", function()
	return R_MPDR_BUTTONS[7]
end, 10, "Rear Right MPD Labels", "PB 07")
F_15E:defineString("R_MPDR_PBLABEL_08", function()
	return R_MPDR_BUTTONS[8]
end, 10, "Rear Right MPD Labels", "PB 08")
F_15E:defineString("R_MPDR_PBLABEL_09", function()
	return R_MPDR_BUTTONS[9]
end, 10, "Rear Right MPD Labels", "PB 09")
F_15E:defineString("R_MPDR_PBLABEL_10", function()
	return R_MPDR_BUTTONS[10]
end, 10, "Rear Right MPD Labels", "PB 10")
F_15E:defineString("R_MPDR_PBLABEL_11", function()
	return R_MPDR_BUTTONS[11]
end, 10, "Rear Right MPD Labels", "PB 11")
F_15E:defineString("R_MPDR_PBLABEL_12", function()
	return R_MPDR_BUTTONS[12]
end, 10, "Rear Right MPD Labels", "PB 12")
F_15E:defineString("R_MPDR_PBLABEL_13", function()
	return R_MPDR_BUTTONS[13]
end, 10, "Rear Right MPD Labels", "PB 13")
F_15E:defineString("R_MPDR_PBLABEL_14", function()
	return R_MPDR_BUTTONS[14]
end, 10, "Rear Right MPD Labels", "PB 14")
F_15E:defineString("R_MPDR_PBLABEL_15", function()
	return R_MPDR_BUTTONS[15]
end, 10, "Rear Right MPD Labels", "PB 15")
F_15E:defineString("R_MPDR_PBLABEL_16", function()
	return R_MPDR_BUTTONS[16]
end, 10, "Rear Right MPD Labels", "PB 16")
F_15E:defineString("R_MPDR_PBLABEL_17", function()
	return R_MPDR_BUTTONS[17]
end, 10, "Rear Right MPD Labels", "PB 17")
F_15E:defineString("R_MPDR_PBLABEL_18", function()
	return R_MPDR_BUTTONS[18]
end, 10, "Rear Right MPD Labels", "PB 18")
F_15E:defineString("R_MPDR_PBLABEL_19", function()
	return R_MPDR_BUTTONS[19]
end, 10, "Rear Right MPD Labels", "PB 19")
F_15E:defineString("R_MPDR_PBLABEL_20", function()
	return R_MPDR_BUTTONS[20]
end, 10, "Rear Right MPD Labels", "PB 20")

F_15E:defineString("R_MPCDR_PBLABEL_01", function()
	return R_MPCDR_BUTTONS[1]
end, 10, "Rear Right MPCD Labels", "PB 01")
F_15E:defineString("R_MPCDR_PBLABEL_02", function()
	return R_MPCDR_BUTTONS[2]
end, 10, "Rear Right MPCD Labels", "PB 02")
F_15E:defineString("R_MPCDR_PBLABEL_03", function()
	return R_MPCDR_BUTTONS[3]
end, 10, "Rear Right MPCD Labels", "PB 03")
F_15E:defineString("R_MPCDR_PBLABEL_04", function()
	return R_MPCDR_BUTTONS[4]
end, 10, "Rear Right MPCD Labels", "PB 04")
F_15E:defineString("R_MPCDR_PBLABEL_05", function()
	return R_MPCDR_BUTTONS[5]
end, 10, "Rear Right MPCD Labels", "PB 05")
F_15E:defineString("R_MPCDR_PBLABEL_06", function()
	return R_MPCDR_BUTTONS[6]
end, 10, "Rear Right MPCD Labels", "PB 06")
F_15E:defineString("R_MPCDR_PBLABEL_07", function()
	return R_MPCDR_BUTTONS[7]
end, 10, "Rear Right MPCD Labels", "PB 07")
F_15E:defineString("R_MPCDR_PBLABEL_08", function()
	return R_MPCDR_BUTTONS[8]
end, 10, "Rear Right MPCD Labels", "PB 08")
F_15E:defineString("R_MPCDR_PBLABEL_09", function()
	return R_MPCDR_BUTTONS[9]
end, 10, "Rear Right MPCD Labels", "PB 09")
F_15E:defineString("R_MPCDR_PBLABEL_10", function()
	return R_MPCDR_BUTTONS[10]
end, 10, "Rear Right MPCD Labels", "PB 10")
F_15E:defineString("R_MPCDR_PBLABEL_11", function()
	return R_MPCDR_BUTTONS[11]
end, 10, "Rear Right MPCD Labels", "PB 11")
F_15E:defineString("R_MPCDR_PBLABEL_12", function()
	return R_MPCDR_BUTTONS[12]
end, 10, "Rear Right MPCD Labels", "PB 12")
F_15E:defineString("R_MPCDR_PBLABEL_13", function()
	return R_MPCDR_BUTTONS[13]
end, 10, "Rear Right MPCD Labels", "PB 13")
F_15E:defineString("R_MPCDR_PBLABEL_14", function()
	return R_MPCDR_BUTTONS[14]
end, 10, "Rear Right MPCD Labels", "PB 14")
F_15E:defineString("R_MPCDR_PBLABEL_15", function()
	return R_MPCDR_BUTTONS[15]
end, 10, "Rear Right MPCD Labels", "PB 15")
F_15E:defineString("R_MPCDR_PBLABEL_16", function()
	return R_MPCDR_BUTTONS[16]
end, 10, "Rear Right MPCD Labels", "PB 16")
F_15E:defineString("R_MPCDR_PBLABEL_17", function()
	return R_MPCDR_BUTTONS[17]
end, 10, "Rear Right MPCD Labels", "PB 17")
F_15E:defineString("R_MPCDR_PBLABEL_18", function()
	return R_MPCDR_BUTTONS[18]
end, 10, "Rear Right MPCD Labels", "PB 18")
F_15E:defineString("R_MPCDR_PBLABEL_19", function()
	return R_MPCDR_BUTTONS[19]
end, 10, "Rear Right MPCD Labels", "PB 19")
F_15E:defineString("R_MPCDR_PBLABEL_20", function()
	return R_MPCDR_BUTTONS[20]
end, 10, "Rear Right MPCD Labels", "PB 20")

return F_15E
