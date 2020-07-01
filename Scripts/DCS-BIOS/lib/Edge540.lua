BIOS.protocol.beginModule("Edge540", 0x5600)
BIOS.protocol.setExportModuleAircrafts({"Edge540"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

-- local definePushButton = BIOS.util.definePushButton
-- local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
-- local defineTumb = BIOS.util.defineTumb
-- local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--templates from CEagle
-- defineTumb("MAGNETS", 6, 3100, 350, 0.25, {0.0, 1.0}, nil, false, "Engine", "Magnets, OFF/RIGHT/LEFT/BOTH/START")
-- defineToggleSwitch("BATTERY", 7, 3033, 351,"Electric" , "Battery Switch")
-- definePotentiometer("COCKPIT_LIGHTS", 13, 3053, 361, {0, 1},"Lights" , "Cockpit Lights")
-- definePushButton("CANOPY_OPEN_REAR", 15, 3083, 400,"Canopy" , "Canopy Lever Open (Rear)")

defineRotary("ALT_SET", 2, 3001, 6, "Main Panel" , "Altimeter Setting") --was barely legible after open clickable.lua with Notepad
-- Arg#7 float alt klein
-- Arg#8 float zeiger alt groß
-- Arg#9 float zeiger alt klein
-- Arg#10 Led trim
-- Arg#11 mittelkonsole
-- Arg#12 mixture
-- Arg#14 magneto

-- Warning, Caution and IndicatorLights
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

--- suspension Not programmed in Modell 
-- defineIntegerFromGetter("EXT_WOW_TAIL", function()
	-- if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
-- defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	-- if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
-- defineIntegerFromGetter("EXT_WOW_LEFT", function()
	-- if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()