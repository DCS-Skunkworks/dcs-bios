module("F-5E-3", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_5E_3: Module
local F_5E_3 = Module:new("F-5E-3", 0x7600, { "F-5E-3" })

--by WarLord

--Remove Pilot Arg# 775

-- Indicator Lights
F_5E_3:defineIndicatorLight("L_GEN", 530, "Warning, Caution and IndicatorLights", "L Generator Lamp (yellow)")
F_5E_3:defineIndicatorLight("CANOPY", 531, "Warning, Caution and IndicatorLights", "Canopy Open (yellow)")
F_5E_3:defineIndicatorLight("R_GEN", 532, "Warning, Caution and IndicatorLights", "R Generator Lamp (yellow)")
F_5E_3:defineIndicatorLight("UTIL_HYDRAULIC", 533, "Warning, Caution and IndicatorLights", "Utility Hydr (yellow)")
F_5E_3:defineIndicatorLight("SPARE_1", 534, "Warning, Caution and IndicatorLights", "Spare 1 (yellow)")
F_5E_3:defineIndicatorLight("FLIGHT_HYDRAULIC", 535, "Warning, Caution and IndicatorLights", "Flight Hydr (yellow)")
F_5E_3:defineIndicatorLight("EXT_TANKS", 536, "Warning, Caution and IndicatorLights", "External Tanks Empty (yellow)")
F_5E_3:defineIndicatorLight("IFF", 537, "Warning, Caution and IndicatorLights", "IFF (yellow)")
F_5E_3:defineIndicatorLight("OXYGEN", 538, "Warning, Caution and IndicatorLights", "Oxygen (yellow)")
F_5E_3:defineIndicatorLight("LEFT_FUEL_LOW", 539, "Warning, Caution and IndicatorLights", "Left Flow Indicator (yellow)")
F_5E_3:defineIndicatorLight("ENGINE_ANTI_ICE", 540, "Warning, Caution and IndicatorLights", "Anti Ice (yellow)")
F_5E_3:defineIndicatorLight("RIGHT_FUEL_LOW", 541, "Warning, Caution and IndicatorLights", "Right Flow Indicator (yellow)")
F_5E_3:defineIndicatorLight("L_FUEL_PRESS", 542, "Warning, Caution and IndicatorLights", "L Fuel Press (yellow)")
F_5E_3:defineIndicatorLight("INS", 543, "Warning, Caution and IndicatorLights", "Inertial Navigation System (yellow)")
F_5E_3:defineIndicatorLight("R_FUEL_PRESS", 544, "Warning, Caution and IndicatorLights", "R Fuel Press (yellow)")
F_5E_3:defineIndicatorLight("AOA_FLAPS", 545, "Warning, Caution and IndicatorLights", "AoA Flaps (yellow)")
F_5E_3:defineIndicatorLight("AIR_DATA_COMPUTER", 546, "Warning, Caution and IndicatorLights", "Air Data Computer (yellow)")
F_5E_3:defineIndicatorLight("DIR_GYRO", 547, "Warning, Caution and IndicatorLights", "Directional Gyroscope (yellow)")
F_5E_3:defineIndicatorLight("SPARE_2", 548, "Warning, Caution and IndicatorLights", "Spare 2 (yellow)")
F_5E_3:defineIndicatorLight("DC_OVERLOAD", 549, "Warning, Caution and IndicatorLights", "DC Overload (yellow)")
F_5E_3:defineIndicatorLight("SPARE_3", 550, "Warning, Caution and IndicatorLights", "Spare 3 (yellow)")
F_5E_3:defineIndicatorLight("MC_LIGHT", 169, "Warning, Caution and IndicatorLights", "MasterCaution Lamp (yellow)")
F_5E_3:defineIndicatorLight("L_FIRE", 167, "Warning, Caution and IndicatorLights", "Left Fire Lamp (red)")
F_5E_3:defineIndicatorLight("R_FIRE", 168, "Warning, Caution and IndicatorLights", "Right Fire Lamp (red)")
F_5E_3:defineIndicatorLight("AOA_R", 48, "Warning, Caution and IndicatorLights", "AOA (red)")
F_5E_3:defineIndicatorLight("AOA_G", 49, "Warning, Caution and IndicatorLights", "AOA (green)")
F_5E_3:defineIndicatorLight("AOA_Y", 50, "Warning, Caution and IndicatorLights", "AOA (yellow)")

-- Control System
F_5E_3:defineToggleSwitch("YAW_DAMPER", 2, 3001, 323, "Control Interface", "Yaw Damper Switch, YAW/OFF")
F_5E_3:defineToggleSwitch("PITCH_DAMPER", 2, 3002, 322, "Control Interface", "Pitch Damper Switch, PITCH/OFF")
F_5E_3:definePotentiometer("RUDDER_TRIM", 2, 3003, 324, { -1, 1 }, "Control Interface", "Rudder Trim Knob")
F_5E_3:definePushButton("PITCH_DAMPER_CUT", 2, 3004, 132, "Control Interface", "Pitch Damper Cutoff Switch")
F_5E_3:define3PosTumb("FLAPS", 2, 3005, 116, "Control Interface", "Flaps Lever, EMER UP/THUMB SW/FULL")
F_5E_3:define3PosTumb("A_FLAPS", 2, 3006, 115, "Control Interface", "Auto Flap System Thumb Switch, UP/FIXED/AUTO")
F_5E_3:define3PosTumb("SPEED", 2, 3007, 101, "Control Interface", "Speed Brake Switch, OUT/OFF/IN")
F_5E_3:defineToggleSwitch("RUDDER_T", 2, 3014, 278, "Control Interface", "Rudder Pedal Adjust T-Handle, PULL/STOW")
F_5E_3:defineFloat("TRIM_INDICATOR", 52, { 1.0, -0.1 }, "Gauges", "Trim Position")
F_5E_3:defineFloat("FLAP_INDICATOR", 51, { 0, 0.4 }, "Gauges", "Flap Indicator")
F_5E_3:defineFloat("SLIPBALL", 3, { -1, 1 }, "Gauges", "Slipball")

-- Electric system
F_5E_3:defineToggleSwitch("SW_BATTERY", 3, 3001, 387, "Electric", "Battery Switch")
F_5E_3:defineToggleSwitch("L_GENERATOR", 3, 3002, 388, "Electric", "Generator Left")
F_5E_3:defineToggleSwitch("R_GENERATOR", 3, 3004, 389, "Electric", "Generator Right")
F_5E_3:defineToggleSwitch("PITOT_HEATER", 3, 3006, 375, "Electric", "Pitot Heater")
F_5E_3:define3PosTumb("F_O2_SW", 3, 3007, 230, "Electric", "Fuel & Oxygen Switch, GAGE TEST/OFF/QTY CHECK")

-- Fuel System
F_5E_3:defineToggleSwitch("L_SHUTOFF_S", 4, 3001, 360, "Fuel", "Left Fuel Shutoff Switch, OPEN/CLOSED")
F_5E_3:defineToggleSwitch("R_SHUTOFF_S", 4, 3002, 362, "Fuel", "Right Fuel Shutoff Switch, OPEN/CLOSED")
F_5E_3:defineToggleSwitch("EXT_PYLON_SW", 4, 3003, 378, "Fuel", "Ext Fuel Pylons Switch, ON/OFF")
F_5E_3:defineToggleSwitch("EXT_CENTER_SW", 4, 3004, 377, "Fuel", "Ext Fuel Cl Switch, ON/OFF")
F_5E_3:defineToggleSwitch("CROSSFEED", 4, 3005, 381, "Fuel", "Crossfeed Switch, OPEN/CLOSED")
-- F_5E_3:define3Pos2CommandSwitchF5("AUTOBAL", 4, 3007, 3006, 383, "Fuel", "Autobalance Switch, LEFT/NEUT/RIGHT") -- this legacy function wouldn't allow the switch to reset to center automatically
F_5E_3:defineRockerSwitch("AUTOBAL", 4, 3007, 3007, 3006, 3006, 383, "Fuel", "Autobalance Switch, LEFT/NEUT/RIGHT") -- this function is similar to other electrically-held switches in bios
F_5E_3:defineToggleSwitch("L_BOOSTPUMP", 4, 3008, 380, "Fuel", "Left Boost Pump Switch, ON/OFF")
F_5E_3:defineToggleSwitch("R_BOOSTPUMP", 4, 3009, 382, "Fuel", "Right Boost Pump Switch, ON/OFF")
F_5E_3:defineToggleSwitch("L_SHUTOFF_C", 4, 3010, 359, "Fuel", "Left Fuel Shutoff Switch Cover, OPEN/CLOSED")
F_5E_3:defineToggleSwitch("R_SHUTOFF_C", 4, 3011, 361, "Fuel", "Right Fuel Shutoff Switch Cover, OPEN/CLOSED")
F_5E_3:defineFloat("FUELQUANTITY_L", 22, { 0, 1 }, "Gauges", "Fuel Quantity Left")
F_5E_3:defineFloat("FUELQUANTITY_R", 23, { 0, 1 }, "Gauges", "Fuel Quantity Right")
F_5E_3:defineFloat("FUELFLOW_R", 526, { 0.0, 1.0 }, "Gauges", "Fuel Flow Right")
F_5E_3:defineFloat("FUELFLOW_L", 525, { 0.0, 1.0 }, "Gauges", "Fuel Flow Left")

-- Engines
F_5E_3:definePushButton("L_START", 6, 3001, 357, "Engine Interface", "Left Engine Start Button")
F_5E_3:definePushButton("R_START", 6, 3002, 358, "Engine Interface", "Right Engine Start Button")
F_5E_3:defineToggleSwitch("INLET_HEATER", 6, 3003, 376, "Engine Interface", "Engine Anti-Ice Switch, ENGINE/OFF")
F_5E_3:defineFloat("NOZZLEPOS_L", 107, { 0, 1 }, "Gauges", "Nozzle Position Left")
F_5E_3:defineFloat("NOZZLEPOS_R", 108, { 0, 1 }, "Gauges", "Nozzle Position Right")
F_5E_3:defineFloat("AUXINT_DOOR", 111, { 0, 0.2 }, "Gauges", "Aux Intake Doors")
F_5E_3:defineFloat("OILPRESS_L", 112, { 0, 1 }, "Gauges", "Oil Pressure Left")
F_5E_3:defineFloat("OILPRESS_R", 113, { 0, 1 }, "Gauges", "Oil Pressure Right")
F_5E_3:defineFloat("EXHAUST_TEMP_L", 12, { 0, 1 }, "Gauges", "Exhaust Gas Temp Left")
F_5E_3:defineFloat("EXHAUST_TEMP_R", 14, { 0, 1 }, "Gauges", "Exhaust Gas Temp Right")
F_5E_3:defineFloat("TACHO_L", 16, { 0, 1 }, "Gauges", "Tachometer Left")
F_5E_3:defineFloat("TACHO_PERC_L", 425, { 0, 1 }, "Gauges", "Tachometer Percent Left")
F_5E_3:defineFloat("TACHO_R", 17, { 0, 1 }, "Gauges", "Tachometer Right")
F_5E_3:defineFloat("TACHO_PERC_R", 426, { 0, 1 }, "Gauges", "Tachometer Percent Right")
F_5E_3:defineFloat("UTIL_PRESS", 109, { 0, 1 }, "Gauges", "Utility Pressure")
F_5E_3:defineFloat("FLIGHT_PRESS", 110, { 0, 1 }, "Gauges", "Flight Pressure")

-- Gear System
F_5E_3:defineIndicatorLight("GW_LIGHT", 96, "Gear Interface", "Gear Warning Lamp (red)")
F_5E_3:defineIndicatorLight("NOSE_LIGHT", 54, "Gear Interface", "Gear Nose Lamp (green)")
F_5E_3:defineIndicatorLight("LEFT_LIGHT", 53, "Gear Interface", "Gear Left Lamp (green)")
F_5E_3:defineIndicatorLight("RIGHT_LIGHT", 55, "Gear Interface", "Gear Right Lamp (green)")
F_5E_3:defineIndicatorLight("HOOK_LIGHT", 90, "Gear Interface", "Hook Warning Lamp (red)")
F_5E_3:defineToggleSwitch("LG_LEVER_SWITCH", 7, 3001, 83, "Gear Interface", "Gear Lever")
F_5E_3:definePushButton("LG_ALT_REL", 7, 3002, 95, "Gear Interface", "Landing Gear Alternate Release Handle, Pull and Hold")
F_5E_3:definePushButton("LG_DOWN_L", 7, 3003, 88, "Gear Interface", "Landing Gear Downlock Override Button - Push and Hold")
F_5E_3:definePushButton("NWS", 7, 3004, 131, "Gear Interface", "Nosewheel Steering Button - Pull and Hold")
F_5E_3:defineToggleSwitch("LG_ALT_RES", 7, 3005, 98, "Gear Interface", "Landing Gear Alternate Release Reset Control, OFF/RESET")
F_5E_3:defineToggleSwitch("NS_STRUCT", 7, 3006, 250, "Gear Interface", "Nose Strut Switch, EXTEND/RETRACT")
F_5E_3:definePushButton("LGF_SILENCE", 7, 3007, 87, "Gear Interface", "Landing Gear And Flap Warning Silence Button")
F_5E_3:definePushButton("LG_TEST", 7, 3008, 92, "Gear Interface", "Left Landing Gear Test Lamp")
F_5E_3:definePushButton("NG_TEST", 7, 3009, 93, "Gear Interface", "Nose Landing Gear Test Lamp")
F_5E_3:definePushButton("RG_TEST", 7, 3010, 94, "Gear Interface", "Right Landing Gear Test Lamp")
F_5E_3:definePushButton("HOOK", 7, 3014, 89, "Gear Interface", "Arresting Hook Button")

-- Oxygen System
F_5E_3:defineToggleSwitch("O2_LEVER", 8, 3001, 603, "O2 Interface", "Oxygen Supply Lever, ON/OFF")
F_5E_3:defineToggleSwitch("DILUTER_LEVER", 8, 3002, 602, "O2 Interface", "Diluter Lever")
F_5E_3:define3PosTumb("EMER_L", 8, 3003, 601, "O2 Interface", "Emergency Lever, EMERGENCY/NORMAL/TEST MASK")
F_5E_3:defineFloat("O2QUANTITY", 390, { 0, 1 }, "Gauges", "O2 Quantity")
F_5E_3:defineFloat("O2FLOWINDICATOR", 600, { 0, 1 }, "Gauges", "O2 Flow Blinker")
F_5E_3:defineFloat("O2FLOWPRESSURE", 604, { 0.0, 1.0 }, "Gauges", "O2 FlowPressure")

-- EC System
F_5E_3:define3PosTumb("CABIN_P_SW", 9, 3001, 371, "EC Interface", "Cabin Press Switch, DEFOG ONLY/NORMAL/RAM DUMP")
F_5E_3:defineToggleSwitch("CABIN_P_C", 9, 3002, 370, "EC Interface", "Cabin Press Switch Cover, OPEN/CLOSED")
F_5E_3:defineMultipositionSwitch("CABIN_TEMP_SW", 9, 3003, 372, 3, 0.1, "EC Interface", "Cabin Temp Switch, AUTO/CENTER/MAN COLD/MAN HOT")
F_5E_3:definePotentiometer("CABIN_TEMP", 9, 3004, 373, { -1, 1 }, "EC Interface", "Cabin Temperature Knob")
F_5E_3:definePotentiometer("CABIN_DEFOG", 9, 3005, 374, { 0, 1 }, "EC Interface", "Canopy Defog Knob")

-- Cockpit Mechanics
F_5E_3:defineToggleSwitch("CANOPY_LEVER", 10, 3001, 712, "Cockpit", "Canopy Handle, OPEN/CLOSE")
F_5E_3:define3PosTumb("DRAG_CHUTE", 10, 3002, 91, "Cockpit", "Chute Handle")
F_5E_3:defineToggleSwitch("CANOPY_JETTISON", 10, 3005, 384, "Cockpit", "Canopy Jettison T-Handle, PULL/PUSH")
F_5E_3:defineFloat("CABIN_PRESS", 114, { 0, 1 }, "Gauges", "Cabin Pressure")

-- External Lights
F_5E_3:definePotentiometer("NAV_LIGHTS", 11, 3001, 227, { 0, 1 }, "External Lights", "Nav Lights Knob")
F_5E_3:definePotentiometer("FORMATION_LIGHTS", 11, 3002, 228, { 0, 1 }, "External Lights", "Formation Lights Knob")
F_5E_3:defineToggleSwitch("BEACON", 11, 3003, 229, "External Lights", "Beacon Light Switch")
F_5E_3:defineToggleSwitch("LG_LIGHT", 11, 3004, 353, "External Lights", "Landing & Taxi Light Switch, ON/OFF")

-- Internal Lights
F_5E_3:defineToggleSwitch("PANEL_L_SW", 12, 3001, 46, "Internal Lights", "AN/ASG-31 Sight Panel Light Button, ON/OFF")
F_5E_3:defineToggleSwitch("COMPAS_L_SW", 12, 3002, 613, "Internal Lights", "Magnetic Compass Light Switch, LIGHT/OFF")
F_5E_3:definePotentiometer("FLOOD_LIGHTS", 12, 3003, 221, { 0, 1 }, "Internal Lights", "Flood Lights Knob")
F_5E_3:definePotentiometer("FLIGHT_LIGHTS", 12, 3004, 222, { 0, 1 }, "Internal Lights", "Flight Instruments Lights Knob")
F_5E_3:definePotentiometer("ENGINE_LIGHTS", 12, 3005, 223, { 0, 1 }, "Internal Lights", "Engine Instruments Lights Knob")
F_5E_3:definePotentiometer("CONSOLE_LIGHTS", 12, 3006, 224, { 0, 1 }, "Internal Lights", "Console Lights Knob")
F_5E_3:definePotentiometer("ARM_LIGHTS", 12, 3007, 363, { 0, 1 }, "Internal Lights", "Armament Panel Lights Knob")
F_5E_3:definePushButton("WARN_T_SW", 12, 3008, 226, "Internal Lights", "Warning Test Switch")
F_5E_3:define3PosTumb("BRI_DIM_SW", 12, 3009, 225, "Internal Lights", "Bright/Dim Switch, BRT/NEUT/DIM")
F_5E_3:definePushButton("MC_RESET_BTN", 12, 3011, 172, "Internal Lights", "Master Caution Button")

-- Countermeasures Dispensing System
F_5E_3:defineTumb("CHAFF_MODE", 13, 3001, 400, 0.1, { 0, 0.3 }, nil, false, "CMDS", "Chaff Mode Selector, OFF/SINGLE/PRGM/MULT")
F_5E_3:defineTumb("FLARE_MODE_SEL", 13, 3002, 404, 0.1, { 0, 0.2 }, nil, false, "CMDS", "Flare Mode Selector, OFF/SINGLE/PRGM")
F_5E_3:defineToggleSwitch("FL_JETT_COVER", 13, 3003, 408, "CMDS", "Flare Jettison Switch Cover, OPEN/CLOSED")
F_5E_3:defineToggleSwitch("FL_JETT_SW", 13, 3004, 409, "CMDS", "Flare Jettison Switch, OFF/UP")
F_5E_3:definePushButton("CHAFF_COUNT", 13, 3005, 403, "CMDS", "Chaff Counter Reset Button - Push to reset")
F_5E_3:definePushButton("FL_COUNT", 13, 3006, 407, "CMDS", "Flare Counter Reset Button - Push to reset")
F_5E_3:definePushButton("FL_CHAFF_BT", 13, 3007, 117, "CMDS", "Flare-Chaff Button - Push to dispense")
F_5E_3:defineFloat("CHAFF_COUNT_10", 401, { 0, 1 }, "Gauges", "Chaff Drum Counter 10")
F_5E_3:defineFloat("CHAFF_COUNT_1", 402, { 0, 1 }, "Gauges", "Chaff Drum Counter 1")
F_5E_3:defineFloat("FL_COUNT_10", 405, { 0, 1 }, "Gauges", "Flare Drum Counter 10")
F_5E_3:defineFloat("FL_COUNT_1", 406, { 0, 1 }, "Gauges", "Flare Drum Counter 1")

local function getFlareCount(dev0)
	return Module.build_gauge_from_arguments(dev0, { 406, 405 })
end
F_5E_3:defineIntegerFromGetter("CM_FLARECNT_DISPLAY", getFlareCount, 60, "CMDS", "Flare Counter Display")

local function getChaffCount(dev0)
	return Module.build_gauge_from_arguments(dev0, { 402, 401 })
end
F_5E_3:defineIntegerFromGetter("CM_CHAFFCNT_DISPLAY", getChaffCount, 60, "CMDS", "Chaff Counter Display")

-- Jettison System
F_5E_3:defineToggleSwitch("EMER_JETT_COVER", 14, 3001, 364, "Jettison", "Emergency All Jettison Button Cover, OPEN")
F_5E_3:definePushButton("EMER_JETT_B", 14, 3002, 365, "Jettison", "Emergency All Jettison Button - Push to jettison")
F_5E_3:define3PosTumb("JETT_SW", 14, 3003, 367, "Jettison", "Select Jettison Switch, SELECT POSITION/OFF/ALL PYLONS")
F_5E_3:definePushButton("JETT_B", 14, 3004, 366, "Jettison", "Select Jettison Button - Push to jettison")

-- Weapons Control
F_5E_3:defineToggleSwitch("ARMPOS1", 15, 3001, 346, "Weapons Control", "Armament Position Selector - L WINGTIP, ON/OFF")
F_5E_3:defineToggleSwitch("ARMPOS2", 15, 3002, 347, "Weapons Control", "Armament Position Selector - L OUTBD, ON/OFF")
F_5E_3:defineToggleSwitch("ARMPOS3", 15, 3003, 348, "Weapons Control", "Armament Position Selector - L INBD, ON/OFF")
F_5E_3:defineToggleSwitch("ARMPOS4", 15, 3004, 349, "Weapons Control", "Armament Position Selector - CENTER, ON/OFF")
F_5E_3:defineToggleSwitch("ARMPOS5", 15, 3005, 350, "Weapons Control", "Armament Position Selector - R INBD, ON/OFF")
F_5E_3:defineToggleSwitch("ARMPOS6", 15, 3006, 351, "Weapons Control", "Armament Position Selector - R OUTBD, ON/OFF")
F_5E_3:defineToggleSwitch("ARMPOS7", 15, 3007, 352, "Weapons Control", "Armament Position Selector - R WINGTIP, ON/OFF")
F_5E_3:define3PosTumb("INT_SW", 15, 3008, 340, "Weapons Control", "Interval Switch [sec], .06/.10/.14")
F_5E_3:defineTumb("BOMBS_ARM_SW", 15, 3009, 341, 0.2, { 0.2, 0.8 }, nil, false, "Weapons Control", "Bombs Arm Switch, SAFE/TAIL/NOSE & TAIL/NOSE")
F_5E_3:defineToggleSwitch("MASTER_ARM_GUARD", 15, 3010, 342, "Weapons Control", "Master Arm Safe Guard")
F_5E_3:define3PosTumb("MASTER_ARM", 15, 3011, 343, "Weapons Control", "Master Arm Guns, GUNS MSL & CAMR/OFF/CAMR ONLY")
F_5E_3:defineTumb("EXT_STORE", 15, 3012, 344, 0.1, { 0, 0.3 }, nil, false, "Weapons Control", "External Stores Selector RIPL/BOMB/SAFE/RKT DISP")
F_5E_3:definePushButton("MISSILE_UNCAGE", 15, 3014, 136, "Weapons Control", "Missile Uncage Switch - Press and hold to uncage missile seeker head")
F_5E_3:definePotentiometer("MISSILE_VOL", 15, 3015, 345, { 0, 1 }, "Weapons Control", "Missile Volume Knob")
F_5E_3:definePushButton("WEAPON_RELEASE", 15, 3018, 128, "Weapons Control", "Weapon Release Button")

-- AHRS
F_5E_3:definePushButton("AHRS_ERECT", 16, 3001, 166, "AHRS", "Fast Erect Button - Push to erect")
F_5E_3:define3PosTumb("AHRS_FAST_SLAVE", 16, 3003, 220, "AHRS", "Compass Switch, DIR GYRO/MAG/FAST SLAVE")
F_5E_3:defineTumb("AHRS_NAV_MODE", 16, 3004, 273, 0.1, { 0.0, 0.1 }, nil, false, "AHRS", "Nav Mode Selector Switch, DF/TACAN")

-- AN/APQ-159 Radar Control Panel
F_5E_3:definePotentiometer("RADAR_ELEVATION", 17, 3001, 321, { -1, 1 }, "Radar", "AN/APQ-159 Radar Elevation Antenna Tilt Control Knob")
F_5E_3:defineTumb("RADAR_RANGE", 17, 3004, 315, 0.1, { 0, 0.3 }, nil, false, "Radar", "AN/APQ-159 Radar Range Selector Switch [nm], 5/10/20/40")
F_5E_3:defineTumb("RADAR_MODE", 17, 3005, 316, 0.1, { 0, 0.3 }, nil, false, "Radar", "AN/APQ-159 Radar Mode Selector Switch, OFF/STBY/OPER/TEST")
F_5E_3:definePushButton("RADAR_ACQUIS", 17, 3006, 317, "Radar", "AN/APQ-159 Radar Acquisition Button")
F_5E_3:definePotentiometer("RADAR_SCALE", 17, 3007, 65, { 0, 1 }, "Radar", "AN/APQ-159 Radar Scale Knob")
F_5E_3:definePotentiometer("RADAR_BRIGHT", 17, 3008, 70, { 0, 1 }, "Radar", "AN/APQ-159 Radar Bright Knob")
F_5E_3:definePotentiometer("RADAR_PERSIS", 17, 3009, 69, { 0, 1 }, "Radar", "AN/APQ-159 Radar Persistence Knob")
F_5E_3:definePotentiometer("RADAR_VIDEO", 17, 3010, 68, { 0, 1 }, "Radar", "AN/APQ-159 Radar Video Knob")
F_5E_3:definePotentiometer("RADAR_CURSOR", 17, 3011, 67, { 0, 1 }, "Radar", "AN/APQ-159 Radar Cursor Knob")
F_5E_3:definePotentiometer("RADAR_PITCH", 17, 3012, 66, { -0.75, 0.75 }, "Radar", "AN/APQ-159 Radar Pitch Knob")
F_5E_3:defineIndicatorLight("RADAR_SCALE_5", 155, "Warning, Caution and IndicatorLights", "Radar Range Scale 5")
F_5E_3:defineIndicatorLight("RADAR_SCALE_10", 156, "Warning, Caution and IndicatorLights", "Radar Range Scale 10")
F_5E_3:defineIndicatorLight("RADAR_SCALE_20", 157, "Warning, Caution and IndicatorLights", "Radar Range Scale 20")
F_5E_3:defineIndicatorLight("RADAR_SCALE_40", 158, "Warning, Caution and IndicatorLights", "Radar Range Scale 40")
F_5E_3:defineIndicatorLight("RADAR_INRANGE", 159, "Warning, Caution and IndicatorLights", "Radar InRange Light")
F_5E_3:defineIndicatorLight("RADAR_FAIL", 160, "Warning, Caution and IndicatorLights", "Radar Fail Light")
F_5E_3:defineIndicatorLight("RADAR_LOCKON", 161, "Warning, Caution and IndicatorLights", "Radar LockOn Light")
F_5E_3:defineIndicatorLight("RADAR_EXCESS", 162, "Warning, Caution and IndicatorLights", "Radar ExcessG Light")
F_5E_3:defineIndicatorLight("RADAR_SCALE_BRIGHT", 163, "Warning, Caution and IndicatorLights", "Radar Scale Brightness")
F_5E_3:defineFloat("TDC_RANGE", 319, { -1, 1 }, "Gauges", "TdcControlRange")
F_5E_3:defineFloat("TDC_AZIMUTH", 318, { -1, 1 }, "Gauges", "TdcControlAzimuth")

-- AN/ASG-31 Sight
F_5E_3:defineTumb("SIGHT_MODE", 18, 3001, 40, 0.1, { 0, 0.4 }, nil, false, "Sight", "AN/ASG-31 Sight Mode Selector, OFF/MSL/A/A1 GUNS/A/A2 GUNS/MAN")
F_5E_3:defineRotary("SIGHT_DEPRESS", 18, 3002, 42, "Sight", "AN/ASG-31 Sight Reticle Depression Knob")
F_5E_3:definePotentiometer("SIGHT_INTENS", 18, 3003, 41, { 0, 1 }, "Sight", "AN/ASG-31 Sight Reticle Intensity Knob")
F_5E_3:define3PosTumb("SIGHT_BIT", 18, 3004, 47, "Sight", "AN/ASG-31 Sight BIT Switch, BIT 1/OFF/BIT 2")
F_5E_3:definePushButton("SIGHT_CAGE", 18, 3007, 137, "Sight", "AN/ASG-31 Sight Cage Switch")
F_5E_3:defineFloat("SIGHT_DEP_100", 43, { 0, 1 }, "Gauges", "Ret Depression Drum 100")
F_5E_3:defineFloat("SIGHT_DEP_10", 44, { 0, 1 }, "Gauges", "Ret Depression Drum 10")
F_5E_3:defineFloat("SIGHT_DEP_1", 45, { 0, 1 }, "Gauges", "Ret Depression Drum 1")

-- RWR-IC
F_5E_3:definePushButton("RWR_MODE", 19, 3001, 551, "RWR IC", "RWR MODE Button")
F_5E_3:definePushButton("RWR_SEARCH", 19, 3002, 554, "RWR IC", "RWR SEARCH Button")
F_5E_3:definePushButton("RWR_HAND", 19, 3003, 556, "RWR IC", "RWR HANDOFF Button")
F_5E_3:definePushButton("RWR_ALT", 19, 3004, 561, "RWR IC", "RWR ALTITUDE Button")
F_5E_3:definePushButton("RWR_T", 19, 3005, 564, "RWR IC", "RWR T Button")
F_5E_3:definePushButton("RWR_TEST", 19, 3006, 567, "RWR IC", "RWR SYS TEST Button")
F_5E_3:definePushButton("RWR_SHIP", 19, 3007, 570, "RWR IC", "RWR UNKNOWN SHIP Button")
F_5E_3:definePushButton("RWR_PWR", 19, 3008, 575, "RWR IC", "RWR POWER Button")
F_5E_3:definePushButton("RWR_LAUNCH", 19, 3009, 559, "RWR IC", "RWR LAUNCH Button")
F_5E_3:definePushButton("RWR_ACT", 19, 3010, 573, "RWR IC", "RWR ACT/PWR Button")
F_5E_3:definePotentiometer("RWR_DIM", 19, 3011, 578, { 0, 1 }, "RWR IC", "RWR DIM Knob")
F_5E_3:definePotentiometer("RWR_VOL", 19, 3012, 577, { 0, 1 }, "RWR IC", "RWR AUDIO Knob")

-- AN/ALR-87 RWR
F_5E_3:definePotentiometer("RWR_INT", 20, 3001, 140, { 0, 1 }, "AN ALR87", "RWR INT Knob")

-- Sight Camera
F_5E_3:defineToggleSwitch("CAMERA_FPS", 21, 3001, 80, "Camera", "Sight Camera FPS Select Switch, 24/48")
F_5E_3:definePotentiometer("CAMERA_LENS", 21, 3002, 140, { 0, 1 }, "Camera", "Sight Camera Lens f-Stop Selector, 2.8(dull)..22(bright)")
F_5E_3:defineTumb("CAMERA_OVERRUN", 21, 3003, 311, 0.1, { 0, 0.3 }, nil, false, "Camera", "Sight Camera Overrun Selector, 0/3/10/20")
F_5E_3:definePushButton("CAMERA_RUN", 21, 3004, 573, "Camera", "Sight Camera Run (Test) Switch, ON/OFF")

-- IFF
F_5E_3:defineIndicatorLight("IFF_REPLY_L", 216, "IFF", "IFF Reply Lamp (green)")
F_5E_3:defineIndicatorLight("IFF_TEST_L", 218, "IFF", "IFF Test Lamp (green)")
F_5E_3:defineTumb("IFF4_CODE_SEL", 22, 3001, 199, 0.1, { 0, 0.3 }, nil, false, "IFF", "IFF MODE 4 CODE Selector, ZERO/B/A/HOLD")
F_5E_3:defineTumb("IFF4_MASTER", 22, 3002, 200, 0.1, { 0, 0.4 }, nil, false, "IFF", "IFF MASTER Control Selector, EMER/NORM/LOW/STBY/OFF")
F_5E_3:define3PosTumb("IFF4_MON_CONTR", 22, 3003, 201, "IFF", "IFF MODE 4 Monitor Control Switch, AUDIO/OUT/LIGHT")
F_5E_3:define3PosTumb("IFF4_M1", 22, 3004, 202, "IFF", "IFF Mode Select/TEST Switch, M-1 /ON/OUT")
F_5E_3:define3PosTumb("IFF4_M2", 22, 3005, 203, "IFF", "IFF Mode Select/TEST Switch, M-2 /ON/OUT")
F_5E_3:define3PosTumb("IFF4_M3", 22, 3006, 204, "IFF", "IFF Mode Select/TEST Switch, M-3/A /ON/OUT")
F_5E_3:define3PosTumb("IFF4_MC", 22, 3007, 205, "IFF", "IFF Mode Select/TEST Switch, M-C /ON/OUT")
F_5E_3:define3PosTumb("IFF4_RAD", 22, 3008, 206, "IFF", "IFF RAD TEST/MON Switch, RAD TEST/OUT/MON")
F_5E_3:define3PosTumb("IFF4_IDENT", 22, 3009, 207, "IFF", "IFF Identification of Position (IP) Switch, IDENT/OUT/MIC")
F_5E_3:defineToggleSwitch("IFF4_CONTROL", 22, 3010, 208, "IFF", "IFF MODE 4 Control Switch, ON/OUT")
F_5E_3:defineTumb("IFF4_MODE1_SELECTOR1", 22, 3011, 209, 0.1, { 0, 1 }, nil, false, "IFF", "IFF MODE 1 Code Selector Wheel 1")
F_5E_3:defineTumb("IFF4_MODE1_SELECTOR2", 22, 3012, 210, 0.1, { 0, 1 }, nil, false, "IFF", "IFF MODE 1 Code Selector Wheel 2")
F_5E_3:defineTumb("IFF4_MODE3_SELECTOR1", 22, 3013, 211, 0.1, { 0, 1 }, nil, false, "IFF", "IFF MODE 3/A Code Selector Wheel 1")
F_5E_3:defineTumb("IFF4_MODE3_SELECTOR2", 22, 3014, 212, 0.1, { 0, 1 }, nil, false, "IFF", "IFF MODE 3/A Code Selector Wheel 2")
F_5E_3:defineTumb("IFF4_MODE3_SELECTOR3", 22, 3015, 213, 0.1, { 0, 1 }, nil, false, "IFF", "IFF MODE 3/A Code Selector Wheel 3")
F_5E_3:defineTumb("IFF4_MODE3_SELECTOR4", 22, 3016, 214, 0.1, { 0, 1 }, nil, false, "IFF", "IFF MODE 3/A Code Selector Wheel 4")
F_5E_3:definePushButton("IFF4_REPLY_L", 22, 3017, 215, "IFF", "MODE 4 REPLY Light - Press to test(LMB)")
F_5E_3:definePushButton("IFF4_RAD_TEST_L", 22, 3018, 217, "IFF", "Radiation TEST and Monitor Light - Press to test(LMB)")
F_5E_3:defineToggleSwitch("IFF4_CODE_SEL_PULL", 22, 3019, 197, "IFF", "IFF MODE 4 CODE Selector Pull")
F_5E_3:defineToggleSwitch("IFF4_MASTER_PULL", 22, 3020, 198, "IFF", "IFF MASTER Control Selector Pull")

-- Instruments --------------------------
F_5E_3:defineFloat("AOA_GAUGE", 7, { 0, 1 }, "Gauges", "AOA Units")
F_5E_3:defineFloat("MOTOR_RUN", 85, { 1, 0 }, "Gauges", "Motor Run Knob")
F_5E_3:defineFloat("VARIOMETER", 24, { -1, 1 }, "Gauges", "Variometer")
F_5E_3:defineFloat("SAI_PITCH", 438, { -0.666, 0.736 }, "Gauges", "SAI Pitch") -- values straight from mainpanel_init.lua with 0.001 padding
F_5E_3:defineFloat("SAI_BANK", 439, { 1, -1 }, "Gauges", "SAI Bank")
F_5E_3:defineFloat("SAI_OFF", 440, { 0, 1 }, "Gauges", "SAI OFF Flag")
F_5E_3:defineFloat("SAI_ARROW", 443, { 0, 1 }, "Gauges", "SAI Knob Arrow")
F_5E_3:defineFloat("CANOPY_POS", 181, { 0, 1 }, "Gauges", "Canopy Position")

-- Accelerometer
F_5E_3:definePushButton("ACC", 27, 3001, 904, "Accelerometer", "Accelerometer - Push to set")
F_5E_3:defineFloat("ACCELEROMETER", 6, { 0, 1 }, "Gauges", "Accelerometer")
F_5E_3:defineFloat("ACCELEROMETER_MIN", 902, { 0, 1 }, "Gauges", "Accelerometer Min")
F_5E_3:defineFloat("ACCELEROMETER_MAX", 903, { 0, 1 }, "Gauges", "Accelerometer Max")

-- AirSpeed/Mach Indicator
F_5E_3:defineRotary("IAS_SET", 28, 3001, 180, "AirSpeed Indicator", "Index Setting Pointer Knob")
F_5E_3:defineFloat("AIRSPEED", 8, { 0, 1 }, "Gauges", "Airspeed")
F_5E_3:defineFloat("AIRSPEED_MAX", 178, { 0, 1 }, "Gauges", "Max Airspeed")
F_5E_3:defineFloat("AIRSPEED_SET", 177, { 0, 1 }, "Gauges", "Set Airspeed")
F_5E_3:defineFloat("MACH", 179, { 1.0, 0.4 }, "Gauges", "MachIndicator")

-- Altimeter AAU-34/A
F_5E_3:defineToggleSwitch("ALT_ELECT", 31, 3002, 60, "Altimeter", "Altimeter Mode Control Lever, ELECT(rical)/PNEU(matic)")
F_5E_3:defineRotary("ALT_ZERO", 31, 3003, 62, "Altimeter", "Altimeter Zero Setting Knob")
F_5E_3:defineFloat("ALT_100_P", 10, { 0, 1 }, "Gauges", "Altimeter 100ft Pointer")
F_5E_3:defineFloat("ALT_10000_C", 11, { 0, 1 }, "Gauges", "Altimeter 10000ft Count")
F_5E_3:defineFloat("ALT_1000_C", 520, { 0, 1 }, "Gauges", "Altimeter 1000ft Count")
F_5E_3:defineFloat("ALT_100_C", 521, { 0, 1 }, "Gauges", "Altimeter 100ft Count")
F_5E_3:defineFloat("PRESS_0", 59, { 0, 1 }, "Gauges", "Pressure Setting 0")
F_5E_3:defineFloat("PRESS_1", 58, { 0, 1 }, "Gauges", "Pressure Setting 1")
F_5E_3:defineFloat("PRESS_2", 57, { 0, 1 }, "Gauges", "Pressure Setting 2")
F_5E_3:defineFloat("PRESS_3", 56, { 0, 1 }, "Gauges", "Pressure Setting 3")
F_5E_3:defineFloat("ALT_PNEU_FLAG", 9, { 0, 1 }, "Gauges", "Altimeter PNEU Flag")

-- Attitude Indicator ARU-20/A
F_5E_3:definePotentiometer("AI_PITCH_TRIM", 32, 3001, 150, { 0, 1 }, "Attitude Indicator", "Attitude Indicator Pitch Trim Knob")
F_5E_3:defineFloat("AI_PITCH", 81, { -0.5, 0.5 }, "Gauges", "Attitude Indicator Pitch")
F_5E_3:defineFloat("AI_BANK", 30, { -1, 1 }, "Gauges", "Attitude Indicator Bank")
F_5E_3:defineFloat("AI_OFF_FLAG", 149, { 0, 1 }, "Gauges", "Attitude Indicator OFF Flag")

-- Horizontal Situation Indicator
F_5E_3:defineVariableStepTumb("HSI_HDG_KNOB", 33, 3001, 271, 1.0, "HSI", "HSI Heading Set Knob")
F_5E_3:defineVariableStepTumb("HSI_CRS_KNOB", 33, 3002, 272, 1.0, "HSI", "HSI Course Set Knob")
F_5E_3:defineFloat("HSI_CRS", 35, { 0, 1 }, "Gauges", "HSI Course Arrow")
F_5E_3:defineFloat("HSI_HDG", 144, { 0, 1 }, "Gauges", "HSI Heading Mark")
F_5E_3:defineFloat("HSI_COMP", 32, { 0, 1 }, "Gauges", "HSI Compass Card")
F_5E_3:defineFloat("HSI_BER_POINT", 139, { 0, 1 }, "Gauges", "HSI Bearing Pointer")
F_5E_3:defineFloat("HSI_CRS_DEV", 36, { 0, 1 }, "Gauges", "HSI Course Dev Indicator")
F_5E_3:defineFloat("HSI_RANGE_100", 268, { 0, 1 }, "Gauges", "HSI Range 100")
F_5E_3:defineFloat("HSI_RANGE_10", 269, { 0, 1 }, "Gauges", "HSI Range 10")
F_5E_3:defineFloat("HSI_RANGE_1", 270, { 0, 1 }, "Gauges", "HSI Range 1")
F_5E_3:defineIndicatorLight("HSI_RANGE_FLAG", 142, "Warning, Caution and IndicatorLights", "HSI Range Flag")
F_5E_3:defineFloat("HSI_CRS_10010", 276, { 0, 1 }, "Gauges", "HSI CourseSel 100 10")
F_5E_3:defineFloat("HSI_CRS_1", 277, { 0, 1 }, "Gauges", "HSI CourseSel 1")
F_5E_3:defineFloat("HSI_TO_FROM", 146, { -1, 1 }, "Gauges", "HSI To From")
F_5E_3:defineFloat("HSI_OFF", 143, { 0, 1 }, "Gauges", "HSI OFF Flag")
F_5E_3:defineFloat("HSI_DEV", 141, { 0, 1 }, "Gauges", "HSI DevDF Window")

-- Standby Attitude Indicator
F_5E_3:definePushButton("SAI_CAGE", 34, 3001, 441, "Standby Attitude Indicator", "Cage SAI")
F_5E_3:defineRotary("SAI_PITCH_TRIM", 34, 3002, 442, "Standby Attitude Indicator", "SAI Pitch Trim")

-- Clock
F_5E_3:definePushButton("CLOCK_WIND", 35, 3001, 510, "Clock", "ABU-11 CLOCK Winding Knob")
F_5E_3:defineRotary("CLOCK_WIND_ROTATRY", 35, 3002, 510, "Clock", "ABU-11 CLOCK Winding Rotary")
F_5E_3:definePushButton("CLOCK_SET", 35, 3001, 511, "Clock", "ABU-11 CLOCK Setting Knob")
F_5E_3:definePushButton("ELAP_TIME", 35, 3003, 512, "Clock", "ABU-11 CLOCK Elapsed Time Knob")
F_5E_3:defineFloat("CLOCK_CURR_H", 19, { 0, 1 }, "Gauges", "CLOCK Currtime Hours")
F_5E_3:defineFloat("CLOCK_CURR_M", 18, { 0, 1 }, "Gauges", "CLOCK Currtime Minutes")
F_5E_3:defineFloat("CLOCK_ELAP_M", 509, { 0, 1 }, "Gauges", "CLOCK Elapsed Time Minutes")
F_5E_3:defineFloat("CLOCK_ELAP_S", 37, { 0, 1 }, "Gauges", "CLOCK Elapsed Time Seconds")

--UHF Radio AN/ARC-164
F_5E_3:definePushButton("UHF_TONE_BT", 23, 3009, 310, "UHF Radio", "UHF Radio Tone Button")
F_5E_3:defineToggleSwitch("UHF_SQUELCH_SW", 23, 3010, 308, "UHF Radio", "UHF Radio Squelch Switch, ON/OFF")
F_5E_3:defineTumb("UHF_FUNC", 23, 3008, 311, 0.1, { 0, 0.3 }, nil, false, "UHF Radio", "UHF Radio Function Selector Switch, OFF/MAIN/BOTH/ADF")
F_5E_3:defineTumb("UHF_FREQ", 23, 3007, 307, 0.1, { 0, 0.2 }, nil, false, "UHF Radio", "UHF Radio Frequency Mode Selector Switch, MANUAL/PRESET/GUARD")
F_5E_3:defineTumb("UHF_PRESET_SEL", 23, 3001, 300, 0.05, { 0, 1 }, { " 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20" }, false, "UHF Radio", "UHF Radio Preset Channel Selector Knob")
F_5E_3:defineTumb("UHF_100MHZ_SEL", 23, 3002, 327, 0.1, { 0, 0.3 }, { "A", "3", "2", "T" }, false, "UHF Radio", "UHF Radio 100 MHz Frequency Selector Knob")
F_5E_3:defineTumb("UHF_10MHZ_SEL", 23, 3003, 328, 0.1, { 0, 1 }, { "0", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0" }, false, "UHF Radio", "UHF Radio 10 MHz Frequency Selector Knob")
F_5E_3:defineTumb("UHF_1MHZ_SEL", 23, 3004, 329, 0.1, { 0, 1 }, { "0", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0" }, false, "UHF Radio", "UHF Radio 1 MHz Frequency Selector Knob")
F_5E_3:defineTumb("UHF_01MHZ_SEL", 23, 3005, 330, 0.1, { 0, 1 }, { "0", "9", "8", "7", "6", "5", "4", "3", "2", "1", "0" }, false, "UHF Radio", "UHF Radio 0.1 MHz Frequency Selector Knob")
F_5E_3:defineTumb("UHF_0025MHZ_SEL", 23, 3006, 331, 0.25, { 0, 1 }, { "00", "75", "50", "25", "00" }, false, "UHF Radio", "UHF Radio 0.025 MHz Frequency Selector Knob")
F_5E_3:definePotentiometer("UHF_VOL", 23, 3011, 309, { 0, 1 }, "UHF Radio", "UHF Radio Volume Knob")
F_5E_3:defineMultipositionSwitch("UHF_ANT", 23, 3016, 336, 3, 0.5, "UHF Radio", "UHF Radio Antenna Selector Switch, UPPER/AUTO/LOWER")
F_5E_3:definePushButton("UHF_MIC_BT", 24, 3001, 135, "UHF Radio", "UHF Radio Microphone Button")
F_5E_3:defineToggleSwitch("UHF_DOOR", 23, 3022, 335, "UHF Radio", "Hinged Access Door, OPEN/CLOSE")
F_5E_3:definePushButton("UHF_PRE_SET", 23, 3024, 314, "UHF Radio", "UHF Preset Channel Set Button")
F_5E_3:defineFloat("UHF_PRESET_CHAN", 326, { 0, 1 }, "Gauges", "UHF Preset Radio Channel")
F_5E_3:defineFloat("UHF_100", 302, { 0, 1 }, "Gauges", "UHF Radio 100MHz")
F_5E_3:defineFloat("UHF_10", 303, { 0, 1 }, "Gauges", "UHF Radio 10MHz")
F_5E_3:defineFloat("UHF_1", 304, { 0, 1 }, "Gauges", "UHF Radio 1MHz")
F_5E_3:defineFloat("UHF_01", 305, { 0, 1 }, "Gauges", "UHF Radio 0.1MHz")
F_5E_3:defineFloat("UHF_0025", 306, { 0, 1 }, "Gauges", "UHF Radio 0.025MHz")

--TACAN
F_5E_3:defineIndicatorLight("TACAN_TEST", 260, "TACAN Panel", "TACAN Test Indicator Light (green)")
F_5E_3:defineFixedStepTumb("TACAN_10", 41, 3001, 256, 0.1, { 0, 1 }, { -0.1, 0.1 }, nil, "TACAN Panel", "Left Channel Selector")
F_5E_3:defineFixedStepTumb("TACAN_1", 41, 3002, 257, 0.1, { 0, 1 }, { -0.1, 0.1 }, nil, "TACAN Panel", "Right Channel Selector")
F_5E_3:defineToggleSwitch("TACAN_XY", 41, 3003, 266, "TACAN Panel", "TACAN Channel X/Y Toggle")
F_5E_3:defineMultipositionSwitch("TACAN_MODE", 41, 3006, 262, 4, 0.1, "TACAN Panel", "TACAN Mode Dial")
F_5E_3:definePotentiometer("TACAN_VOL", 41, 3005, 261, { 0, 1 }, "TACAN Panel", "TACAN Signal Volume")
F_5E_3:definePushButton("TACAN_HSI", 41, 3004, 259, "TACAN Panel", "TACAN Signal on HSI Test Button")

local function getTacanChannel(dev0)
	local tcn_2 = dev0:get_argument_value(263) == 0 and "0" or "1"
	local tcn_1 = string.format("%.1f", dev0:get_argument_value(264)):sub(3)
	local tcn_0 = string.format("%.1f", dev0:get_argument_value(265)):sub(3)
	local tcn_xy = dev0:get_argument_value(266) == 0 and "X" or "Y"

	return tcn_2 .. tcn_1 .. tcn_0 .. tcn_xy
end

F_5E_3:defineString("TACAN_CHANNEL", getTacanChannel, 4, "TACAN Panel", "TACAN Channel")

--Externals
F_5E_3:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_RIGHT", 183, "External Aircraft Model", "Right Speed Brake")

F_5E_3:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_LEFT", 185, "External Aircraft Model", "Left Speed Brake")

F_5E_3:defineBitFromDrawArgument("EXT_POSITION_LIGHTS", 191, "External Aircraft Model", "Position Lights")

F_5E_3:defineBitFromDrawArgument("EXT_STROBE_LIGHTS", 192, "External Aircraft Model", "Strobe Lights")

F_5E_3:defineBitFromDrawArgument("EXT_BRAKE_CUTE", 35, "External Aircraft Model", "Brake Cute")

F_5E_3:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
F_5E_3:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
F_5E_3:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

F_5E_3:defineFloat("SBY_COMPASS_HDG", 610, { -1, 1 }, "Gauges", "Standby Compass Heading")
F_5E_3:defineFloat("SBY_COMPASS_PITCH", 611, { -1, 1 }, "Gauges", "Standby Compass Pitch")
F_5E_3:defineFloat("SBY_COMPASS_BANK", 612, { -1, 1 }, "Gauges", "Standby Compass Bank")

return F_5E_3
