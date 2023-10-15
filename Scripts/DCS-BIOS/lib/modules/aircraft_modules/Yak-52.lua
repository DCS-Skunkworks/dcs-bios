module("Yak-52", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class Yak_52: Module
local Yak_52 = Module:new("Yak-52", 0x2000, { "Yak-52" })
--by WarLord v1.1

--Remove Pilot Arg# 275 / Remove Instructor Arg# 276

--- Fore Pit
----- Fore Main Panel
Yak_52:definePushButton("FRONT_WBRAKES_LOCK", 2, 3028, 4, "Fore Main Panel", "Fore Wheel Brakes Lock")
Yak_52:defineToggleSwitch("FRONT_SMOKE", 6, 3039, 190, "Fore Main Panel", "Fore Smoke Apparat")
Yak_52:defineToggleSwitch("FRONT_STARTER_COVER", 3, 3035, 13, "Fore Main Panel", "Fore Starter Button Cover")
Yak_52:definePushButton("FRONT_STARTER", 3, 3039, 14, "Fore Main Panel", "Fore Starter Button")
Yak_52:defineTumb("FRONT_MAGNET_SEL", 3, 3003, 10, 0.1, { 0, 0.3 }, nil, false, "Fore Main Panel", "Fore Magnet Selector")
Yak_52:definePushButton("FRONT_LAMP_TEST", 4, 3049, 8, "Fore Main Panel", "Fore Lamp Test Button")
Yak_52:definePushButton("FRONT_STALL_TEST", 17, 3001, 41, "Fore Main Panel", "Fore Stall Warning Test Button")
Yak_52:definePushButton("FRONT_ACCEL_BTN", 6, 3001, 45, "Fore Main Panel", "Fore Accelerometer Button")
Yak_52:defineRotary("FRONT_ALT_KNOB", 6, 3004, 114, "Fore Main Panel", "Fore Altimeter Knob")
Yak_52:defineRotary("FRONT_AHORIZON_ZERO", 6, 3012, 143, "Fore Main Panel", "Fore Artificial Horizon Zeroing")
Yak_52:definePushButton("FRONT_AHORIZON_LOCK", 6, 3020, 145, "Fore Main Panel", "Fore Artificial Horizon LOCK Button")
Yak_52:defineToggleSwitch("FRONT_UCE_LOCK", 2, 3002, 33, "Fore Main Panel", "Fore Undercarriage Extension Lock")
Yak_52:defineRotary("FRONT_HSI_KNOB", 22, 3001, 155, "Fore Main Panel", "Fore HSI Knob")
Yak_52:definePushButton("FRONT_VOLTAMP_BTN", 15, 3001, 176, "Fore Main Panel", "Fore Voltamperemeter Button")
Yak_52:definePushButton("FRONT_FUEL_GAUGE_TEST", 16, 3001, 177, "Fore Main Panel", "Fore Fuel Gauge Test Button")
Yak_52:defineToggleSwitch("FRONT_FUEL_GAUGE_DIM", 16, 3002, 178, "Fore Main Panel", "Fore Fuel Gauge Dimmer")
Yak_52:defineTumb("FRONT_PRIMER_PUMP", 3, 3044, 76, 1.0, { -1, 1 }, nil, false, "Fore Main Panel", "Fore Primer Pump Selector OFF/Trunk/Cylinders")
----- Clock
Yak_52:definePushButton("FRONT_CLOCK_PUSH_L", 6, 3023, 119, "Fore Main Panel", "Fore Clock Left Push Button")
Yak_52:defineRotary("FRONT_CLOCK_ROTATE_L", 22, 3024, 120, "Fore Main Panel", "Fore Clock Left Rotate Knob")
Yak_52:definePushButton("FRONT_CLOCK_PUSH_R", 6, 3025, 121, "Fore Main Panel", "Fore Clock Right Push Button")
Yak_52:defineRotary("FRONT_CLOCK_ROTATE_R", 22, 3026, 122, "Fore Main Panel", "Fore Clock Right Rotate Knob")
----- SPU-9
Yak_52:definePotentiometer("FRONT_ICOM_VOL", 28, 3001, 80, { 0, 1 }, "SPU9", "Fore Intercom Volume Knob")
Yak_52:definePotentiometer("FRONT_RADIO_VOL", 28, 3004, 81, { 0, 1 }, "SPU9", "Fore Radio Volume Knob")
Yak_52:defineToggleSwitch("FRONT_ICOM_STBY_DISTR_SW", 28, 3007, 82, "SPU9", "Fore Intercom STBY Distributive Switch")
Yak_52:defineToggleSwitch("FRONT_ICOM_RDF_SW", 28, 3009, 83, "SPU9", "Fore Intercom RDF Switch")
----- BAKLAN-5
Yak_52:defineRotary("FRONT_VHF_RADIO_VOL", 27, 3002, 90, "BAKLAN-5", "Fore VHF Radio Volume Knob")
Yak_52:defineRotary("FRONT_VHF_RADIO_MHZ", 27, 3011, 88, "BAKLAN-5", "Fore VHF Radio Tune mhz")
Yak_52:defineRotary("FRONT_VHF_RADIO_KHZ", 27, 3008, 89, "BAKLAN-5", "Fore VHF Radio Tune khz")
Yak_52:defineToggleSwitch("FRONT_VHF_RADIO_SQ", 27, 3020, 91, "BAKLAN-5", "Fore VHF Radio Squelch")
----- Starboard Circuit Breakers Panel
Yak_52:defineToggleSwitch("FRONT_CB_BATTERY", 4, 3001, 96, "Circuit Breakers", "Fore Battery Selector")
Yak_52:defineToggleSwitch("FRONT_CB_GENERATOR", 4, 3004, 97, "Circuit Breakers", "Fore Generator CB")
Yak_52:defineToggleSwitch("FRONT_CB_IGNITION", 4, 3007, 98, "Circuit Breakers", "Fore Ignition CB")
Yak_52:defineToggleSwitch("FRONT_CB_PITOT", 4, 3010, 99, "Circuit Breakers", "Fore Pitot Heater CB")
Yak_52:definePushButton("FRONT_CB_OILDIL", 4, 3016, 232, "Circuit Breakers", "Fore Oil Dilution Button")
Yak_52:defineToggleSwitch("FRONT_CB_E_HEAT", 4, 3018, 233, "Circuit Breakers", "Fore SSKUA-1 Heater CB")
Yak_52:defineToggleSwitch("FRONT_CB_STALL", 4, 3021, 234, "Circuit Breakers", "Fore SSKUA-1 CB")
----- Port Wall
Yak_52:definePushButton("FRONT_RADIO_TX", 27, 3001, 192, "Throttle Quadrant", "Fore Radio Button")
Yak_52:definePushButton("FRONT_INTERCOM_TX", 27, 3023, 194, "Throttle Quadrant", "Fore Intercom Button")
Yak_52:definePotentiometer("FRONT_PROP_LEVER", 3, 3019, 198, { 0, 1 }, "Throttle Quadrant", "Fore Airscrew Lever")
Yak_52:definePotentiometer("FRONT_FRIC_LEVER", 3, 3027, 210, { 0, 1 }, "Throttle Quadrant", "Fore Left Frictioner Lever")
Yak_52:defineRotary("FRONT_TRIM_WHEEL", 2, 3032, 228, "Port Wall", "Fore Elevator Trim Wheel")
Yak_52:definePushButton("FRONT_FUEL_COCK", 3, 3047, 286, "Port Wall", "Fore Fuel Cock")
Yak_52:defineRotary("FRONT_PNEM_VALVE", 6, 3041, 230, "Port Wall", "Fore Pneumatic System Master Valve")
----- Port Circuit Breakers Panel
Yak_52:defineToggleSwitch("FRONT_CB_RADIO", 4, 3024, 226, "Circuit Breakers", "Fore Radio CB")
Yak_52:defineToggleSwitch("FRONT_CB_INTERCOM", 4, 3027, 225, "Circuit Breakers", "Fore Intercom CB")
Yak_52:defineToggleSwitch("FRONT_CB_UMFORMER2", 4, 3030, 224, "Circuit Breakers", "Fore PAG-1 CB")
Yak_52:defineToggleSwitch("FRONT_CB_UC", 4, 3033, 223, "Circuit Breakers", "Fore U/C CB")
Yak_52:defineToggleSwitch("FRONT_CB_UMFORMER1", 4, 3036, 222, "Circuit Breakers", "Fore PT-200 CB")
Yak_52:defineToggleSwitch("FRONT_CB_E_INSTR", 4, 3013, 221, "Circuit Breakers", "Fore Engine Instrumentation CB")
Yak_52:defineToggleSwitch("FRONT_CB_RDF", 4, 3039, 220, "Circuit Breakers", "Fore RDF CB")
Yak_52:defineToggleSwitch("FRONT_CB_SDG", 4, 3042, 219, "Circuit Breakers", "Fore SDG CB")
----- Starboard Wall
Yak_52:definePotentiometer("FRONT_WRADIATOR", 3, 3051, 235, { 0, 1 }, "Louvers Quadrant", "Fore Cooling Flaps Lever")
Yak_52:definePotentiometer("FRONT_ORADIATOR", 3, 3054, 236, { 0, 1 }, "Louvers Quadrant", "Fore Oil Radiator Lever")
Yak_52:definePotentiometer("FRONT_FRIC_R_LEVER", 3, 3057, 237, { 0, 1 }, "Louvers Quadrant", "Fore Right Frictioner Lever")
Yak_52:defineToggleSwitch("FRONT_MIXHEAT", 3, 3060, 238, "Starboard Wall", "Fore Carburettor Heater Lever")
Yak_52:defineRotary("FRONT_EMER_VALVE", 6, 3044, 239, "Starboard Wall", "Fore Pneumatic Emergency Valve 1")
Yak_52:defineToggleSwitch("FRONT_SDG_HEMI", 20, 3001, 258, "GMK-1A", "Fore Gyro Hemisphere Selector")
Yak_52:defineTumb("FRONT_SDG_MODE", 20, 3003, 259, 1, { -1, 0 }, nil, false, "GMK-1A", "Fore Gyro Mode MC/GC")
Yak_52:define3PosTumb("FRONT_SDG_CONTROL", 20, 3005, 260, "GMK-1A", "Fore Gyro Test Switch, 0 deg/OFF/300deg")
Yak_52:define3PosTumb("FRONT_SDG_COURSE", 20, 3007, 261, "GMK-1A", "Fore Gyro Heading Selector, Counter-Clockwise/OFF/Clockwise")
Yak_52:definePotentiometer("FRONT_SDG_LAT", 20, 3009, 262, { 0, 1 }, "GMK-1A", "Fore Gyro Latitude Selector")
Yak_52:defineTumb("FRONT_RDF_CHANNEL", 21, 3022, 244, 0.1, { 0.0, 0.5 }, nil, false, "ARK 15M", "Fore RDF Channel Selector")
Yak_52:defineToggleSwitch("FRONT_RDF_LISTEN", 21, 3007, 245, "ARK 15M", "Fore RDF Listen Mode")
Yak_52:defineToggleSwitch("FRONT_RDF_MODE12", 21, 3019, 246, "ARK 15M", "Fore RDF Mode")
Yak_52:definePotentiometer("FRONT_RDF_VOLUME", 21, 3001, 247, { 0, 1 }, "ARK 15M", "Fore RDF Volume")
Yak_52:definePushButton("FRONT_RDF_MODE3", 21, 3004, 248, "ARK 15M", "Fore RDF Loop")
Yak_52:definePushButton("FRONT_RDF_CSWITCH", 21, 3010, 249, "ARK 15M", "Fore RDF Control")
Yak_52:defineToggleSwitch("FRONT_CB_ADF", 21, 3025, 104, "ARK 15M", "Fore ADF Marker")
----- Canopy Controls
Yak_52:defineToggleSwitch("FRONT_HATCH_L", 2, 3051, 267, "Canopy", "Fore Left Canopy Lever")
Yak_52:definePushButton("FRONT_HATCH_R", 2, 3062, 288, "Canopy", "Fore Right Canopy Lever")
Yak_52:definePushButton("FRONT_HATCH_JET", 2, 3059, 266, "Canopy", "Fore Canopy Jettison")
--------------------------------------------------------------------------------------------------------
--- Rear Pit
----- Rear Main Panel
Yak_52:definePushButton("REAR_WBRAKES_LOCK", 2, 3029, 6, "Rear Main Panel", "Rear Wheel Brakes Lock")
Yak_52:definePushButton("REAR_BRAKES_CUT", 2, 3031, 212, "Rear Main Panel", "Rear Wheel Brakes Purge")
Yak_52:defineToggleSwitch("REAR_IGNITION", 3, 3001, 12, "Rear Main Panel", "Rear Ignition Source Switch")
Yak_52:defineTumb("REAR_MAGNET_SEL", 3, 3006, 11, 0.1, { 0, 0.3 }, nil, false, "Rear Main Panel", "Rear Magnet Selector")
Yak_52:defineToggleSwitch("REAR_STARTER_COVER", 3, 3036, 15, "Rear Main Panel", "Rear Starter Button Cover")
Yak_52:definePushButton("REAR_STARTER", 3, 3040, 16, "Rear Main Panel", "Rear Starter Button")
Yak_52:defineToggleSwitch("REAR_UCE_LOCK", 2, 3005, 35, "Rear Main Panel", "Rear Undercarriage Extension Lock")
Yak_52:definePushButton("REAR_LAMP_TEST", 4, 3099, 9, "Rear Main Panel", "Rear Lamp Test Button")
Yak_52:definePushButton("REAR_ACCEL_BTN", 6, 3002, 49, "Rear Main Panel", "Rear Accelerometer Button")
Yak_52:defineRotary("REAR_ALT_KNOB", 6, 3007, 118, "Rear Main Panel", "Rear Altimeter Knob")
Yak_52:defineRotary("REAR_AHORIZON_ZERO", 6, 3015, 149, "Rear Main Panel", "Rear Artificial Horizon Zeroing")
Yak_52:definePushButton("REAR_AHORIZON_LOCK", 6, 3021, 151, "Rear Main Panel", "Rear Artificial Horizon LOCK Button")
Yak_52:defineRotary("REAR_HSI_KNOB", 22, 3001, 279, "Rear Main Panel", "Rear HSI Knob")
----- Clock
Yak_52:definePushButton("REAR_CLOCK_PUSH_L", 6, 3027, 131, "Rear Main Panel", "Rear Clock Left Push Button")
Yak_52:defineRotary("REAR_CLOCK_ROTATE_L", 22, 3028, 132, "Rear Main Panel", "Rear Clock Left Rotate Knob")
Yak_52:definePushButton("REAR_CLOCK_PUSH_R", 6, 3029, 133, "Rear Main Panel", "Rear Clock Right Push Button")
Yak_52:defineRotary("REAR_CLOCK_ROTATE_R", 22, 3030, 134, "Rear Main Panel", "Rear Clock Right Rotate Knob")
----- SPU-9
Yak_52:definePotentiometer("REAR_ICOM_VOL", 28, 3011, 84, { 0, 1 }, "SPU9", "Rear Intercom Volume Knob")
Yak_52:definePotentiometer("REAR_RADIO_VOL", 28, 3014, 85, { 0, 1 }, "SPU9", "Rear Radio Volume Knob")
Yak_52:defineToggleSwitch("REAR_ICOM_STBY_DISTR_SW", 28, 3017, 86, "SPU9", "Rear Intercom STBY Distributive Switch")
Yak_52:defineToggleSwitch("REAR_ICOM_RDF_SW", 28, 3019, 87, "SPU9", "Rear Intercom RDF Switch")
----- Starboard Trainer Panel
Yak_52:defineToggleSwitch("REAR_CB_TPANEL_MASTER", 4, 3051, 100, "Circuit Breakers", "Rear Trainer Master CB")
Yak_52:defineToggleSwitch("REAR_CB_TPANEL_SPEED", 4, 3057, 101, "Circuit Breakers", "Rear Trainer Speedo CB")
Yak_52:defineToggleSwitch("REAR_CB_TPANEL_AH", 4, 3054, 102, "Circuit Breakers", "Rear Trainer AH CB")
Yak_52:defineToggleSwitch("REAR_CB_TPANEL_STAT", 4, 3060, 103, "Circuit Breakers", "Rear Trainer Statistics CB")
----- Port Wall
Yak_52:definePushButton("REAR_RADIO_TX", 27, 3051, 196, "Throttle Quadrant", "Rear Radio Button")
Yak_52:definePushButton("REAR_INTERCOM_TX", 27, 3052, 197, "Throttle Quadrant", "Rear Intercom Button")
Yak_52:definePotentiometer("REAR_PROP_LEVER", 3, 3022, 199, { 0, 1 }, "Throttle Quadrant", "Rear Airscrew Lever")
Yak_52:definePotentiometer("REAR_FRIC_LEVER", 3, 3030, 211, { 0, 1 }, "Throttle Quadrant", "Rear Left Frictioner Lever")
Yak_52:defineRotary("REAR_TRIM_WHEEL", 2, 3035, 229, "Port Wall", "Rear Elevator Trim Wheel")
Yak_52:definePushButton("REAR_FUEL_COCK", 3, 3048, 287, "Port Wall", "Rear Fuel Cock")
Yak_52:defineToggleSwitch("REAR_CB_BRAKES_CUT", 2, 3040, 293, "Circuit Breakers", "Rear Wheel Brakes Purge CB")
----- Starboard Wall
Yak_52:defineRotary("REAR_EMER_VALVE", 6, 3047, 241, "Starboard Wall", "Rear Pneumatic Emergency Valve 2")
Yak_52:defineTumb("REAR_RDF_CHANNEL", 21, 3072, 251, 0.1, { 0.0, 0.5 }, nil, false, "ARK 15M", "Rear RDF Channel Selector")
Yak_52:defineToggleSwitch("REAR_RDF_LISTEN", 21, 3057, 252, "ARK 15M", "Rear RDF Listen Mode")
Yak_52:defineToggleSwitch("REAR_RDF_MODE12", 21, 3069, 253, "ARK 15M", "Rear RDF Mode")
Yak_52:definePotentiometer("REAR_RDF_VOLUME", 21, 3051, 254, { 0, 1 }, "ARK 15M", "Rear RDF Volume")
Yak_52:definePushButton("REAR_RDF_MODE3", 21, 3054, 255, "ARK 15M", "Rear RDF Loop")
Yak_52:definePushButton("REAR_RDF_CSWITCH", 21, 3060, 256, "ARK 15M", "Rear RDF Control")
Yak_52:defineToggleSwitch("REAR_CB_ADF", 21, 3075, 105, "ARK 15M", "Rear ADF Marker")
----- Canopy Controls
Yak_52:defineToggleSwitch("REAR_HATCH_L", 2, 3054, 271, "Canopy", "Rear Left Canopy Lever")
Yak_52:definePushButton("REAR_HATCH_R", 2, 3063, 289, "Canopy", "Rear Right Canopy Lever")
Yak_52:definePushButton("REAR_HATCH_JET", 2, 3060, 270, "Canopy", "Rear Canopy Jettison")

--- Gauges
Yak_52:defineFloat("FRONT_ACCEL_MINUTE", 42, { -0.6, 0.9 }, "Gauges", "Fore Accelerometer Minute")
Yak_52:defineFloat("FRONT_ACCEL_MIN", 44, { -0.6, 0.9 }, "Gauges", "Fore Accelerometer Min")
Yak_52:defineFloat("FRONT_ACCEL_MAX", 43, { -0.6, 0.9 }, "Gauges", "Fore Accelerometer Max")
Yak_52:defineFloat("REAR_ACCEL_MINUTE", 46, { -0.6, 0.9 }, "Gauges", "Rear Accelerometer Minute")
Yak_52:defineFloat("REAR_ACCEL_MIN", 48, { -0.6, 0.9 }, "Gauges", "Rear Accelerometer Min")
Yak_52:defineFloat("REAR_ACCEL_MAX", 47, { -0.6, 0.9 }, "Gauges", "Rear Accelerometer Max")
Yak_52:defineFloat("FRONT_AIRSPEED", 109, { 0.0, 0.5 }, "Gauges", "Fore Airspeed Gauge")
Yak_52:defineFloat("REAR_AIRSPEED", 110, { 0.0, 0.5 }, "Gauges", "Rear Airspeed Gauge")
Yak_52:defineFloat("FRONT_ALT100", 111, { 0, 1 }, "Gauges", "Fore Altimeter 100")
Yak_52:defineFloat("FRONT_ALT1000", 112, { 0, 1 }, "Gauges", "Fore Altimeter 1000")
Yak_52:defineFloat("FRONT_ALT_PRESS", 113, { 0, 1 }, "Gauges", "Fore Altimeter Set Pressure")
Yak_52:defineFloat("REAR_ALT100", 115, { 0, 1 }, "Gauges", "Rear Altimeter 100")
Yak_52:defineFloat("REAR_ALT1000", 116, { 0, 1 }, "Gauges", "Rear Altimeter 1000")
Yak_52:defineFloat("REAR_ALT_PRESS", 117, { 0, 1 }, "Gauges", "Rear Altimeter Set Pressure")
Yak_52:defineFloat("FRONT_VARIOMETER", 161, { -1, 1 }, "Gauges", "Fore Variometer Gauge")
Yak_52:defineFloat("FRONT_TURN", 162, { -1, 1 }, "Gauges", "Fore Turn Gauge")
Yak_52:defineFloat("FRONT_SLIP", 163, { -1, 1 }, "Gauges", "Fore Sideslip Gauge")
Yak_52:defineFloat("REAR_VARIOMETER", 164, { -1, 1 }, "Gauges", "Rear Variometer Gauge")
Yak_52:defineFloat("REAR_TURN", 165, { -1, 1 }, "Gauges", "Rear Turn Gauge")
Yak_52:defineFloat("REAR_SLIP", 166, { -1, 1 }, "Gauges", "Rear Sideslip Gauge")
Yak_52:defineFloat("FRONT_AH_BANK", 146, { 1.0, -1.0 }, "Gauges", "Fore Artificial Horizon Bank")
Yak_52:defineFloat("FRONT_AH_PITCH", 147, { 1.0, -1.0 }, "Gauges", "Fore Artificial Horizon Pitch")
Yak_52:defineFloat("FRONT_AH_SLIP", 148, { 1.0, -1.0 }, "Gauges", "Fore Artificial Horizon Sideslip")
Yak_52:defineFloat("REAR_AH_BANK", 152, { 1.0, -1.0 }, "Gauges", "Rear Artificial Horizon Bank")
Yak_52:defineFloat("REAR_AH_PITCH", 153, { 1.0, -1.0 }, "Gauges", "Rear Artificial Horizon Pitch")
Yak_52:defineFloat("REAR_AH_SLIP", 154, { 1.0, -1.0 }, "Gauges", "Rear Artificial Horizon Sideslip")
Yak_52:defineFloat("FRONT_TACHO", 106, { 0, 1 }, "Gauges", "Fore Tachometer Gauge")
Yak_52:defineFloat("REAR_TACHO", 106, { 0, 1 }, "Gauges", "Rear Tachometer Gauge")
Yak_52:defineFloat("MANIFOLD_PRESS", 108, { 0, 1 }, "Gauges", "Manifold Pressure Gauge")
Yak_52:defineFloat("MANIFOLD_TEMP", 160, { -1.0, 0.6 }, "Gauges", "Manifold Temperature Gauge")
Yak_52:defineFloat("VOLTMETER_G", 175, { -0.2, 0.6 }, "Gauges", "Volt Amperemeter Gauge")
Yak_52:defineFloat("FRONT_UGR4K_CURR_CRS", 156, { 0, 1 }, "Gauges", "Fore UGR-4K Current Course")
Yak_52:defineFloat("FRONT_UGR4K_SET_CRS", 157, { 0, 1 }, "Gauges", "Fore UGR-4K Set Course")
Yak_52:defineFloat("FRONT_UGR4K_BCN_CRS", 158, { 0, 1 }, "Gauges", "Fore UGR-4K Beacon Course")
Yak_52:defineFloat("REAR_UGR4K_CURR_CRS", 280, { 0, 1 }, "Gauges", "Rear UGR-4K Current Course")
Yak_52:defineFloat("REAR_UGR4K_SET_CRS", 281, { 0, 1 }, "Gauges", "Rear UGR-4K Set Course")
Yak_52:defineFloat("REAR_UGR4K_BCN_CRS", 282, { 0, 1 }, "Gauges", "Rear UGR-4K Beacon Course")
Yak_52:defineFloat("FRONT_OIL_PRESS", 169, { -1, 1 }, "Gauges", "Fore Oil Pressure Gauge")
Yak_52:defineFloat("FRONT_OIL_TEMP", 167, { -1, 1 }, "Gauges", "Fore Oil Temperature Gauge")
Yak_52:defineFloat("FRONT_FUEL_PRESS", 168, { -1, 1 }, "Gauges", "Fore Fuel Pressure Gauge")
Yak_52:defineFloat("REAR_OIL_PRESS", 172, { -1, 1 }, "Gauges", "Rear Oil Pressure Gauge")
Yak_52:defineFloat("REAR_OIL_TEMP", 170, { -1, 1 }, "Gauges", "Rear Oil Temperature Gauge")
Yak_52:defineFloat("REAR_FUEL_PRESS", 171, { -1, 1 }, "Gauges", "Rear Fuel Pressure Gauge")
Yak_52:defineFloat("FRONT_CYL_TEMP", 173, { -0.05, 0.35 }, "Gauges", "Fore Cylinder Heads Temperature Gauge")
Yak_52:defineFloat("REAR_CYL_TEMP", 174, { -0.05, 0.35 }, "Gauges", "Rear Cylinder Heads Temperature Gauge")
Yak_52:defineFloat("FRONT_PNEU_MAIN_PRESS", 37, { 0, 1 }, "Gauges", "Fore Pneumatic Main Pressure Gauge")
Yak_52:defineFloat("FRONT_PNEU_STBY_PRESS", 38, { 0, 1 }, "Gauges", "Fore Pneumatic Standby Pressure Gauge")
Yak_52:defineFloat("REAR_PNEU_MAIN_PRESS", 39, { 0, 1 }, "Gauges", "Rear Pneumatic Main Pressure Gauge")
Yak_52:defineFloat("REAR_PNEU_STBY_PRESS", 40, { 0, 1 }, "Gauges", "Rear Pneumatic Standby Pressure Gauge")
Yak_52:defineFloat("FRONT_COMPASS_PITCH", 51, { -1, 1 }, "Gauges", "Fore Compass Pitch")
Yak_52:defineFloat("FRONT_COMPASS_BANK", 50, { -1, 1 }, "Gauges", "Fore Compass Bank")
Yak_52:defineFloat("FRONT_COMPASS_HDG", 52, { -1, 1 }, "Gauges", "Fore Compass Heading")
Yak_52:defineFloat("REAR_COMPASS_PITCH", 54, { -1, 1 }, "Gauges", "Rear Compass Pitch")
Yak_52:defineFloat("REAR_COMPASS_BANK", 53, { -1, 1 }, "Gauges", "Rear Compass Bank")
Yak_52:defineFloat("REAR_COMPASS_HDG", 55, { -1, 1 }, "Gauges", "Rear Compass Heading")

--- Warning, Caution and IndicatorLights
Yak_52:defineIndicatorLight("F_L_GEAR_UP", 17, "Warning, Caution and IndicatorLights", "Front Left Gear UP Lamp (red)")
Yak_52:defineIndicatorLight("F_N_GEAR_UP", 18, "Warning, Caution and IndicatorLights", "Front Nose Gear UP Lamp (red)")
Yak_52:defineIndicatorLight("F_R_GEAR_UP", 19, "Warning, Caution and IndicatorLights", "Front Right Gear UP Lamp (red)")
Yak_52:defineIndicatorLight("F_L_GEAR_DOWN", 20, "Warning, Caution and IndicatorLights", "Front Left Gear DOWN Lamp (green)")
Yak_52:defineIndicatorLight("F_N_GEAR_DOWN", 21, "Warning, Caution and IndicatorLights", "Front Nose Gear DOWN Lamp (green)")
Yak_52:defineIndicatorLight("F_R_GEAR_DOWN", 22, "Warning, Caution and IndicatorLights", "Front Right Gear DOWN Lamp (green)")
Yak_52:defineIndicatorLight("R_L_GEAR_UP", 23, "Warning, Caution and IndicatorLights", "Rear Left Gear UP Lamp (red)")
Yak_52:defineIndicatorLight("R_N_GEAR_UP", 24, "Warning, Caution and IndicatorLights", "Rear Nose Gear UP Lamp (red)")
Yak_52:defineIndicatorLight("R_R_GEAR_UP", 25, "Warning, Caution and IndicatorLights", "Rear Right Gear UP Lamp (red)")
Yak_52:defineIndicatorLight("R_L_GEAR_DOWN", 26, "Warning, Caution and IndicatorLights", "Rear Left Gear DOWN Lamp (green)")
Yak_52:defineIndicatorLight("R_N_GEAR_DOWN", 27, "Warning, Caution and IndicatorLights", "Rear Nose Gear DOWN Lamp (green)")
Yak_52:defineIndicatorLight("R_R_GEAR_DOWN", 28, "Warning, Caution and IndicatorLights", "Rear Right Gear DOWN Lamp (green)")
Yak_52:defineIndicatorLight("F_FLAPS_UP", 29, "Warning, Caution and IndicatorLights", "Front Flaps UP Lamp (green)")
Yak_52:defineIndicatorLight("F_FLAPS_DOWN", 30, "Warning, Caution and IndicatorLights", "Front Flaps DOWN Lamp (yellow)")
Yak_52:defineIndicatorLight("R_FLAPS_UP", 31, "Warning, Caution and IndicatorLights", "Rear Flaps UP Lamp (green)")
Yak_52:defineIndicatorLight("R_FLAPS_DOWN", 32, "Warning, Caution and IndicatorLights", "Rear Flaps DOWN Lamp (yellow)")
Yak_52:defineIndicatorLight("F_STALL_WARNL", 56, "Warning, Caution and IndicatorLights", "Front Stall Warn Lamp (red)")
Yak_52:defineIndicatorLight("F_SPEED_WARNL", 57, "Warning, Caution and IndicatorLights", "Front Danger Speed Warn Lamp (yellow)")
Yak_52:defineIndicatorLight("F_METAL_WARNL", 58, "Warning, Caution and IndicatorLights", "Front Metal Chips Warn Lamp (yellow)")
Yak_52:defineIndicatorLight("F_GEN_WARNL", 59, "Warning, Caution and IndicatorLights", "Front Generator Fault Warn Lamp (red)")
Yak_52:defineIndicatorLight("F_MAXG_WARNL", 60, "Warning, Caution and IndicatorLights", "Front Max G Warn Lamp (red)")
Yak_52:defineIndicatorLight("F_GYRO_WARNL", 61, "Warning, Caution and IndicatorLights", "Front Gyro Compass Warn Lamp (yellow)")
Yak_52:defineIndicatorLight("F_STALL_HEAT_WARNL", 62, "Warning, Caution and IndicatorLights", "Front Stall Heat Warn Lamp (green)")
Yak_52:defineIndicatorLight("F_PITOT_HEAT_WARNL", 63, "Warning, Caution and IndicatorLights", "Front Pitot-Tube Heat Warn Lamp (green)")
Yak_52:defineIndicatorLight("R_MAXG_WARNL", 64, "Warning, Caution and IndicatorLights", "Rear Max G Warn Lamp (red)")
Yak_52:defineIndicatorLight("R_STALL_WARNL", 65, "Warning, Caution and IndicatorLights", "Rear Stall Warn Lamp (red)")
Yak_52:defineIndicatorLight("R_SPEED_WARNL", 66, "Warning, Caution and IndicatorLights", "Rear Danger Speed Warn Lamp (yellow)")
Yak_52:defineIndicatorLight("R_GEN_WARNL", 67, "Warning, Caution and IndicatorLights", "Rear Generator Fault Warn Lamp (red)")
Yak_52:defineIndicatorLight("R_FUEL_L_WARNL", 68, "Warning, Caution and IndicatorLights", "Rear Fuel 12L Left Warn Lamp (red)")
Yak_52:defineIndicatorLight("R_FUEL_R_WARNL", 69, "Warning, Caution and IndicatorLights", "Rear Fuel 12L Right Warn Lamp (red)")
Yak_52:defineIndicatorLight("R_BATT_WARNL", 70, "Warning, Caution and IndicatorLights", "Rear Battery ON Warn Lamp (green)")
Yak_52:defineIndicatorLight("R_GYRO_WARNL", 71, "Warning, Caution and IndicatorLights", "Rear Gyro Compass Warn Lamp (yellow)")
Yak_52:defineIndicatorLight("R_METAL_WARNL", 72, "Warning, Caution and IndicatorLights", "Rear Metal Chips Warn Lamp (yellow)")
Yak_52:defineIndicatorLight("R_PITOT_HEAT_WARNL", 73, "Warning, Caution and IndicatorLights", "Rear Pitot-Tube Heat Warn Lamp (green)")
Yak_52:defineIndicatorLight("R_STALL_HEAT_WARNL", 74, "Warning, Caution and IndicatorLights", "Rear Stall Heat Warn Lamp (green)")
Yak_52:defineIndicatorLight("R_EMPTY_WARNL", 75, "Warning, Caution and IndicatorLights", "Rear Empty Warn Lamp (green)")
Yak_52:defineIndicatorLight("R_FUEL_12_WARNL", 180, "Warning, Caution and IndicatorLights", "Right Fueltank 12L Warn Lamp (red)")
Yak_52:defineIndicatorLight("R_FUEL_15_WARNL", 181, "Warning, Caution and IndicatorLights", "Right Fueltank 15L Warn Lamp (white)")
Yak_52:defineIndicatorLight("R_FUEL_20_WARNL", 182, "Warning, Caution and IndicatorLights", "Right Fueltank 20L Warn Lamp (white)")
Yak_52:defineIndicatorLight("R_FUEL_25_WARNL", 183, "Warning, Caution and IndicatorLights", "Right Fueltank 25L Warn Lamp (white)")
Yak_52:defineIndicatorLight("R_FUEL_30_WARNL", 184, "Warning, Caution and IndicatorLights", "Right Fueltank 30L Warn Lamp (white)")
Yak_52:defineIndicatorLight("R_FUEL_35_WARNL", 185, "Warning, Caution and IndicatorLights", "Right Fueltank 35L Warn Lamp (white)")
Yak_52:defineIndicatorLight("R_FUEL_40_WARNL", 186, "Warning, Caution and IndicatorLights", "Right Fueltank 40L Warn Lamp (white)")
Yak_52:defineIndicatorLight("R_FUEL_45_WARNL", 187, "Warning, Caution and IndicatorLights", "Right Fueltank 45L Warn Lamp (white)")
Yak_52:defineIndicatorLight("R_FUEL_50_WARNL", 188, "Warning, Caution and IndicatorLights", "Right Fueltank 50L Warn Lamp (white)")
Yak_52:defineIndicatorLight("R_FUEL_60_WARNL", 189, "Warning, Caution and IndicatorLights", "Right Fueltank 60L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_12_WARNL", 200, "Warning, Caution and IndicatorLights", "Left Fueltank 12L Warn Lamp (red)")
Yak_52:defineIndicatorLight("L_FUEL_15_WARNL", 201, "Warning, Caution and IndicatorLights", "Left Fueltank 15L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_20_WARNL", 202, "Warning, Caution and IndicatorLights", "Left Fueltank 20L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_25_WARNL", 203, "Warning, Caution and IndicatorLights", "Left Fueltank 25L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_30_WARNL", 204, "Warning, Caution and IndicatorLights", "Left Fueltank 30L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_35_WARNL", 205, "Warning, Caution and IndicatorLights", "Left Fueltank 35L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_40_WARNL", 206, "Warning, Caution and IndicatorLights", "Left Fueltank 40L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_45_WARNL", 207, "Warning, Caution and IndicatorLights", "Left Fueltank 45L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_50_WARNL", 208, "Warning, Caution and IndicatorLights", "Left Fueltank 50L Warn Lamp (white)")
Yak_52:defineIndicatorLight("L_FUEL_60_WARNL", 209, "Warning, Caution and IndicatorLights", "Left Fueltank 60L Warn Lamp (white)")
Yak_52:defineIndicatorLight("F_ARC15_LIGHT", 250, "Warning, Caution and IndicatorLights", "Front ARC-15 Signal Light (green)")
Yak_52:defineIndicatorLight("R_ARC15_LIGHT", 257, "Warning, Caution and IndicatorLights", "Rear ARC-15 Signal Light (green)")

--Externals
Yak_52:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
Yak_52:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
Yak_52:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

Yak_52:defineFloat("FRONT_RADIO_100MHZ", 92, { 0, 0.2 }, "Gauges", "Fore VHF Radio 100 mhz")
Yak_52:defineFloat("FRONT_RADIO_1MHZ", 93, { 0, 1 }, "Gauges", "Fore VHF Radio 1 mhz")
Yak_52:defineFloat("FRONT_RADIO_100KHZ", 94, { 0, 1 }, "Gauges", "Fore VHF Radio 100 khz")
Yak_52:defineFloat("FRONT_RADIO_10KHZ", 95, { 0, 1 }, "Gauges", "Fore VHF Radio 10 khz")

local function getBaklan5Frequency(dev0)
	local bfreq1 = "00"
	local bfreq1F = dev0:get_argument_value(92)
	if bfreq1F ~= nil then
		if bfreq1F >= 0 and bfreq1F <= 0.1 then
			bfreq1 = "11"
		elseif bfreq1F > 0.1 and bfreq1F <= 0.2 then
			bfreq1 = "12"
		elseif bfreq1F > 0.2 then
			bfreq1 = "13"
		end
	end

	local bfreq2F = dev0:get_argument_value(93)
	local bfreq2 = bfreq2F ~= nil and string.format("%.0f", dev0:get_argument_value(93) * 10) or "0"
	local bfreq3F = dev0:get_argument_value(94)
	local bfreq3 = bfreq3F ~= nil and string.format("%.0f", dev0:get_argument_value(94) * 10) or "0"

	local bfreq4 = "00"
	local bfreq4F = dev0:get_argument_value(95)
	if bfreq4F ~= nil then
		if bfreq4F >= 0.25 and bfreq4F < 0.5 then
			bfreq4 = "25"
		elseif bfreq4F >= 0.5 and bfreq4F < 0.75 then
			bfreq4 = "50"
		elseif bfreq4F >= 0.75 and bfreq4F < 1 then
			bfreq4 = "75"
		end
	end

	return bfreq1 .. bfreq2 .. "." .. bfreq3 .. bfreq4
end
Yak_52:defineString("BAKLAN5_FREQ", getBaklan5Frequency, 7, "BAKLAN-5", "Fore VHF Radio Frequency (String)")

Yak_52:defineFloat("FRONT_CANOPY_POS", 264, { 0, 1 }, "Gauges", "FRONT Canopy Position")
Yak_52:defineFloat("REAR_CANOPY_POS", 268, { 0, 1 }, "Gauges", "REAR Door Position")

Yak_52:defineReadWriteRadio("LANDYSH5_RADIO", 27, 7, 3, 1000, "LANDYSh-5 Radio")

return Yak_52
