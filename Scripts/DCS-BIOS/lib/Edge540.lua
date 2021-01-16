BIOS.protocol.beginModule("Edge540", 0x5600)
BIOS.protocol.setExportModuleAircrafts({"Edge540"})
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
defineToggleSwitch("MASTER_SW", 4, 3001, 18, "Main Panel", "Master Switch")--3051
defineToggleSwitch("BOOST_SW", 4, 3002, 19, "Main Panel", "Electric Fuel Pump")--3052
defineToggleSwitch("CANOPY", 6, 71, 0, "Main Panel", "Canopy")
definePushButton("UAV_BTN",	2, 3007, 0, "Main Panel", "UAV Mode")
definePushButton("LED_BTN", 2, 3008, 0, "Main Panel", "Racing LED Indicator Speed/G Toggle")
definePushButton("CUSTOM_5_BTN", 2, 3006, 0, "Main Panel", "Hide Aersti Chart")
definePushButton("STOPWATCH_BTN", 7, 3005, 0, "Main Panel", "Stopwatch Start/Stop/Reset")

definePotentiometer("PROP_MIX", 3, 3003, 17, {0, 1}, "Engine" , "Mixture Lever")
defineTumb("FUEL_SEL", 4, 3053, 21, 0.5, {0.0, 1.0}, nil, false, "Engine", "Fuel Selector")--?
defineTumb("MAG", 4, 3050, 14, 0.25, {0.0, 1.0}, nil, false, "Engine", "Magnetos")

defineTumb("PILOT_SEL", 8, 3013, 0, 0.1, {0.0, 0.6}, nil, false, "Custom", "Select Pilot")
defineTumb("FLOOD_L_COL", 8, 3023, 0, 0.1, {0.0, 0.5}, nil, false, "Custom", "Flood Light Color")

definePushButton("PAGE_1BTN_NAV", 8, 3015, 34, "Main Display", "Display Button 1 NAV Page")
definePushButton("PAGE_2BTN_SYS", 8, 3017, 32, "Main Display", "Display Button 2 System Page")
definePushButton("PAGE_3BTN_MP3", 8, 3018, 31, "Main Display", "Display Button 3 Mp3 Page")
definePushButton("PAGE_4BTN_CONF", 8, 3001, 30, "Main Display", "Display Button 4 Configuration Page")

--System Page Buttons
definePushButton("NAV_BTN", 4, 3001, 0, "Main Display", "System Page Navigation Lights")
definePushButton("FLOOD_BTN", 4, 3012, 0, "Main Display", "System Page Flood Lights")
definePushButton("GAUGE_BTN", 4, 3013, 42, "Main Display", "System Page Gauge Lights")
definePushButton("WALL_BTN", 8, 3019, 0, "Main Display", "System Page Wallpaper")

--MP3 Player
definePushButton("MP3_PLAY", 9, 3030, 0, "Main Display", "Mp3 Play")
definePushButton("MP3_NEXT", 9, 3031, 0, "Main Display", "Mp3 Next Track")
definePushButton("MP3_PREV", 9, 3032, 0, "Main Display", "Mp3 Previous Track")

defineToggleSwitch("CUSTOM_1_BTN", 8, 3010, 0, "Custom", "Attach/Remove Winglets")
defineToggleSwitch("CUSTOM_2_BTN", 8, 3011, 0, "Custom", "Attach/Remove Spades")
defineToggleSwitch("CUSTOM_3_BTN", 8, 3012, 0, "Custom", "Attach/Remove Lights")

defineToggleSwitch("SMK_ARM", 1, 3025, 27, "Smoke", "Smoke Arm")

-- Warning, Caution and IndicatorLights
defineIndicatorLight("DISPLAY_L", 20, "Warning, Caution and IndicatorLights","Display Background Light (white)")
defineIndicatorLight("COCKPIT_L", 41, "Warning, Caution and IndicatorLights","Cockpit Light (white)")
defineIndicatorLight("INSTR_L", 42, "Warning, Caution and IndicatorLights","Instrument Lights (white)")

--Gauges
defineFloat("CANOPY_POS", 181, {0, 1}, "Canopy", "Canopy Position")
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