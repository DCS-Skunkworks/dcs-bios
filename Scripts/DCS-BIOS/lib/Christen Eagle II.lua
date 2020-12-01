BIOS.protocol.beginModule("Christen Eagle II", 0x2800)
BIOS.protocol.setExportModuleAircrafts({"Christen Eagle II"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--remove Arg# FrontPilot 472
--remove Arg# RearPilot 50

--General
definePushButton("ACCEL_RESET", 1, 3031, 307, "General", "Accelerometer Reset Button")
defineToggleSwitch("SMOKE_SW", 1, 3034, 352, "General", "Smoke Switch")
definePotentiometer("AIRCOND_LEVER", 1, 3010, 369, {0, 1}, "General", "Air Conditioning")
definePotentiometer("TRIM_LEVER", 1, 3017, 370, {-1, 1}, "General", "Trim Lever")

--Instruments
definePotentiometer("ALT_PRESS", 8, 3039, 371, {-1, 1}, "Instruments", "Barometric Pressure")

--Radio
defineToggleSwitch("RADIO_PWR", 5, 3021, 353, "Radio", "Radio ON-OFF")
defineRotary("RADIO_FREQU_MHZ", 5, 3064, 374, "Radio", "Radio Frequency MHz")
definePushButton("RADIO_FREQU_TRANS", 5, 3063, 368, "Radio", "Radio Frequency Transfer")
definePushButton("RADIO_CHAN", 5, 3067, 375, "Radio", "Radio Channel")
defineRotary("RADIO_FREQU_50KHZ", 5, 3065, 366, "Radio", "Radio Frequency 50KHz")
definePushButton("RADIO_FREQU_25KHZ", 5, 3066, 367, "Radio", "Radio Frequency 25KHz (Pull)")
definePotentiometer("RADIO_VOL", 5, 3061, 364, {0, 1}, "Radio", "Radio Volume")
definePushButton("RADIO_TEST", 5, 3062, 365, "Radio", "Radio Test (Pull)")

--Engine
defineTumb("MAGNETS", 6, 3100, 350, 0.25, {0.0, 1.0}, nil, false, "Engine", "Magnets, OFF/RIGHT/LEFT/BOTH/START")
defineToggleSwitch("FUEL_VAL", 6, 3001, 349, "Engine", "Fuel Valve")
defineToggleSwitch("FUEL_PUMP", 6, 3038, 356, "Engine", "Fuel Pump")
defineRotary("MIXTURE", 6, 3058, 357, "Engine", "Mixture")
defineRotary("PROP_PITCH", 6, 3057, 358, "Engine", "Propeller")

--Electric
defineToggleSwitch("BATTERY", 7, 3033, 351, "Electric", "Battery Switch")
defineToggleSwitch("ALTERNATOR", 7, 3037, 354, "Electric", "Alternator Switch")
defineToggleSwitch("ALTER_FUSE", 7, 3073, 355, "Electric", "Alternator Fuse")
definePushButton("V_A_METER", 7, 3043, 377, "Electric", "Volt/Ampere Meter mode (Voltage / Amperage)")

--Lights
defineToggleSwitch("NAV_LIGHTS", 13, 3051, 459, "Lights", "Nav Lights")
defineToggleSwitch("LAND_LIGHTS", 13, 3054, 360, "Lights", "Landing Lights")
definePotentiometer("COCKPIT_LIGHTS", 13, 3053, 361, {0, 1}, "Lights", "Cockpit Lights")
defineToggleSwitch("COCKPIT_LIGHTS_RED", 13, 3055, 397, "Lights", "Red Cockpit Lights")
defineToggleSwitch("COCKPIT_LIGHTS_YEL", 13, 3056, 399, "Lights", "Yellow Cockpit Lights")

--Fuel Gauge
definePushButton("FUEL_IND_FRONT", 14, 3071, 378, "Fuel Gauge", "Fuel Indicator mode (F / U")
definePushButton("FUEL_IND_REAR", 14, 3072, 384, "Fuel Gauge", "Fuel Indicator mode Rear cockpit (F / U")

--Canopy
definePushButton("CANOPY_OPEN_REAR", 15, 3083, 400, "Canopy", "Canopy Lever Open (Rear)")
definePushButton("CANOPY_CLOSE_REAR", 15, 3081, 403, "Canopy", "Canopy Lever Close (Rear)")
definePushButton("CANOPY_OPEN_FRONT", 15, 3088, 400, "Canopy", "Canopy Lever Open (Front)")
definePushButton("CANOPY_CLOSE_FRONT", 15, 3089, 403, "Canopy", "Canopy Lever Close (Front)")
definePushButton("CANOPY_LOCK_REAR", 15, 3084, 401, "Canopy", "Canopy Lock (Rear)")
definePushButton("CANOPY_UNLOCK_REAR", 15, 3085, 401, "Canopy", "Canopy Unlock (Rear)")
definePushButton("CANOPY_LOCK_FRONT", 15, 3086, 401, "Canopy", "Canopy Lock (Front)")
definePushButton("CANOPY_UNLOCK_FRONT", 15, 3087, 401, "Canopy", "Canopy Unlock (Front)")
definePushButton("CANOPY_JETT", 15, 3090, 402, "Canopy", "Canopy Jettison (Rear)")

--Gauges
defineFloat("IAS_NEEDLE", 301, {0.0, 0.035, 0.063, 0.095, 0.175, 0.220, 0.270, 0.316, 0.376, 0.429, 0.481, 0.538, 0.587, 0.636, 0.690, 0.737, 0.783, 0.829, 0.866, 0.895, 0.925, 0.959}, "Gauges", "IAS Needle")
defineFloat("VERT_SPEED_NEEDLE", 301, {-0.944, -0.720, -0.450,	-0.257, 0.000, 0.255, 0.442, 0.717, 0.945}, "Gauges", "Vertical Speed Needle")
defineFloat("ACCEL_CURR", 304, {-1.0, -0.834, -0.572, -0.319, 0.011, 0.116, 0.328, 0.535, 0.759, 0.987}, "Gauges", "Acceleration Current")
defineFloat("ACCEL_MAX", 305, {-1.0, -0.834, -0.572, -0.319, 0.011, 0.116, 0.328, 0.535, 0.759, 0.987}, "Gauges", "Acceleration Max")
defineFloat("ACCEL_MIN", 306, {-1.0, -0.834, -0.572, -0.319, 0.011, 0.116, 0.328, 0.535, 0.759, 0.987}, "Gauges", "Acceleration Min")
defineFloat("COURSE", 308, {0.0167, 0.0, -1.00}, "Gauges", "Course Gauge")
defineFloat("ALT_FT_100", 309, {0.0, 0.25, 0.5, 0.75, 1.0}, "Gauges", "ALT 100ft Gauge")
defineFloat("ALT_FT_1000", 310, {0.0, 1.0}, "Gauges", "ALT 1000ft Gauge")
defineFloat("ALT_FT_10000", 312, {0.0, 1.0}, "Gauges", "ALT 10000ft Gauge")
defineFloat("OIL_PRESS", 314, {0.0, 0.167, 0.391, 0.599, 0.806, 0.899, 1.000}, "Gauges", "OIL Pressure")
defineFloat("OIL_TEMP", 315, {0.0, 0.091, 0.189, 0.341, 0.434, 0.548, 0.679, 0.835, 1.0}, "Gauges", "OIL Temperature")
defineFloat("MANIFOLD_PRESS", 316, {0.0, 0.205, 0.400, 0.603, 0.806, 1.0}, "Gauges", "MANIFOLD Pressure")
defineFloat("FUEL_FLOW", 317, {0.0, 0.047, 0.105, 0.195, 0.290, 0.426, 0.569, 0.735, 0.931, 1.0}, "Gauges", "Fuel Flow")
defineFloat("RPM", 318, {0.0, 0.120, 0.271, 0.416, 0.557, 0.696, 0.845, 1.0}, "Gauges", "RPM")
defineFloat("EGT", 319, {0.0, 0.260, 0.481, 0.661, 0.820, 0.979}, "Gauges", "EGT")
defineFloat("EGT_MAX", 320, {0.0, 0.289, 0.505, 0.676, 0.838, 0.992}, "Gauges", "EGT Max")
defineFloat("VAMETER", 376, {0.104, 0.260, 0.395, 0.564, 0.704, 0.856, 0.996}, "Gauges", "Volt-Ampermeter Gauge")
defineFloat("CANOPY_POS", 400, {0, 1}, "Canopy", "Canopy Position")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")

defineIntegerFromGetter("EXT_WOW_TAIL", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()