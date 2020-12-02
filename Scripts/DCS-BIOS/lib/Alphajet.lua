BIOS.protocol.beginModule("Alphajet", 0x6400)
BIOS.protocol.setExportModuleAircrafts({"Alphajet"})
--by WarLord (aka BlackLibrary)
--for Alphajet 2.5.5

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3PosTumb = BIOS.util.define3PosTumb

--Plane System
definePushButton("GMETER_SET", 7, 3001, 74, "Accelerometer", "Push to set G-Meter")

definePushButton("FLAPS_UP", 8, 3001, 200, "Avionics", "Flaps Up")
definePushButton("FLAPS_MID", 8, 3002, 201, "Avionics", "Flaps Mid")
definePushButton("FLAPS_DN", 8, 3003, 203, "Avionics", "Flaps Full Down")
definePushButton("GEAR_DN", 8, 3004, 219, "Avionics", "Gear Down")
definePushButton("GEAR_UP", 8, 3005, 220, "Avionics", "Gear UP")

definePushButton("ALT_RESET", 6, 3001, 73, "Altimeter", "Altimeter Reset 10000ft")
defineRotary("ALT_PRESS_SET", 6, 3002, 300, "Altimeter", "Altimeter Pressure Setting")
defineRotary("IAS_SET", 6, 3003, 301, "Altimeter", "IAS Index Setting")
defineRotary("HDG_SET", 6, 3004, 304, "Altimeter", "Set Heading Bug")
defineRotary("HRZ_STBY_SET", 6, 3005, 305, "Altimeter", "Reset Standby Horizon")
defineRotary("HRZ_SET", 6, 3006, 306, "Altimeter", "Horizon Plane Set")
defineToggleSwitch("HRZ_CAGE", 14, 3003, 314, "Altimeter", "Cache Horizon Hide/Show")

definePotentiometer("UHF_VOL", 6, 3007, 302, {0, 1}, "Radio", "UHF Volume")
definePotentiometer("VHF_VOL", 6, 3008, 303, {0, 1}, "Radio", "VHF Volume")

define3PosTumb("LIGHTS_NAV", 12, 3001, 280, "Light System", "Navigation Lights, FLASH/OFF/STEADY")
defineToggleSwitch("LIGHTS_FORMATION", 12, 3002, 281, "Light System", "Formation Lights, ON/OFF")
defineToggleSwitch("LIGHTS_ITENT", 12, 3003, 282, "Light System", "Intensity, STRONG/LOWVIS")
defineToggleSwitch("LIGHTS_ANTICOL", 12, 3004, 283, "Light System", "Anticollision Lights, ON/OFF")
define3PosTumb("LIGHTS_LAND", 12, 3006, 311, "Light System", "Lights, OFF/TAXI/LANDING")
define3PosTumb("LIGHTS_A_ALARM", 12, 3005, 295, "Light System", "High Alpha Alarm, HIDRAG/OFF/LOWDRAG")

defineToggleSwitch("ALARM_SONORE", 12, 3007, 284, "Control Panel", "Alarme Sonore, ON/OFF")
defineToggleSwitch("PITOT_HEAT", 12, 3008, 285, "Control Panel", "Pitot Heat, ON/OFF")
defineToggleSwitch("CENT_GYRO", 14, 3001, 286, "Control Panel", "Centrale Gyroscopique, ON/OFF")
defineToggleSwitch("HRZ_SECOURS", 14, 3002, 287, "Control Panel", "Horizon Secours, ON/OFF")
defineToggleSwitch("ELC_PUMP", 9, 3010, 288, "Control Panel", "Electropompe, ON/OFF")
defineToggleSwitch("SMOKE_SIDE_SW", 11, 3001, 317, "Control Panel", "Side Smoke System Right/Left")
defineToggleSwitch("CANOPY_SW", 19, 3001, 318, "Control Panel", "Cockpit Lever Open/Close")

defineToggleSwitch("MASTER_BAT_SW", 3, 3011, 289, "Electric System", "Master Battery Switch")
defineToggleSwitch("GEN_L_SW", 3, 3012, 290, "Electric System", "Left Generator Switch")
defineToggleSwitch("GEN_R_SW", 3, 3013, 291, "Electric System", "Right Generator Switch")
defineToggleSwitch("INVERT_L_SW", 3, 3014, 292, "Electric System", "Left Inverter Switch")
defineToggleSwitch("INVERT_R_SW", 3, 3015, 293, "Electric System", "Right Inverter Switch")
defineToggleSwitch("CRASH_BAR", 3, 3016, 315, "Electric System", "Crash Bar Switch")
definePushButton("WARN_L_TEST", 3, 3017, 294, "Electric System", "Warning Light Test")
defineToggleSwitch("DELESTAGE", 3, 3018, 316, "Electric System", "Delestage")

define3PosTumb("ENG_START_L", 15, 3020, 296, "Engine Panel", "Left Engine Start, START/VENT/OFF")
define3PosTumb("ENG_START_R", 15, 3021, 297, "Engine Panel", "Right Engine Start, START/VENT/OFF")
defineToggleSwitch("LOW_PRESS_PUMP_BPG", 15, 3022, 298, "Engine Panel", "Low Pressure Pump, BPG")
defineToggleSwitch("LOW_PRESS_PUMP_BPD", 15, 3023, 299, "Engine Panel", "Low Pressure Pump, BPD")
defineToggleSwitch("PROTECT_COVER_BPG", 15, 3024, 307, "Engine Panel", "Protective Cover, BPG")
defineToggleSwitch("PROTECT_COVER_BPD", 15, 3025, 308, "Engine Panel", "Protective Cover, BPD")
defineToggleSwitch("FUEL_CUT_L", 15, 3026, 309, "Engine Panel", "Fuel Cutoff Left")
defineToggleSwitch("FUEL_CUT_R", 15, 3027, 310, "Engine Panel", "Fuel Cutoff Right")

defineToggleSwitch("QXY_NORM_SW", 12, 3011, 312, "Oxygen System", "Oxygen Switch Normal/100%")
defineToggleSwitch("QXY_ON_SW", 12, 3012, 313, "Oxygen System", "Oxygen Switch Open/Close")

--Gauges
defineFloat("CANOPY_POS", 181, {0, 1}, "Gauges", "Canopy Position")
defineFloat("MANCHE", 114, {0, 1}, "Gauges", "Manche")
defineFloat("ENG_RPM_L", 16, {0, 1}, "Gauges", "Engine RPM Left")
defineFloat("ENG_FF_L", 60, {0, 1}, "Gauges", "Engine FF Left")
defineFloat("ENG_TEMP_L", 52, {0, 1}, "Gauges", "Engine Temperature Left")
defineFloat("ENG_RPM_R", 17, {0, 1}, "Gauges", "Engine RPM Right")
defineFloat("ENG_FF_R", 61, {0, 1}, "Gauges", "Engine FF Right")
defineFloat("ENG_TEMP_R", 51, {0, 1}, "Gauges", "Engine Temperature Right")
defineFloat("CLOCK_H", 500, {0, 1}, "Gauges", "Clock Hour")
defineFloat("CLOCK_M", 501, {0, 1}, "Gauges", "Clock Minute")
defineFloat("CLOCK_S", 502, {0, 1}, "Gauges", "Clock Second")
defineFloat("JOUR", 503, {0, 1}, "Gauges", "Jour")
defineFloat("CHRONO_H", 504, {0, 1}, "Gauges", "Chrono Hour")
defineFloat("CHRONO_M", 505, {0, 1}, "Gauges", "Chrono Minute")
defineFloat("CHRONO_S", 506, {0, 1}, "Gauges", "Chrono Second")
defineFloat("IAS_GAUGE", 100, {0, 1}, "Gauges", "IAS Gauge")
defineFloat("VERT_VELO", 24, {-0.6, 0.6}, "Gauges", "Vertical Velocity")
defineFloat("G_LOAD", 7, {-1, 1}, "Gauges", "G-Load")
defineFloat("G_MAX", 71, {-1, 1}, "Gauges", "G-Load Maximum")
defineFloat("G_MIN", 72, {-1, 1}, "Gauges", "G-Load Minimum")
defineFloat("AOA_UNITS", 10, {0, 0.3}, "Gauges", "AOA_Units")
defineFloat("AHRZ_ROLL", 26, {-1, 1}, "Gauges", "Artificial Horizon Roll")
defineFloat("AHRZ_PITCH", 27, {-1, 1}, "Gauges", "Artificial Horizon Pitch")
defineFloat("TRIM_PITCH", 498, {-1, 1}, "Gauges", "Trim Pitch")
defineFloat("ALT_NEEDLE_1K", 18, {0, 1}, "Gauges", "Altimeter 1000ft Needle")
defineFloat("ALT_DRUM_10K", 19, {0, 1}, "Gauges", "Altimeter 10000ft Drum")
defineFloat("COMP_ROSE", 28, {0, 1}, "Gauges", "Compass Rose")
defineFloat("FUEL_TOTAL", 25, {0, 1}, "Gauges", "Total Fuel")
defineFloat("MACH_METER", 9, {0, 1}, "Gauges", "Mach Meter")
defineFloat("HYD_PRESS1", 55, {0, 0.3}, "Gauges", "Hydraulic Pressure Gauge 1")
defineFloat("HYD_PRESS2", 56, {0, 0.3}, "Gauges", "Hydraulic Pressure Gauge 2")
defineFloat("FLAP_POS", 58, {0, 1}, "Gauges", "FLAP Position Gauge")

defineIndicatorLight("GEAR_BAY_L", 53, "Warning, Caution and IndicatorLights","Gear Baydoor Light (red)")
defineIndicatorLight("GEAR_L", 54, "Warning, Caution and IndicatorLights","Gear Lights (green)")
defineIndicatorLight("AF_L", 45, "Warning, Caution and IndicatorLights","AF Lamp (yellow)")
defineIndicatorLight("LIGHT_10K_FT", 57, "Warning, Caution and IndicatorLights","Warning Lamp 10000ft (yellow)")
defineIndicatorLight("GEAR_HND_L", 63, "Warning, Caution and IndicatorLights","Gear Handle Light (red)")
defineIndicatorLight("SMOKE_L", 62, "Warning, Caution and IndicatorLights","Smoke Light (green)")
defineIndicatorLight("BRAKE_L", 15, "Warning, Caution and IndicatorLights","Brake Lamp (yellow)")
defineIndicatorLight("FUEL_250_L", 20, "Warning, Caution and IndicatorLights","Fuel 250L Light (red)")
defineIndicatorLight("FUEL_LWING_L", 21, "Warning, Caution and IndicatorLights","Left Wing Fuel Lamp (yellow)")
defineIndicatorLight("FUEL_RWING_L", 22, "Warning, Caution and IndicatorLights","Right Wing Fuel Lamp (yellow)")
defineIndicatorLight("FLAP_L", 64, "Warning, Caution and IndicatorLights","FLAP Lamp (yellow)")
defineIndicatorLight("TEMP_L_L", 65, "Warning, Caution and IndicatorLights","Left Temperature Lamp (yellow)")
defineIndicatorLight("TEMP_R_L", 66, "Warning, Caution and IndicatorLights","Right Temperature Lamp (yellow)")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE", function()
	return math.floor(LoGetAircraftDrawArgumentValue(21)*65535)
end, 65535, "External Aircraft Model", "Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (green/red)")

defineIntegerFromGetter("EXT_STROBE_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Lights (white)")

defineIntegerFromGetter("EXT_GEAR_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Gear Light (white)")

defineIntegerFromGetter("EXT_NOSE_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(130) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Nose and Right Gear Lights (white)")

defineIntegerFromGetter("EXT_BOT_TAIL_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(202) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Bottom Tail Lights (red)")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()