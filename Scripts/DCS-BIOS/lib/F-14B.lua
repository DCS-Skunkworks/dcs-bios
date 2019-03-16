BIOS.protocol.beginModule("F-14B", 0x1200)
BIOS.protocol.setExportModuleAircrafts({"F-14B"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
--local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
--local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
--local defineString = BIOS.util.defineString
--local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
--local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

-- Hydraulics
defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_SW", 12, 3001, 629, "Hydraulics", "Pilot Hydraulic Transfer Pump Switch")
defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_COVER", 12, 3002, 630, "Hydraulics", "Pilot Hydraulic Transfer Pump Switch Cover")
defineToggleSwitch("PLT_HYD_ISOL_SW", 12, 3005, 631, "Hydraulics", "Pilot Hydraulic Isolation Switch")
define3PosTumb("PLT_HYD_EMERG_FCONTR_SW", 12, 3003, 928, "Hydraulics", "Pilot Hydraulic Emergency Flight Control Switch")
defineToggleSwitch("PLT_HYD_EMERG_FCONTR_COVER", 12, 3004, 615, "Hydraulics", "Pilot Hydraulic Emergency Flight Control Switch Cover")
defineToggleSwitch("PLT_HYD_HAND_PUMP", 12, 3006, 632, "Hydraulics", "Pilot Hydraulic Hand Pump")

-- Master Reset
definePushButton("PLT_MASTER RESET", 22, 3058, 1071, "Master Reset", "Pilot MASTER RESET")

-- AICS
defineToggleSwitch("PLT_INLET_RAMPS_L", 13, 3007, 2100, "AICS", "Pilot Stow Inlet Ramps Left Switch")
defineToggleSwitch("PLT_INLET_RAMPS_R", 13, 3008, 2101, "AICS", "Pilot Stow Inlet Ramps Right Switch")

-- Wing Sweep
defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_COVER", 16, 3029, 317, "Wing Sweep", "Pilot Emergency Wing Sweep Handle Cover")
definePotentiometer("PLT_EMERG_WING_SWEEPLT_LEVER", 16, 3031, 384, {0, 1}, "Wing Sweep", "Emergency Wing Sweep Handle")
defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_POP", 12, 3030, 15096, "Wing Sweep", "Emergency Wing Sweep Handle Pop out")

--Radar Altimeter
definePushButton("PLT_RADAR_ALT_BIT", 29, 3489, 16020, "Radar Altimeter", "Pilot Radar Altimeter BIT Test Button")
defineRotary("PLT_RADAR_ALT_KNOB", 29, 3490, 308, "Radar Altimeter", "Pilot Radar Altimeter Control Knob")

-- Airspeed Indicator

-- Altimeter
-- RIO Altimeter
-- Gear
-- Hook
-- Brakes
define3PosTumb("PLT_ANTI_SKID_SW", 17, 3014, 1072, "Brakes", "Anti-Skid Spoiler BK Switch")
defineToggleSwitch("PLT_PARK_BRAKE", 17, 3013, 237, "Brakes", "Pilot Parking Brake Handle")

-- SAS
defineToggleSwitch("PLT_AFCS_PITCH", 21, 3034, 2106, "SAS", "Pilot AFCS Stability Augmentation - Pitch")
defineToggleSwitch("PLT_AFCS_ROLL", 21, 3035, 2107, "SAS", "Pilot AFCS Stability Augmentation - Roll")
defineToggleSwitch("PLT_AFCS_YAW", 21, 3036, 2108, "SAS", "Pilot AFCS Stability Augmentation - Yaw")

-- Autopilot
define3PosTumb("PLT_AUTOPLT_VECTOR_CARRIER", 21, 3037, 2109, "Autopilot", "Pilot Autopilot - Vector / Automatic Carrier Landing")
defineToggleSwitch("PLT_AUTOPLT_ALT", 21, 3038, 2110, "Autopilot", "Pilot Autopilot - Altitude Hold")
define3PosTumb("PLT_AUTOPLT_HDG", 21, 3039, 2111, "Autopilot", "Pilot Autopilot - Heading / Ground Track")
defineToggleSwitch("PLT_AUTOPLT_ENGAGE", 21, 3040, 2112, "Autopilot", "Pilot Autopilot - Engage")

-- Flaps
-- Engine
defineToggleSwitch("PLT_ENGINE_FUEL_CUT_L", 19, 3128, 12300, "Engine", "Pilot Left Engine Fuel Cutoff")
defineToggleSwitch("PLT_ENGINE_FUEL_CUT_R", 19, 3129, 12301, "Engine", "Pilot Right Engine Fuel Cutoff")
define3PosTumb("PLT_THROTTLE_MODE", 19, 3045, 2104, "Engine", "Pilot Throttle Mode")
define3PosTumb("PLT_THROTTLE_TEMP", 19, 3047, 2103, "Engine", "Pilot Throttle Temp")
define3PosTumb("PLT_ANTI_ICE", 19, 3049, 941, "Engine", "Pilot Engine/Probe Anti-Ice")
defineToggleSwitch("PLT_ENGINE_AIRSTART", 19, 3050, 2105, "Engine", "Pilot Engine Airstart")
define3PosTumb("PLT_ENGINE_CRANK", 19, 3051, 2102, "Engine", "Pilot Engine Crank")
defineToggleSwitch("PLT_ENGINE_MODE_L", 19, 3052, 16007, "Engine", "Pilot Left Engine Mode")
defineToggleSwitch("PLT_ENGINE_MODE_R", 19, 3053, 16008, "Engine", "Pilot Right Engine Mode")
defineToggleSwitch("PLT_ASY_THRUST_LIMIT_COVER", 19, 3055, 16005, "Engine", "Pilot Asymmetric Thrust Limiter Cover")
defineToggleSwitch("PLT_ASY_THRUST_LIMIT_COVER", 19, 3054, 16006, "Engine", "Pilot Asymmetric Thrust Limiter Cover")

-- Fire System

-- UHF ARC-159
defineTumb("PLT_UHF1_FREQ_MODE", 3, 3375, 2033, 0.5, {0.0, 1.5}, nil, false, "UHF 1", "Pilot UHF ARC-159 Freq Mode GUARD/MANUAL/PRESET")
defineTumb("PLT_UHF1_FUNCTION", 3, 3371, 2034, 0.333333, {0.0, 1.333332}, nil, false, "UHF 1", "Pilot UHF ARC-159 Function ADF/BOTH/MAIN/OFF")
defineTumb("PLT_UHF1_PRESETS", 3, 3373, 2032, 0.0833333333, {0.0, 1.666666666}, nil, false, "UHF 1", "Pilot UHF ARC-159 Preset Channel Selector")
defineToggleSwitch("PLT_UHF1_SQUELCH", 3, 3365, 2035, "UHF 1", "Pilot UHF ARC-159 Squelch Switch")
define3PosTumb("PLT_UHF1_110_DIAL", 3, 3367, 2030, "UHF 1", "Pilot UHF ARC-159 100MHz & 10MHz Dial")
define3PosTumb("PLT_UHF1_1_DIAL", 3, 3368, 2029, "UHF 1", "Pilot UHF ARC-159 1MHz Dial")
define3PosTumb("PLT_UHF1_01_DIAL", 3, 3369, 2028, "UHF 1", "Pilot UHF ARC-159 0.1MHz Dial")
define3PosTumb("PLT_UHF1_025_DIAL", 3, 3370, 2026, "UHF 1", "Pilot UHF ARC-159 0.025MHz Dial")
defineToggleSwitch("PLT_UHF1_SHOW_PRESET_FREQ", 3, 3377, 8115, "UHF 1", "Pilot UHF ARC-159 Show Preset Frequency")
definePotentiometer("PLT_UHF1_VOL", 3, 3359, 2031, {0.0, 1.0}, "UHF 1", "Pilot UHF ARC-159 Volume")
definePotentiometer("RIO_UHF1_VOL", 3, 3361, 383, {0.0, 1.0}, "UHF 1", "RIO UHF ARC-159 Volume")
definePotentiometer("PLT_UHF1_BRIGHTNESS", 3, 3363, 2027, {0.0, 1.0}, "UHF 1", "Pilot UHF ARC-159 Display Brightness")

-- Warning, Caution and IndicatorLights
defineIndicatorLight("PLT_WARN_LGEN", 15016, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Generator (yellow)")
defineIndicatorLight("PLT_WARN_LOILHOT", 15017, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Oil Hot (yellow)")
defineIndicatorLight("PLT_WARN_LFUELPRESS", 15018, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Fuel Pressure (yellow)")
defineIndicatorLight("PLT_WARN_ENGFIREEXT", 15019, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Engine Fire Extinguisher (green)")
defineIndicatorLight("PLT_WARN_RGEN", 15020, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Generator (yellow)")
defineIndicatorLight("PLT_WARN_ROILHOT", 15021, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Oil Hot (yellow)")
defineIndicatorLight("PLT_WARN_RFUELPRESS", 15022, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Fuel Pressure (yellow)")
defineIndicatorLight("PLT_WARN_WINGSWEEP", 15023, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Wing Sweep (green)")
defineIndicatorLight("PLT_WARN_AUXFIREEXT", 15024, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Auxiliary Fire Extinguisher (green)")
defineIndicatorLight("PLT_WARN_YAWSTABOP", 15025, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Yaw Stabilizer Op (yellow)")
defineIndicatorLight("PLT_WARN_YAWSTABOUT", 15026, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Yaw Stabilizer Out (yellow)")
defineIndicatorLight("PLT_WARN_CANOPY", 15027, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Canopy (yellow)")
defineIndicatorLight("PLT_WARN_CADC", 15028, "Warning, Caution and IndicatorLights","Pilot Warning Lamp CADC (yellow)")
defineIndicatorLight("PLT_WARN_LFUELLOW", 15029, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Fuel Low (yellow)")
defineIndicatorLight("PLT_WARN_WSHIELDHOT", 15030, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Windshield Hot (green)")
defineIndicatorLight("PLT_WARN_EMERGJETT", 15031, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Emergency Jettison (yellow)")
defineIndicatorLight("PLT_WARN_OXYLOW", 15032, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Qxygen Low (yellow)")
defineIndicatorLight("PLT_WARN_BINGO", 15033, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Bingo Fuel (yellow)")
defineIndicatorLight("PLT_WARN_HYDPRESS", 15034, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Hydraulic Pressure (yellow)")
defineIndicatorLight("PLT_WARN_RFUELLOW", 15035, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Fuel Low (yellow)")
defineIndicatorLight("PLT_WARN_MACHTRIM", 15036, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Mach Trim (green)")
defineIndicatorLight("PLT_WARN_PITCHSTAB", 15037, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Pitch Stabilizer (yellow)")
defineIndicatorLight("PLT_WARN_BLEEDDUCT", 15038, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Bleed Duct (yellow)")
defineIndicatorLight("PLT_WARN_ROLLSTAB", 15039, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Roll Stabilizer (yellow)")
defineIndicatorLight("PLT_WARN_PITCHSTAB2", 15040, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Pitch Stabilizer 2 (yellow)")
defineIndicatorLight("PLT_WARN_AUTOPLT", 15041, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Autopilot (yellow)")
defineIndicatorLight("PLT_WARN_LOVSPVALVE", 15042, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Ovsp Valve (yellow)")
defineIndicatorLight("PLT_WARN_ROVSPVALVE", 15043, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Ovsp Valve (yellow)")
defineIndicatorLight("PLT_WARN_RRAMP", 15044, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Ramp (yellow)")
defineIndicatorLight("PLT_WARN_LAUNCHBAR", 15045, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Launchbar (green)")
defineIndicatorLight("PLT_WARN_FLAP", 15046, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Flap (yellow)")
defineIndicatorLight("PLT_WARN_HZTAILAUTH", 15047, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Horizontal Tail Auth (yellow)")
defineIndicatorLight("PLT_WARN_OILPRESS", 15048, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Oil Pressure (yellow)")
defineIndicatorLight("PLT_WARN_LRAMP", 15049, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Ramp (yellow)")
defineIndicatorLight("PLT_WARN_LADDER", 15050, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Ladder (yellow)")
defineIndicatorLight("PLT_WARN_RINLET", 15051, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Inlet (yellow)")
defineIndicatorLight("PLT_WARN_INLETICE", 15052, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Inlet Ice (yellow)")
defineIndicatorLight("PLT_WARN_RUDDERAUTH", 15053, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Rudder Auth (yellow)")
defineIndicatorLight("PLT_WARN_LINLET", 15054, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Inlet (yellow)")
defineIndicatorLight("PLT_WARN_ANRS", 15055, "Warning, Caution and IndicatorLights","Pilot Warning Lamp ANRS (green)")
defineIndicatorLight("PLT_WARN_ROLLSTAB2", 15056, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Roll Stabilizer 2 (yellow)")	
defineIndicatorLight("PLT_WARN_SPOILERS", 15057, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Spoilers (yellow)")	
defineIndicatorLight("PLT_WARN_TRANSRECT", 15058, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Trans Rect (green)")
defineIndicatorLight("PLT_WARN_REDUCESPEED", 15059, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Reduce Speed (yellow)")
defineIndicatorLight("PLT_WARN_INTERTRIM", 15060, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Inter Trim (green)")
defineIndicatorLight("PLT_WARN_LENGSEC", 15061, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Engine Secondary (yellow)")
defineIndicatorLight("PLT_WARN_RATS", 15062, "Warning, Caution and IndicatorLights","Pilot Warning Lamp RATS (green)")
defineIndicatorLight("PLT_WARN_STARTVALVE", 15063, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Start Valve (yellow)")
defineIndicatorLight("PLT_WARN_RENGSEC", 15064, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Engine Secondary (yellow)")

BIOS.protocol.endModule()