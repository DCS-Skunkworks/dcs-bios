module("FW-190A8", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class FW_190A8: Module
local FW_190A8 = Module:new("FW-190A8", 0x3800, { "FW-190A8" })

FW_190A8:defineTumb("MAGNETO", 2, 3004, 75, 0.3, { 0, 0.9 }, nil, false, "Cockpit", "Magneto Switch")
FW_190A8:defineToggleSwitch("STARTER_CVR", 2, 3006, 104, "Cockpit", "Starter Switch Cover")
FW_190A8:defineTumb("STARTER_SWITCH", 2, 3008, 105, 0.5, { 0, 1 }, nil, false, "Cockpit", "Starter Switch. Starter Power")
FW_190A8:defineToggleSwitch("ING_MODE", 2, 3013, 111, "Cockpit", "Ingnition Mode Manual/Auto)")
FW_190A8:defineTumb("FUEL_TNK_SEL", 6, 3001, 90, 0.1, { 0, 0.3 }, nil, false, "Cockpit", "Fuel Tank Selector Valve (CLOSE/FORWARD/BOTH/AFT)")
FW_190A8:defineTumb("FUEL_GAUGE_SEL", 6, 3002, 99, 0.5, { 0, 1 }, nil, false, "Cockpit", "Fuel Gauge Selector (FORWARD/NONE/AFT)")
FW_190A8:definePushButton("FUEL_PRIM_PMPL", 6, 3009, 162, "Cockpit", "Primer Pump")
FW_190A8:definePushButton("FUEL_CUTTOFF", 6, 3010, 91, "Cockpit", "Fuel Cutoff Handle")
FW_190A8:definePushButton("STARTER_BRUSH", 6, 3017, 93, "Cockpit", "Retract starter brushes")
FW_190A8:definePotentiometer("OXY_FLOW_VALVE", 4, 3003, 110, { 0, 0.5 }, "Cockpit", "Oxygen Flow Valve")
FW_190A8:defineToggleSwitch("OXY_EMG_KNOB", 4, 3001, 190, "Cockpit", "Oxygen Emergency Knob")
FW_190A8:defineToggleSwitch("EL_KILL", 1, 3075, 79, "Cockpit", "Electric Kill-switch")
FW_190A8:defineToggleSwitch("CANOPY_EMG_REL", 3, 3006, 115, "Cockpit", "Canopy Emergency Release Handle")
FW_190A8:defineRotary("CANOPY_HAND_CRK", 3, 3001, 114, "Cockpit", "Canopy Hand Crank")
FW_190A8:defineToggleSwitch("THR_LOCK", 2, 3011, 200, "Cockpit", "Throttle Lock")
FW_190A8:defineRotary("ALT_PRESS_SET", 10, 3001, 34, "Cockpit", "Altimeter Pressure Set")
FW_190A8:definePotentiometer("HOR_CAGE", 12, 3001, 39, { 0.511, 1 }, "Cockpit", "Horizon Cage")
FW_190A8:defineRotary("TURN_BEZ", 13, 3004, 24, "Cockpit", "Turnable Bezel")
FW_190A8:defineRotary("WND_SET", 13, 3001, 25, "Cockpit", "Wind/Set Knob")
FW_190A8:definePushButton("START_STOP", 13, 3002, 26, "Cockpit", "Start - Stop Button")
FW_190A8:definePushButton("STOPWATCH", 13, 3003, 28, "Cockpit", "Stopwatch Button")
FW_190A8:define3PosTumb("HOR_STAB_TRIM", 8, 3012, 77, "Cockpit", "Stabilizer Trimmer Up/Down")
FW_190A8:defineRotary("INSTR_LGHT_CTRL", 7, 3001, 78, "Cockpit", "Instrument Lights Brightness")

FW_190A8:defineToggleSwitch("FLAPS_UP_TOGGLE", 8, 3001, 62, "Flaps", "Flaps Up")
FW_190A8:defineToggleSwitch("FLAPS_TO", 8, 3002, 63, "Flaps", "Flaps Take Off")
FW_190A8:defineToggleSwitch("FLAPS_LAND", 8, 3003, 64, "Flaps", "Flaps Landing")
FW_190A8:defineRotary("COOL_FLAP_CTRL", 8, 3013, 159, "Flaps", "Cooling Flaps Control")

FW_190A8:defineToggleSwitch("LG_RET", 8, 3005, 65, "Gear", "Landing Gears Retraction")
FW_190A8:defineToggleSwitch("LG_RET_CVR", 8, 3006, 66, "Gear", "Landing Gears Retraction Cover")
FW_190A8:defineToggleSwitch("LG_EXT", 8, 3007, 67, "Gear", "Landing Gears Extending")
FW_190A8:defineToggleSwitch("EMG_LG_REL", 8, 3008, 89, "Gear", "Landing Gear Emergency Release Handle")

FW_190A8:defineRockerSwitch("PROP_PITCH", 2, 3014, 3014, 3015, 3015, 3, "Engine", "Propellor Pitch De/Increase")

FW_190A8:defineToggleSwitch("MASTER_ARM", 20, 3001, 48, "Weapon Control", "Master Arm")
FW_190A8:defineToggleSwitch("QUT_WING_ARM", 20, 3020, 49, "Weapon Control", "Outer Wing Guns Arm")
FW_190A8:defineRotary("GUN1_AMM_C", 20, 3003, 51, "Weapon Control", "Set Gun 1 Ammunition Count")
FW_190A8:defineRotary("GUN2_AMM_C", 20, 3005, 54, "Weapon Control", "Set Gun 2 Ammunition Count")
FW_190A8:defineRotary("GUN3_AMM_C", 20, 3007, 57, "Weapon Control", "Set Gun 3 Ammunition Count")
FW_190A8:defineRotary("GUN4_AMM_C", 20, 3009, 60, "Weapon Control", "Set Gun 4 Ammunition Count")
FW_190A8:defineTumb("BMB_FUSE_SEL", 20, 3016, 109, 0.1, { 0, 0.4 }, nil, false, "Weapon Control", "Bomb Fusing Selector")
FW_190A8:definePushButton("JETT_FUS_STORES", 20, 3018, 92, "Weapon Control", "Jettison Fuselage Stores")

FW_190A8:definePotentiometer("SIGHT_BRIGHT", 21, 3001, 133, { 1, 0 }, "Gun Sight", "Gunsight Brightness Rheostat")
FW_190A8:defineToggleSwitch("SIGHT_SMOKE", 21, 3004, 134, "Gun Sight", "Gun Sight Smoked Screen Controls")

FW_190A8:defineToggleSwitch("CB_ORD_ON", 1, 3005, 141, "Circuit Breakers", "Drop Ordnance & Optional Armament Power On")
FW_190A8:definePushButton("CB_ORD_OFF", 1, 3040, 142, "Circuit Breakers", "Drop Ordnance & Optional Armament Power Off")
FW_190A8:defineToggleSwitch("CB_GUN_CAM_ON", 1, 3006, 143, "Circuit Breakers", "Gun Sight and Gun Camera Power On")
FW_190A8:definePushButton("CB_GUN_CAM_OFF", 1, 3041, 144, "Circuit Breakers", "Gun Sight and Gun Camera Power Off")
FW_190A8:defineToggleSwitch("CB_INSTRUMENTS_ON", 1, 3007, 145, "Circuit Breakers", "Instruments Power On")
FW_190A8:definePushButton("CB_INSTRUMENTS_OFF", 1, 3042, 146, "Circuit Breakers", "Instruments Power Off")
FW_190A8:defineToggleSwitch("CB_NAV_LIGHTS_ON", 1, 3008, 147, "Circuit Breakers", "Navigation Lights Power On")
FW_190A8:definePushButton("CB_NAV_LIGHTS_OFF", 1, 3043, 148, "Circuit Breakers", "Navigation Lights Power Off")
FW_190A8:defineToggleSwitch("CB_CABIN_LIGHTS_ON", 1, 3009, 149, "Circuit Breakers", "Cabin Illumination Power On")
FW_190A8:definePushButton("CB_CABIN_LIGHTS_OFF", 1, 3044, 150, "Circuit Breakers", "Cabin Illumination Power Off")
FW_190A8:defineToggleSwitch("CB_CLOTH_HEAT_ON", 1, 3010, 151, "Circuit Breakers", "Clothes Heating Power On")
FW_190A8:definePushButton("CB_CLOTH_HEAT_OFF", 1, 3045, 152, "Circuit Breakers", "Clothes Heating Power Off")
FW_190A8:defineToggleSwitch("CB_PITOT_HEAT_ON", 1, 3011, 153, "Circuit Breakers", "Pitot Heating Power On")
FW_190A8:definePushButton("CB_PITOT_HEAT_OFF", 1, 3046, 154, "Circuit Breakers", "Pitot Heating Power Off")
FW_190A8:defineToggleSwitch("CB_IGNITION_ON", 1, 3012, 155, "Circuit Breakers", "Ignition Power On")
FW_190A8:definePushButton("CB_IGNITION_OFF", 1, 3047, 156, "Circuit Breakers", "Ignition Power Off")
FW_190A8:defineToggleSwitch("CB_IFF_ON", 1, 3013, 157, "Circuit Breakers", "FuG 25a IFF Power On")
FW_190A8:definePushButton("CB_IFF_OFF", 1, 3048, 158, "Circuit Breakers", "FuG 25a IFF Power Off")
FW_190A8:defineToggleSwitch("CB_GEN_ON", 1, 3014, 170, "Circuit Breakers", "Generator Power On")
FW_190A8:definePushButton("CB_GEN_OFF", 1, 3049, 171, "Circuit Breakers", "Generator Power Off")
FW_190A8:defineToggleSwitch("CB_BATT_ON", 1, 3015, 172, "Circuit Breakers", "Battery Power On")
FW_190A8:definePushButton("CB_BATT_OFF", 1, 3050, 173, "Circuit Breakers", "Battery Power Off")
FW_190A8:defineToggleSwitch("CB_EXT_PW_ON", 1, 3016, 120, "Circuit Breakers", "Battery Power On")
FW_190A8:definePushButton("CB_EXT_PW_OFF", 1, 3051, 121, "Circuit Breakers", "Battery Power Off")
FW_190A8:defineToggleSwitch("CB_F_TANK_PUMP_ON", 1, 3017, 123, "Circuit Breakers", "Fore Tank Fuel Pump Power On")
FW_190A8:definePushButton("CB_F_TANK_PUMP_OFF", 1, 3052, 122, "Circuit Breakers", "Fore Tank Fuel Pump Power Off")
FW_190A8:defineToggleSwitch("CB_A_TANK_PUMP_ON", 1, 3018, 125, "Circuit Breakers", "Aft Tank Fuel Pump Power On")
FW_190A8:definePushButton("CB_A_TANK_PUMP_OFF", 1, 3053, 124, "Circuit Breakers", "Aft Tank Fuel Pump Power Off")
FW_190A8:defineToggleSwitch("CB_D_TANK_PUMP_ON", 1, 3019, 127, "Circuit Breakers", "Drop Tank Fuel Pump Power On")
FW_190A8:definePushButton("CB_D_TANK_PUMP_OFF", 1, 3054, 126, "Circuit Breakers", "Drop Tank Fuel Pump Power Off")
FW_190A8:defineToggleSwitch("CB_AUX_TANK_PUMP_ON", 1, 3020, 129, "Circuit Breakers", "Aux. Tank Fuel Pump Power On")
FW_190A8:definePushButton("CB_AUX_TANK_PUMP_OFF", 1, 3055, 128, "Circuit Breakers", "Aux. Tank Fuel Pump Power Off")
FW_190A8:defineToggleSwitch("CB_RADIO_ON", 1, 3021, 174, "Circuit Breakers", "FuG 16 ZY Radio Power On")
FW_190A8:definePushButton("CB_RADIO_OFF", 1, 3056, 175, "Circuit Breakers", "FuG 16 ZY Radio Power Off")
FW_190A8:defineToggleSwitch("CB_GEAR_ON", 1, 3022, 176, "Circuit Breakers", "Undercarriage Drives Power On")
FW_190A8:definePushButton("CB_GEAR_OFF", 1, 3057, 177, "Circuit Breakers", "Undercarriage Drives Power Off")
FW_190A8:defineToggleSwitch("CB_FLAPS_ON", 1, 3023, 178, "Circuit Breakers", "Landing Flaps Power On")
FW_190A8:definePushButton("CB_FLAPS_OFF", 1, 3058, 179, "Circuit Breakers", "Landing Flaps Power Off")
FW_190A8:defineToggleSwitch("CB_PROP_DRIVE_ON", 1, 3024, 180, "Circuit Breakers", "Prop. Pitch Drive Power On")
FW_190A8:definePushButton("CB_PROP_DRIVE_OFF", 1, 3059, 181, "Circuit Breakers", "Prop. Pitch Drive Power Off")
FW_190A8:defineToggleSwitch("CB_PROP_CONTR_ON", 1, 3025, 182, "Circuit Breakers", "Prop. Pitch Controls Power On")
FW_190A8:definePushButton("CB_PROP_CONTR_OFF", 1, 3060, 183, "Circuit Breakers", "Prop. Pitch Controls Power Off")
FW_190A8:defineToggleSwitch("CB_STAB_TRIM_ON", 1, 3026, 184, "Circuit Breakers", "Stabilizer Trim Power On")
FW_190A8:definePushButton("CB_STAB_TRIM_OFF", 1, 3061, 185, "Circuit Breakers", "Stabilizer Trim Power Off")
FW_190A8:defineToggleSwitch("CB_ART_HORIZON_ON", 1, 3027, 186, "Circuit Breakers", "Artificial Horizon Power On")
FW_190A8:definePushButton("CB_ART_HORIZON_OFF", 1, 3062, 187, "Circuit Breakers", "Artificial Horizon Power Off")
FW_190A8:defineToggleSwitch("CB_MOT_GEN_ON", 1, 3028, 188, "Circuit Breakers", "Motor-Generator Power On")
FW_190A8:definePushButton("CB_MOT_GEN_OFF", 1, 3063, 189, "Circuit Breakers", "Motor-Generator Power Off")
FW_190A8:defineToggleSwitch("CB_REP_COMP_ON", 1, 3029, 191, "Circuit Breakers", "Repeater Compass Power On")
FW_190A8:definePushButton("CB_REP_COMP_OFF", 1, 3064, 192, "Circuit Breakers", "Repeater Compass Power Off")
FW_190A8:defineToggleSwitch("CB_GEAR_CONT_ON", 1, 3030, 196, "Circuit Breakers", "Undercarriage Controls Power On")
FW_190A8:definePushButton("CB_GEAR_CONT_OFF", 1, 3065, 197, "Circuit Breakers", "Undercarriage Controls Power Off")
FW_190A8:defineToggleSwitch("CB_IFF_DEST_ON", 1, 3031, 201, "Circuit Breakers", "FuG 25a IFF Self-Destruct Power On")
FW_190A8:definePushButton("CB_IFF_DEST_OFF", 1, 3066, 202, "Circuit Breakers", "FuG 25a IFF Self-Destruct Power Off")
FW_190A8:defineToggleSwitch("CB_GUNS_OUT_ON", 1, 3032, 214, "Circuit Breakers", "Outer Wing Guns Power On")
FW_190A8:definePushButton("CB_GUNS_OUT_OFF", 1, 3067, 215, "Circuit Breakers", "Outer Wing Guns Power Off")
FW_190A8:defineToggleSwitch("CB_GUNS_IN_ON", 1, 3033, 203, "Circuit Breakers", "Inner Wing Guns Power On")
FW_190A8:definePushButton("CB_GUNS_IN_OFF", 1, 3068, 211, "Circuit Breakers", "Inner Wing Guns Power Off")
FW_190A8:defineToggleSwitch("CB_GUNS_COWL_ON", 1, 3034, 212, "Circuit Breakers", "Cowling Guns Power On")
FW_190A8:definePushButton("CB_GUNS_COWL_OFF", 1, 3069, 213, "Circuit Breakers", "Cowling Guns Power Off")
FW_190A8:defineToggleSwitch("CBR_COVER1", 1, 3001, 138, "Circuit Breakers", "Circuit Breaker Cover 1")
FW_190A8:defineToggleSwitch("CBR_COVER2", 1, 3077, 139, "Circuit Breakers", "Circuit Breaker Cover 2")

FW_190A8:define3PosTumb("IFF_CHAN_SEL", 16, 3001, 86, "IFF", "IFF Channel Selector")
FW_190A8:definePushButton("IFF_CHECK", 16, 3003, 88, "IFF", "IFF Check")

FW_190A8:defineTumb("RADIO_MODE", 15, 3001, 81, 0.1, { 0, 0.3 }, nil, false, "Radio", "FuG 16ZY Radio Channel Selector")
FW_190A8:defineTumb("RADIO_WIP", 15, 3111, 80, 0.1, { 0, 0.3 }, nil, false, "Radio", "FuG 16ZY Radio WIP")
FW_190A8:defineRotary("FUG16_VOLUME", 15, 3003, 83, "Radio", "Radio Volume")
FW_190A8:defineToggleSwitch("FT_ZF_SWITCH", 15, 3006, 84, "Radio", "FT FT / Y ZF Mode Switch")
FW_190A8:defineFixedStepTumb("FUG16_TUNING", 15, 3008, 82, 0.01, { -1, 1 }, { -0.01, 0.01 }, nil, "Radio", "Radio Tuning (+/-30 kHz)")

FW_190A8:defineRotary("CRS_SET", 14, 3001, 43, "Compass", "Course Set")

FW_190A8:defineRotary("CLOCK_SCALE", 13, 3001, 25, "Clock", "Clock Scale")
FW_190A8:defineRotary("CLOCK_PINION", 13, 3004, 26, "Clock", "Clock Pinion")
FW_190A8:defineToggleSwitch("CLOCK_ON_OFF", 13, 3006, 27, "Clock", "Clock Start / Stop")
FW_190A8:definePushButton("CLOCK_STOPWATCH", 13, 3008, 28, "Clock", "Clock Stopwatch")

FW_190A8:defineIndicatorLight("GUN_131_L_1", 164, "Lamps", "Gun 131 Lamp 1 (red)")
FW_190A8:defineIndicatorLight("GUN_131_L_2", 165, "Lamps", "Gun 131 Lamp 2 (red)")
FW_190A8:defineIndicatorLight("GUN_SZKK_L_1", 50, "Lamps", "Gun SZKK Lamp 1 (red)")
FW_190A8:defineIndicatorLight("GUN_SZKK_L_2", 53, "Lamps", "Gun SZKK Lamp 2 (red)")
FW_190A8:defineIndicatorLight("GUN_SZKK_L_3", 56, "Lamps", "Gun SZKK Lamp 3 (red)")
FW_190A8:defineIndicatorLight("GUN_SZKK_L_4", 59, "Lamps", "Gun SZKK Lamp 4 (red)")
FW_190A8:defineIndicatorLight("ZSK244_READY_L", 160, "Lamps", "ZSK244 Ready Lamp (yellow)")
FW_190A8:defineIndicatorLight("PITOT_LAMP", 107, "Lamps", "Pitot Lamp (yellow)")
FW_190A8:defineIndicatorLight("LG_L_UP", 68, "Lamps", "Landing Gear Left Up (red)")
FW_190A8:defineIndicatorLight("LG_L_DOWN", 69, "Lamps", "Landing Gear Left Down (green)")
FW_190A8:defineIndicatorLight("LG_R_UP", 70, "Lamps", "Landing Gear Right Up (red)")
FW_190A8:defineIndicatorLight("LG_R_DOWN", 71, "Lamps", "Landing Gear Right Down (green)")
FW_190A8:defineIndicatorLight("PITOT2_LAMP", 106, "Lamps", "Lamp near PITOT Lamp (red)")
FW_190A8:defineIndicatorLight("BOMB_1_L", 230, "Lamps", "Bomb 1 Lamp (red)")
FW_190A8:defineIndicatorLight("BOMB_2_L", 231, "Lamps", "Bomb 2 Lamp (red)")
FW_190A8:defineIndicatorLight("AFN2_LAMP", 31, "Lamps", "AFN 2 Light (white)")
FW_190A8:defineIndicatorLight("FUEL_LOW_FWD", 101, "Lamps", "Fuel_Low_Fwd (red)")
FW_190A8:defineIndicatorLight("FUEL_LOW_REAR", 100, "Lamps", "Fuel_Low_Rear (white)")

FW_190A8:defineFloat("PANEL_SHAKE_Z", 205, { -0.8, 0.8 }, "Indicator", "Panel_Shake_Z")
FW_190A8:defineFloat("PANEL_SHAKE_Y", 204, { -0.8, 0.8 }, "Indicator", "Panel_Shake_Y")
FW_190A8:defineFloat("PANEL_ROT_X", 206, { -0.5, 0.5 }, "Indicator", "Panel_Rot_X")
FW_190A8:defineFloat("SIGHTSHAKEZ", 207, { -0.9, 0.9 }, "Indicator", "SightShakeZ")
FW_190A8:defineFloat("SIGHTSHAKEY", 208, { -0.5, 0.5 }, "Indicator", "SightShakeY")
FW_190A8:defineFloat("LAMPS_INTENSITY", 193, { 0, 1 }, "Indicator", "Lamps Intensity")
FW_190A8:defineFloat("CANOPY", 194, { 0, 1 }, "Indicator", "Canopy Position")
FW_190A8:defineFloat("CANOPY_CRANK", 114, { 1, 0 }, "Indicator", "Canopy Crank")
FW_190A8:defineFloat("ENGINETHROTTLE", 2, { 0, 1 }, "Indicator", "Engine Throttle")
FW_190A8:defineFloat("STICKPITCH", 7, { -1, 1 }, "Indicator", "Stick Pitch")
FW_190A8:defineFloat("STICKBANK", 8, { 1, -1 }, "Indicator", "Stick Bank")
FW_190A8:defineFloat("RUDDERPOSITION", 1, { -1, 1 }, "Indicator", "RudderPosition")
FW_190A8:defineFloat("WHEEL_BRAKE_L", 102, { 0, 1 }, "Indicator", "Left Wheel Brake")
FW_190A8:defineFloat("WHEEL_BRAKE_R", 103, { 0, 1 }, "Indicator", "Right Wheel Brake")
FW_190A8:defineFloat("IAS", 36, { 0, 1 }, "Indicator", "IAS")
FW_190A8:defineFloat("VERTICALSPEED", 42, { -1, 1.0 }, "Indicator", "VerticalSpeed")
FW_190A8:defineFloat("ALTIMETER_KM", 35, { 0, 1 }, "Indicator", "Altimeter_km")
FW_190A8:defineFloat("ALTIMETER_M", 32, { 0, 1 }, "Indicator", "Altimeter_m")
FW_190A8:defineFloat("ALTIMETER_PRESSURE", 33, { 0, 1 }, "Indicator", "Altimeter_Pressure")
FW_190A8:defineFloat("HORIZON_PITCH", 37, { 0.33, -0.33 }, "Indicator", "Horizon_Pitch")
FW_190A8:defineFloat("HORIZON_BANK", 38, { 1.0, -1.0 }, "Indicator", "Horizon_Bank")
FW_190A8:defineFloat("TURNNEEDLE", 40, { -1, 1 }, "Indicator", "TurnNeedle")
FW_190A8:defineFloat("SLIPBALL", 41, { -1, 1 }, "Indicator", "Slipball")
FW_190A8:defineFloat("OXYGEN_PRESSURE", 112, { 0, 1 }, "Indicator", "Oxygen_Pressure")
FW_190A8:defineFloat("OXYGEN_FLOW_BLINKER", 113, { 0, 1 }, "Indicator", "Oxygen_Flow_Blinker")
FW_190A8:defineFloat("COMPASSHEADING", 45, { 0, 1 }, "Indicator", "CompassHeading")
FW_190A8:defineFloat("COMMANDEDCOURSE", 44, { 0, 1 }, "Indicator", "CommandedCourse")
FW_190A8:defineFloat("MANIFOLD_PRESSURE", 46, { 0, 1 }, "Indicator", "Manifold_Pressure")
FW_190A8:defineFloat("ENGINE_RPM", 47, { 0, 1 }, "Indicator", "Engine_RPM")
FW_190A8:defineFloat("PROP_PITCH_M", 116, { 0, 1 }, "Indicator", "Propeller Pitch Minute")
FW_190A8:defineFloat("PROP_PITCH_H", 117, { 0, 1 }, "Indicator", "Propeller Pitch Hour")
FW_190A8:defineFloat("COOLANT_TEMPERATURE", 96, { 0.07, 1 }, "Indicator", "Coolant_Temperature")
FW_190A8:defineFloat("OIL_TEMPERATURE", 97, { 0.07, 1 }, "Indicator", "Oil_Temperature")
FW_190A8:defineFloat("OIL_PRESSURE", 95, { 0, 1 }, "Indicator", "Oil_Pressure")
FW_190A8:defineFloat("FUEL_PRESSURE", 94, { 0, 1 }, "Indicator", "Fuel_Pressure")
FW_190A8:defineFloat("FUELMETER", 98, { 0, 1 }, "Indicator", "FuelMeter")
FW_190A8:defineFloat("FLUOR_LIGHT", 195, { 0, 1 }, "Indicator", "Fluor_Light (green)")
FW_190A8:defineFloat("PILOT_DRAW", 540, { 0, 1 }, "Indicator", "pilot_draw")
FW_190A8:defineFloat("CURRTIME_HOURS", 21, { 0, 1 }, "Indicator", "CurrTime_Hours")
FW_190A8:defineFloat("CURRTIME_MINUTES", 22, { 0, 1 }, "Indicator", "CurrTime_Minutes")
FW_190A8:defineFloat("CURRTIME_SECONDS", 23, { 0, 1 }, "Indicator", "CurrTime_Seconds")
FW_190A8:defineFloat("CHRONO_MINUTES", 27, { 0, 1 }, "Indicator", "Chrono_Minutes")
FW_190A8:defineFloat("AMMO_COUNTER_1", 52, { 0, 1 }, "Indicator", "Ammo_Counter_1")
FW_190A8:defineFloat("AMMO_COUNTER_2", 55, { 0, 1 }, "Indicator", "Ammo_Counter_2")
FW_190A8:defineFloat("AMMO_COUNTER_3", 58, { 0, 1 }, "Indicator", "Ammo_Counter_3")
FW_190A8:defineFloat("AMMO_COUNTER_4", 61, { 0, 1 }, "Indicator", "Ammo_Counter_4")
FW_190A8:defineFloat("GUN_FIRE_1", 50, { 0, 1 }, "Indicator", "Gun_Fire_1")
FW_190A8:defineFloat("GUN_FIRE_2", 164, { 0, 1 }, "Indicator", "Gun_Fire_2")
FW_190A8:defineFloat("GUN_FIRE_3", 165, { 0, 1 }, "Indicator", "Gun_Fire_3")
FW_190A8:defineFloat("GUN_FIRE_4", 166, { 0, 1 }, "Indicator", "Gun_Fire_4")
FW_190A8:defineFloat("TARGETDIST", 133, { 0, 1 }, "Indicator", "TargetDist")
FW_190A8:defineFloat("TRIMMNEEDLE", 76, { -1, 1 }, "Indicator", "TrimmNeedle")
FW_190A8:defineFloat("ADF_VERTICAL", 29, { -1, 1 }, "Indicator", "ADF_Vertical")
FW_190A8:defineFloat("ADF_HORIZONT", 30, { -1, 1 }, "Indicator", "ADF_Horizont")
FW_190A8:defineFloat("WINDSHIELDDAMAGE", 209, { 0, 1 }, "Indicator", "WindshieldDamage")
FW_190A8:defineFloat("CANOPYDAMAGE", 210, { 0, 1 }, "Indicator", "CanopyDamage")

FW_190A8:defineTumb("STARTER_SWITCH2", 2, 3009, 105, 0.5, { 0, 1 }, nil, false, "Cockpit", "Starter Switch. Magnetic Clutch")

FW_190A8:defineToggleSwitch("ROCKET_MAIN_SW", 20, 3022, 135, "Weapon Control", "Main Rocket Switch")
FW_190A8:defineTumb("ROCKET_EMERG_JETT", 20, 3024, 140, 1, { 0, 1 }, nil, false, "Weapon Control", "Rocket Emergency Release")
FW_190A8:defineIndicatorLight("BOMB_3_L", 232, "Lamps", "Bomb 3 Lamp (red)")
FW_190A8:defineIndicatorLight("BOMB_4_L", 233, "Lamps", "Bomb 4 Lamp (red)")
FW_190A8:defineFloat("UVLAMP_UL_L", 234, { 0, 1 }, "Lamps", "UV Light Upper Left (blue)")
FW_190A8:defineFloat("UVLAMP_UR_L", 235, { 0, 1 }, "Lamps", "UV Light Upper Right (blue)")
FW_190A8:defineFloat("UVLAMP_LL_L", 236, { 0, 1 }, "Lamps", "UV Light Lower Left (blue)")
FW_190A8:defineFloat("UVLAMP_LR_L", 237, { 0, 1 }, "Lamps", "UV Light Lower Right (blue)")

--Externals
FW_190A8:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
FW_190A8:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
FW_190A8:defineBitFromDrawArgument("EXT_POSITION_LIGHT_TAIL", 192, "External Aircraft Model", "Tail Position Light (White)")

FW_190A8:defineBitFromDrawArgument("EXT_WOW_TAIL", 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
FW_190A8:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
FW_190A8:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

FW_190A8:defineReadWriteRadio("FUG_16ZY_RADIO", 15, 7, 3, 1000, "FuG 16ZY RADIO")

return FW_190A8
