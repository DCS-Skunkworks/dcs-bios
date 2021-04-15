BIOS.protocol.beginModule("P-51D", 0x5000)
BIOS.protocol.setExportModuleAircrafts({"P-51D", "TF-51D", "P-51D-30-NA"})

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
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineRadioWheel = BIOS.util.defineRadioWheel

defineToggleSwitch("GEN", 14, 3003, 102, "Right Switch Panel", "Generator")
defineToggleSwitch("BAT", 14, 3001, 103, "Right Switch Panel", "Battery")
defineToggleSwitch("GUN_HEAT", 14, 3019, 104, "Right Switch Panel", "Gun Heating")
defineToggleSwitch("PITOT", 14, 3005, 105, "Right Switch Panel", "Pitot Heating")
defineTumb("WING_LTS", 14, 3008, 106, 1, {-1,1}, nil, false, "Right Switch Panel", "Wing Position Lights Bright/Off/Dim")
defineTumb("TAIL_LTS", 14, 3009, 107, 1, {-1,1}, nil, false, "Right Switch Panel", "Tail Position Lights Bright/Off/Dim")
defineTumb("RED_REC_LT", 14, 3021, 108, 1, {-1,1}, nil, false, "Right Switch Panel", "Red Recognition Light Key/Off/Steady")
defineTumb("GRN_REC_LT", 14, 3022, 109, 1, {-1,1}, nil, false, "Right Switch Panel", "Green Recognition Light Key/Off/Steady")
defineTumb("AMBR_REC_LT", 14, 3023, 110, 1, {-1,1}, nil, false, "Right Switch Panel", "Amber Recognition Light Key/Off/Steady")
definePushButton("REC_LTS_KEY", 14, 3024, 111, "Right Switch Panel", "Recognition Lights Key")
definePushButton("CIRC_PRO_RST", 14, 3025, 112, "Right Switch Panel", "Circuit Protectors Reset")
definePotentiometer("RT_FLRES_LT", 14, 3007, 100, {0, 1}, "Right Switch Panel", "Right Fluorescent Light")
defineToggleSwitch("GUNSIGHT_ON_OFF", 1, 3004, 41, "K14 Gunsight", "Gunsight On/Off")
defineToggleSwitch("RET_MASK_LVR", 1, 3006, 39, "K14 Gunsight", "Fixed Reticle Mask Lever")
defineTumb("GUNSIGHT_FIXED_GYRO", 1, 3016, 40, 0.1, {0.0, 0.2}, nil, false, "K14 Gunsight", "Fixed Fixed-Gyro Gyro")
definePotentiometer("GUNSIGHT_BRT", 1, 3005, 42, {0, 1}, "K14 Gunsight", "Gun Sight Brightness")
definePotentiometer("WING_SPAN_SEL", 1, 3001, 35, {0, 1}, "K14 Gunsight", "Wing Span Selector")
defineToggleSwitch("HYD_REL", 3, 3001, 79, "Hydraulic System", "Hydraulic Release Knob")
defineTumb("RKT_REL_MODE", 4, 3007, 73, 0.1,  {0.0, 0.2}, nil, false, "Weapon Control", "Rockets Release Mode")
defineToggleSwitch("RKT_DEL_SWITCH", 4, 3008, 74, "Weapon Control", "Rockets Delay Switch")
defineToggleSwitch("LFT_PYLOD_SLVO", 4, 3003, 132, "Weapon Control", "Left Payload Salvo")
defineToggleSwitch("RT_PYLOD_SLVO", 4, 3004, 133, "Weapon Control", "Right Payload Salvo")
defineToggleSwitch("COOLANT_CONTROL_COVER", 5, 3003, 168, "Engine System", "Coolant Control Cover")
defineTumb("COOLANT_CONTROL", 5, 3001, 87, 0.1, {0.0, 0.3}, nil, false, "Engine System", "Coolant Control")
defineToggleSwitch("OIL_CONTROL_COVER", 5, 3004, 169, "Engine System", "Oil Control Cover")
defineTumb("OIL_CONTROL", 5, 3002, 88, 0.1, {0.0, 0.3}, nil, false, "Engine System", "Oil Control")
definePotentiometer("CARB_COLD_AIR", 5, 3007, 134, {0, 1}, "Engine System", "Carburetor Cold Air Control")
definePotentiometer("CARB_WARM_AIR", 5, 3027, 135, {0, 1}, "Engine System", "Carburetor Warm Air Control")
defineTumb("MIXTURE_CONTROL", 5, 3019, 47, 0.1,  {0.0, 0.2}, nil, false, "Engine System", "Mixture Control")
definePotentiometer("THROTTLE", 5, 3021, 43, {0.0, 0.9}, "Engine System", "Throttle")
definePotentiometer("PROPELLER_RPM", 5, 3022, 46, {0, 1}, "Engine System", "Propeller RPM")
definePotentiometer("LOCK_THROTTLE", 5, 3012, 48, {0, 1}, "Engine System", "Lock Throttle")
definePotentiometer("LOCK_PROPELLER_MIXTURE", 5, 3014, 49, {0, 1}, "Engine System", "Lock Propeller & Mixture")
definePushButton("MICROPHONE_ON", 6, 3001, 44, "Cockpit Mechanical", "Microphone On")
defineToggleSwitch("ARM_REST", 6, 3009, 200, "Cockpit Mechanical", "Arm rest")
definePotentiometer("CANOPY_HAND_CRANK", 6, 3002, 147, {-6, 6}, "Cockpit Mechanical", "Canopy Hand Crank")
defineToggleSwitch("CANOPY_EMERGENCY_RELEASE_HANDLE", 6, 3003,149, "Cockpit Mechanical", "Canopy Emergency Release Handle")
defineToggleSwitch("OXYGEN_AUTO_MIX", 7, 3003, 131, "Oxygen System", "Auto-Mix On-Off")					 
defineToggleSwitch("OXYGEN_BY-PASS", 7, 3001, 130, "Oxygen System", "Oxygen Emergency By-pass")
defineIndicatorLight("OXYGEN_WARNING", 84, "Oxygen System", "Oxygen Warning Light")
defineMultipositionSwitch("FUEL_SELECTOR_VALVE", 9, 3001, 85, 5, 0.1, "Fuel System", "Fuel Selector Valve")
defineToggleSwitch("FUEL_SHUT_OFF_VALVE", 9, 3005, 86, "Fuel System", "Fuel Shut-Off Valve")
definePotentiometer("LEFT_FLUORESCENT_LIGHT", 10, 3002, 90, {0, 1}, "Light System", "Left Fluorescent Light")
defineToggleSwitch("LANDING_LIGHT", 10, 3003, 89, "Light System", "Landing Light On/Off")
defineIndicatorLight("LANDING_GEAR_GREEN", 80, "Light System", "Landing Gear Green Light (green)")
defineIndicatorLight("LANDING_GEAR_RED", 82, "Light System", "Landing Gear Red Light (red)")
definePotentiometer("DEFROSTER", 11, 3001, 157, {0, 1}, "Environment System", "Defroster")
definePotentiometer("COLD_AIR", 11, 3002, 158, {0, 1}, "Environment System", "Cold Air")
definePotentiometer("HOT_AIR", 11, 3003, 159, {0, 1}, "Environment System", "Hot Air")
definePushButton("SAFE_LND_GEAR_LT_TEST", 12, 3018, 81, "Control System", "Safe Landing Gear Light Test")
definePushButton("UNSAFE_LND_GEAR_LT_TEST", 12, 3007, 83, "Control System", "Unsafe Landing Gear Light Test")
definePushButton("PARK_BRAKE_HANDLE", 12, 3005, 84, "Control System", "Parking Brake Handle")
defineRotary("AILERON_TRIM", 12, 3008, 91, "Control System", "Aileron Trim")
defineRotary("ELEVATOR_TRIM", 12, 3009, 92, "Control System", "Elevator Trim")
defineRotary("RUDDER_TRIM", 12, 3010, 93, "Control System", "Rudder Trim")
definePotentiometer("FLAPS_CONTROL_HANDLE", 12, 3001, 94, {0, 1}, "Control System", "Flaps Control Handle")
defineToggleSwitch("LANDING_GEAR_CONTR0L_HANDLE", 12, 3003, 150, "Control System", "Landing Gear Control Handle")
definePushButton("LOCK_STICK_FRWD_NEUT", 12, 3015, 173, "Control System", "Lock Stick Forward/Neutral")
definePotentiometer("COCKPIT_LIGHTS", 13, 3001, 71, {0, 1}, "Front Switch Box", "Cockpit Lights")
defineTumb("IGNITION", 13, 3005, 66, 0.1, {0.0 ,0.3}, nil, false, "Front Switch Box", "Ignition Off/Right/Left/Both")
defineTumb("GUN_CONTROL", 13, 3007, 67, 1, {-1, 1}, nil, false, "Front Switch Box", "Gun/Camera Control")
definePushButton("SILENCE_GEAR_HORN", 13, 3008, 72, "Front Switch Box", "Silence Landing Gear Warning Horn Cut Off")
defineTumb("LEFT_BOMB_ARM_CHEM", 13, 3013, 69, 1,  {-1, 1}, nil, false, "Front Switch Box", "Left Bomb Arm/Chemical Release")
defineTumb("RIGHT_BOMB_ARM_CHEM", 13, 3014, 70, 1,  {-1, 1}, nil, false, "Front Switch Box", "Right Bomb Arm/Chemical Release")
defineTumb("ROCKETS_BOMBS_MODES", 13, 3015, 68, 0.1,  {0.0, 0.3}, nil, false, "Front Switch Box", "Rockets/Bombs Modes")
defineToggleSwitch("SUPERCHARGER_SWITCH_COVER", 15, 3002, 58, "Engine Control Panel", "Supercharger Switch Cover")
defineTumb("SUPERCHARGER_AUTO_LOW_HIGH", 15, 3001, 57, 0.1, {0.0,0.2}, nil, false, "Engine Control Panel", "Supercharger Auto/Low/High")
definePushButton("HIGH_BLOWER_TEST_LAMP", 15, 3004, 60, "Engine Control Panel", "High Blower Lamp Test")
defineIndicatorLight("HIGH_BLOWER_LAMP", 59, "Engine Control Panel", "High Blower Lamp")
defineToggleSwitch("FUEL_BOOSTER", 15, 3005, 61, "Engine Control Panel", "Fuel Booster On/Off")
definePushButton("OIL_DILUTE", 15, 3013, 62, "Engine Control Panel", "Oil Dilute Activate")
definePushButton("STARTER", 15, 3008, 63, "Engine Control Panel", "Starter Activate")
defineToggleSwitch("STARTER_COVER", 15, 3009, 64, "Engine Control Panel", "Starter Switch Cover")
definePushButton("PRIMER", 15, 3011, 65, "Engine Control Panel", "Primer Activate")
defineFloat("AIRSPEED_NEEDLE", 11, {0, 1}, "Airspeed Indicator", "Airspeed Needle")
defineRotary("SET_PRESSURE", 17, 3001, 26, "Altimeter", "Set Pressure")
defineFloat("ALTIMETER_PRESSURE", 97, {0, 1}, "Altimeter", "Altimeter Pressure")
defineFloat("ALTIMETER_100_FOOT", 25, {0, 1}, "Altimeter", "Altimeter 100 Foot")
defineFloat("ALTIMETER_1000_FOOT", 24, {0, 1}, "Altimeter", "Altimeter 1000 Foot")
defineFloat("ALTIMETER_10000_FOOT", 96, {0, 1}, "Altimeter", "Altimeter 10000 Foot")
defineFloat("VARIOMETER_VVI", 29, {-0.6, 0.6}, "Variometer", "Variometer-VVI")
defineFloat("AHORIZON_BANK", 14, {1.0, -1.0}, "Artificial Horizon", "Artificial Horizon - Bank")
defineFloat("AHORIZON_PITCH", 15, {1.0, -1.0}, "Artificial Horizon", "Artificial Horizon - Pitch")
defineFloat("AHORIZON_PITCH_SHIFT", 16, {-1.0, 1.0}, "Artificial Horizon", "Artificial Horizon - Pitch Shift")
defineFloat("AHORIZON_CAGED", 20, {0.0, 1.0}, "Artificial Horizon", "Artificial Horizon - Caged")
defineRotary("PITCH_ADJUST", 19, 3002, 17, "Artificial Horizon", "Pitch Adjustment")
definePushButton("CAGE_BUTTON", 19, 3001, 19, "Artificial Horizon", "Artificial Horizon Cage")
definePotentiometer("CAGE_ROTARY", 19, 3003, 18, {0, 0.14}, "Artificial Horizon", "Artificial Horizon Cage Rotary")
defineFloat("DIRECTIONAL_GYRO", 12, {0.0, 1.0}, "Directional Gyro", "Directional Gyro Heading")
definePushButton("HDG_CAGE_BUTTON", 20, 3003, 179, "Directional Gyro", "Directional Gyro Cage")
defineRotary("HDG_CAGE_ROTARY", 20, 3001, 13, "Directional Gyro", "Directional Gyro Heading Set")
defineFloat("TURN_INDICATOR", 27, {-1.0, 1.0}, "Turn Indicator", "Turn Indicator")
defineFixedStepTumb("CLOCK_ADJUST_BUTTON", 22, 3001, 8, 1, {0, 1}, {-1, 1}, nil, "Clock", "Clock Adjust Button")
defineRotary("CLOCK_ADJUST", 22, 3002, 7, "Clock", "Clock Adjust")
defineFloat("CLOCK_HOURS", 4, {0, 1.0}, "Clock", "Clock Hours")
defineFloat("CLOCK_MINUTES", 5, {0, 1.0}, "Clock", "Clock Minutes")
defineFloat("CLOCK_SECONDS", 6, {0, 1.0}, "Clock", "Clock Seconds")
defineRotary("REMOTE_COMPASS_SET", 23, 3001, 3, "Remote Compass", "Course Set")
defineFloat("REMOTE_COMPASS_HDG", 1, {0.0, 1.0}, "Remote Compass", "Remote Compass Heading")
defineFloat("REMOTE_COMPASS_CRS", 2, {0.0, 1.0}, "Remote Compass", "Remote Compass Course")
definePushButton("VHF_RADIO_ON_OFF", 24, 3001, 117, "VHF Radio", "VHF Radio On/Off")
definePushButton("VHF_RADIO_CHAN_A", 24, 3002, 118, "VHF Radio", "VHF Radio Channel A")
definePushButton("VHF_RADIO_CHAN_B", 24, 3003, 119, "VHF Radio", "VHF Radio Channel B")
definePushButton("VHF_RADIO_CHAN_C", 24, 3004, 120, "VHF Radio", "VHF Radio Channel C")
definePushButton("VHF_RADIO_CHAN_D", 24, 3005, 121, "VHF Radio", "VHF Radio Channel D")
defineToggleSwitch("RADIO_LIGHTS_DIMMER", 24, 3006, 127, "VHF Radio", "Radio Lights Dimmer")
definePotentiometer("RADIO_VOLUME", 24, 3015, 116, {0, 1}, "VHF Radio", "Radio Audio Volume ")
defineToggleSwitch("VHF_LOCKING_LEVER", 24, 3017, 129, "VHF Radio", "Switch Locking Lever")
defineFixedStepTumb("RADIO_MODE2", 24, 3021, 128, 1, {-1,1}, {-1, 1}, nil, "VHF Radio", "Radio Mode2")
defineFixedStepTumb("RADIO_MODE3", 24, 3008, 128, 1, {-1,1}, {-1, 1}, nil, "VHF Radio", "Radio Mode3")
defineIndicatorLight("VHF_RADIO_A_LIGHT", 122, "VHF Radio", "VHF Radio A Light (green)")
defineIndicatorLight("VHF_RADIO_B_LIGHT", 123, "VHF Radio", "VHF Radio B Light (green)")
defineIndicatorLight("VHF_RADIO_C_LIGHT", 124, "VHF Radio", "VHF Radio C Light (green)")
defineIndicatorLight("VHF_RADIO_D_LIGHT", 125, "VHF Radio", "VHF Radio D Light (green)")
defineIndicatorLight("VHF_RADIO_TX_LIGHT", 126, "VHF Radio", "VHF Radio TX Light (white)")
defineToggleSwitch("WARNING_RADAR_POWER", 25, 3001, 114, "Tail Warning Radar", "Tail Warning Radar Power")
definePushButton("WARNING_RADAR_TEST", 25, 3003, 115, "Tail Warning Radar", "Tail Warning Radar Test")
definePotentiometer("WARNING_RADAR_LIGHT", 25, 3004, 113, {0, 1}, "Tail Warning Radar", "Tail Warning Radar Light Control")
defineIndicatorLight("RADAR_WARNING_LIGHT", 161, "Tail Warning Radar", "Radar Warning Light (yellow)")
definePotentiometer("DETROLA_FREQUENCY", 26, 3001, 137, {0, 1}, "Detrola", "Detrola Frequency Selector")
definePotentiometer("DETROLA_VOLUME", 26, 3002, 138, {0, 1}, "Detrola", "Detrola Volume")
defineToggleSwitch("OFF_POWER", 27, 3001, 140, "IFF", "IFF Power On/Off")
defineToggleSwitch("IFF_DISTRESS", 27, 3005, 143, "IFF", "IFF Distress Signal On/Off")
defineToggleSwitch("IFF_DET_CIRCUIT", 27, 3004, 142, "IFF", "IFF Detonator Circuit On/Off")
definePushButton("IFF_DET_LEFT", 27, 3007, 145, "IFF", "IFF Detonator Left")
definePushButton("IFF_DET_RIGHT", 27, 3008, 146, "IFF", "IFF Detonator Right")
defineTumb("IFF_TIME_OFF_ON", 27, 3003, 141, 1, {-1,1}, nil, false, "IFF", "IFF Time/Off/On")
defineTumb("IFF_CODE", 27, 3016, 139, 0.1, {0.0, 0.5}, nil, false, "IFF", "IFF Code 1-6")
defineToggleSwitch("HOMING_ADAPTER_POWER", 28, 3002, 153, "Homing Adapter", "Homing Adapter On/Off")
definePushButton("HOMING_ADAPTER_CB", 28, 3003, 154, "Homing Adapter", "Homing Adapter Circuit Breaker")
defineTumb("HOMING_ADAPTER_MODE", 28, 3005, 152, 0.1, {0.0, 0.2}, nil, false, "Homing Adapter", "Homing Adapter Mode")
defineFloat("ACCELEROMETER_MAIN", 175, {0.0, 1.0}, "Accelerometer", "Accelerometer Main")
defineFloat("ACCELEROMETER_MIN", 177, {0.0, 1.0}, "Accelerometer", "Accelerometer Min")
defineFloat("ACCELEROMETER_MAX", 178, {0.0, 1.0}, "Accelerometer", "Accelerometer Max")
definePushButton("ACCELEROMETER_RST", 30, 3001, 176, "Accelerometer", "G-meter Reset")
defineFloat("ENGINE_RPM", 23, {0.0, 1.0}, "Engine System", "Engine RPM")
defineFloat("FUEL_PRESSURE", 32, {0.0, 1.0}, "Fuel System", "Fuel Pressure")
defineFloat("HYDRAULIC_PRESSURE", 78, {0.0, 1.0}, "Hydraulic System", "Hydraulic Pressure")
defineFloat("MANIFOLD_PRESSURE", 10, {0.0, 1.0}, "Engine System", "Manifold Pressure")
defineFloat("ROCKET_COUNTER", 77, {0.0, 1.0}, "Weapon System", "Rocket Counter")
defineFloat("VACUUM_SUCTION", 9, {0.0, 1.0}, "Engine System", "Vacuum System")
defineFloat("CARB_TEMP", 21, {-0, 1}, "Engine System", "Carburetor Temperature")
defineFloat("COOLANT_TEMP", 22, {0, 1}, "Engine System", "Coolant Temperature")
defineFloat("OIL_TEMP", 30, {0, 1.0}, "Engine System", "Oil Temperature")
defineFloat("OIL_PRES", 31, {0, 1.0}, "Engine System", "Oil Pressure")
defineFloat("AMMETER", 101, {0.0, 1.0}, "Electric System", "Ammeter")
defineFloat("WINDSHIELD_OIL", 147, {0.0, 1.0}, "Environment System", "Windshield Oil")
defineFloat("OXYGEN_PRES", 34, {0.0, 1.0}, "Oxygen System", "Oxygen Pressure")
defineFloat("OXYGEN_FLOW", 33, {0.0, 1.0}, "Oxygen System", "Oxygen Flow Blinker")
defineFloat("SLIPBALL", 28, {-1.0, 1.0}, "Turn Indicator", "Slipball")
defineFloat("FUEL_TANK_LEFT", 155, {0.0, 1.0}, "Fuel System", "Fuel Tank Left")
defineFloat("FUEL_TANK_RIGHT", 156, {0.0, 1.0}, "Fuel System", "Fuel Tank Right")
defineFloat("FUEL_TANK_FUSELAGE", 160, {0.0, 1.0}, "Fuel System", "Fuel Tank Fuselage")

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
defineIntegerFromGetter("EXT_RECOC_LIGHT_RD", function()
	if LoGetAircraftDrawArgumentValue(200) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Red Recognition Light (red)")
defineIntegerFromGetter("EXT_RECOC_LIGHT_GN", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Green Recognition Light (green)")
defineIntegerFromGetter("EXT_RECOC_LIGHT_YE", function()
	if LoGetAircraftDrawArgumentValue(202) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Amber Recognition Light (yellow)")

--[[--Gauge Values--]]--

local function getAirspeed()
     local returnValue = (GetDevice(0):get_argument_value(11))*1000
     return returnValue
end
defineIntegerFromGetter("AIRSPEED_MPH_VALUE", getAirspeed, 65000, 
"Gauge Values", "Airspeed MPH")

local function getAltitude()
     local returnValue = (GetDevice(0):get_argument_value(96))*100000
     return returnValue
end
defineIntegerFromGetter("ALTIMETER_VALUE", getAltitude, 65000,
"Gauge Values", "Altimeter")

--[[--local function getVerticalVelocity()
     local returnValue = (GetDevice(0):get_argument_value(29))*10000

     return returnValue
end
defineIntegerFromGetter("VERTICAL_VELOCITY_VVI_VALUE", getVerticalVelocity, 65000,
"Gauge Values", "Vertical Velocity VVI")--]]--

local function getEngineRPM()
     local returnValue = (GetDevice(0):get_argument_value(23))*4500
     return returnValue
end
defineIntegerFromGetter("ENGINE_RPM_VALUE", getEngineRPM, 65000,
"Gauge Values", "Engine RPM Value")

local function getGyro()
     local returnValue = (GetDevice(0):get_argument_value(12))*360
     return returnValue
end
defineIntegerFromGetter("DIRECTIONAL_GYRO_VALUE", getGyro, 65000,
"Gauge Values", "Directional Gyro")

local function getHDG()
     local returnValue = (GetDevice(0):get_argument_value(1))*360
     return returnValue
end
defineIntegerFromGetter("HEADING_VALUE", getHDG, 65000,
"Gauge Values", "Remote Compass Heading")

local function getCRS()
     local returnValue = (GetDevice(0):get_argument_value(2))*360
     return returnValue
end
defineIntegerFromGetter("COURSE_VALUE", getCRS, 65000,
"Gauge Values", "Remote Compass Course")

local function getFuelPres()
     local returnValue = (GetDevice(0):get_argument_value(32))*25
     return returnValue
end
defineIntegerFromGetter("FUEL_PRESSURE_VALUE", getFuelPres, 65000,
"Gauge Values", "Fuel Pressure")

local function getHydPres()
     local returnValue = (GetDevice(0):get_argument_value(78))*2000
     return returnValue
end
defineIntegerFromGetter("HYDRAULIC_PRESSURE_VALUE", getHydPres, 65000,
"Gauge Values", "Hydraulic Pressure")

local function getManifoldPres()
     local returnValue = (GetDevice(0):get_argument_value(10))*65+10
     return returnValue
end
defineIntegerFromGetter("MANIFOLD_PRESSURE_VALUE", getManifoldPres, 65000, 
"Gauge Values", "Manifold Pressure")

local function getVacuum()
     local returnValue = (GetDevice(0):get_argument_value(9))*100
     return returnValue
end
defineIntegerFromGetter("VACUUM_SUCTION_VALUE", getVacuum, 65000,
"Gauge Values", "Vacuum Suction read as X.X or XX.X")

local function getOilTemp()
     local returnValue = (GetDevice(0):get_argument_value(30))*100
     return returnValue
end
defineIntegerFromGetter("OIL_TEMPERATURE_VALUE", getOilTemp, 65000,
"Gauge Values", "Oil Temperature")

local function getOilPres()
     local returnValue = (GetDevice(0):get_argument_value(31))*200
     return returnValue
end
defineIntegerFromGetter("OIL_PRESSURE_VALUE", getOilPres, 65000,
"Gauge Values", "Oil Pressure")

local function getAmps()
     local returnValue = (GetDevice(0):get_argument_value(101))*150
     return returnValue
end
defineIntegerFromGetter("AMMETER_VALUE", getAmps, 65000, 
"Gauge Values", "Ammeter")

local function getOxygen()
     local returnValue = (GetDevice(0):get_argument_value(34))*500
     return returnValue
end
defineIntegerFromGetter("OXYGEN_PRESSURE_VALUE", getOxygen, 65000,
"Gauge Values", "Oxygen Pressure")

local function getLeftFuel()
     local returnValue = (GetDevice(0):get_argument_value(155))*92
     return returnValue
end
defineIntegerFromGetter("LEFT_FUEL_TANK_VALUE", getLeftFuel, 65000,
"Gauge Values", "Left Fuel Tank Gallons")

local function getRightFuel()
     local returnValue = (GetDevice(0):get_argument_value(156))*92
     return returnValue
end
defineIntegerFromGetter("RIGHT_FUEL_TANK_VALUE", getRightFuel, 65000,
"Gauge Values", "Right Fuel Tank Gallons")

local function getFuseFuel()
     local returnValue = (GetDevice(0):get_argument_value(160))*85
     return returnValue
end
defineIntegerFromGetter("FUSELAGE_FUEL_TANK_VALUE", getFuseFuel, 65000,
"Gauge Values", "Fuselage Fuel Tank Gallons")

--[[--local function getCoolantTemp()
     local returnValue = (GetDevice(0):get_argument_value(22))*220-70
     return returnValue
end
defineIntegerFromGetter("COOLANT_TEMPERATURE_VALUE", getCoolantTemp, 65000,
"Gauge Values", "Coolant Temperature")--]]--

--[[--local function getCarbTemp()
     local returnValue = (GetDevice(0):get_argument_value(21))*220-70
     return returnValue
end
defineIntegerFromGetter("CARBURETOR_TEMPERATURE_VALUE", getCarbTemp, 65000,
"Gauge Values", "Carburetor Temperature")--]]--

local function getBaro()
     local returnValue = (GetDevice(0):get_argument_value(97))*290+2810
     return returnValue
end
defineIntegerFromGetter("BAROMETRIC_PRESSURE_VALUE", getBaro, 65000,
"Gauge Values", "Barometric Pressure")

local function getAccel()
     local returnValue = (GetDevice(0):get_argument_value(175))*17-5
     return returnValue
end
defineIntegerFromGetter("ACCELEROMETER_VALUE", getAccel, 65000,
"Gauge Values", "Accelerometer")

defineIndicatorLight("WINDSHIELDOIL", 412, "Damage", "Windshield Oil Splashes")
defineFloat("WINDSHIELDCRACKS", 413, {0.0, 1.0}, "Damage", "Windshield Crack Holes")

defineIntegerFromGetter("EXT_WOW_TAIL", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")

defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")

defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

defineIntegerFromGetter("EXT_LANDING_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Light (white)")

defineFloat("CANOPY_POS", 162, {0, 1}, "Cockpit Mechanical", "Canopy Position")
defineRadioWheel("RKT_COUNT_CON", 4, 3009, 3010, {-0.1, 0.1}, 75, 0.1, {0, 1.0}, nil, "Weapon Control", "Rockets Counter Control")
defineFloat("AILERON_TRIM_G", 170, {-1.0, 1.0}, "Control System", "Aileron Trim Gauge")
defineFloat("RUDDER_TRIM_G", 172, {-1.0, 1.0}, "Control System", "Rudder Trim Gauge")
defineFloat("ELEVATOR_TRIM_G", 171, {-1.0, 1.0}, "Control System", "Elevator Trim Gauge")
defineFloat("CONTR_LOCK_BRACK", 174, {0.0, 1.0}, "Control System", "Control Lock Bracket")

BIOS.protocol.endModule()