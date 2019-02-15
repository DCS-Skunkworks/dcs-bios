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
local defineIndicatorLight = BIOS.util.defineIndicatorLight

-- Fore Pit
definePushButton("WBRAKES_LOCK", 2, 3028, 4,"Joystick" , "Wheel Brakes Lock")
defineToggleSwitch("SMOKE", 6, 3039, 190,"Joystick" , "Smoke Apparat")


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
defineFloat("FRONT_AH_BANK", 146, {1.0, -1.0}, "Gauges", "Fore Artificial Horizon Bank")
defineFloat("FRONT_AH_PITCH", 147, {1.0, -1.0}, "Gauges", "Fore Artificial Horizon Pitch")
defineFloat("FRONT_AH_SLIP", 148, {1.0, -1.0}, "Gauges", "Fore Artificial Horizon Sideslip")
defineFloat("REAR_AH_BANK", 152, {1.0, -1.0}, "Gauges", "Rear Artificial Horizon Bank")
defineFloat("REAR_AH_PITCH", 153, {1.0, -1.0}, "Gauges", "Rear Artificial Horizon Pitch")
defineFloat("REAR_AH_SLIP", 154, {1.0, -1.0}, "Gauges", "Rear Artificial Horizon Sideslip")
defineFloat("FRONT_TACHO", 106, {0.0, 1.0}, "Gauges", "Fore Tachometer Gauge")
defineFloat("REAR_TACHO", 106, {0.0, 1.0}, "Gauges", "Rear Tachometer Gauge")
defineFloat("MANIFOLD_PRESS", 108, {0.0, 1.0}, "Gauges", "Manifold Pressure Gauge")
defineFloat("MANIFOLD_TEMP", 160, {-1.0, 0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6}, "Gauges", "Manifold Temperature Gauge")
defineFloat("VOLTMETER_G", 175, {-0.2, 0.6}, "Gauges", "Volt Amperemeter Gauge")
defineFloat("FRONT_UGR4K_CURR_CRS", 156, {0.0, 1.0}, "Gauges", "Fore UGR-4K Current Course")
defineFloat("FRONT_UGR4K_SET_CRS", 157, {0.0, 1.0}, "Gauges", "Fore UGR-4K Set Course")
defineFloat("FRONT_UGR4K_BCN_CRS", 158, {0.0, 1.0}, "Gauges", "Fore UGR-4K Beacon Course")
defineFloat("REAR_UGR4K_CURR_CRS", 280, {0.0, 1.0}, "Gauges", "Rear UGR-4K Current Course")
defineFloat("REAR_UGR4K_SET_CRS", 281, {0.0, 1.0}, "Gauges", "Rear UGR-4K Set Course")
defineFloat("REAR_UGR4K_BCN_CRS", 282, {0.0, 1.0}, "Gauges", "Rear UGR-4K Beacon Course")
defineFloat("FRONT_OIL_PRESS", 169, {-1.0, 0.0, 1.0}, "Gauges", "Fore Oil Pressure Gauge")
defineFloat("FRONT_OIL_TEMP", 167, {-1.0, 0.0, 1.0}, "Gauges", "Fore Oil Temperature Gauge")
defineFloat("FRONT_FUEL_PRESS", 168, {-1.0, 0.0, 1.0}, "Gauges", "Fore Fuel Pressure Gauge")
defineFloat("REAR_OIL_PRESS", 172, {-1.0, 0.0, 1.0}, "Gauges", "Rear Oil Pressure Gauge")
defineFloat("REAR_OIL_TEMP", 170, {-1.0, 0.0, 1.0}, "Gauges", "Rear Oil Temperature Gauge")
defineFloat("REAR_FUEL_PRESS", 171, {-1.0, 0.0, 1.0}, "Gauges", "Rear Fuel Pressure Gauge")
defineFloat("FRONT_CYL_TEMP", 173, {-0.05, 0.35}, "Gauges", "Fore Cylinder Heads Temperature Gauge")
defineFloat("REAR_CYL_TEMP", 174, {-0.05, 0.35}, "Gauges", "Rear Cylinder Heads Temperature Gauge")
defineFloat("FRONT_PNEU_MAIN_PRESS", 37, {0.0, 1.0}, "Gauges", "Fore Pneumatic Main Pressure Gauge")
defineFloat("FRONT_PNEU_STBY_PRESS", 38, {0.0, 1.0}, "Gauges", "Fore Pneumatic Standby Pressure Gauge")
defineFloat("REAR_PNEU_MAIN_PRESS", 39, {0.0, 1.0}, "Gauges", "Rear Pneumatic Main Pressure Gauge")
defineFloat("REAR_PNEU_STBY_PRESS", 40, {0.0, 1.0}, "Gauges", "Rear Pneumatic Standby Pressure Gauge")

BIOS.protocol.endModule()