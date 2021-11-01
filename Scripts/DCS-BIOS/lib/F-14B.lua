BIOS.protocol.beginModule("F-14B", 0x1200)
BIOS.protocol.setExportModuleAircrafts({"F-14B", "F-14A-135-GR"})
--v4.3b by WarLord (aka BlackLibrary), ArturDCS, Matchstick and Bullitt

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local define3PosTumb = BIOS.util.define3PosTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineString = BIOS.util.defineString

-- remove Arg# Stick 33

----------------------------------------- Extra Functions
local function defineIndicatorLightMulti1(msg, arg_number, category, description) --red
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) >= 0.4 and dev0:get_argument_value(arg_number) < 0.6 then
			value:setValue(1)
		else
		    value:setValue(0)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "led",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "Multi Led Color 1; Light is on between 0.4 and 0.59"
			}
		}
	}
end

local function defineIndicatorLightMulti2(msg, arg_number, category, description) --green
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) >= 0.8 and dev0:get_argument_value(arg_number) < 0.99 then
			value:setValue(1)
		else
		    value:setValue(0)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "led",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "Multi Led Color 2; Light is on between 0.8 and 0.98"
			}
		}
	}
end

local function defineIndicatorLightLANTTop(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) >= 0.24 and dev0:get_argument_value(arg_number) < 0.49 then
			value:setValue(1)
		else
		    value:setValue(0)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "led",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "LANTRIN Led Top; Light is on between 0.24 and 0.48"
			}
		}
	}
end

local function defineIndicatorLightLANT(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) >= 0.49 and dev0:get_argument_value(arg_number) < 0.55 then
			value:setValue(1)
		else
		    value:setValue(0)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "led",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "LANTRIN Led Booth; Light is on between 0.49 and 0.54"
			}
		}
	}
end

local function defineIndicatorLightLANTBottom(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) >= 0.55 and dev0:get_argument_value(arg_number) < 0.99 then
			value:setValue(1)
		else
		    value:setValue(0)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "led",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "LANTRIN Led Bottom; Light is on between 0.55 and 0.98"
			}
		}
	}
end

local function getHUD_Mode()
    local hud_m = "1"
	if GetDevice(0) == nil then
        hud_m = "1"
    elseif GetDevice(0):get_argument_value(1015) == 1 then  --Take Off
        hud_m = "1"
    elseif GetDevice(0):get_argument_value(1014) == 1 then  --Cruise  
        hud_m = "2"
    elseif GetDevice(0):get_argument_value(1013) == 1 then  --A2A  
        hud_m = "3"
    elseif GetDevice(0):get_argument_value(1012) == 1 then  --A2G 
        hud_m = "4"
    elseif GetDevice(0):get_argument_value(1011) == 1 then  --Landing  
        hud_m = "5"    
	else
	    hud_m = "1"
    end
    return hud_m
end

local function getSTEER_Mode()
    local steer_m = "2"
    if GetDevice(0) == nil then
        steer_m = "2"
	elseif GetDevice(0):get_argument_value(1002) == 1 then  --TACAN
        steer_m = "1"
    elseif GetDevice(0):get_argument_value(1003) == 1 then  --DEST 
        steer_m = "2"
    elseif GetDevice(0):get_argument_value(1004) == 1 then  --AWL/PCD  
        steer_m = "3"
    elseif GetDevice(0):get_argument_value(1005) == 1 then  --Vector
        steer_m = "4"
    elseif GetDevice(0):get_argument_value(1006) == 1 then  --Manual  
        steer_m = "5"    
	else
	    steer_m = "2"		
    end
    return steer_m
end

local function getAIRSOURCE_Mode()
    local airsource_m = "5"
	if GetDevice(0) == nil then
        airsource_m = "5"
    elseif GetDevice(0):get_argument_value(929) == 1 then  --RAM
        airsource_m = "1"
    elseif GetDevice(0):get_argument_value(930) == 1 then  --LEFT
        airsource_m = "2"
    elseif GetDevice(0):get_argument_value(931) == 1 then  --RIGHT
        airsource_m = "3"
    elseif GetDevice(0):get_argument_value(932) == 1 then  --BOTH
        airsource_m = "4"
    elseif GetDevice(0):get_argument_value(933) == 1 then  --OFF  
        airsource_m = "5"    
	else
	    airsource_m = "5"		
    end
    return airsource_m
end

--------------------------------- Matchstick --------------------------------- 
local function parse_indication_number_index(indicator_id)  -- Thanks to [FSF]Ian code
-- Custom version of parse_indication function that uses numbers for the index of the output table
-- for use in situations where the names of values in the indication are unusable (eg random GUID)
-- also adds the number of rows to the table at index 0
	local t = {}
	local li = list_indication(indicator_id)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	local counter = 0
	while true do
		local name, value = m()
		counter = counter + 1
		if not name then break end
				t[counter]=value
	end
	t[0] = counter
	if t == nil then return end
	return t
end

local function get_radio_remote_display(indicatorId,testButtonId)-- Get data from specified device (9 for Pilot UHF, 10 for RIO UHF, 13 for Pilot VHF/UHF)
	local data = parse_indication_number_index(indicatorId);
-- Get status of relevant test button (ID 15004 for Pilot UHF, 405 for RIO UHF, 15003 for Pilot VHF/UHF)
	local testPressed = GetDevice(0):get_argument_value(testButtonId)
	local retVal

	if data and data[0] then
-- data[0] holds the length of the data table. 7 Indicates it is in manual frequency mode otherwise it is in preset mode.
-- testPressed indicates the current value of the specified radio display test button - if pressed we need to return the test value not the current manual or preset frequency.
-- depending on the type of data and the test button status assemble the result including separator if necessary.
		if data[0]==7 and testPressed == 0 then
			retVal  = data[5]:sub(1,3) .. data[6] .. data[5]:sub(4)
		elseif data[0]==7 then
			retVal  = data[3]:sub(1,3) .. data[4] .. data[3]:sub(4)
		elseif testPressed == 0 then
			retVal = data[5]
		else
			retVal = data[3]:sub(1,3)  .. data[4] .. data[3]:sub(4)
		end
	end
	if retVal == nil then return end
	return retVal
end

local HSD_TACAN_RANGE = ""
local HSD_TACAN_CRS = ""
local HSD_MAN_CRS = ""

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	HSDInd = parse_indication_number_index(1);
        if getSTEER_Mode()=="1" then
            HSD_TACAN_RANGE = HSDInd[19]
            HSD_TACAN_CRS = HSDInd[20]
			HSD_TACAN_CRSint = tonumber(HSD_TACAN_CRS)
        elseif getSTEER_Mode()=="5" then
            HSD_MAN_CRS = HSDInd[16]
			HSD_MAN_CRSint = tonumber(HSD_MAN_CRS)
        end
end
--------------------------------- Matchstick End ---------------------------------  

----------------------------------------- BIOS-Profile  

-- Hydraulics
defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_SW", 13, 3001, 629, "Hydraulics", "PILOT Hydraulic Transfer Pump Switch")
defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_COVER", 13, 3002, 630, "Hydraulics", "PILOT Hydraulic Transfer Pump Switch Cover")
defineToggleSwitch("PLT_HYD_ISOL_SW", 13, 3005, 631, "Hydraulics", "PILOT Hydraulic Isolation Switch")
define3PosTumb("PLT_HYD_EMERG_FCONTR_SW", 13, 3003, 928, "Hydraulics", "PILOT Hydraulic Emergency Flight Control Switch")
defineToggleSwitch("PLT_HYD_EMERG_FCONTR_COVER", 13, 3004, 615, "Hydraulics", "PILOT Hydraulic Emergency Flight Control Switch Cover")
defineToggleSwitch("PLT_HYD_HAND_PUMP", 13, 3006, 13133, "Hydraulics", "PILOT Hydraulic Hand Pump") --632

-- Master Reset
definePushButton("PLT_MASTER_RESET", 23, 3058, 1071, "Master Reset", "PILOT MASTER RESET")

-- AICS
defineToggleSwitch("PLT_INLET_RAMPS_L", 14, 3007, 2100, "AICS", "PILOT Stow Inlet Ramps Left Switch")
defineToggleSwitch("PLT_INLET_RAMPS_R", 14, 3008, 2101, "AICS", "PILOT Stow Inlet Ramps Right Switch")

-- Wing Sweep
defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_COVER", 17, 3029, 317, "Wing Sweep", "PILOT Emergency Wing Sweep Handle Cover")
definePotentiometer("PLT_EMERG_WING_SWEEPLT_LEVER", 17, 3031, 384, {0, 1}, "Wing Sweep", "PILOT Emergency Wing Sweep Handle")
defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_POP", 13, 3030, 15096, "Wing Sweep", "PILOT Emergency Wing Sweep Handle Pop out")

--Radar Altimeter
definePushButton("PLT_RADAR_ALT_BIT", 30, 3485, 16020, "Radar Altimeter", "PILOT Radar Altimeter BIT Test Button")
defineRotary("PLT_RADAR_ALT_KNOB", 30, 3484, 308, "Radar Altimeter", "PILOT Radar Altimeter Control Knob")

-- Airspeed Indicator
definePushButton("PLT_AIRSPD_KNOB_PUSH", 28, 3492, 2127, "Airspeed Indicator", "PILOT Airspeed Indicator Bug Push Knob")
defineRotary("PLT_AIRSPD_KNOB", 28, 3491, 310, "Airspeed Indicator", "PILOT Airspeed Indicator Bug Knob")
definePushButton("RIO_AIRSPD_KNOB_PUSH", 28, 3651, 255, "Airspeed Indicator", "RIO Airspeed Indicator Bug Push Knob")
defineRotary("RIO_AIRSPD_KNOB", 28, 3652, 254, "Airspeed Indicator", "RIO Airspeed Indicator Bug Knob")

-- Altimeter
define3PosTumb("PLT_ALTIMETER_MODE", 29, 3487, 307, "Altimeter", "PILOT Altimeter Mode Switch")
defineRotary("PLT_ALTIMETER_KNOB", 29, 3486, 306, "Altimeter", "PILOT Altimeter Pressure Setting")

-- RIO Altimeter
define3PosTumb("RIO_ALTIMETER_MODE", 29, 3490, 20307, "Altimeter", "RIO Altimeter Mode Switch")
defineRotary("RIO_ALTIMETER_KNOB", 29, 3489, 20306, "Altimeter", "RIO Altimeter Pressure Setting")

-- Gear
defineToggleSwitch("PLT_GEAR_LEVER", 18, 3016, 326, "Gear", "PILOT Landing Gear Lever")
defineToggleSwitch("PLT_GEAR_LEVER_EMERG", 18, 3646, 16015, "Gear", "PILOT Landing Gear Lever RB emergency extend")
definePushButton("PLT_LAUNCHBAR_ABORT", 18, 3672, 497, "Gear", "PILOT Launch Bar Abort")
defineToggleSwitch("PLT_LAUNCHBAR_ABORT_COVER", 18, 3673, 496, "Gear", "PILOT Launch Bar Abort Switch Cover")
define3PosTumb("PLT_NOSE_STRUT_SW", 18, 3019, 1075, "Gear", "PILOT Nose Strut Compression Switch")

-- Hook
defineToggleSwitch("PLT_HOOK_LEVER", 18, 3021, 238, "Gear", "PILOT Hook Extension Handle")
defineToggleSwitch("PLT_HOOK_LEVER_EMERG", 18, 3022, 15078, "Gear", "PILOT Hook Extension Handle RB cycle emergency mode")

-- Brakes
define3PosTumb("PLT_ANTI_SKID_SW", 18, 3014, 1072, "Brakes", "Anti-Skid Spoiler BK Switch")
defineToggleSwitch("PLT_PARK_BRAKE", 18, 3013, 237, "Brakes", "PILOT Parking Brake Handle")

-- SAS
defineToggleSwitch("PLT_AFCS_PITCH", 22, 3034, 2106, "SAS", "PILOT AFCS Stability Augmentation - Pitch")
defineToggleSwitch("PLT_AFCS_ROLL", 22, 3035, 2107, "SAS", "PILOT AFCS Stability Augmentation - Roll")
defineToggleSwitch("PLT_AFCS_YAW", 22, 3036, 2108, "SAS", "PILOT AFCS Stability Augmentation - Yaw")

-- Autopilot
define3PosTumb("PLT_AUTOPLT_VECTOR_CARRIER", 22, 3037, 2109, "Autopilot", "PILOT Autopilot - Vector / Automatic Carrier Landing")
defineToggleSwitch("PLT_AUTOPLT_ALT", 22, 3038, 2110, "Autopilot", "PILOT Autopilot - Altitude Hold")
define3PosTumb("PLT_AUTOPLT_HDG", 22, 3039, 2111, "Autopilot", "PILOT Autopilot - Heading / Ground Track")
defineToggleSwitch("PLT_AUTOPLT_ENGAGE", 22, 3040, 2112, "Autopilot", "PILOT Autopilot - Engage")

-- Flaps
definePotentiometer("PLT_FLAPS_LEVER", 19, 3044, 225, {0, 1}, "Flaps", "PILOT Flaps Lever")

-- Engine
defineToggleSwitch("PLT_ENGINE_FUEL_CUT_L", 20, 3128, 12300, "Engine", "PILOT Left Engine Fuel Cutoff")
defineToggleSwitch("PLT_ENGINE_FUEL_CUT_R", 20, 3129, 12301, "Engine", "PILOT Right Engine Fuel Cutoff")
define3PosTumb("PLT_THROTTLE_MODE", 20, 3045, 2104, "Engine", "PILOT Throttle Mode")
define3PosTumb("PLT_THROTTLE_TEMP", 20, 3047, 2103, "Engine", "PILOT Throttle Temp")
define3PosTumb("PLT_ANTI_ICE", 20, 3049, 941, "Engine", "PILOT Engine/Probe Anti-Ice")
defineToggleSwitch("PLT_ENGINE_AIRSTART", 20, 3050, 2105, "Engine", "PILOT Engine Airstart")
define3PosTumb("PLT_ENGINE_CRANK", 20, 3051, 2102, "Engine", "PILOT Engine Crank")
defineToggleSwitch("PLT_ENGINE_MODE_L", 20, 3052, 16007, "Engine", "PILOT Left Engine Mode")
defineToggleSwitch("PLT_ENGINE_MODE_R", 20, 3053, 16008, "Engine", "PILOT Right Engine Mode")
defineToggleSwitch("PLT_ASY_THRUST_LIMIT_COVER", 20, 3055, 16005, "Engine", "PILOT Asymmetric Thrust Limiter Cover")
defineToggleSwitch("PLT_ASY_THRUST_LIMIT", 20, 3054, 16006, "Engine", "PILOT Asymmetric Thrust Limiter")

-- Fuel System
defineToggleSwitch("PLT_FUEL_SHUTOFF_R", 21, 3061, 1044, "Fuel System", "PILOT Fuel Shutoff - Right")
defineToggleSwitch("PLT_FUEL_SHUTOFF_L", 21, 3062, 15081, "Fuel System", "PILOT Fuel Shutoff - Left")
defineToggleSwitch("PLT_FUEL_FEED_COVER", 21, 3064, 1094, "Fuel System", "PILOT Fuel Feed Cover")
define3PosTumb("PLT_FUEL_FEED", 21, 3065, 1095, "Fuel System", "PILOT Fuel Feed")
define3PosTumb("PLT_FUEL_WING_EXT_TRANS", 21, 3066, 1001, "Fuel System", "PILOT Fuel Wing/Ext Trans")
defineToggleSwitch("PLT_FUEL_DUMP", 21, 3067, 1074, "Fuel System", "PILOT Fuel Dump")
define3PosTumb("PLT_REFUEL_PROBE", 21, 3068, 1073, "Fuel System", "PILOT Refuel Probe")
define3PosTumb("PLT_FUEL_QUANT_SEL", 21, 3063, 1076, "Fuel System", "PILOT Fuel Quantity Selector")
definePotentiometer("PLT_BINGO_FUEL_KNOB", 21, 3069, 1050, {0, 1}, "Flaps", "PILOT BINGO Fuel Level Knob")

-- Electrics
define3PosTumb("PLT_L_GEN_SW", 15, 3009, 937, "Electrics", "PILOT Left Generator Switch")
define3PosTumb("PLT_R_GEN_SW", 15, 3010, 936, "Electrics", "PILOT Right Generator Switch")
defineToggleSwitch("PLT_EMERG_GEN_COVER", 15, 3011, 927, "Electrics", "PILOT Emergency Generator Switch Cover")
defineToggleSwitch("PLT_EMERG_GEN_SW", 15, 3012, 926, "Electrics", "PILOT Emergency Generator Switch")

-- Cockpit Mechanics
defineToggleSwitch("PLT_CANOPY_JETT", 12, 3184, 224, "Cockpit Mechanics", "PILOT Canopy Jettison")
defineToggleSwitch("RIO_CANOPY_JETT", 12, 3760, 2051, "Cockpit Mechanics", "RIO Canopy Jettison")
defineToggleSwitch("RIO_EJECT_CMD", 12, 3185, 2049, "Cockpit Mechanics", "RIO Ejection CMD Lever")
defineToggleSwitch("PLT_EJECT_SEAT_SAFE", 12, 3186, 404, "Cockpit Mechanics", "PILOT Ejection Seat Safety")
defineToggleSwitch("RIO_EJECT_SEAT_SAFE", 12, 3187, 498, "Cockpit Mechanics", "RIO Ejection Seat Safety")
defineToggleSwitch("RIO_STORAGE_BOX", 12, 3612, 122, "Cockpit Mechanics", "RIO Storage Box")

-- Enivornment Control
defineToggleSwitch("PLT_OXY_ON", 12, 3190, 8114, "Enivornment Control", "PILOT Oxygen On")
defineToggleSwitch("RIO_OXY_ON", 12, 3191, 119, "Enivornment Control", "RIO Oxygen On")
defineToggleSwitch("PLT_CABIN_PRESS_DUMP", 12, 3192, 939, "Enivornment Control", "PILOT Cabin Pressure Dump")
definePushButton("PLT_AIR_SOURCE_RAM", 12, 3193, 929, "Enivornment Control", "PILOT Air Source Ram")
definePushButton("PLT_AIR_SOURCE_OFF", 12, 3194, 933, "Enivornment Control", "PILOT Air Source Off")
definePushButton("PLT_AIR_SOURCE_L", 12, 3195, 930, "Enivornment Control", "PILOT Air Left Engine")
definePushButton("PLT_AIR_SOURCE_R", 12, 3196, 931, "Enivornment Control", "PILOT Air Right Engine")
definePushButton("PLT_AIR_SOURCE_BOTH", 12, 3197, 932, "Enivornment Control", "PILOT Air Both Engines")
define3PosTumb("PLT_WINDSHIELD_AIR", 12, 3647, 942, "Enivornment Control", "PILOT Wind Shield Air")
defineMultipositionSwitch("PLT_TEMP", 12, 3648, 950, 9, 0.125,"Enivornment Control" ,"PILOT Cabin Temperature Switch")
defineToggleSwitch("PLT_TEMP_AUTO_MAN", 12, 3649, 940, "Enivornment Control", "PILOT Temperature Auto/Man")
defineToggleSwitch("PLT_RAM_AIR", 12, 3650, 938, "Enivornment Control", "PILOT Ram Air")

-- BIT Panel
defineTumb("PLT_BIT_SWITCH", 11, 3076, 934, 1/11, {0, 1}, nil, false, "BIT Panel", "PILOT Master Test Selector (LB to rotate)")
defineToggleSwitch("PLT_BIT_SWITCH_PUSH", 11, 3077, 15098, "BIT Panel", "PILOT Master Test Selector (RB to pull/push)")

-- Light Panel
defineToggleSwitch("PLT_HOOK_BYPASS", 26, 3211, 915, "Light Panel", "PILOT Hook Bypass")
defineToggleSwitch("PLT_TAXI_LIGHT", 12, 3171, 918, "Light Panel", "PILOT Taxi Light")
define3PosTumb("PLT_FLOOD_LIGHT_RED", 12, 3172, 924, "Light Panel", "PILOT Red Flood Light")
define3PosTumb("PLT_FLOOD_LIGHT_WH", 12, 3173, 921, "Light Panel", "PILOT White Flood Light")
define3PosTumb("PLT_POS_LIGHT_WING", 12, 3174, 913, "Light Panel", "PILOT Position Lights Wings")
define3PosTumb("PLT_POS_LIGHT_TAIL", 12, 3175, 916, "Light Panel", "PILOT Position Lights Tail")
defineToggleSwitch("PLT_POS_LIGHT_FLASH", 12, 3176, 919, "Light Panel", "PILOT Position Lights Flash")
defineToggleSwitch("PLT_ANTICOL_LIGHT", 12, 3177, 923, "Light Panel", "PILOT Anti-Collision Lights")
defineMultipositionSwitch("PLT_LIGHT_INTENT_ACM", 12, 3178, 15005, 9, 0.125,"Light Panel" ,"PILOT ACM Panel Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_INDEXER", 26, 3212, 15006, 9, 0.125,"Light Panel" ,"PILOT AoA Indexer Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_INSTRUMENT", 12, 3179, 15007, 9, 0.125,"Light Panel" ,"PILOT Instrument Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_CONSOLE", 12, 3180, 15008, 9, 0.125,"Light Panel" ,"PILOT Console Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_FORMATION", 12, 3181, 15009, 9, 0.125,"Light Panel" ,"PILOT Formation Light Intensity")

-- Light panel RIO
define3PosTumb("RIO_FLOOD_LIGHT_RED", 12, 3706, 194, "Light Panel", "RIO Red Flood Light")
define3PosTumb("RIO_FLOOD_LIGHT_WH", 12, 3707, 159, "Light Panel", "RIO White Flood Light")
defineMultipositionSwitch("RIO_LIGHT_INTENT_INSTRUMENT", 12, 3708, 193, 9, 0.125,"Light Panel" ,"RIO Instrument Light Intensity")
defineMultipositionSwitch("RIO_LIGHT_INTENT_CONSOLE", 12, 3709, 192, 9, 0.125,"Light Panel" ,"RIO Console Light Intensity")

-- DISPLAY Panel: Power
defineToggleSwitch("PLT_VDI_PW_SW", 42, 3214, 1010, "Display", "PILOT VDI Power On/Off")
defineToggleSwitch("PLT_HUD_PW_SW", 40, 3213, 1009, "Display", "PILOT HUD Power On/Off")
defineToggleSwitch("PLT_HSD_PW_SW", 41, 3215, 1008, "Display", "PILOT HSD/ECMD Power On/Off")

-- DISPLAY Panel: Steer CMD
definePushButton("PLT_NAV_STEER_TACAN", 46, 3314, 1002, "Display", "PILOT Navigation Steer Commands: TACAN")
definePushButton("PLT_NAV_STEER_DEST", 46, 3315, 1003, "Display", "PILOT Navigation Steer Commands: Destination")
definePushButton("PLT_NAV_STEER_AWL", 46, 3318, 1004, "Display", "PILOT Navigation Steer Commands: AWL PCD")
definePushButton("PLT_NAV_STEER_VECTOR", 46, 3316, 1005, "Display", "PILOT Navigation Steer Commands: Vector")
definePushButton("PLT_NAV_STEER_MAN", 46, 3317, 1006, "Display", "PILOT Navigation Steer Commands: Manual")

-- DISPLAY Panel: HSD
define3PosTumb("PLT_HSD_DIS_MODE", 41, 3235, 1016, "Display", "PILOT HSD Display Mode")
defineToggleSwitch("PLT_HSD_ECM_OVER", 41, 3239, 1017, "Display", "PILOT HSD ECM Override")

-- HSD
defineRotary("PLT_HSD_KNOB_HDG", 41, 3241, 1039, "HSD", "PILOT HSD Selected Heading")
defineRotary("PLT_HSD_KNOB_CRS", 41, 3242, 1040, "HSD", "PILOT HSD Selected Course")
definePotentiometer("PLT_HSD_BRIGHT", 41, 3240, 1043, {0.0, 1.0}, "HSD", "PILOT HSD Brightness")
definePushButton("PLT_HSD_TEST", 41, 3243, 1041, "HSD", "PILOT HSD Test")

-- ECMD
definePotentiometer("RIO_ECMD_BRIGHT", 45, 3245, 2023, {0.0, 1.0}, "ECMD", "RIO ECMD Brightness")
definePushButton("RIO_ECMD_TEST", 45, 3246, 2024, "ECMD", "RIO ECMD Test")
defineToggleSwitch("RIO_ECM_MODE", 45, 3247, 189, "ECMD", "RIO ECM Display Mode")
define3PosTumb("RIO_ECM_OVERRIDE", 45, 3248, 156, "ECMD", "RIO ECM Display Override")
define3PosTumb("RIO_ECM_CORR", 45, 3249, 168, "ECMD", "RIO ECM Display Corr")
define3PosTumb("RIO_ECM_ADF", 45, 3250, 190, "ECMD", "RIO ECM Display Data/ADF")

-- TACAN Pilot Panel
defineToggleSwitch("PLT_TACAN_CMD_BUTTON", 47, 3324, 292, "TACAN PILOT", "PILOT TACAN CMD Button")
defineToggleSwitch("RIO_TACAN_CMD_BUTTON", 47, 3325, 135, "TACAN RIO", "RIO TACAN CMD Button")
defineTumb("PLT_TACAN_MODE", 47, 3326, 2041, 0.25, {0, 1}, nil, false, "TACAN PILOT", "PILOT TACAN Mode")
definePotentiometer("PLT_TACAN_VOLUME", 47, 3328, 2036, {0, 1}, "TACAN PILOT", "PILOT TACAN Volume")
defineFixedStepTumb("PLT_TACAN_MODE_NORMAL_INV", 47, 3335, 2042, 2, {-1, 1}, {-1, 1}, nil, "TACAN PILOT", "PILOT TACAN Mode Normal/Inverse")
defineFixedStepTumb("PLT_TACAN_CHANNEL", 47, 3336, 2043, 2, {-1, 1}, {-1, 1}, nil, "TACAN PILOT", "PILOT TACAN Channel XY")
definePushButton("PLT_TACAN_BIT", 47, 3334, 2115, "TACAN PILOT", "PILOT TACAN Bit")
defineTumb("PLT_TACAN_DIAL_TENS", 47, 3330, 8888, 1/12, {0, 1}, nil, false, "TACAN PILOT", "PILOT TACAN Channel Wheel (Tens)")
defineTumb("PLT_TACAN_DIAL_ONES", 47, 3332, 8889, 1/9, {0, 1}, nil, false, "TACAN PILOT", "PILOT TACAN Channel Lever (Ones)")

-- TACAN RIO Panel
defineTumb("RIO_TACAN_MODE", 47, 3338, 374, 0.25, {0, 1}, nil, false, "TACAN RIO", "RIO TACAN Mode")
definePotentiometer("RIO_TACAN_VOLUME", 47, 3340, 375, {0, 1}, "TACAN RIO", "RIO TACAN Volume")
defineToggleSwitch("RIO_TACAN_MODE_NORMAL_INV", 47, 3347, 373, "TACAN RIO", "RIO TACAN Mode Normal/Inverse")
defineToggleSwitch("RIO_TACAN_CHANNEL", 47, 3348, 372, "TACAN RIO", "RIO TACAN Channel XY")
definePushButton("RIO_TACAN_BIT", 47, 3346, 371, "TACAN RIO", "RIO TACAN Bit")
defineTumb("RIO_TACAN_DIAL_TENS", 47, 3342, 8891, 1/12, {0, 1}, nil, false, "TACAN RIO", "RIO TACAN Channel Wheel (Tens)")
defineTumb("RIO_TACAN_DIAL_ONES", 47, 3344, 8890, 1/9, {0, 1}, nil, false, "TACAN RIO", "RIO TACAN Channel Lever (Ones)")

-- AN/ARA-63 Panel
defineToggleSwitch("PLT_ARA63_PW", 48, 3319, 910, "ANARA63 Panel", "PILOT AN/ARA-63 Power")
definePushButton("PLT_ARA63_BIT", 48, 3321, 911, "ANARA63 Panel", "PILOT AN/ARA-63 BIT Button")
defineTumb("PLT_ARA63_CHAN", 48, 3322, 912, 1/19, {0 ,1}, nil, true, "ANARA63 Panel" ,"PILOT AN/ARA-63 Channel Knob")

-- Pilot TONE VOLUME Panel
definePotentiometer("PLT_ALR67_VOL", 2, 3395, 2040, {0.0, 1.0}, "Volume Panel", "PILOT ALR-67 Volume")
definePotentiometer("PLT_AIM9_VOL", 2, 3397, 2039, {0.0, 1.0}, "Volume Panel", "PILOT Sidewinder Volume")

-- ICS Pilot
definePotentiometer("PLT_ICS_VOL", 2, 3380, 2048, {0.0, 1.0}, "ICS", "PILOT ICS Volume")
defineMultipositionSwitch("PLT_ICS_AMP_SEL", 2, 3382, 2045, 3, 0.5, "ICS" ,"PILOT ICS Amplifier Selector")
define3PosTumb("PLT_ICS_FUNC_SEL", 2, 3383, 2044, "ICS", "PILOT ICS Function Selector")

-- ICS RIO
definePotentiometer("RIO_ICS_VOL", 2, 3387, 400, {0.0, 1.0}, "ICS", "RIO ICS Volume")
defineMultipositionSwitch("RIO_ICS_AMP_SEL", 2, 3389, 401, 3, 0.5, "ICS" ,"RIO ICS Amplifier Selector")
define3PosTumb("RIO_ICS_FUNC_SEL", 2, 3390, 402, "ICS", "RIO ICS Function Selector")
define3PosTumb("RIO_ICS_XMTR_SEL", 2, 3399, 381, "ICS", "RIO XMTR SEL Switch")
define3PosTumb("RIO_ICS_UHF_LWR", 2, 3598, 380, "ICS", "RIO V/UHF 2 ANT Switch")
define3PosTumb("RIO_ICS_KY_MODE", 2, 3597, 382, "ICS", "RIO KY MODE Switch")

-- UHF ARC-159
defineTumb("PLT_UHF1_FREQ_MODE", 3, 3375, 2033, 0.5, {0, 1}, nil, false, "UHF 1", "PILOT UHF ARC-159 Freq Mode GUARD/MANUAL/PRESET")
defineMultipositionSwitch("PLT_UHF1_FUNCTION", 3, 3371, 2034, 4, 0.333333, "UHF 1", "PILOT UHF ARC-159 Function ADF/BOTH/MAIN/OFF")
defineTumb("PLT_UHF1_PRESETS", 3, 3373, 2032, 0.0833333333, {0.0, 1.0}, nil, true, "UHF 1", "PILOT UHF ARC-159 Preset Channel Selector")
defineToggleSwitch("PLT_UHF1_SQUELCH", 3, 3365, 2035, "UHF 1", "PILOT UHF ARC-159 Squelch Switch")
define3PosTumb("PLT_UHF1_110_DIAL", 3, 3367, 2030, "UHF 1", "PILOT UHF ARC-159 100MHz & 10MHz Dial")
define3PosTumb("PLT_UHF1_1_DIAL", 3, 3368, 2029, "UHF 1", "PILOT UHF ARC-159 1MHz Dial")
define3PosTumb("PLT_UHF1_01_DIAL", 3, 3369, 2028, "UHF 1", "PILOT UHF ARC-159 0.1MHz Dial")
define3PosTumb("PLT_UHF1_025_DIAL", 3, 3370, 2026, "UHF 1", "PILOT UHF ARC-159 0.025MHz Dial")
defineToggleSwitch("PLT_UHF1_SHOW_PRESET_FREQ", 3, 3377, 8115, "UHF 1", "PILOT UHF ARC-159 Show Preset Frequency")
definePotentiometer("PLT_UHF1_VOL", 3, 3359, 2031, {0.0, 1.0}, "UHF 1", "PILOT UHF ARC-159 Volume")
definePotentiometer("RIO_UHF1_VOL", 3, 3361, 383, {0.0, 1.0}, "UHF 1", "RIO UHF ARC-159 Volume")
definePotentiometer("PLT_UHF1_BRIGHTNESS", 3, 3363, 2027, {0.0, 1.0}, "UHF 1", "PILOT UHF ARC-159 Display Brightness")
definePushButton("PLT_UHF1_LOAD", 3, 3378, 16009, "UHF 1", "PILOT UHF ARC-159 Load")
definePushButton("PLT_UHF1_TONE", 3, 3379, 16010, "UHF 1", "PILOT UHF ARC-159 Tone")

local function getARC159_High_Frequency()
	--Export : 225000192.000000
	local arc_159 = GetDevice(3)
	local freq = tostring(arc_159:get_frequency())
	if freq == "nan" then freq = "000000" end
	freq = string.sub(freq, 1, 3)
	return tonumber(freq)	
end
local function getARC159_Decimal_DIAL3_Frequency()
	--Export : 225975
	local arc_159 = GetDevice(3)
	local freq = tostring(arc_159:get_frequency())
	if freq == "nan" then freq = "000000" end
	--Get the 9
	freq = string.sub(freq, 4, 4)
	return tonumber(freq)	
end

local function getARC159_Decimal_DIAL4_Frequency()
	--Export : 225975192.000000
	--00 25 50 75
	local arc_159 = GetDevice(3)
	local freq = tostring(arc_159:get_frequency())
	if freq == "nan" then freq = "000000" end
	--Get the 75
	freq = string.sub(freq, 5, 6)
	return tonumber(freq)	
end

defineIntegerFromGetter("PLT_UHF_DIAL4_FREQ", getARC159_Decimal_DIAL4_Frequency, 100, "UHF 1", "PILOT Dial 4 ARC-159 Frequency")
defineIntegerFromGetter("PLT_UHF_DIAL3_FREQ", getARC159_Decimal_DIAL3_Frequency, 10, "UHF 1", "PILOT Dial 3 ARC-159 Frequency")
defineIntegerFromGetter("PLT_UHF_HIGH_FREQ", getARC159_High_Frequency, 400, "UHF 1", "PILOT High ARC-159 Frequency")

moduleBeingDefined.inputProcessors["SET_UHF_FREQ"] = function(freq)
	freq = freq:gsub("%.", "")
	freq = tonumber(freq)
	if type(freq) == "nil" then return end
	
	GetDevice(3):set_frequency(freq*1000)
end

-- VHF/UHF ARC-182 ("V/UHF 2")
defineMultipositionSwitch("RIO_VUHF_FREQ_MODE", 4, 3417, 353, 6, 0.2, "VUHF", "RIO VHF/UHF ARC-182 Frequency Mode 243 MAN G PRESET READ LOAD")
defineMultipositionSwitch("RIO_VUHF_MODE", 4, 3413, 358, 5, 0.25, "VUHF", "RIO VHF/UHF ARC-182 MODE OFF T/R T/R&G DF TEST")
defineTumb("RIO_VUHF_PRESETS", 4, 3415, 352, 0.0833333333, {0.0, 1.0}, nil, true, "VUHF", "RIO VHF/UHF ARC-182 Preset Channel Selector")
defineToggleSwitch("RIO_VUHF_FM_AM", 4, 3419, 359, "VUHF", "RIO VHF/UHF ARC-182 FM/AM Switch")
defineToggleSwitch("RIO_VUHF_SQUELCH", 4, 3407, 351, "VUHF", "RIO VHF/UHF ARC-182 Squelch Switch")
define3PosTumb("RIO_VUHF_110_DIAL", 4, 3409, 354, "VUHF", "RIO VUHF ARC-182 100MHz & 10MHz Dial")
define3PosTumb("RIO_VUHF_1_DIAL", 4, 3410, 355, "VUHF", "RIO VUHF ARC-182 1MHz Dial")
define3PosTumb("RIO_VUHF_01_DIAL", 4, 3411, 356, "VUHF", "RIO VUHF ARC-182 0.1MHz Dial")
define3PosTumb("RIO_VUHF_025_DIAL", 4, 3412, 357, "VUHF", "RIO VUHF ARC-182 0.025MHz Dial")
definePotentiometer("RIO_VUHF_VOL", 4, 3401, 350, {0.0, 1.0}, "VUHF", "RIO VUHF ARC-182 Volume")
definePotentiometer("PLT_VUHF_VOL", 4, 3403, 2038, {0.0, 1.0}, "VUHF", "PILOT VUHF ARC-182 Volume")
definePotentiometer("RIO_VUHF_BRIGHTNESS", 4, 3405, 360, {0.0, 1.0}, "VUHF", "RIO VUHF ARC-182 Display Brightness")

local function getARC182_High_Frequency()
	--225000288
	-- 65000056	
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
    if freq == "nan" then freq = "000000" end
	if(string.len(freq) == 8) then
		freq = string.sub(freq, 1, 2)
	else
	freq = string.sub(freq, 1, 3)
	end
	return tonumber(freq)	
end
local function getARC182_Decimal_DIAL3_Frequency()
	--225975288
	-- 65975056
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
	if freq == "nan" then freq = "000000" end
	--Get the 9
	if(string.len(freq) == 8) then
		freq = string.sub(freq, 3, 3)
	else
	freq = string.sub(freq, 4, 4)
	end
	return tonumber(freq)	
end

local function getARC182_Decimal_DIAL4_Frequency()
	--225975288
	-- 65975056
	--00 25 50 75
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
	if freq == "nan" then freq = "000000" end
	--Get the 75
	if(string.len(freq) == 8) then
		freq = string.sub(freq, 4, 5)
	else
	freq = string.sub(freq, 5, 6)
	end
	return tonumber(freq)	
end

defineIntegerFromGetter("RIO_VUHF_DIAL4_FREQ", getARC182_Decimal_DIAL4_Frequency, 100, "VUHF", "RIO Dial 4 ARC-182 Frequency")
defineIntegerFromGetter("RIO_VUHF_DIAL3_FREQ", getARC182_Decimal_DIAL3_Frequency, 10, "VUHF", "RIO Dial 3 ARC-182 Frequency")
defineIntegerFromGetter("RIO_VUHF_HIGH_FREQ", getARC182_High_Frequency, 400, "VUHF", "RIO High ARC-182 Frequency")

moduleBeingDefined.inputProcessors["SET_VUHF_FREQ"] = function(freq)
	freq = freq:gsub("%.", "")
	freq = tonumber(freq)
	if type(freq) == "nil" then return end
	
	GetDevice(4):set_frequency(freq*1000)
end

-- KY-28
defineTumb("RIO_KY28_POWER", 2, 3423, 116, 0.5, {0, 1}, nil, false, "KY-28", "RIO KY-28 Power Mode")
defineTumb("RIO_KY28_RADIO_SELECTOR", 2, 3425, 115, 0.5, {0, 1}, nil, false, "KY-28", "RIO KY-28 Radio Selector")
defineToggleSwitch("RIO_KY28_FLIPCOVER", 2, 3608, 150, "KY-28", "RIO KY-28 ZEROIZE Cover")
defineToggleSwitch("RIO_KY28_ZEROIZE", 2, 3427, 361, "KY-28", "RIO KY-28 ZEROIZE")

-- UHF/VHF/UHF Pilot/RIO Remote Display
definePotentiometer("PLT_UHF_REMOTE_BRIGHTNESS", 3, 3350, 1031, {0.0, 1.0}, "UHF 1", "PILOT UHF ARC-159 Remote Display Brightness")
definePotentiometer("RIO_UHF_REMOTE_BRIGHTNESS", 3, 3353, 406, {0.0, 1.0}, "UHF 1", "RIO UHF ARC-159 Remote Display Brightness")
definePotentiometer("PLT_VUHF_REMOTE_BRIGHTNESS", 4, 3356, 1030, {0.0, 1.0}, "VUHF", "PILOT VHF/UHF Radio Remote Display Brightness")
defineToggleSwitch("PLT_UHF_DISPLAY_TEST", 2, 3352, 15004, "UHF 1", "PILOT UHF ARC-159 Radio Remote Display Test")
defineToggleSwitch("RIO_UHF_DISPLAY_TEST", 3, 3355, 405, "UHF 1", "RIO UHF ARC-159 Radio Remote Display Test")
defineToggleSwitch("PLT_VUHF_DISPLAY_TEST", 3, 3355, 15003, "VUHF", "PILOT VHF/UHF ARC-182 Radio Remote Display Test")

-- DECM Panel
defineMultipositionSwitch("RIO_DECM_PW_MODE", 53, 3252, 151, 6, 0.2, "DECM Panel" ,"RIO DECM ALQ-100 Power/Mode")
definePotentiometer("RIO_DECM_VOL", 53, 3253, 9950, {0.0, 1.0}, "DECM Panel", "RIO DECM ALQ-100 Volume")

-- RWR Control Panel ALR-67
definePotentiometer("PLT_RWR_BRIGHT", 54, 3261, 16011, {0.0, 1.0}, "RWR Control Panel", "PILOT AN/ALR-67 Display Brightness")
definePotentiometer("RIO_RWR_BRIGHT", 54, 3263, 376, {0.0, 1.0}, "RWR Control Panel", "RIO AN/ALR-67 Display Brightness")
defineMultipositionSwitch("RIO_RWR_DIS_TYP", 54, 3257, 2136, 5, 0.25, "DECM Panel" ,"RIO AN/ALR-67 Display Type")
define3PosTumb("RIO_RWR_MODE", 54, 3256, 2137, "DECM Panel", "RIO AN/ALR-67 Mode")
define3PosTumb("RIO_RWR_TEST", 54, 3261, 2140, "DECM Panel", "RIO AN/ALR-67 Mode")
defineToggleSwitch("RIO_RWR_PW", 54, 3259, 2139, "DECM Panel", "RIO AN/ALR-67 Power")
definePotentiometer("RIO_RWR_VOL", 54, 3254, 2138, {0.0, 1.0}, "DECM Panel", "RIO AN/ALR-67 Volume")

-- AN/ALE-39 Mode Panel
define3PosTumb("RIO_CMDS_PW", 5, 3267, 390, "CMDS", "RIO AN/ALE-37 Power/Mode")
define3PosTumb("RIO_CMDS_DISP_CHAFF", 5, 3269, 389, "CMDS", "RIO AN/ALE-37 Chaff Dispense")
define3PosTumb("RIO_CMDS_DISP_FLAR", 5, 3270, 388, "CMDS", "RIO AN/ALE-37 Flare Dispense")
define3PosTumb("RIO_CMDS_DISP_JAMMER", 5, 3271, 387, "CMDS", "RIO AN/ALE-37 Jammer Dispense")
define3PosTumb("RIO_CMDS_FLAREMODE", 5, 3272, 398, "CMDS", "RIO AN/ALE-37 Flare Mode")
definePushButton("RIO_CMDS_FLARE_SALVO", 5, 3272, 391, "CMDS", "RIO AN/ALE-37 Flare Salvo")
definePotentiometer("RIO_CMDS_COUNT_CHAFF", 5, 3275, 386, {0.0, 1.0}, "CMDS", "AN/ALE-37 Chaff Counter")
definePotentiometer("RIO_CMDS_COUNT_FLARE", 5, 3277, 385, {0.0, 1.0}, "CMDS", "AN/ALE-37 Flare Counter")
definePotentiometer("RIO_CMDS_COUNT_JAMMER", 5, 3279, 399, {0.0, 1.0}, "CMDS", "AN/ALE-37 Jammer Counter")

-- AN/ALE-39 Program Panel
defineTumb("RIO_CMDS_LOAD_TYP_L10", 5, 3281, 206, 0.5, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 L10 Load Type")
defineTumb("RIO_CMDS_LOAD_TYP_L20", 5, 3283, 207, 0.5, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 L20 Load Type")
defineTumb("RIO_CMDS_LOAD_TYP_R10", 5, 3285, 209, 0.5, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 R10 Load Type")
defineTumb("RIO_CMDS_LOAD_TYP_R20", 5, 3287, 208, 0.5, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 R20 Load Type")
defineTumb("RIO_CMDS_CHAFF_BURST_QUAN", 5, 3298, 214, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Chaff Burst Quantity")
defineTumb("RIO_CMDS_CHAFF_BURST_INTER", 5, 3300, 215, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Chaff Burst Interval")
defineTumb("RIO_CMDS_CHAFF_SALVO_QUAN", 5, 3302, 203, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Chaff Salvo Quantity")
defineTumb("RIO_CMDS_CHAFF_SALVO_INTER", 5, 3304, 202, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Chaff Salvo Interval")
defineTumb("RIO_CMDS_FLARE_QUAN", 5, 3306, 205, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Flare Quantity")
defineTumb("RIO_CMDS_FLARE_INTER", 5, 3308, 210, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Flare Interval")
defineTumb("RIO_CMDS_JAMM_QUAN", 5, 3295, 204, 0.333, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 Jammer Quantity")
defineTumb("RIO_CMDS_JAMM_INTER_UNIT", 5, 3289, 211, 0.111, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Jammer Interval Units")
defineTumb("RIO_CMDS_JAMM_INTER_10", 5, 3291, 212, 0.111, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Jammer Interval Tens")
defineTumb("RIO_CMDS_JAMM_INTER_100", 5, 3293, 213, 0.111, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Jammer Interval Hundreds")
definePushButton("RIO_CMDS_PROG_RESET", 5, 3297, 216, "CMDS", "RIO AN/ALE-37 Programmer Reset")

-- INS
defineMultipositionSwitch("RIO_TID_MODE_NAV", 50, 3106, 50, 7, 0.1666667, "INS" ,"RIO TID Navigation Mode")
defineMultipositionSwitch("RIO_TID_MODE_DEST", 46, 3109, 51, 8, 0.142857, "INS" ,"RIO TID Destination Mode")

-- AHRS / Compass  (COMP Panel)
definePotentiometer("PLT_AHRS_HDG_KNOB", 51, 3433, 904, {-1.0, 1.0}, "AHRS", "PILOT Compass HDG Slave Knob")
definePushButton("PLT_AHRS_HDG_PUSH", 51, 3432, 16014, "AHRS", "PILOT Compass HDG Slave Push")
defineTumb("PLT_AHRS_MODE", 51, 3434, 905, 1, {-1, 1}, nil, false, "AHRS", "PILOT Compass Mode")
defineFixedStepTumb("PLT_AHRS_HEMISPHERE", 51, 3436, 906, 2, {-1, 1}, {-1, 1}, nil, "AHRS", "PILOT Compass N-S Hemisphere")
definePotentiometer("PLT_AHRS_LAT", 51, 3438, 909, {0.0, 1.0}, "AHRS", "PILOT Compass LAT Correction")

-- Spoiler Overrides
defineToggleSwitch("PLT_SPOIL_OVER_COVER_INBOARD", 15, 3428, 902, "Spoiler", "PILOT Inboard Spoiler Override Cover")
defineToggleSwitch("PLT_SPOIL_OVER_COVER_OUTBOARD", 15, 3429, 903, "Spoiler", "PILOT Outboard Spoiler Override Cover")
defineToggleSwitch("PLT_SPOIL_OVER_INBOARD", 15, 3430, 908, "Spoiler", "PILOT Inboard Spoiler Override")
defineToggleSwitch("PLT_SPOIL_OVER_OUTBOARD", 15, 3431, 907, "Spoiler", "PILOT Outboard Spoiler Override")

-- Gun Elevation 
defineRotary("PLT_GUN_ELEV_ADJUST", 55, 3131, 1000, "Gun", "PILOT Gun Elevation Lead Adjustment")
defineRotary("PLT_GUN_AMMU_COUNT_ADJUST", 55, 3132, 1022, "Gun", "PILOT Gun Ammunition Counter Adjustment")

-- DISPLAY Panel
definePotentiometer("PLT_HUD_PITCH_BRIGHT", 40, 3223, 1007, {0.0, 1.0}, "Display", "PILOT HUD Pitch Ladder Brightness")
defineToggleSwitch("PLT_VDI_MODE_DISP", 42, 3224, 1019, "Display", "PILOT VDI Display Mode")
defineToggleSwitch("PLT_VDI_MODE_LAND", 42, 3225, 1018, "Display", "PILOT VDI Landing Mode")
defineToggleSwitch("PLT_HUD_DECLUTTER", 40, 3226, 1021, "Display", "PILOT HUD De-clutter On/Off")
defineToggleSwitch("PLT_HUD_MODE_AWL", 40, 3227, 1020, "Display", "PILOT HUD AWL Mode")
definePushButton("PLT_HUD_MODE_TAKEOFF", 40, 3216, 1015, "Display", "PILOT HUD Take-Off Mode")
definePushButton("PLT_HUD_MODE_CRUISE", 40, 3217, 1014, "Display", "PILOT HUD Cruise Mode")
definePushButton("PLT_HUD_MODE_A2A", 40, 3218, 1013, "Display", "PILOT HUD Air-to-Air Mode")
definePushButton("PLT_HUD_MODE_A2G", 40, 3219, 1012, "Display", "PILOT HUD Air-to-Ground Mode")
definePushButton("PLT_HUD_MODE_LAND", 40, 3220, 1011, "Display", "PILOT HUD Landing Mode")

-- Standby ADI
definePushButton("PLT_STDBYAI_UNCAGE", 31, 3545, 1032, "Standby ADI", "PILOT Standby ADI Push to uncage")
defineRotary("PLT_STDBYAI_TRIM", 31, 3546, 1042, "Standby ADI", "PILOT Standby ADI Knob")
definePushButton("RIO_STDBYAI_UNCAGE", 31, 3547, 6155, "Standby ADI", "RIO Standby ADI Push to uncage")
defineRotary("RIO_STDBYAI_TRIM", 31, 3548, 6156, "Standby ADI", "RIO Standby ADI Knob")
definePushButton("PLT_ACCEL_RESET", 25, 3488, 228, "Display", "PILOT Accelerometer Reset")

-- VDI & HUD Indicator Controls
defineToggleSwitch("PLT_HUD_FILTER", 40, 3228, 1033, "HUD", "PILOT HUD Filter")
definePotentiometer("PLT_HUD_TRIM", 40, 3229, 1034, {0.0, 1.0}, "HUD", "PILOT HUD TRIM")
definePotentiometer("PLT_VSDI_TRIM", 42, 3230, 1035, {0.0, 1.0}, "HUD", "PILOT VSDI Screen Trim")
definePotentiometer("PLT_VDI_CONTRAST", 42, 3231, 1038, {0.0, 1.0}, "HUD", "PILOT VDI Screen Contrast")
definePotentiometer("PLT_VSDI_BRIGHT", 42, 3232, 1036, {0.0, 1.0}, "HUD", "PILOT VSDI Screen Brightness")
definePotentiometer("PLT_HUD_BRIGHT", 40, 3233, 1037, {0.0, 1.0}, "HUD", "PILOT HUD Brightness")

-- Under HUD / Master Arm / Gun/Weapons Panel
defineToggleSwitch("PLT_MASTER_ARM_COVER", 55, 3135, 1046, "Weapons Panel", "PILOT Master Arm Cover")
define3PosTumb("PLT_MASTER_ARM_SW", 55, 3136, 1047, "Weapons Panel", "PILOT Master Arm Switch")
defineToggleSwitch("PLT_ACM_COVER", 55, 3133, 1049, "Weapons Panel", "PILOT ACM Cover")
definePushButton("PLT_ACM_JETT", 55, 3138, 1048, "Weapons Panel", "PILOT ACM Jettison")
definePushButton("PLT_MASTER_CAUTION_RESET", 35, 3056, 9199, "Weapons Panel", "PILOT Master Caution Reset")
definePushButton("PLT_GUN_RATE", 55, 3130, 16000, "Weapons Panel", "PILOT Gun Rate")
definePushButton("PLT_SIDEWINDER_COOL", 55, 3139, 16001, "Weapons Panel", "PILOT Sidewinder Cool")
definePushButton("PLT_MISSLE_PREP", 55, 3140, 16002, "Weapons Panel", "PILOT Missile Prepare")
definePushButton("PLT_MISSLE_MODE", 55, 3141, 16003, "Weapons Panel", "PILOT Missile Mode")
definePushButton("PLT_EMERG_STORE_JETT", 55, 3142, 239, "Weapons Panel", "PILOT Emergency Stores Jettison")
defineRotary("PLT_CLOCK_WIND", 27, 3042, 1051, "Weapons Panel", "PILOT Clock Wind")
definePushButton("PLT_CLOCK_TIMER", 27, 3043, 1000, "Weapons Panel", "PILOT Clock Timer Start/Stop/Reset")
defineRotary("RIO_CLOCK_WIND", 27, 3710, 1052, "Weapons Panel", "RIO Clock Wind")
definePushButton("RIO_CLOCK_TIMER", 27, 3711, 1053, "Weapons Panel", "RIO Clock Timer Start/Stop/Reset")

-- RIO TID
defineMultipositionSwitch("RIO_TID_MODE", 43, 3112, 2005, 4, 0.33333, "TID" ,"RIO TID Mode")
defineTumb("RIO_TID_RANGE", 43, 3113, 2006, 0.5, {-1.0, 1.0}, nil, false, "TID" ,"RIO TID Range")
definePushButton("RIO_TID_NON_ATTK", 43, 3114, 226, "TID", "RIO TID Non Attack")
definePushButton("RIO_TID_JAM_STROBE", 43, 3115, 1118, "TID", "RIO TID Jam Strobe")
definePushButton("RIO_TID_DATA_LINK", 43, 3116, 1117, "TID", "RIO TID Data Link")
definePushButton("RIO_TID_SYM_ELEM", 43, 3117, 1116, "TID", "RIO TID Sym Elem")
definePushButton("RIO_TID_ALT_NUM", 43, 3118, 1115, "TID", "RIO TID Alt Num")
definePushButton("RIO_TID_RID_DSBL", 43, 3119, 2004, "TID", "RIO TID Reject Image Device disable")
definePushButton("RIO_TID_LAUNCH_ZONE", 43, 3120, 2113, "TID", "RIO TID Launch Zone")
definePushButton("RIO_TID_VEL_VECTOR", 43, 3121, 2114, "TID", "RIO TID Velocity Vector")
definePushButton("RIO_TID_CLSN", 43, 3122, 52, "TID", "RIO TID Collision Steering")
definePushButton("RIO_TID_TRACKHOLD", 43, 3123, 53, "TID", "RIO TID Track Hold")
definePotentiometer("RIO_TID_BRIGHT", 43, 3124, 48, {0.0, 1.0}, "TID", "RIO TID Brightness")
definePotentiometer("RIO_TID_CONTRAST", 43, 3125, 49, {0.0, 1.0}, "TID", "RIO TID Contrast")

-- RIO HCU
defineToggleSwitch("RIO_HCU_TCS", 58, 3096, 2007, "HCU", "RIO HCU TCS Mode")
defineToggleSwitch("RIO_HCU_RADAR", 58, 3097, 2008, "HCU", "RIO HCU Radar Mode")
defineToggleSwitch("RIO_HCU_DDD", 58, 3098, 2009, "HCU", "RIO HCU DDD Mode")
defineToggleSwitch("RIO_HCU_TID", 58, 3099, 2010, "HCU", "RIO HCU TID Mode")
define3PosTumb("RIO_HCU_TVIR_SW", 37, 3100, 2011, "HCU", "RIO HCU TV/IR Switch")
define3PosTumb("RIO_HCU_WCS", 39, 3101, 2012, "HCU", "RIO HCU WCS Switch")
definePushButton("RIO_HCU_PW_RESET", 39, 3644, 2013, "HCU", "RIO HCU Power Reset")
definePushButton("RIO_HCU_LIGHT_TEST", 39, 3645, 2014, "HCU", "RIO HCU Light Test")

-- RIO DDD
definePushButton("RIO_RADAR_5", 39, 3450, 40, "DDD", "RIO Radar 5 NM")
definePushButton("RIO_RADAR_10", 39, 3451, 41, "DDD", "RIO Radar 10 NM")
definePushButton("RIO_RADAR_20", 39, 3452, 42, "DDD", "RIO Radar 20 NM")
definePushButton("RIO_RADAR_50", 39, 3453, 43, "DDD", "RIO Radar 50 NM")
definePushButton("RIO_RADAR_100", 39, 3454, 44, "DDD", "RIO Radar 100 NM")
definePushButton("RIO_RADAR_200", 39, 3455, 45, "DDD", "RIO Radar 200 NM")
definePushButton("RIO_RADAR_PULSE", 39, 3457, 10, "DDD", "RIO Radar Pulse Search")
definePushButton("RIO_RADAR_TWSMAN", 39, 3458, 11, "DDD", "RIO Track While Scan Manual")
definePushButton("RIO_RADAR_TWSAUTO", 39, 3459, 12, "DDD", "RIO Track While Scan Auto")
definePushButton("RIO_RADAR_RWS", 39, 3460, 13, "DDD", "RIO Track While Scan")
definePushButton("RIO_RADAR_PDSRCH", 39, 3461, 14, "DDD", "RIO Radar Pulse Doppler Search")
definePushButton("RIO_RADAR_PSTT", 39, 3462, 15, "DDD", "RIO Radar Pulse Single Target Track")
definePushButton("RIO_RADAR_PDSTT", 39, 3463, 9916, "DDD", "RIO Radar Pulse Doppler Target Track")
definePushButton("RIO_DDD_IFF", 39, 3464, 17, "DDD", "RIO DDD Interrogate Friend or Foe")
definePushButton("RIO_DDD_IR", 39, 3465, 18, "DDD", "RIO DDD Infrared")
definePushButton("RIO_DDD_RADAR", 39, 3466, 19, "DDD", "RIO DDD Radar")
definePushButton("RIO_CCM_SPL", 39, 3686, 1812, "DDD", "RIO CCM SPL")
definePushButton("RIO_CCM_ALT_DIFF", 39, 3687, 1813, "DDD", "RIO CCM ALT DIFF")
definePushButton("RIO_CCM_VGS", 39, 3688, 1814, "DDD", "RIO CCM VGS")
definePotentiometer("RIO_RADAR_IR_GAIN", 39, 3473, 20, {0.0, 1.0}, "DDD", "RIO Radar IR Gain")
definePotentiometer("RIO_RADAR_IR_VOL", 39, 3474, 21, {0.0, 1.0}, "DDD", "RIO Radar IR Volume")
definePotentiometer("RIO_RADAR_IR_THERESHOLD", 39, 3475, 22, {0.0, 1.0}, "DDD", "RIO Radar IR Threshold")
definePotentiometer("RIO_DDD_BRIGHT", 39, 3476, 23, {0.0, 1.0}, "DDD", "RIO DDD Brightness")
definePotentiometer("RIO_DDD_PULSE_VID", 39, 3477, 24, {0.0, 1.0}, "DDD", "RIO DDD Pulse Video")
definePotentiometer("RIO_DDD_ERASE", 39, 3478, 25, {0.0, 1.0}, "DDD", "RIO DDD Erase")
definePotentiometer("RIO_DDD_PULSE_GAIN", 39, 3479, 26, {0.0, 1.0}, "DDD", "RIO Pulse Gain")
definePotentiometer("RIO_ACM_THERESHOLD", 39, 3480, 27, {0.0, 1.0}, "DDD", "RIO ACM Threshold")
definePotentiometer("RIO_RADAR_JAMJET", 39, 3481, 28, {0.0, 1.0}, "DDD", "RIO JAM/JET")
definePotentiometer("RIO_PD_THERESHOLD_CLUTTER", 39, 3482, 29, {0.0, 1.0}, "DDD", "RIO PD Threshold Clutter")
definePotentiometer("RIO_PD_THERESHOLD_CLEAR", 39, 3483, 30, {0.0, 1.0}, "DDD", "RIO PD Threshold Clear")
define3PosTumb("RIO_DDD_ASPECT", 39, 3467, 34, "DDD", "RIO DDD Aspect")
define3PosTumb("RIO_DDD_VC_SCALE", 39, 3468, 35, "DDD", "RIO DDD Closing Velocity Scale")
define3PosTumb("RIO_DDD_TGTS", 39, 3469, 36, "DDD", "RIO DDD Target Size")
define3PosTumb("RIO_DDD_MLC", 39, 3470, 37, "DDD", "RIO DDD Main Lobe Clutter Filter")
defineToggleSwitch("RIO_DDD_AGC", 39, 3471, 38, "DDD", "RIO DDD Automatic Gain Control")
defineToggleSwitch("RIO_DDD_PARA_AMP", 39, 3472, 3900, "DDD", "RIO DDD Parametric Amplifier")

-- RIO RADAR Panel
defineMultipositionSwitch("RIO_RADAR_ELE_BARS", 39, 3442, 79, 4, 0.33333, "Radar" ,"RIO Radar Elevation Scan")
defineMultipositionSwitch("RIO_RADAR_AZI_SCAN", 39, 3443, 80, 4, 0.33333, "Radar" ,"RIO Radar Azimuth Scan")
definePotentiometer("RIO_RADAR_ELE_CENTER", 39, 3446, 81, {-1.0, 1.0}, "Radar", "RIO Radar Elevation Center")
definePotentiometer("RIO_RADAR_AZI_CENTER", 39, 3447, 82, {-1.0, 1.0}, "Radar", "RIO Radar Azimuth Center")
defineToggleSwitch("RIO_RADAR_STABI", 39, 3449, 83, "Radar", "RIO Radar Stabilize")
define3PosTumb("RIO_RADAR_VSL", 39, 3448, 84, "Radar", "RIO Radar VSL Switch")

-- RIO TCS Controls
define3PosTumb("RIO_TCS_ACQ", 38, 3495, 87, "TCS", "RIO TCS Acquisition")
defineToggleSwitch("RIO_TCS_FOV", 38, 3494, 88, "TCS", "RIO TCS FOV")
define3PosTumb("RIO_TCS_SLAVE", 38, 3496, 89, "TCS", "RIO TCS Slave")
define3PosTumb("RIO_RECORD_PW", 38, 3617, 90, "TCS", "RIO Record Power")
defineMultipositionSwitch("RIO_RECORD_MODE", 38, 3618, 91, 5, 1.0/4.0, "TCS" ,"RIO Record Mode")
definePotentiometer("RIO_RECORD_RESET", 38, 3622, 16016, {0.0, 1.0}, "Radar", "RIO Record Reset")

-- RIO Armament Panel
defineMultipositionSwitch("RIO_WEAPON_TYPE", 55, 3146, 59, 44, 1.0/43.0, "Armament Panel" ,"RIO Weapon Type Wheel")
defineTumb("RIO_WEAPON_INTER_10", 55, 3148, 9960, 0.111, {0.0, 1.0}, nil, false, "Armament Panel", "RIO Weapon Interval x10ms")
defineTumb("RIO_WEAPON_INTER_100", 55, 3147, 9961, 0.111, {0.0, 1.0}, nil, false, "Armament Panel", "RIO Weapon Interval x100ms")
defineTumb("RIO_WEAPON_QUANT_10", 55, 3149, 9962, 0.111, {0.0, 1.0}, nil, false, "Armament Panel", "RIO Weapon Quantity 10s")
defineTumb("RIO_WEAPON_QUANTR_1", 55, 3150, 9963, 0.111, {0.0, 1.0}, nil, false, "Armament Panel", "RIO Weapon Quantity 1s")
defineMultipositionSwitch("RIO_WEAPON_ATTK_MODE", 55, 3151, 2022, 5, 0.25, "Armament Panel" ,"RIO Weapon Attack Mode")
defineMultipositionSwitch("RIO_WEAPON_ELEC_FUSE", 55, 3152, 58, 5, 0.25, "Armament Panel" ,"RIO Weapon Elec Fuse")
defineMultipositionSwitch("RIO_WEAPON_MSL_SPD", 55, 3153, 72, 6, 0.2, "Armament Panel" ,"RIO Weapon Missile Speed Gate")
define3PosTumb("RIO_WEAPON_SEL_JETT", 55, 3154, 78, "Armament Panel", "RIO Weapon Selective Jettison")
defineToggleSwitch("RIO_WEAPON_SEL_JETT_COVER", 55, 3668, 1069, "Armament Panel", "RIO Weapon Selective Jettison Aux Guard")
define3PosTumb("RIO_WEAPON_MECH_FUSE", 55, 3155, 63, "Armament Panel", "RIO RIO Weapon Mech Fuse")
define3PosTumb("RIO_WEAPON_MSL_OPT", 55, 3156, 75, "Armament Panel", "RIO RIO Weapon Missile Option")
defineToggleSwitch("RIO_WEAPON_BOMB_SINGLE", 55, 3157, 60, "Armament Panel", "RIO Weapon Bomb Single/Pairs")
defineToggleSwitch("RIO_WEAPON_BOMB_STEP", 55, 3158, 61, "Armament Panel", "RIO Weapon Bomb Step/Ripple")
defineToggleSwitch("RIO_WEAPON_AG_GUN", 55, 3159, 62, "Armament Panel", "RIO Weapon A/G Gun Mode")
defineToggleSwitch("RIO_WEAPON_JETT_RACK", 55, 3160, 66, "Armament Panel", "RIO Weapon Jettison Racks/Weapons")
defineToggleSwitch("RIO_WEAPON_JETT_TANK_L", 55, 3164, 73, "Armament Panel", "RIO Weapon Jettison Left Tank")
defineToggleSwitch("RIO_WEAPON_JETT_TANK_R", 55, 3169, 67, "Armament Panel", "RIO Weapon Jettison Right Tank")
define3PosTumb("RIO_WEAPON_JETT_STAT_1", 55, 3163, 68, "Armament Panel", "RIO Weapon Jettison Station 1")
defineToggleSwitch("RIO_WEAPON_JETT_STAT_3", 55, 3165, 65, "Armament Panel", "RIO Weapon Jettison Station 3")
defineToggleSwitch("RIO_WEAPON_JETT_STAT_4", 55, 3166, 69, "Armament Panel", "RIO Weapon Jettison Station 4")
defineToggleSwitch("RIO_WEAPON_JETT_STAT_5", 55, 3167, 70, "Armament Panel", "RIO Weapon Jettison Station 5")
defineToggleSwitch("RIO_WEAPON_JETT_STAT_6", 55, 3168, 64, "Armament Panel", "RIO Weapon Jettison Station 6")
define3PosTumb("RIO_WEAPON_JETT_STAT_8", 55, 3170, 71, "Armament Panel", "RIO Weapon Jettison Station 8")
definePushButton("RIO_WEAPON_AA_LAUNCH", 55, 3161, 74, "Armament Panel", "RIO Weapon A/A Launch")
definePushButton("RIO_WEAPON_NEXT_LAUNCH", 43, 3162, 9964, "Armament Panel", "RIO Weapon Next Launch")

-- Computer Address Panel (CAP)
defineMultipositionSwitch("RIO_CAP_CATRGORY", 24, 3530, 98, 6, 0.2, "CAP" ,"RIO CAP Category")
definePushButton("RIO_CAP_BTN_4", 24, 3521, 124, "CAP", "RIO CAP Button 4")
definePushButton("RIO_CAP_BTN_5", 24, 3522, 123, "CAP", "RIO CAP Button 5")
definePushButton("RIO_CAP_BTN_3", 24, 3520, 125, "CAP", "RIO CAP Button 3")
definePushButton("RIO_CAP_BTN_2", 24, 3519, 126, "CAP", "RIO CAP Button 2")
definePushButton("RIO_CAP_BTN_1", 24, 3518, 127, "CAP", "RIO CAP Button 1")
definePushButton("RIO_CAP_BTN_TNG", 24, 3528, 128, "CAP", "RIO CAP Button TNG NBR")
definePushButton("RIO_CAP_BTN_10", 24, 3527, 129, "CAP", "RIO CAP Button 10")
definePushButton("RIO_CAP_BTN_9", 24, 3526, 130, "CAP", "RIO CAP Button 9")
definePushButton("RIO_CAP_BTN_8", 24, 3525, 131, "CAP", "RIO CAP Button 8")
definePushButton("RIO_CAP_BTN_7", 24, 3524, 132, "CAP", "RIO CAP Button 7")
definePushButton("RIO_CAP_BTN_6", 24, 3523, 133, "CAP", "RIO CAP Button 6")
definePushButton("RIO_CAP_BTN_PGM_RESTRT", 24, 3529, 134, "CAP", "RIO CAP Button PGM RSTRT")
definePushButton("RIO_CAP_LONG_6", 24, 3541, 136, "CAP", "RIO CAP LONG 6")
definePushButton("RIO_CAP_LAT_1", 24, 3536, 137, "CAP", "RIO CAP LAT 1")
definePushButton("RIO_CAP_NBR_2", 24, 3537, 138, "CAP", "RIO CAP NBR 2")
definePushButton("RIO_CAP_7", 24, 3542, 139, "CAP", "RIO CAP 7")
definePushButton("RIO_CAP_HDG_8", 24, 3543, 140, "CAP", "RIO CAP HDG 8")
definePushButton("RIO_CAP_SPD_3", 24, 3538, 141, "CAP", "RIO CAP SPD 3")
definePushButton("RIO_CAP_ALT_4", 24, 3539, 143, "CAP", "RIO CAP ALT 4")
definePushButton("RIO_CAP_9", 24, 3544, 142, "CAP", "RIO CAP 9")
definePushButton("RIO_CAP_BRG_0", 24, 3535, 144, "CAP", "RIO CAP BRG 0")
definePushButton("RIO_CAP_RNG_5", 24, 3540, 145, "CAP", "RIO CAP RNG 5")
definePushButton("RIO_CAP_NE", 24, 3533, 146, "CAP", "RIO CAP N+E")
definePushButton("RIO_CAP_SW", 24, 3532, 147, "CAP", "RIO CAP S-W")
definePushButton("RIO_CAP_CLEAR", 24, 3531, 148, "CAP", "RIO CAP Clear")
definePushButton("RIO_CAP_ENTER", 24, 3534, 149, "CAP", "RIO CAP Enter")

-- Datalink
define3PosTumb("RIO_DATALINK_PW", 52, 3602, 413, "Datalink", "RIO Datalink Power")
defineToggleSwitch("RIO_DATALINK_ANT", 52, 3603, 175, "Datalink", "RIO Datalink Antenna")
defineToggleSwitch("RIO_DATALINK_REPLY", 52, 3604, 176, "Datalink", "RIO Datalink Reply")
defineToggleSwitch("RIO_DATALINK_CAINS", 52, 3605, 177, "Datalink", "RIO Datalink CAINS/TAC")
define3PosTumb("RIO_DATALINK_ANTIJAM", 52, 3598, 191, "Datalink", "RIO Datalink Antijam")
defineTumb("RIO_DATALINK_FREQ_10", 52, 3599, 196, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Freq 10MHz")
defineTumb("RIO_DATALINK_FREQ_1", 52, 3600, 195, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Freq 1MHz")
defineTumb("RIO_DATALINK_FREQ_100", 52, 3601, 197, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Freq 100kHz")
defineTumb("RIO_DATALINK_ADDR_HI", 52, 3606, 222, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Address High")
defineTumb("RIO_DATALINK_ADDR_LO", 52, 3607, 223, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Address Low")
defineMultipositionSwitch("RIO_BEACON_MODE", 52, 3693, 118, 7, 0.1666667, "Datalink" ,"RIO Beacon Mode")
definePushButton("RIO_BEACON_ACLS", 52, 3692, 117, "Datalink", "RIO Beacon ACLS Test")
define3PosTumb("RIO_BEACON_PW", 52, 3691, 96, "Datalink", "RIO Beacon Power")

-- IFF Panel
define3PosTumb("RIO_IFF_AUDIOLIGHT", 64, 3626, 161, "IFF", "RIO IFF Audio/Light")
define3PosTumb("RIO_IFF_M1", 64, 3627, 162, "IFF", "RIO IFF M1")
define3PosTumb("RIO_IFF_M2", 64, 3628, 163, "IFF", "RIO IFF M2")
define3PosTumb("RIO_IFF_M3A", 64, 3629, 164, "IFF", "RIO IFF M3/A")
define3PosTumb("RIO_IFF_MC", 64, 3630, 165, "IFF", "RIO IFF MC")
define3PosTumb("RIO_IFF_RAD", 64, 3631, 166, "IFF", "RIO IFF RAD")
define3PosTumb("RIO_IFF_IDENT", 64, 3632, 167, "IFF", "RIO IFF Ident")
defineToggleSwitch("RIO_IFF_M4", 64, 3633, 181, "IFF", "RIO IFF M4")
defineMultipositionSwitch("RIO_IFF_CODE", 64, 3634, 183, 4, 1.0/3.0, "IFF" ,"RIO IFF Code")
defineMultipositionSwitch("RIO_IFF_MASTER", 64, 3635, 184, 5, 1.0/4.0, "IFF" ,"RIO IFF Master")
definePushButton("RIO_IFF_TEST", 64, 3636, 185, "IFF", "RIO IFF Test")
definePushButton("RIO_IFF_REPLY", 64, 3637, 186, "IFF", "RIO IFF Reply")
defineTumb("RIO_IFF_M3_1", 64, 3638, 2262, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M3 Code 1s")
defineTumb("RIO_IFF_M3_10", 64, 3639, 2261, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M3 Code 10s")
defineTumb("RIO_IFF_M3_100", 64, 3640, 198, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M3 Code 100s")
defineTumb("RIO_IFF_M3_1000", 64, 3641, 199, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M3 Code 1000s")
defineTumb("RIO_IFF_M1_1", 64, 3642, 200, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M1 Code 1s")
defineTumb("RIO_IFF_M1_10", 64, 3643, 201, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M1 Code 10s")

-- LIQUID Cooling
define3PosTumb("RIO_LIQUD_COOL", 39, 3694, 95, "Radar Panel", "RIO Liquid Cooling Switch")

-- LANTIRN (Panel Arg:666)
defineMultipositionSwitch("RIO_LANTIRN_PW", 7, 3689, 667, 3, 1.0/2.0, "LANTIRN" ,"RIO LANTIRN Power")
defineToggleSwitch("RIO_LANTIRN_LASER_ARM", 7, 3516, 668, "LANTIRN", "RIO LANTIRN Laser Arm Switch")
definePushButton("RIO_LANTIRN_TCS_SEL", 7, 3498, 670, "LANTIRN", "RIO Video Output Toggle (TCS/LANTIRN)")
definePushButton("RIO_LANTIRN_TCS_SEL", 7, 3704, 669, "LANTIRN", "RIO LANTIRN Operate Mode (Unstow)")
definePushButton("RIO_LANTIRN_IBIT", 7, 3690, 671, "LANTIRN", "RIO LANTIRN IBIT")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_OPER", 673, "LANTIRN","RIO LANTIRN STBY Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_OPERSTBY", 673, "LANTIRN","RIO LANTIRN OPER STBY Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_STBY", 673, "LANTIRN","RIO LANTIRN STBY Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_IMU", 674, "LANTIRN","RIO LANTIRN IMU Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_IMUGPS", 674, "LANTIRN","RIO LANTIRN IMU GPS Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_GPS", 674, "LANTIRN","RIO LANTIRN GPS Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_LGP", 675, "LANTIRN","RIO LANTIRN LGP Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_LGPFLIR", 675, "LANTIRN","RIO LANTIRN LGP FLIR Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_FLIR", 675, "LANTIRN","RIO LANTIRN FLIR Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_MUX", 676, "LANTIRN","RIO LANTIRN MUX Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_MUXEGU", 676, "LANTIRN","RIO LANTIRN MUX EGU Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_EGU", 676, "LANTIRN","RIO LANTIRN EGU Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_LASER", 677, "LANTIRN","RIO LANTIRN SERVO Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_LASERSERVO", 677, "LANTIRN","RIO LANTIRN LASER SERVO Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_SERVO", 677, "LANTIRN","RIO LANTIRN SERVO Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_FLIR", 678, "LANTIRN","RIO LANTIRN FLIR Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_FLIRTCS", 678, "LANTIRN","RIO LANTIRN FLIR TCS Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_TCS", 678, "LANTIRN","RIO LANTIRN TCS Light (BOTTOM) (green)")
defineIndicatorLightMulti1("RIO_LANTIRN_IBIT", 679, "LANTIRN","RIO LANTIRN IBIT Light (green)")
defineIndicatorLightMulti1("RIO_LANTIRN_LASERARMED", 680, "LANTIRN","RIO LANTIRN LASER ARMED Light (green)")	

-- Indicator Lights PLT
defineIndicatorLight("PLT_TACAN_COMAND_PLT", 290, "PLT Indicator Lights","PILOT TACAN Command Light PLT (green)")
defineIndicatorLight("PLT_TACAN_COMAND_NFO", 291, "PLT Indicator Lights","PILOT TACAN Command Light NFO (green)")
defineIndicatorLight("PLT_JETT_LIGHT", 701, "PLT Indicator Lights","PILOT Emergency Stores Jettison Light (red)")
defineIndicatorLight("PLT_FLOOD_LIGHTS", 1800, "PLT Indicator Lights","PILOT Flood Lights Red (red)")
defineIndicatorLight("PLT_PANEL_LIGHTS", 1801, "PLT Indicator Lights","PILOT Panel Lights (red) inverted")
defineIndicatorLight("PLT_INSTRUMENT_LIGHTS", 1802, "PLT Indicator Lights","PILOT Instrument Lights (red) inverted")
defineIndicatorLight("PLT_FLOOD_LIGHTS_W", 1803, "PLT Indicator Lights","PILOT Flood Lights White (white)")
defineIndicatorLight("PLT_AOA_SLOW", 3760, "PLT Indicator Lights","PILOT AOA Slow (green)")
defineIndicatorLight("PLT_AOA_OPT", 3761, "PLT Indicator Lights","PILOT AOA Optimum (yellow)")
defineIndicatorLight("PLT_AOA_FAST", 3762, "PLT Indicator Lights","PILOT AOA Fast (red)")
defineIndicatorLight("PLT_TACAN_GO", 8050, "PLT Indicator Lights","PILOT TACAN GO Light (green)")
defineIndicatorLight("PLT_TACAN_NOGO", 8051, "PLT Indicator Lights","PILOT TACAN NOGO Light (red)")
defineIndicatorLight("PLT_MASTER_CAUTION", 9200, "PLT Indicator Lights","PILOT Weapon Panel Master Caution Light (red)")
defineIndicatorLight("PLT_HOT_TRIGGER", 9201, "PLT Indicator Lights","PILOT Weapon Panel Hot Trigger Light (red)")
defineIndicatorLight("PLT_COLLISION_LIGHT", 9202, "PLT Indicator Lights","PILOT Weapon Panel Collision Light (green)")
defineIndicatorLight("PLT_SEAM_LOCK", 9203, "PLT Indicator Lights","PILOT Weapon Panel SEAM Lock Light (green)")
defineIndicatorLight("PLT_GUN_RATE_HIGH", 9204, "PLT Indicator Lights","PILOT Weapon Panel Gunrate High Light (red)")
defineIndicatorLight("PLT_GUN_RATE_LOW", 9205, "PLT Indicator Lights","PILOT Weapon Panel Gunrate Low Light (red)")
defineIndicatorLight("PLT_SW_COOL_ON", 9206, "PLT Indicator Lights","PILOT Weapon Panel Sidewinder Cooling ON Light (red)")
defineIndicatorLight("PLT_SW_COOL_OFF", 9207, "PLT Indicator Lights","PILOT Weapon Panel Sidewinder Cooling OFF Light (red)")
defineIndicatorLight("PLT_MSL_PREP_ON", 9208, "PLT Indicator Lights","PILOT Weapon Panel Missle Prepare ON Light (red)")
defineIndicatorLight("PLT_MSL_PREP_OFF", 9209, "PLT Indicator Lights","PILOT Weapon Panel Missle Prepare OFF Light (red)")
defineIndicatorLight("PLT_MSL_MODE_NORM", 9210, "PLT Indicator Lights","PILOT Weapon Panel Missle Mode Normal Light (red)")
defineIndicatorLight("PLT_MSL_MODE_BORE", 9211, "PLT Indicator Lights","PILOT Weapon Panel Missle Mode Boresight Light (red)")
defineIndicatorLight("PLT_HUD_LIGHT_WHEELS", 9350, "PLT Indicator Lights","PILOT HUD Light Wheels (red)")
defineIndicatorLight("PLT_HUD_LIGHT_BRAKES", 9351, "PLT Indicator Lights","PILOT HUD Light Brakes (red)")
defineIndicatorLight("PLT_HUD_LIGHT_ACLSAP", 9352, "PLT Indicator Lights","PILOT HUD Light ACLS/AP (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_NWS", 9353, "PLT Indicator Lights","PILOT HUD Light NWS Enga (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_AUTOTHR", 9354, "PLT Indicator Lights","PILOT HUD Light Auto Throttle (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_RStall", 9355, "PLT Indicator Lights","PILOT HUD Right Stall (red)")
defineIndicatorLight("PLT_HUD_LIGHT_LStall", 9356, "PLT Indicator Lights","PILOT HUD Left Stall (red)")
defineIndicatorLight("PLT_HUD_LIGHT_SAM", 9357, "PLT Indicator Lights","PILOT HUD SAM (red)")
defineIndicatorLight("PLT_HUD_LIGHT_AAA", 9358, "PLT Indicator Lights","PILOT HUD AAA (red)")
defineIndicatorLight("PLT_HUD_LIGHT_AI", 9359, "PLT Indicator Lights","PILOT HUD AI (red)")
defineIndicatorLight("PLT_VDI_LIGHT_ADJAC", 9360, "PLT Indicator Lights","PILOT VDI ADJ A/C Light (red)") 
defineIndicatorLight("PLT_VDI_LIGHT_LANDCHK", 9361, "PLT Indicator Lights","PILOT VDI LANDING CHK Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_ACLRDY", 9362, "PLT Indicator Lights","PILOT VDI ACL READY Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_APCLR", 9363, "PLT Indicator Lights","PILOT VDI A/P CPLR Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_CMDCON", 9364, "PLT Indicator Lights","PILOT VDI CMD CONTROL Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_10SEC", 9365, "PLT Indicator Lights","PILOT VDI 10 SECONDS Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_TILT", 9366, "PLT Indicator Lights","PILOT VDI TILT Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_VOICE", 9367, "PLT Indicator Lights","PILOT VDI VOICE Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_AUTOTH", 9368, "PLT Indicator Lights","PILOT VDI AUTO THRO Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_APREF", 9369, "PLT Indicator Lights","PILOT VDI A/P REF Light (red)")
defineIndicatorLight("PLT_GEAR_LIGHT", 15001, "PLT Indicator Lights","PILOT Landing Gear Light (red)")
defineIndicatorLight("PLT_REFUELPROBE_LIGHT", 15002, "PLT Indicator Lights","PILOT Refuel Probe Light (red)")
defineIndicatorLight("PLT_MASTERTEST_GO", 15010, "PLT Indicator Lights","PILOT MASTER TEST GO Light (green)")
defineIndicatorLight("PLT_MASTERTEST_NOGO", 15011, "PLT Indicator Lights","PILOT MASTER TEST NOGO Light (red)")
defineIndicatorLight("PLT_R_ENG_FIRE", 15014, "PLT Indicator Lights","PILOT Right Engine Fire Light (red)")
defineIndicatorLight("PLT_L_ENG_FIRE", 15015, "PLT Indicator Lights","PILOT Left Engine Fire Light (red)") 
defineIndicatorLight("PLT_WARN_LGEN", 15016, "PLT Indicator Lights","PILOT Warning Lamp Left Generator (yellow)")
defineIndicatorLight("PLT_WARN_LOILHOT", 15017, "PLT Indicator Lights","PILOT Warning Lamp Left Oil Hot (yellow)")
defineIndicatorLight("PLT_WARN_LFUELPRESS", 15018, "PLT Indicator Lights","PILOT Warning Lamp Left Fuel Pressure (yellow)")
defineIndicatorLight("PLT_WARN_ENGFIREEXT", 15019, "PLT Indicator Lights","PILOT Warning Lamp Engine Fire Extinguisher (green)")
defineIndicatorLight("PLT_WARN_RGEN", 15020, "PLT Indicator Lights","PILOT Warning Lamp Right Generator (yellow)")
defineIndicatorLight("PLT_WARN_ROILHOT", 15022, "PLT Indicator Lights","PILOT Warning Lamp Right Oil Hot (yellow)")
defineIndicatorLight("PLT_WARN_RFUELPRESS", 15021, "PLT Indicator Lights","PILOT Warning Lamp Right Fuel Pressure (yellow)")
defineIndicatorLight("PLT_WARN_WINGSWEEP", 15023, "PLT Indicator Lights","PILOT Warning Lamp Wing Sweep (green)")
defineIndicatorLight("PLT_WARN_AUXFIREEXT", 15024, "PLT Indicator Lights","PILOT Warning Lamp Auxiliary Fire Extinguisher (green)")
defineIndicatorLight("PLT_WARN_YAWSTABOP", 15025, "PLT Indicator Lights","PILOT Warning Lamp Yaw Stabilizer Op (yellow)")
defineIndicatorLight("PLT_WARN_YAWSTABOUT", 15026, "PLT Indicator Lights","PILOT Warning Lamp Yaw Stabilizer Out (yellow)")
defineIndicatorLight("PLT_WARN_CANOPY", 15027, "PLT Indicator Lights","PILOT Warning Lamp Canopy (yellow)")
defineIndicatorLight("PLT_WARN_CADC", 15028, "PLT Indicator Lights","PILOT Warning Lamp CADC (yellow)")
defineIndicatorLight("PLT_WARN_LFUELLOW", 15029, "PLT Indicator Lights","PILOT Warning Lamp Left Fuel Low (yellow)")
defineIndicatorLight("PLT_WARN_WSHIELDHOT", 15030, "PLT Indicator Lights","PILOT Warning Lamp Windshield Hot (green)")
defineIndicatorLight("PLT_WARN_EMERGJETT", 15031, "PLT Indicator Lights","PILOT Warning Lamp Emergency Jettison (yellow)")
defineIndicatorLight("PLT_WARN_OXYLOW", 15032, "PLT Indicator Lights","PILOT Warning Lamp Qxygen Low (yellow)")
defineIndicatorLight("PLT_WARN_BINGO", 15033, "PLT Indicator Lights","PILOT Warning Lamp Bingo Fuel (yellow)")
defineIndicatorLight("PLT_WARN_HYDPRESS", 15034, "PLT Indicator Lights","PILOT Warning Lamp Hydraulic Pressure (yellow)")
defineIndicatorLight("PLT_WARN_RFUELLOW", 15035, "PLT Indicator Lights","PILOT Warning Lamp Right Fuel Low (yellow)")
defineIndicatorLight("PLT_WARN_MACHTRIM", 15036, "PLT Indicator Lights","PILOT Warning Lamp Mach Trim (green)")
defineIndicatorLight("PLT_WARN_PITCHSTAB", 15037, "PLT Indicator Lights","PILOT Warning Lamp Pitch Stabilizer (yellow)")
defineIndicatorLight("PLT_WARN_BLEEDDUCT", 15038, "PLT Indicator Lights","PILOT Warning Lamp Bleed Duct (yellow)")
defineIndicatorLight("PLT_WARN_ROLLSTAB", 15039, "PLT Indicator Lights","PILOT Warning Lamp Roll Stabilizer (yellow)")
defineIndicatorLight("PLT_WARN_PITCHSTAB2", 15040, "PLT Indicator Lights","PILOT Warning Lamp Pitch Stabilizer 2 (yellow)")
defineIndicatorLight("PLT_WARN_AUTOPLT", 15041, "PLT Indicator Lights","PILOT Warning Lamp Autopilot (yellow)")
defineIndicatorLight("PLT_WARN_LOVSPVALVE", 15042, "PLT Indicator Lights","PILOT Warning Lamp Left Ovsp Valve (yellow)")
defineIndicatorLight("PLT_WARN_ROVSPVALVE", 15043, "PLT Indicator Lights","PILOT Warning Lamp Right Ovsp Valve (yellow)")
defineIndicatorLight("PLT_WARN_RRAMP", 15044, "PLT Indicator Lights","PILOT Warning Lamp Right Ramp (yellow)")
defineIndicatorLight("PLT_WARN_LAUNCHBAR", 15045, "PLT Indicator Lights","PILOT Warning Lamp Launchbar (green)")
defineIndicatorLight("PLT_WARN_FLAP", 15046, "PLT Indicator Lights","PILOT Warning Lamp Flap (yellow)")
defineIndicatorLight("PLT_WARN_HZTAILAUTH", 15047, "PLT Indicator Lights","PILOT Warning Lamp Horizontal Tail Auth (yellow)")
defineIndicatorLight("PLT_WARN_OILPRESS", 15048, "PLT Indicator Lights","PILOT Warning Lamp Oil Pressure (yellow)")
defineIndicatorLight("PLT_WARN_LRAMP", 15049, "PLT Indicator Lights","PILOT Warning Lamp Left Ramp (yellow)")
defineIndicatorLight("PLT_WARN_LADDER", 15050, "PLT Indicator Lights","PILOT Warning Lamp Ladder (yellow)")
defineIndicatorLight("PLT_WARN_RINLET", 15051, "PLT Indicator Lights","PILOT Warning Lamp Right Inlet (yellow)")
defineIndicatorLight("PLT_WARN_INLETICE", 15052, "PLT Indicator Lights","PILOT Warning Lamp Inlet Ice (yellow)")
defineIndicatorLight("PLT_WARN_RUDDERAUTH", 15053, "PLT Indicator Lights","PILOT Warning Lamp Rudder Auth (yellow)")
defineIndicatorLight("PLT_WARN_LINLET", 15054, "PLT Indicator Lights","PILOT Warning Lamp Left Inlet (yellow)")
defineIndicatorLight("PLT_WARN_ANRS", 15055, "PLT Indicator Lights","PILOT Warning Lamp ANRS (green)")
defineIndicatorLight("PLT_WARN_ROLLSTAB2", 15056, "PLT Indicator Lights","PILOT Warning Lamp Roll Stabilizer 2 (yellow)")	
defineIndicatorLight("PLT_WARN_SPOILERS", 15057, "PLT Indicator Lights","PILOT Warning Lamp Spoilers (yellow)")	
defineIndicatorLight("PLT_WARN_TRANSRECT", 15058, "PLT Indicator Lights","PILOT Warning Lamp Trans Rect (green)")
defineIndicatorLight("PLT_WARN_REDUCESPEED", 15059, "PLT Indicator Lights","PILOT Warning Lamp Reduce Speed (yellow)")
defineIndicatorLight("PLT_WARN_INTERTRIM", 15060, "PLT Indicator Lights","PILOT Warning Lamp Inter Trim (green)")
defineIndicatorLight("PLT_WARN_LENGSEC", 15061, "PLT Indicator Lights","PILOT Warning Lamp Left Engine Secondary (yellow)")
defineIndicatorLight("PLT_WARN_RATS", 15062, "PLT Indicator Lights","PILOT Warning Lamp RATS (green)")
defineIndicatorLight("PLT_WARN_STARTVALVE", 15063, "PLT Indicator Lights","PILOT Warning Lamp Start Valve (yellow)")
defineIndicatorLight("PLT_WARN_RENGSEC", 15064, "PLT Indicator Lights","PILOT Warning Lamp Right Engine Secondary (yellow)")
defineIndicatorLight("PLT_VDI_LIGHT_WAVEOFF", 15070, "PLT Indicator Lights","PILOT VDI WAVE OFF Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_WINGSWEEP", 15071, "PLT Indicator Lights","PILOT VDI WING SWEEP Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_REDUCESPD", 15072, "PLT Indicator Lights","PILOT VDI REDUCE SPD Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_ALTLOW", 15073, "PLT Indicator Lights","PILOT VDI ALT LOW Light (red)")
defineIndicatorLight("PLT_HOOK_LIGHT", 15090, "PLT Indicator Lights","PILOT Hook Light (red)")
defineIndicatorLight("PLT_RADAR_ALT_LIGHT", 19107, "PLT Indicator Lights","PILOT Radar Altimeter Warning Light (red)")
defineIndicatorLight("PLT_RADAR_ALT_TEST_LIGHT", 19108, "PLT Indicator Lights","PILOT Radar Altimeter Test Light (red)")
defineIndicatorLight("PLT_SLATS_IND_LIGHT", 8310, "Gauges as Light", "PILOT Slats Indicator as Light")	
defineIndicatorLight("PLT_FLAPS_IND_LIGHT", 8311, "Gauges as Light", "PILOT Flaps Indicator as Light")
defineIndicatorLight("PLT_SPDBRK_IND_LIGHT", 8307, "Gauges as Light", "PILOT Speedbrake Indicator as Light")
defineIndicatorLight("PLT_SPDBRK_FULL_LIGHT", 8308, "Gauges as Light", "PILOT Speedbrake Full Indicator as Light")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_1A_STORE_L", 9221, "Gauges as Light", "PILOT Weapon Store 1A as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_1B_STORE_L", 9222, "Gauges as Light", "PILOT Weapon Store 1B as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_3_STORE_L", 9223, "Gauges as Light", "PILOT Weapon Store 3 as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_4_STORE_L", 9224, "Gauges as Light", "PILOT Weapon Store 4 as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_5_STORE_L", 9225, "Gauges as Light", "PILOT Weapon Store 5 as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_6_STORE_L", 9226, "Gauges as Light", "PILOT Weapon Store 6 as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_8B_STORE_L", 9227, "Gauges as Light", "PILOT Weapon Store 8B as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_8A_STORE_L", 9228, "Gauges as Light", "PILOT Weapon Store 8A as Light (STORE)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_1A_READY_L", 9221, "Gauges as Light", "PILOT Weapon Store 1A as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_1B_READY_L", 9222, "Gauges as Light", "PILOT Weapon Store 1B as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_3_READY_L", 9223, "Gauges as Light", "PILOT Weapon Store 3 as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_4_READY_L", 9224, "Gauges as Light", "PILOT Weapon Store 4 as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_5_READY_L", 9225, "Gauges as Light", "PILOT Weapon Store 5 as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_6_READY_L", 9226, "Gauges as Light", "PILOT Weapon Store 6 as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_8B_READY_L", 9227, "Gauges as Light", "PILOT Weapon Store 8B as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_8A_READY_L", 9228, "Gauges as Light", "PILOT Weapon Store 8A as Light (READY)")
defineIndicatorLight("PLT_GEAR_NOSE_OFF_L", 8300, "Gauges as Light", "PILOT Nose Gear OFF Flag as Light")
defineIndicatorLight("PLT_GEAR_NOSE_IND_L", 8301, "Gauges as Light", "PILOT Nose Gear Indicator as Light")
defineIndicatorLight("PLT_GEAR_L_OFF_L", 8303, "Gauges as Light", "PILOT Left Gear OFF Flag as Light")
defineIndicatorLight("PLT_GEAR_L_IND_L", 8302, "Gauges as Light", "PILOT Left Gear Indicator as Light")
defineIndicatorLight("PLT_GEAR_R_OFF_L", 8304, "Gauges as Light", "PILOT Right Gear OFF Flag as Light")
defineIndicatorLight("PLT_GEAR_R_IND_L", 8305, "Gauges as Light", "PILOT Right Gear Indicator as Light")

-- Indicator Lights RIO
defineIndicatorLight("RIO_SCP_RECORD_STBY_L", 92, "RIO Indicator Lights","RIO SCP Record Standby Light (red)")
defineIndicatorLight("RIO_SCP_RECORD_REC_L", 93, "RIO Indicator Lights","RIO SCP Record Light (green)")
defineIndicatorLight("RIO_SCP_RECORD_END_L", 94, "RIO Indicator Lights","RIO SCP Record End of Tape Light (red)")
defineIndicatorLight("RIO_HCU_PW_RESET_L", 407, "RIO Indicator Lights","RIO HCU Power Reset Light (green)")
defineIndicatorLight("RIO_HCS_WCS_PW_L", 408, "RIO Indicator Lights","RIO HCU WCS Power Light (green)")
defineIndicatorLight("RIO_HCU_IR_STBY_L", 407, "RIO Indicator Lights","RIO HCU IR Standby Light (green)")
defineIndicatorLight("RIO_FLOOD_LIGHTS", 1804, "RIO Indicator Lights","RIO Flood Lights (red)")
defineIndicatorLight("RIO_PANEL_LIGHTS", 1805, "RIO Indicator Lights","RIO Panel Lights (red) inverted")
defineIndicatorLight("RIO_INSTRUMENT_LIGHTS", 1806, "RIO Indicator Lights","RIO Instrument Lights (red) inverted")
defineIndicatorLight("RIO_FLOOD_LIGHTS_W", 1807, "RIO Indicator Lights","RIO White Flood Lights (white)")
defineIndicatorLight("RIO_ACLS_TEST_LIGHT", 2016, "RIO Indicator Lights","RIO ACLS Test Light (green)")
defineIndicatorLight("RIO_CAD_OXYLOW", 2199, "RIO Indicator Lights","RIO CAD OXY LOW Light (green)")
defineIndicatorLight("RIO_MASTERCAUTION_LIGHT", 2200, "RIO Indicator Lights","RIO MASTER CAUTION Light (red)")
defineIndicatorLight("RIO_IFF_LIGHT", 2201, "RIO Indicator Lights","RIO IFF Light (green)")	
defineIndicatorLight("RIO_RCV_LIGHT", 2202, "RIO Indicator Lights","RIO RCV Light (green)")	
defineIndicatorLight("RIO_XMIT_LIGHT", 2203, "RIO Indicator Lights","RIO XMIT Light (green)")	
defineIndicatorLight("RIO_SAM_LIGHT", 2204, "RIO Indicator Lights","RIO SAM Light (red)")	
defineIndicatorLight("RIO_AAA_LIGHT", 2205, "RIO Indicator Lights","RIO AAA Light (red)")	
defineIndicatorLight("RIO_CW_LIGHT", 2206, "RIO Indicator Lights","RIO CW Light (red)")	
defineIndicatorLight("RIO_AI_LIGHT", 2208, "RIO Indicator Lights","RIO AI Light (red)")		
defineIndicatorLight("RIO_CAD_CDHOT", 2209, "RIO Indicator Lights","RIO CAD C D HOT Light (green)")
defineIndicatorLight("RIO_CAD_CABINPRESS", 2210, "RIO Indicator Lights","RIO CAD CABIN PRESS Light (green)")
defineIndicatorLight("RIO_CAD_FUELLOW", 2211, "RIO Indicator Lights","RIO CAD FUEL LOW Light (green)")
defineIndicatorLight("RIO_CAD_CANOPY", 2212, "RIO Indicator Lights","RIO CAD CANOPY Light (green)")
defineIndicatorLight("RIO_CAD_FUZEHV", 2213, "RIO Indicator Lights","RIO CAD FUZE HV Light (green)")
defineIndicatorLight("RIO_CAD_RDRENABLED", 2214, "RIO Indicator Lights","RIO CAD RDR ENABLED Light (green)")
defineIndicatorLight("RIO_CAD_COOLINGAIR", 2215, "RIO Indicator Lights","RIO CAD COOLING AIR Light (yellow)")
defineIndicatorLight("RIO_CAD_MSLCOND", 2216, "RIO Indicator Lights","RIO CAD MSL COND Light (yellow)")
defineIndicatorLight("RIO_CAD_AWG9COND", 2217, "RIO Indicator Lights","RIO CAD C D HOT Light (yellow)")
defineIndicatorLight("RIO_CAD_NAVCOMP", 2218, "RIO Indicator Lights","RIO CAD NAV COMP Light (yellow)")
defineIndicatorLight("RIO_CAD_FILMLOW", 2219, "RIO Indicator Lights","RIO CAD FILM LOW Light (yellow)")
defineIndicatorLight("RIO_CAD_IMU", 2220, "RIO Indicator Lights","RIO CAD IMU Light (yellow)")
defineIndicatorLight("RIO_CAD_AHRS", 2221, "RIO Indicator Lights","RIO CAD AHRS Light (yellow)")
defineIndicatorLight("RIO_DDI_LIGHTS_WAVEOFF", 2222, "RIO Indicator Lights","RIO DDI WAVE OFF Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_LANDCHK", 2223, "RIO Indicator Lights","RIO DDI LAND CHK Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ACLBEAC", 2224, "RIO Indicator Lights","RIO DDI ACL BEAC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ACLRDY", 2225, "RIO Indicator Lights","RIO DDI ACL RDY Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_APCPLR", 2226, "RIO Indicator Lights","RIO DDI A PC PLR Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_10SEC", 2227, "RIO Indicator Lights","RIO DDI 10 SEC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ADJAC", 2228, "RIO Indicator Lights","RIO DDI ADJ A C Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_VOICE", 2229, "RIO Indicator Lights","RIO DDI VOICE Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_TILT", 2230, "RIO Indicator Lights","RIO DDI TILT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CMDCHG", 2231, "RIO Indicator Lights","RIO DDI CMD CHG Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ALTCHG", 2232, "RIO Indicator Lights","RIO DDI ALT CHG Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_MONALT", 2233, "RIO Indicator Lights","RIO DDI MON ALT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_MANUAL", 2234, "RIO Indicator Lights","RIO DDI MANUAL Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_SPDCHG", 2235, "RIO Indicator Lights","RIO DDI SPD CHG Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_MONSPD", 2236, "RIO Indicator Lights","RIO DDI MON SPD Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CMDCTRL", 2237, "RIO Indicator Lights","RIO DDI CMD CTRL Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CHGCHN", 2238, "RIO Indicator Lights","RIO DDI CHG CHN Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_HDGCHN", 2239, "RIO Indicator Lights","RIO DDI HDG CHN Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CANCRPY", 2240, "RIO Indicator Lights","RIO DDI CANC RPY Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_FWDVEC", 2241, "RIO Indicator Lights","RIO DDI FWD VEC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_AFTVEC", 2242, "RIO Indicator Lights","RIO DDI AFT VEC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_COIVEC", 2243, "RIO Indicator Lights","RIO DDI COI VEC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_NOMSG", 2244, "RIO Indicator Lights","RIO DDI NO MSG Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_10WAYPT", 2245, "RIO Indicator Lights","RIO DDI 10 WAYPT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_HANDOVER", 2246, "RIO Indicator Lights","RIO DDI HANDOVER Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ORBIT", 2247, "RIO Indicator Lights","RIO DDI ORBIT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CHALNGE", 2248, "RIO Indicator Lights","RIO DDI CHALNGE Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ARM1", 2249, "RIO Indicator Lights","RIO DDI ARM 1 Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ARM2", 2250, "RIO Indicator Lights","RIO DDI ARM 2 Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ARM3", 2251, "RIO Indicator Lights","RIO DDI ARM 3 Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_NOTCMD", 2252, "RIO Indicator Lights","RIO DDI NOT CMD Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_FRELAN", 2253, "RIO Indicator Lights","RIO DDI FRE LAN Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_DISGAGE", 2254, "RIO Indicator Lights","RIO DDI DISGAGE Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ABORT", 2255, "RIO Indicator Lights","RIO DDI ABORT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_BEACON", 2256, "RIO Indicator Lights","RIO DDI BEAC ON Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_SEACDUB", 2257, "RIO Indicator Lights","RIO DDI SEAC DUB Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_DROP", 2258, "RIO Indicator Lights","RIO DDI DROP Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_BEACOFF", 2259, "RIO Indicator Lights","RIO DDI BEAC OFF Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_RETBASE", 2260, "RIO Indicator Lights","RIO DDI RET BASE Light (green)")	
defineIndicatorLight("RIO_TID_SCREEN_LIGHT", 3450, "RIO Indicator Lights","RIO TID Screen Light (light green)")
defineIndicatorLight("RIO_IFF_TEST_LIGHT", 8052, "RIO Indicator Lights","RIO IFF Test Light (green)")
defineIndicatorLight("RIO_IFF_REPLY_LIGHT", 8053, "RIO Indicator Lights","RIO IFF Reply Light (green)")
defineIndicatorLight("RIO_TACAN_GO", 8893, "RIO Indicator Lights","RIO TACAN GO Light (green)")
defineIndicatorLight("RIO_TACAN_NOGO", 8892, "RIO Indicator Lights","RIO TACAN NOGO Light (red)")
defineIndicatorLight("RIO_DDD_LIGHTS_ANTTRK", 11503, "RIO Indicator Lights","RIO DDD ANT TRK Light (green)")
defineIndicatorLight("RIO_DDD_LIGHTS_RDROT", 11504, "RIO Indicator Lights","RIO DDD RDROT Light (green)")
defineIndicatorLight("RIO_DDD_LIGHTS_JAT", 11505, "RIO Indicator Lights","RIO DDD JAT Light (green)")
defineIndicatorLight("RIO_DDD_LIGHTS_IROT", 11506, "RIO Indicator Lights","RIO DDD IROT Light (green)")
defineIndicatorLightMulti1("RIO_TID_STBY_LIGHT_1", 490, "RIO Indicator Lights","RIO TDI Standby Light (green)")
defineIndicatorLightMulti2("RIO_TID_STBY_LIGHT_2", 490, "RIO Indicator Lights","RIO TDI Standby Light (blue)")
defineIndicatorLightMulti1("RIO_TID_READY_LIGHT_1", 491, "RIO Indicator Lights","RIO TDI Ready Light (green)")
defineIndicatorLightMulti2("RIO_TID_READY_LIGHT_2", 491, "RIO Indicator Lights","RIO TDI Ready Light (blue)")
defineIndicatorLightMulti1("RIO_LAUNCH_LIGHT_1", 492, "RIO Indicator Lights","RIO Launch Light (red)")
defineIndicatorLightMulti2("RIO_LAUNCH_LIGHT_2", 492, "RIO Indicator Lights","RIO Launch Light (green)")
defineIndicatorLightMulti1("RIO_DECM_LIGHT", 493, "RIO Indicator Lights","RIO DECM Standby Light (yellow)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_CLEAR_1", 5550, "RIO Indicator Lights","RIO CAP CLEAR Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_CLEAR_2", 5550, "RIO Indicator Lights","RIO CAP CLEAR Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_SW_1", 5551, "RIO Indicator Lights","RIO CAP SW Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_SW_2", 5551, "RIO Indicator Lights","RIO CAP SW Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_NE_1", 5552, "RIO Indicator Lights","RIO CAP NE Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_NE_2", 5552, "RIO Indicator Lights","RIO CAP NE Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_ENTER_1", 5553, "RIO Indicator Lights","RIO CAP ENTER Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_ENTER_2", 5553, "RIO Indicator Lights","RIO CAP ENTER Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_1_1", 5554, "RIO Indicator Lights","RIO CAP 1 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_1_2", 5554, "RIO Indicator Lights","RIO CAP 1 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_2_1", 5555, "RIO Indicator Lights","RIO CAP 2 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_2_2", 5555, "RIO Indicator Lights","RIO CAP 2 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_3_1", 5556, "RIO Indicator Lights","RIO CAP 3 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_3_2", 5556, "RIO Indicator Lights","RIO CAP 3 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_4_1", 5557, "RIO Indicator Lights","RIO CAP 4 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_4_2", 5557, "RIO Indicator Lights","RIO CAP 4 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_5_1", 5558, "RIO Indicator Lights","RIO CAP 5 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_5_2", 5558, "RIO Indicator Lights","RIO CAP 5 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_6_1", 5559, "RIO Indicator Lights","RIO CAP 6 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_6_2", 5559, "RIO Indicator Lights","RIO CAP 6 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_7_1", 5560, "RIO Indicator Lights","RIO CAP 7 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_7_2", 5560, "RIO Indicator Lights","RIO CAP 7 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_8_1", 5561, "RIO Indicator Lights","RIO CAP 8 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_8_2", 5561, "RIO Indicator Lights","RIO CAP 8 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_9_1", 5562, "RIO Indicator Lights","RIO CAP 9 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_9_2", 5562, "RIO Indicator Lights","RIO CAP 9 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_0_1", 5563, "RIO Indicator Lights","RIO CAP 0 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_0_2", 5563, "RIO Indicator Lights","RIO CAP 0 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN6", 5564, "RIO Indicator Lights","RIO CAP BTN 6 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN7", 5565, "RIO Indicator Lights","RIO CAP BTN 7 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN8", 5566, "RIO Indicator Lights","RIO CAP BTN 8 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN9", 5567, "RIO Indicator Lights","RIO CAP BTN 9 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN1", 5568, "RIO Indicator Lights","RIO CAP BTN 1 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN2", 5569, "RIO Indicator Lights","RIO CAP BTN 2 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN3", 5570, "RIO Indicator Lights","RIO CAP BTN 3 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN4", 5571, "RIO Indicator Lights","RIO CAP BTN 4 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN5", 5572, "RIO Indicator Lights","RIO CAP BTN 5 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_TNG_NBR_1", 5573, "RIO Indicator Lights","RIO CAP TNG NBR Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_TNG_NBR_2", 5573, "RIO Indicator Lights","RIO CAP TNG NBR Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_PGM_RESTART_1", 5574, "RIO Indicator Lights","RIO CAP PGM Restart Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_PGM_RESTART_2", 5574, "RIO Indicator Lights","RIO CAP PGM Restart Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN10", 5590, "RIO Indicator Lights","RIO CAP BTN 10 Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_RDR_1", 6111, "RIO Indicator Lights","RIO DDD RDR Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_RDR_2", 6111, "RIO Indicator Lights","RIO DDD RDR Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_IR_1", 6112, "RIO Indicator Lights","RIO DDD IR Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_IR_2", 6112, "RIO Indicator Lights","RIO DDD IR Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_IFF_1", 6113, "RIO Indicator Lights","RIO DDD IFF Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_IFF_2", 6113, "RIO Indicator Lights","RIO DDD IFF Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_PDSTT_1", 6114, "RIO Indicator Lights","RIO DDD PDSTT Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_PDSTT_2", 6114, "RIO Indicator Lights","RIO DDD PDSTT Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_PSTT_1", 6115, "RIO Indicator Lights","RIO DDD PULSE STT Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_PSTT_2", 6115, "RIO Indicator Lights","RIO DDD PULSE STT Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_PDSEARCH_1", 6116, "RIO Indicator Lights","RIO DDD PDSEARCH Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_PDSEARCH_2", 6116, "RIO Indicator Lights","RIO DDD PDSEARCH Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_RWS_1", 6117, "RIO Indicator Lights","RIO DDD RWS Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_RWS_2", 6117, "RIO Indicator Lights","RIO DDD RWS Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_TWS_AUTO_1", 6118, "RIO Indicator Lights","RIO DDD TWS AUTO Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_TWS_AUTO_2", 6118, "RIO Indicator Lights","RIO DDD TWS AUTO Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_TWS_MAN_1", 6119, "RIO Indicator Lights","RIO DDD TWS MAN Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_TWS_MAN_2", 6119, "RIO Indicator Lights","RIO DDD TWS MAN Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_PSEARCH_1", 6120, "RIO Indicator Lights","RIO DDD PSEARCH Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_PSEARCH_2", 6120, "RIO Indicator Lights","RIO DDD PSEARCH Light (green)")
defineIndicatorLightMulti1("RIO_CCM_LIGHT_SPL_1", 6121, "RIO Indicator Lights","RIO CCM SPL Light (red)")
defineIndicatorLightMulti2("RIO_CCM_LIGHT_SPL_2", 6121, "RIO Indicator Lights","RIO CCM SPL Light (green)")
defineIndicatorLightMulti1("RIO_CCM_LIGHT_ALTOFF_1", 6122, "RIO Indicator Lights","RIO CCM ALT OFF Light (red)")
defineIndicatorLightMulti2("RIO_CCM_LIGHT_ALTOFF_2", 6122, "RIO Indicator Lights","RIO CCM ALT OFF Light (green)")
defineIndicatorLightMulti1("RIO_CCM_LIGHT_VGS_1", 6123, "RIO Indicator Lights","RIO CCM VGS Light (red)")
defineIndicatorLightMulti2("RIO_CCM_LIGHT_VGS_2", 6123, "RIO Indicator Lights","RIO CCM VGS Light (green)")
defineIndicatorLightMulti1("RIO_TID_TRACKHOLD_LIGHT", 6125, "RIO Indicator Lights","RIO TID TRACKHOLD Light (red)")
defineIndicatorLightMulti1("RIO_TID_CLSN_LIGHT_1", 6126, "RIO Indicator Lights","RIO TID CLSN Light (red)")
defineIndicatorLightMulti2("RIO_TID_CLSN_LIGHT_2", 6126, "RIO Indicator Lights","RIO TID CLSN Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_RIDDSBL_1", 6127, "RIO Indicator Lights","RIO TID RID DSBL Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_RIDDSBL_2", 6127, "RIO Indicator Lights","RIO TID RID DSBL Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_ALTNUM_1", 6128, "RIO Indicator Lights","RIO TID ALT NUM Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_ALTNUM_2", 6128, "RIO Indicator Lights","RIO TID ALT NUM Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_SYMELEM_1", 6129, "RIO Indicator Lights","RIO TID SYM ELEM Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_SYMELEM_2", 6129, "RIO Indicator Lights","RIO TID SYM ELEM Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_DATALINK_1", 6130, "RIO Indicator Lights","RIO TID DATALINK Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_DATALINK_2", 6130, "RIO Indicator Lights","RIO TID DATALINK Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_JAM_1", 6131, "RIO Indicator Lights","RIO TID JAM STROBE Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_JAM_2", 6131, "RIO Indicator Lights","RIO TID JAM STROBE Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_NONATTK_1", 6132, "RIO Indicator Lights","RIO TID NON ATTK Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_NONATTK_2", 6132, "RIO Indicator Lights","RIO TID NON ATTK Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_LZ_1", 6133, "RIO Indicator Lights","RIO TID LAUNCH ZONE Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_LZ_2", 6133, "RIO Indicator Lights","RIO TID LAUNCH ZONE Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_VELVEC_1", 6134, "RIO Indicator Lights","RIO TID VEL VECTOR Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_VELVEC_2", 6134, "RIO Indicator Lights","RIO TID VEL VECTOR Light (green)")
defineIndicatorLightMulti1("RIO_HCU_LIGHT_TVIR_1", 6135, "RIO Indicator Lights","RIO HCU IR/TV Light (red)")
defineIndicatorLightMulti2("RIO_HCU_LIGHT_TVIR_2", 6135, "RIO Indicator Lights","RIO HCU IR/TV Light (green)")
defineIndicatorLightMulti1("RIO_HCU_LIGHT_RDR_1", 6136, "RIO Indicator Lights","RIO HCU RDR Light (red)")
defineIndicatorLightMulti2("RIO_HCU_LIGHT_RDR_2", 6136, "RIO Indicator Lights","RIO HCU RDR Light (green)")
defineIndicatorLightMulti1("RIO_HCU_LIGHT_DDD_1", 6137, "RIO Indicator Lights","RIO HCU DDD CURSOR Light (red)")
defineIndicatorLightMulti2("RIO_HCU_LIGHT_DDD_2", 6137, "RIO Indicator Lights","RIO HCU DDD CURSOR Light (green)")
defineIndicatorLightMulti1("RIO_HCU_LIGHT_TID_1", 6138, "RIO Indicator Lights","RIO HCU TID CURSOR  Light (red)")
defineIndicatorLightMulti2("RIO_HCU_LIGHT_TID_2", 6138, "RIO Indicator Lights","RIO HCU TID CURSOR  Light (green)")

-- Gauges PLT
defineFloat("PLT_RADARALTI_NEEDLE", 103, {0, 1}, "PLT Gauges", "PILOT Radar Altimeter Needle")
defineFloat("PLT_RADARALTI_FLAG", 2124, {0, 1}, "PLT Gauges", "PILOT Radar Altimeter OFF Flag")
defineFloat("PLT_RADARALTI_POINTER", 4154, {0, 1}, "PLT Gauges", "PILOT Radar Altimeter Pointer")
defineFloat("PLT_AIRSPEED_NEEDLE", 2129, {0, 1}, "PLT Gauges", "PILOT Airspeed Outer Needle")
defineFloat("PLT_AIRSPEED_INNER", 2128, {0, 1}, "PLT Gauges", "PILOT Airspeed Inner Needle")
defineFloat("PLT_AIRSPEED_POINTER1", 2125, {0, 1}, "PLT Gauges", "PILOT Airspeed Pointer 1")
defineFloat("PLT_AIRSPEED_POINTER2", 2126, {0, 1}, "PLT Gauges", "PILOT Airspeed Pointer 2")
defineFloat("PLT_ENGINE_RPM_L", 1057, {0, 1}, "PLT Gauges", "PILOT Engine RPM Left")
defineFloat("PLT_ENGINE_RPM_R", 1058, {0, 1}, "PLT Gauges", "PILOT Engine RPM Right")
defineFloat("PLT_ENGINE_TIT_L", 1059, {0, 1}, "PLT Gauges", "PILOT Engine TIT Left")
defineFloat("PLT_ENGINE_TIT_R", 1060, {0, 1}, "PLT Gauges", "PILOT Engine TIT Right")
defineFloat("PLT_ENGINE_FF_L", 1061, {0, 1}, "PLT Gauges", "PILOT Engine FF Left")
defineFloat("PLT_ENGINE_FF_R", 1062, {0, 1}, "PLT Gauges", "PILOT Engine FF Right")
defineFloat("PLT_ENGINE_OIL_PRESS_L", 1066, {0, 1}, "PLT Gauges", "PILOT Engine Oil Pressure Left")
defineFloat("PLT_ENGINE_OIL_PRESS_R", 1065, {0, 1}, "PLT Gauges", "PILOT Engine Oil Pressure Right")
defineFloat("PLT_ENGINE_NOZZLE_L", 1068, {0, 1}, "PLT Gauges", "PILOT Engine Nozzle Left")
defineFloat("PLT_ENGINE_NOZZLE_R", 1067, {0, 1}, "PLT Gauges", "PILOT Engine Nozzle Right")       
defineFloat("PLT_CLOCK_H", 1096, {0, 1}, "PLT Gauges", "PILOT Clock Hours")
defineFloat("PLT_CLOCK_M", 1097, {0, 1}, "PLT Gauges", "PILOT Clock Minutes") 
defineFloat("PLT_CLOCK_TS", 1098, {0, 1}, "PLT Gauges", "PILOT Clock Timer Seconds") 
defineFloat("PLT_CLOCK_T", 1099, {0, 1}, "PLT Gauges", "PILOT Clock Timer") 
defineFloat("PLT_CLOCK_TM", 2000, {0, 1}, "PLT Gauges", "PILOT Clock Timer Minutes")   
defineFloat("PLT_SWEEP_MIN", 2047, {0, 1}, "PLT Gauges", "PILOT Wing Sweep Minimum Index") 
defineFloat("PLT_SWEEP_COM", 2001, {0, 1}, "PLT Gauges", "PILOT Wing Sweep Commanded") 
defineFloat("PLT_SWEEP_POS", 2002, {0, 1}, "PLT Gauges", "PILOT Wing Sweep Position")
defineFloat("PLT_SWEEP_FLAG_OFF", 15091, {0, 1}, "PLT Gauges", "PILOT Wing Sweep OFF Flag")
defineFloat("PLT_SWEEP_FLAG_AUTO", 15092, {0, 1}, "PLT Gauges", "PILOT Wing Sweep AUTO Flag") 
defineFloat("PLT_SWEEP_FLAG_MAN", 15093, {0, 1}, "PLT Gauges", "PILOT Wing Sweep MAN Flag") 
defineFloat("PLT_SWEEP_FLAG_EMER", 15094, {0, 1}, "PLT Gauges", "PILOT Wing Sweep EMER Flag") 
defineFloat("PLT_SWEEP_FLAG_OVER", 15095, {0, 1}, "PLT Gauges", "PILOT Wing Sweep OVER Flag") 
defineFloat("PLT_AOA_UNITS", 2003, {0, 1}, "PLT Gauges", "PILOT AOA Unit Slider")
defineFloat("PLT_AOA_UNITS_OFF", 16004, {0, 1}, "PLT Gauges", "PILOT AOA Unit OFF Flag")
defineFloat("PLT_ALTIMETER_NEEDLE", 104, {0, 1}, "PLT Gauges", "PILOT Altimeter Needle Barometric")
defineFloat("PLT_VSI_NEEDLE", 106, {-1, 1}, "PLT Gauges", "PILOT Vertical Velocity Indicator Needle")
defineFloat("PLT_COMP_SYNC_NEEDLE", 412, {-1, 1}, "PLT Gauges", "PILOT Compass Sync Indicator Needle")	--(COMP Panel)
defineFloat("PLT_COMP_DIAL", 1026, {0, 1}, "PLT Gauges", "PILOT Compass Dial")	--(COMP Panel)
defineFloat("PLT_ACCEL_METER_Needle", 110, {-1, 1}, "PLT Gauges", "PILOT Accelerometer Needle")
defineFloat("PLT_ALT_METER_10000", 112, {0, 1}, "PLT Gauges", "PILOT Altimeter 10000")
defineFloat("PLT_ALT_METER_1000", 262, {0, 1}, "PLT Gauges", "PILOT Altimeter 1000")
defineFloat("PLT_ALT_METER_100", 300, {0, 1}, "PLT Gauges", "PILOT Altimeter 100")
defineFloat("PLT_ALT_METER_SMALL_1", 301, {0, 1}, "PLT Gauges", "PILOT Altimeter HG 1000")
defineFloat("PLT_ALT_METER_SMALL_2", 302, {0, 1}, "PLT Gauges", "PILOT Altimeter 100")
defineFloat("PLT_ALT_METER_SMALL_3", 303, {0, 1}, "PLT Gauges", "PILOT Altimeter 10")
defineFloat("PLT_ALT_METER_SMALL_4", 304, {0, 1}, "PLT Gauges", "PILOT Altimeter 1")
defineFloat("PLT_ALT_METER_STBY", 305, {0, 1}, "PLT Gauges", "PILOT Altimeter Standby Flag")
defineFloat("PLT_HYD_PRESS_COMB", 1064, {0, 1}, "PLT Gauges", "PILOT Combined Hydraulic System Pressure Gauge")
defineFloat("PLT_HYD_PRESS_FLY", 1063, {0, 1}, "PLT Gauges", "PILOT Flight Hydraulic System Pressure Gauge")
defineFloat("PLT_HYD_SPOIL_FLAG", 1023, {0, 1}, "PLT Gauges", "PILOT Hydraulic Spoiler Flag")
defineFloat("PLT_HYD_EMERG_HI_FLAG", 1024, {0, 1}, "PLT Gauges", "PILOT Hydraulic Emergency HI Flag")
defineFloat("PLT_HYD_EMERG_LOW_FLAG", 1025, {0, 1}, "PLT Gauges", "PILOT Hydraulic Emergency LOW Flag")
defineFloat("PLT_GUN_ELEVATION_PLUSMINUS", 2273, {0, 1}, "PLT Gauges", "PILOT Gun Elevation Plus / Minus")
defineFloat("PLT_ACCEL_METER_NEEDLE2", 15076, {-1, 1}, "PLT Gauges", "PILOT Accelerometer Needle 2")
defineFloat("PLT_ACCEL_METER_NEEDLE3", 15077, {-1, 1}, "PLT Gauges", "PILOT Accelerometer Needle 3")
defineFloat("PLT_HSD_BIT_INDICATOR", 15079, {0, 1}, "PLT Gauges", "PILOT HSD BIT Indicator Flag")
defineFloat("PLT_FUEL_AFT_L", 1054, {0, 1}, "PLT Gauges", "PILOT Fuel AFT & L")
defineFloat("PLT_FUEL_FWD_R", 1055, {0, 1}, "PLT Gauges", "PILOT Fuel FWD & R")
defineFloat("PLT_FUEL_LEFT_1K", 6000, {0, 1}, "PLT Gauges", "PILOT Fuel Left 1000")
defineFloat("PLT_FUEL_LEFT_100", 6001, {0, 1}, "PLT Gauges", "PILOT Fuel Left 100")
defineFloat("PLT_FUEL_LEFT_10", 6002, {0, 1}, "PLT Gauges", "PILOT Fuel Left 10")
defineFloat("PLT_FUEL_LEFT_1", 6003, {0, 1}, "PLT Gauges", "PILOT Fuel Left 1")
local function getPLTFuelLeft()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(6000)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(6001)*10)
	if digit2 == nil then digit2 = "0" end
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(6002)*10)
	if digit3 == nil then digit3 = "0" end
    local digit4 = string.format("%.0f", GetDevice(0):get_argument_value(6003)*10)
	if digit4 == nil then digit4 = "0" end
    return tonumber(digit1 .. digit2 .. digit3 .. digit4)
end
defineIntegerFromGetter("PLT_FUEL_LEFT_DISP", getPLTFuelLeft, 2000, "PLT Gauges", "PILOT Fuel Left Display")

defineFloat("PLT_FUEL_RIGHT_1K", 6004, {0, 1}, "PLT Gauges", "PILOT Fuel Right 1000")
defineFloat("PLT_FUEL_RIGHT_100", 6005, {0, 1}, "PLT Gauges", "PILOT Fuel Right 100")
defineFloat("PLT_FUEL_RIGHT_10", 6006, {0, 1}, "PLT Gauges", "PILOT Fuel Right 10")
defineFloat("PLT_FUEL_RIGHT_1", 6007, {0, 1}, "PLT Gauges", "PILOT Fuel Right 1")
local function getPLTFuelRight()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(6004)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(6005)*10)
	if digit2 == nil then digit2 = "0" end
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(6006)*10)
	if digit3 == nil then digit3 = "0" end
    local digit4 = string.format("%.0f", GetDevice(0):get_argument_value(6007)*10)
	if digit4 == nil then digit4 = "0" end
    return tonumber(digit1 .. digit2 .. digit3 .. digit4)
end
defineIntegerFromGetter("PLT_FUEL_RIGHT_DISP", getPLTFuelRight, 2000, "PLT Gauges", "PILOT Fuel Right Display")

defineFloat("PLT_FUEL_TOTAL_10K", 6010, {0, 1}, "PLT Gauges", "PILOT Fuel Total 10000")
defineFloat("PLT_FUEL_TOTAL_1K", 6011, {0, 1}, "PLT Gauges", "PILOT Fuel Total 1000")
defineFloat("PLT_FUEL_TOTAL_100", 6012, {0, 1}, "PLT Gauges", "PILOT Fuel Total 100")
defineFloat("PLT_FUEL_TOTAL_10", 6013, {0, 1}, "PLT Gauges", "PILOT Fuel Total 10")
defineFloat("PLT_FUEL_TOTAL_1", 6014, {0, 1}, "PLT Gauges", "PILOT Fuel Total 1")
local function getPLTFuelTotal()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(6010)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(6011)*10)
	if digit2 == nil then digit2 = "0" end
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(6012)*10)
	if digit3 == nil then digit3 = "0" end
    local digit4 = string.format("%.0f", GetDevice(0):get_argument_value(6013)*10)
	if digit4 == nil then digit4 = "0" end
	local digit5 = string.format("%.0f", GetDevice(0):get_argument_value(6014)*10)
	if digit5 == nil then digit5 = "0" end
    return tonumber(digit1 .. digit2 .. digit3 .. digit4 .. digit5)
end
defineIntegerFromGetter("PLT_FUEL_TOTAL_DISP", getPLTFuelTotal, 25000, "PLT Gauges", "PILOT Fuel Total Display")

defineFloat("PLT_FUEL_BINGO_10K", 6020, {0, 1}, "PLT Gauges", "PILOT Fuel Bingo 10000")
defineFloat("PLT_FUEL_BINGO_1K", 6021, {0, 1}, "PLT Gauges", "PILOT Fuel Bingo 1000")
defineFloat("PLT_FUEL_BINGO_100", 6022, {0, 1}, "PLT Gauges", "PILOT Fuel Bingo 100")
defineFloat("PLT_FUEL_BINGO_10", 6023, {0, 1}, "PLT Gauges", "PILOT Fuel Bingo 10")
defineFloat("PLT_FUEL_BINGO_1", 6024, {0, 1}, "PLT Gauges", "PILOT Fuel Bingo 1")
defineFloat("PLT_AHRS_LAT_DIAL", 1026, {0, 1}, "PLT Gauges", "PILOT Compass LAT Correction Dial")  --(COMP Panel)
defineFloat("PLT_ACM_TURN_IND", 6501, {-1, 1}, "PLT Gauges", "PILOT ACM Turn Indicator")
defineFloat("PLT_ACM_SLIP_BALL", 6500, {-1, 1}, "PLT Gauges", "PILOT ACM Slip Ball")
defineFloat("PLT_COMPBALL_HORIZONTAL", 6502, {0, 1}, "PLT Gauges", "PILOT Compassball Horizontal")
defineFloat("PLT_COMPBALL_VERTICAL", 6503, {-1, 1}, "PLT Gauges", "PILOT Compassball Vertical")
defineFloat("PLT_GEAR_NOSE_OFF", 8300, {0, 1}, "PLT Gauges", "PILOT Nose Gear OFF Flag")
defineFloat("PLT_GEAR_NOSE_IND", 8301, {0, 1}, "PLT Gauges", "PILOT Nose Gear Indicator")
defineFloat("PLT_GEAR_L_OFF", 8303, {0, 1}, "PLT Gauges", "PILOT Left Gear OFF Flag")
defineFloat("PLT_GEAR_L_IND", 8302, {0, 1}, "PLT Gauges", "PILOT Left Gear Indicator")
defineFloat("PLT_GEAR_R_OFF", 8304, {0, 1}, "PLT Gauges", "PILOT Right Gear OFF Flag")
defineFloat("PLT_GEAR_R_IND", 8305, {0, 1}, "PLT Gauges", "PILOT Right Gear Indicator")
defineFloat("PLT_SPDBRK_OFF", 8306, {0, 1}, "PLT Gauges", "PILOT Speedbrake OFF Flag")
defineFloat("PLT_SPDBRK_IND", 8307, {0, 1}, "PLT Gauges", "PILOT Speedbrake Indicator")
defineFloat("PLT_SPDBRK_FULL", 8308, {0, 1}, "PLT Gauges", "PILOT Speedbrake Full Indicator")
defineFloat("PLT_SLATS_OFF", 8309, {0, 1}, "PLT Gauges", "PILOT Slats OFF Flag")
defineFloat("PLT_SLATS_IND", 8310, {0, 1}, "PLT Gauges", "PILOT Slats Indicator")	
defineFloat("PLT_FLAPS_IND", 8311, {0, 1}, "PLT Gauges", "PILOT Flaps Indicator")
defineFloat("PLT_SPOILER_DN_OL", 8315, {0, 1}, "PLT Gauges", "PILOT Spoiler DN Outer Left")
defineFloat("PLT_SPOILER_DN_IL", 8316, {0, 1}, "PLT Gauges", "PILOT Spoiler DN Inner Left")
defineFloat("PLT_SPOILER_DN_OR", 8318, {0, 1}, "PLT Gauges", "PILOT Spoiler DN Outer Right")
defineFloat("PLT_SPOILER_DN_IR", 8317, {0, 1}, "PLT Gauges", "PILOT Spoiler DN Outer Right")
defineFloat("PLT_SPOILER_IND_OL", 8319, {0, 1}, "PLT Gauges", "PILOT Spoiler Indicator Outer Left")
defineFloat("PLT_SPOILER_IND_IL", 8320, {0, 1}, "PLT Gauges", "PILOT Spoiler Indicator Inner Left")
defineFloat("PLT_SPOILER_IND_OR", 8322, {0, 1}, "PLT Gauges", "PILOT Spoiler Indicator Outer Right")
defineFloat("PLT_SPOILER_IND_IR", 8321, {0, 1}, "PLT Gauges", "PILOT Spoiler Indicator Inner Right")
defineFloat("PLT_STABI_IND_L", 1090, {0, 1}, "PLT Gauges", "PILOT Stabilisator Indicator Left")
defineFloat("PLT_STABI_IND_R", 1091, {0, 1}, "PLT Gauges", "PILOT Stabilisator Indicator Right")
defineFloat("PLT_RUDDER_IND_L", 1092, {0, 1}, "PLT Gauges", "PILOT Rudder Indicator Left")
defineFloat("PLT_RUDDER_IND_R", 1093, {0, 1}, "PLT Gauges", "PILOT Rudder Indicator Right")
defineFloat("PLT_COMPBALL_ROLL", 15097, {-1, 1}, "PLT Gauges", "PILOT Compassball Roll")
defineFloat("PLT_BRAKE_PRESS_L", 9260, {0, 1}, "PLT Gauges", "PILOT Brake Pressure Left")
defineFloat("PLT_BRAKE_PRESS_R", 9260, {0, 1}, "PLT Gauges", "PILOT Brake Pressure Right")
defineFloat("PLT_STDBYAI_OFF_FLAG", 19100, {0, 1}, "PLT Gauges", "PILOT Standby ADI Off Flag")
defineFloat("PLT_COMP_RING", 19109, {0, 1}, "PLT Gauges", "PILOT Compass Ring")
defineFloat("PLT_COMP_FLAG", 19105, {0, 1}, "PLT Gauges", "PILOT Compass OFF Flag")
defineFloat("PLT_COMP_NEEDLE_TACAN", 699, {0, 1}, "PLT Gauges", "PILOT Compass TACAN Needle")
defineFloat("PLT_COMP_NEEDLE_ADF", 700, {0, 1}, "PLT Gauges", "PILOT Compass ADF Needle")
defineFloat("PLT_COMP_ROLLER1", 702, {0, 1}, "PLT Gauges", "PILOT Compass Roller 1")
defineFloat("PLT_COMP_ROLLER2", 703, {0, 1}, "PLT Gauges", "PILOT Compass Roller 2")
defineFloat("PLT_COMP_ROLLER3", 704, {0, 1}, "PLT Gauges", "PILOT Compass Roller 3")
defineFloat("PLT_CABIN_PRESS", 935, {0, 1}, "PLT Gauges", "PILOT Cabin Pressure Needle")
defineFloat("PLT_LIQU_OXY_FLAG", 2999, {0, 1}, "PLT Gauges", "PILOT Liquid Oxygen OFF Flag")
defineFloat("PLT_STDBYAI_PITCH", 3001, {-1, 1}, "PLT Gauges", "PILOT Standby ADI Pitch")
defineFloat("PLT_STDBYAI_ROLL", 3002, {-1, 1}, "PLT Gauges", "PILOT Standby ADI Roll")
defineFloat("PLT_AMMO_100", 4060, {0, 1}, "PLT Gauges", "PILOT Ammo 100")
defineFloat("PLT_AMMO_10", 4061, {0, 1}, "PLT Gauges", "PILOT Ammo 10")
defineFloat("PLT_AMMO_1", 4062, {0, 1}, "PLT Gauges", "PILOT Ammo 1")
local function getAmmo()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(4060)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(4061)*10)
	if digit2 == nil then digit2 = "0" end
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(4062)*10)
	if digit3 == nil then digit3 = "0" end
    return tonumber(digit1 .. digit2 .. digit3)
end
defineIntegerFromGetter("PLT_AMMO_DISP", getAmmo, 690, "PLT Gauges", "PILOT Ammo Display")

defineFloat("PLT_GUN_LEAD_100", 2270, {0, 1}, "PLT Gauges", "PILOT Gun Lead 100")
defineFloat("PLT_GUN_LEAD_10", 2271, {0, 1}, "PLT Gauges", "PILOT Gun Lead 10")
defineFloat("PLT_GUN_LEAD_1", 2272, {0, 1}, "PLT Gauges", "PILOT Gun Lead 1")
local function getGunLead()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(2270)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(2271)*10)
	if digit2 == nil then digit2 = "0" end
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(2272)*10)
	if digit3 == nil then digit3 = "0" end
    return tonumber(digit1 .. digit2 .. digit3)
end
defineIntegerFromGetter("PLT_GUN_LEAD_DISP", getGunLead, 187, "PLT Gauges", "PILOT Gun Lead Display")
defineFloat("PLT_WEAPON_STORE_1A", 9221, {0, 1}, "PLT Gauges", "PILOT Weapon Store 1A")
defineFloat("PLT_WEAPON_STORE_1B", 9222, {0, 1}, "PLT Gauges", "PILOT Weapon Store 1B")
defineFloat("PLT_WEAPON_STORE_3", 9223, {0, 1}, "PLT Gauges", "PILOT Weapon Store 3")
defineFloat("PLT_WEAPON_STORE_4", 9224, {0, 1}, "PLT Gauges", "PILOT Weapon Store 4")
defineFloat("PLT_WEAPON_STORE_5", 9225, {0, 1}, "PLT Gauges", "PILOT Weapon Store 5")
defineFloat("PLT_WEAPON_STORE_6", 9226, {0, 1}, "PLT Gauges", "PILOT Weapon Store 6")
defineFloat("PLT_WEAPON_STORE_8B", 9227, {0, 1}, "PLT Gauges", "PILOT Weapon Store 8B")
defineFloat("PLT_WEAPON_STORE_8A", 9228, {0, 1}, "PLT Gauges", "PILOT Weapon Store 8A")

-- Gauges RIO
defineFloat("RIO_AIRSPEED_NEEDLE", 250, {0, 1}, "RIO Gauges", "RIO Airspeed Outer Needle")
defineFloat("RIO_AIRSPEED_INNER", 251, {0, 1}, "RIO Gauges", "RIO Airspeed Inner Needle")
defineFloat("RIO_AIRSPEED_POINTER1", 252, {0, 1}, "RIO Gauges", "RIO Airspeed Pointer 1")
defineFloat("RIO_AIRSPEED_POINTER2", 253, {0, 1}, "RIO Gauges", "RIO Airspeed Pointer 2")
defineFloat("RIO_CMDS_CHAFF_COUNT_10", 392, {0, 1}, "RIO Gauges", "RIO CMDS Chaff Counter 10")
defineFloat("RIO_CMDS_CHAFF_COUNT_1", 393, {0, 1}, "RIO Gauges", "RIO CMDS Chaff Counter 1")		
local function getChaffCount()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(392)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(393)*10)
	if digit2 == nil then digit2 = "0" end
    return tonumber(digit1 .. digit2)
end
defineIntegerFromGetter("RIO_CMDS_CHAFFCNT_DISPLAY", getChaffCount, 99, "CMDS", "RIO CMDS Chaff Counter Display")	

defineFloat("RIO_CMDS_FLARE_COUNT_10", 394, {0, 1}, "RIO Gauges", "RIO CMDS Flare Counter 10")
defineFloat("RIO_CMDS_FLARE_COUNT_1", 395, {0, 1}, "RIO Gauges", "RIO CMDS Flare Counter 1")		
local function getFlareCount()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(394)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(395)*10)
	if digit2 == nil then digit2 = "0" end
    return tonumber(digit1 .. digit2)
end
defineIntegerFromGetter("RIO_CMDS_FLARECNT_DISPLAY", getFlareCount, 99, "CMDS", "RIO CMDS Flare Counter Display")

defineFloat("RIO_CMDS_JAMM_COUNT_10", 396, {0, 1}, "RIO Gauges", "RIO CMDS Jammer Counter 10")
defineFloat("RIO_CMDS_JAMM_COUNT_1", 397, {0, 1}, "RIO Gauges", "RIO CMDS Jammer Counter 1")		
local function getJammerCount()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(396)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(397)*10)
	if digit2 == nil then digit2 = "0" end
    return tonumber(digit1 .. digit2)
end
defineIntegerFromGetter("RIO_CMDS_JAMMCNT_DISPLAY", getJammerCount, 99, "CMDS", "RIO CMDS Jammer Counter Display")

defineFloat("RIO_TACAN_COMAND_IND", 414, {0, 1}, "RIO Gauges", "RIO TACAN Command Indicator")
defineFloat("RIO_ELEVATION_RADAR", 2121, {-1, 1}, "RIO Gauges", "RIO Radar Elevation Arrow")
defineFloat("RIO_ELEVATION_TCS", 2122, {-1, 1}, "RIO Gauges", "RIO TCS Elevation Arrow")
defineFloat("RIO_CLOCK_H", 4150, {0, 1}, "RIO Gauges", "RIO Clock Hours")
defineFloat("RIO_CLOCK_M", 4151, {0, 1}, "RIO Gauges", "RIO Clock Minutes") 
defineFloat("RIO_CLOCK_TS", 4152, {0, 1}, "RIO Gauges", "RIO Clock Timer Seconds") 
defineFloat("RIO_CLOCK_T", 4153, {0, 1}, "RIO Gauges", "RIO Clock Timer") 
defineFloat("RIO_ALTIMETER_NEEDLE", 20104, {0, 1}, "RIO Gauges", "RIO Altimeter Needle Barometric")
defineFloat("RIO_FUEL_TOTAL_10K", 2117, {0, 1}, "RIO Gauges", "RIO Fuel Total 10000")
defineFloat("RIO_FUEL_TOTAL_1K", 2118, {0, 1}, "RIO Gauges", "RIO Fuel Total 1000")
defineFloat("RIO_FUEL_TOTAL_100", 2119, {0, 1}, "RIO Gauges", "RIO Fuel Total 100")
defineFloat("RIO_FUEL_TOTAL_10", 2120, {0, 1}, "RIO Gauges", "RIO Fuel Total 10")
defineFloat("RIO_FUEL_TOTAL_1", 2135, {0, 1}, "RIO Gauges", "RIO Fuel Total 1")
local function getRIOFuelTotal()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(2117)*10)
	if digit1 == nil then digit1 = "0" end
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(2118)*10)
	if digit2 == nil then digit2 = "0" end
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(2119)*10)
	if digit3 == nil then digit3 = "0" end
    local digit4 = string.format("%.0f", GetDevice(0):get_argument_value(2120)*10)
	if digit4 == nil then digit4 = "0" end
	local digit5 = string.format("%.0f", GetDevice(0):get_argument_value(2135)*10)
	if digit5 == nil then digit5 = "0" end
    return tonumber(digit1 .. digit2 .. digit3 .. digit4 .. digit5)
end
defineIntegerFromGetter("RIO_FUEL_TOTAL_DISP", getRIOFuelTotal, 25000, "RIO Gauges", "RIO Fuel Total Display")

defineFloat("RIO_STDBYAI_OFF_FLAG", 19900, {0, 1}, "RIO Gauges", "RIO Standby ADI Off Flag")
defineFloat("RIO_STDBYAI_PITCH", 3333, {-1, 1}, "RIO Gauges", "RIO Standby ADI Pitch")
defineFloat("RIO_STDBYAI_ROLL", 19901, {-1, 1}, "RIO Gauges", "RIO Standby ADI Roll")
defineFloat("RIO_ALT_METER_10000", 20112, {0, 1}, "RIO Gauges", "RIO Altimeter 10000")
defineFloat("RIO_ALT_METER_1000", 20262, {0, 1}, "RIO Gauges", "RIO Altimeter 1000")
defineFloat("RIO_ALT_METER_100", 20300, {0, 1}, "RIO Gauges", "RIO Altimeter 100")
defineFloat("RIO_ALT_METER_SMALL_1", 20301, {0, 1}, "RIO Gauges", "RIO Altimeter HG 1000")
defineFloat("RIO_ALT_METER_SMALL_2", 20302, {0, 1}, "RIO Gauges", "RIO Altimeter 100")
defineFloat("RIO_ALT_METER_SMALL_3", 20303, {0, 1}, "RIO Gauges", "RIO Altimeter 10")
defineFloat("RIO_ALT_METER_SMALL_4", 20304, {0, 1}, "RIO Gauges", "RIO Altimeter 1")
defineFloat("RIO_ALT_METER_STBY", 20305, {0, 1}, "RIO Gauges", "RIO Altimeter Standby Flag")
defineFloat("RIO_COMP_RING", 29109, {0, 1}, "RIO Gauges", "RIO Compass Ring")
defineFloat("RIO_COMP_FLAG", 29105, {0, 1}, "RIO Gauges", "RIO Compass OFF Flag")
defineFloat("RIO_COMP_NEEDLE_TACAN", 20699, {0, 1}, "RIO Gauges", "RIO Compass TACAN Needle")
defineFloat("RIO_COMP_NEEDLE_ADF", 20700, {0, 1}, "RIO Gauges", "RIO Compass ADF Needle")
defineFloat("RIO_COMP_ROLLER1", 705, {0, 1}, "RIO Gauges", "RIO Compass Roller 1")
defineFloat("RIO_COMP_ROLLER2", 706, {0, 1}, "RIO Gauges", "RIO Compass Roller 2")
defineFloat("RIO_COMP_ROLLER3", 707, {0, 1}, "RIO Gauges", "RIO Compass Roller 3")
defineFloat("RIO_DDD_RANGE_ROLLER", 6100, {0, 1}, "RIO Gauges", "RIO DDD Range Roller")
defineFloat("RIO_TID_SRC_ROLLER", 6101, {0, 1}, "RIO Gauges", "RIO TID Readout SRC Roller")
defineFloat("RIO_DDD_RADAR_MODE", 6102, {0, 1}, "RIO Gauges", "RIO DDD Radar Mode Gauge")
defineFloat("RIO_TID_STEER_ROLLER", 6103, {0, 1}, "RIO Gauges", "RIO TID Steering Roller")
defineFloat("RIO_RECORD_MIN_HI", 11600, {0, 1}, "RIO Gauges", "RIO Record Minutes HI")
defineFloat("RIO_RECORD_MIN_MED", 11601, {0, 1}, "RIO Gauges", "RIO Record Minutes MED")
defineFloat("RIO_RECORD_MIN_LOW", 11602, {0, 1}, "RIO Gauges", "RIO Record Minutes LOW")

defineFloat("CANOPY_POS", 403, {0, 1}, "Cockpit", "Canopy Position")

defineString("PLT_UHF_REMOTE_DISP", function() return get_radio_remote_display(9, 15004) or "0000000" end, 7, "UHF 1", "PILOT UHF ARC-159 Radio Remote Display")  
defineString("RIO_UHF_REMOTE_DISP", function() return get_radio_remote_display(10,405) or "0000000" end, 7, "UHF 1", "RIO UHF ARC-159 Radio Remote Display")  
defineString("PLT_VUHF_REMOTE_DISP", function() return get_radio_remote_display(13,15003) or "0000000" end, 7, "VUHF", "PILOT VHF/UHF ARC-182 Radio Remote Display")	
defineString("PLT_HUD_MODE", getHUD_Mode, 1, "Display", "PILOT HUD Mode (string)")  
defineString("PLT_STEER_MODE", getSTEER_Mode, 1, "Display", "PILOT STEER Mode (string)")
defineString("PLT_AIR_SOURCE_MODE", getAIRSOURCE_Mode, 1, "Display", "PILOT Air Source Mode (string)")
defineString("HSD_TACAN_RANGE_S", function() return HSD_TACAN_RANGE or "00000" end, 5, "HSD", "HSD TACAN Range Display (string)")
defineString("HSD_TACAN_CRS_S", function() return HSD_TACAN_CRS  or "000" end, 3, "HSD", "HSD TACAN Course Display (string)")
defineString("HSD_MAN_CRS_S", function() return HSD_MAN_CRS  or "000" end, 3, "HSD", "HSD MAN Course Display (string)")
defineIntegerFromGetter("HSD_TACAN_CRS", function() return HSD_TACAN_CRSint  end, 360, "HSD", "HSD TACAN Course Display")
defineIntegerFromGetter("HSD_MAN_CRS", function() return HSD_MAN_CRSint  end, 360, "HSD", "HSD MAN Course Display")

defineToggleSwitch("PLT_HUDCAM", 12, 3756, 3490, "Cockpit Mechanics", "PILOT Hide Guncam")
definePotentiometer("RIO_TCS_TRIM_AZI", 38, 3750, 85, {0, 1}, "TCS", "RIO TCS Trim Azimuth")
definePotentiometer("RIO_TCS_TRIM_ELE", 38, 3751, 86, {0, 1}, "TCS", "RIO TCS Trim Elevation")

-- Fire System
definePushButton("PLT_FIRE_EX_BOTTLE_L", 67, 3059, 15083, "Fire System", "PILOT Fire Ext Bottle - Left")
definePushButton("PLT_FIRE_EX_BOTTLE_R", 67, 3060, 15082, "Fire System", "PILOT Fire Ext Bottle - Right")

defineIndicatorLight("RIO_MCB_R_LIGHT", 13130, "RIO F-14A Indicator Lights","RIO MCB Panel Right Test Light (red)(F-14A)")
defineIndicatorLight("RIO_MCB_L_LIGHT", 13131, "RIO F-14A Indicator Lights","RIO MCB Panel Left Test Light (red)(F-14A)")
defineToggleSwitch("RIO_MCOMP_BYPASS", 20, 3761, 13132, "F-14A Engine", "RIO Mid Compression Bypass Test (F-14A)")

defineToggleSwitch("PLT_GEAR_DN_LK_OVER", 18, 3017, 633, "Gear", "PILOT Gear Down Lock Override")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(402)*65535)
end, 65535, "External Aircraft Model", "Bottom Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(401)*65535)
end, 65535, "External Aircraft Model", "Bottom Left Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_TOP", function()
	return math.floor(LoGetAircraftDrawArgumentValue(400)*65535)
end, 65535, "External Aircraft Model", "Top Speed Brake")

defineIntegerFromGetter("EXT_REFUEL_PROBE", function()
	return math.floor(LoGetAircraftDrawArgumentValue(22)*65535)
end, 65535, "External Aircraft Model", "Fuel Probe")

defineIntegerFromGetter("EXT_REFUEL_PROBE_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(610) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Refuel Probe Light (red)")

defineIntegerFromGetter("EXT_POSITION_LIGHTS_WINGS", function()
	if LoGetAircraftDrawArgumentValue(611) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights Wings (red/green)")

defineIntegerFromGetter("EXT_POSITION_LIGHTS_BODY", function()
	if LoGetAircraftDrawArgumentValue(612) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights Body (red/green)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(613) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Position Light (white)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_CHIN", function()
	if LoGetAircraftDrawArgumentValue(614) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Chinpod Position Light (red)")

defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
end, 65535, "External Aircraft Model", "Formation Lights (yellow green)")

defineIntegerFromGetter("EXT_ANTI_COL", function()
	if LoGetAircraftDrawArgumentValue(620) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Anticollision Lights")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

defineIntegerFromGetter("EXT_YAW_STRING_LR", function()
	return math.floor(LoGetAircraftDrawArgumentValue(2500)*65535)
end, 65535, "External Aircraft Model", "YAW String Left/Right")
defineIntegerFromGetter("EXT_YAW_STRING_UD", function()
	return math.floor(LoGetAircraftDrawArgumentValue(2501)*65535)
end, 65535, "External Aircraft Model", "YAW String Up/Down")

defineIntegerFromGetter("EXT_POSITION_LIGHTS_BODY_D", function()
	return math.floor(LoGetAircraftDrawArgumentValue(612)*65535)
end, 65535, "External Aircraft Model", "Position Lights Body Dimmer (red/green)")

defineIntegerFromGetter("EXT_POSITION_LIGHTS_WINGS_D", function()
	return math.floor(LoGetAircraftDrawArgumentValue(611)*65535)
end, 65535, "External Aircraft Model", "Position Lights Wings Dimmer (red/green)")
defineIntegerFromGetter("EXT_HOOK", function()
	return math.floor(LoGetAircraftDrawArgumentValue(1305)*65535)
end, 65535, "External Aircraft Model", "Hook")
defineIntegerFromGetter("EXT_WING_POS_L", function()
	return math.floor(LoGetAircraftDrawArgumentValue(404)*65535)
end, 65535, "External Aircraft Model", "Wing Position Left")
defineIntegerFromGetter("EXT_WING_POS_R", function()
	return math.floor(LoGetAircraftDrawArgumentValue(405)*65535)
end, 65535, "External Aircraft Model", "Wing Position Right")

defineFloat("INTERNAL_FLOOD_RED_L", 1800, {0, 1}, "Cockpit Lights", "Flood Lights red")
defineFloat("INTERNAL_FLOOD_WHT_L", 1803, {0, 1}, "Cockpit Lights", "Flood Lights white")
defineFloat("INTERNAL_PLT_PANEL_L", 1801, {1, 0}, "Cockpit Lights", "Panel Lights (red) inverted")
definePushButton("PLT_VDI_FILTER", 42, 3234, 0, "HUD", "PILOT VDI Filter") --miss arg
definePushButton("RIO_DDD_FILTER", 39, 3456, 0, "DDD", "RIO DDD Filter") --miss arg
defineFloat("PLT_EJECT_SEAT_SAVE", 2503, {0, 1}, "Cockpit", "PILOT Ejection Seat Safety")
defineFloat("RIO_EJECT_SEAT_SAVE", 2504, {0, 1}, "Cockpit", "RIO Ejection Seat Safety")
defineFloat("RIO_LANTIRN_PRESENT", 666, {0, 1}, "Cockpit", "RIO LANTIRN Present")
defineFloat("PLT_THROTTLE_POS_L", 753, {0, 1}, "Cockpit", "PILOT Left Throttle Position")
defineFloat("PLT_THROTTLE_POS_R", 752, {0, 1}, "Cockpit", "PILOT Right Throttle Position")
defineFloat("PLT_SWEEP_POS", 384, {0, 1}, "Cockpit", "PILOT Wing Sweep Handle Position")

BIOS.protocol.endModule()