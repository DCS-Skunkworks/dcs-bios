BIOS.protocol.beginModule("Yak-52", 0x2000)
BIOS.protocol.setExportModuleAircrafts({"Yak-52"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFloat = BIOS.util.defineFloat

--Gauges
defineFloat("FRONT_ACCEL_MINUTE", 42, {-0.6, 0.9}, "Gauges", "Fore Accelerometer Minute")
defineFloat("FRONT_ACCEL_MIN", 44, {-0.6, 0.9}, "Gauges", "Fore Accelerometer Min")
defineFloat("FRONT_ACCEL_MAX", 43, {-0.6, 0.9}, "Gauges", "Fore Accelerometer Max")
defineFloat("REAR_ACCEL_MINUTE", 46, {-0.6, 0.9}, "Gauges", "Rear Accelerometer Minute")
defineFloat("REAR_ACCEL_MIN", 48, {-0.6, 0.9}, "Gauges", "Rear Accelerometer Min")
defineFloat("REAR_ACCEL_MAX", 47, {-0.6, 0.9}, "Gauges", "Rear Accelerometer Max")
defineFloat("FRONT_AIRSPEED", 109, {0.0, 0.5}, "Gauges", "Fore Airspeed Gauge")
defineFloat("REAR_AIRSPEED", 110, {0.0, 0.5}, "Gauges", "Rear Airspeed Gauge")
defineFloat("FRONT_ALT100", 111, {0.0, 1.0}, "Gauges", "Fore Altimeter 100")
defineFloat("FRONT_ALT1000", 112, {0.0, 1.0}, "Gauges", "Fore Altimeter 1000")
defineFloat("FRONT_ALT_PRESS", 113, {0.0, 1.0}, "Gauges", "Fore Altimeter Set Pressure")
defineFloat("REAR_ALT100", 115, {0.0, 1.0}, "Gauges", "Rear Altimeter 100")
defineFloat("REAR_ALT1000", 116, {0.0, 1.0}, "Gauges", "Rear Altimeter 1000")
defineFloat("REAR_ALT_PRESS", 117, {0.0, 1.0}, "Gauges", "Rear Altimeter Set Pressure")
defineFloat("FRONT_VARIOMETER", 161, {-1.0, 1.0}, "Gauges", "Fore Variometer Gauge")
defineFloat("FRONT_TURN", 162, {-1.0, 1.0}, "Gauges", "Fore Turn Gauge")
defineFloat("FRONT_SLIP", 163, {-1.0, 1.0}, "Gauges", "Fore Sideslip Gauge")
defineFloat("REAR_VARIOMETER", 164, {-1.0, 1.0}, "Gauges", "Rear Variometer Gauge")
defineFloat("REAR_TURN", 165, {-1.0, 1.0}, "Gauges", "Rear Turn Gauge")
defineFloat("REAR_SLIP", 166, {-1.0, 1.0}, "Gauges", "Rear Sideslip Gauge")

BIOS.protocol.endModule()