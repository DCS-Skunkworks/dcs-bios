BIOS.a10c = {}
local parse_indication = BIOS.util.parse_indication



local indicatorLightMap = {
	["MASTER-CAUTION"] = 404,
	["ENG_START_CYCLE"] = 480,
	["L_HYD_PRESS"] = 481,
	["R_HYD_PRESS"] = 482,
	["GUN_UNSAFE"] = 483,
	["ANTISKID"] = 484,
	["L_HYD_RES"] = 485,
	["R_HYD_RES"] = 486,
	["OXY_LOW"] = 487,
	["ELEV_DISENG"] = 488,
	["VOID1"] = 489,
	["SEAT_NOT_ARMED"] = 490,
	["BLEED_AIR_LEAK"] = 491,
	["AIL_DISENG"] = 492,
	["L_AIL_TAB"] = 493,
	["R_AIL_TAB"] = 494,
	["SERVICE_AIR_HOT"] = 495,
	["PITCH_SAS"] = 496,
	["L_ENG_HOT"] = 497,
	["R_ENG_HOT"] = 498,
	["WINDSHIELD_HOT"] = 499,
	["YAW_SAS"] = 500,
	["L_ENG_OIL_PRESS"] = 501,
	["R_ENG_OIL_PRESS"] = 502,
	["CICU"] = 503,
	["GCAS"] = 504,
	["L_MAIN_PUMP"] = 505,
	["R_MAIN_PUMP"] = 506,
	["VOID2"] = 507,
	["LASTE"] = 508,
	["L_WING_PUMP"] = 509,
	["R_WING_PUMP"] = 510,
	["HARS"] = 511,
	["IFF_MODE_4"] = 512,
	["L_MAIN_FUEL_LOW"] = 513,
	["R_MAIN_FUEL_LOW"] = 514,
	["L_R_TKS_UNEQUAL"] = 515,
	["EAC"] = 516,
	["L_FUEL_PRESS"] = 517,
	["R_FUEL_PRESS"] = 518,
	["NAV"] = 519,
	["STALL_SYS"] = 520,
	["L_CONV"] = 521,
	["R_CONV"] = 522,
	["CADC"] = 523,
	["APU_GEN"] = 524,
	["L_GEN"] = 525,
	["R_GEN"] = 526,
	["INST_INV"] = 527,
	
	["AOA_INDEXER_HIGH"] = 540,
	["AOA_INDEXER_NORM"] = 541,
	["AOA_INDEXER_LOW"] = 542,
	
	["TAKE_OFF_TRIM"] = 191,
	["LANDING_GEAR_N_SAFE"] = 659,
	["LANDING_GEAR_L_SAFE"] = 660,
	["LANDING_GEAR_R_SAFE"] = 661,
	["HANDLE_GEAR_WARNING"] = 737,
	["NOSEWHEEL_STEERING"] = 663,
	
	["L_ENG_FIRE"] = 215,
	["APU_FIRE"] = 216,
	["R_ENG_FIRE"] = 217,
	
	["MARKER_BEACON"] = 664,
	
	["AIR_REFUEL_READY"] = 730,
	["AIR_REFUEL_LATCHED"] = 731,
	["AIR_REFUEL_DISCONNECT"] = 732,
	
	["L_AILERON_EMER_DISENGAGE"] = 178,
	["R_AILERON_EMER_DISENGAGE"] = 179,
	["L_ELEVATOR_EMER_DISENGAGE"] = 181,
	["R_ELEVATOR_EMER_DISENGAGE"] = 182,
	
	["GUN_READY"] = 662,
	["CANOPY_UNLOCKED"] = 665,
	
	["TACAN-TEST"] = 260,
}
BIOS.a10c.indicatorLightMap = indicatorLightMap

local function getCMSPDisplayLines(dev0)
	local cmsp = BIOS.util.parse_indication(7)
	if not cmsp then
		local emptyline = string.format("%20s", "") -- 20 spaces
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
BIOS.a10c.getCMSPDisplayLines = getCMSPDisplayLines

local function getUHFPreset()
    local ind = parse_indication(10)
    if ind == nil then return " " end
    return ind["txtPresetChannel"]
end
BIOS.a10c.getUHFPreset = getUHFPreset

local function getUHFFrequency()
    local ind = parse_indication(11)
    if ind == nil then return "       " end
    local freqStatus = ind["txtFreqStatus"] -- e.g. "251000"
    return freqStatus:sub(0,3) .. "." .. freqStatus:sub(4,6)
end
BIOS.a10c.getUHFFrequency = getUHFFrequency



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

function getVhfAmFreqency()
    local freq1 = vhf_lut1[string.format("%.2f",GetDevice(0):get_argument_value(143))]
    local freq2 = string.format("%1.1f", GetDevice(0):get_argument_value(144)):sub(3)
    local freq3 = string.format("%1.1f", GetDevice(0):get_argument_value(145)):sub(3)
    local freq4 = string.format("%1.2f", GetDevice(0):get_argument_value(146)):sub(3)

    return freq1 .. freq2 .. "." .. freq3 .. freq4
end
BIOS.a10c.getVhfAmFreqency = getVhfAmFreqency

function getVhfFmFreqency()
    local freq1 = vhf_lut1[string.format("%.2f",GetDevice(0):get_argument_value(157))]
    local freq2 = string.format("%1.1f", GetDevice(0):get_argument_value(158)):sub(3)
    local freq3 = string.format("%1.1f", GetDevice(0):get_argument_value(159)):sub(3)
    local freq4 = string.format("%1.2f", GetDevice(0):get_argument_value(160)):sub(3)

    return freq1 .. freq2 .. "." .. freq3 .. freq4
end
BIOS.a10c.getVhfFmFreqency = getVhfFmFreqency

function getVhfAmPreset()
    return tostring(tonumber(string.format("%.2f", GetDevice(0):get_argument_value(137)):sub(3))+1)
end
BIOS.a10c.getVhfAmPreset = getVhfAmPreset

function getVhfFmPreset()
	return tostring(tonumber(string.format("%.2f", GetDevice(0):get_argument_value(151)):sub(3))+1)
end
BIOS.a10c.getVhfFmPreset = getVhfFmPreset




local function getTacanChannel()
    local tcn_2 = ""
    if GetDevice(0):get_argument_value(263) == 1 then
        tcn_2 = " "
    else
    	tcn_2 = "1"    
    end
    local tcn_1 = string.format("%.1f", GetDevice(0):get_argument_value(264)):sub(3)
    local tcn_0 = string.format("%.1f", GetDevice(0):get_argument_value(265)):sub(3)

    local tcn_xy_lut = {"X", "Y"}
    local tcn_xy = tcn_xy_lut[GetDevice(0):get_argument_value(266)+1]

    return tcn_2 .. tcn_1 .. tcn_0 .. tcn_xy
end
BIOS.a10c.getTacanChannel = getTacanChannel

local function getTacanMode(dev0)
	return string.format("%.2f", dev0:get_argument_value(262)):sub(3,3)
end
BIOS.a10c.getTacanMode = getTacanMode
local function setTacanMode(new_mode)
	if type(new_mode) == "string" then new_mode = tonumber(new_mode) end
	GetDevice(51):performClickableAction(3008, new_mode/10)
end
BIOS.a10c.setTacanMode = setTacanMode

local function getTacanTestBtn(dev0)
	return dev0:get_argument_value(259)
end
BIOS.a10c.getTacanTestBtn = getTacanTestBtn
local function setTacanTestBtn(state)
	if type(state) == "string" then state = tonumber(state) end
	GetDevice(51):performClickableAction(3006, state)
end
BIOS.a10c.setTacanTestBtn = setTacanTestBtn

local function getTacanVolume(dev0)
	local vol = dev0:get_argument_value(261) -- 0.0 to 1.0
	return string.format("%d", vol*255)
end
BIOS.a10c.getTacanVolume = getTacanVolume
local function setTacanVolume(new_vol)
	if type(new_vol) == "string" then new_vol = tonumber(new_vol) end
	GetDevice(51):performClickableAction(3007, new_vol/255)
end
BIOS.a10c.setTacanVolume = setTacanVolume

local function modTacanChannel(arg)
	if arg == "-10" then GetDevice(51):performClickableAction(3001, -0.1) end
	if arg == "+10" then GetDevice(51):performClickableAction(3001, 0.1) end
	if arg == "-1" then GetDevice(51):performClickableAction(3003, -0.1) end
	if arg == "+1" then GetDevice(51):performClickableAction(3003, 0.1) end
	if arg == "XY" then GetDevice(51):performClickableAction(3005, 0.1) end
end

local function decTacanChannelTens()
	GetDevice(51):performClickableAction(3001, -0.1)
end
local function incTacanChannelTens()
	GetDevice(51):performClickableAction(3001, 0.1)
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
BIOS.a10c.getILSFrequency = getILSFrequency


BIOS.a10c.inputProcessors = {
	["TACAN-MODE"] = setTacanMode,
	["TACAN-TEST-BTN"] = setTacanTestBtn,
	["TACAN-VOLUME"] = setTacanVolume,
	["TACAN"] = modTacanChannel
}
BIOS.a10c.inputProcessors["MASTER-CAUTION-BTN"] = function(args)
	local sys_controller = GetDevice(24)
	if args == "1" then
		sys_controller:performClickableAction(3001, 1.0)
	end
	if args == "0" then
		sys_controller:performClickableAction(3001, 0.0)
	end
end
function BIOS.a10c.exportHighFrequency()
	local dev0 = GetDevice(0)
	local setMsgArg = BIOS.protocol.setMsgArg
	
	for k, v in pairs(BIOS.a10c.indicatorLightMap) do
		setMsgArg(k, string.format("%d", dev0:get_argument_value(v)))
	end
end
local function exportLowFrequency()
	local dev0 = GetDevice(0)
	local setMsgArg = BIOS.protocol.setMsgArg
	
	local line1, line2 = getCMSPDisplayLines(dev0)
	setMsgArg("CMSP1", line1)
	setMsgArg("CMSP2", line2)
	
	setMsgArg("UHF-FREQUENCY", getUHFFrequency(dev0))
	setMsgArg("UHF-PRESET", getUHFPreset(dev0))
	setMsgArg("VHF-AM-FREQUENCY", getVhfAmFreqency(dev0))
	setMsgArg("VHF-AM-PRESET", getVhfAmPreset(dev0))
	setMsgArg("VHF-FM-FREQUENCY", getVhfFmFreqency(dev0))
	setMsgArg("VHF-FM-PRESET", getVhfFmPreset(dev0))
	
	setMsgArg("TACAN-CHANNEL", getTacanChannel(dev0))
	setMsgArg("TACAN-MODE", getTacanMode(dev0))
	setMsgArg("TACAN-TEST-BTN", getTacanTestBtn(dev0))
	setMsgArg("TACAN-VOLUME", getTacanVolume(dev0))
	setMsgArg("ILS-FREQUENCY", getILSFrequency(dev0))
	
end
BIOS.a10c.exportLowFrequency = exportLowFrequency
