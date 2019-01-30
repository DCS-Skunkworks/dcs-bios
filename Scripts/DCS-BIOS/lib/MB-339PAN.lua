BIOS.protocol.beginModule("MB-339PAN", 0x8200)
BIOS.protocol.setExportModuleAircrafts({"MB-339PAN"})

--For the mod visit: http://www.freccetricolorivirtuali.net/mod%20ftv.htm

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
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

--ELECTRIC_SYSTEMS
defineToggleSwitch("BATTERY", 1, 315, 300,"Electric" , "BATTERY Power Switch")
defineToggleSwitch("GENERATOR1", 1, 10316, 301,"Electric" , "GENERATOR 1 Switch")
defineToggleSwitch("GENERATOR2", 1, 10317, 302,"Electric" , "GENERATOR 2 Switch")
defineToggleSwitch("EMERG_POWER", 1, 10318, 303,"Electric" , "AC Power Emer Switch")

--ADI
defineRotary("CLOCK_WIND_ROTATRY", 12, 3001, 15, "ADI", "ADI Pitch Trim Knob")

--GUARD SWITCHES
defineToggleSwitch("BUS_RESET_SW", 14, 10150, 231,"Guard Switches" , "BUS RESET Switch")
defineToggleSwitch("BUS_RESET_GD", 14, 10100, 233,"Guard Switches" , "BUS RESET Guard")
defineToggleSwitch("FUEL_OFF_GD", 14, 10101, 237,"Guard Switches" , "Fuel SHUT-OFF Guard")
defineToggleSwitch("FUEL_OFF_SW", 14, 10151, 248,"Guard Switches" , "Fuel SHUT-OFF Switch")
defineToggleSwitch("AIL_SERVO_GD", 14, 10104, 235,"Guard Switches" , "AIL Servo Guard")
defineToggleSwitch("AIL_SERVO_SW", 14, 10156, 260,"Guard Switches" , "AIL Servo Switch")
defineToggleSwitch("GROUND_FIRE_SW", 14, 11004, 506,"Guard Switches" , "GROUND FIRE Switch")
defineToggleSwitch("GROUND_FIRE_GD", 14, 11001, 236,"Guard Switches" , "GROUND FIRE Guard")
defineToggleSwitch("CABIN_PRESS_GD", 14, 10105, 234,"Guard Switches" , "CABIN PRESS Guard")
defineToggleSwitch("CABIN_PRESS_SW", 14, 10157, 264,"Guard Switches" , "CABIN PRESS Switch")

--WARN
definePushButton("WARN_LIGHT_BT", 15, 10051, 304,"Warning" , "WARN LT TEST Button")
definePushButton("MASTER_CAUTION_RESET", 15, 10415, 209,"Warning" , "Master Caution Reset")

--SMOKES
defineToggleSwitch("SMK_MASTER", 17, 10330, 330,"Smokes" , "Smoke Master Switch")
defineToggleSwitch("SMK_WHITE", 17, 10331, 331,"Smokes" , "Smoke White Switch")
defineToggleSwitch("SMK_COLOR", 17, 10332, 332,"Smokes" , "Smoke Color Switch")

--SOUND_SYSTEM
defineToggleSwitch("WARN_SILENCE", 19, 10164, 382,"Sound System" , "WARNING SILENCE")
 
--FLT
defineToggleSwitch("FLT_HDG", 23, 10184, 333,"FLT" , "FLT DIR HDG Button")
defineToggleSwitch("FLT_GS_ARM", 23, 10185, 334,"FLT" , "FLT DIR GS ARM Button")
defineToggleSwitch("FLT_STBY", 23, 10186, 335,"FLT" , "FLT DIR STBY Button")
defineToggleSwitch("FLT_RADIO_NAV", 23, 10187, 336,"FLT" , "FLT DIR RADIO NAV Button")
defineToggleSwitch("FLT_GS", 23, 10188, 337,"FLT" , "FLT DIR GS Button")
defineToggleSwitch("FLT_ALT_HOLD", 23, 10189, 338,"FLT" , "FLT DIR ALT HOLD Button")
 
--WEAPONS
defineToggleSwitch("MASTER_ARM", 26, 3014, 475,"Weapons" , "MASTER ARMAMENT Switch")

--GAUGES
defineFloat("ENGINE_RPM", 16, {0.0, 1.0}, "Gauges", "Engine RPM")

BIOS.protocol.endModule()