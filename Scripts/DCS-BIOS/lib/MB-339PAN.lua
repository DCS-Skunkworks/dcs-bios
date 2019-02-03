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
--local defineString = BIOS.util.defineString
local defineFloat = BIOS.util.defineFloat

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

--ELECTRIC_SYSTEMS
defineToggleSwitch("BATTERY", 1, 315, 300,"Electric" , "BATTERY Power Switch")
defineToggleSwitch("GENERATOR1", 1, 10316, 301,"Electric" , "GENERATOR 1 Switch")
defineToggleSwitch("GENERATOR2", 1, 10317, 302,"Electric" , "GENERATOR 2 Switch")
defineToggleSwitch("EMERG_POWER", 1, 10318, 303,"Electric" , "AC Power Emer Switch")

--CONTROLS
defineToggleSwitch("FLIGHT_CONTR", 2, 10400, 232,"Controls" , "Flight Controls Lock/Unlock")
defineToggleSwitch("PARK_BRK", 2, 855, 263,"Controls" , "Parking Brake Handle")
definePushButton("START_ENG", 2, 12000, 239,"Controls" , "START ENGINE Button")

--GEAR
defineToggleSwitch("D_LOCK_OVER", 4, 10165, 379,"Gear" , "DOWN-LOCK OVERRIDE Switch")
defineToggleSwitch("GEAR_LEVER", 4, 68, 4,"Gear" , "GEAR Lever Up/Down")

--LIGHTS
defineToggleSwitch("NAV_L_FLASH", 6, 10168, 41,"Lights" , "NAV Light Flash/Steady Switch")
defineToggleSwitch("NAV_L_DIM", 6, 175, 40,"Lights" , "NAV Light BRT/DIM Switch")
defineToggleSwitch("STROBE_L", 6, 10170, 39,"Lights" , "BCN Strobo On/Off")
defineToggleSwitch("TAXI_L", 6, 328, 321,"Lights" , "TAXI Light Switch")
definePotentiometer("FORMATION_L", 6, 3014, 502, {0, 0.99}, "Lights", "FORMATION LIGHTS Knob")
definePotentiometer("INSTRUMENTS_L", 6, 10171, 503, {0, 1}, "Lights", "INSTRUMENTS LIGHTS Knob")
definePotentiometer("FLOOD_L", 6, 3016, 504, {0, 1}, "Lights", "FLOOD LIGHTS Knob")
definePotentiometer("CONSOLE_L", 6, 10172, 505, {0, 1}, "Lights", "CONSOLE LIGHTS Knob")

--CANOPY
definePushButton("SAVE_PIN_CANOPY", 7, 10162, 377,"Canopy" , "Seat Safety Pin To Canopy")
definePushButton("SAVE_PIN_SEAT", 7, 10163, 376,"Canopy" , "Seat Safety Pin To Seat")
defineToggleSwitch("PARTIAL_OPEN", 7, 10175, 183,"Canopy" , "Partial Opening Device")
defineToggleSwitch("CANOPY_L", 7, 71, 182,"Canopy" , "Canopy Lock/Unlock")

--HSI
defineRotary("HDG_SET", 11, 3003, 362, "HSI", "Heading Set Knob")
defineRotary("CRS_SET", 11, 3002, 353, "HSI", "Course Set Knob")

--ADI
defineRotary("CLOCK_WIND_ROTATRY", 12, 3001, 15, "ADI", "ADI Pitch Trim Knob")

--ALTIMETER
defineRotary("PRESS_ALT", 13, 3002, 241, "Altimeter", "Press Altimeter Knob")

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
 
--NAV
defineToggleSwitch("FLT_HDG", 23, 10184, 333,"NAV" , "FLT DIR HDG Button")
defineToggleSwitch("FLT_GS_ARM", 23, 10185, 334,"NAV" , "FLT DIR GS ARM Button")
defineToggleSwitch("FLT_STBY", 23, 10186, 335,"NAV" , "FLT DIR STBY Button")
defineToggleSwitch("FLT_RADIO_NAV", 23, 10187, 336,"NAV" , "FLT DIR RADIO NAV Button")
defineToggleSwitch("FLT_GS", 23, 10188, 337,"NAV" , "FLT DIR GS Button")
defineToggleSwitch("FLT_ALT_HOLD", 23, 10189, 338,"NAV" , "FLT DIR ALT HOLD Button")
defineToggleSwitch("GPS", 23, 10180, 345,"NAV" , "GPS On/Off")
defineToggleSwitch("TACAN", 23, 10181, 346,"NAV" , "TACAN On/Off")
defineToggleSwitch("VOR", 23, 10182, 347,"NAV" , "VOR On/Off")
defineToggleSwitch("RNAV", 23, 10183, 348,"NAV" , "RNAV On/Off")
defineToggleSwitch("NAV", 23, 3001, 384,"NAV" , "NAV On/Off")

--WEAPONS
defineToggleSwitch("MASTER_ARM", 26, 3014, 475,"Weapons" , "MASTER ARMAMENT Switch")

--FUEL SYSTEMS
defineTumb("FUEL_QUANT", 27, 3008, 257, 0.1, {0.0, 0.4}, nil, false,"Fuel Systems" , "Fuel Quantity Selector Knob")
definePushButton("FUEL_TEST", 27, 10411, 258,"Fuel Systems" , "Fuel Test Button")
defineToggleSwitch("FUEL_TRANSFER", 27, 10152, 249,"Fuel Systems" , "TIP/PYLON Fuel Transfer Switch")

--GAUGES
defineFloat("ENGINE_RPM", 16, {0.0, 1.0}, "Gauges", "Engine RPM")

--Indicator Lights
defineIndicatorLight("TACAN_LIGHT", 369, "Indicator Lights","TACAN Light")

BIOS.protocol.endModule()