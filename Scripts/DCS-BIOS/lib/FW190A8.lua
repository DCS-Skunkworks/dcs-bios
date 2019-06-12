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

defineRotary("RAD_FLAP_CTRL",8, 3013, 159, "Cockpit", "Radiator Flaps Control")
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

defineRockerSwitch("THROTTLE_RPM", 2, 3014, 3014, 3014, 3014, 3, "Throttle", "RPM De/Increase")

defineTumb("CB_ORD_ON",1, 3005, 141, 1, {0,1}, nil, false, "Circuit Breakers", "Drop Ordnance & Optional Armament Power On")
defineTumb("CB_ORD_OFF",1, 3040, 142, 1, {0,1}, nil, false, "Circuit Breakers", "Drop Ordnance & Optional Armament Power Off")
defineTumb("CB_GUN_CAM_ON",1, 3006, 143, 1, {0,1}, nil, false, "Circuit Breakers", "Gun Sight and Gun Camera Power On")
defineTumb("CB_GUN_CAM_OFF",1, 3041, 144, 1, {0,1}, nil, false, "Circuit Breakers", "Gun Sight and Gun Camera Power Off")

defineTumb("CBR_COVER1",1, 3001,138, 1, {0,1}, nil, false, "Circuit Breakers", "Circuit Breaker Cover 1")
defineTumb("CBR_COVER2",1, 3077,139, 1, {0,1}, nil, false, "Circuit Breakers", "Circuit Breaker Cover 2")

defineTumb("IFF_CHAN_SEL",16, 3001, 86, 1, {-1,1}, nil, false, "IFF", "IFF Channel Selector")
defineTumb("IFF_CHECK",16, 3003,88, 1, {0,1}, nil, false, "IFF", "IFF Check")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")

BIOS.protocol.endModule()