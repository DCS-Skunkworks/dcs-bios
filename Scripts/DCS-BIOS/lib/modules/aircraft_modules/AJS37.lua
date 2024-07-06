module("AJS37", package.seeall)

local ActionArgument = require("Scripts.DCS-BIOS.lib.modules.documentation.ActionArgument")
local ActionInput = require("Scripts.DCS-BIOS.lib.modules.documentation.ActionInput")
local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class AJS37: Module
local AJS37 = Module:new("AJS37", 0x4600, { "AJS37" })

--overhaul by WarLord v1.0a
--remove Arg# Pilot 3333

--- Adds a new push button control with only a toggle input to push the button
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function AJS37:defineMissileSelectPushButton(identifier, device_id, command, arg_number, category, description)
	local alloc = self:allocateInt(1, identifier)

	local control = Control:new(category, ControlType.action, identifier, description, {
		ActionInput:new(ActionArgument.toggle, "Presses the button"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "The position of the button"),
	})

	self:addInputProcessor(identifier, function(value)
		if value == "TOGGLE" then
			GetDevice(device_id):performClickableAction(command, 1)
		end
	end)

	self:addExportHook(function(dev0)
		local value = dev0:get_argument_value(arg_number)
		-- the value of this button is a float between 0 and 1 depending on the position of the button
		alloc:setValue(Module.round(Module.valueConvert(value, { -1, 1 }, { 0, 1 })))
	end)

	self:addControl(control)

	return control
end

--Weapon System
AJS37:defineToggleSwitch("TRIGGER_SAFETY_BRACKET", 2, 3300, 8, "Weapon System", "Trigger Safety Bracket")
AJS37:defineToggleSwitch("WEAPON_RELEASE_COVER", 2, 3302, 260, "Weapon System", "Weapon Emergency Release Cover")
AJS37:definePushButton("WEAPON_RELEASE", 2, 3303, 261, "Weapon System", "Weapon Emergency Release Button")
AJS37:defineToggleSwitch("TANK_RELEASE_COVER", 2, 3402, 262, "Weapon System", "External Tank Release Cover")
AJS37:definePushButton("TANK_RELEASE", 2, 3320, 263, "Weapon System", "External Tank Release Button")
AJS37:defineTumb("WEAPON_SELECT", 2, 3304, 264, 0.1, { 0.0, 0.5 }, nil, false, "Weapon System", "Weapon Selector Knob")
AJS37:defineTumb("WEAPON_INTERVAL", 2, 3305, 265, 0.1, { 0, 1 }, nil, false, "Weapon System", "Weapon Interval Selector Mode Knob")
AJS37:defineToggleSwitch("WEAPON_REL_MODE", 2, 3306, 266, "Weapon System", "Weapon Release Mode Switch")
AJS37:defineToggleSwitch("RB_BK_REL_MODE", 2, 3307, 267, "Weapon System", "RB-04/RB-15/BK Release Mode Switch")

--Radar
AJS37:defineTumb("ANTI_JAM_MODE", 5, 3208, 217, 0.1, { 0, 0.7 }, nil, false, "Radar", "Anti Jamming Mode (AS) Selector")
AJS37:defineToggleSwitch("RADAR_GAIN_MODE", 5, 3209, 214, "Radar", "Lin/Log Radar Gain Switch")
AJS37:defineToggleSwitch("RADAR_PULSE_NORMAL_SHORT", 5, 3328, 218, "Radar", "Pulse Normal/Short Switch")
AJS37:defineToggleSwitch("RADAR_RECCE_ON_OFF", 5, 3350, 216, "Radar", "Passive Recce On/Off Switch")
AJS37:defineToggleSwitch("RADAR_MAINTENANCE_TEST", 5, 3914, 1006, "Radar", "Radar/EL Maintenance Test")
AJS37:defineToggleSwitch("RADAR_IGNITION_COILS", 18, 3918, 395, "Radar", "Ignition Coils")
AJS37:definePushButton("RADAR_IFF_ID", 5, 3922, 1205, "Radar", "IFF Identification")

--Reversal
AJS37:defineToggleSwitch("REVERSAL", 7, 3001, 20, "Thrust Reverser", "Thrust Reverser On/Off")

--Navigation
AJS37:definePushButton("DATAPANEL_KEY_0", 12, 3020, 290, "Navigation", "Datapanel Key 0")
AJS37:definePushButton("DATAPANEL_KEY_1", 12, 3021, 291, "Navigation", "Datapanel Key 1")
AJS37:definePushButton("DATAPANEL_KEY_2", 12, 3022, 292, "Navigation", "Datapanel Key 2")
AJS37:definePushButton("DATAPANEL_KEY_3", 12, 3023, 293, "Navigation", "Datapanel Key 3")
AJS37:definePushButton("DATAPANEL_KEY_4", 12, 3024, 294, "Navigation", "Datapanel Key 4")
AJS37:definePushButton("DATAPANEL_KEY_5", 12, 3025, 295, "Navigation", "Datapanel Key 5")
AJS37:definePushButton("DATAPANEL_KEY_6", 12, 3026, 296, "Navigation", "Datapanel Key 6")
AJS37:definePushButton("DATAPANEL_KEY_7", 12, 3027, 297, "Navigation", "Datapanel Key 7")
AJS37:definePushButton("DATAPANEL_KEY_8", 12, 3028, 298, "Navigation", "Datapanel Key 8")
AJS37:definePushButton("DATAPANEL_KEY_9", 12, 3029, 299, "Navigation", "Datapanel Key 9")
AJS37:definePushButton("NAV_SELECT_BTN_B1", 12, 3011, 271, "Navigation", "Navigation Selector Button B1")
AJS37:definePushButton("NAV_SELECT_BTN_B2", 12, 3012, 272, "Navigation", "Navigation Selector Button B2")
AJS37:definePushButton("NAV_SELECT_BTN_B3", 12, 3013, 273, "Navigation", "Navigation Selector Button B3")
AJS37:definePushButton("NAV_SELECT_BTN_B4", 12, 3014, 274, "Navigation", "Navigation Selector Button B4")
AJS37:definePushButton("NAV_SELECT_BTN_B5", 12, 3015, 275, "Navigation", "Navigation Selector Button B5")
AJS37:definePushButton("NAV_SELECT_BTN_B6", 12, 3016, 276, "Navigation", "Navigation Selector Button B6")
AJS37:definePushButton("NAV_SELECT_BTN_B7", 12, 3017, 277, "Navigation", "Navigation Selector Button B7")
AJS37:definePushButton("NAV_SELECT_BTN_B8", 12, 3018, 278, "Navigation", "Navigation Selector Button B8")
AJS37:definePushButton("NAV_SELECT_BTN_B9", 12, 3019, 279, "Navigation", "Navigation Selector Button B9")
AJS37:definePushButton("NAV_SELECT_BTN_BX", 12, 3010, 280, "Navigation", "Navigation Selector Button BX")
AJS37:definePushButton("NAV_SELECT_BTN_LS", 12, 3009, 270, "Navigation", "Navigation Selector Button LS")
AJS37:definePushButton("NAV_SELECT_BTN_L_MAL", 12, 3008, 281, "Navigation", "Navigation Selector Button L MAL")

--Lights
AJS37:defineToggleSwitch("ANTI_COLLISION_LIGHTS", 17, 3001, 250, "Lights", "Anti Collision Lights")
AJS37:define3PosTumb("NAVIGATION_LIGHTS", 17, 3002, 251, "Lights", "Navigation Lights")
AJS37:defineToggleSwitch("FORMATION_LIGHTS", 17, 3003, 252, "Lights", "Formation Lights")
AJS37:defineToggleSwitch("POSITION_LIGHTS", 17, 3004, 253, "Lights", "Position Lights")
AJS37:define3PosTumb("TAXI_LANDING_LIGHTS", 17, 3009, 3554, "Lights", "Taxi/Landing Lights")
AJS37:defineToggleSwitch("EMERGENCY_LIGHTS", 17, 3010, 3555, "Lights", "Emergency Lights")
AJS37:definePotentiometer("FLOOD_LIGHTS", 17, 3007, 393, { 0, 1 }, "Lights", "Flood Lights")
AJS37:definePotentiometer("PANEL_LIGHTS", 17, 3006, 392, { 0, 1 }, "Lights", "Panel Lights")
AJS37:defineTumb("POSITION_LIGHTS_BRIGHTNESS", 17, 3005, 254, 0.1, { 0, 0.2 }, nil, false, "Lights", "Position Lights Brightness")
AJS37:definePotentiometer("INSTRUMENT_LIGHTS", 17, 3008, 394, { 0, 1 }, "Lights", "Instrument Lights")

--Engine Panel
AJS37:defineToggleSwitch("START_SYSTEM", 18, 3001, 206, "Engine Panel", "Start System")
AJS37:defineToggleSwitch("LOW_PRES_FUEL_VALVE", 18, 3002, 204, "Engine Panel", "Low Pressure Fuel Valve")
AJS37:defineToggleSwitch("HIGH_PRES_FUEL_VALVE", 18, 3004, 202, "Engine Panel", "High Pressure Fuel Valve")
AJS37:defineToggleSwitch("ENGINE_DEICE", 18, 3099, 310, "Engine Panel", "Engine De-Ice")
AJS37:defineToggleSwitch("MANUAL_FUEL_REG", 18, 3007, 316, "Engine Panel", "Manual Fuel Regulator")
AJS37:defineToggleSwitch("CB_AUTOPILOT", 18, 3905, 302, "Engine Panel", "CB Autopilot SA")
AJS37:defineToggleSwitch("CB_HIGH_ALPHA_WARN", 18, 3906, 303, "Engine Panel", "CB High Alpha Warning")
AJS37:defineToggleSwitch("CB_TRIM_SYSTEM", 18, 3907, 304, "Engine Panel", "CB Trim System")
AJS37:defineToggleSwitch("CB_CI_SI", 18, 3908, 305, "Engine Panel", "CB CI/SI")
AJS37:defineToggleSwitch("CB_EJECTION_SYSTEM", 18, 3909, 306, "Engine Panel", "CB Ejection System")
AJS37:defineToggleSwitch("CB_ENGINE", 18, 3910, 307, "Engine Panel", "CB Engine")
AJS37:defineToggleSwitch("IFF_TRANSPONDER_POWER", 18, 3920, 1203, "Engine Panel", "IFF/Transponder Power")
AJS37:defineToggleSwitch("IFF_CHANNEL", 18, 3921, 1204, "Engine Panel", "IFF Channel Selector")
AJS37:defineToggleSwitch("DME_SELECTOR", 18, 3919, 1206, "Engine Panel", "DME Selector")
AJS37:defineToggleSwitch("IGNITION_SYSTEM", 18, 3003, 205, "Engine Panel", "Ignition System")
AJS37:defineToggleSwitch("MAN_AFTERBURN_FUEL_REG", 18, 3006, 313, "Engine Panel", "Manual Afterburner Fuel Regulator")
AJS37:defineTumb("FLIGHT_RECORDER", 18, 3924, 384, 0.5, { 0, 1 }, nil, false, "Engine Panel", "Flight Recorder")
AJS37:definePushButton("RESTART", 18, 3401, 208, "Engine Panel", "Restart")
AJS37:defineTumb("AFK_LEVER", 18, 3304, 13, 1.138, { 0, 1.138 }, nil, false, "Engine Panel", "AFK Lever")
AJS37:defineToggleSwitch("DATA_CARTRIDGE", 18, 3925, 4200, "Engine Panel", "Insert/Remove Data Cartridge")
-- AJS37:definePushButton("MISSILE_SELECT_BUTTON", 18, 3000, 400, "Engine Panel", "Missile Select Button") -- this appears correct in the luas
AJS37:defineMissileSelectPushButton("MISSILE_SELECT_BUTTON", 2, 3800, 400, "Engine Panel", "Missile Select Button (IR-RB FRAMSTEGN)") -- but this is the one that actually accepts input

--Electric System
AJS37:defineToggleSwitch("GENERATOR", 19, 3002, 207, "Electric System", "Generator")
AJS37:defineToggleSwitch("MAIN_ELECTRIC_POWER", 19, 3001, 203, "Electric System", "Main Electric Power")
AJS37:defineToggleSwitch("BACKUP_GENERATOR", 19, 3003, 312, "Electric System", "Backup Generator")

--Radar Altimeter
AJS37:defineToggleSwitch("RADAR_ALTIMETER_POWER", 20, 3002, 283, "Radar Altimeter", "Radar Altimeter Power")

--Doppler
AJS37:defineToggleSwitch("DOPPLER_LAND_SEA_MODE", 21, 3001, 213, "Doppler", "Doppler Land/Sea Mode")

--Flight Data Unit
AJS37:defineToggleSwitch("GEAR_HANDLE", 22, 3719, 12, "Flight Data Unit", "Gear Handle")
AJS37:definePushButton("SPAK", 22, 3301, 401, "Flight Data Unit", "SPAK")
AJS37:definePushButton("ATTITUDE_HOLD", 22, 3302, 402, "Flight Data Unit", "Attitude Hold")
AJS37:definePushButton("ALTITUDE_HOLD", 22, 3303, 403, "Flight Data Unit", "Altitude Hold")
AJS37:defineTumb("TILS_CHANNEL_SELECT", 22, 3512, 282, 0.1, { 0, 1 }, nil, false, "Flight Data Unit", "TILS Channel Selection")
AJS37:defineToggleSwitch("TILS_CHANNEL_LAYER", 22, 3511, 285, "Flight Data Unit", "TILS Channel Layer Selection")
AJS37:defineToggleSwitch("EJECTION_SEAT_ARM", 22, 3405, 21, "Flight Data Unit", "Ejection Seat Arm")
AJS37:defineToggleSwitch("SLAV_SI", 22, 3201, 323, "Flight Data Unit", "Slav SI")
AJS37:defineToggleSwitch("HOJD_CISI", 22, 3097, 324, "Flight Data Unit", "HOJD CISI")
AJS37:defineRotary("BACKUP_ALT_SETTING", 22, 3721, 126, "Flight Data Unit", "Backup Altimeter Setting")
AJS37:defineToggleSwitch("PITCH_GEAR_MODE", 22, 3210, 311, "Flight Data Unit", "Pitch Gear Automatic/Landing")
AJS37:defineToggleSwitch("OXYGEN_LEVER", 22, 3718, 176, "Flight Data Unit", "Oxygen Lever")
AJS37:define3PosTumb("CANOPY_OPEN_CLOSE", 22, 3406, 9, "Flight Data Unit", "Canopy Open/Close")
AJS37:definePushButton("CANOPY_JETTISON", 22, 3407, 210, "Flight Data Unit", "Canopy Jettison")
AJS37:definePushButton("COUNTERMEASURE_FAST_RELEASE", 22, 3001, 184, "Flight Data Unit", "Countermeasure Fast Release")
AJS37:defineToggleSwitch("EMERGENCY_ROLL_TRIM", 22, 3716, 390, "Flight Data Unit", "Emergency Roll Trim")
AJS37:defineToggleSwitch("EMERGENCY_PITCH_TRIM", 22, 3717, 389, "Flight Data Unit", "Emergency Pitch Trim")
AJS37:defineToggleSwitch("EMERGENCY_YAW_TRIM", 22, 3918, 388, "Flight Data Unit", "Emergency Yaw Trim")
AJS37:defineToggleSwitch("MAG_DEC_COVER", 22, 3742, 1200, "Flight Data Unit", "Magnetic Declination Cover")
AJS37:defineToggleSwitch("AUTO_YAW_TRIM_COVER", 22, 3741, 493, "Flight Data Unit", "Autopilot Yaw Trim Cover")
AJS37:defineToggleSwitch("PARKING_BRAKE", 22, 3408, 22, "Flight Data Unit", "Parking Brake")
AJS37:defineToggleSwitchToggleOnly("HUD_GLASS_POSITION", 22, 3401, 11, "Flight Data Unit", "HUD Reflector Glass Position")
-- AJS37:defineToggleSwitchToggleOnly("AFK_MODE_3", 22, 3402, 464, "Flight Data Unit", "AFK Mode 3") -- duplicate
AJS37:reserveIntValue(1)
AJS37:defineToggleSwitchToggleOnly("AFK_15_DEG_MODE", 22, 3402, 464, "Flight Data Unit", "AFK 15 Deg Mode")
AJS37:defineTumb("MASTER_MODE_SELECT", 22, 3107, 209, 0.16666667, { 0, 1 }, nil, false, "Flight Data Unit", "Master Mode Selector")

--Navigation Panel
AJS37:defineTumb("DATAPANEL_SELECTOR", 23, 3009, 200, 0.1, { 0.0, 0.6 }, nil, false, "Navigation Panel", "Datapanel Selector")
AJS37:defineToggleSwitch("DATA_IN_OUT", 23, 3008, 201, "Navigation Panel", "Data In/Out")
AJS37:defineToggleSwitch("RENSA_BUTTON_COVER", 23, 3101, 300, "Navigation Panel", "Rensa Button Cover")
AJS37:definePushButton("CK37_RENSA_CLEAR", 23, 3001, 301, "Navigation Panel", "CK37 Rensa Clear")

--RWR
AJS37:defineTumb("RADAR_WARN_SELECT", 24, 3004, 321, 0.1, { 0, 0.2 }, nil, false, "RWR", "Radar Warning Indication Selector")

--Warning Panel
AJS37:definePushButton("WARNING_PANEL_TEST", 26, 3002, 344, "Warning Panel", "Warning Panel Light Test")
AJS37:definePushButton("INDICATOR_SYSTEM_TEST", 26, 3004, 315, "Warning Panel", "Indicator System Test")
AJS37:definePushButton("MASTER_CAUTION_RESET", 26, 3001, 446, "Warning Panel", "Master Caution Reset")

--Countermeasures
AJS37:defineTumb("JAMMER_MODE_SELECTOR", 28, 3024, 317, 0.1, { 0, 0.4 }, nil, false, "Countermeasures", "Jammer Mode Selector")
AJS37:defineTumb("JAMMER_BAND_SELECTOR", 28, 3025, 318, 0.1, { 0, 0.4 }, nil, false, "Countermeasures", "Jammer Band Selector")
AJS37:defineTumb("COUNTERMEASURE_MODE_SELECTOR", 28, 3026, 319, 0.1, { 0, 0.4 }, nil, false, "Countermeasures", "Countermeasure Operation Mode Selector")
AJS37:defineTumb("COUNTERMEASURE_STREAK_MODE_SELECTOR", 28, 3027, 320, 0.1, { 0.0, 0.1 }, nil, false, "Countermeasures", "Countermeasure Streak Mode Selector")
AJS37:defineTumb("COUNTERMEASURE_CHAFF_FLARES_SELECTOR", 28, 3028, 322, 0.1, { 0, 0.2 }, nil, false, "Countermeasures", "Countermeasure Chaff/Flares Selector")
AJS37:define3PosTumb("COUNTERMEASURE_RELEASE_MODE", 22, 3001, 184, "Countermeasures", "Countermeasure Release Mode") --3030

--FR22 Radio
AJS37:defineRotary("FR22_INNER_LEFT_KNOB", 30, 3003, 172, "FR22 Radio", "Radio Frequency Knob Inner Left")
AJS37:defineRotary("FR22_OUTER_LEFT_KNOB", 30, 3004, 171, "FR22 Radio", "Radio Frequency Knob Outer Left")
AJS37:defineRotary("FR22_INNER_RIGHT_KNOB", 30, 3005, 174, "FR22 Radio", "Radio Frequency Knob Inner Right")
AJS37:defineRotary("FR22_OUTER_RIGHT_KNOB", 30, 3006, 173, "FR22 Radio", "Radio Frequency Knob Outer Right")
AJS37:defineToggleSwitch("FR22_SET_MODULATION", 30, 3014, 170, "FR22 Radio", "Radio Manual Frequency Setting Modulation")

--Raw Gauge Values
AJS37:defineFloat("STICK_PITCH", 2, { -1, 1 }, "Raw Gauge Values", "Stick Pitch")
AJS37:defineFloat("STICK_ROLL", 3, { -1, 1 }, "Raw Gauge Values", "Stick Roll")
AJS37:defineFloat("PEDALS", 4, { -1, 1 }, "Raw Gauge Values", "Pedals")
AJS37:defineFloat("THROTTLE", 5, { 0, 1 }, "Raw Gauge Values", "Throttle")
AJS37:defineFloat("ENGINE_RPM_100", 139, { -1, 1 }, "Raw Gauge Values", "Engine RPM 100")
AJS37:defineFloat("ENGINE_RPM_10", 140, { 0, 1 }, "Raw Gauge Values", "Engine RPM 10")
AJS37:defineFloat("ENGINE_TEMP", 146, { 0, 1 }, "Raw Gauge Values", "Engine Temp")
AJS37:defineFloat("AIRSPEED_MS", 100, { 0, 1 }, "Raw Gauge Values", "Airspeed m/s")
AJS37:defineFloat("MACH_METER_INTEGER", 101, { 0, 1 }, "Raw Gauge Values", "Mach Meter Integer X.00")
AJS37:defineFloat("MACH_METER_FIRST_DECIMAL", 102, { 0, 1 }, "Raw Gauge Values", "Mach Meter First Decimal 0.X0")
AJS37:defineFloat("MACH_METER_SECOND_DECIMAL", 103, { 0, 1 }, "Raw Gauge Values", "Mach Meter Second Decimal 0.0X")
AJS37:defineFloat("VERTICAL_ACCELERATION", 136, { -0.4, 1 }, "Raw Gauge Values", "Vertical Acceleration G Meter")
AJS37:defineFloat("ALTIMETER_10000M", 114, { 0, 1 }, "Raw Gauge Values", "Altimeter 10000 Meter")
AJS37:defineFloat("ALTIMETER_1000M", 113, { 0, 1 }, "Raw Gauge Values", "Altimeter 1000 Meter")
AJS37:defineFloat("ALTIMETER_BARO_1_HPA", 115, { 0, 1 }, "Raw Gauge Values", "Altimeter Baro 1 hPa 000X")
AJS37:defineFloat("ALTIMETER_BARO_10_HPA", 116, { 0, 1 }, "Raw Gauge Values", "Altimeter Baro 10 hPa 00X0")
AJS37:defineFloat("ALTIMETER_BARO_100_HPA", 117, { 0, 1 }, "Raw Gauge Values", "Altimeter Baro 100 hPa 0X00")
AJS37:defineFloat("ALTIMETER_BARO_1000_HPA", 118, { 0, 1 }, "Raw Gauge Values", "Altimeter Baro 1000 hPa X000")
AJS37:defineFloat("ADI_PITCH", 105, { 1, -1 }, "Raw Gauge Values", "ADI Pitch")
AJS37:defineFloat("ADI_HEADING", 106, { 1, -1 }, "Raw Gauge Values", "ADI Heading")
AJS37:defineFloat("ADI_ROLL", 107, { -1, 1 }, "Raw Gauge Values", "ADI Roll")
AJS37:defineFloat("ADI_VERTICAL_VELOCITY", 108, { -1, 1 }, "Raw Gauge Values", "ADI Vertical Velocity")
AJS37:defineFloat("ADI_VERTICAL_ILS", 109, { 1, -1 }, "Raw Gauge Values", "ADI Vertical ILS")
AJS37:defineFloat("ADI_HORIZONTAL_ILS", 110, { 1, -1 }, "Raw Gauge Values", "ADI Horizontal ILS")
AJS37:defineFloat("ADI_SLIPBALL", 1810, { -1, 1 }, "Raw Gauge Values", "ADI Slipball")
AJS37:defineFloat("ENGINE_NOZZLE", 147, { 0, 1 }, "Raw Gauge Values", "Engine Nozzle")
AJS37:defineFloat("CI_HEADING", 128, { 1, -1 }, "Raw Gauge Values", "CI Heading")
AJS37:defineFloat("CI_COMMANDED_HEADING", 129, { 1, 0 }, "Raw Gauge Values", "CI Commanded Heading")
AJS37:defineFloat("MAGNETIC_HEADING", 127, { 1, -1 }, "Raw Gauge Values", "Magnetic Heading")
AJS37:defineFloat("BACKUP_INDICATED_AIRSPEED", 138, { 0, 1 }, "Raw Gauge Values", "Backup Indicated Airspeed")
AJS37:defineFloat("BACKUP_ALTIMETER_10000M", 125, { 0, 1 }, "Raw Gauge Values", "Backup Altimeter 10000 Meter")
AJS37:defineFloat("BACKUP_ALTIMETER_1000M", 124, { 0, 1 }, "Raw Gauge Values", "Backup Altimeter 1000 Meter")
AJS37:defineFloat("BACKUP_PITCH", 121, { 1, -1 }, "Raw Gauge Values", "Backup ADI Pitch")
AJS37:defineFloat("BACKUP_ROLL", 122, { 1, -1 }, "Raw Gauge Values", "Backup ADI Roll")
AJS37:defineFloat("DISTANCE_INDICATOR", 142, { 0, 1 }, "Raw Gauge Values", "Distance Indicator")
AJS37:defineFloat("FUEL_LEVEL", 144, { 0, 1 }, "Raw Gauge Values", "Fuel Level")
AJS37:defineFloat("FUEL_NEEDED", 145, { 0, 1 }, "Raw Gauge Values", "Fuel Needed")
AJS37:defineIndicatorLight("SPAK_LAMP", 401, "Indicator Lights", "SPAK Lamp")
AJS37:defineIndicatorLight("ATT_LAMP", 402, "Indicator Lights", "ATT Lamp")
AJS37:defineIndicatorLight("HOJD_LAMP", 403, "Indicator Lights", "HOJD Lamp")

--Error Panel Indicators
AJS37:defineIndicatorLight("BRAND_1", 406, "Error Panel", "Engine Fire 1 (red)")
AJS37:defineIndicatorLight("BRAND_2", 407, "Error Panel", "Engine Fire 2 (red)")
AJS37:defineIndicatorLight("BRA_UPPF", 408, "Error Panel", "Fuel Distribution Low Pressure (yellow)")
AJS37:defineIndicatorLight("X_TANK_BRA", 409, "Error Panel", "External Fuel Tank Feed System (yellow)")
AJS37:defineIndicatorLight("TANK_PUMP", 410, "Error Panel", "Fuel Pump (yellow)")
AJS37:defineIndicatorLight("LANDSTALL", 411, "Error Panel", "Landing Gear (yellow)")
AJS37:defineIndicatorLight("FORV_FORB", 412, "Error Panel", "Thrust Reverser Warning (red)")
AJS37:defineIndicatorLight("NOSSTALL", 413, "Error Panel", "Nose Gear (green)")
AJS37:defineIndicatorLight("VSTALL", 414, "Error Panel", "Left Gear (green)")
AJS37:defineIndicatorLight("HSTALL", 415, "Error Panel", "Right Gear (green)")
AJS37:defineIndicatorLight("TIPPVAXEL", 416, "Error Panel", "Pitch Gearing (red)")
AJS37:defineIndicatorLight("ELFEL", 417, "Error Panel", "Electrical System (red)")
AJS37:defineIndicatorLight("RESERVEFF", 418, "Error Panel", "Backup Hydraulic (red)")
AJS37:defineIndicatorLight("HYDRA_TA_2", 419, "Error Panel", "Hydraulic System 2 Pressure (red)")
AJS37:defineIndicatorLight("HYDRA_TA_1", 420, "Error Panel", "Hydraulic System 1 Pressure (red)")
AJS37:defineIndicatorLight("AFK_FEL", 421, "Error Panel", "Autothrottle (red)")
AJS37:defineIndicatorLight("EJ_REV", 422, "Error Panel", "Thrust Reverser Inoperable (red)")
AJS37:defineIndicatorLight("OLJETRYCK", 423, "Error Panel", "Oil Pressure (red)")
AJS37:defineIndicatorLight("SPAK_ERROR", 424, "Error Panel", "SPAK Error (yellow)")
AJS37:defineIndicatorLight("HALL_FUNK", 425, "Error Panel", "Autopilot Hold (yellow)")
AJS37:defineIndicatorLight("RHM_FEL", 426, "Error Panel", "Radar Altimeter (yellow)")
AJS37:defineIndicatorLight("ROLL_VAXEL", 427, "Error Panel", "Roll Gearing (yellow)")
AJS37:defineIndicatorLight("CK", 428, "Error Panel", "Computer (yellow)")
AJS37:defineIndicatorLight("KABINHOJD", 429, "Error Panel", "Cabin Pressure (yellow)")
AJS37:defineIndicatorLight("HUV_O_STOL", 430, "Error Panel", "Ejection Seat/Canopy (yellow)")
AJS37:defineIndicatorLight("TANDSYST", 431, "Error Panel", "Ignition System (yellow)")
AJS37:defineIndicatorLight("STARTSYST", 432, "Error Panel", "Starter System (yellow)")
AJS37:defineIndicatorLight("MAN_BG_REG", 433, "Error Panel", "Manual Fuel Regulator (yellow)")
AJS37:defineIndicatorLight("SYRGAS", 434, "Error Panel", "Oxygen (yellow)")
AJS37:defineIndicatorLight("BRA_24", 435, "Error Panel", "Low Fuel (yellow)")
AJS37:defineIndicatorLight("BRAND_GTS", 436, "Error Panel", "Turbine Starter Fire (red)")
AJS37:defineIndicatorLight("TILS", 437, "Error Panel", "TILS (green)")
AJS37:defineIndicatorLight("NAV_SYST", 438, "Error Panel", "Navigation System (yellow)")
AJS37:defineIndicatorLight("KB_V_SLUT", 439, "Error Panel", "Left Countermeasures Pod Empty (yellow)")
AJS37:defineIndicatorLight("KB_H_KA_SL", 440, "Error Panel", "Right Countermeasures Pod Empty/ECM Failure (yellow)")
AJS37:defineIndicatorLight("FACKL_SL", 441, "Error Panel", "Flares Empty (yellow)")
AJS37:defineIndicatorLight("MOTVERK", 442, "Error Panel", "Countermeasures/RWR (yellow)")
AJS37:defineIndicatorLight("LUFTBROMS", 443, "Error Panel", "Airbrakes (green)")

AJS37:defineGaugeValue("ENGINE_RPM_VALUE", 139, { 55, 110 }, "Gauge Values", "Engine RPM Value")

AJS37:defineGaugeValue("ENGINE_TEMP_VALUE", 146, { 100, 800 }, "Gauge Values", "Engine Temp Value")

---@param dev0 CockpitDevice
---@return integer
local function getAirspeed(dev0)
	local value = dev0:get_argument_value(100)
	return (-707.23 * value ^ 4) + (1843.8 * value ^ 3) - (647.84 * value ^ 2) + (810.63 * value) + 100.03
end
AJS37:defineIntegerFromGetter("AIRSPEED_VALUE", getAirspeed, 65000, "Gauge Values", "Airspeed Value")

AJS37:defineGaugeValue("ALTITUDE_VALUE", 114, { 0, 10000 }, "Gauge Values", "Altitude Value (up to 10K ft)")

AJS37:defineGaugeValue("FUEL_LEVEL_VALUE", 144, { 0, 135 }, "Gauge Values", "Fuel Level Value")

AJS37:defineGaugeValue("FUEL_NEEDED_VALUE", 145, { 0, 135 }, "Gauge Values", "Fuel Needed Value")

---@param dev0 CockpitDevice
---@return integer
local function getCIHDG(dev0)
	local arg_value = dev0:get_argument_value(128)
	if arg_value <= 0 then
		arg_value = arg_value + 2
	end
	return arg_value * 180
end
AJS37:defineIntegerFromGetter("CI_HEADING_VALUE", getCIHDG, 65000, "Gauge Values", "CI Heading Value")

AJS37:defineGaugeValue("CI_COMMAND_HEADING_VALUE", 129, { 0, 360 }, "Gauge Values", "CI Commanded Heading Value")

--Externals
AJS37:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_RIGHT", 184, "External Aircraft Model", "Right Speed Brake")
AJS37:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_LEFT", 186, "External Aircraft Model", "Left Speed Brake")

AJS37:defineBitFromDrawArgument("EXT_POSITION_LIGHTS", 190, "External Aircraft Model", "Position Lights")
AJS37:defineBitFromDrawArgument("EXT_NAV_LIGHTS_WING", 191, "External Aircraft Model", "Navigation Lights Wing")
AJS37:defineBitFromDrawArgument("EXT_NAV_LIGHTS_TAIL", 192, "External Aircraft Model", "Navigation Lights Tail")

AJS37:defineBitFromDrawArgument("EXT_STROBE_LIGHTS", 811, "External Aircraft Model", "Strobe Lights")
AJS37:defineBitFromDrawArgument("EXT_FORMATION_LIGHTS", 812, "External Aircraft Model", "Formation Lights")

AJS37:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
AJS37:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
AJS37:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

AJS37:definePushButton("MAX_G_RESET", 22, 3722, 175, "Flight Data Unit", "Max G Reset")
AJS37:definePushButton("BACK_ADI_CAGE", 22, 3720, 3402, "Flight Data Unit", "Backup ADI Cage")
AJS37:definePushButton("ROLL_CENTER", 22, 3305, 2003, "Flight Data Unit", "Roll Trim Reset / Centre")
AJS37:defineRotary("ALT_SET_ROT", 22, 3306, 2009, "Flight Data Unit", "Altimeter Setting (Rotary)")
AJS37:defineRotary("HUD_BRIGHT", 22, 3409, 9999, "Flight Data Unit", "HUD Brightness Knob")
AJS37:defineRotary("MAG_CORRECTION", 22, 3724, 1201, "Flight Data Unit", "Magnetic Declination Correction")
AJS37:definePotentiometer("AUTO_YAW_TRIM", 22, 3732, 211, { -1, 1 }, "Flight Data Unit", "Autopilot Yaw Trim")
AJS37:defineRotary("CLOCK_SET", 22, 3801, 135, "Flight Data Unit", "Clock Setting")

AJS37:definePushButton("FR22_FLIGHT_0", 30, 3210, 372, "FR22 Radio", "Flight 0")
AJS37:definePushButton("FR22_FLIGHT_1", 30, 3211, 373, "FR22 Radio", "Flight 1")
AJS37:definePushButton("FR22_FLIGHT_2", 30, 3212, 374, "FR22 Radio", "Flight 2")
AJS37:definePushButton("FR22_FLIGHT_3", 30, 3213, 375, "FR22 Radio", "Flight 3")
AJS37:definePushButton("FR22_FLIGHT_4", 30, 3214, 376, "FR22 Radio", "Flight 4")
AJS37:definePushButton("FR22_FLIGHT_5", 30, 3215, 377, "FR22 Radio", "Flight 5")
AJS37:definePushButton("FR22_FLIGHT_6", 30, 3216, 378, "FR22 Radio", "Flight 6")
AJS37:definePushButton("FR22_FLIGHT_7", 30, 3217, 379, "FR22 Radio", "Flight 7")
AJS37:definePushButton("FR22_FLIGHT_8", 30, 3218, 380, "FR22 Radio", "Flight 8")
AJS37:definePushButton("FR22_FLIGHT_9", 30, 3219, 381, "FR22 Radio", "Flight 9")
AJS37:definePushButton("FR22_CHANNEL_H", 30, 3200, 362, "FR22 Radio", "Channel H")
AJS37:definePushButton("FR22_SPECIAL_1", 30, 3201, 363, "FR22 Radio", "Special 1")
AJS37:definePushButton("FR22_SPECIAL_2", 30, 3202, 364, "FR22 Radio", "Special 2")
AJS37:definePushButton("FR22_SPECIAL_3", 30, 3203, 365, "FR22 Radio", "Special 3")
AJS37:definePushButton("FR22_MINUS", 30, 3204, 366, "FR22 Radio", "Minus")
AJS37:definePushButton("FR22_CHANNEL_AG", 30, 3205, 367, "FR22 Radio", "Channel A/G")
AJS37:definePushButton("FR22_CHANNEL_B", 30, 3206, 368, "FR22 Radio", "Channel B")
AJS37:definePushButton("FR22_CHANNEL_CF", 30, 3207, 369, "FR22 Radio", "Channel C/F")
AJS37:definePushButton("FR22_CHANNEL_C2", 30, 3208, 370, "FR22 Radio", "Channel C2")
AJS37:definePushButton("FR22_CHANNEL_DE", 30, 3209, 371, "FR22 Radio", "Channel D/E")
AJS37:definePushButton("FR22_GROUND_COM", 30, 3011, 382, "FR22 Radio", "Ground Intercom")
AJS37:defineTumb("FR24_MODE", 30, 3110, 386, 0.1, { 0.0, 0.5 }, nil, false, "FR22 Radio", "FR24 Mode Selector")
-- AJS37:defineTumb("FR22_BASE", 30, 3230, 492, 0.05, { 0, 1 }, nil, false, "FR22 Radio", "FR22 Base Selector")
AJS37:reserveIntValue(20) -- corrected control requires more space, so reserve this space and add corrected control to the end
-- AJS37:defineTumb("FR22_GROUP", 30, 3307, 360, 0.1, { 0, 1 }, nil, false, "FR22 Radio", "FR22 Group Selector")
AJS37:reserveIntValue(10) -- corrected control requires more space, so reserve this space and add corrected control to the end
AJS37:defineRotary("FR22_VOL", 21, 3112, 385, "FR22 Radio", "Radio Volume")

AJS37:defineToggleSwitch("IFF_POWER", 18, 3001, 1203, "Radar", "IFF Power")
AJS37:defineTumb("IFF_CODE", 18, 3000, 308, 0.1, { 0, 1 }, nil, false, "Radar", "IFF Code")
AJS37:definePotentiometer("DE_ICE", 18, 3912, 286, { 0, 1 }, "Engine Panel", "Windscreen De-Ice")
AJS37:defineRotary("TEST_MODE", 18, 3913, 675, "Engine Panel", "Maintenance Testing Mode")
AJS37:defineRotary("DRYSUIT", 18, 3917, 396, "Engine Panel", "Drysuit Ventilation Adjustment")
AJS37:defineToggleSwitch("CABIN_AIR_VALVE", 18, 3000, 398, "Engine Panel", "Cabin Air Valve")

AJS37:definePotentiometer("MASTER_VOL", 24, 3006, 399, { 0, 1 }, "RWR", "Master Volume / Sidewinder Tone")
AJS37:definePotentiometer("RADAR_BRIGHT", 5, 3923, 391, { 0, 1 }, "Radar", "Radar Brightness")
AJS37:definePushButton("STOPWATCH_START_STOP", 25, 3802, 134, "Flight Data Unit", "Stopwatch Start/Stop/Reset")

AJS37:definePotentiometer("EP13_BRIGHT", 2, 3318, 6901, { 0, 1 }, "Weapon System", "EP-13 Brightness")
AJS37:definePotentiometer("EP13_CONTR", 2, 3319, 6902, { 0, 1 }, "Weapon System", "EP-13 Contrast")
AJS37:definePotentiometer("CI_FILTER", 5, 3801, 6905, { 0, 1 }, "Radar", "CI filter")

--found no argument
-- AJS37:definePushButton("MISL_SEL_BTN", 2, 3800, 400, "Test", "Missile Select Button (IR-RB FRAMSTEGN)")
AJS37:reserveIntValue(1) -- above control duplicated by "MISSILE_SELECT_BUTTON"

-- parse nav  indicator
local nav_data = {}
AJS37:addExportHook(function()
	nav_data = Module.parse_indication(2)
end)

AJS37:defineString("AJS37_NAV_INDICATOR_DATA_1", function()
	return Functions.coerce_nil_to_string(nav_data["data1"])
end, 1, "Navigation Panel", "Navigation Panel Data Digit 1")
AJS37:defineString("AJS37_NAV_INDICATOR_DATA_2", function()
	return Functions.coerce_nil_to_string(nav_data["data2"])
end, 1, "Navigation Panel", "Navigation Panel Data Digit 2")
AJS37:defineString("AJS37_NAV_INDICATOR_DATA_3", function()
	return Functions.coerce_nil_to_string(nav_data["data3"])
end, 1, "Navigation Panel", "Navigation Panel Data Digit 3")
AJS37:defineString("AJS37_NAV_INDICATOR_DATA_4", function()
	return Functions.coerce_nil_to_string(nav_data["data4"])
end, 1, "Navigation Panel", "Navigation Panel Data Digit 4")
AJS37:defineString("AJS37_NAV_INDICATOR_DATA_5", function()
	return Functions.coerce_nil_to_string(nav_data["data5"])
end, 1, "Navigation Panel", "Navigation Panel Data Digit 5")
AJS37:defineString("AJS37_NAV_INDICATOR_DATA_6", function()
	return Functions.coerce_nil_to_string(nav_data["data6"])
end, 1, "Navigation Panel", "Navigation Panel Data Digit 6")

AJS37:defineIndicatorLight("HUVUDVARNING_L", 444, "Front Panel Lights", "Master Caution Light left (red)")
AJS37:defineIndicatorLight("HUVUDVARNING_R", 445, "Front Panel Lights", "Master Caution Light right (red)")

-- parse dest indicator
local dest_data = {}
AJS37:addExportHook(function()
	dest_data = Module.parse_indication(1)
end)

AJS37:defineString("AJS37_DEST_INDICATOR_DATA_1", function()
	return Functions.coerce_nil_to_string(dest_data["Dest1"])
end, 1, "Destination", "Destination Data Digit 1")
AJS37:defineString("AJS37_DEST_INDICATOR_DATA_2", function()
	return Functions.coerce_nil_to_string(dest_data["Dest2"])
end, 1, "Destination", "Destination Data Digit 2")

AJS37:defineIndicatorLight("ALT_WARNING_LAMP", 450, "Front Panel Lights", "Altitude Warning Lamp (red)")
AJS37:defineIndicatorLight("FALLD_LAST_LAMP", 461, "Front Panel Lights", "Falld Last (Stores Released) Lamp (red)")
AJS37:defineIndicatorLight("REV_TRANSONIC_LAMP", 462, "Front Panel Lights", "Revadvr Transonic Lamp (red)")
AJS37:defineIndicatorLight("AFK_ENABLED_L", 463, "Front Panel Lights", "AFK Enabled Lamp (red)")
AJS37:defineIndicatorLight("AOA_15_L", 464, "Front Panel Lights", "AOA 15deg Lamp (white)")
AJS37:defineIndicatorLight("RDR_UR_L", 451, "Front Panel Lights", "Radar Display upper/right Lamp (white)")
AJS37:defineIndicatorLight("RDR_R_L", 452, "Front Panel Lights", "Radar Display right Lamp (white)")
AJS37:defineIndicatorLight("RDR_LR_L", 453, "Front Panel Lights", "Radar Display lower/right Lamp (white)")
AJS37:defineIndicatorLight("RDR_LL_L", 454, "Front Panel Lights", "Radar Display lower/left Lamp (white)")
AJS37:defineIndicatorLight("RDR_L_L", 455, "Front Panel Lights", "Radar Display left Lamp (white)")
AJS37:defineIndicatorLight("RDR_UL_L", 456, "Front Panel Lights", "Radar Display upper/left Lamp (white)")
AJS37:defineIndicatorLight("REVERSAL_L", 460, "Front Panel Lights", "Thrust Reverser Light (green)")
AJS37:defineGatedIndicatorLight("BURNER_STAGE1_L", 405, 0.3, nil, "Front Panel Lights", "Afterburner Stage 1 Lamp (white)")
AJS37:defineGatedIndicatorLight("BURNER_STAGE2_L", 405, 0.6, nil, "Front Panel Lights", "Afterburner Stage 2 Lamp (white)")
AJS37:defineGatedIndicatorLight("BURNER_STAGE3_L", 405, 0.9, nil, "Front Panel Lights", "Afterburner Stage 3 Lamp (white)")
AJS37:definePushButton("SNABBRESNING", 22, 3091, 0, "Radar", "Snabbresning") --No Arg left bottom radar display
AJS37:define3PosTumb("SEAT_HEIGHT", 22, 3404, 212, "Flight Data Unit", "Seat Height Adjustment")
AJS37:definePotentiometer("AIRSPEED_INDEXER", 22, 3410, 104, { 0, 1 }, "Flight Data Unit", "Airspeed Indexer")
AJS37:defineToggleSwitch("BYPASS_FIRE_COVER", 2, 3308, 309, "Weapon System", "Bypass Firing Circuit Cover")
AJS37:definePushButton("BYPASS_FIRE_BTN", 2, 3309, 397, "Weapon System", "Bypass Firing Circuit Button")
AJS37:definePotentiometer("RADAR_GAIN", 5, 3325, 152, { -1, 1 }, "Radar", "Radar Gain (MKR)")
AJS37:definePushButton("RADAR_MEMORY_MODE", 5, 3212, 153, "Radar", "Radar Memory Mode")
AJS37:define3PosTumb("RADAR_MODE_SEL", 23, 3002, 215, "Radar", "Radar Mode Selector")
AJS37:define3PosTumb("RADAR_RANGE_SEL", 5, 3323, 156, "Radar", "Radar Range Selector")
AJS37:definePotentiometer("RADAR_ANT_ELEVATION", 5, 3641, 154, { -1, 1 }, "Radar", "Radar Antenna Elevation")
AJS37:definePushButton("RADAR_TERRAIN_MODE", 5, 3213, 155, "Radar", "Radar Terrain Avoidance Mode")
AJS37:defineToggleSwitch("ALT_SET_PUSH", 22, 3715, 119, "Flight Data Unit", "Altimeter Setting (Push)")
AJS37:defineRotary("ALT_SET_TURN", 22, 3306, 123, "Flight Data Unit", "Altimeter Setting (Turn)")
AJS37:defineToggleSwitch("TOGGLE_MIRRORS", 0, 1625, 0, "Cockpit", "Toggle Mirrors")
AJS37:defineFloat("CANOPY_POS", 10, { 0, 1 }, "Cockpit", "Canopy Position")
AJS37:defineFloat("ADI_AOA_INDICATOR", 120, { 0, 1 }, "Raw Gauge Values", "ADI AoA Indicator")
AJS37:defineFloat("ADI_OFF_FLAG", 160, { 0, 1 }, "Raw Gauge Values", "ADI OFF Flag")
AJS37:defineFloat("VERTICAL_ACCELERATION_MAX", 137, { -0.4, 1 }, "Raw Gauge Values", "Max Vertical Acceleration G Meter")
AJS37:defineFloat("DISTANCE_INDICATOR_UNIT", 143, { 0, 1 }, "Raw Gauge Values", "Distance Indicator Unit KM/MILS")
AJS37:defineFloat("EPR_INDICATOR", 141, { 0, 1 }, "Raw Gauge Values", "EPR Indicator")
AJS37:defineFloat("OXY_PRESS_INDICATOR", 148, { 0, 1 }, "Raw Gauge Values", "Oxygen Pressure Indicator")
AJS37:defineFloat("CABIN_PRESS_INDICATOR", 149, { 0, 1 }, "Raw Gauge Values", "Cabin Pressure Indicator")
AJS37:defineFloat("BRAKE_PRESS_INDICATOR", 150, { 0, 1 }, "Raw Gauge Values", "Brake Pressure Indicator")
AJS37:defineFloat("PITCH_TRIM_INDICATOR", 151, { -1, 1 }, "Raw Gauge Values", "Pitch Trim Indicator")
AJS37:defineFloat("CI_OFF_FLAG", 163, { 0, 1 }, "Raw Gauge Values", "CI OFF Flag")
AJS37:defineFloat("BACKUP_OFF_FLAG", 164, { 0, 1 }, "Raw Gauge Values", "Backup ADI OFF Flag")
AJS37:defineFloat("ALTIMETER_STD_FLAG", 165, { 0, 1 }, "Raw Gauge Values", "Altimeter STD Flag")
AJS37:defineFloat("ALTIMETER_OFF_FLAG", 2008, { 0, 1 }, "Raw Gauge Values", "Altimeter OFF Flag")
AJS37:defineFloat("AIRSPEED_OFF_FLAG", 2007, { 0, 1 }, "Raw Gauge Values", "Airspeed OFF Flag")
AJS37:defineFloat("FR22_DRUM_100000", 177, { 0, 1 }, "FR22 Radio Gauges", "Radio Frequency 100000")
AJS37:defineFloat("FR22_DRUM_10000", 178, { 0, 1 }, "FR22 Radio Gauges", "Radio Frequency 10000")
AJS37:defineFloat("FR22_DRUM_1000", 179, { 0, 1 }, "FR22 Radio Gauges", "Radio Frequency 1000")
AJS37:defineFloat("FR22_DRUM_100", 180, { 0, 1 }, "FR22 Radio Gauges", "Radio Frequency 100")
AJS37:defineFloat("FR22_DRUM_10", 181, { 0, 1 }, "FR22 Radio Gauges", "Radio Frequency 10")
AJS37:defineFloat("FR22_DRUM_1", 182, { 0, 1 }, "FR22 Radio Gauges", "Radio Frequency 1")
AJS37:defineFloat("BACKUP_ALTIMETER_DRUM_1000", 465, { 0, 1 }, "Raw Gauge Values", "Backup Altimeter Drum 1000")
AJS37:defineFloat("BACKUP_ALTIMETER_DRUM_100", 466, { 0, 1 }, "Raw Gauge Values", "Backup Altimeter Drum 100")
AJS37:defineFloat("BACKUP_ALTIMETER_DRUM_10", 467, { 0, 1 }, "Raw Gauge Values", "Backup Altimeter Drum 10")
AJS37:defineFloat("BACKUP_ALTIMETER_DRUM_1", 468, { 0, 1 }, "Raw Gauge Values", "Backup Altimeter Drum 1")
AJS37:defineFloat("CI_BRIGHT", 3001, { 0, 1 }, "Indicator Lights", "CI Light Brightness")
AJS37:defineFloat("PANEL_BRIGHT", 3400, { 0, 1 }, "Indicator Lights", "Panel Light Brightness")
AJS37:defineFloat("FLOOD_BRIGHT", 3401, { 0, 1 }, "Indicator Lights", "Flood Light Brightness")
AJS37:defineFloat("CONSOLE_BRIGHT", 3402, { 0, 1 }, "Indicator Lights", "Console Light Brightness")

local base_output_map = {
	" -- ",
	" 01 ",
	" 02 ",
	" 03 ",
	" 04 ",
	" 05 ",
	"ALLM",
	" 06 ",
	" 07 ",
	" 08 ",
	" 09 ",
	" 10 ",
	"ALLM",
	" 11 ",
	" 12 ",
	" 13 ",
	" 14 ",
	" 15 ",
	"ALLM",
	" 16 ",
	" 17 ",
	" 18 ",
	" 19 ",
	" 20 ",
	"ALLM",
	" 21 ",
	" 22 ",
	" 23 ",
	" 24 ",
	" 25 ",
	"ALLM",
	" 26 ",
	" 27 ",
	" 28 ",
	" 29 ",
	" 30 ",
	"ALLM",
	" 31 ",
	" 32 ",
	" 33 ",
	" 34 ",
	" 35 ",
	"ALLM",
	" 36 ",
	" 37 ",
	" 38 ",
	" 39 ",
	" 40 ",
	"ALLM",
	" 41 ",
	" 42 ",
	" 43 ",
	" 44 ",
	" 45 ",
	"ALLM",
	" 46 ",
	" 47 ",
	" 48 ",
	" 49 ",
	" 50 ",
	"ALLM",
	" 51 ",
	" 52 ",
	" 53 ",
	" 54 ",
	" 55 ",
	"ALLM",
	" 56 ",
	" 57 ",
	" 58 ",
	" 59 ",
	" 60 ",
	"ALLM",
	" 61 ",
	" 62 ",
	" 63 ",
	" 64 ",
	" 65 ",
	"ALLM",
	" 66 ",
	" 67 ",
	" 68 ",
	" 69 ",
	" T1 ",
	" T2 ",
	" -- ",
}

AJS37:defineFixedStepTumb("FR22_BASE", 30, 3230, 492, 1 / 100, { 0, 0.85 }, { -1, 1 }, base_output_map, "FR22 Radio", "FR22 Base Selector")

local group_output_map = { "--", "10", "11", "12", "13", "14", "15", "20", "21", "22", "23", "24", "25", "30", "31", "32", "33", "40", "41", "42", "43", "44", "45", "50", "51", "52", "53", "54", "55", "60", "61", "62", "63", "64", "70", "71", "72", "73", "74", "80", "81", "82", "T3", "--" }

AJS37:defineFixedStepTumb("FR22_GROUP", 30, 3307, 360, 1 / 100, { 0, 0.43 }, { -1, 1 }, group_output_map, "FR22 Radio", "FR22 Group Selector")

return AJS37
