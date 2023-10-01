BIOS.protocol.beginModule("P-47D", 0x5200)
BIOS.protocol.setExportModuleAircrafts({"P-47D-30", "P-47D-30bl1", "P-47D-40"})
--by WarLord v1.1a
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local define3PosTumb = BIOS.util.define3PosTumb
local defineSpringloaded_3PosTumb = BIOS.util.defineSpringloaded_3PosTumb
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- Remove PILOT Arg# 135
-- Extra Functions
local function defineIndicatorLightMulti1(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) > 0.51 then
			value:setValue(0)
		else
		    value:setValue(1)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "Multi Led Color 1",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "Light is on below 0.51"
			}
		}
	}
end

local function defineIndicatorLightMulti2(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) <= 0.51 then
			value:setValue(0)
		else
		    value:setValue(1)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "Multi Led Color 2",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "Light is on grater than 0.51"
			}
		}
	}
end

--Stick
definePushButton("STICK_MG_TRIGGER", 14, 3001, 53, "Weapons", "Stick MG Trigger")
definePushButton("STICK_SEC_TRIGGER", 14, 3002, 52, "Weapons", "Stick Secondary & Drop Ordnance Trigger")

--Canopy
define3PosTumb("CANOPY_SW", 2, 3013, 39, "Canopy Controls", "Canopy Switch, OPEN/OFF/CLOSE")
defineToggleSwitch("CANOPY_JETT_SW", 2, 3020, 157, "Canopy Controls", "Cockpit Jettison Pull Handle")
definePushButton("HATCH_KNB", 2, 3016, 154, "Canopy Controls", "Canopy Hatch Knobs")

--Main Panel
definePushButton("CLK_PINION_PULL", 5, 3006, 8, "Main Panel", "Clock Pullout")
defineRotary("CLK_PINION", 5, 3004, 7, "Main Panel", "Clock Winding/Adjustment")
define3PosTumb("STARTER_SW", 3, 3021, 63, "Main Panel", "Starter Switch")
definePotentiometer("PRIMER_TURN", 3, 3022, 65, {0, 1}, "Main Panel", "Primer Pump Turn")
definePushButton("PRIMER_PULL", 3, 3025, 64, "Main Panel", "Primer Pump Pull")
defineToggleSwitch("COWL_FLAP_SW", 3, 3032, 112, "Main Panel", "Cowl Flaps Button")
defineToggleSwitch("DEFROSTER_KNB", 2, 3046, 149, "Main Panel", "Defroster Knob")
defineToggleSwitch("COCKPIT_VENT_KNB", 2, 3049, 129, "Main Panel", "Cockpit Ventilation Knob")
defineMultipositionSwitch("MAGNETO_SEL", 3, 3028, 66, 4, 0.1,"Main Panel" ,"Magneto Selector")
defineRotary("DI", 2, 3053, 13, "Main Panel", "Directional Gyro Adjust")
definePotentiometer("AH_PITCH_ADJUST", 10, 3002, 17, {0, 1}, "Main Panel", "Artificial Horizon Pitch Adjustment")
defineToggleSwitch("AH_CAGE", 10, 3007, 18, "Main Panel", "Artificial Horizon Cage Switch")
defineRotary("ALT_SET_PRESS", 2, 3010, 22, "Main Panel", "Altimeter Set Pressure")
definePushButton("ACCEL_RESET", 12, 3001, 176, "Main Panel", "Accelerometer Reset")
definePushButton("TURB_OVER_SP_T_BTN", 2, 3021, 60, "Main Panel", "Turbine Overspeed Lamp Test Button")
definePushButton("LAND_WARN_GN_T_BTN", 2, 3022, 81, "Main Panel", "Landing Warning Green Lamp Test Button")
definePushButton("LAND_WARN_RD_T_BTN", 2, 3023, 83, "Main Panel", "Landing Warning Red Lamp Test Button")
definePushButton("FUEL_PRESS_T_BTN", 2, 3024, 70, "Main Panel", "Fuel Pressure Lamp Test Button")
defineToggleSwitch("BATTERY_SW", 8, 3032, 79, "Main Panel", "Battery Switch")
defineToggleSwitch("PARK_BRAKE", 2, 3028, 84, "Main Panel", "Parking Brake Handle")

definePushButton("JETT_STORES_L", 14, 3008, 126, "Arming Panel", "Jettison Left Stores Pull Handle")
definePushButton("JETT_STORES_R", 14, 3009, 127, "Arming Panel", "Jettison Right Stores Pull Handle")
definePushButton("JETT_STORES_B", 14, 3010, 128, "Arming Panel", "Jettison Belly Pull Handle")
defineToggleSwitch("L_WING_BOMB_SW_C", 14, 3011, 139, "Arming Panel", "Left Wing Bomb Switch Cover")
defineToggleSwitch("L_WING_BOMB_SW", 14, 3013, 140, "Arming Panel", "Left Wing Bomb Switch")
defineToggleSwitch("R_WING_BOMB_SW_C", 14, 3015, 141, "Arming Panel", "Right Wing Bomb Switch Cover")
defineToggleSwitch("R_WING_BOMB_SW", 14, 3017, 142, "Arming Panel", "Right Wing Bomb Switch")
defineToggleSwitch("B_WING_BOMB_SW_C", 14, 3019, 143, "Arming Panel", "Belly Bomb Switch Cover")
defineToggleSwitch("B_WING_BOMB_SW", 14, 3021, 144, "Arming Panel", "Belly Bomb Switch")
defineToggleSwitch("L_CHEM_SW_C", 14, 3023, 145, "Arming Panel", "Left Chemical Switch Cover")
defineToggleSwitch("L_CHEM_SW", 14, 3025, 146, "Arming Panel", "Left Chemical Switch")
defineToggleSwitch("R_CHEM_SW_C", 14, 3027, 147, "Arming Panel", "Right Chemical Switch Cover")
defineToggleSwitch("R_CHEM_SW", 14, 3029, 148, "Arming Panel", "Right Chemical Switch")

--Drop Ordinance Panel
defineToggleSwitch("OAP_READY_SW_C", 14, 3037, 139, "Drop Ordinance Panel", "OAP Ready Switch Cover")
defineToggleSwitch("OAP_READY_SW", 14, 3039, 141, "Drop Ordinance Panel", "OAP Ready Switch")
defineToggleSwitch("OAP_SEL_SW", 14, 3041, 143, "Drop Ordinance Panel", "OAP Selector Switch")
defineToggleSwitch("ARM_B_HAND", 14, 3035, 228, "Drop Ordinance Panel", "Arming Handle Belly")
defineToggleSwitch("ARM_L_HAND", 14, 3031, 229, "Drop Ordinance Panel", "Arming Handle Left")
defineToggleSwitch("ARM_R_HAND", 14, 3033, 230, "Drop Ordinance Panel", "Arming Handle Right")

--Rockets Distributor Control Panel
defineMultipositionSwitch("RKT_REL_MODE", 22, 3001, 221, 3, 0.1,"Rockets Control Panel" ,"Rockets Release Mode")
defineToggleSwitch("RKT_DELAY_SW", 22, 3004, 222, "Rockets Control Panel", "Rockets Delay Switch")
define3PosTumb("RKT_COUNT_CONTR", 22, 3006, 226, "Rockets Control Panel", "Rockets Counter Control")
defineToggleSwitch("RKT_SALVO_SIZE_SEL", 22, 3007, 227, "Rockets Control Panel", "Rockets Salvo Size Selector")

--Port Wall
defineToggleSwitch("RECOV_FLAP_SW_C", 2, 3036, 75, "Port Wall", "Recovery Flaps Switch Cover")
defineToggleSwitch("RECOV_FLAP_SW", 2, 3039, 76, "Port Wall", "Recovery Flaps Switch")
define3PosTumb("INTCOOL_FLP_SW", 3, 3041, 87, "Port Wall", "Intercooler Flap Switch")
define3PosTumb("OILCOOL_FLP_SW", 3, 3044, 88, "Port Wall", "Oil Cooler Flap Switch")
defineToggleSwitch("GUNS_SW_C", 14, 3003, 67, "Port Wall", "Guns Switch Cover")
define3PosTumb("GUNS_SW", 14, 3005, 68, "Port Wall", "Guns Switch")
defineTumb("FLAPS_LVR", 2, 3029, 94, 0.5, {0, 1}, nil, false, "Port Wall", "Landing Flaps Lever")
definePotentiometer("LH_C5_CAP", 18, 3004, 166, {0, 1}, "Port Wall", "LH C5 Assy. Cover")
defineTumb("GEAR_LVR", 2, 3034, 153, 2, {-1, 1}, nil, false, "Port Wall", "Gear Lever")

definePushButton("VHF_PTT_BTN", 23, 3099, 44, "Throttle Quadrant", "Radio PTT Button")
definePushButton("NOS_BTN", 3, 3001, 40, "Throttle Quadrant", "NOS Push Button")
defineToggleSwitch("NOS_LOCK_SW", 3, 3002, 41, "Throttle Quadrant", "NOS Lock Switch")
definePotentiometer("PROP_RPM_LVR", 3, 3006, 46, {0, 1}, "Throttle Quadrant", "Propeller RPM Lever")
definePushButton("PROP_LOCK", 3, 3037, 45, "Throttle Quadrant", "Propeller RPM Lever Lock")
definePotentiometer("BOOST_LVR", 3, 3009, 58, {0, 1}, "Throttle Quadrant", "Boost Lever")
definePushButton("BOOST_LOCK", 3, 3039, 49, "Throttle Quadrant", "Boost Lever Lock")
definePotentiometer("MIX_LVR", 3, 3012, 48, {0, 1}, "Throttle Quadrant", "Mixture Lever")
definePotentiometer("THROTTLE_FRIC", 3, 3018, 57, {0, 1}, "Throttle Quadrant", "Throttle Frictioner")
definePushButton("NOS_BTN", 3, 3001, 40, "Throttle Quadrant", "NOS Button")

defineMultipositionSwitch("PROP_CONTR_SW", 3, 3029, 72, 4, 0.1,"Propellor Control" ,"Propellor Control Switch")

definePotentiometer("TRIM_WH_AILERON", 2, 3001, 91, {-1,1}, "Trim Control", "Aileron Trim Wheel")
definePotentiometer("TRIM_WH_ELEVATOR", 2, 3004, 92, {-1,1}, "Trim Control", "Elevator Trim Wheel")
definePotentiometer("TRIM_WH_RUDDER", 2, 3007, 93, {-1,1}, "Trim Control", "Rudder Trim Wheel")

definePushButton("PROP_CB", 8, 3085, 73, "Circuit Brakers", "Propellor Control CB")
definePushButton("MSB_CB_GUN_LI", 8, 3051, 204, "Circuit Brakers", "LH Inboard Guns CB")
definePushButton("MSB_CB_GUN_LO", 8, 3053, 205, "Circuit Brakers", "LH Outboard Guns CB")
definePushButton("MSB_CB_GUN_RI", 8, 3055, 206, "Circuit Brakers", "LH Inboard Guns CB")
definePushButton("MSB_CB_GUN_RO", 8, 3057, 207, "Circuit Brakers", "LH Outboard Guns CB")
definePushButton("MSB_CB_FPUMP", 8, 3059, 208, "Circuit Brakers", "Fuel Pumps CB")
definePushButton("MSB_CB_OILCLR", 8, 3061, 209, "Circuit Brakers", "Oil Cooler CB")
definePushButton("MSB_CB_INTRCLR", 8, 3063, 210, "Circuit Brakers", "Intercooler CB")
definePushButton("MSB_CB_GUNRELAY", 8, 3065, 211, "Circuit Brakers", "Gun Relay and Gun Camera Guns CB")
definePushButton("MSB_CB_GUNSIGHT", 8, 3067, 212, "Circuit Brakers", "Gun Sight, Camera Heat & Water Injection CB")
definePushButton("MSB_CB_CANOPY", 8, 3069, 213, "Circuit Brakers", "Canopy Motor CB")
definePushButton("MSB_CB_LLIGHT", 8, 3071, 214, "Circuit Brakers", "Landing Light CB")
definePushButton("MSB_CB_WARN", 8, 3073, 215, "Circuit Brakers", "Warn. Instruments CB")
definePushButton("MSB_CB_CLIGHT", 8, 3075, 216, "Circuit Brakers", "Internal Lighting CB")
definePushButton("MSB_CB_PITOT", 8, 3077, 217, "Circuit Brakers", "Pitot & Starter CB")
definePushButton("MSB_CB_NLIGHT", 8, 3079, 218, "Circuit Brakers", "Position Lights CB")
definePushButton("MSB_CB_RLIGHT", 8, 3081, 219, "Circuit Brakers", "Recognition Lights CB")
definePushButton("MSB_CB_RADIO", 8, 3083, 220, "Circuit Brakers", "Radio CB")
definePushButton("MSB_CB_BOMBS", 8, 3087, 158, "Circuit Brakers", "Drop Ordinance CB")
definePushButton("MSB_CB_CRFLAPS", 8, 3089, 159, "Circuit Brakers", "Recovery Flaps CB")

definePotentiometer("MSB_GUNSIGHT", 8, 3001, 194, {0, 1}, "Main Switch Box", "Gun Sight Rheostat")
definePotentiometer("MSB_COMPASS", 8, 3004, 195, {0, 1}, "Main Switch Box", "Compass Light Rheostat")
definePotentiometer("MSB_UV", 18, 3001, 170, {0, 1}, "Main Switch Box", "UV Instruments Light Rheostat")
definePotentiometer("MSB_BOOSTERPUMP", 8, 3010, 61, {0, 1}, "Main Switch Box", "Booster Pumps Control Rheostat")
define3PosTumb("MSB_NAV1", 8, 3013, 197, "Main Switch Box", "Wing Tips Nav. Lights Switch")
define3PosTumb("MSB_NAV2", 8, 3016, 198, "Main Switch Box", "Tail Nav. Lights Switch")
define3PosTumb("MSB_LANDING", 8, 3019, 199, "Main Switch Box", "Landing Lights Switch")
define3PosTumb("MSB_CPT_LIGHT", 8, 3022, 71, "Main Switch Box", "Cockpit Light Switch")
defineToggleSwitch("MSB_GENERATOR", 8, 3024, 200, "Main Switch Box", "Generator Switch")
defineToggleSwitch("MSB_PITOT", 8, 3026, 201, "Main Switch Box", "Pitot Heater Switch")
defineToggleSwitch("MSB_DILUTE", 8, 3028, 62, "Main Switch Box", "Oil Dilution Switch")
define3PosTumb("MSB_TEST1", 8, 3030, 202, "Main Switch Box", "LG/FL Test Switch")
define3PosTumb("MSB_TEST2", 8, 3031, 203, "Main Switch Box", "OXY/TRB Test Switch")

--Starboard Wall
definePushButton("IFF_DESTR_1", 15, 3087, 185, "Starboard Wall", "Secret Radio Destruction Box 1")
definePushButton("IFF_DESTR_2", 15, 3089, 186, "Starboard Wall", "Secret Radio Destruction Box 2")
definePotentiometer("RH_C5_CAP", 19, 3004, 168, {0, 1}, "Starboard Wall", "RH C5 Assy. Cover")
defineToggleSwitch("TAIL_LOCK", 2, 3042, 101, "Starboard Wall", "Tail Wheel Lock Lever")

definePotentiometer("OXY_BYPASS", 4, 3005, 130, {0, 1}, "Oxygen", "Oxygen Emergency By-pass")
defineToggleSwitch("OXY_AUTOMIX", 4, 3003, 131, "Oxygen", "Oxygen Auto-Mix On-Off")

definePushButton("RLB_KEY", 8, 3035, 96, "Recognition Lights", "Recognition Lights KEY Button")
define3PosTumb("RLB_WHITE", 8, 3036, 97, "Recognition Lights", "Recognition Lights Switch White")
define3PosTumb("RLB_RED", 8, 3039, 98, "Recognition Lights", "Recognition Lights Switch Red")
define3PosTumb("RLB_GREEN", 8, 3042, 99, "Recognition Lights", "Recognition Lights Switch Green")
define3PosTumb("RLB_YELLOW", 8, 3045, 100, "Recognition Lights", "Recognition Lights Switch Yellow")

defineToggleSwitch("RCTRL_OFF", 23, 3001, 115, "Radio", "Radio Power OFF")
defineToggleSwitch("RCTRL_A", 23, 3002, 116, "Radio", "Radio Channel A")
defineToggleSwitch("RCTRL_B", 23, 3003, 117, "Radio", "Radio Channel B")
defineToggleSwitch("RCTRL_C", 23, 3004, 118, "Radio", "Radio Channel C")
defineToggleSwitch("RCTRL_D", 23, 3005, 119, "Radio", "Radio Channel D")
defineToggleSwitch("RCTRL_DIM", 23, 3006, 125, "Radio", "Radio Channel Dimmer")
defineToggleSwitch("RCTRL_TLOCK", 23, 3017, 155, "Radio", "Switch Locking Lever")
defineSpringloaded_3PosTumb("RCTRL_T_MODE", 23, 3008, 3007, 156, "Radio", "Radio Mode Switch")
definePotentiometer("RCTRL_VOL", 23, 3015, 77, {0, 1}, "Radio", "Radio Volume")

definePotentiometer("DETROLA_FREQU_SEL", 24, 3004, 137, {0, 1}, "Detrola Receiver", "Detrola Frequency Selector")
definePotentiometer("DETROLA_VOL", 24, 3001, 138, {0, 1}, "Detrola Receiver", "Detrola Volume")

--Deck
defineTumb("MAIN_FUEL_SEL", 3, 3047, 85,  0.25, {0, 1}, nil, true, "Deck" ,"Main Fuel Tank Selector")
defineMultipositionSwitch("DROP_TANK_SEL", 3, 3050, 86, 3, 0.5, "Deck" ,"Droptank Selector")
defineToggleSwitch("AIRFILTER", 3, 3033, 114, "Deck", "Air Filter By-Pass Lever")
defineToggleSwitch("HYDR_HP", 2, 3052, 160, "Deck", "Hydraulic System Hand Pump")
definePotentiometer("CARBAIR", 3, 3054, 161, {0, 1}, "Deck", "Carburettor Heater Lever")

--Gun Sight
definePotentiometer("WING_SPAN_SEL", 6, 3001, 35, {0, 1}, "Gun Sight", "Wing Span Selector")
definePotentiometer("TARGET_RANGE_SEL", 6, 3020, 36, {0, 1}, "Gun Sight", "Target Range Selector")
defineToggleSwitch("RET_MASK_LVR", 6, 3006, 37, "Gun Sight", "Fixed Reticle Mask Lever")

--Warning, Caution and IndicatorLights
defineIndicatorLight("TURB_OVER_SP_L", 59, "Warning, Caution and IndicatorLights","Turbine Overspeed Light (red)")
defineIndicatorLight("FUEL_LVL_WARN_L", 69, "Warning, Caution and IndicatorLights","Fuel Level Warning Light (yellow)")
defineIndicatorLight("GEAR_GN_L", 80, "Warning, Caution and IndicatorLights","Landing Warning Light Right (green)")
defineIndicatorLight("GEAR_RD_L", 82, "Warning, Caution and IndicatorLights","Landing Warning Light Left (red)")
defineIndicatorLight("RECOC_L_KEY_L", 95, "Warning, Caution and IndicatorLights","Recognition Lights KEY Light (yellow)")
defineIndicatorLight("INSTR_L", 191, "Warning, Caution and IndicatorLights","Instrument Lights (white)")
defineIndicatorLight("GAUGES_GLOW", 192, "Warning, Caution and IndicatorLights","Photoluminescence Gauges (green)")
defineIndicatorLight("VHF_RADIO_A_L", 120, "Warning, Caution and IndicatorLights", "VHF Radio A Light (green)")
defineIndicatorLight("VHF_RADIO_B_L", 121, "Warning, Caution and IndicatorLights", "VHF Radio B Light (green)")
defineIndicatorLight("VHF_RADIO_C_L", 122, "Warning, Caution and IndicatorLights", "VHF Radio C Light (green)")
defineIndicatorLight("VHF_RADIO_D_L", 123, "Warning, Caution and IndicatorLights", "VHF Radio D Light (green)")
defineIndicatorLight("VHF_RADIO_TX_L", 124, "Warning, Caution and IndicatorLights", "VHF Radio TX Light (white)")
--defineIndicatorLightMulti1("L_UV_LAMP_RD", 167, "Warning, Caution and IndicatorLights","Left UV Instruments Lamp (red)")-------WIP C5lamp#= 173/174
defineIndicatorLightMulti2("L_UV_LAMP_BL", 167, "Warning, Caution and IndicatorLights","Left UV Instruments Lamp (blue)")
--defineIndicatorLightMulti1("R_UV_LAMP_RD", 169, "Warning, Caution and IndicatorLights","Right UV Instruments Lamp (red)") -----WIP
defineIndicatorLightMulti2("R_UV_LAMP_BL", 169, "Warning, Caution and IndicatorLights","Right UV Instruments Lamp (blue)")
defineIndicatorLight("OXY_LOW_L", 179, "Warning, Caution and IndicatorLights","Oxygen Low Light (red)")

--Gauges
defineFloat("CANOPY_POS", 38, {0, 1}, "Cockpit", "Canopy Position")
defineFloat("PANEL_SHAKE_Z", 180, {-0.8, 0.8}, "Cockpit", "Common Panel Shaker (Z Axis)")
defineFloat("PANEL_SHAKE_Y", 484, {-0.8, 0.8}, "Cockpit", "Common Panel Shaker (Y Axis)")
defineFloat("PANEL_SHAKE_X", 489, {-0.8, 0.8}, "Cockpit", "Common Panel Shaker (X Axis)")
defineFloat("CLOCK_NEEDLE_H", 4, {0, 1}, "Gauges", "Clock Hours Needle")
defineFloat("CLOCK_NEEDLE_M", 5, {0, 1}, "Gauges", "Clock Minutes Needle")
defineFloat("CLOCK_NEEDLE_S", 6, {0, 1}, "Gauges", "Clock Seconds Needle")
defineFloat("SUCTION_GAUGE", 9, {0, 1}, "Gauges", "Suction Gauge")
defineFloat("MANI_PRESS_GAUGE", 10, {0, 1}, "Gauges", "Manifold Pressur Gauge")
defineFloat("AIRSPEED_GAUGE", 11, {0, 0.9}, "Gauges", "Airspeed Gauge")
defineFloat("DI_GAUGE", 12, {0, 1}, "Gauges", "DI Gauge")
defineFloat("AHORIZON_BANK", 14, {1.0, -1.0}, "Gauges", "Artificial Horizon - Bank")
defineFloat("AHORIZON_PITCH", 15, {1.0, -1.0}, "Gauges", "Artificial Horizon - Pitch")
defineFloat("AHORIZON_ZERO", 136, {-1, 1}, "Gauges", "Artificial Horizon - Zero")
defineFloat("AHORIZON_CAGE", 20, {0, 1}, "Gauges", "Artificial Horizon - Cage")
defineFloat("TACHO_GAUGE", 23, {0, 1}, "Gauges", "Tachometer Gauge")
defineFloat("ALTIMETER_100F", 24, {0, 1}, "Gauges", "Altimeter 100 ft")
defineFloat("ALTIMETER_1000F", 25, {0, 1}, "Gauges", "Altimeter 1000 ft")
defineFloat("ALTIMETER_10000F", 26, {0, 1}, "Gauges", "Altimeter 10000 ft")
defineFloat("ALTIMETER_PRESSURE", 21, {0, 1}, "Gauges", "Altimeter Pressure")
defineFloat("ALTIMETER_100F_REF", 171, {0, 1}, "Gauges", "Altimeter 100 ft Reference")
defineFloat("ALTIMETER_1000F_REF", 172, {0, 1}, "Gauges", "Altimeter 1000 ft Reference")
defineFloat("SLIPBALL", 28, {-1, 1}, "Gauges", "Slipball")
defineFloat("TURN_NEEDLE", 27, {-1, 1}, "Gauges", "Turn Needle")
defineFloat("VARIOMETER", 29, {-0.6, 0.6}, "Gauges", "Variometer")
defineFloat("3GAUGE_OIL_TEMP", 30, {-1, 1}, "Gauges", "TriGauge Oil Temperature")
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
defineFloat("ACCELEROMETER_MAIN", 175, {0, 1}, "Gauges", "Accelerometer Main")
defineFloat("ACCELEROMETER_MIN", 177, {0, 1}, "Gauges", "Accelerometer Min")
defineFloat("ACCELEROMETER_MAX", 178, {0, 1}, "Gauges", "Accelerometer Max")
defineFloat("COMPASS_HDG", 106, {-1, 1}, "Gauges", "Compass Heading")
defineFloat("COMPASS_PITCH", 105, {-1, 1}, "Gauges", "Compass Pitch")
defineFloat("COMPASS_BANK", 107, {-1, 1}, "Gauges", "Compass Bank")
defineFloat("MK8_BALL", 183, {-1, 1}, "Gauges", "Mk.8 Slipball")

defineToggleSwitch("STICK_HIDE", 2, 3059, 232, "Cockpit", "Hide Stick Toggle")

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