BIOS.protocol.beginModule("F-5E-3", 0x7600)
BIOS.protocol.setExportModuleAircrafts({"F-5E-3"})
--by WarLord

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3PosTumb = BIOS.util.define3PosTumb


local function getTacanChannel()
    local tcn_2 = ""
    if GetDevice(0):get_argument_value(263) == 0 then
        tcn_2 = "0"
    else
    	tcn_2 = "1"    
    end
    local tcn_1 = string.format("%.1f", GetDevice(0):get_argument_value(264)):sub(3)
    local tcn_0 = string.format("%.1f", GetDevice(0):get_argument_value(265)):sub(3)

	local tcn_xy = ""
	if GetDevice(0):get_argument_value(266) == 0 then
		tcn_xy = "X"	
		else
		tcn_xy = "Y"
	end

    return tcn_2 .. tcn_1 .. tcn_0 .. tcn_xy
end

--Remove Pilot Arg# 775

-- Indicator Lights
defineIndicatorLight("L_GEN", 530, "Warning, Caution and IndicatorLights","L Generator Lamp (yellow)")
defineIndicatorLight("CANOPY", 531, "Warning, Caution and IndicatorLights","Canopy Open (yellow)")
defineIndicatorLight("R_GEN", 532, "Warning, Caution and IndicatorLights","R Generator Lamp (yellow)")
defineIndicatorLight("UTIL_HYDRAULIC", 533, "Warning, Caution and IndicatorLights","Utility Hydr (yellow)")
defineIndicatorLight("SPARE_1", 534, "Warning, Caution and IndicatorLights","Spare 1 (yellow)")
defineIndicatorLight("FLIGHT_HYDRAULIC", 535, "Warning, Caution and IndicatorLights","Flight Hydr (yellow)")
defineIndicatorLight("EXT_TANKS", 536, "Warning, Caution and IndicatorLights","External Tanks Empty (yellow)")
defineIndicatorLight("IFF", 537, "Warning, Caution and IndicatorLights","IFF (yellow)")
defineIndicatorLight("OXYGEN", 538, "Warning, Caution and IndicatorLights","Oxygen (yellow)")
defineIndicatorLight("LEFT_FUEL_LOW", 539, "Warning, Caution and IndicatorLights","Left Flow Indicator (yellow)")
defineIndicatorLight("ENGINE_ANTI_ICE", 540, "Warning, Caution and IndicatorLights","Anti Ice (yellow)")
defineIndicatorLight("RIGHT_FUEL_LOW", 541, "Warning, Caution and IndicatorLights","Right Flow Indicator (yellow)")
defineIndicatorLight("L_FUEL_PRESS", 542, "Warning, Caution and IndicatorLights","L Fuel Press (yellow)")
defineIndicatorLight("INS", 543, "Warning, Caution and IndicatorLights","Inertial Navigation System (yellow)")
defineIndicatorLight("R_FUEL_PRESS", 544, "Warning, Caution and IndicatorLights","R Fuel Press (yellow)")
defineIndicatorLight("AOA_FLAPS", 545, "Warning, Caution and IndicatorLights","AoA Flaps (yellow)")
defineIndicatorLight("AIR_DATA_COMPUTER", 546, "Warning, Caution and IndicatorLights","Air Data Computer (yellow)")
defineIndicatorLight("DIR_GYRO", 547, "Warning, Caution and IndicatorLights","Directional Gyroscope (yellow)")
defineIndicatorLight("SPARE_2", 548, "Warning, Caution and IndicatorLights","Spare 2 (yellow)")
defineIndicatorLight("DC_OVERLOAD", 549, "Warning, Caution and IndicatorLights","DC Overload (yellow)")
defineIndicatorLight("SPARE_3", 550, "Warning, Caution and IndicatorLights","Spare 3 (yellow)")
defineIndicatorLight("MC_LIGHT", 169, "Warning, Caution and IndicatorLights","MasterCaution Lamp (yellow)")
defineIndicatorLight("L_FIRE", 167, "Warning, Caution and IndicatorLights","Left Fire Lamp (red)")
defineIndicatorLight("R_FIRE", 168, "Warning, Caution and IndicatorLights","Right Fire Lamp (red)")
defineIndicatorLight("AOA_R", 48, "Warning, Caution and IndicatorLights","AOA (red)")
defineIndicatorLight("AOA_G", 49, "Warning, Caution and IndicatorLights","AOA (green)")
defineIndicatorLight("AOA_Y", 50, "Warning, Caution and IndicatorLights","AOA (yellow)")

-- Control System
defineToggleSwitch("YAW_DAMPER", 2, 3001, 323,"Control Interface" , "Yaw Damper Switch, YAW/OFF")
defineToggleSwitch("PITCH_DAMPER", 2, 3002, 322,"Control Interface" , "Pitch Damper Switch, PITCH/OFF")
definePotentiometer("RUDDER_TRIM", 2, 3003, 324, {-1, 1}, "Control Interface", "Rudder Trim Knob")
definePushButton("PITCH_DAMPER_CUT", 2, 3004, 132, "Control Interface" , "Pitch Damper Cutoff Switch")
define3PosTumb("FLAPS", 2, 3005, 116, "Control Interface", "Flaps Lever, EMER UP/THUMB SW/FULL")
define3PosTumb("A_FLAPS", 2, 3006, 115, "Control Interface", "Auto Flap System Thumb Switch, UP/FIXED/AUTO")
define3PosTumb("SPEED", 2, 3007, 101, "Control Interface", "Speed Brake Switch, OUT/OFF/IN")
defineToggleSwitch("RUDDER_T", 2, 3014, 278, "Control Interface" , "Rudder Pedal Adjust T-Handle, PULL/STOW")
defineFloat("TRIM_INDICATOR", 52, {1.0, 0.0, -0.1}, "Gauges", "Trim Position")
defineFloat("FLAP_INDICATOR", 51, {0.0, 0.4}, "Gauges", "Flap Indicator")
defineFloat("SLIPBALL", 3, {-1.0, 1.0}, "Gauges", "Slipball")

-- Electric system
defineToggleSwitch("SW_BATTERY", 3, 3001, 387,"Electric" , "Battery Switch")
defineToggleSwitch("L_GENERATOR", 3, 3002, 388,"Electric" , "Generator Left")
defineToggleSwitch("R_GENERATOR", 3, 3004, 389,"Electric" , "Generator Right")
defineToggleSwitch("PITOT_HEATER", 3, 3006, 375,"Electric" , "Pitot Heater")
define3PosTumb("F_O2_SW", 3, 3007, 230, "Electric", "Fuel & Oxygen Switch, GAGE TEST/OFF/QTY CHECK")

-- Fuel System
defineToggleSwitch("L_SHUTOFF_S", 4, 3001, 360,"Fuel" , "Left Fuel Shutoff Switch, OPEN/CLOSED")
defineToggleSwitch("R_SHUTOFF_S", 4, 3002, 362,"Fuel" , "Right Fuel Shutoff Switch, OPEN/CLOSED")
defineToggleSwitch("EXT_PYLON_SW", 4, 3003, 378,"Fuel" , "Ext Fuel Pylons Switch, ON/OFF")
defineToggleSwitch("EXT_CENTER_SW", 4, 3004, 377,"Fuel" , "Ext Fuel Cl Switch, ON/OFF")
defineToggleSwitch("CROSSFEED", 4, 3005, 381,"Fuel" , "Crossfeed Switch, OPEN/CLOSED")
define3PosTumb("AUTOBAL", 4, 3006, 383, "Fuel", "Autobalance Switch, LEFT/NEUT/RIGHT")
defineToggleSwitch("L_BOOSTPUMP", 4, 3008, 380,"Fuel" , "Left Boost Pump Switch, ON/OFF")
defineToggleSwitch("R_BOOSTPUMP", 4, 3009, 382,"Fuel" , "Right Boost Pump Switch, ON/OFF")
defineToggleSwitch("L_SHUTOFF_C", 4, 3010, 359,"Fuel" , "Left Fuel Shutoff Switch Cover, OPEN/CLOSED")
defineToggleSwitch("R_SHUTOFF_C", 4, 3011, 361,"Fuel" , "Right Fuel Shutoff Switch Cover, OPEN/CLOSED")
defineFloat("FUELQUANTITY_L", 22, {0.0, 1.0}, "Gauges", "Fuel Quantity Left")
defineFloat("FUELQUANTITY_R", 23, {0.0, 1.0}, "Gauges", "Fuel Quantity Right")
defineFloat("FUELFLOW_R", 526, {0.0,   0.67,   0.75,    0.83,     1.0}, "Gauges", "Fuel Flow Right")
defineFloat("FUELFLOW_L", 525, {0.0,   0.67,   0.75,    0.83,     1.0}, "Gauges", "Fuel Flow Left")

-- Engines
definePushButton("L_START", 6, 3001, 357,"Engine Interface" , "Left Engine Start Button")
definePushButton("R_START", 6, 3002, 358,"Engine Interface" , "Right Engine Start Button")
defineToggleSwitch("INLET_HEATER", 6, 3003, 376,"Engine Interface" , "Engine Anti-Ice Switch, ENGINE/OFF")
defineFloat("NOZZLEPOS_L", 107, {0.0, 1.0}, "Gauges", "Nozzle Position Left")
defineFloat("NOZZLEPOS_R", 108, {0.0, 1.0}, "Gauges", "Nozzle Position Right")
defineFloat("AUXINT_DOOR", 111, {0.0, 0.2}, "Gauges", "Aux Intake Doors")
defineFloat("OILPRESS_L", 112, {0.0, 1.0}, "Gauges", "Oil Pressure Left")
defineFloat("OILPRESS_R", 113, {0.0, 1.0}, "Gauges", "Oil Pressure Right")
defineFloat("EXHAUST_TEMP_L", 12, {0.0,  0.03,  0.1, 0.274,  0.78,    1.0}, "Gauges", "Exhaust Gas Temp Left")
defineFloat("EXHAUST_TEMP_R", 14, {0.0,  0.03,  0.1, 0.274,  0.78,    1.0}, "Gauges", "Exhaust Gas Temp Right")
defineFloat("TACHO_L", 16, {0.008, 0.475, 0.84,  0.94,   1.0}, "Gauges", "Tachometer Left")
defineFloat("TACHO_PERC_L", 425, {0.0, 1.0}, "Gauges", "Tachometer Percent Left")
defineFloat("TACHO_R", 17, {0.008, 0.475, 0.84,  0.94,   1.0}, "Gauges", "Tachometer Right")
defineFloat("TACHO_PERC_R", 426, {0.0, 1.0}, "Gauges", "Tachometer Percent Right")
defineFloat("UTIL_PRESS", 109, {0.0, 1.0}, "Gauges", "Utility Pressure")
defineFloat("FLIGHT_PRESS", 110, {0.0, 1.0}, "Gauges", "Flight Pressure")

-- Gear System
defineIndicatorLight("GW_LIGHT", 96, "Gear Interface","Gear Warning Lamp (red)")
defineIndicatorLight("NOSE_LIGHT", 54, "Gear Interface","Gear Nose Lamp (green)")
defineIndicatorLight("LEFT_LIGHT", 53, "Gear Interface","Gear Left Lamp (green)")
defineIndicatorLight("RIGHT_LIGHT", 55, "Gear Interface","Gear Right Lamp (green)")
defineIndicatorLight("HOOK_LIGHT", 90, "Gear Interface","Hook Warning Lamp (red)")
defineToggleSwitch("LG_LEVER_SWITCH", 7, 3001, 83,"Gear Interface" , "Gear Lever")
definePushButton("LG_ALT_REL", 7, 3002, 95,"Gear Interface" , "Landing Gear Alternate Release Handle, Pull and Hold")
definePushButton("LG_DOWN_L", 7, 3003, 88,"Gear Interface" , "Landing Gear Downlock Override Button - Push and Hold")
definePushButton("NWS", 7, 3004, 131,"Gear Interface" , "Nosewheel Steering Button - Pull and Hold")
defineToggleSwitch("LG_ALT_RES", 7, 3005, 98,"Gear Interface" , "Landing Gear Alternate Release Reset Control, OFF/RESET")
defineToggleSwitch("NS_STRUCT", 7, 3006, 250,"Gear Interface" , "Nose Strut Switch, EXTEND/RETRACT")
definePushButton("LGF_SILENCE", 7, 3007, 87,"Gear Interface" , "Landing Gear And Flap Warning Silence Button")
definePushButton("LG_TEST", 7, 3008, 92,"Gear Interface" , "Left Landing Gear Test Lamp")
definePushButton("NG_TEST", 7, 3009, 93,"Gear Interface" , "Nose Landing Gear Test Lamp")
definePushButton("RG_TEST", 7, 3010, 94,"Gear Interface" , "Right Landing Gear Test Lamp")
definePushButton("HOOK", 7, 3014, 89,"Gear Interface" , "Arresting Hook Button")

-- Oxygen System
defineToggleSwitch("O2_LEVER", 8, 3001, 603,"O2 Interface" , "Oxygen Supply Lever, ON/OFF")
defineToggleSwitch("DILUTER_LEVER", 8, 3002, 602,"O2 Interface" , "Diluter Lever")
define3PosTumb("EMER_L", 8, 3003, 601, "O2 Interface", "Emergency Lever, EMERGENCY/NORMAL/TEST MASK")
defineFloat("O2QUANTITY", 390, {0.0, 1.0}, "Gauges", "O2 Quantity")
defineFloat("O2FLOWINDICATOR", 600, {0.0, 1.0}, "Gauges", "O2 Flow Blinker")
defineFloat("O2FLOWPRESSURE", 604, {0.0, 0.5, 1.0}, "Gauges", "O2 FlowPressure")

-- EC System
define3PosTumb("CABIN_P_SW", 9, 3001, 371, "EC Interface", "Cabin Press Switch, DEFOG ONLY/NORMAL/RAM DUMP")
defineToggleSwitch("CABIN_P_C", 9, 3002, 370,"EC Interface" , "Cabin Press Switch Cover, OPEN/CLOSED")
defineMultipositionSwitch("CABIN_TEMP_SW", 9, 3003, 372, 3, 0.1,"EC Interface" ,"Cabin Temp Switch, AUTO/CENTER/MAN COLD/MAN HOT")
definePotentiometer("CABIN_TEMP", 9, 3004, 373, {-1, 1},"EC Interface" , "Cabin Temperature Knob")
definePotentiometer("CABIN_DEFOG", 9, 3005, 374, {0, 1},"EC Interface" , "Canopy Defog Knob")

-- Cockpit Mechanics
defineToggleSwitch("CANOPY_LEVER", 10, 3001, 712,"Cockpit" , "Canopy Handle, OPEN/CLOSE")
define3PosTumb("DRAG_CHUTE", 10, 3002, 91,"Cockpit" , "Chute Handle")
defineToggleSwitch("CANOPY_JETTISON", 10, 3005, 384,"Cockpit" , "Canopy Jettison T-Handle, PULL/PUSH")
defineFloat("CABIN_PRESS", 114, {0.0, 1.0}, "Gauges", "Cabin Pressure")

--Mirrors

-- External Lights
definePotentiometer("NAV_LIGHTS", 11, 3001, 227, {0, 1},"External Lights" , "Nav Lights Knob")
definePotentiometer("FORMATION_LIGHTS", 11, 3002, 228, {0, 1},"External Lights" , "Formation Lights Knob")
defineToggleSwitch("BEACON", 11, 3003, 229,"External Lights" , "Beacon Light Switch")
defineToggleSwitch("LG_LIGHT", 11, 3004, 353,"External Lights" , "Landing & Taxi Light Switch, ON/OFF")

-- Internal Lights
defineToggleSwitch("PANEL_L_SW", 12, 3001, 46,"Internal Lights" , "AN/ASG-31 Sight Panel Light Button, ON/OFF")
defineToggleSwitch("COMPAS_L_SW", 12, 3002, 613,"Internal Lights" , "Magnetic Compass Light Switch, LIGHT/OFF")
definePotentiometer("FLOOD_LIGHTS", 12, 3003, 221, {0, 1},"Internal Lights" , "Flood Lights Knob")
definePotentiometer("FLIGHT_LIGHTS", 12, 3004, 222, {0, 1},"Internal Lights" , "Flight Instruments Lights Knob")
definePotentiometer("ENGINE_LIGHTS", 12, 3005, 223, {0, 1},"Internal Lights" , "Engine Instruments Lights Knob")
definePotentiometer("CONSOLE_LIGHTS", 12, 3006, 224, {0, 1},"Internal Lights" , "Console Lights Knob")
definePotentiometer("ARM_LIGHTS", 12, 3007, 363, {0, 1},"Internal Lights" , "Armament Panel Lights Knob")
definePushButton("WARN_T_SW", 12, 3008, 226,"Internal Lights" , "Warning Test Switch")
define3PosTumb("BRI_DIM_SW", 12, 3009, 225,"Internal Lights" , "Bright/Dim Switch, BRT/NEUT/DIM")
definePushButton("MC_RESET_BTN", 12, 3011, 172,"Internal Lights" , "Master Caution Button")

-- Countermeasures Dispensing System
defineTumb("CHAFF_MODE", 13, 3001, 400, 0.1, {0.0, 0.3}, nil, false, "CMDS", "Chaff Mode Selector, OFF/SINGLE/PRGM/MULT")
defineTumb("FLARE_MODE_SEL", 13, 3002, 404, 0.1, {0.0, 0.2}, nil, false, "CMDS", "Flare Mode Selector, OFF/SINGLE/PRGM")
defineToggleSwitch("FL_JETT_COVER", 13, 3003, 408,"CMDS" , "Flare Jettison Switch Cover, OPEN/CLOSED")
defineToggleSwitch("FL_JETT_SW", 13, 3004, 409,"CMDS" , "Flare Jettison Switch, OFF/UP")
definePushButton("CHAFF_COUNT", 13, 3005, 403,"CMDS" , "Chaff Counter Reset Button - Push to reset")
definePushButton("FL_COUNT", 13, 3006, 407,"CMDS" , "Flare Counter Reset Button - Push to reset")
definePushButton("FL_CHAFF_BT", 13, 3007, 117,"CMDS" , "Flare-Chaff Button - Push to dispense")
defineFloat("CHAFF_COUNT_10", 401, {0.0, 1.0}, "Gauges", "Chaff Drum Counter 10")
defineFloat("CHAFF_COUNT_1", 402, {0.0, 1.0}, "Gauges", "Chaff Drum Counter 1")
defineFloat("FL_COUNT_10", 405, {0.0, 1.0}, "Gauges", "Flare Drum Counter 10")
defineFloat("FL_COUNT_1", 406, {0.0, 1.0}, "Gauges", "Flare Drum Counter 1")

local function getFlareCount()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(405)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(406)*10)
    return tonumber(digit1 .. digit2)
end
defineIntegerFromGetter("CM_FLARECNT_DISPLAY", getFlareCount, 60, "CMDS", "Flare Counter Display")

local function getChaffCount()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(401)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(402)*10)
    return tonumber(digit1 .. digit2)
end
defineIntegerFromGetter("CM_CHAFFCNT_DISPLAY", getChaffCount, 60, "CMDS", "Chaff Counter Display")

-- Jettison System
defineToggleSwitch("EMER_JETT_COVER", 14, 3001, 364,"Jettison" , "Emergency All Jettison Button Cover, OPEN")
definePushButton("EMER_JETT_B", 14, 3002, 365,"Jettison" , "Emergency All Jettison Button - Push to jettison")
define3PosTumb("JETT_SW", 14, 3003, 367, "Jettison", "Select Jettison Switch, SELECT POSITION/OFF/ALL PYLONS")
definePushButton("JETT_B", 14, 3004, 366,"Jettison" , "Select Jettison Button - Push to jettison")

-- Weapons Control
defineToggleSwitch("ARMPOS1", 15, 3001, 346,"Weapons Control" , "Armament Position Selector - L WINGTIP, ON/OFF")
defineToggleSwitch("ARMPOS2", 15, 3002, 347,"Weapons Control" , "Armament Position Selector - L OUTBD, ON/OFF")
defineToggleSwitch("ARMPOS3", 15, 3003, 348,"Weapons Control" , "Armament Position Selector - L INBD, ON/OFF")
defineToggleSwitch("ARMPOS4", 15, 3004, 349,"Weapons Control" , "Armament Position Selector - CENTER, ON/OFF")
defineToggleSwitch("ARMPOS5", 15, 3005, 350,"Weapons Control" , "Armament Position Selector - R INBD, ON/OFF")
defineToggleSwitch("ARMPOS6", 15, 3006, 351,"Weapons Control" , "Armament Position Selector - R OUTBD, ON/OFF")
defineToggleSwitch("ARMPOS7", 15, 3007, 352,"Weapons Control" , "Armament Position Selector - R WINGTIP, ON/OFF")
define3PosTumb("INT_SW", 15, 3008, 340, "Weapons Control", "Interval Switch [sec], .06/.10/.14")
defineTumb("BOMBS_ARM_SW", 15, 3009, 341, 0.2, {0.2, 0.8}, nil, false,"Weapons Control" ,"Bombs Arm Switch, SAFE/TAIL/NOSE & TAIL/NOSE")
defineToggleSwitch("MASTER_ARM_GUARD", 15, 3010, 342,"Weapons Control" , "Master Arm Safe Guard")
define3PosTumb("MASTER_ARM", 15, 3011, 343,"Weapons Control" , "Master Arm Guns, GUNS MSL & CAMR/OFF/CAMR ONLY")
defineTumb("EXT_STORE", 15, 3012, 344, 0.1, {0.0, 0.3}, nil, false, "Weapons Control", "External Stores Selector RIPL/BOMB/SAFE/RKT DISP")
definePushButton("MISSILE_UNCAGE", 15, 3014, 136,"Weapons Control" , "Missile Uncage Switch - Press and hold to uncage missile seeker head")
definePotentiometer("MISSILE_VOL", 15, 3015, 345, {0, 1}, "Weapons Control", "Missile Volume Knob")
definePushButton("WEAPON_RELEASE", 15, 3018, 128,"Weapons Control" , "Weapon Release Button")

-- AHRS
definePushButton("AHRS_ERECT", 16, 3001, 166,"AHRS" , "Fast Erect Button - Push to erect")
define3PosTumb("AHRS_FAST_SLAVE", 16, 3003, 220, "AHRS", "Compass Switch, DIR GYRO/MAG/FAST SLAVE")
defineTumb("AHRS_NAV_MODE", 16, 3004, 273, 0.1, {0.0, 0.1}, nil, false, "AHRS", "Nav Mode Selector Switch, DF/TACAN")

-- AN/APQ-159 Radar Control Panel
definePotentiometer("RADAR_ELEVATION", 17, 3001, 321, {-1, 1}, "Radar", "AN/APQ-159 Radar Elevation Antenna Tilt Control Knob")
defineTumb("RADAR_RANGE", 17, 3004, 315, 0.1, {0.0, 0.3}, nil, false, "Radar", "AN/APQ-159 Radar Range Selector Switch [nm], 5/10/20/40")
defineTumb("RADAR_MODE", 17, 3005, 316, 0.1, {0.0, 0.3}, nil, false, "Radar", "AN/APQ-159 Radar Mode Selector Switch, OFF/STBY/OPER/TEST")
definePushButton("RADAR_ACQUIS", 17, 3006, 317, "Radar" , "AN/APQ-159 Radar Acquisition Button")
definePotentiometer("RADAR_SCALE", 17, 3007, 65, {0, 1}, "Radar", "AN/APQ-159 Radar Scale Knob")
definePotentiometer("RADAR_BRIGHT", 17, 3008, 70, {0, 1}, "Radar", "AN/APQ-159 Radar Bright Knob")
definePotentiometer("RADAR_PERSIS", 17, 3009, 69, {0, 1}, "Radar", "AN/APQ-159 Radar Persistence Knob")
definePotentiometer("RADAR_VIDEO", 17, 3010, 68, {0, 1}, "Radar", "AN/APQ-159 Radar Video Knob")
definePotentiometer("RADAR_CURSOR", 17, 3011, 67, {0, 1}, "Radar", "AN/APQ-159 Radar Cursor Knob")
definePotentiometer("RADAR_CURSOR", 17, 3012, 66, {-0.75,0.75}, "Radar", "AN/APQ-159 Radar Pitch Knob")
defineIndicatorLight("RADAR_SCALE_5", 155, "Warning, Caution and IndicatorLights","Radar Range Scale 5")
defineIndicatorLight("RADAR_SCALE_10", 156, "Warning, Caution and IndicatorLights","Radar Range Scale 10")
defineIndicatorLight("RADAR_SCALE_20", 157, "Warning, Caution and IndicatorLights","Radar Range Scale 20")
defineIndicatorLight("RADAR_SCALE_40", 158, "Warning, Caution and IndicatorLights","Radar Range Scale 40")
defineIndicatorLight("RADAR_INRANGE", 159, "Warning, Caution and IndicatorLights","Radar InRange Light")
defineIndicatorLight("RADAR_FAIL", 160, "Warning, Caution and IndicatorLights","Radar Fail Light")
defineIndicatorLight("RADAR_LOCKON", 161, "Warning, Caution and IndicatorLights","Radar LockOn Light")
defineIndicatorLight("RADAR_EXCESS", 162, "Warning, Caution and IndicatorLights","Radar ExcessG Light")
defineIndicatorLight("RADAR_SCALE_BRIGHT", 163, "Warning, Caution and IndicatorLights","Radar Scale Brightness")
defineFloat("TDC_RANGE", 319, {-1.0, 1.0}, "Gauges", "TdcControlRange")
defineFloat("TDC_AZIMUTH", 318, {-1.0, 1.0}, "Gauges", "TdcControlAzimuth")

-- AN/ASG-31 Sight
defineTumb("SIGHT_MODE", 18, 3001, 40, 0.1, {0.0, 0.4}, nil, false, "Sight", "AN/ASG-31 Sight Mode Selector, OFF/MSL/A/A1 GUNS/A/A2 GUNS/MAN")
defineRotary("SIGHT_DEPRESS", 18, 3002, 42, "Sight", "AN/ASG-31 Sight Reticle Depression Knob")
definePotentiometer("SIGHT_INTENS", 18, 3003, 41, {0, 1}, "Sight", "AN/ASG-31 Sight Reticle Intensity Knob")
define3PosTumb("SIGHT_BIT", 18, 3004, 47, "Sight", "AN/ASG-31 Sight BIT Switch, BIT 1/OFF/BIT 2")
definePushButton("SIGHT_CAGE", 18, 3007, 137, "Sight" , "AN/ASG-31 Sight Cage Switch")
defineFloat("SIGHT_DEP_100", 43, {0.0, 1.0}, "Gauges", "Ret Depression Drum 100")
defineFloat("SIGHT_DEP_10", 44, {0.0, 1.0}, "Gauges", "Ret Depression Drum 10")
defineFloat("SIGHT_DEP_1", 45, {0.0, 1.0}, "Gauges", "Ret Depression Drum 1")

-- RWR-IC
definePushButton("RWR_MODE", 19, 3001, 551,"RWR IC" , "RWR MODE Button")
definePushButton("RWR_SEARCH", 19, 3002, 554,"RWR IC" , "RWR SEARCH Button")
definePushButton("RWR_HAND", 19, 3003, 556,"RWR IC" , "RWR HANDOFF Button")
definePushButton("RWR_ALT", 19, 3004, 561,"RWR IC" , "RWR ALTITUDE Button")
definePushButton("RWR_T", 19, 3005, 564,"RWR IC" , "RWR T Button")
definePushButton("RWR_TEST", 19, 3006, 567,"RWR IC" , "RWR SYS TEST Button")
definePushButton("RWR_SHIP", 19, 3007, 570,"RWR IC" , "RWR UNKNOWN SHIP Button")
definePushButton("RWR_PWR", 19, 3008, 575,"RWR IC" , "RWR POWER Button")
definePushButton("RWR_LAUNCH", 19, 3009, 559,"RWR IC" , "RWR LAUNCH Button")
definePushButton("RWR_ACT", 19, 3010, 573,"RWR IC" , "RWR ACT/PWR Button")
definePotentiometer("RWR_DIM", 19, 3011, 578, {0, 1}, "RWR IC", "RWR DIM Knob")
definePotentiometer("RWR_VOL", 19, 3012, 577, {0, 1}, "RWR IC", "RWR AUDIO Knob")

-- AN/ALR-87 RWR
definePotentiometer("RWR_INT", 20, 3001, 140, {0, 1}, "AN ALR87", "RWR INT Knob")

-- Sight Camera
defineToggleSwitch("CAMERA_FPS", 21, 3001, 80,"Camera" , "Sight Camera FPS Select Switch, 24/48")
definePotentiometer("CAMERA_LENS", 21, 3002, 140, {0, 1}, "Camera", "Sight Camera Lens f-Stop Selector, 2.8(dull)..22(bright)")
defineTumb("CAMERA_OVERRUN", 21, 3003, 311, 0.1, {0.0, 0.3}, nil, false,"Camera" , "Sight Camera Overrun Selector, 0/3/10/20")
definePushButton("CAMERA_RUN", 21, 3004, 573,"Camera" , "Sight Camera Run (Test) Switch, ON/OFF")

-- IFF
defineIndicatorLight("IFF_REPLY_L", 216, "IFF","IFF Reply Lamp (green)")
defineIndicatorLight("IFF_TEST_L", 218, "IFF","IFF Test Lamp (green)")
defineTumb("IFF4_CODE_SEL", 22, 3001, 199, 0.1, {0.0, 0.3}, nil, false,"IFF" , "IFF MODE 4 CODE Selector, ZERO/B/A/HOLD")
defineTumb("IFF4_MASTER", 22, 3002, 200, 0.1, {0.0, 0.4}, nil, false,"IFF" , "IFF MASTER Control Selector, EMER/NORM/LOW/STBY/OFF")
define3PosTumb("IFF4_MON_CONTR", 22, 3003, 201, "IFF", "IFF MODE 4 Monitor Control Switch, AUDIO/OUT/LIGHT")
define3PosTumb("IFF4_M1", 22, 3004, 202, "IFF", "IFF Mode Select/TEST Switch, M-1 /ON/OUT")
define3PosTumb("IFF4_M2", 22, 3005, 203, "IFF", "IFF Mode Select/TEST Switch, M-2 /ON/OUT")
define3PosTumb("IFF4_M3", 22, 3006, 204, "IFF", "IFF Mode Select/TEST Switch, M-3/A /ON/OUT")
define3PosTumb("IFF4_MC", 22, 3007, 205, "IFF", "IFF Mode Select/TEST Switch, M-C /ON/OUT")
define3PosTumb("IFF4_RAD", 22, 3008, 206, "IFF", "IFF RAD TEST/MON Switch, RAD TEST/OUT/MON")
define3PosTumb("IFF4_IDENT", 22, 3009, 207, "IFF", "IFF Identification of Position (IP) Switch, IDENT/OUT/MIC")
defineToggleSwitch("IFF4_CONTROL", 22, 3010, 208,"IFF" , "IFF MODE 4 Control Switch, ON/OUT")
defineTumb("IFF4_MASTER", 22, 3011, 209, 0.1, {0.0, 1.0}, nil, false,"IFF" , "IFF MODE 1 Code Selector Wheel 1")
defineTumb("IFF4_MASTER", 22, 3012, 210, 0.1, {0.0, 1.0}, nil, false,"IFF" , "IFF MODE 1 Code Selector Wheel 2")
defineTumb("IFF4_MASTER", 22, 3013, 211, 0.1, {0.0, 1.0}, nil, false,"IFF" , "IFF MODE 3/A Code Selector Wheel 1")
defineTumb("IFF4_MASTER", 22, 3014, 212, 0.1, {0.0, 1.0}, nil, false,"IFF" , "IFF MODE 3/A Code Selector Wheel 2")
defineTumb("IFF4_MASTER", 22, 3015, 213, 0.1, {0.0, 1.0}, nil, false,"IFF" , "IFF MODE 3/A Code Selector Wheel 3")
defineTumb("IFF4_MASTER", 22, 3016, 214, 0.1, {0.0, 1.0}, nil, false,"IFF" , "IFF MODE 3/A Code Selector Wheel 4")
definePushButton("IFF4_REPLY_L", 22, 3017, 215,"IFF" , "MODE 4 REPLY Light - Press to test(LMB)")
definePushButton("IFF4_RAD_TEST_L", 22, 3018, 217,"IFF" , "Radiation TEST and Monitor Light - Press to test(LMB)")
defineToggleSwitch("IFF4_CODE_SEL_PULL", 22, 3019, 197,"IFF" , "IFF MODE 4 CODE Selector Pull")
defineToggleSwitch("IFF4_MASTER_PULL", 22, 3020, 198,"IFF" , "IFF MASTER Control Selector Pull")

-- Instruments --------------------------
defineFloat("AOA_GAUGE", 7, {0.0, 1.0}, "Gauges", "AOA Units")
defineFloat("MOTOR_RUN", 85, {1.0, 0.0}, "Gauges", "Motor Run Knob")
defineFloat("VARIOMETER", 24, {-1.0, -0.64, -0.5, -0.29, 0.0, 0.29, 0.5, 0.64, 1.0}, "Gauges", "Variometer")
defineFloat("SAI_PITCH", 438, {0.0, 1.0}, "Gauges", "SAI Pitch")
defineFloat("SAI_BANK", 439, {0.0, 1.0}, "Gauges", "SAI Bank")
defineFloat("SAI_OFF", 440, {0.0, 1.0}, "Gauges", "SAI OFF Flag")
defineFloat("SAI_ARROW", 443, {0.0, 1.0}, "Gauges", "SAI Knob Arrow")
defineFloat("CANOPY_POS", 181, {0, 1}, "Gauges", "Canopy Position")


-- Accelerometer
definePushButton("ACC", 27, 3001, 904,"Accelerometer" , "Accelerometer - Push to set")
defineFloat("ACCELEROMETER", 6, {0.0, 0.323, 0.653, 1.0}, "Gauges", "Accelerometer")
defineFloat("ACCELEROMETER_MIN", 902, {0.0, 0.323, 0.653, 1.0}, "Gauges", "Accelerometer Min")
defineFloat("ACCELEROMETER_MAX", 903, {0.0, 0.323, 0.653, 1.0}, "Gauges", "Accelerometer Max")

-- AirSpeed/Mach Indicator
defineRotary("IAS_SET", 28, 3001, 180, "AirSpeed Indicator", "Index Setting Pointer Knob")
defineFloat("AIRSPEED", 8, {0.0, 0.0435,   0.1, 0.318, 0.3745, 0.397, 0.4495, 0.482,  0.54, 0.553, 0.6145, 0.658, 0.668, 0.761, 0.801, 0.877, 0.909, 0.942, 0.972,   1.0}, "Gauges", "Airspeed")
defineFloat("AIRSPEED_MAX", 178, {0.0, 0.0435,   0.1, 0.318, 0.3745, 0.397, 0.4495, 0.482,  0.54, 0.553, 0.6145, 0.658, 0.668, 0.761, 0.801, 0.877, 0.909, 0.942, 0.972,   1.0}, "Gauges", "Max Airspeed")
defineFloat("AIRSPEED_SET", 177, {0.0, 1.0}, "Gauges", "Set Airspeed")
defineFloat("MACH", 179, {1.0, 0.929, 0.871, 0.816, 0.765, 0.727, 0.683, 0.643, 0.611, 0.582, 0.551, 0.525, 0.5, 0.4}, "Gauges", "MachIndicator")

-- Altimeter AAU-34/A
defineToggleSwitch("ALT_ELECT", 31, 3002, 60, "Altimeter", "Altimeter Mode Control Lever, ELECT(rical)/PNEU(matic)")
defineRotary("ALT_ZERO", 31, 3003, 62, "Altimeter", "Altimeter Zero Setting Knob")
defineFloat("ALT_100_P", 10, {0.0, 1.0}, "Gauges", "Altimeter 100ft Pointer")
defineFloat("ALT_10000_C", 11, {0.0, 1.0}, "Gauges", "Altimeter 10000ft Count")
defineFloat("ALT_1000_C", 520, {0.0, 1.0}, "Gauges", "Altimeter 1000ft Count")
defineFloat("ALT_100_C", 521, {0.0, 1.0}, "Gauges", "Altimeter 100ft Count")
defineFloat("PRESS_0", 59, {0.0, 1.0}, "Gauges", "Pressure Setting 0")
defineFloat("PRESS_1", 58, {0.0, 1.0}, "Gauges", "Pressure Setting 1")
defineFloat("PRESS_2", 57, {0.0, 1.0}, "Gauges", "Pressure Setting 2")
defineFloat("PRESS_3", 56, {0.0, 1.0}, "Gauges", "Pressure Setting 3")
defineFloat("ALT_PNEU_FLAG", 9, {0.0, 1.0}, "Gauges", "Altimeter PNEU Flag")

-- Attitude Indicator ARU-20/A
definePotentiometer("AI_PITCH_TRIM", 32, 3001, 150, {0, 1}, "Attitude Indicator", "Attitude Indicator Pitch Trim Knob")
defineFloat("AI_PITCH", 81, {-0.507, 0.0, 0.507}, "Gauges", "Attitude Indicator Pitch")
defineFloat("AI_BANK", 30, {-1.0, 1.0}, "Gauges", "Attitude Indicator Bank")
defineFloat("AI_OFF_FLAG", 149, {0.0, 1.0}, "Gauges", "Attitude Indicator OFF Flag")

-- Horizontal Situation Indicator
defineVariableStepTumb("HSI_HDG_KNOB", 33, 3001, 271, 1.0, "HSI", "HSI Heading Set Knob")
defineVariableStepTumb("HSI_CRS_KNOB", 33, 3002, 272, 1.0, "HSI", "HSI Course Set Knob")
defineFloat("HSI_CRS", 35, {0.0, 1.0}, "Gauges", "HSI Course Arrow")
defineFloat("HSI_HDG", 144, {0.0, 1.0}, "Gauges", "HSI Heading Mark")
defineFloat("HSI_COMP", 32, {0.0, 1.0}, "Gauges", "HSI Compass Card")
defineFloat("HSI_BER_POINT", 139, {0.0, 1.0}, "Gauges", "HSI Bearing Pointer")
defineFloat("HSI_CRS_DEV", 36, {0.0, 1.0}, "Gauges", "HSI Course Dev Indicator")
defineFloat("HSI_Range_100", 268, {0.0, 1.0}, "Gauges", "HSI Range 100")
defineFloat("HSI_Range_10", 269, {0.0, 1.0}, "Gauges", "HSI Range 10")
defineFloat("HSI_Range_1", 270, {0.0, 1.0}, "Gauges", "HSI Range 1")
defineIndicatorLight("HSI_Range_FLAG", 142, "Warning, Caution and IndicatorLights", "HSI Range Flag")
defineFloat("HSI_CRS_10010", 276, {0.0, 1.0}, "Gauges", "HSI CourseSel 100 10")
defineFloat("HSI_CRS_1", 277, {0.0, 1.0}, "Gauges", "HSI CourseSel 1")
defineFloat("HSI_TO_FROM", 146, {0.0, 1.0}, "Gauges", "HSI To From")
defineFloat("HSI_OFF", 143, {0.0, 1.0}, "Gauges", "HSI OFF Flag")
defineFloat("HSI_DEV", 141, {0.0, 1.0}, "Gauges", "HSI DevDF Window")

-- Standby Attitude Indicator
definePushButton("SAI_CAGE", 34, 3001, 441, "Standby Attitude Indicator", "Cage SAI")
defineRotary("SAI_PITCH_TRIM", 34, 3002, 442, "Standby Attitude Indicator", "SAI Pitch Trim")

-- Clock
definePushButton("CLOCK_WIND", 35, 3001, 510, "Clock", "ABU-11 CLOCK Winding Knob")
defineRotary("CLOCK_WIND_ROTATRY", 35, 3002, 510, "Clock", "ABU-11 CLOCK Winding Rotary")
definePushButton("CLOCK_SET", 35, 3001, 511, "Clock", "ABU-11 CLOCK Setting Knob")
definePushButton("ELAP_TIME", 35, 3003, 512,"Clock" , "ABU-11 CLOCK Elapsed Time Knob")
defineFloat("CLOCK_CURR_H", 19, {0.0, 1.0}, "Gauges", "CLOCK Currtime Hours")
defineFloat("CLOCK_CURR_M", 18, {0.0, 1.0}, "Gauges", "CLOCK Currtime Minutes")
defineFloat("CLOCK_ELAP_M", 509, {0.0, 1.0}, "Gauges", "CLOCK Elapsed Time Minutes")
defineFloat("CLOCK_ELAP_S", 37, {0.0, 1.0}, "Gauges", "CLOCK Elapsed Time Seconds")

--UHF Radio AN/ARC-164
definePushButton("UHF_TONE_BT", 23, 3009, 310,"UHF Radio" , "UHF Radio Tone Button")
defineToggleSwitch("UHF_SQUELCH_SW", 23, 3010, 308,"UHF Radio" , "UHF Radio Squelch Switch, ON/OFF")
defineTumb("UHF_FUNC", 23, 3008, 311, 0.1, {0.0, 0.3}, nil, false, "UHF Radio" , "UHF Radio Function Selector Switch, OFF/MAIN/BOTH/ADF")
defineTumb("UHF_FREQ", 23, 3007, 307, 0.1, {0.0, 0.2}, nil, false, "UHF Radio" , "UHF Radio Frequency Mode Selector Switch, MANUAL/PRESET/GUARD")
defineTumb("UHF_PRESET_SEL", 23, 3001, 300, 0.05, {0.0, 1.0}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, false, "UHF Radio" , "UHF Radio Preset Channel Selector Knob")
defineTumb("UHF_100MHZ_SEL", 23, 3002, 327, 0.1, {0.0, 0.3}, nil, false, "UHF Radio" , "UHF Radio 100 MHz Frequency Selector Knob")
defineTumb("UHF_10MHZ_SEL", 23, 3003, 328, 0.1, {0.0, 1.0}, nil, false, "UHF Radio" , "UHF Radio 10 MHz Frequency Selector Knob")
defineTumb("UHF_1MHZ_SEL", 23, 3004, 329, 0.1, {0.0, 1.0}, nil, false, "UHF Radio" , "UHF Radio 1 MHz Frequency Selector Knob")
defineTumb("UHF_01MHZ_SEL", 23, 3005, 330, 0.1, {0.0, 1.0}, nil, false, "UHF Radio" , "UHF Radio 0.1 MHz Frequency Selector Knob")
defineTumb("UHF_0025MHZ_SEL", 23, 3006, 331, 0.25, {0.0, 1.0}, nil, false, "UHF Radio" , "UHF Radio 0.025 MHz Frequency Selector Knob")
definePotentiometer("UHF_VOL", 23, 3011, 309, {0, 1}, "UHF Radio", "UHF Radio Volume Knob")
defineMultipositionSwitch("UHF_ANT", 23, 3016, 336, 3, 0.5, "UHF Radio", "UHF Radio Antenna Selector Switch, UPPER/AUTO/LOWER")
definePushButton("UHF_MIC_BT", 24, 3001, 135,"UHF Radio" , "UHF Radio Microphone Button")
defineToggleSwitch("UHF_DOOR", 23, 3022, 335,"UHF Radio" , "Hinged Access Door, OPEN/CLOSE")
definePushButton("UHF_PRE_SET", 23, 3024, 314,"UHF Radio" , "UHF Preset Channel Set Button")
defineFloat("UHF_PRESET_CHAN", 326, {0.0, 1.0}, "Gauges", "UHF Preset Radio Channel")
defineFloat("UHF_100", 302, {0.0, 1.0}, "Gauges", "UHF Radio 100MHz")
defineFloat("UHF_10", 303, {0.0, 1.0}, "Gauges", "UHF Radio 10MHz")
defineFloat("UHF_1", 304, {0.0, 1.0}, "Gauges", "UHF Radio 1MHz")
defineFloat("UHF_01", 305, {0.0, 1.0}, "Gauges", "UHF Radio 0.1MHz")
defineFloat("UHF_0025", 306, {0.0, 1.0}, "Gauges", "UHF Radio 0.025MHz")

--TACAN
defineIndicatorLight("TACAN_TEST", 260, "TACAN Panel", "TACAN Test Indicator Light (green)")
defineFixedStepTumb("TACAN_10", 41, 3001, 256, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Left Channel Selector")
defineFixedStepTumb("TACAN_1", 41, 3002, 257, 0.1, {0, 1}, {-0.1, 0.1}, nil, "TACAN Panel", "Right Channel Selector")
defineToggleSwitch("TACAN_XY", 41, 3003, 266, "TACAN Panel", "TACAN Channel X/Y Toggle")
defineMultipositionSwitch("TACAN_MODE", 41, 3006, 262, 4, 0.1,"TACAN Panel", "TACAN Mode Dial")
definePotentiometer("TACAN_VOL", 41, 3005, 261, {0, 1}, "TACAN Panel", "TACAN Signal Volume")
definePushButton("TACAN_HSI", 41, 3004, 259,"TACAN Panel" , "TACAN Signal on HSI Test Button")
defineString("TACAN_CHANNEL", getTacanChannel, 4, "TACAN Panel", "TACAN Channel")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(183)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(185)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights")

defineIntegerFromGetter("EXT_STROBE_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Lights")

defineIntegerFromGetter("EXT_BRAKE_CUTE", function()
	if LoGetAircraftDrawArgumentValue(35) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Brake Cute")

BIOS.protocol.endModule()