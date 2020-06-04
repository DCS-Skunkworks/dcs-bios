BIOS.protocol.beginModule("P-47D", 0x5200)
BIOS.protocol.setExportModuleAircrafts({"P-47D-30"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local define3PosTumb = BIOS.util.define3PosTumb
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineFixedStepInput = BIOS.util.defineFixedStepInput
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- Remove PILOT Arg# 135

--Joystick
definePushButton("STICK_MG_TRIGGER", 13, 3001, 53, "Weapons", "Stick MG Trigger")
definePushButton("STICK_SEC_TRIGGER", 13, 3002, 52, "Weapons", "Stick Secondary & Drop Ordnance Trigger")

--Gauges
defineFloat("PANEL_SHAKE_Z", 180, {-0.8, 0.8}, "Cockpit", "Common Panel Shaker (Z Axis)")
defineFloat("PANEL_SHAKE_Y", 484, {-0.8, 0.8}, "Cockpit", "Common Panel Shaker (Y Axis)")
defineFloat("PANEL_SHAKE_X", 489, {-0.8, 0.8}, "Cockpit", "Common Panel Shaker (X Axis)")

defineFloat("SUCTION_GAUGE", 9, {0, 1}, "Gauges", "Suction Gauge")
defineFloat("MANI_PRESS_GAUGE", 10, {0, 1}, "Gauges", "Manifold Pressur Gauge")
defineFloat("AIRSPEED_GAUGE", 11, {0, 0.9}, "Gauges", "Airspeed Gauge")
defineFloat("DI_GAUGE", 12, {0, 1}, "Gauges", "DI Gauge")
defineFloat("AHORIZON_BANK", 14, {1.0, -1.0}, "Gauges", "Artificial Horizon - Bank")
defineFloat("AHORIZON_PITCH", 15, {1.0, -1.0}, "Gauges", "Artificial Horizon - Pitch")
defineFloat("AHORIZON_ZERO", 136, {-1.0, 1.0}, "Gauges", "Artificial Horizon - Zero")
defineFloat("AHORIZON_CAGE", 20, {0, 1}, "Gauges", "Artificial Horizon - Cage")
defineFloat("TACHO_GAUGE", 23, {0, 1}, "Gauges", "Tachometer Gauge")
defineFloat("ALTIMETER_100F", 24, {0, 1}, "Gauges", "Altimeter 100 ft")
defineFloat("ALTIMETER_1000F", 25, {0, 1}, "Gauges", "Altimeter 1000 ft")
defineFloat("ALTIMETER_10000F", 26, {0, 1}, "Gauges", "Altimeter 10000 ft")
defineFloat("ALTIMETER_PRESSURE", 21, {0, 1}, "Gauges", "Altimeter Pressure")
defineFloat("ALTIMETER_100F_REF", 171, {0, 1}, "Gauges", "Altimeter 100 ft Reference")
defineFloat("ALTIMETER_1000F_REF", 172, {0, 1}, "Gauges", "Altimeter 1000 ft Reference")
defineFloat("SLIPBALL", 28, {-1.0, 1.0}, "Gauges", "Slipball")
defineFloat("TURN_NEEDLE", 27, {-1.0, 1.0}, "Gauges", "Turn Needle")
defineFloat("VARIOMETER", 29, {-0.6, 0.6}, "Gauges", "Variometer")
defineFloat("3GAUGE_OIL_TEMP", 30, {-1.0, 1.0}, "Gauges", "TriGauge Oil Temperature")
defineFloat("3GAUGE_OIL_PRESS", 31, {0, 1}, "Gauges", "TriGauge Oil Pressure")
defineFloat("3GAUGE_FUEL_PRESS", 32, {0, 1}, "Gauges", "TriGauge Fuel Pressure")
defineFloat("OXY_FLOW_BLINK", 33, {0, 1}, "Gauges", "Oxygen Delivery Gauge")
defineFloat("OXY_PRESS", 34, {0, 1}, "Gauges", "Oxygen Pressure Gauge")
defineFloat("HYD_PRESS", 78, {0, 1}, "Gauges", "Hydro Pressure Gauge")
defineFloat("AMP_METER", 104, {0, 1}, "Gauges", "Amperemeter")
defineFloat("FLAP_INTERCOOL_POS", 89, {0, 1}, "Gauges", "Intercooler Flap Position")
defineFloat("FLAP_OILCOOL_POS", 90, {0, 1}, "Gauges", "Oil Cooler Flap Position")
defineFloat("CARB_TEMP", 102, {-0.5, 1}, "Gauges", "Carburettor Temperature Gauge")
defineFloat("TURBINE_TACHO", 103, {0, 1}, "Gauges", "Turbine Tachometer")
defineFloat("H2O_PRESS", 108, {0, 1}, "Gauges", "Water Pressure Gauge")
defineFloat("FUEL_RES_MAIN", 109, {0, 1}, "Gauges", "Fuel Reserve Main Gauge")
defineFloat("FUEL_RES_AUX", 110, {0, 1}, "Gauges", "Fuel Reserve Aux Gauge")
defineFloat("CYL_TEMP", 111, {0, 1}, "Gauges", "Cylinder Heads Temperature Gauge")
defineFloat("ACCELEROMETER_MAIN", 175, {0.0, 1.0}, "Gauges", "Accelerometer Main")
defineFloat("ACCELEROMETER_MIN", 177, {0.0, 1.0}, "Gauges", "Accelerometer Min")
defineFloat("ACCELEROMETER_MAX", 178, {0.0, 1.0}, "Gauges", "Accelerometer Max")

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

defineIntegerFromGetter("EXT_LANDING_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Light (white)")


defineIntegerFromGetter("EXT_WOW_TAIL", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")

defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")

defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()