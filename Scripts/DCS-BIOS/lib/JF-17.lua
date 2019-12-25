BIOS.protocol.beginModule("JF-17", 0x4800)
BIOS.protocol.setExportModuleAircrafts({"JF-17"})

-- Made by WarLord (aka BlackLibrary)
-- v 0.1

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local define3PosTumb = BIOS.util.define3PosTumb
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineString = BIOS.util.defineString

-- Remove Arg: Stick #970 ; 

-- Extra Functions

----------------------------------------- BIOS-Profile
--Left Console
defineMultipositionSwitch("SAIU_SEL_BAK", 11, 3000, 500, 4, 0.333, "Left Console", "Backup SAIU Knob Selector")
definePushButton("GEAR_LIGH_TEST_BTN", 32, 3001, 501, "Left Console", "Landing Gear Indicator Light Test Button")
defineToggleSwitch("GEAR_OVER_BTN_COVER", 32, 3002, 502, "Left Console", "Landing Gear Override Button Cover")
defineToggleSwitch("GEAR_OVER_BTN", 32, 3003, 503, "Left Console", "Landing Gear Override Button")
definePotentiometer("GEAR_IND_LIGHT_KNOB", 32, 3004, 504, {0, 1}, "Left Console", "Landing Gear Indicator Light Knob")
defineToggleSwitch("GEAR_LEVER", 32, 3005, 505, "Left Console", "Landing Gear Lever")

defineToggleSwitch("GND_JETT_BTN", 12, 3006, 506, "Left Console", "Ground Jettison Button")
defineToggleSwitch("EMERG_JETT_BTN_COVER", 12, 3007, 507, "Left Console", "Emergency Jettison Button Cover")
definePushButton("EMERG_JETT_BTN", 12, 3008, 508, "Left Console", "Emergency Jettison Button")

--MASTER ARM
define3PosTumb("MASTER_ARM_SW", 11, 3009, 509, "Left Console", "Weapon Master Arm Switch")

--LANDING GEAR
define3PosTumb("BRAKE_TEST", 32, 3010, 510, "Left Console", "Brake Test")
defineTumb("BRAKE_PARK_NORM", 32, 3011, 511, 2, {-1,1}, nil, false, "Left Console", "Brake Park/Norm")

define3PosTumb("LIGHT_SW", 4, 3012, 512, "Left Console", "Light Switch - Land/Off/Taxi")
define3PosTumb("FLAP_SW", 35, 3013, 513, "Left Console", "TEF Flap Switch - Up/Down")

--FUEL
defineToggleSwitch("FEED_CUT_VALVE_COVER", 33, 3014, 514, "Left Console" , "Feed Cut-off Valve Cover")
defineToggleSwitch("FEED_CUT_VALVE", 33, 3015, 515, "Left Console" , "Feed Cut-off Valve")
defineToggleSwitch("ACT_FUEL_CUT_VALVE_COVER", 33, 3016, 516, "Left Console" , "Active Fuel Cut-off Valve Cover")
defineToggleSwitch("ACT_FUEL_CUT_VALVE", 33, 3017, 517, "Left Console" , "Active Fuel Cut-off Valve")
defineToggleSwitch("FUEL_PUMP_SW", 33, 3018, 518, "Left Console" , "Fuel Pump Switch")

--ENG
defineToggleSwitch("ENG_CONTR_SW", 34, 3019, 519, "Left Console", "Engine Control Switch")
defineToggleSwitch("AIR_START_BTN", 34, 3020, 520, "Left Console", "Air Start Button")
definePushButton("GND_START_BTN", 34, 3021, 521, "Left Console", "Ground Start Button")
define3PosTumb("ENG_MODE_SW", 34, 3022, 522, "Left Console", "Engine Mode Switch")
defineToggleSwitch("SEC_EEC_SW", 34, 3023, 523, "Left Console", "SEC EEC Switch")
defineToggleSwitch("AFTERBURN_SW", 34, 3024, 524, "Left Console", "Afterburner Switch")
defineToggleSwitch("ANTI_SURGE_SW", 34, 3025, 525, "Left Console", "Anti-Surge Switch")
define3PosTumb("START_MODE_SEL", 34, 3026, 526, "Left Console", "Start Mode Selector - START/ENG COLD/STARTER COLD")

--FCS
defineToggleSwitch("RECORD_SW", 34, 3027, 527, "Left Console", "Record Switch")
defineToggleSwitch("EFCS_SW", 34, 3028, 528, "Left Console", "EFCS Switch")
defineToggleSwitch("YAW_ROLL_CAS_SW", 34, 3029, 529, "Left Console", "Yaw/Roll CAS Switch")
defineToggleSwitch("DIRECT_MODE_SW", 34, 3030, 530, "Left Console", "Direct Mode Switch")
defineToggleSwitch("BIT_BTN", 34, 3031, 531, "Left Console", "BIT Button")

definePushButton("YAW_TRIM_SW", 34, 3032, 532, "Left Console", "Yaw Trim Switch")
definePushButton("FCS_RESET_BTN", 34, 3044, 544, "Left Console", "FCS Reset Button")
defineToggleSwitch("FLGHT_TEST_1_SW", 34, 3033, 533, "Left Console", "Flight Test Switch 1")
defineToggleSwitch("FLGHT_TEST_2_SW", 34, 3034, 534, "Left Console", "Flight Test Switch 2")
defineToggleSwitch("AG1_AG2_SW", 34, 3035, 535, "Left Console", "AG1/AG2 Switch")
defineToggleSwitch("AA_AG_SW", 34, 3036, 536, "Left Console", "Aa/AG Switch")

--MISC
defineToggleSwitch("FLARE_DISP_BTN_COVER", 12, 3037, 537, "Left Console", "Flare Dispense Button Cover")
definePushButton("FLARE_DISP_BTN", 12, 3038, 538, "Left Console", "Flare Dispense Button")
defineToggleSwitch("EMERG_HYD_PUMP_SW", 34, 3039, 539, "Left Console", "Emergency Hydraulic Pump Switch")
defineToggleSwitch("SHARS_SW", 34, 3040, 540, "Left Console", "SHARS Switch")

defineToggleSwitch("EJECT_SEAT_DESTR_SW", 34, 3041, 541, "Left Console", "Ejection Seat Activate Destruct")
defineToggleSwitch("SELF_DESTR_BTN_COVER", 12, 3042, 542, "Left Console", "Self Destruct Button Cover")
definePushButton("SELF_DESTR_BTN", 12, 3043, 543, "Left Console", "Self Destruct Button")

-------------------------------------------------------------------------------------------------------------------------------
-- Warning, Caution and IndicatorLights
defineIndicatorLight("FLASH_LIGHT", 969, "Warning, Caution and IndicatorLights", "Flash Light")

-- Gauges
defineFloat("CANOPY_POS", 38, {0, 1}, "Cockpit", "Canopy Position")
defineFloat("MIRROR_RIGHT", 960, {0, 1}, "Cockpit", "Right Mirror")
defineFloat("MIRROR_CENTER", 961, {0, 1}, "Cockpit", "Center Mirror")
defineFloat("MIRROR_LEFT", 962, {0, 1}, "Cockpit", "Left Mirror")

defineFloat("MAG_HDG_BAK", 293, {0, 1}, "Gauges", "Backup Magnetic HDG")

--Externals

defineIntegerFromGetter("EXT_BRAKE_CUTE", function()
	if LoGetAircraftDrawArgumentValue(35) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Brake Cute")

defineIntegerFromGetter("EXT_SPEED_BRAKE_TOP_R", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Top Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_TOP_L", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Top Left Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_BTM_R", function()
	return math.floor(LoGetAircraftDrawArgumentValue(186)*65535)
end, 65535, "External Aircraft Model", "Bottom Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_BTM_L", function()
	return math.floor(LoGetAircraftDrawArgumentValue(188)*65535)
end, 65535, "External Aircraft Model", "Bottom Left Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(83) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Position Light")

defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light")

defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT_B", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Body Position Light (red)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT_B", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Body Position Light (green)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT_W", function()
	if LoGetAircraftDrawArgumentValue(200) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Wing Position Light (red)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT_W", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Wing Position Light (green)")

BIOS.protocol.endModule()