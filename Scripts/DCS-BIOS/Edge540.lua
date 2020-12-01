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
defineToggleSwitch("MASTER_SW", 4, 3001, 18, "Main Panel", "Master Switch")
defineToggleSwitch("BOOST_SW", 4, 3002, 19, "Main Panel", "Electric Fuel Pump")

definePotentiometer("MIXTURE_LVR", 3, 3003, 17, {0, 1}, "Engine" , "Mixture Lever")
--defineTumb("FUEL_SEL", 4, XXXX, 21, 0.5, {0.0, 1.0}, nil, false, "Engine", "Fuel Selector")

definePushButton("PAGE_1BTN_NAV", 8, 3015, 34, "Main Display", "Display Button 1 NAV Page")
definePushButton("PAGE_2BTN_SYS", 8, 3017, 32, "Main Display", "Display Button 2 System Page")
definePushButton("PAGE_3BTN_MP3", 8, 3018, 31, "Main Display", "Display Button 3 Mp3 Page")
definePushButton("PAGE_4BTN_CONF", 8, 3020, 30, "Main Display", "Display Button 4 Configuration Page")

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

-- Arg#3 Metal winkel über mixture
-- Arg#7 float alt klein
-- Arg#8 float zeiger alt groß
-- Arg#9 float zeiger alt klein
-- Arg#10 Led trim
-- Arg#11 mittelkonsole
-- Arg#12 mixture
-- Arg#27 Switch side left (top Mixture)
-- Arg#25
-- Arg#24
-- Arg#39
-- Arg#40
-- Arg#42
-- Arg#43
-- Arg#60

-- 1SMOKE_SYSTEM
-- 2AVIONICS
-- 3ENGINE
-- 4ELECTRIC
-- 5OXYGEN
-- 6CANOPY
-- 7STOPWATCH
-- 8CUSTOM
-- 9MPT
-- 10EFIS
-- 11INTERCOM
-- 12NETFILTER
-- 13UHF_RADIO
-- 14MACROS

   -- FUEL_SELECTOR_PNT Fuel Selector   Keys FuelSelector      5
   -- KEY_PNT 	   Magnetos MagSelect   Arg#14 4way
   -- COLOR_PNT   Flood Light Color 3023    
   -- UAV_PNT 	   UAV Mode 	   3007       
   -- LED_PNT $   Racing LED Indicator Speed/G Toggle 	   3008    
   -- STOPWATCH_STARTSTOP_PNT    Stopwatch Start/Stop/Reset STOPWATCH 	   3005 	   
   -- MSTR_PNT  Master 	   ELECTRIC      2@ Arg#18
   -- FUEL_PMP_PNT   Electric Boost Pump    ElectricFuelPump      3  Arg#19
   -- CANOPY_PNT Canopy    CANOPY 
   -- CUSTOM_1_PNT		Attach/Remove Winglets	CUSTOM	3010 
   -- CUSTOM_2_PNT 	Attach/Remove Spades	CUSTOM	3011 
   -- CUSTOM_3_PNT 	Attach/Remove Lights	CUSTOM	3012
   -- CUSTOM_4_PNT 	Select Pilot			CUSTOM	3013
   -- CUSTOM_5_PNT   	Hide Aersti Chart 	   	CUSTOM	3006       
   -- NAV_PNT   Navigation Lights 
   -- FLOOD_PNT Flood Lights Arg#41
   -- GAUGE_PNT Gauge Lights      	   
   -- WALL_PNT Wallpaper 3019 
   -- MP3_PLAY_PNT 	   Mp3 Play    MPT 3030 
   -- MP3_NEXT_PNT Mp3 Next Track 3031 
   -- MP3_PREV_PNT Mp3 Previous Track 3032 

BIOS.protocol.endModule()