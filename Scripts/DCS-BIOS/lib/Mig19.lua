BIOS.protocol.beginModule("MiG-19P", 0x1600)
BIOS.protocol.setExportModuleAircrafts({"MiG-19P"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

-- THROTTLE
defineRotary("ASP_TAAGET_DIS", 11, 3314, 314, "Throttle", "ASP-5 Target Distance Selector")
definePushButton("RSIU_TRANS", 17, 3315, 315, "Throttle", "RSIU-4V Transmit Button - Push to Transmit")
defineToggleSwitch("AIRBRAKE_SW", 4, 3316, 316, "Throttle", "Airbrake Switch")
definePushButton("AFTERBURN_DIS", 2, 3317, 317, "Throttle", "Mil-power Limit/Afterburner Disable")
definePushButton("AFTERBURN_EN", 2, 3318, 318, "Throttle", "Afterburner Enable")

--- Warning, Caution and IndicatorLights
defineIndicatorLight("L_GEAR_DOWN", 489, "Warning, Caution and IndicatorLights","Left Gear UP Lamp (red)")
defineIndicatorLight("N_GEAR_DOWN", 490, "Warning, Caution and IndicatorLights","Nose Gear UP Lamp (red)")
defineIndicatorLight("R_GEAR_DOWN", 491, "Warning, Caution and IndicatorLights","Right Gear UP Lamp (red)")
defineIndicatorLight("L_GEAR_DOWN", 492, "Warning, Caution and IndicatorLights","Left Gear DOWN Lamp (green)")
defineIndicatorLight("N_GEAR_DOWN", 493, "Warning, Caution and IndicatorLights","Nose Gear DOWN Lamp (green)")
defineIndicatorLight("R_GEAR_DOWN", 494, "Warning, Caution and IndicatorLights","Right Gear DOWN Lamp (green)")

BIOS.protocol.endModule()
