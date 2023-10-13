module("FW-190D9", package.seeall)

local Module = require("Module")

--- @class FW_190D9: Module
local FW_190D9 = Module:new("FW-190D9", 0x3400, { "FW-190D9" })

--overhaul by WarLord v2.0

--remove Arg# Pilot 540

FW_190D9:defineRotary("RAD_FLAP_CTRL", 8, 3013, 159, "Cockpit", "Radiator Flaps Control")
FW_190D9:defineToggleSwitch("STARTER_CVR", 2, 3006, 104, "Cockpit", "Starter Switch Cover")
FW_190D9:defineToggleSwitch("MW50_SWITCH", 2, 3015, 85, "Cockpit", "MW-50 Switch")
FW_190D9:defineToggleSwitch("EL_KILL", 1, 3031, 79, "Cockpit", "Electric Kill-switch")
FW_190D9:defineToggleSwitch("EMG_EQ_DEST", 1, 3032, 163, "Cockpit", "Emergency Equipment Destruction")
FW_190D9:defineToggleSwitch("CIRC_BR_CVR", 1, 3001, 138, "Cockpit", "Circuit Breakers Cover")
FW_190D9:defineToggleSwitch("CANOPY_EMG_REL", 3, 3006, 115, "Cockpit", "Canopy Emergency Release Handle")
FW_190D9:defineRotary("CANOPY_HAND_CRK", 3, 3001, 114, "Cockpit", "Canopy Hand Crank")
FW_190D9:defineToggleSwitch("THR_LOCK", 2, 3011, 200, "Cockpit", "Throttle Lock")
FW_190D9:defineRotary("ALT_PRESS_SET", 10, 3001, 34, "Cockpit", "Altimeter Pressure Set")
FW_190D9:defineToggleSwitch("FLAPS_UP_TOGGLE", 8, 3001, 62, "Cockpit", "Flaps Up")
FW_190D9:defineToggleSwitch("FLAPS_TO", 8, 3002, 63, "Cockpit", "Flaps Take Off")
FW_190D9:defineToggleSwitch("FLAPS_LAND", 8, 3003, 64, "Cockpit", "Flaps Landing")
FW_190D9:defineToggleSwitch("LG_RET", 8, 3005, 65, "Cockpit", "Landing Gears Retraction")
FW_190D9:defineToggleSwitch("LG_RET_CVR", 8, 3006, 66, "Cockpit", "Landing Gears Retraction Cover")
FW_190D9:defineToggleSwitch("LG_EXT", 8, 3007, 67, "Cockpit", "Landing Gears Extending")
FW_190D9:defineRotary("TURN_BEZ", 13, 3001, 24, "Cockpit", "Turnable Bezel")
FW_190D9:defineRotary("WND_SET", 13, 3004, 25, "Cockpit", "Wind/Set Knob")
FW_190D9:definePushButton("START_STOP", 13, 3006, 26, "Cockpit", "Start - Stop Button")
FW_190D9:definePushButton("STOPWATCH", 13, 3008, 28, "Cockpit", "Stopwatch Button")
FW_190D9:defineToggleSwitch("MASTER_ARM", 20, 3003, 48, "Weapon Control", "Master Arm")
FW_190D9:defineRotary("GUN1_AMM_C", 20, 3004, 51, "Weapon Control", "Set Gun 1 Ammunition Count")
FW_190D9:defineRotary("GUN2_AMM_C", 20, 3005, 54, "Weapon Control", "Set Gun 2 Ammunition Count")
FW_190D9:defineRotary("GUN3_AMM_C", 20, 3006, 57, "Weapon Control", "Set Gun 3 Ammunition Count")
FW_190D9:defineRotary("GUN4_AMM_C", 20, 3007, 60, "Weapon Control", "Set Gun 4 Ammunition Count")
FW_190D9:defineToggleSwitch("MAIN_RKT", 20, 3008, 107, "Weapon Control", "Main Rocket Switch")
FW_190D9:defineToggleSwitch("RKT_EMG_REL_CVR", 20, 3009, 137, "Weapon Control", "Rocket Emergency Release Cover")
FW_190D9:defineToggleSwitch("RKT_EMG_REL", 20, 3010, 108, "Weapon Control", "Rocket Emergency Release")
FW_190D9:definePushButton("JETT_FUS_STORES", 20, 3012, 92, "Cockpit", "Jettison Fuselage Stores")
FW_190D9:defineToggleSwitch("SIGHT_GYRO", 21, 3001, 132, "Gun Sight", "EZ42 Gunsight Gyro Power Switch, ON/OFF")
FW_190D9:definePotentiometer("SIGHT_WING_SPAN", 21, 3002, 131, { 0, 1 }, "Gun Sight", "EZ42 Gunsight Target Wingspan Knob")
FW_190D9:defineToggleSwitch("SIGHT_NIGHT", 21, 3011, 134, "Gun Sight", "EZ42 Gunsight Night Lens Filter, ON/OFF")
FW_190D9:defineRotary("SIGHT_DISC_CTRL", 21, 3003, 4, "Gun Sight", "EZ42 Gunsight Target Distance Control")
FW_190D9:defineRotary("SIGHT_BRIGHT", 21, 3004, 135, "Gun Sight", "EZ42 Gunsight Brightness Control")
FW_190D9:defineRotary("SIGHT_ALT_KNOB", 21, 3012, 191, "Gun Sight", "EZ42 Gunsight Altitude Aiming Correction Adjusting Knob I")
FW_190D9:defineRotary("INSTR_LGHT_CTRL", 7, 3001, 78, "Cockpit", "Instrument Lights Brightness")
FW_190D9:defineRotary("FUG16_VOLUME", 15, 3003, 83, "Radio", "Radio Volume")
FW_190D9:defineToggleSwitch("FT_ZF_SWITCH", 15, 3006, 84, "Radio", "FT FT / Y ZF Mode Switch")
-- Allocate 16 bits of address space to avoid changing the address of subsequent allocations:
FW_190D9:reserveIntValue(65535)
FW_190D9:defineToggleSwitch("OXY_EMG_KNOB", 4, 3001, 190, "Cockpit", "Oxygen Emergency Knob")
FW_190D9:definePushButton("FUG25_TEST", 16, 3003, 88, "Radio", "IFF Check")
FW_190D9:definePotentiometer("HOR_CAGE", 12, 3001, 39, { 0.513, 1.0 }, "Cockpit", "Horizon Cage")
FW_190D9:definePotentiometer("OXY_FLOW_VALVE", 4, 3003, 110, { 0, 0.5 }, "Cockpit", "Oxygen Flow Valve")
FW_190D9:defineTumb("MAGNETO", 2, 3004, 75, 0.3, { 0, 0.9 }, nil, false, "Cockpit", "Magneto Switch")
FW_190D9:defineTumb("STARTER_SWITCH", 2, 3008, 105, 0.5, { 0, 1 }, nil, false, "Cockpit", "Starter Switch. Starter Power")
FW_190D9:defineToggleSwitch("MBG_EMG_HNDL", 2, 3013, 91, "Cockpit", "MBG Emergency Mode Handle")
FW_190D9:defineTumb("FUEL_TNK_SEL", 6, 3001, 90, 0.1, { 0, 0.3 }, nil, false, "Cockpit", "Fuel Tank Selector Valve (CLOSE/FORWARD/AFT/BOTH)")
FW_190D9:defineTumb("FUEL_GAUGE_SEL", 6, 3002, 99, 0.5, { 0, 1 }, nil, false, "Cockpit", "Fuel Gauge Selector (FORWARD/NONE/AFT)")
FW_190D9:defineToggleSwitch("FUEL_MWB4_SEL", 6, 3003, 161, "Cockpit", "MW-B4 Selector (Not Functional)")
FW_190D9:definePushButton("FUEL_PRIM_PMPL", 6, 3009, 162, "Cockpit", "Primer Pump")
FW_190D9:defineToggleSwitch("FL_TR_HOR_PWR_ON", 1, 3005, 141, "Circuit Breakers", "Flaps, Trimmer, Artificial Horizon Power CB On")
FW_190D9:definePushButton("FL_TR_HOR_PWR_OFF", 1, 3018, 142, "Circuit Breakers", "Flaps, Trimmer, Artificial Horizon Power CB Off")
FW_190D9:defineToggleSwitch("LG_PWF_ON", 1, 3006, 143, "Circuit Breakers", "Landing Gear Power CB On")
FW_190D9:definePushButton("LG_PWF_OFF", 1, 3019, 144, "Circuit Breakers", "Landing Gear Power CB Off")
FW_190D9:defineToggleSwitch("PIT_HEAT_ON", 1, 3007, 145, "Circuit Breakers", "Pitot and Heating Cover CB On")
FW_190D9:definePushButton("PIT_HEAT_OFF", 1, 3020, 146, "Circuit Breakers", "Pitot and Heating Cover CB Off")
FW_190D9:defineToggleSwitch("FUG25A_ON", 1, 3008, 147, "Circuit Breakers", "FuG25a CB On")
FW_190D9:definePushButton("FUG25A_OFF", 1, 3021, 148, "Circuit Breakers", "FuG25a CB Off")
FW_190D9:defineToggleSwitch("FUG16ZY_ON", 1, 3009, 149, "Circuit Breakers", "FuG16ZY CB On")
FW_190D9:definePushButton("FUG16ZY_OFF", 1, 3022, 150, "Circuit Breakers", "FuG16ZY CB Off")
FW_190D9:defineToggleSwitch("INST_LGHTS_ON", 1, 3010, 151, "Circuit Breakers", "Instrument Lights, Gun-sight, Indicators, Compass, Starter CB On")
FW_190D9:definePushButton("INST_LGHTS_OFF", 1, 3023, 152, "Circuit Breakers", "Instrument Lights, Gun-sight, Indicators, Compass, Starter CB Off")
FW_190D9:defineToggleSwitch("GEN_PWR_ON", 1, 3011, 153, "Circuit Breakers", "Generator CB On")
FW_190D9:definePushButton("GEN_PWR_OFF", 1, 3024, 154, "Circuit Breakers", "Generator CB Off")
FW_190D9:defineToggleSwitch("BATT_ON", 1, 3012, 155, "Circuit Breakers", "Battery CB On")
FW_190D9:definePushButton("BATT_OFF", 1, 3025, 156, "Circuit Breakers", "Battery CB Off")
FW_190D9:defineToggleSwitch("NAV_LGHTS_ON", 1, 3013, 121, "Circuit Breakers", "Navigation Lights CB On")
FW_190D9:definePushButton("NAV_LGHTS_OFF", 1, 3026, 120, "Circuit Breakers", "Navigation Lights CB Off")
FW_190D9:defineToggleSwitch("FW_TNK_PMP_ON", 1, 3014, 123, "Circuit Breakers", "Forward Tank Pump CB On")
FW_190D9:definePushButton("FW_TNK_PMP_OFF", 1, 3027, 122, "Circuit Breakers", "Forward Tank Pump CB Off")
FW_190D9:defineToggleSwitch("AFT_TNK_PMP_ON", 1, 3015, 125, "Circuit Breakers", "Aft Tank Pump CB On")
FW_190D9:definePushButton("AFT_TNK_PMP_OFF", 1, 3028, 124, "Circuit Breakers", "Aft Tank Pump CB Off")
FW_190D9:defineToggleSwitch("AUX_TNK_PMP_ON", 1, 3016, 127, "Circuit Breakers", "Auxiliary Tank Pump CB On")
FW_190D9:definePushButton("AUX_TNK_PMP_OFF", 1, 3029, 126, "Circuit Breakers", "Auxiliary Tank Pump CB Off")
FW_190D9:defineToggleSwitch("MW50_ON", 1, 3017, 129, "Circuit Breakers", "MW-50 CB On")
FW_190D9:definePushButton("MW50_OFF", 1, 3030, 128, "Circuit Breakers", "MW-50 CB Off")
FW_190D9:defineRotary("CRS_SET", 14, 3001, 43, "Compass", "Course Set")
FW_190D9:define3PosTumb("HOR_STAB_TRIM", 8, 3012, 77, "Cockpit", "Stabilizer Trimmer Up/Down")
FW_190D9:defineToggleSwitch("EMG_LG_REL", 8, 3008, 89, "Cockpit", "Landing Gear Emergency Release Handle")
FW_190D9:defineTumb("BMB_FUSE_SEL", 20, 3011, 109, 0.1, { 0, 0.4 }, nil, false, "Weapon Control", "Bomb Fusing Selector")
FW_190D9:defineTumb("RADIO_MODE", 15, 3001, 81, 0.1, { 0, 0.3 }, nil, false, "Radio", "FuG 16ZY Radio Channel Selector")
FW_190D9:define3PosTumb("FUG25_MODE", 16, 3001, 86, "Radio", "FuG 25A IFF Channel Selector")

FW_190D9:defineIndicatorLight("BMB1", 196, "Lamps", "Bomb 1 Lamp (red)")
FW_190D9:defineIndicatorLight("BMB2", 197, "Lamps", "Bomb 2 Lamp (red)")
FW_190D9:defineIndicatorLight("BMB3", 198, "Lamps", "Bomb 3 Lamp (red)")
FW_190D9:defineIndicatorLight("BMB4", 199, "Lamps", "Bomb 4 Lamp (red)")
FW_190D9:defineIndicatorLight("LG_L_UP", 68, "Lamps", "Landing Gear Left Up (red)")
FW_190D9:defineIndicatorLight("LG_L_DOWN", 69, "Lamps", "Landing Gear Left Down (green)")
FW_190D9:defineIndicatorLight("LG_R_UP", 70, "Lamps", "Landing Gear Right Up (red)")
FW_190D9:defineIndicatorLight("LG_R_DOWN", 71, "Lamps", "Landing Gear Right Down (green)")
FW_190D9:defineIndicatorLight("FLAPS_UP", 72, "Lamps", "Flaps Up (red)")
FW_190D9:defineIndicatorLight("FLAPS_START", 73, "Lamps", "Flaps Start (yellow)")
FW_190D9:defineIndicatorLight("FLAPS_DOWN", 74, "Lamps", "Flaps Down (green)")
FW_190D9:defineIndicatorLight("FUEL_LOW_FWD", 100, "Lamps", "Fuel_Low_Fwd (red)")
FW_190D9:defineIndicatorLight("FUEL_LOW_REAR", 101, "Lamps", "Fuel_Low_Rear (white)")
FW_190D9:defineIndicatorLight("GUN_FIRE_1", 50, "Lamps", "Gun_Fire_1 (white)")
FW_190D9:defineIndicatorLight("GUN_FIRE_2", 164, "Lamps", "Gun_Fire_2 (red)")
FW_190D9:defineIndicatorLight("GUN_FIRE_3", 165, "Lamps", "Gun_Fire_3 (red)")
FW_190D9:defineIndicatorLight("GUN_FIRE_4", 166, "Lamps", "Gun_Fire_4 (red)")

FW_190D9:defineFloat("PANEL_SHAKE_Z", 205, { -0.8, 0.8 }, "Indicator", "Panel_Shake_Z")
FW_190D9:defineFloat("PANEL_SHAKE_Y", 204, { -0.8, 0.8 }, "Indicator", "Panel_Shake_Y")
FW_190D9:defineFloat("PANEL_ROT_X", 206, { -0.5, 0.5 }, "Indicator", "Panel_Rot_X")
FW_190D9:defineFloat("SIGHTSHAKEZ", 207, { -0.9, 0.9 }, "Indicator", "SightShakeZ")
FW_190D9:defineFloat("SIGHTSHAKEY", 208, { -0.5, 0.5 }, "Indicator", "SightShakeY")
FW_190D9:defineFloat("LAMPS_INTENSITY", 193, { 0, 1 }, "Indicator", "Lamps Intensity")
FW_190D9:defineFloat("CANOPY", 194, { 0, 1 }, "Indicator", "Canopy Position")
FW_190D9:defineFloat("CANOPY_CRANK", 114, { 1, 0 }, "Indicator", "Canopy Crank")
FW_190D9:defineFloat("ENGINETHROTTLE", 2, { 0, 1 }, "Indicator", "Engine Throttle")
FW_190D9:defineFloat("STICKPITCH", 7, { -1, 1 }, "Indicator", "Stick Pitch")
FW_190D9:defineFloat("STICKBANK", 8, { 1, -1 }, "Indicator", "Stick Bank")
FW_190D9:defineFloat("RUDDERPOSITION", 1, { -1, 1 }, "Indicator", "RudderPosition")
FW_190D9:defineFloat("WHEEL_BRAKE_L", 102, { 0, 1 }, "Indicator", "Left Wheel Brake")
FW_190D9:defineFloat("WHEEL_BRAKE_R", 103, { 0, 1 }, "Indicator", "Right Wheel Brake")
FW_190D9:defineFloat("IAS", 36, { 0, 0.988 }, "Indicator", "IAS")
FW_190D9:defineFloat("VERTICALSPEED", 42, { -1, 1.0 }, "Indicator", "VerticalSpeed")
FW_190D9:defineFloat("ALTIMETER_KM", 35, { 0, 1 }, "Indicator", "Altimeter_km")
FW_190D9:defineFloat("ALTIMETER_M", 32, { 0, 1 }, "Indicator", "Altimeter_m")
FW_190D9:defineFloat("ALTIMETER_PRESSURE", 33, { 0, 1 }, "Indicator", "Altimeter_Pressure")
FW_190D9:defineFloat("HORIZON_PITCH", 37, { 0.33, -0.33 }, "Indicator", "Horizon_Pitch")
FW_190D9:defineFloat("HORIZON_BANK", 38, { 1.0, -1.0 }, "Indicator", "Horizon_Bank")
FW_190D9:defineFloat("TURNNEEDLE", 40, { -1, 1 }, "Indicator", "TurnNeedle")
FW_190D9:defineFloat("SLIPBALL", 41, { -1, 1 }, "Indicator", "Slipball")
FW_190D9:defineFloat("OXYGEN_PRESSURE", 112, { 0, 1 }, "Indicator", "Oxygen_Pressure")
FW_190D9:defineFloat("OXYGEN_FLOW_BLINKER", 113, { 0, 1 }, "Indicator", "Oxygen_Flow_Blinker")
FW_190D9:defineFloat("COMPASSHEADING", 45, { 0, 1 }, "Indicator", "CompassHeading")
FW_190D9:defineFloat("COMMANDEDCOURSE", 44, { 0, 1 }, "Indicator", "CommandedCourse")
FW_190D9:defineFloat("MANIFOLD_PRESSURE", 46, { 0, 1 }, "Indicator", "Manifold_Pressure")
FW_190D9:defineFloat("ENGINE_RPM", 47, { 0, 0.983 }, "Indicator", "Engine_RPM")
FW_190D9:defineFloat("COOLANT_TEMPERATURE", 96, { 0.07, 1 }, "Indicator", "Coolant_Temperature")
FW_190D9:defineFloat("OIL_TEMPERATURE", 97, { 0.07, 1 }, "Indicator", "Oil_Temperature")
FW_190D9:defineFloat("OIL_PRESSURE", 95, { 0, 1 }, "Indicator", "Oil_Pressure")
FW_190D9:defineFloat("FUEL_PRESSURE", 94, { 0, 1 }, "Indicator", "Fuel_Pressure")
FW_190D9:defineFloat("MW50_PRESSURE", 106, { 0, 1 }, "Indicator", "MW50_Pressure")
FW_190D9:defineFloat("FUELMETER", 98, { 0, 1 }, "Indicator", "FuelMeter")
FW_190D9:defineFloat("FLUOR_LIGHT", 195, { 0, 1 }, "Indicator", "Fluor_Light (green)")
FW_190D9:defineFloat("PILOT_DRAW", 540, { 0, 1 }, "Indicator", "pilot_draw")
FW_190D9:defineFloat("CURRTIME_HOURS", 21, { 0, 1 }, "Indicator", "CurrTime_Hours")
FW_190D9:defineFloat("CURRTIME_MINUTES", 22, { 0, 1 }, "Indicator", "CurrTime_Minutes")
FW_190D9:defineFloat("CURRTIME_SECONDS", 23, { 0, 1 }, "Indicator", "CurrTime_Seconds")
FW_190D9:defineFloat("CHRONO_MINUTES", 27, { 0, 1 }, "Indicator", "Chrono_Minutes")
FW_190D9:defineFloat("AMMO_COUNTER_1", 52, { 0, 1 }, "Indicator", "Ammo_Counter_1")
FW_190D9:defineFloat("AMMO_COUNTER_2", 55, { 0, 1 }, "Indicator", "Ammo_Counter_2")
FW_190D9:defineFloat("AMMO_COUNTER_3", 58, { 0, 1 }, "Indicator", "Ammo_Counter_3")
FW_190D9:defineFloat("AMMO_COUNTER_4", 61, { 0, 1 }, "Indicator", "Ammo_Counter_4")
FW_190D9:defineFloat("TARGETDIST", 133, { 0, 1 }, "Indicator", "TargetDist")
FW_190D9:defineFloat("ROCKETEMCVR", 137, { 0, 1 }, "Indicator", "RocketEmCvr")
FW_190D9:defineFloat("B_1_KNOPF", 9, { 0, 1 }, "Indicator", "B_1_knopf")
FW_190D9:defineFloat("B_2_KNOPF", 11, { 0, 1 }, "Indicator", "B_2_knopf")
FW_190D9:defineFloat("COVER_KNOPF", 10, { 0, 1 }, "Indicator", "Cover_knopf")
FW_190D9:defineFloat("TRIMMNEEDLE", 76, { -1, 1 }, "Indicator", "TrimmNeedle")
FW_190D9:defineFloat("ADF_VERTICAL", 29, { -1, 1 }, "Indicator", "ADF_Vertical")
FW_190D9:defineFloat("ADF_HORIZONT", 30, { -1, 1 }, "Indicator", "ADF_Horizont")
FW_190D9:defineFloat("WINDSHIELDDAMAGE", 209, { 0, 1 }, "Indicator", "WindshieldDamage")
FW_190D9:defineFloat("CANOPYDAMAGE", 210, { 0, 1 }, "Indicator", "CanopyDamage")

FW_190D9:defineFixedStepTumb("FUG16_TUNING", 15, 3008, 82, 0.01, { -1, 1 }, { -0.01, 0.01 }, nil, "Radio", "Radio Tuning (+/-30 kHz)")
FW_190D9:defineTumb("STARTER_SWITCH2", 2, 3009, 105, 0.5, { 0, 1 }, nil, false, "Cockpit", "Starter Switch. Magnetic Clutch")
FW_190D9:define3PosTumb("FUEL_COLD_START", 6, 3007, 160, "Cockpit", "Cold Start/Wind Screen Washer")

--Externals

FW_190D9:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
FW_190D9:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
FW_190D9:defineBitFromDrawArgument("EXT_POSITION_LIGHT_TAIL", 192, "External Aircraft Model", "Tail Position Light (White)")
FW_190D9:defineBitFromDrawArgument("EXT_WOW_TAIL", 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
FW_190D9:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
FW_190D9:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

FW_190D9:defineIndicatorLight("GUN_FIRE_5", 53, "Lamps", "Gun_Fire_5 (white)")
FW_190D9:defineIndicatorLight("GUN_FIRE_6", 56, "Lamps", "Gun_Fire_6 (white)")
FW_190D9:defineIndicatorLight("GUN_FIRE_7", 59, "Lamps", "Gun_Fire_7 (white)")
FW_190D9:defineIndicatorLight("IFF_L", 87, "Lamps", "IFF Light (white)")

return FW_190D9
