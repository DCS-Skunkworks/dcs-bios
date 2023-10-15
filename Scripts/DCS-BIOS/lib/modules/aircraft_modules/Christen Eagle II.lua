module("Christen Eagle II", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class Christen_Eagle_II: Module
local Christen_Eagle_II = Module:new("Christen Eagle II", 0x2800, { "Christen Eagle II" })

--remove Arg# FrontPilot 472 RearPilot 50

--General
Christen_Eagle_II:definePushButton("ACCEL_RESET", 1, 3031, 307, "General", "Accelerometer Reset Button")
Christen_Eagle_II:defineToggleSwitch("SMOKE_SW", 1, 3034, 352, "General", "Smoke Switch")
Christen_Eagle_II:definePotentiometer("AIRCOND_LEVER", 1, 3010, 369, { 0, 1 }, "General", "Air Conditioning")
Christen_Eagle_II:definePotentiometer("TRIM_LEVER", 1, 3017, 370, { -1, 1 }, "General", "Trim Lever")

--Instruments
Christen_Eagle_II:definePotentiometer("ALT_PRESS", 8, 3039, 371, { -1, 1 }, "Instruments", "Barometric Pressure")

--Radio
Christen_Eagle_II:defineToggleSwitch("RADIO_PWR", 5, 3021, 353, "Radio", "Radio ON-OFF")
Christen_Eagle_II:defineRotary("RADIO_FREQU_MHZ", 5, 3064, 374, "Radio", "Radio Frequency MHz")
Christen_Eagle_II:definePushButton("RADIO_FREQU_TRANS", 5, 3063, 368, "Radio", "Radio Frequency Transfer")
Christen_Eagle_II:definePushButton("RADIO_CHAN", 5, 3067, 375, "Radio", "Radio Channel")
Christen_Eagle_II:defineRotary("RADIO_FREQU_50KHZ", 5, 3065, 366, "Radio", "Radio Frequency 50KHz")
Christen_Eagle_II:definePushButton("RADIO_FREQU_25KHZ", 5, 3066, 367, "Radio", "Radio Frequency 25KHz (Pull)")
Christen_Eagle_II:definePotentiometer("RADIO_VOL", 5, 3061, 364, { 0, 1 }, "Radio", "Radio Volume")
Christen_Eagle_II:definePushButton("RADIO_TEST", 5, 3062, 365, "Radio", "Radio Test (Pull)")

--Engine
Christen_Eagle_II:defineTumb("MAGNETS", 6, 3100, 350, 0.25, { 0, 1 }, nil, false, "Engine", "Magnets, OFF/RIGHT/LEFT/BOTH/START")
Christen_Eagle_II:defineToggleSwitch("FUEL_VAL", 6, 3001, 349, "Engine", "Fuel Valve")
Christen_Eagle_II:defineToggleSwitch("FUEL_PUMP", 6, 3038, 356, "Engine", "Fuel Pump")
Christen_Eagle_II:defineRotary("MIXTURE", 6, 3058, 357, "Engine", "Mixture")
Christen_Eagle_II:defineRotary("PROP_PITCH", 6, 3057, 358, "Engine", "Propeller")

--Electric
Christen_Eagle_II:defineToggleSwitch("BATTERY", 7, 3033, 351, "Electric", "Battery Switch")
Christen_Eagle_II:defineToggleSwitch("ALTERNATOR", 7, 3037, 354, "Electric", "Alternator Switch")
Christen_Eagle_II:defineToggleSwitch("ALTER_FUSE", 7, 3073, 355, "Electric", "Alternator Fuse")
Christen_Eagle_II:definePushButton("V_A_METER", 7, 3043, 377, "Electric", "Volt/Ampere Meter mode (Voltage / Amperage)")

--Lights
Christen_Eagle_II:defineToggleSwitch("NAV_LIGHTS", 13, 3051, 459, "Lights", "Nav Lights")
Christen_Eagle_II:defineToggleSwitch("LAND_LIGHTS", 13, 3054, 360, "Lights", "Landing Lights")
Christen_Eagle_II:definePotentiometer("COCKPIT_LIGHTS", 13, 3053, 361, { 0, 1 }, "Lights", "Cockpit Lights")
Christen_Eagle_II:defineToggleSwitch("COCKPIT_LIGHTS_RED", 13, 3055, 397, "Lights", "Red Cockpit Lights")
Christen_Eagle_II:defineToggleSwitch("COCKPIT_LIGHTS_YEL", 13, 3056, 399, "Lights", "Yellow Cockpit Lights")

--Fuel Gauge
Christen_Eagle_II:definePushButton("FUEL_IND_FRONT", 14, 3071, 378, "Fuel Gauge", "Fuel Indicator mode (F / U")
Christen_Eagle_II:definePushButton("FUEL_IND_REAR", 14, 3072, 384, "Fuel Gauge", "Fuel Indicator mode Rear cockpit (F / U")

--Canopy
Christen_Eagle_II:definePushButton("CANOPY_OPEN_REAR", 15, 3083, 900, "Canopy", "Canopy Lever Open (Rear)")
Christen_Eagle_II:definePushButton("CANOPY_CLOSE_REAR", 15, 3081, 403, "Canopy", "Canopy Lever Close (Rear)")
Christen_Eagle_II:definePushButton("CANOPY_OPEN_FRONT", 15, 3088, 400, "Canopy", "Canopy Lever Open (Front)")
Christen_Eagle_II:definePushButton("CANOPY_CLOSE_FRONT", 15, 3089, 403, "Canopy", "Canopy Lever Close (Front)")
Christen_Eagle_II:definePushButton("CANOPY_LOCK_REAR", 15, 3084, 401, "Canopy", "Canopy Lock (Rear)")
Christen_Eagle_II:definePushButton("CANOPY_UNLOCK_REAR", 15, 3085, 401, "Canopy", "Canopy Unlock (Rear)")
Christen_Eagle_II:definePushButton("CANOPY_LOCK_FRONT", 15, 3086, 401, "Canopy", "Canopy Lock (Front)")
Christen_Eagle_II:definePushButton("CANOPY_UNLOCK_FRONT", 15, 3087, 401, "Canopy", "Canopy Unlock (Front)")
Christen_Eagle_II:definePushButton("CANOPY_JETT", 15, 3090, 402, "Canopy", "Canopy Jettison (Rear)")

--Gauges
Christen_Eagle_II:defineFloat("IAS_NEEDLE", 301, { 0, 0.959 }, "Gauges", "IAS Needle")
Christen_Eagle_II:defineFloat("VERT_SPEED_NEEDLE", 301, { -0.944, 0.945 }, "Gauges", "Vertical Speed Needle")
Christen_Eagle_II:defineFloat("ACCEL_CURR", 304, { -1.0, 0.987 }, "Gauges", "Acceleration Current")
Christen_Eagle_II:defineFloat("ACCEL_MAX", 305, { -1.0, 0.987 }, "Gauges", "Acceleration Max")
Christen_Eagle_II:defineFloat("ACCEL_MIN", 306, { -1.0, 0.987 }, "Gauges", "Acceleration Min")
Christen_Eagle_II:defineFloat("COURSE", 308, { 0.0167, -1 }, "Gauges", "Course Gauge")
Christen_Eagle_II:defineFloat("ALT_FT_100", 309, { 0, 1 }, "Gauges", "ALT 100ft Gauge")
Christen_Eagle_II:defineFloat("ALT_FT_1000", 310, { 0, 1 }, "Gauges", "ALT 1000ft Gauge")
Christen_Eagle_II:defineFloat("ALT_FT_10000", 312, { 0, 1 }, "Gauges", "ALT 10000ft Gauge")
Christen_Eagle_II:defineFloat("OIL_PRESS", 314, { 0, 1 }, "Gauges", "OIL Pressure")
Christen_Eagle_II:defineFloat("OIL_TEMP", 315, { 0, 1 }, "Gauges", "OIL Temperature")
Christen_Eagle_II:defineFloat("MANIFOLD_PRESS", 316, { 0, 1 }, "Gauges", "MANIFOLD Pressure")
Christen_Eagle_II:defineFloat("FUEL_FLOW", 317, { 0, 1 }, "Gauges", "Fuel Flow")
Christen_Eagle_II:defineFloat("RPM", 318, { 0, 1 }, "Gauges", "RPM")
Christen_Eagle_II:defineFloat("EGT", 319, { 0, 0.979 }, "Gauges", "EGT")
Christen_Eagle_II:defineFloat("EGT_MAX", 320, { 0, 0.992 }, "Gauges", "EGT Max")
Christen_Eagle_II:defineFloat("VAMETER", 376, { 0.104, 0.996 }, "Gauges", "Volt-Ampermeter Gauge")
Christen_Eagle_II:defineFloat("CANOPY_POS", 400, { 0, 1 }, "Canopy", "Canopy Position")

--Externals
Christen_Eagle_II:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
Christen_Eagle_II:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")

Christen_Eagle_II:defineBitFromDrawArgument("EXT_WOW_TAIL", 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
Christen_Eagle_II:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
Christen_Eagle_II:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

return Christen_Eagle_II
