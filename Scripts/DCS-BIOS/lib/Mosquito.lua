BIOS.protocol.beginModule("Mosquito", 0x7000)
BIOS.protocol.setExportModuleAircrafts({"MosquitoFBMkVI"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineString = BIOS.util.defineString
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- remove Arg# Pilot 500

--Main Pit
definePushButton("STICK_BTN_A", 5, 3005, 245, "Stick", "Stick Button A - MG Trigger")
definePushButton("STICK_BTN_B1", 5, 3006, 246, "Stick", "Stick Button B1 - Cannon Trigger")	
definePushButton("STICK_BTN_B2", 5, 3007, 244, "Stick", "Stick Button B2 - Secondary & Drop Ordnance Trigger")
definePotentiometer("STICK_WH_BRK", 2, 3001, 248, {0, 1}, "Stick", "Stick Wheel Brakes Lever")
definePushButton("STICK_WH_BRK_LOCK", 2, 3004, 291, "Stick", "Stick Wheel Brakes Lever Lock")
defineToggleSwitch("WINDOW_CONTROL_L", 2, 3022, 251, "Cockpit", "Left Side Window Open/Close Control")
defineToggleSwitch("WINDOW_CONTROL_R", 2, 3063, 253, "Cockpit", "Right Side Window Open/Close Control")
definePushButton("ARMOR_HEADREST", 2, 3071, 312, "Cockpit", "Armor Headrest Lock")
definePotentiometer("GUNSIGHT_RANGE", 5, 3045, 107, {0, 1}, "Reflector Sight", "Reflector Sight Setter Rings Range")
definePotentiometer("GUNSIGHT_SPAN", 5, 3048, 108, {0, 1}, "Reflector Sight", "Reflector Sight Setter Rings Span")
definePotentiometer("GUNSIGHT_DIM", 4, 3009, 13, {0, 1}, "Reflector Sight" , "Reflector Sight Dimmer")

--J.B.A.
defineToggleSwitch("MASTER_SWITCH", 3, 3009, 124, "JBA", "Master Gate Switch")
defineToggleSwitch("PORT_MAGNETO_1", 3, 3001, 125, "JBA", "Magneto Switch Port 1")
defineToggleSwitch("PORT_MAGNETO_2", 3, 3003, 126, "JBA", "Magneto Switch Port 2")
defineToggleSwitch("PORT_START_CVR", 3, 3052, 129, "JBA", "Starter Switch Cover Port")
definePushButton("PORT_START_SW", 3, 3054, 131, "JBA", "Starter Switch Port")
defineToggleSwitch("PORT_BOOST_CVR", 3, 3058, 133, "JBA", "Booster Switch Cover Port")
definePushButton("PORT_BOOST_SW", 3, 3060, 135, "JBA", "Booster Switch Port")
defineToggleSwitch("PORT_AIRSCREW", 3, 3081, 354, "JBA", "Feathering Switch Port")
defineToggleSwitch("PORT_RAD_FLAP", 4, 3062, 112, "JBA", "Radiator Flap Switch Port")
defineToggleSwitch("STBD_RAD_FLAP", 4, 3064, 113, "JBA", "Radiator Flap Switch Starboard")
defineToggleSwitch("STBD_AIRSCREW", 3, 3082, 355, "JBA", "Feathering Switch Starboard")
defineToggleSwitch("STBD_BOOST_CVR", 3, 3061, 134, "JBA", "Booster Switch Cover Starboard")
definePushButton("STBD_BOOST_SW", 3, 3063, 136, "JBA", "Booster Switch Starboard")
defineToggleSwitch("STBD_START_CVR", 3, 3055, 130, "JBA", "Starter Switch Cover Starboard")
definePushButton("STBD_START_SW", 3, 3057, 132, "JBA", "Starter Switch Starboard")
defineToggleSwitch("STBD_MAGNETO_1", 3, 3005, 127, "JBA", "Magneto Switch Starboard 1")
defineToggleSwitch("STBD_MAGNETO_2", 3, 3007, 128, "JBA", "Magneto Switch Starboard 2")
definePotentiometer("FLOOD_L_DIM_R", 4, 3053, 14, {0, 1}, "JBA", "Right Flood Light Dimmer")
definePotentiometer("BOX_B_DIM", 4, 3056, 15, {0, 1}, "JBA", "J.B.B. Flood Light Dimmer")
defineToggleSwitch("AIR_FILTER", 4, 3066, 114, "JBA", "Tropical Air Filter Switch")
defineToggleSwitch("FUEL_PUMP_L_CVR", 2, 3065, 282, "JBA", "Fuel Pump Light Cover")

--defineFloat("COCKPIT_HATCH", 38, {0, 1}, "Cockpit", "Cockpit Hatch")
--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Position Light (white)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_NOSE", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Nose Light (white)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_WINGS", function()
	if LoGetAircraftDrawArgumentValue(196) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Wing Lights (white)")
defineIntegerFromGetter("EXT_BOTTOM_LIGHT_RED", function()
	if LoGetAircraftDrawArgumentValue(200) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Red Bottom Light (red)")
defineIntegerFromGetter("EXT_BOTTOM_LIGHT_YEL", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Yellow Bottom Light (yellow)")
defineIntegerFromGetter("EXT_BOTTOM_LIGHT_GRN", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Green Bottom Light (green)")
defineIntegerFromGetter("EXT_LAND_LIGHT_L", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Landing Light (white)")
defineIntegerFromGetter("EXT_LAND_LIGHT_R", function()
	if LoGetAircraftDrawArgumentValue(209) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Landing Light (white)")

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