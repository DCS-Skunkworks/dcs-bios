module("Edge540", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class Edge540: Module
local Edge540 = Module:new("Edge540", 0x5600, { "Edge540", "Extra330SR" })

--by WarLord

Edge540:defineRotary("ALT_SET", 2, 3001, 6, "Main Panel", "Altimeter Setting")
Edge540:defineToggleSwitch("MASTER_SW", 4, 3051, 18, "Main Panel", "Master Switch")
Edge540:defineToggleSwitch("BOOST_SW", 4, 3052, 19, "Main Panel", "Electric Fuel Pump")
Edge540:defineToggleSwitch("CANOPY", 6, 71, 0, "Main Panel", "Canopy Open/Close")
Edge540:definePushButton("UAV_BTN", 2, 3007, 0, "Main Panel", "UAV Mode")
Edge540:definePushButton("LED_BTN", 2, 3008, 0, "Main Panel", "Racing LED Indicator Speed/G Toggle")
Edge540:definePushButton("STOPWATCH_BTN", 7, 3005, 0, "Main Panel", "Stopwatch Start/Stop/Reset")
Edge540:definePotentiometer("PROP_MIX", 3, 3003, 17, { 0, 1 }, "Main Panel", "Mixture Lever")
Edge540:defineTumb("FUEL_SEL", 3, 3053, 21, 0.5, { 0, 1 }, nil, false, "Main Panel", "Fuel Selector")
Edge540:defineTumb("MAG", 3, 3050, 14, 0.25, { 0, 1 }, nil, false, "Main Panel", "Magnetos")

Edge540:definePushButton("PAGE_1BTN_NAV", 8, 3015, 34, "Main Display", "Display Button 1 NAV Page")
Edge540:definePushButton("PAGE_2BTN_SYS", 8, 3017, 32, "Main Display", "Display Button 2 System Page")
Edge540:definePushButton("PAGE_3BTN_MP3", 8, 3018, 31, "Main Display", "Display Button 3 Mp3 Page")
Edge540:definePushButton("PAGE_4BTN_CONF", 8, 3001, 30, "Main Display", "Display Button 4 Configuration Page")

--System Page Buttons
Edge540:definePushButton("SYS_NAV_BTN", 4, 3001, 61, "System Page", "System Page - Navigation Lights")
Edge540:definePushButton("SYS_FLOOD_BTN", 4, 3012, 63, "System Page", "System Page - Flood Lights")
Edge540:definePushButton("SYS_GAUGE_BTN", 4, 3013, 42, "System Page", "System Page - Gauge Lights")
Edge540:definePushButton("SYS_WALL_BTN", 8, 3019, 0, "System Page", "System Page - Wallpaper")
Edge540:defineTumb("SYS_FLOOD_L_COL", 8, 3023, 0, 0.1, { 0.0, 0.5 }, nil, false, "System Page", "System Page - Flood Light Color")

--MP3 Player
Edge540:definePushButton("MP3_PLAY", 9, 3030, 0, "Mp3 Page", "Mp3 Play")
Edge540:definePushButton("MP3_NEXT", 9, 3031, 0, "Mp3 Page", "Mp3 Next Track")
Edge540:definePushButton("MP3_PREV", 9, 3032, 0, "Mp3 Page", "Mp3 Previous Track")

--Configuration Page Buttons
Edge540:defineToggleSwitch("CONF_CUSTOM_1_BTN", 8, 3010, 70, "Config Page", "Config Page - Attach/Remove Winglets")
Edge540:defineToggleSwitch("CONF_CUSTOM_2_BTN", 8, 3011, 71, "Config Page", "Config Page - Attach/Remove Spades")
Edge540:defineToggleSwitch("CONF_CUSTOM_2_BTN_330", 8, 3011, 73, "Config Page", "Config Page - Attach/Remove Spades Extra330SR")
Edge540:defineToggleSwitch("CONF_CUSTOM_3_BTN", 8, 3012, 720, "Config Page", "Config Page - Attach/Remove Lights")
Edge540:defineTumb("CONF_PILOT_SEL", 8, 3013, 6, 0.1, { 0.0, 0.6 }, nil, false, "Config Page", "Config Page - Select Pilot")
Edge540:definePushButton("CONF_CUSTOM_5_BTN", 2, 3006, 0, "Config Page", "Config Page - Hide Aersti Chart")

Edge540:defineToggleSwitch("SMK_ARM", 1, 3025, 27, "Smoke", "Smoke Arm")

-- Warning, Caution and IndicatorLights
Edge540:defineIndicatorLight("DISPLAY_L", 20, "Warning, Caution and IndicatorLights", "Display Background Light (white)")
Edge540:defineIndicatorLight("COCKPIT_L", 41, "Warning, Caution and IndicatorLights", "Cockpit Light (white)")
Edge540:defineIndicatorLight("INSTR_L", 42, "Warning, Caution and IndicatorLights", "Instrument Lights (white)")

--Gauges
Edge540:defineFloat("CANOPY_POS", 181, { 0, 1 }, "Gauges", "Canopy Position")
Edge540:defineFloat("AIRSPEED", 5, { 0, 1 }, "Gauges", "Airspeed in Knots Gauge")
Edge540:defineFloat("FUEL_INT", 22, { 0, 1 }, "Gauges", "Internal Tanks Fuel Gauge")
Edge540:defineFloat("FUEL_WING", 23, { 0, 1 }, "Gauges", "Wing Tanks Fuel Gauge")

--Externals
Edge540:defineBitFromDrawArgument("EXT_LIGHTS", 421, "External Aircraft Model", "External Lights (red,green,white)")
Edge540:defineBitFromDrawArgument("EXT_PAINTGLOW", 424, "External Aircraft Model", "Paintjob Glow")

return Edge540
