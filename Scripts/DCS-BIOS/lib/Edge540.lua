BIOS.protocol.beginModule("Edge540", 0x5600)
BIOS.protocol.setExportModuleAircrafts({"Edge540", "Extra330SR"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

defineRotary("ALT_SET", 2, 3001, 6, "Main Panel" , "Altimeter Setting") 
defineToggleSwitch("MASTER_SW", 4, 3051, 18, "Main Panel", "Master Switch")
defineToggleSwitch("BOOST_SW", 4, 3052, 19, "Main Panel", "Electric Fuel Pump")
defineToggleSwitch("CANOPY", 6, 71, 0, "Main Panel", "Canopy Open/Close")
definePushButton("UAV_BTN",	2, 3007, 0, "Main Panel", "UAV Mode")
definePushButton("LED_BTN", 2, 3008, 0, "Main Panel", "Racing LED Indicator Speed/G Toggle")
definePushButton("STOPWATCH_BTN", 7, 3005, 0, "Main Panel", "Stopwatch Start/Stop/Reset")
definePotentiometer("PROP_MIX", 3, 3003, 17, {0, 1}, "Main Panel" , "Mixture Lever")
defineTumb("FUEL_SEL", 3, 3053, 21, 0.5, {0.0, 1.0}, nil, false, "Main Panel", "Fuel Selector")
defineTumb("MAG", 3, 3050, 14, 0.25, {0.0, 1.0}, nil, false, "Main Panel", "Magnetos")

definePushButton("PAGE_1BTN_NAV", 8, 3015, 34, "Main Display", "Display Button 1 NAV Page")
definePushButton("PAGE_2BTN_SYS", 8, 3017, 32, "Main Display", "Display Button 2 System Page")
definePushButton("PAGE_3BTN_MP3", 8, 3018, 31, "Main Display", "Display Button 3 Mp3 Page")
definePushButton("PAGE_4BTN_CONF", 8, 3001, 30, "Main Display", "Display Button 4 Configuration Page")

--System Page Buttons
definePushButton("SYS_NAV_BTN", 4, 3001, 61, "System Page", "System Page - Navigation Lights")
definePushButton("SYS_FLOOD_BTN", 4, 3012, 63, "System Page", "System Page - Flood Lights")
definePushButton("SYS_GAUGE_BTN", 4, 3013, 42, "System Page", "System Page - Gauge Lights")
definePushButton("SYS_WALL_BTN", 8, 3019, 0, "System Page", "System Page - Wallpaper")
defineTumb("SYS_FLOOD_L_COL", 8, 3023, 0, 0.1, {0.0, 0.5}, nil, false, "System Page", "System Page - Flood Light Color")

--MP3 Player
definePushButton("MP3_PLAY", 9, 3030, 0, "Mp3 Page", "Mp3 Play")
definePushButton("MP3_NEXT", 9, 3031, 0, "Mp3 Page", "Mp3 Next Track")
definePushButton("MP3_PREV", 9, 3032, 0, "Mp3 Page", "Mp3 Previous Track")

--Configuration Page Buttons
defineToggleSwitch("CONF_CUSTOM_1_BTN", 8, 3010, 70, "Config Page", "Config Page - Attach/Remove Winglets")
defineToggleSwitch("CONF_CUSTOM_2_BTN", 8, 3011, 71, "Config Page", "Config Page - Attach/Remove Spades")
defineToggleSwitch("CONF_CUSTOM_2_BTN_330", 8, 3011, 73, "Config Page", "Config Page - Attach/Remove Spades Extra330SR")
defineToggleSwitch("CONF_CUSTOM_3_BTN", 8, 3012, 720, "Config Page", "Config Page - Attach/Remove Lights")
defineTumb("CONF_PILOT_SEL", 8, 3013, 6, 0.1, {0.0, 0.6}, nil, false, "Config Page", "Config Page - Select Pilot")
definePushButton("CONF_CUSTOM_5_BTN", 2, 3006, 0, "Config Page", "Config Page - Hide Aersti Chart")

defineToggleSwitch("SMK_ARM", 1, 3025, 27, "Smoke", "Smoke Arm")

-- Warning, Caution and IndicatorLights
defineIndicatorLight("DISPLAY_L", 20, "Warning, Caution and IndicatorLights","Display Background Light (white)")
defineIndicatorLight("COCKPIT_L", 41, "Warning, Caution and IndicatorLights","Cockpit Light (white)")
defineIndicatorLight("INSTR_L", 42, "Warning, Caution and IndicatorLights","Instrument Lights (white)")

--Gauges
defineFloat("CANOPY_POS", 181, {0, 1}, "Gauges", "Canopy Position")
defineFloat("AIRSPEED", 5, {0, 1}, "Gauges", "Airspeed in Knots Gauge")
defineFloat("FUEL_INT", 22, {0, 1}, "Gauges", "Internal Tanks Fuel Gauge")
defineFloat("FUEL_WING", 23, {0, 1}, "Gauges", "Wing Tanks Fuel Gauge")

--Externals
defineIntegerFromGetter("EXT_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(421) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "External Lights (red,green,white)")
defineIntegerFromGetter("EXT_PAINTGLOW", function()
	if LoGetAircraftDrawArgumentValue(424) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Paintjob Glow")

BIOS.protocol.endModule()