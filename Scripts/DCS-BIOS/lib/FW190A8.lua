BIOS.protocol.beginModule("FW-190A8", 0x3800)
BIOS.protocol.setExportModuleAircrafts({"FW-190A8"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local definePushButton = BIOS.util.definePushButton

defineTumb("MAGNETO",2, 3004,75, 0.3, {0,0.9}, nil, false, "Cockpit", "Magneto Switch")
defineTumb("STARTER_CVR",2, 3006, 104, 1, {0,1}, nil, false, "Cockpit", "Starter Switch Cover")
defineTumb("STARTER_SWITCH",2, 3008, 105, 0.5, {0,1}, nil, false, "Cockpit", "Starter Switch. Starter Power / Magnetic Clutch")
defineTumb("ING_MODE",2, 3013, 111, 1, {0,1}, nil, false, "Cockpit", "Ingnition Mode Manual/Auto)")
defineTumb("FUEL_TNK_SEL",6, 3001, 90, 0.1, {0,0.3}, nil, false, "Cockpit", "Fuel Tank Selector Valve (CLOSE/FORWARD/AFT/BOTH)")
defineTumb("FUEL_GAUGE_SEL",6, 3002, 99, 0.5, {-0.5,1}, nil, false, "Cockpit", "Fuel Gauge Selector (FORWARD/NONE/AFT)")
defineTumb("FUEL_PRIM_PMPL",6, 3009, 162, 1, {0,1}, nil, false,"Cockpit", "Primer Pump")
definePushButton("FUEL_CUTTOFF", 6, 3010, 91, "Cockpit", "Fuel Cutoff Handle")
definePushButton("STARTER_BRUSH", 6, 3010, 93, "Cockpit", "Retract starter brushes")
definePotentiometer("OXY_FLOW_VALVE",4,3003, 110,{0.0,0.5},"Cockpit", "Oxygen Flow Valve")
defineTumb("OXY_EMG_KNOB",4, 3001,190, 1, {0,1}, nil, false, "Cockpit", "Oxygen Emergency Knob")
defineTumb("EL_KILL",1, 3075, 79, 1, {0,1}, nil, false, "Cockpit", "Electric Kill-switch")
defineTumb("CANOPY_EMG_REL",3, 3006,115, 1, {0,1}, nil, false, "Cockpit", "Canopy Emergency Release Handle")
defineRotary("CANOPY_HAND_CRK",3, 3001, 114, "Cockpit", "Canopy Hand Crank")
defineTumb("THR_LOCK",2, 3011,200, 1, {0,1}, nil, false, "Cockpit", "Throttle Lock")
defineRotary("ALT_PRESS_SET",10, 3001, 34, "Cockpit", "Altimeter Pressure Set")
definePotentiometer("HOR_CAGE",12,3001, 39,{0.511, 1.0},"Cockpit", "Horizon Cage")
defineRotary("TURN_BEZ",13, 3004, 24, "Cockpit", "Turnable Bezel")
defineRotary("WND_SET",13, 3001, 25, "Cockpit", "Wind/Set Knob")
defineTumb("START_STOP",13, 3002, 26, 1, {0,1}, nil, false, "Cockpit", "Start - Stop Button")
defineTumb("STOPWATCH",13, 3003, 28, 1, {0,1}, nil, false, "Cockpit", "Stopwatch Button")
defineTumb("HOR_STAB_TRIM",8, 3012, 77, 1, {-1,1}, nil, false, "Cockpit", "Stabilizer Trimmer Up/Down")
defineRotary("INSTR_LGHT_CTRL",7, 3001, 78, "Cockpit", "Instrument Lights Brightness")

defineTumb("FLAPS_UP_TOGGLE",8, 3001,62, 1, {0,1}, nil, false, "Flaps", "Flaps Up")
defineTumb("FLAPS_TO",8, 3002,63, 1, {0,1}, nil, false, "Flaps", "Flaps Take Off")
defineTumb("FLAPS_LAND",8, 3003,64, 1, {0,1}, nil, false, "Flaps", "Flaps Landing")
defineRotary("RAD_FLAP_CTRL",8, 3013, 159, "Flaps", "Radiator Flaps Control")

defineTumb("LG_RET",8, 3005,65, 1, {0,1}, nil, false, "Gear", "Landing Gears Retraction")
defineTumb("LG_RET_CVR",8, 3006,66, 1, {0,1}, nil, false, "Gear", "Landing Gears Retraction Cover")
defineTumb("LG_EXT",8, 3007,67, 1, {0,1}, nil, false, "Gear", "Landing Gears Extending")
defineTumb("EMG_LG_REL",8, 3008, 89, 1, {0,1}, nil, false, "Gear", "Landing Gear Emergency Release Handle")

defineRockerSwitch("THROTTLE_RPM", 2, 3014, 3014, 3014, 3014, 3, "Throttle", "RPM De/Increase")

defineTumb("MASTER_ARM",20, 3001,48, 1, {0,1}, nil, false, "Weapon Control", "Master Arm")
defineRotary("GUN1_AMM_C",20, 3003, 51, "Weapon Control", "Set Gun 1 Ammunition Count")
defineRotary("GUN2_AMM_C",20, 3005, 54, "Weapon Control", "Set Gun 2 Ammunition Count")
defineRotary("GUN3_AMM_C",20, 3007, 57, "Weapon Control", "Set Gun 3 Ammunition Count")
defineRotary("GUN4_AMM_C",20, 3009, 60, "Weapon Control", "Set Gun 4 Ammunition Count")
defineTumb("BMB_FUSE_SEL",20, 3011, 109, 0.1, {0,0.4}, nil, false, "Weapon Control", "Bomb Fusing Selector")
defineTumb("JETT_FUS_STORES",20, 3018,92, 1, {0,1}, nil, false, "Weapon Control", "Jettison Fuselage Stores")

defineRotary("SIGHT_BRIGHT",21, 3001, 133, "Gun Sight", "Gunsight Brightness Rheostat")
defineTumb("SIGHT_SMOKE",21, 3004, 134, 1, {0,1}, nil, false, "Gun Sight", "Gun Sight Smoked Screen Controls")

defineTumb("CB_ORD_ON",1, 3005, 141, 1, {0,1}, nil, false, "Circuit Breakers", "Drop Ordnance & Optional Armament Power On")
defineTumb("CB_ORD_OFF",1, 3040, 142, 1, {0,1}, nil, false, "Circuit Breakers", "Drop Ordnance & Optional Armament Power Off")
defineTumb("CB_GUN_CAM_ON",1, 3006, 143, 1, {0,1}, nil, false, "Circuit Breakers", "Gun Sight and Gun Camera Power On")
defineTumb("CB_GUN_CAM_OFF",1, 3041, 144, 1, {0,1}, nil, false, "Circuit Breakers", "Gun Sight and Gun Camera Power Off")
defineTumb("CB_INSTRUMENTS_ON",1, 3007, 145, 1, {0,1}, nil, false, "Circuit Breakers", "Instruments Power On")
defineTumb("CB_INSTRUMENTS_OFF",1, 3042, 146, 1, {0,1}, nil, false, "Circuit Breakers", "Instruments Power Off")
defineTumb("CB_NAV_LIGHTS_ON",1, 3008, 147, 1, {0,1}, nil, false, "Circuit Breakers", "Navigation Lights Power On")
defineTumb("CB_NAV_LIGHTS_OFF",1, 3043, 148, 1, {0,1}, nil, false, "Circuit Breakers", "Navigation Lights Power Off")
defineTumb("CB_CABIN_LIGHTS_ON",1, 3009, 149, 1, {0,1}, nil, false, "Circuit Breakers", "Cabin Illumination Power On")
defineTumb("CB_CABIN_LIGHTS_OFF",1, 3044, 150, 1, {0,1}, nil, false, "Circuit Breakers", "Cabin Illumination Power Off")
defineTumb("CB_CLOTH_HEAT_ON",1, 3010, 151, 1, {0,1}, nil, false, "Circuit Breakers", "Clothes Heating Power On")
defineTumb("CB_CLOTH_HEAT_OFF",1, 3045, 152, 1, {0,1}, nil, false, "Circuit Breakers", "Clothes Heating Power Off")
defineTumb("CB_PITOT_HEAT_ON",1, 3011, 153, 1, {0,1}, nil, false, "Circuit Breakers", "Pitot Heating Power On")
defineTumb("CB_PITOT_HEAT_OFF",1, 3046, 154, 1, {0,1}, nil, false, "Circuit Breakers", "Pitot Heating Power Off")
defineTumb("CB_IGNITION_ON",1, 3012, 155, 1, {0,1}, nil, false, "Circuit Breakers", "Ignition Power On")
defineTumb("CB_IGNITION_OFF",1, 3047, 156, 1, {0,1}, nil, false, "Circuit Breakers", "Ignition Power Off")
--
defineTumb("CBR_COVER1",1, 3001,138, 1, {0,1}, nil, false, "Circuit Breakers", "Circuit Breaker Cover 1")
defineTumb("CBR_COVER2",1, 3077,139, 1, {0,1}, nil, false, "Circuit Breakers", "Circuit Breaker Cover 2")

defineTumb("IFF_CHAN_SEL",16, 3001, 86, 1, {-1,1}, nil, false, "IFF", "IFF Channel Selector")
defineTumb("IFF_CHECK",16, 3003,88, 1, {0,1}, nil, false, "IFF", "IFF Check")

defineTumb("RADIO_MODE",15, 3001, 81, 0.1, {0,0.3}, nil, false, "Radio", "FuG 16ZY Radio Channel Selector")
defineTumb("RADIO_WIP",15, 3111, 80, 0.1, {0,0.3}, nil, false, "Radio", "FuG 16ZY Radio WIP")
defineRotary("FUG16_VOLUME",15, 3003, 83, "Radio", "Radio Volume")
defineTumb("FT_ZF_SWITCH",15, 3006,84, 1, {0,1}, nil, false, "Radio", "FT FT / Y ZF Mode Switch")
defineFixedStepTumb("FUG16_TUNING", 15, 3008, 82, 0.01, {-1, 1}, {-0.01, 0.01}, nil,"Radio", "Radio Tuning (+/-30 kHz)")

defineRotary("CRS_SET",14, 3001, 43, "Compass", "Course Set")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")

BIOS.protocol.endModule()