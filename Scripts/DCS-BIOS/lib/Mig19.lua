BIOS.protocol.beginModule("MiG-19P", 0x1600)
BIOS.protocol.setExportModuleAircrafts({"MiG-19P"})

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
local defineRockerSwitch = BIOS.util.defineRockerSwitch

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

-- THROTTLE
defineRotary("ASP_TAAGET_DIS", 11, 3314, 314, "Throttle", "ASP-5 Target Distance Selector")
definePushButton("RSIU_TRANS", 17, 3315, 315, "Throttle", "RSIU-4V Transmit Button - Push to Transmit")
defineToggleSwitch("AIRBRAKE_SW", 4, 3316, 316, "Throttle", "Airbrake Switch")
definePushButton("AFTERBURN_DIS", 2, 3317, 317, "Throttle", "Mil-power Limit/Afterburner Disable")
definePushButton("AFTERBURN_EN", 2, 3318, 318, "Throttle", "Afterburner Enable")

-- MAIN INSTRUMENTS PANEL
define3PosTumb("GEAR_LEVER", 4, 3330, 330, "Landing Gear Panel", "Landing Gear Lever, Down/Neutral/Up")
defineToggleSwitch("GEAR_LOCK", 4, 3331, 331, "Landing Gear Panel", "Landing Gear Lever Lock")
definePushButton("GEAR_LIGHT_TEST", 10, 3333, 333, "Landing Gear Panel", "PPS-2 Landing Gear Lights Test Button - Push to test")
defineToggleSwitch("EMERG_BRAKE", 4, 3301, 301, "Landing Gear Panel", "Emergency Brake")
defineToggleSwitch("NOSE_GEAR_BRAKE", 4, 3302, 302, "Landing Gear Panel", "Nose Gear Brake System On/Off")

define3PosTumb("NOSE_LIGHTS", 5, 3262, 262, "Exterior Lights Panel", "Nose Lights Switch, LANDING/OFF/TAXI")

definePushButton("GIK1_ALIGN", 9, 3224, 224, "Flight Instruments Panel", "GIK-1 Needle Alignment")
definePushButton("ARU2V_LAMP_TEST", 4, 3300, 300, "Flight Instruments Panel", "ARU-2V Lamp Test Button")
defineRotary("GIK1_CRS_SEL", 9, 3359, 3359, "Flight Instruments Panel", "GIK-1 Course Selector")
definePotentiometer("AGI1_TRIM", 9, 3360, 360, {-1, 1}, "Flight Instruments Panel", "AGI-1 Artificial Horizon Pitch Trim Knob")
defineToggleSwitch("AGI1_CAGE", 9, 3361, 361, "Landing Gear Panel", "AGI-1 Artificial Horizon Cage Button - Push to cage")
defineRotary("BALT_PRESS_SEL", 9, 3362, 362, "Flight Instruments Panel", "Barometric Altimeter Setting (bars)")
defineRotary("CLOCK_R_KNOB_TURN", 9, 3364, 364, "Flight Instruments Panel", "AChS-1 Chronograph Right Knob (Turn)")
definePushButton("CLOCK_R_KNOB_PRESS", 4, 3508, 508, "Flight Instruments Panel", "AChS-1 Chronograph Right Knob (Press)")
defineRotary("CLOCK_L_KNOB_TURN", 9, 3365, 3645, "Flight Instruments Panel", "AChS-1 Chronograph Left Knob (Turn)")
define3PosTumb("CLOCK_L_KNOB_PRESS", 9, 3366, 366, "Flight Instruments Panel", "AChS-1 Chronograph Left Knob (PRESS)")
definePushButton("GMETER_RESET", 9, 3515, 515, "Flight Instruments Panel", "AM-10 Accelerometer Min/Max G Reset Button")

-- GUNSIGHTS
defineToggleSwitch("ASP5_CAGE", 11, 3355, 355, "Gunsights", "ASP-5 Sight Cage/Uncage")
defineRotary("ASP5_WINGSPAN", 11, 3356, 356, "Gunsights", "ASP-5 Target Wingspan Selector")
defineRotary("ASP5_BOMB_MIL", 11, 3357, 357, "Gunsights", "ASP-5 Bomb Mil Deflection Setting")
definePotentiometer("ASP5_BRIGHT", 11, 3358, 358, {0, 1}, "Gunsights", "ASP-5 Brightness")

-- RP-5 IZUMRUD
defineToggleSwitch("RP5_TELEMETRY", 14, 3263, 263, "Radar", "RP-5 Radar/Telemetry Selector")

-- SPO-2 RWR
defineToggleSwitch("SPO2_PW_SW", 16, 3495, 495, "Sensors", "SPO-2 SIRENA RWR Power Switch")

-- CENTER CONSOLE
defineToggleSwitch("BOMB_ARM_SW", 7, 3264, 264, "Center Console", "Bombs Arm Switch")
defineRotary("GUN_L_ROF", 7, 3368, 368, "Center Console", "Left Gun Ammo Counter Reset")
defineRotary("GUN_R_ROF", 7, 3369, 369, "Center Console", "Right Gun Ammo Counter Reset")

-- LEFT INSTRUMENTS PANEL
defineToggleSwitch("TANK1_FUEL_PUMP", 2, 3242, 242, "Bulkhead Panel 1", "Tank 1 Fuel Pump")
defineToggleSwitch("TANK2_FUEL_PUMP", 2, 3243, 243, "Bulkhead Panel 1", "Tank 2 Fuel Pump")
defineToggleSwitch("TANK3_FUEL_PUMP", 2, 3244, 244, "Bulkhead Panel 1", "Tank 3 Fuel Pump")
defineToggleSwitch("TANK4_FUEL_PUMP", 2, 3245, 245, "Bulkhead Panel 1", "Tank 4 Fuel Pump")
defineToggleSwitch("CPT_HEATING", 8, 3246, 246, "Bulkhead Panel 1", "Cockpit Heating")
defineToggleSwitch("ANTI_SKID", 4, 3247, 247, "Bulkhead Panel 1", "Anti-Skid Brake")

defineToggleSwitch("ENG_START", 2, 3248, 248, "Bulkhead Panel 2", "Engine Start Power Switch")
defineToggleSwitch("FIRE_EX_PW_SW", 2, 3248, 249, "Bulkhead Panel 2", "Fire Extinguisher Power Switch")
defineToggleSwitch("R_ENG_OIL_CUT", 2, 3250, 250, "Bulkhead Panel 2", "Right Engine Oil Cutoff")
defineToggleSwitch("L_ENG_OIL_CUT", 2, 3251, 251, "Bulkhead Panel 2", "Left Engine Oil Cutoff")
defineToggleSwitch("R_ENG_BURNER_CUT", 2, 3252, 252, "Bulkhead Panel 2", "Right Engine Afterburner Cut")
defineToggleSwitch("L_ENG_BURNER_CUT", 2, 3253, 253, "Bulkhead Panel 2", "Left Engine Afterburner Cut")

-- Bulkhead Panel 3
defineToggleSwitch("ARU2_MODE", 4, 3254, 254, "Bulkhead Panel 3", "ARU-2 Operational Mode (Auto/Manual)")
define3PosTumb("ARU2_MANUAL", 4, 3255, 255, "Bulkhead Panel 3", "ARU-2 Manual Arm Selector")
defineToggleSwitch("TP19_BRAKECUTE_COVER", 4, 3274, 274, "Bulkhead Panel 3", "TP-19 Braking Parachute Jettison Button Cover")
definePushButton("TP19_BRAKECUTE_JETT", 4, 3275, 275, "Bulkhead Panel 3", "TP-19 Braking Parachute Jettison Button - Press to jettison drag chute")
definePushButton("WARN_BTN", 9, 3276, 276, "Bulkhead Panel 3", "Warning Button")

definePushButton("FUEL_TANK_WARN_BTN", 2, 3279, 279, "Bulkhead Panel 4", "Fuel Tanks 2,3,4 Warning Lamps Test Button")
definePushButton("ENG_FIRE_TEST_BTN", 2, 3280, 280, "Bulkhead Panel 4", "Engine Fire Lamp Test Button")
defineToggleSwitch("L_ENG_FUELCUT_COVER", 2, 3281, 281, "Bulkhead Panel 4", "Left Engine Fuel Cutoff Cover")
defineToggleSwitch("R_ENG_FUELCUT_COVER", 2, 3282, 282, "Bulkhead Panel 4", "Right Engine Fuel Cutoff Cover")
definePushButton("L_ENG_FUELCUT", 2, 3285, 285, "Bulkhead Panel 4", "Left Engine Fuel Cutoff")
definePushButton("R_ENG_FUELCUT", 2, 3286, 286, "Bulkhead Panel 4", "Right Engine Fuel Cutoff")
defineToggleSwitch("FIRE_EX_COVER", 2, 3283, 283, "Bulkhead Panel 4", "Fire Extinguisher Cover")
definePushButton("FIRE_EX", 2, 3284, 284, "Bulkhead Panel 4", "Fire Extinguisher")

defineToggleSwitch("L_ENG_START_COVER", 2, 3270, 270, "Bulkhead Panel 5", "Left Engine Start Button Cover")
defineToggleSwitch("R_ENG_START_COVER", 2, 3271, 271, "Bulkhead Panel 5", "Right Engine Start Button Cover")
definePushButton("L_ENG_START", 2, 3272, 272, "Bulkhead Panel 4", "Left Engine Start")
definePushButton("R_ENG_START", 2, 3273, 273, "Bulkhead Panel 4", "Right Engine Start")
defineToggleSwitch("L_ENG_AIR_START_COVER", 2, 3277, 277, "Bulkhead Panel 5", "Left Engine Air Start Button Cover")
defineToggleSwitch("R_ENG_AIR_START_COVER", 2, 3278, 278, "Bulkhead Panel 5", "Right Engine Air Start Button Cover")
definePushButton("L_ENG_AIR_START", 2, 3328, 328, "Bulkhead Panel 4", "Left Air Engine Start")
definePushButton("R_ENG_AIR_START", 2, 3329, 329, "Bulkhead Panel 4", "Right Air Engine Start")

-- RIGHT INSTRUMENTS PANEL
defineToggleSwitch("RADIO_EMERG_PW_SW", 3, 3200, 200, "Bulkhead Panel 1", "Radios Emergency Power")
defineToggleSwitch("AGI1_EMERG_PW_SW", 3, 3201, 201, "Bulkhead Panel 1", "AGI-1 Emergency Power")
defineToggleSwitch("RADIO_ELECTR_PW_SW", 3, 3202, 202, "Bulkhead Panel 1", "Radios Electric Power")
defineToggleSwitch("BEACON_ELECTR_PW_SW", 3, 3203, 203, "Bulkhead Panel 1", "Beacon and Radio Altimeter Electric Power")
defineToggleSwitch("ELEVATOR_PW_SW", 3, 3206, 206, "Bulkhead Panel 1", "Elevator Control Electric Power")
defineToggleSwitch("TRIM_PW_SW", 3, 3207, 207, "Bulkhead Panel 1", "Trim System Electric Power")
defineToggleSwitch("RADIO_NAV_PW_SW", 3, 3208, 208, "Bulkhead Panel 1", "Radio Navigation Electric Power")
defineToggleSwitch("PITOT_PW_SW", 3, 3209, 209, "Bulkhead Panel 1", "Pitot Heater Electric Power")
defineToggleSwitch("PITOT_EMERG_PW_SW", 3, 3210, 210, "Bulkhead Panel 1", "Emergency Pitot Heater Electric Power")
defineToggleSwitch("BATTERY_PW_SW", 3, 3211, 211, "Bulkhead Panel 1", "Battery Connect/Disconnect")
defineToggleSwitch("L_GEN_PW_SW", 3, 3212, 212, "Bulkhead Panel 1", "Left Generator Connect/Disconnect")
defineToggleSwitch("R_GEN_PW_SW", 3, 3213, 213, "Bulkhead Panel 1", "Right Generator Connect/Disconnect")
defineToggleSwitch("ASP5_WARM_PW_SW", 3, 3214, 214, "Bulkhead Panel 1", "ASP-5 Sight Heater")
defineToggleSwitch("ASP5_SIGHT_PW_SW", 3, 3215, 215, "Bulkhead Panel 1", "ASP-5 Sight On/Off")
defineToggleSwitch("RP5_PW_SW", 3, 3216, 216, "Bulkhead Panel 1", "RP-5 Radar Electric Power")
defineToggleSwitch("ORO57K_PW_SW", 3, 3217, 217, "Bulkhead Panel 1", "ORO-57K Rocket Pods Electric Power")
defineToggleSwitch("L_GUN_PW_SW", 3, 3218, 218, "Bulkhead Panel 1", "Left Gun Electric Power")
defineToggleSwitch("R_GUN_PW_SW", 3, 3219, 219, "Bulkhead Panel 1", "Right Gun Electric Power")
defineToggleSwitch("GUN_CAM_CPT_PW_SW", 3, 3220, 220, "Bulkhead Panel 1", "Cockpit Gun Camera Power")
defineToggleSwitch("GUN_CAM_NOSE_PW_SW", 3, 3221, 221, "Bulkhead Panel 1", "Nose Gun Camera Power")



defineToggleSwitch("CB_LOCK", 3, 3230, 230, "Circuit Breakers", "Circuit Breakers Panel Lock")
defineToggleSwitch("CB_LIGHTS", 3, 3231, 231, "Circuit Breakers", "Aircraft External Lights Circuit Breaker")
defineToggleSwitch("CB_ARU2V", 3, 3232, 232, "Circuit Breakers", "ARU-2V Flight Control System Circuit Breaker")
defineToggleSwitch("CB_BOMB_FUSE", 3, 3233, 233, "Circuit Breakers", "Bomb Fuzing System Circuit Breaker")
defineToggleSwitch("CB_BOMB_RELEASE", 3, 3234, 234, "Circuit Breakers", "Bomb Release System Circuit Breaker")
defineToggleSwitch("CB_BOMB_JETT", 3, 3235, 235, "Circuit Breakers", "Bomb, Drop Tank and Rocket Emergency Jettison System Circuit Breaker")
defineToggleSwitch("CB_ARK5", 3, 3236, 236, "Circuit Breakers", "ARK-5 Radio Navigation System Circuit Breaker")
defineToggleSwitch("CB_GFAB_LIGHTS", 3, 3237, 237, "Circuit Breakers", "Landing Gear, Airbrake and Flaps Annunciator Lights Circuit Breaker")
defineToggleSwitch("CB_GFAB", 3, 3238, 238, "Circuit Breakers", "Landing Gear, Airbrake and Flaps Systems Circuit Breaker")
defineToggleSwitch("CB_AILERON_ACT", 3, 3239, 239, "Circuit Breakers", "BU-13M Aileron and BU-14M Stabilizer Hydraulic Booster Circuit Breaker")
defineToggleSwitch("CB_ROCKET_PODS", 3, 3240, 240, "Circuit Breakers", "Rocket Pods Circuit Breaker")

-- CANOPY
defineToggleSwitch("CANOPY_LOCK_L", 4, 3429, 429, "Canopy", "Canopy Lock Lever L")
defineToggleSwitch("CANOPY_LOCK_R", 4, 3430, 430, "Canopy", "Canopy Lock Lever R")
defineToggleSwitch("CANOPY_PRESS", 4, 3431, 431, "Canopy", "Canopy Pressurization Switch")
defineToggleSwitch("EMERG_CANOPY", 4, 3229, 229, "Canopy", "Canopy Pressurization Switch")

-- Warning, Caution and IndicatorLights
defineIndicatorLight("L_GEAR_DOWN", 489, "Warning, Caution and IndicatorLights","Left Gear UP Lamp (red)")
defineIndicatorLight("N_GEAR_DOWN", 490, "Warning, Caution and IndicatorLights","Nose Gear UP Lamp (red)")
defineIndicatorLight("R_GEAR_DOWN", 491, "Warning, Caution and IndicatorLights","Right Gear UP Lamp (red)")
defineIndicatorLight("L_GEAR_DOWN", 492, "Warning, Caution and IndicatorLights","Left Gear DOWN Lamp (green)")
defineIndicatorLight("N_GEAR_DOWN", 493, "Warning, Caution and IndicatorLights","Nose Gear DOWN Lamp (green)")
defineIndicatorLight("R_GEAR_DOWN", 494, "Warning, Caution and IndicatorLights","Right Gear DOWN Lamp (green)")

BIOS.protocol.endModule()
