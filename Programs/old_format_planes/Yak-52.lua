BIOS.protocol.beginModule("Yak-52", 0x2000)
BIOS.protocol.setExportModuleAircrafts({"Yak-52"})
--by WarLord v1.1
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local define3PosTumb = BIOS.util.define3PosTumb
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineString = BIOS.util.defineString

--Remove Pilot Arg# 275 / Remove Instructor Arg# 276

--- Fore Pit
----- Fore Main Panel
definePushButton("FRONT_WBRAKES_LOCK", 2, 3028, 4, "Fore Main Panel", "Fore Wheel Brakes Lock")
defineToggleSwitch("FRONT_SMOKE", 6, 3039, 190, "Fore Main Panel", "Fore Smoke Apparat")
defineToggleSwitch("FRONT_STARTER_COVER", 3, 3035, 13, "Fore Main Panel", "Fore Starter Button Cover")
definePushButton("FRONT_STARTER", 3, 3039, 14, "Fore Main Panel", "Fore Starter Button")
defineTumb("FRONT_MAGNET_SEL", 3, 3003, 10, 0.1, {0, 0.3}, nil, false, "Fore Main Panel", "Fore Magnet Selector")
definePushButton("FRONT_LAMP_TEST", 4, 3049, 8, "Fore Main Panel", "Fore Lamp Test Button")
definePushButton("FRONT_STALL_TEST", 17, 3001, 41, "Fore Main Panel", "Fore Stall Warning Test Button")
definePushButton("FRONT_ACCEL_BTN", 6, 3001, 45, "Fore Main Panel", "Fore Accelerometer Button")
defineRotary("FRONT_ALT_KNOB", 6, 3004, 114, "Fore Main Panel", "Fore Altimeter Knob")
defineRotary("FRONT_AHORIZON_ZERO", 6, 3012, 143, "Fore Main Panel", "Fore Artificial Horizon Zeroing")
definePushButton("FRONT_AHORIZON_LOCK", 6, 3020, 145, "Fore Main Panel", "Fore Artificial Horizon LOCK Button")
defineToggleSwitch("FRONT_UCE_LOCK", 2, 3002, 33, "Fore Main Panel", "Fore Undercarriage Extension Lock")
defineRotary("FRONT_HSI_KNOB", 22, 3001, 155, "Fore Main Panel", "Fore HSI Knob")
definePushButton("FRONT_VOLTAMP_BTN", 15, 3001, 176, "Fore Main Panel", "Fore Voltamperemeter Button")
definePushButton("FRONT_FUEL_GAUGE_TEST", 16, 3001, 177, "Fore Main Panel", "Fore Fuel Gauge Test Button")
defineToggleSwitch("FRONT_FUEL_GAUGE_DIM", 16, 3002, 178, "Fore Main Panel", "Fore Fuel Gauge Dimmer")
defineTumb("FRONT_PRIMER_PUMP", 3, 3044, 76, 1.0, {-1, 1}, nil, false, "Fore Main Panel", "Fore Primer Pump Selector OFF/Trunk/Cylinders")
----- Clock
definePushButton("FRONT_CLOCK_PUSH_L", 6, 3023, 119, "Fore Main Panel", "Fore Clock Left Push Button")
defineRotary("FRONT_CLOCK_ROTATE_L", 22, 3024, 120, "Fore Main Panel", "Fore Clock Left Rotate Knob")
definePushButton("FRONT_CLOCK_PUSH_R", 6, 3025, 121, "Fore Main Panel", "Fore Clock Right Push Button")
defineRotary("FRONT_CLOCK_ROTATE_R", 22, 3026, 122, "Fore Main Panel", "Fore Clock Right Rotate Knob")
----- SPU-9
definePotentiometer("FRONT_ICOM_VOL", 28, 3001, 80, {0, 1}, "SPU9", "Fore Intercom Volume Knob")
definePotentiometer("FRONT_RADIO_VOL", 28, 3004, 81, {0, 1}, "SPU9", "Fore Radio Volume Knob")
defineToggleSwitch("FRONT_ICOM_STBY_DISTR_SW", 28, 3007, 82, "SPU9", "Fore Intercom STBY Distributive Switch")
defineToggleSwitch("FRONT_ICOM_RDF_SW", 28, 3009, 83, "SPU9", "Fore Intercom RDF Switch")
----- BAKLAN-5
defineRotary("FRONT_VHF_RADIO_VOL", 27, 3002, 90, "BAKLAN-5", "Fore VHF Radio Volume Knob")
defineRotary("FRONT_VHF_RADIO_MHZ", 27, 3011, 88, "BAKLAN-5", "Fore VHF Radio Tune mhz")
defineRotary("FRONT_VHF_RADIO_KHZ", 27, 3008, 89, "BAKLAN-5", "Fore VHF Radio Tune khz")
defineToggleSwitch("FRONT_VHF_RADIO_SQ", 27, 3020, 91, "BAKLAN-5", "Fore VHF Radio Squelch")
----- Starboard Circuit Breakers Panel
defineToggleSwitch("FRONT_CB_BATTERY", 4, 3001, 96, "Circuit Breakers", "Fore Battery Selector")
defineToggleSwitch("FRONT_CB_GENERATOR", 4, 3004, 97, "Circuit Breakers", "Fore Generator CB")
defineToggleSwitch("FRONT_CB_IGNITION", 4, 3007, 98, "Circuit Breakers", "Fore Ignition CB")
defineToggleSwitch("FRONT_CB_PITOT", 4, 3010, 99, "Circuit Breakers", "Fore Pitot Heater CB")
definePushButton("FRONT_CB_OILDIL", 4, 3016, 232, "Circuit Breakers", "Fore Oil Dilution Button")
defineToggleSwitch("FRONT_CB_E_HEAT", 4, 3018, 233, "Circuit Breakers", "Fore SSKUA-1 Heater CB")
defineToggleSwitch("FRONT_CB_STALL", 4, 3021, 234, "Circuit Breakers", "Fore SSKUA-1 CB")
----- Port Wall
definePushButton("FRONT_RADIO_TX", 27, 3001, 192, "Throttle Quadrant", "Fore Radio Button")
definePushButton("FRONT_INTERCOM_TX", 27, 3023, 194, "Throttle Quadrant", "Fore Intercom Button")
definePotentiometer("FRONT_PROP_LEVER", 3, 3019, 198, {0, 1}, "Throttle Quadrant", "Fore Airscrew Lever")
definePotentiometer("FRONT_FRIC_LEVER", 3, 3027, 210, {0, 1}, "Throttle Quadrant", "Fore Left Frictioner Lever")
defineRotary("FRONT_TRIM_WHEEL", 2, 3032, 228, "Port Wall", "Fore Elevator Trim Wheel")
definePushButton("FRONT_FUEL_COCK", 3, 3047, 286, "Port Wall", "Fore Fuel Cock")
defineRotary("FRONT_PNEM_VALVE", 6,  3041, 230, "Port Wall", "Fore Pneumatic System Master Valve")
----- Port Circuit Breakers Panel
defineToggleSwitch("FRONT_CB_RADIO", 4, 3024, 226, "Circuit Breakers", "Fore Radio CB")
defineToggleSwitch("FRONT_CB_INTERCOM", 4, 3027, 225, "Circuit Breakers", "Fore Intercom CB")
defineToggleSwitch("FRONT_CB_UMFORMER2", 4, 3030, 224, "Circuit Breakers", "Fore PAG-1 CB")
defineToggleSwitch("FRONT_CB_UC", 4, 3033, 223, "Circuit Breakers", "Fore U/C CB")
defineToggleSwitch("FRONT_CB_UMFORMER1", 4, 3036, 222, "Circuit Breakers", "Fore PT-200 CB")
defineToggleSwitch("FRONT_CB_E_INSTR", 4, 3013, 221, "Circuit Breakers", "Fore Engine Instrumentation CB")
defineToggleSwitch("FRONT_CB_RDF", 4, 3039, 220, "Circuit Breakers", "Fore RDF CB")
defineToggleSwitch("FRONT_CB_SDG", 4, 3042, 219, "Circuit Breakers", "Fore SDG CB")
----- Starboard Wall
definePotentiometer("FRONT_WRADIATOR", 3, 3051, 235, {0, 1}, "Louvers Quadrant", "Fore Cooling Flaps Lever")
definePotentiometer("FRONT_ORADIATOR", 3, 3054, 236, {0, 1}, "Louvers Quadrant", "Fore Oil Radiator Lever")
definePotentiometer("FRONT_FRIC_R_LEVER", 3, 3057, 237, {0, 1}, "Louvers Quadrant", "Fore Right Frictioner Lever")
defineToggleSwitch("FRONT_MIXHEAT", 3, 3060, 238, "Starboard Wall", "Fore Carburettor Heater Lever")
defineRotary("FRONT_EMER_VALVE", 6, 3044, 239, "Starboard Wall", "Fore Pneumatic Emergency Valve 1")
defineToggleSwitch("FRONT_SDG_HEMI", 20, 3001, 258, "GMK-1A", "Fore Gyro Hemisphere Selector")
defineTumb("FRONT_SDG_MODE", 20, 3003, 259, 1, {-1, 0}, nil, false, "GMK-1A", "Fore Gyro Mode MC/GC")
define3PosTumb("FRONT_SDG_CONTROL", 20, 3005, 260, "GMK-1A", "Fore Gyro Test Switch, 0 deg/OFF/300deg")
define3PosTumb("FRONT_SDG_COURSE", 20, 3007, 261, "GMK-1A", "Fore Gyro Heading Selector, Counter-Clockwise/OFF/Clockwise")
definePotentiometer("FRONT_SDG_LAT", 20, 3009, 262, {0, 1}, "GMK-1A", "Fore Gyro Latitude Selector")
defineTumb("FRONT_RDF_CHANNEL", 21, 3022, 244, 0.1, {0.0, 0.5}, nil, false, "ARK 15M", "Fore RDF Channel Selector")
defineToggleSwitch("FRONT_RDF_LISTEN", 21, 3007, 245, "ARK 15M", "Fore RDF Listen Mode")
defineToggleSwitch("FRONT_RDF_MODE12", 21, 3019, 246, "ARK 15M", "Fore RDF Mode")
definePotentiometer("FRONT_RDF_VOLUME", 21, 3001, 247, {0, 1}, "ARK 15M", "Fore RDF Volume")
definePushButton("FRONT_RDF_MODE3", 21, 3004, 248, "ARK 15M", "Fore RDF Loop")
definePushButton("FRONT_RDF_CSWITCH", 21, 3010, 249, "ARK 15M", "Fore RDF Control")
defineToggleSwitch("FRONT_CB_ADF", 21, 3025, 104, "ARK 15M", "Fore ADF Marker")
----- Canopy Controls
defineToggleSwitch("FRONT_HATCH_L", 2, 3051, 267, "Canopy", "Fore Left Canopy Lever")
definePushButton("FRONT_HATCH_R", 2, 3062, 288, "Canopy", "Fore Right Canopy Lever")
definePushButton("FRONT_HATCH_JET", 2, 3059, 266, "Canopy", "Fore Canopy Jettison")
--------------------------------------------------------------------------------------------------------
--- Rear Pit
----- Rear Main Panel
definePushButton("REAR_WBRAKES_LOCK", 2, 3029, 6, "Rear Main Panel", "Rear Wheel Brakes Lock")
definePushButton("REAR_BRAKES_CUT", 2, 3031, 212, "Rear Main Panel", "Rear Wheel Brakes Purge")
defineToggleSwitch("REAR_IGNITION", 3, 3001, 12, "Rear Main Panel", "Rear Ignition Source Switch")
defineTumb("REAR_MAGNET_SEL", 3, 3006, 11, 0.1, {0, 0.3}, nil, false, "Rear Main Panel", "Rear Magnet Selector")
defineToggleSwitch("REAR_STARTER_COVER", 3, 3036, 15, "Rear Main Panel", "Rear Starter Button Cover")
definePushButton("REAR_STARTER", 3, 3040, 16, "Rear Main Panel", "Rear Starter Button")
defineToggleSwitch("REAR_UCE_LOCK", 2, 3005, 35, "Rear Main Panel", "Rear Undercarriage Extension Lock")
definePushButton("REAR_LAMP_TEST", 4, 3099, 9, "Rear Main Panel", "Rear Lamp Test Button")
definePushButton("REAR_ACCEL_BTN", 6, 3002, 49, "Rear Main Panel", "Rear Accelerometer Button")
defineRotary("REAR_ALT_KNOB", 6, 3007, 118, "Rear Main Panel", "Rear Altimeter Knob")
defineRotary("REAR_AHORIZON_ZERO", 6, 3015, 149, "Rear Main Panel", "Rear Artificial Horizon Zeroing")
definePushButton("REAR_AHORIZON_LOCK", 6, 3021, 151, "Rear Main Panel", "Rear Artificial Horizon LOCK Button")
defineRotary("REAR_HSI_KNOB", 22, 3001, 279, "Rear Main Panel", "Rear HSI Knob")
----- Clock
definePushButton("REAR_CLOCK_PUSH_L", 6, 3027, 131, "Rear Main Panel", "Rear Clock Left Push Button")
defineRotary("REAR_CLOCK_ROTATE_L", 22, 3028, 132, "Rear Main Panel", "Rear Clock Left Rotate Knob")
definePushButton("REAR_CLOCK_PUSH_R", 6, 3029, 133, "Rear Main Panel", "Rear Clock Right Push Button")
defineRotary("REAR_CLOCK_ROTATE_R", 22, 3030, 134, "Rear Main Panel", "Rear Clock Right Rotate Knob")
----- SPU-9
definePotentiometer("REAR_ICOM_VOL", 28, 3011, 84, {0, 1}, "SPU9", "Rear Intercom Volume Knob")
definePotentiometer("REAR_RADIO_VOL", 28, 3014, 85, {0, 1}, "SPU9", "Rear Radio Volume Knob")
defineToggleSwitch("REAR_ICOM_STBY_DISTR_SW", 28, 3017, 86, "SPU9", "Rear Intercom STBY Distributive Switch")
defineToggleSwitch("REAR_ICOM_RDF_SW", 28, 3019, 87, "SPU9", "Rear Intercom RDF Switch")
----- Starboard Trainer Panel
defineToggleSwitch("REAR_CB_TPANEL_MASTER", 4, 3051, 100, "Circuit Breakers", "Rear Trainer Master CB")
defineToggleSwitch("REAR_CB_TPANEL_SPEED", 4, 3057, 101, "Circuit Breakers", "Rear Trainer Speedo CB")
defineToggleSwitch("REAR_CB_TPANEL_AH", 4, 3054, 102, "Circuit Breakers", "Rear Trainer AH CB")
defineToggleSwitch("REAR_CB_TPANEL_STAT", 4, 3060, 103, "Circuit Breakers", "Rear Trainer Statistics CB")
----- Port Wall
definePushButton("REAR_RADIO_TX", 27, 3051, 196, "Throttle Quadrant", "Rear Radio Button")
definePushButton("REAR_INTERCOM_TX", 27, 3052, 197, "Throttle Quadrant", "Rear Intercom Button")
definePotentiometer("REAR_PROP_LEVER", 3, 3022, 199, {0, 1}, "Throttle Quadrant", "Rear Airscrew Lever")
definePotentiometer("REAR_FRIC_LEVER", 3, 3030, 211, {0, 1}, "Throttle Quadrant", "Rear Left Frictioner Lever")
defineRotary("REAR_TRIM_WHEEL", 2, 3035, 229, "Port Wall", "Rear Elevator Trim Wheel")
definePushButton("REAR_FUEL_COCK", 3, 3048, 287, "Port Wall", "Rear Fuel Cock")
defineToggleSwitch("REAR_CB_BRAKES_CUT", 2, 3040, 293, "Circuit Breakers", "Rear Wheel Brakes Purge CB")
----- Starboard Wall
defineRotary("REAR_EMER_VALVE", 6, 3047, 241, "Starboard Wall", "Rear Pneumatic Emergency Valve 2")
defineTumb("REAR_RDF_CHANNEL", 21, 3072, 251, 0.1, {0.0, 0.5}, nil, false, "ARK 15M", "Rear RDF Channel Selector")
defineToggleSwitch("REAR_RDF_LISTEN", 21, 3057, 252, "ARK 15M", "Rear RDF Listen Mode")
defineToggleSwitch("REAR_RDF_MODE12", 21, 3069, 253, "ARK 15M", "Rear RDF Mode")
definePotentiometer("REAR_RDF_VOLUME", 21, 3051, 254, {0, 1}, "ARK 15M", "Rear RDF Volume")
definePushButton("REAR_RDF_MODE3", 21, 3054, 255, "ARK 15M", "Rear RDF Loop")
definePushButton("REAR_RDF_CSWITCH", 21, 3060, 256, "ARK 15M", "Rear RDF Control")
defineToggleSwitch("REAR_CB_ADF", 21, 3075, 105, "ARK 15M", "Rear ADF Marker")
----- Canopy Controls
defineToggleSwitch("REAR_HATCH_L", 2, 3054, 271, "Canopy", "Rear Left Canopy Lever")
definePushButton("REAR_HATCH_R", 2, 3063, 289, "Canopy", "Rear Right Canopy Lever")
definePushButton("REAR_HATCH_JET", 2, 3060, 270, "Canopy", "Rear Canopy Jettison")

--- Gauges
defineFloat("FRONT_ACCEL_MINUTE", 42, {-0.6, 0.9}, "Gauges", "Fore Accelerometer Minute")
defineFloat("FRONT_ACCEL_MIN", 44, {-0.6, 0.9}, "Gauges", "Fore Accelerometer Min")
defineFloat("FRONT_ACCEL_MAX", 43, {-0.6, 0.9}, "Gauges", "Fore Accelerometer Max")
defineFloat("REAR_ACCEL_MINUTE", 46, {-0.6, 0.9}, "Gauges", "Rear Accelerometer Minute")
defineFloat("REAR_ACCEL_MIN", 48, {-0.6, 0.9}, "Gauges", "Rear Accelerometer Min")
defineFloat("REAR_ACCEL_MAX", 47, {-0.6, 0.9}, "Gauges", "Rear Accelerometer Max")
defineFloat("FRONT_AIRSPEED", 109, {0.0, 0.5}, "Gauges", "Fore Airspeed Gauge")
defineFloat("REAR_AIRSPEED", 110, {0.0, 0.5}, "Gauges", "Rear Airspeed Gauge")
defineFloat("FRONT_ALT100", 111, {0, 1}, "Gauges", "Fore Altimeter 100")
defineFloat("FRONT_ALT1000", 112, {0, 1}, "Gauges", "Fore Altimeter 1000")
defineFloat("FRONT_ALT_PRESS", 113, {0, 1}, "Gauges", "Fore Altimeter Set Pressure")
defineFloat("REAR_ALT100", 115, {0, 1}, "Gauges", "Rear Altimeter 100")
defineFloat("REAR_ALT1000", 116, {0, 1}, "Gauges", "Rear Altimeter 1000")
defineFloat("REAR_ALT_PRESS", 117, {0, 1}, "Gauges", "Rear Altimeter Set Pressure")
defineFloat("FRONT_VARIOMETER", 161, {-1, 1}, "Gauges", "Fore Variometer Gauge")
defineFloat("FRONT_TURN", 162, {-1, 1}, "Gauges", "Fore Turn Gauge")
defineFloat("FRONT_SLIP", 163, {-1, 1}, "Gauges", "Fore Sideslip Gauge")
defineFloat("REAR_VARIOMETER", 164, {-1, 1}, "Gauges", "Rear Variometer Gauge")
defineFloat("REAR_TURN", 165, {-1, 1}, "Gauges", "Rear Turn Gauge")
defineFloat("REAR_SLIP", 166, {-1, 1}, "Gauges", "Rear Sideslip Gauge")
defineFloat("FRONT_AH_BANK", 146, {1.0, -1.0}, "Gauges", "Fore Artificial Horizon Bank")
defineFloat("FRONT_AH_PITCH", 147, {1.0, -1.0}, "Gauges", "Fore Artificial Horizon Pitch")
defineFloat("FRONT_AH_SLIP", 148, {1.0, -1.0}, "Gauges", "Fore Artificial Horizon Sideslip")
defineFloat("REAR_AH_BANK", 152, {1.0, -1.0}, "Gauges", "Rear Artificial Horizon Bank")
defineFloat("REAR_AH_PITCH", 153, {1.0, -1.0}, "Gauges", "Rear Artificial Horizon Pitch")
defineFloat("REAR_AH_SLIP", 154, {1.0, -1.0}, "Gauges", "Rear Artificial Horizon Sideslip")
defineFloat("FRONT_TACHO", 106, {0, 1}, "Gauges", "Fore Tachometer Gauge")
defineFloat("REAR_TACHO", 106, {0, 1}, "Gauges", "Rear Tachometer Gauge")
defineFloat("MANIFOLD_PRESS", 108, {0, 1}, "Gauges", "Manifold Pressure Gauge")
defineFloat("MANIFOLD_TEMP", 160, {-1.0, 0.6}, "Gauges", "Manifold Temperature Gauge")
defineFloat("VOLTMETER_G", 175, {-0.2, 0.6}, "Gauges", "Volt Amperemeter Gauge")
defineFloat("FRONT_UGR4K_CURR_CRS", 156, {0, 1}, "Gauges", "Fore UGR-4K Current Course")
defineFloat("FRONT_UGR4K_SET_CRS", 157, {0, 1}, "Gauges", "Fore UGR-4K Set Course")
defineFloat("FRONT_UGR4K_BCN_CRS", 158, {0, 1}, "Gauges", "Fore UGR-4K Beacon Course")
defineFloat("REAR_UGR4K_CURR_CRS", 280, {0, 1}, "Gauges", "Rear UGR-4K Current Course")
defineFloat("REAR_UGR4K_SET_CRS", 281, {0, 1}, "Gauges", "Rear UGR-4K Set Course")
defineFloat("REAR_UGR4K_BCN_CRS", 282, {0, 1}, "Gauges", "Rear UGR-4K Beacon Course")
defineFloat("FRONT_OIL_PRESS", 169, {-1, 1}, "Gauges", "Fore Oil Pressure Gauge")
defineFloat("FRONT_OIL_TEMP", 167, {-1, 1}, "Gauges", "Fore Oil Temperature Gauge")
defineFloat("FRONT_FUEL_PRESS", 168, {-1, 1}, "Gauges", "Fore Fuel Pressure Gauge")
defineFloat("REAR_OIL_PRESS", 172, {-1, 1}, "Gauges", "Rear Oil Pressure Gauge")
defineFloat("REAR_OIL_TEMP", 170, {-1, 1}, "Gauges", "Rear Oil Temperature Gauge")
defineFloat("REAR_FUEL_PRESS", 171, {-1, 1}, "Gauges", "Rear Fuel Pressure Gauge")
defineFloat("FRONT_CYL_TEMP", 173, {-0.05, 0.35}, "Gauges", "Fore Cylinder Heads Temperature Gauge")
defineFloat("REAR_CYL_TEMP", 174, {-0.05, 0.35}, "Gauges", "Rear Cylinder Heads Temperature Gauge")
defineFloat("FRONT_PNEU_MAIN_PRESS", 37, {0, 1}, "Gauges", "Fore Pneumatic Main Pressure Gauge")
defineFloat("FRONT_PNEU_STBY_PRESS", 38, {0, 1}, "Gauges", "Fore Pneumatic Standby Pressure Gauge")
defineFloat("REAR_PNEU_MAIN_PRESS", 39, {0, 1}, "Gauges", "Rear Pneumatic Main Pressure Gauge")
defineFloat("REAR_PNEU_STBY_PRESS", 40, {0, 1}, "Gauges", "Rear Pneumatic Standby Pressure Gauge")
defineFloat("FRONT_COMPASS_PITCH", 51, {-1, 1}, "Gauges", "Fore Compass Pitch")
defineFloat("FRONT_COMPASS_BANK", 50, {-1, 1}, "Gauges", "Fore Compass Bank")
defineFloat("FRONT_COMPASS_HDG", 52, {-1, 1}, "Gauges", "Fore Compass Heading")
defineFloat("REAR_COMPASS_PITCH", 54, {-1, 1}, "Gauges", "Rear Compass Pitch")
defineFloat("REAR_COMPASS_BANK", 53, {-1, 1}, "Gauges", "Rear Compass Bank")
defineFloat("REAR_COMPASS_HDG", 55, {-1, 1}, "Gauges", "Rear Compass Heading")

--- Warning, Caution and IndicatorLights
defineIndicatorLight("F_L_GEAR_UP", 17, "Warning, Caution and IndicatorLights", "Front Left Gear UP Lamp (red)")
defineIndicatorLight("F_N_GEAR_UP", 18, "Warning, Caution and IndicatorLights", "Front Nose Gear UP Lamp (red)")
defineIndicatorLight("F_R_GEAR_UP", 19, "Warning, Caution and IndicatorLights", "Front Right Gear UP Lamp (red)")
defineIndicatorLight("F_L_GEAR_DOWN", 20, "Warning, Caution and IndicatorLights", "Front Left Gear DOWN Lamp (green)")
defineIndicatorLight("F_N_GEAR_DOWN", 21, "Warning, Caution and IndicatorLights", "Front Nose Gear DOWN Lamp (green)")
defineIndicatorLight("F_R_GEAR_DOWN", 22, "Warning, Caution and IndicatorLights", "Front Right Gear DOWN Lamp (green)")
defineIndicatorLight("R_L_GEAR_UP", 23, "Warning, Caution and IndicatorLights", "Rear Left Gear UP Lamp (red)")
defineIndicatorLight("R_N_GEAR_UP", 24, "Warning, Caution and IndicatorLights", "Rear Nose Gear UP Lamp (red)")
defineIndicatorLight("R_R_GEAR_UP", 25, "Warning, Caution and IndicatorLights", "Rear Right Gear UP Lamp (red)")
defineIndicatorLight("R_L_GEAR_DOWN", 26, "Warning, Caution and IndicatorLights", "Rear Left Gear DOWN Lamp (green)")
defineIndicatorLight("R_N_GEAR_DOWN", 27, "Warning, Caution and IndicatorLights", "Rear Nose Gear DOWN Lamp (green)")
defineIndicatorLight("R_R_GEAR_DOWN", 28, "Warning, Caution and IndicatorLights", "Rear Right Gear DOWN Lamp (green)")
defineIndicatorLight("F_FLAPS_UP", 29, "Warning, Caution and IndicatorLights", "Front Flaps UP Lamp (green)")
defineIndicatorLight("F_FLAPS_DOWN", 30, "Warning, Caution and IndicatorLights", "Front Flaps DOWN Lamp (yellow)")
defineIndicatorLight("R_FLAPS_UP", 31, "Warning, Caution and IndicatorLights", "Rear Flaps UP Lamp (green)")
defineIndicatorLight("R_FLAPS_DOWN", 32, "Warning, Caution and IndicatorLights", "Rear Flaps DOWN Lamp (yellow)")
defineIndicatorLight("F_STALL_WARNL", 56, "Warning, Caution and IndicatorLights", "Front Stall Warn Lamp (red)")
defineIndicatorLight("F_SPEED_WARNL", 57, "Warning, Caution and IndicatorLights", "Front Danger Speed Warn Lamp (yellow)")
defineIndicatorLight("F_METAL_WARNL", 58, "Warning, Caution and IndicatorLights", "Front Metal Chips Warn Lamp (yellow)")
defineIndicatorLight("F_GEN_WARNL", 59, "Warning, Caution and IndicatorLights", "Front Generator Fault Warn Lamp (red)")
defineIndicatorLight("F_MAXG_WARNL", 60, "Warning, Caution and IndicatorLights", "Front Max G Warn Lamp (red)")
defineIndicatorLight("F_GYRO_WARNL", 61, "Warning, Caution and IndicatorLights", "Front Gyro Compass Warn Lamp (yellow)")
defineIndicatorLight("F_STALL_HEAT_WARNL", 62, "Warning, Caution and IndicatorLights", "Front Stall Heat Warn Lamp (green)")
defineIndicatorLight("F_PITOT_HEAT_WARNL", 63, "Warning, Caution and IndicatorLights", "Front Pitot-Tube Heat Warn Lamp (green)")
defineIndicatorLight("R_MAXG_WARNL", 64, "Warning, Caution and IndicatorLights", "Rear Max G Warn Lamp (red)")
defineIndicatorLight("R_STALL_WARNL", 65, "Warning, Caution and IndicatorLights", "Rear Stall Warn Lamp (red)")
defineIndicatorLight("R_SPEED_WARNL", 66, "Warning, Caution and IndicatorLights", "Rear Danger Speed Warn Lamp (yellow)")
defineIndicatorLight("R_GEN_WARNL", 67, "Warning, Caution and IndicatorLights", "Rear Generator Fault Warn Lamp (red)")
defineIndicatorLight("R_FUEL_L_WARNL", 68, "Warning, Caution and IndicatorLights", "Rear Fuel 12L Left Warn Lamp (red)")
defineIndicatorLight("R_FUEL_R_WARNL", 69, "Warning, Caution and IndicatorLights", "Rear Fuel 12L Right Warn Lamp (red)")
defineIndicatorLight("R_BATT_WARNL", 70, "Warning, Caution and IndicatorLights", "Rear Battery ON Warn Lamp (green)")
defineIndicatorLight("R_GYRO_WARNL", 71, "Warning, Caution and IndicatorLights", "Rear Gyro Compass Warn Lamp (yellow)")
defineIndicatorLight("R_METAL_WARNL", 72, "Warning, Caution and IndicatorLights", "Rear Metal Chips Warn Lamp (yellow)")
defineIndicatorLight("R_PITOT_HEAT_WARNL", 73, "Warning, Caution and IndicatorLights", "Rear Pitot-Tube Heat Warn Lamp (green)")
defineIndicatorLight("R_STALL_HEAT_WARNL", 74, "Warning, Caution and IndicatorLights", "Rear Stall Heat Warn Lamp (green)")
defineIndicatorLight("R_EMPTY_WARNL", 75, "Warning, Caution and IndicatorLights", "Rear Empty Warn Lamp (green)")
defineIndicatorLight("R_FUEL_12_WARNL", 180, "Warning, Caution and IndicatorLights", "Right Fueltank 12L Warn Lamp (red)")
defineIndicatorLight("R_FUEL_15_WARNL", 181, "Warning, Caution and IndicatorLights", "Right Fueltank 15L Warn Lamp (white)")
defineIndicatorLight("R_FUEL_20_WARNL", 182, "Warning, Caution and IndicatorLights", "Right Fueltank 20L Warn Lamp (white)")
defineIndicatorLight("R_FUEL_25_WARNL", 183, "Warning, Caution and IndicatorLights", "Right Fueltank 25L Warn Lamp (white)")
defineIndicatorLight("R_FUEL_30_WARNL", 184, "Warning, Caution and IndicatorLights", "Right Fueltank 30L Warn Lamp (white)")
defineIndicatorLight("R_FUEL_35_WARNL", 185, "Warning, Caution and IndicatorLights", "Right Fueltank 35L Warn Lamp (white)")
defineIndicatorLight("R_FUEL_40_WARNL", 186, "Warning, Caution and IndicatorLights", "Right Fueltank 40L Warn Lamp (white)")
defineIndicatorLight("R_FUEL_45_WARNL", 187, "Warning, Caution and IndicatorLights", "Right Fueltank 45L Warn Lamp (white)")
defineIndicatorLight("R_FUEL_50_WARNL", 188, "Warning, Caution and IndicatorLights", "Right Fueltank 50L Warn Lamp (white)")
defineIndicatorLight("R_FUEL_60_WARNL", 189, "Warning, Caution and IndicatorLights", "Right Fueltank 60L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_12_WARNL", 200, "Warning, Caution and IndicatorLights", "Left Fueltank 12L Warn Lamp (red)")
defineIndicatorLight("L_FUEL_15_WARNL", 201, "Warning, Caution and IndicatorLights", "Left Fueltank 15L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_20_WARNL", 202, "Warning, Caution and IndicatorLights", "Left Fueltank 20L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_25_WARNL", 203, "Warning, Caution and IndicatorLights", "Left Fueltank 25L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_30_WARNL", 204, "Warning, Caution and IndicatorLights", "Left Fueltank 30L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_35_WARNL", 205, "Warning, Caution and IndicatorLights", "Left Fueltank 35L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_40_WARNL", 206, "Warning, Caution and IndicatorLights", "Left Fueltank 40L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_45_WARNL", 207, "Warning, Caution and IndicatorLights", "Left Fueltank 45L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_50_WARNL", 208, "Warning, Caution and IndicatorLights", "Left Fueltank 50L Warn Lamp (white)")
defineIndicatorLight("L_FUEL_60_WARNL", 209, "Warning, Caution and IndicatorLights", "Left Fueltank 60L Warn Lamp (white)")
defineIndicatorLight("F_ARC15_LIGHT", 250, "Warning, Caution and IndicatorLights", "Front ARC-15 Signal Light (green)")
defineIndicatorLight("R_ARC15_LIGHT", 257, "Warning, Caution and IndicatorLights", "Rear ARC-15 Signal Light (green)")

--Externals
defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

defineFloat("FRONT_RADIO_100MHZ", 92, {0, 0.2}, "Gauges", "Fore VHF Radio 100 mhz")
defineFloat("FRONT_RADIO_1MHZ", 93, {0, 1}, "Gauges", "Fore VHF Radio 1 mhz")
defineFloat("FRONT_RADIO_100KHZ", 94, {0, 1}, "Gauges", "Fore VHF Radio 100 khz")
defineFloat("FRONT_RADIO_10KHZ", 95, {0, 1}, "Gauges", "Fore VHF Radio 10 khz")

local function getBaklan5Frequency()
    local bfreq1 = "00"
	local bfreq1F = GetDevice(0):get_argument_value(92)
	if     bfreq1F == nil then bfreq1 = "00"
	elseif bfreq1F >= 0    and bfreq1F <= 0.1 then bfreq1 = "11"
	elseif bfreq1F > 0.1 and bfreq1F <= 0.2 then bfreq1 = "12"
	elseif bfreq1F > 0.2  then bfreq1 = "13"
	end

    local bfreq2 = string.format("%.0f", GetDevice(0):get_argument_value(93)*10)--
	if bfreq2 == nil then bfreq2 = "0" end
    local bfreq3 = string.format("%.0f", GetDevice(0):get_argument_value(94)*10)--
	if bfreq3 == nil then bfreq3 = "0" end

    local bfreq4 = "00"
	local bfreq4F = GetDevice(0):get_argument_value(95)
	if     bfreq4F == nil then bfreq4 = "00"
	elseif bfreq4F >= 0    and bfreq4F < 0.25 then bfreq4 = "00"
	elseif bfreq4F >= 0.25 and bfreq4F < 0.5 then bfreq4 = "25"
	elseif bfreq4F >= 0.5 and bfreq4F < 0.75 then bfreq4 = "50"
	elseif bfreq4F >= 0.75 and bfreq4F < 1 then bfreq4 = "75"
	elseif bfreq4F >= 1                   then bfreq4 = "00"
	end

	return  bfreq1 .. bfreq2 .. "." .. bfreq3 .. bfreq4
end
defineString("BAKLAN5_FREQ", getBaklan5Frequency, 7, "BAKLAN-5", "Fore VHF Radio Frequency (String)")

defineFloat("FRONT_CANOPY_POS", 264, {0, 1}, "Gauges", "FRONT Canopy Position")
defineFloat("REAR_CANOPY_POS", 268, {0, 1}, "Gauges", "REAR Door Position")

BIOS.protocol.endModule()