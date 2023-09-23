module("P-51D", package.seeall)

local Module = require("Module")

--- @class P-51D : Module
local P_51D = Module:new("P-51D", 0x5000, { "P-51D", "TF-51D", "P-51D-30-NA" })

P_51D:defineToggleSwitch("GEN", 14, 3003, 102, "Right Switch Panel", "Generator")
P_51D:defineToggleSwitch("BAT", 14, 3001, 103, "Right Switch Panel", "Battery")
P_51D:defineToggleSwitch("GUN_HEAT", 14, 3019, 104, "Right Switch Panel", "Gun Heating")
P_51D:defineToggleSwitch("PITOT", 14, 3005, 105, "Right Switch Panel", "Pitot Heating")
P_51D:define3PosTumb("WING_LTS", 14, 3008, 106, "Right Switch Panel", "Wing Position Lights Bright/Off/Dim")
P_51D:define3PosTumb("TAIL_LTS", 14, 3009, 107, "Right Switch Panel", "Tail Position Lights Bright/Off/Dim")
P_51D:define3PosTumb("RED_REC_LT", 14, 3021, 108, "Right Switch Panel", "Red Recognition Light Key/Off/Steady")
P_51D:define3PosTumb("GRN_REC_LT", 14, 3022, 109, "Right Switch Panel", "Green Recognition Light Key/Off/Steady")
P_51D:define3PosTumb("AMBR_REC_LT", 14, 3023, 110, "Right Switch Panel", "Amber Recognition Light Key/Off/Steady")
P_51D:definePushButton("REC_LTS_KEY", 14, 3024, 111, "Right Switch Panel", "Recognition Lights Key")
P_51D:definePushButton("CIRC_PRO_RST", 14, 3025, 112, "Right Switch Panel", "Circuit Protectors Reset")
P_51D:definePotentiometer("RT_FLRES_LT", 14, 3007, 100, { 0, 1 }, "Right Switch Panel", "Right Fluorescent Light")
P_51D:defineToggleSwitch("GUNSIGHT_ON_OFF", 1, 3004, 41, "K14 Gunsight", "Gunsight On/Off")
P_51D:defineToggleSwitch("RET_MASK_LVR", 1, 3006, 39, "K14 Gunsight", "Fixed Reticle Mask Lever")
P_51D:defineTumb(
	"GUNSIGHT_FIXED_GYRO",
	1,
	3016,
	40,
	0.1,
	{ 0, 0.2 },
	nil,
	false,
	"K14 Gunsight",
	"Fixed Fixed-Gyro Gyro"
)
P_51D:definePotentiometer("GUNSIGHT_BRT", 1, 3005, 42, { 0, 1 }, "K14 Gunsight", "Gun Sight Brightness")
P_51D:definePotentiometer("WING_SPAN_SEL", 1, 3001, 35, { 0, 1 }, "K14 Gunsight", "Wing Span Selector")
P_51D:defineToggleSwitch("HYD_REL", 3, 3001, 79, "Hydraulic System", "Hydraulic Release Knob")
P_51D:defineTumb("RKT_REL_MODE", 4, 3007, 73, 0.1, { 0, 0.2 }, nil, false, "Weapon Control", "Rockets Release Mode")
P_51D:defineToggleSwitch("RKT_DEL_SWITCH", 4, 3008, 74, "Weapon Control", "Rockets Delay Switch")
P_51D:defineToggleSwitch("LFT_PYLOD_SLVO", 4, 3003, 132, "Weapon Control", "Left Payload Salvo")
P_51D:defineToggleSwitch("RT_PYLOD_SLVO", 4, 3004, 133, "Weapon Control", "Right Payload Salvo")
P_51D:defineToggleSwitch("COOLANT_CONTROL_COVER", 5, 3003, 168, "Engine System", "Coolant Control Cover")
P_51D:defineTumb("COOLANT_CONTROL", 5, 3001, 87, 0.1, { 0, 0.3 }, nil, false, "Engine System", "Coolant Control")
P_51D:defineToggleSwitch("OIL_CONTROL_COVER", 5, 3004, 169, "Engine System", "Oil Control Cover")
P_51D:defineTumb("OIL_CONTROL", 5, 3002, 88, 0.1, { 0, 0.3 }, nil, false, "Engine System", "Oil Control")
P_51D:definePotentiometer("CARB_COLD_AIR", 5, 3007, 134, { 0, 1 }, "Engine System", "Carburetor Cold Air Control")
P_51D:definePotentiometer("CARB_WARM_AIR", 5, 3027, 135, { 0, 1 }, "Engine System", "Carburetor Warm Air Control")
P_51D:defineTumb("MIXTURE_CONTROL", 5, 3019, 47, 0.1, { 0, 0.2 }, nil, false, "Engine System", "Mixture Control")
P_51D:definePotentiometer("THROTTLE", 5, 3021, 43, { 0.0, 0.9 }, "Engine System", "Throttle")
P_51D:definePotentiometer("PROPELLER_RPM", 5, 3022, 46, { 0, 1 }, "Engine System", "Propeller RPM")
P_51D:definePotentiometer("LOCK_THROTTLE", 5, 3012, 48, { 0, 1 }, "Engine System", "Lock Throttle")
P_51D:definePotentiometer("LOCK_PROPELLER_MIXTURE", 5, 3014, 49, { 0, 1 }, "Engine System", "Lock Propeller & Mixture")
P_51D:definePushButton("MICROPHONE_ON", 6, 3001, 44, "Cockpit Mechanical", "Microphone On")
P_51D:defineToggleSwitch("ARM_REST", 6, 3009, 200, "Cockpit Mechanical", "Arm rest")
P_51D:definePotentiometer("CANOPY_HAND_CRANK", 6, 3002, 147, { -6, 6 }, "Cockpit Mechanical", "Canopy Hand Crank")
P_51D:defineToggleSwitch(
	"CANOPY_EMERGENCY_RELEASE_HANDLE",
	6,
	3003,
	149,
	"Cockpit Mechanical",
	"Canopy Emergency Release Handle"
)
P_51D:defineToggleSwitch("OXYGEN_AUTO_MIX", 7, 3003, 131, "Oxygen System", "Auto-Mix On-Off")
P_51D:defineToggleSwitch("OXYGEN_BYPASS", 7, 3001, 130, "Oxygen System", "Oxygen Emergency By-pass")
P_51D:defineFloat("PANEL_LIGHTS", 165, { 0, 1 }, "Light System", "Panel Background Lighting (green)")
P_51D:defineMultipositionSwitch("FUEL_SELECTOR_VALVE", 9, 3001, 85, 5, 0.1, "Fuel System", "Fuel Selector Valve")
P_51D:defineToggleSwitch("FUEL_SHUT_OFF_VALVE", 9, 3005, 86, "Fuel System", "Fuel Shut-Off Valve")
P_51D:definePotentiometer("LEFT_FLUORESCENT_LIGHT", 10, 3002, 90, { 0, 1 }, "Light System", "Left Fluorescent Light")
P_51D:defineToggleSwitch("LANDING_LIGHT", 10, 3003, 89, "Light System", "Landing Light On/Off")
P_51D:defineIndicatorLight("LANDING_GEAR_GREEN", 80, "Light System", "Landing Gear Green Light (green)")
P_51D:defineIndicatorLight("LANDING_GEAR_RED", 82, "Light System", "Landing Gear Red Light (red)")
P_51D:definePotentiometer("DEFROSTER", 11, 3001, 157, { 0, 1 }, "Environment System", "Defroster")
P_51D:definePotentiometer("COLD_AIR", 11, 3002, 158, { 0, 1 }, "Environment System", "Cold Air")
P_51D:definePotentiometer("HOT_AIR", 11, 3003, 159, { 0, 1 }, "Environment System", "Hot Air")
P_51D:definePushButton("SAFE_LND_GEAR_LT_TEST", 12, 3018, 81, "Control System", "Safe Landing Gear Light Test")
P_51D:definePushButton("UNSAFE_LND_GEAR_LT_TEST", 12, 3007, 83, "Control System", "Unsafe Landing Gear Light Test")
P_51D:definePushButton("PARK_BRAKE_HANDLE", 12, 3005, 84, "Control System", "Parking Brake Handle")
P_51D:defineRotary("AILERON_TRIM", 12, 3008, 91, "Control System", "Aileron Trim")
P_51D:defineRotary("ELEVATOR_TRIM", 12, 3009, 92, "Control System", "Elevator Trim")
P_51D:defineRotary("RUDDER_TRIM", 12, 3010, 93, "Control System", "Rudder Trim")
P_51D:definePotentiometer("FLAPS_CONTROL_HANDLE", 12, 3001, 94, { 0, 1 }, "Control System", "Flaps Control Handle")
P_51D:defineToggleSwitch("LANDING_GEAR_CONTR0L_HANDLE", 12, 3003, 150, "Control System", "Landing Gear Control Handle")
P_51D:definePushButton("LOCK_STICK_FRWD_NEUT", 12, 3015, 173, "Control System", "Lock Stick Forward/Neutral")
P_51D:definePotentiometer("COCKPIT_LIGHTS", 13, 3001, 71, { 0, 1 }, "Front Switch Box", "Cockpit Lights")
P_51D:defineTumb(
	"IGNITION",
	13,
	3005,
	66,
	0.1,
	{ 0.0, 0.3 },
	nil,
	false,
	"Front Switch Box",
	"Ignition Off/Right/Left/Both"
)
P_51D:define3PosTumb("GUN_CONTROL", 13, 3007, 67, "Front Switch Box", "Gun/Camera Control")
P_51D:definePushButton(
	"SILENCE_GEAR_HORN",
	13,
	3008,
	72,
	"Front Switch Box",
	"Silence Landing Gear Warning Horn Cut Off"
)
P_51D:define3PosTumb("LEFT_BOMB_ARM_CHEM", 13, 3013, 69, "Front Switch Box", "Left Bomb Arm/Chemical Release")
P_51D:define3PosTumb("RIGHT_BOMB_ARM_CHEM", 13, 3014, 70, "Front Switch Box", "Right Bomb Arm/Chemical Release")
P_51D:defineTumb(
	"ROCKETS_BOMBS_MODES",
	13,
	3015,
	68,
	0.1,
	{ 0, 0.3 },
	nil,
	false,
	"Front Switch Box",
	"Rockets/Bombs Modes"
)
P_51D:defineToggleSwitch("SUPERCHARGER_SWITCH_COVER", 15, 3002, 58, "Engine Control Panel", "Supercharger Switch Cover")
P_51D:defineTumb(
	"SUPERCHARGER_AUTO_LOW_HIGH",
	15,
	3001,
	57,
	0.1,
	{ 0.0, 0.2 },
	nil,
	false,
	"Engine Control Panel",
	"Supercharger Auto/Low/High"
)
P_51D:definePushButton("HIGH_BLOWER_TEST_LAMP", 15, 3004, 60, "Engine Control Panel", "High Blower Lamp Test")
P_51D:defineIndicatorLight("HIGH_BLOWER_LAMP", 59, "Engine Control Panel", "High Blower Lamp (yellow)")
P_51D:defineToggleSwitch("FUEL_BOOSTER", 15, 3005, 61, "Engine Control Panel", "Fuel Booster On/Off")
P_51D:definePushButton("OIL_DILUTE", 15, 3013, 62, "Engine Control Panel", "Oil Dilute Activate")
P_51D:definePushButton("STARTER", 15, 3008, 63, "Engine Control Panel", "Starter Activate")
P_51D:defineToggleSwitch("STARTER_COVER", 15, 3009, 64, "Engine Control Panel", "Starter Switch Cover")
P_51D:definePushButton("PRIMER", 15, 3011, 65, "Engine Control Panel", "Primer Activate")
P_51D:defineFloat("AIRSPEED_NEEDLE", 11, { 0, 0.7 }, "Airspeed Indicator", "Airspeed Needle")
P_51D:defineRotary("SET_PRESSURE", 17, 3001, 26, "Altimeter", "Set Pressure")
P_51D:defineFloat("ALTIMETER_PRESSURE", 97, { 0, 1 }, "Altimeter", "Altimeter Pressure")
P_51D:defineFloat("ALTIMETER_100_FOOT", 25, { 0, 1 }, "Altimeter", "Altimeter 100 Foot")
P_51D:defineFloat("ALTIMETER_1000_FOOT", 24, { 0, 1 }, "Altimeter", "Altimeter 1000 Foot")
P_51D:defineFloat("ALTIMETER_10000_FOOT", 96, { 0, 1 }, "Altimeter", "Altimeter 10000 Foot")
P_51D:defineFloat("VARIOMETER_VVI", 29, { -0.6, 0.6 }, "Variometer", "Variometer-VVI")
P_51D:defineFloat("AHORIZON_BANK", 14, { 1, -1 }, "Artificial Horizon", "Artificial Horizon - Bank")
P_51D:defineFloat("AHORIZON_PITCH", 15, { 1, -1 }, "Artificial Horizon", "Artificial Horizon - Pitch")
P_51D:defineFloat("AHORIZON_PITCH_SHIFT", 16, { -1, 1 }, "Artificial Horizon", "Artificial Horizon - Pitch Shift")
P_51D:defineFloat("AHORIZON_CAGED", 20, { 0, 1 }, "Artificial Horizon", "Artificial Horizon - Caged")
P_51D:defineRotary("PITCH_ADJUST", 19, 3002, 17, "Artificial Horizon", "Pitch Adjustment")
P_51D:definePushButton("CAGE_BUTTON", 19, 3001, 19, "Artificial Horizon", "Artificial Horizon Cage")
P_51D:definePotentiometer(
	"CAGE_ROTARY",
	19,
	3003,
	18,
	{ 0, 0.14 },
	"Artificial Horizon",
	"Artificial Horizon Cage Rotary"
)
P_51D:defineFloat("DIRECTIONAL_GYRO", 12, { 0, 1 }, "Directional Gyro", "Directional Gyro Heading")
P_51D:definePushButton("HDG_CAGE_BUTTON", 20, 3003, 179, "Directional Gyro", "Directional Gyro Cage")
P_51D:defineRotary("HDG_CAGE_ROTARY", 20, 3001, 13, "Directional Gyro", "Directional Gyro Heading Set")
P_51D:defineFloat("TURN_INDICATOR", 27, { -1, 1 }, "Turn Indicator", "Turn Indicator")
P_51D:defineFixedStepTumb(
	"CLOCK_ADJUST_BUTTON",
	22,
	3001,
	8,
	1,
	{ 0, 1 },
	{ -1, 1 },
	nil,
	"Clock",
	"Clock Adjust Button"
)
P_51D:defineRotary("CLOCK_ADJUST", 22, 3002, 7, "Clock", "Clock Adjust")
P_51D:defineFloat("CLOCK_HOURS", 4, { 0, 1.0 }, "Clock", "Clock Hours")
P_51D:defineFloat("CLOCK_MINUTES", 5, { 0, 1.0 }, "Clock", "Clock Minutes")
P_51D:defineFloat("CLOCK_SECONDS", 6, { 0, 1.0 }, "Clock", "Clock Seconds")
P_51D:defineRotary("REMOTE_COMPASS_SET", 23, 3001, 3, "Remote Compass", "Course Set")
P_51D:defineFloat("REMOTE_COMPASS_HDG", 1, { 0, 1 }, "Remote Compass", "Remote Compass Heading")
P_51D:defineFloat("REMOTE_COMPASS_CRS", 2, { 0, 1 }, "Remote Compass", "Remote Compass Course")
P_51D:definePushButton("VHF_RADIO_ON_OFF", 24, 3001, 117, "VHF Radio", "VHF Radio On/Off")
P_51D:definePushButton("VHF_RADIO_CHAN_A", 24, 3002, 118, "VHF Radio", "VHF Radio Channel A")
P_51D:definePushButton("VHF_RADIO_CHAN_B", 24, 3003, 119, "VHF Radio", "VHF Radio Channel B")
P_51D:definePushButton("VHF_RADIO_CHAN_C", 24, 3004, 120, "VHF Radio", "VHF Radio Channel C")
P_51D:definePushButton("VHF_RADIO_CHAN_D", 24, 3005, 121, "VHF Radio", "VHF Radio Channel D")
P_51D:defineToggleSwitch("RADIO_LIGHTS_DIMMER", 24, 3006, 127, "VHF Radio", "Radio Lights Dimmer")
P_51D:definePotentiometer("RADIO_VOLUME", 24, 3015, 116, { 0, 1 }, "VHF Radio", "Radio Audio Volume ")
P_51D:defineToggleSwitch("VHF_LOCKING_LEVER", 24, 3017, 129, "VHF Radio", "Switch Locking Lever")
P_51D:defineFixedStepTumb("RADIO_MODE2", 24, 3021, 128, 1, { -1, 1 }, { -1, 1 }, nil, "VHF Radio", "Radio Mode2")
P_51D:defineFixedStepTumb("RADIO_MODE3", 24, 3008, 128, 1, { -1, 1 }, { -1, 1 }, nil, "VHF Radio", "Radio Mode3")
P_51D:defineIndicatorLight("VHF_RADIO_A_LIGHT", 122, "VHF Radio", "VHF Radio A Light (green)")
P_51D:defineIndicatorLight("VHF_RADIO_B_LIGHT", 123, "VHF Radio", "VHF Radio B Light (green)")
P_51D:defineIndicatorLight("VHF_RADIO_C_LIGHT", 124, "VHF Radio", "VHF Radio C Light (green)")
P_51D:defineIndicatorLight("VHF_RADIO_D_LIGHT", 125, "VHF Radio", "VHF Radio D Light (green)")
P_51D:defineIndicatorLight("VHF_RADIO_TX_LIGHT", 126, "VHF Radio", "VHF Radio TX Light (white)")
P_51D:defineToggleSwitch("WARNING_RADAR_POWER", 25, 3001, 114, "Tail Warning Radar", "Tail Warning Radar Power")
P_51D:definePushButton("WARNING_RADAR_TEST", 25, 3003, 115, "Tail Warning Radar", "Tail Warning Radar Test")
P_51D:definePotentiometer(
	"WARNING_RADAR_LIGHT",
	25,
	3004,
	113,
	{ 0, 1 },
	"Tail Warning Radar",
	"Tail Warning Radar Light Control"
)
P_51D:defineIndicatorLight("RADAR_WARNING_LIGHT", 161, "Tail Warning Radar", "Radar Warning Light (yellow)")
P_51D:definePotentiometer("DETROLA_FREQUENCY", 26, 3004, 137, { 0, 1 }, "Detrola", "Detrola Frequency Selector")
P_51D:definePotentiometer("DETROLA_VOLUME", 26, 3001, 138, { 0, 1 }, "Detrola", "Detrola Volume")
P_51D:defineToggleSwitch("OFF_POWER", 27, 3001, 140, "IFF", "IFF Power On/Off")
P_51D:defineToggleSwitch("IFF_DISTRESS", 27, 3005, 143, "IFF", "IFF Distress Signal On/Off")
P_51D:defineToggleSwitch("IFF_DET_CIRCUIT", 27, 3004, 142, "IFF", "IFF Detonator Circuit On/Off")
P_51D:definePushButton("IFF_DET_LEFT", 27, 3007, 145, "IFF", "IFF Detonator Left")
P_51D:definePushButton("IFF_DET_RIGHT", 27, 3008, 146, "IFF", "IFF Detonator Right")
P_51D:define3PosTumb("IFF_TIME_OFF_ON", 27, 3003, 141, "IFF", "IFF Time/Off/On")
P_51D:defineTumb("IFF_CODE", 27, 3016, 139, 0.1, { 0, 0.5 }, nil, false, "IFF", "IFF Code 1-6")
P_51D:defineToggleSwitch("HOMING_ADAPTER_POWER", 28, 3004, 153, "Homing Adapter", "Homing Adapter CW/MCW Switch")
P_51D:definePushButton("HOMING_ADAPTER_CB", 28, 3003, 154, "Homing Adapter", "Homing Adapter Circuit Breaker")
P_51D:defineTumb(
	"HOMING_ADAPTER_MODE",
	28,
	3001,
	152,
	0.1,
	{ 0, 0.2 },
	nil,
	false,
	"Homing Adapter",
	"Homing Adapter Mode Switch"
)
P_51D:defineFloat("ACCELEROMETER_MAIN", 175, { 0, 1 }, "Accelerometer", "Accelerometer Main")
P_51D:defineFloat("ACCELEROMETER_MIN", 177, { 0, 1 }, "Accelerometer", "Accelerometer Min")
P_51D:defineFloat("ACCELEROMETER_MAX", 178, { 0, 1 }, "Accelerometer", "Accelerometer Max")
P_51D:definePushButton("ACCELEROMETER_RST", 30, 3001, 176, "Accelerometer", "G-meter Reset")
P_51D:defineFloat("ENGINE_RPM", 23, { 0, 1 }, "Engine System", "Engine RPM")
P_51D:defineFloat("FUEL_PRESSURE", 32, { 0, 1 }, "Fuel System", "Fuel Pressure")
P_51D:defineFloat("HYDRAULIC_PRESSURE", 78, { 0, 1 }, "Hydraulic System", "Hydraulic Pressure")
P_51D:defineFloat("MANIFOLD_PRESSURE", 10, { 0, 1 }, "Engine System", "Manifold Pressure")
P_51D:defineFloat("ROCKET_COUNTER", 77, { 0, 1 }, "Weapon System", "Rocket Counter")
P_51D:defineFloat("VACUUM_SUCTION", 9, { 0, 1 }, "Engine System", "Vacuum System")
P_51D:defineFloat("CARB_TEMP", 21, { -0, 1 }, "Engine System", "Carburetor Temperature")
P_51D:defineFloat("COOLANT_TEMP", 22, { 0, 1 }, "Engine System", "Coolant Temperature")
P_51D:defineFloat("OIL_TEMP", 30, { 0, 1.0 }, "Engine System", "Oil Temperature")
P_51D:defineFloat("OIL_PRES", 31, { 0, 1.0 }, "Engine System", "Oil Pressure")
P_51D:defineFloat("AMMETER", 101, { 0, 1 }, "Electric System", "Ammeter")
P_51D:defineFloat("WINDSHIELD_OIL", 147, { 0, 1 }, "Environment System", "Windshield Oil")
P_51D:defineFloat("OXYGEN_PRES", 34, { 0, 1 }, "Oxygen System", "Oxygen Pressure")
P_51D:defineFloat("OXYGEN_FLOW", 33, { 0, 1 }, "Oxygen System", "Oxygen Flow Blinker")
P_51D:defineFloat("SLIPBALL", 28, { -1, 1 }, "Turn Indicator", "Slipball")
P_51D:defineFloat("FUEL_TANK_LEFT", 155, { 0, 1 }, "Fuel System", "Fuel Tank Left")
P_51D:defineFloat("FUEL_TANK_RIGHT", 156, { 0, 1 }, "Fuel System", "Fuel Tank Right")
P_51D:defineFloat("FUEL_TANK_FUSELAGE", 160, { 0, 1 }, "Fuel System", "Fuel Tank Fuselage")

--Externals
P_51D:defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Left Position Light (red)")
P_51D:defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Right Position Light (green)")
P_51D:defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Tail Position Light (white)")
P_51D:defineIntegerFromGetter("EXT_RECOC_LIGHT_RD", function()
	if LoGetAircraftDrawArgumentValue(200) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Red Recognition Light (red)")
P_51D:defineIntegerFromGetter("EXT_RECOC_LIGHT_GN", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Green Recognition Light (green)")
P_51D:defineIntegerFromGetter("EXT_RECOC_LIGHT_YE", function()
	if LoGetAircraftDrawArgumentValue(202) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Amber Recognition Light (yellow)")

--[[--Gauge Values--]]
--
local function getAirspeed()
	local returnValue = (GetDevice(0):get_argument_value(11)) * 1000
	return returnValue
end
P_51D:defineIntegerFromGetter("AIRSPEED_MPH_VALUE", getAirspeed, 65000, "Gauge Values", "Airspeed MPH")

local function getAltitude()
	local returnValue = (GetDevice(0):get_argument_value(96)) * 100000
	return returnValue
end
P_51D:defineIntegerFromGetter("ALTIMETER_VALUE", getAltitude, 65000, "Gauge Values", "Altimeter")

local function getEngineRPM()
	local returnValue = (GetDevice(0):get_argument_value(23)) * 4500
	return returnValue
end
P_51D:defineIntegerFromGetter("ENGINE_RPM_VALUE", getEngineRPM, 65000, "Gauge Values", "Engine RPM Value")

local function getGyro()
	local returnValue = (GetDevice(0):get_argument_value(12)) * 360
	return returnValue
end
P_51D:defineIntegerFromGetter("DIRECTIONAL_GYRO_VALUE", getGyro, 65000, "Gauge Values", "Directional Gyro")

local function getHDG()
	local returnValue = (GetDevice(0):get_argument_value(1)) * 360
	return returnValue
end
P_51D:defineIntegerFromGetter("HEADING_VALUE", getHDG, 65000, "Gauge Values", "Remote Compass Heading")

local function getCRS()
	local returnValue = (GetDevice(0):get_argument_value(2)) * 360
	return returnValue
end
P_51D:defineIntegerFromGetter("COURSE_VALUE", getCRS, 65000, "Gauge Values", "Remote Compass Course")

local function getFuelPres()
	local returnValue = (GetDevice(0):get_argument_value(32)) * 25
	return returnValue
end
P_51D:defineIntegerFromGetter("FUEL_PRESSURE_VALUE", getFuelPres, 65000, "Gauge Values", "Fuel Pressure")

local function getHydPres()
	local returnValue = (GetDevice(0):get_argument_value(78)) * 2000
	return returnValue
end
P_51D:defineIntegerFromGetter("HYDRAULIC_PRESSURE_VALUE", getHydPres, 65000, "Gauge Values", "Hydraulic Pressure")

local function getManifoldPres()
	local returnValue = (GetDevice(0):get_argument_value(10)) * 65 + 10
	return returnValue
end
P_51D:defineIntegerFromGetter("MANIFOLD_PRESSURE_VALUE", getManifoldPres, 65000, "Gauge Values", "Manifold Pressure")

local function getVacuum()
	local returnValue = (GetDevice(0):get_argument_value(9)) * 100
	return returnValue
end
P_51D:defineIntegerFromGetter(
	"VACUUM_SUCTION_VALUE",
	getVacuum,
	65000,
	"Gauge Values",
	"Vacuum Suction read as X.X or XX.X"
)

local function getOilTemp()
	local returnValue = (GetDevice(0):get_argument_value(30)) * 100
	return returnValue
end
P_51D:defineIntegerFromGetter("OIL_TEMPERATURE_VALUE", getOilTemp, 65000, "Gauge Values", "Oil Temperature")

local function getOilPres()
	local returnValue = (GetDevice(0):get_argument_value(31)) * 200
	return returnValue
end
P_51D:defineIntegerFromGetter("OIL_PRESSURE_VALUE", getOilPres, 65000, "Gauge Values", "Oil Pressure")

local function getAmps()
	local returnValue = (GetDevice(0):get_argument_value(101)) * 150
	return returnValue
end
P_51D:defineIntegerFromGetter("AMMETER_VALUE", getAmps, 65000, "Gauge Values", "Ammeter")

local function getOxygen()
	local returnValue = (GetDevice(0):get_argument_value(34)) * 500
	return returnValue
end
P_51D:defineIntegerFromGetter("OXYGEN_PRESSURE_VALUE", getOxygen, 65000, "Gauge Values", "Oxygen Pressure")

local function getLeftFuel()
	local returnValue = (GetDevice(0):get_argument_value(155)) * 92
	return returnValue
end
P_51D:defineIntegerFromGetter("LEFT_FUEL_TANK_VALUE", getLeftFuel, 65000, "Gauge Values", "Left Fuel Tank Gallons")

local function getRightFuel()
	local returnValue = (GetDevice(0):get_argument_value(156)) * 92
	return returnValue
end
P_51D:defineIntegerFromGetter("RIGHT_FUEL_TANK_VALUE", getRightFuel, 65000, "Gauge Values", "Right Fuel Tank Gallons")

local function getFuseFuel()
	local returnValue = (GetDevice(0):get_argument_value(160)) * 85
	return returnValue
end
P_51D:defineIntegerFromGetter(
	"FUSELAGE_FUEL_TANK_VALUE",
	getFuseFuel,
	65000,
	"Gauge Values",
	"Fuselage Fuel Tank Gallons"
)

local function getBaro()
	local returnValue = (GetDevice(0):get_argument_value(97)) * 290 + 2810
	return returnValue
end
P_51D:defineIntegerFromGetter("BAROMETRIC_PRESSURE_VALUE", getBaro, 65000, "Gauge Values", "Barometric Pressure")

local function getAccel()
	local returnValue = (GetDevice(0):get_argument_value(175)) * 17 - 5
	return returnValue
end
P_51D:defineIntegerFromGetter("ACCELEROMETER_VALUE", getAccel, 65000, "Gauge Values", "Accelerometer")

P_51D:defineIndicatorLight("WINDSHIELD_OIL_L", 412, "Damage", "Windshield Oil Splashes (black)")
P_51D:defineFloat("WINDSHIELD_CRACKS", 413, { 0, 1 }, "Damage", "Windshield Crack Holes")

P_51D:defineIntegerFromGetter("EXT_WOW_TAIL", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")

P_51D:defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")

P_51D:defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

P_51D:defineIntegerFromGetter("EXT_LANDING_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then
		return 1
	else
		return 0
	end
end, 1, "External Aircraft Model", "Landing Light (white)")

P_51D:defineFloat("CANOPY_POS", 162, { 0, 1 }, "Cockpit Mechanical", "Canopy Position")
P_51D:defineRadioWheel(
	"RKT_COUNT_CON",
	4,
	3009,
	3010,
	{ -1 / 11, 1 / 11 },
	75,
	1 / 11,
	{ 0, 1.0 },
	nil,
	"Weapon Control",
	"Rockets Counter Control"
)
P_51D:defineFloat("AILERON_TRIM_G", 170, { -1, 1 }, "Control System", "Aileron Trim Gauge")
P_51D:defineFloat("RUDDER_TRIM_G", 172, { -1, 1 }, "Control System", "Rudder Trim Gauge")
P_51D:defineFloat("ELEVATOR_TRIM_G", 171, { -1, 1 }, "Control System", "Elevator Trim Gauge")
P_51D:defineFloat("CONTR_LOCK_BRACK", 174, { 0, 1 }, "Control System", "Control Lock Bracket")
P_51D:defineFloat("INT_L_LIGHTS", 185, { 0, 1 }, "Light System", "Internal Lighting Left (white)")
P_51D:defineFloat("INT_R_LIGHTS", 186, { 0, 1 }, "Light System", "Internal Lighting Right (white)")

return P_51D
