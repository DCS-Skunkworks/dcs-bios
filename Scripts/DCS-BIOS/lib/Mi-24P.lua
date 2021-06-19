BIOS.protocol.beginModule("Mi-24P", 0x6800)
BIOS.protocol.setExportModuleAircrafts({"Mi-24P"})

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
local defineString = BIOS.util.defineString
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3Pos2CommandSwitch = BIOS.util.define3Pos2CommandSwitch
local define3PosTumb = BIOS.util.define3PosTumb

--Engine
defineToggleSwitch("PLT_ROTOR_BRAKE", 3, 3011, 745, "Engine", "PILOT Rotor Brake")
defineToggleSwitch("PLT_ENG_STOP_L", 3, 3009, 6, "Engine", "PILOT Left Engine Stop")
defineToggleSwitch("PLT_ENG_STOP_R", 3, 3010, 7, "Engine", "PILOT Right Engine Stop")
defineRotary("PLT_ENG_THROTTLE_L", 3, 3006, 5, "Engine", "PILOT Left Engine Throttle")
defineRotary("PLT_ENG_THROTTLE_R", 3, 3008, 4, "Engine", "PILOT Right Engine Throttle")
define3Pos2CommandSwitch("PLT_FREE_TURB_RPM", 3, 3020, 3019, 747, "Engine", "PILOT Readjust Free Turbine RPM, RIGHT/NEUTRAL/LEFT")

--HydroInterface
defineToggleSwitch("PLT_MAIN_AUXHYD_CV", 4, 3002, 216, "Hydro Interface", "PILOT Main/Auxiliary Hydraulic Switch Cover, UP/DOWN")
defineToggleSwitch("PLT_MAIN_AUXHYD", 4, 3001, 217, "Hydro Interface", "PILOT Main/Auxiliary Hydraulic Switch, MAIN/AUXILIARY")
defineToggleSwitch("PLT_MAIN_GEARHYD_CV", 4, 3004, 218, "Hydro Interface", "PILOT Main/Reserve Gear Hydraulic Switch Cover, UP/DOWN")
defineToggleSwitch("PLT_MAIN_GEARHYD", 4, 3003, 219, "Hydro Interface", "PILOT Main/Reserve Gear Hydraulic Switch, MAIN/RESERVE")
definePushButton("PLT_AUX_DISABLE", 4, 3005, 213, "Hydro Interface", "PILOT Auxiliary Disable Button")
defineToggleSwitch("PLT_AUX_DISABLE_CV", 4, 3006, 215, "Hydro Interface", "PILOT Auxiliary Disable Button Cover, UP/DOWN")
defineToggleSwitch("PLT_CONTROL_ASSUMEND_CV", 4, 3012, 47, "Hydro Interface", "PILOT Control Assumed Switch Cover, UP/DOWN")
defineToggleSwitch("PLT_CONTROL_ASSUMEND", 4, 3011, 48, "Hydro Interface", "PILOT Control Assumed Switch Cover, ON/OFF")
defineToggleSwitch("PLT_PEDAL_DAMPER_CV", 4, 3008, 289, "Hydro Interface", "PILOT Pedal Damper Cover, UP/DOWN")
defineToggleSwitch("PLT_PEDAL_DAMPER", 4, 3007, 290, "Hydro Interface", "PILOT Pedal Damper, ON/OFF")
defineToggleSwitch("OP_PEDAL_DAMPER_CV", 4, 3001, 666, "Hydro Interface", "OPERATOR Pedal Damper Cover, UP/DOWN")
defineToggleSwitch("OP_PEDAL_DAMPER", 4, 3009, 667, "Hydro Interface", "OPERATOR Pedal Damper, ON/OFF")

--Gauges
defineFloat("OP_CANOPY_VALUE", 849, {0, 1}, "Gauges", "OPERATOR Canopy Position")
defineFloat("PLT_CANOPY_PILOT_VALUE", 9, {0, 1}, "Gauges", "PILOT Door Position")
defineFloat("PLT_VARIOMETER", 1, {-1, 1}, "Gauges", "PILOT Variometer")
defineFloat("PLT_GMETER", 17, {-1, 1}, "Gauges", "PILOT G-Meter")
defineFloat("PLT_GMETER_MIN", 16, {-1, 1}, "Gauges", "PILOT G-Meter Min")
defineFloat("PLT_GMETER_MAX", 16, {-1, 1}, "Gauges", "PILOT G-Meter Max")
defineFloat("PLT_IAS", 790, {-1, 1}, "Gauges", "PILOT IAS Speed")
defineFloat("OP_IAS", 776, {-1, 1}, "Gauges", "OPERATOR IAS Speed")
defineFloat("PLT_UKT2_PITCH", 949, {-1, 1}, "Gauges", "PILOT UKT-2 Pitch")
defineFloat("PLT_UKT2_ROLL", 950, {1, -1}, "Gauges", "PILOT UKT-2 Roll")
defineFloat("PLT_UKT2_FAIL_FLG", 849, {0, 1}, "Gauges", "PILOT UKT-2 Failure Flag")

--Weapon Systems
----PUVL
defineToggleSwitch("PUVL_SIGHT_DISTANCE", 16, 3003, 515, "PUVL", "PILOT Sight Distance, MANUAL/AUTO")
define3PosTumb("PUVL_BURST_LENGTH", 6, 3003, 521, "PUVL", "PILOT Burst Length, SHORT/LONG/MEDIUM")

defineTumb("PUVL_RELOAD_LEFT_GONDOLA", 6, 3004, 522, 0.1, {0.0, 0.3}, nil, false, "PUVL", "PILOT Reload Left Gondola, OFF/1/2/3")
defineTumb("PUVL_RELOAD_RIGHT_GONDOLA", 6, 3005, 527, 0.1, {0.0, 0.3}, nil, false, "PUVL", "PILOT Reload Right Gondola, OFF/1/2/3")
defineToggleSwitch("PUVL_WEAPON_SIGHT", 16, 3014, 529, "PUVL", "PILOT Weapon Sight, ON/OFF")
defineToggleSwitch("PUVL_WEAPON_CAMERA", 6, 3006, 530, "PUVL", "PILOT Weapon Camera, ON/OFF")
definePotentiometer("PUVL_MANUAL_RANGE", 16, 3004, 552, {0, 1}, "PUVL", "PILOT Manual Range Adjustment")
defineTumb("PUVL_WEAPON_SELECT", 6, 3007, 523, 0.1, {0.0, 0.8}, nil, false, "PUVL", "PILOT Weapon Selector, 9-POS")
definePushButton("PUVL_SIGHT_ZERO", 16, 3007, 528, "PUVL", "PILOT Sight Reset Crosshair")
define3PosTumb("PUVL_ROCKET_SELECT", 6, 3008, 531, "PUVL", "PILOT Rocket Select, LEFT/BOTH/RIGHT")

defineToggleSwitch("PUVL_FIRE_CONTROL", 6, 3009, 551, "PUVL", "PILOT Weapon Control, ON/OFF")
defineToggleSwitch("PUVL_CANNON_FIRE_RATE", 6, 3010, 550, "PUVL", "PILOT Cannon Fire Rate, SLOW/FAST")

definePushButton("PUVL_RELOAD_CANNON", 6, 3011, 549, "PUVL", "PILOT Reload Cannon")
definePushButton("PUVL_STOP_CONTAINER", 6, 3012, 547, "PUVL", "PILOT Stop Container")

defineToggleSwitch("PUVL_EXPLOSION_ON_JETTISON", 6, 3013, 546, "PUVL", "PILOT Explosion on Jettison, ON/OFF")
defineToggleSwitch("PUVL_EXPLOSION_ON_JETTISON_COVER", 6, 3014, 545, "PUVL", "PILOT Explosion on Jettison Cover, UP/DOWN")
definePushButton("PUVL_JETTISON_PYLONS", 6, 3015, 542, "PUVL", "PILOT Jettison Pylons")
defineToggleSwitch("PUVL_JETTISON_PYLONS_COVER", 6, 3016, 541, "PUVL", "PILOT Jettison Pylons Cover, UP/DOWN")
definePushButton("PUVL_JETTISON_LAUNCHER", 6, 3017, 538, "PUVL", "PILOT Jettison Launcher")
defineToggleSwitch("PUVL_JETTISON_LAUNCHER_COVER", 6, 3018, 537, "PUVL", "PILOT Jettison Launcher Cover, UP/DOWN")
definePushButton("PUVL_ARM_ROCKETS", 6, 3019, 536, "PUVL", "PILOT Arm Rockets")

------ Lights
defineIndicatorLight("PUVL_LIGHT_EXPLODE_ARMED", 548, "PUVL Lights", "PILOT PUVL Explosion on Jettison ARMED Light (Red)")

defineIndicatorLight("PUVL_LIGHT_PYLON_1", 544, "PUVL Lights", "PILOT PUVL Pylon 1 Light (Yellow)")
defineIndicatorLight("PUVL_LIGHT_PYLON_2", 543, "PUVL Lights", "PILOT PUVL Pylon 2 Light (Yellow)")
defineIndicatorLight("PUVL_LIGHT_PYLON_3", 540, "PUVL Lights", "PILOT PUVL Pylon 3 Light (Yellow)")
defineIndicatorLight("PUVL_LIGHT_PYLON_4", 539, "PUVL Lights", "PILOT PUVL Pylon 4 Light (Yellow)")

defineIndicatorLight("PUVL_LIGHT_USLP_LOADED", 533, "PUVL Lights", "PILOT PUVL USLP Loaded Light (Amber)")
defineIndicatorLight("PUVL_LIGHT_USLP_FINISHED", 532, "PUVL Lights", "PILOT PUVL USLP Finished Light (Amber)")

defineIndicatorLight("PUVL_LIGHT_LH_SIDE", 535, "PUVL Lights", "PILOT PUVL LH Side Light (Amber)")
defineIndicatorLight("PUVL_LIGHT_RH_SIDE", 534, "PUVL Lights", "PILOT PUVL RH Side Light (Amber)")
------ End Lights
---- End PUVL

---- ASP17
defineToggleSwitch("ASP17_SIGHT_MODE_MAN_AUTO", 16, 3001, 553, "ASP17", "PILOT ASP17 Sight Mode, MANUAL/AUTO")
defineToggleSwitch("ASP17_SIGHT_MODE_SYNC_ASYNC", 16, 3002, 554, "ASP17", "PILOT ASP17 Sight Mode, SYNC/ASYNC")

definePotentiometer("ASP17_SIGHT_VERTICAL_ADJUST", 16, 3005, 556, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Vertical Adjustment")
definePotentiometer("ASP17_SIGHT_BASE_ADJUST", 16, 3008, 557, {0, 1}, "ASP17", "PILOT ASP17 Base and Range Adjustment")
definePotentiometer("ASP17_SIGHT_CROSSHAIR_BRIGHTNESS_ADJUST", 16, 3011, 564, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Brightness Adjustment")
definePotentiometer("ASP17_SIGHT_HORIZONTAL_ADJUST", 16, 3006, 566, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Horizontal Adjustment")
definePotentiometer("ASP17_SIGHT_GRID_BRIGHTNESS_ADJUST", 16, 3010, 567, {0, 1}, "ASP17", "PILOT ASP17 Sight Grid Brightness Adjustment")

defineToggleSwitch("ASP17_SIGHT_CROSSHAIR_LAMP", 16, 3013, 568, "ASP17", "PILOT ASP17 Sight Crosshair Lamp, MAIN/BACKUP")
defineToggleSwitch("ASP17_SIGHT_GRID_LAMP", 16, 3012, 569, "ASP17", "PILOT ASP17 Sight Grid Lamp, MAIN/BACKUP")

definePushButton("ASP17_SIGHT_CONTROL", 16, 3009, 570, "ASP17", "PILOT ASP17 Sight Control")

------ Lights
defineIndicatorLight("ASP17_LIGHT_KMG", 559, "ASP17 Lights", "PILOT ASP17 KMG (USLP) Light (Amber)")
defineIndicatorLight("ASP17_LIGHT_GUV", 560, "ASP17 Lights", "PILOT ASP17 GUV (FXD MG) Light (Amber)")
defineIndicatorLight("ASP17_LIGHT_BOMBS", 561, "ASP17 Lights", "PILOT ASP17 BOMBS Light (Amber)")
defineIndicatorLight("ASP17_LIGHT_30", 562, "ASP17 Lights", "PILOT ASP17 30 Light (Amber)")
defineIndicatorLight("ASP17_LIGHT_NRS", 563, "ASP17 Lights", "PILOT ASP17 NRS (RKT) Light (Amber)")

defineIndicatorLight("ASP17_LIGHT_GREEN", 679, "ASP17 Lights", "PILOT ASP17 Green Light (Green)")
defineIndicatorLight("ASP17_LIGHT_YELLOW", 678, "ASP17 Lights", "PILOT ASP17 Yellow Light (Yellow)")
defineIndicatorLight("ASP17_LIGHT_GODEN", 571, "ASP17 Lights", "PILOT ASP17 Goden Light")
defineIndicatorLight("ASP17_LIGHT_USR_CHECK", 760, "ASP17 Lights", "PILOT ASP17 USR Check Light")
------ End Lights
---- End ASP17
-- End Weapon Systems

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights")
defineIntegerFromGetter("EXT_NOSE_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Nose Light (yellow)")
defineIntegerFromGetter("EXT_LAND_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(209) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Light (yellow)")
defineIntegerFromGetter("EXT_BEACON", function()
	if LoGetAircraftDrawArgumentValue(83) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Beacon Light (red)")
defineIntegerFromGetter("EXT_BLADE_L", function()
	if LoGetAircraftDrawArgumentValue(47) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Blade Lights (yellow)")
defineIntegerFromGetter("EXT_WIPER", function()
	return math.floor(LoGetAircraftDrawArgumentValue(973)*65535)
end, 65535, "External Aircraft Model", "Wiper")
defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()