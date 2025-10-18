module("MiG-29A", package.seeall)

local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

--- @class MiG_29A: Module
local MiG_29A = Module:new("MiG-29 Fulcrum", 0x3c00, { "MiG-29 Fulcrum" })

local devices = {
	FM_PROXY = 1,
	SNSR_SYS_INTERFACE = 2,
	ELEC_INTERFACE = 3,
	CONTROL_INTERFACE = 4,
	FUEL_INTERFACE = 5,
	POWER_PLANT_INTERFACE = 6,
	OXYGEN_INTERFACE = 7,
	HEARING_SENS = 8,
	AIR_INTERFACE = 9,
	HYDRO_INTERFACE = 10,
	AFCS_INTERFACE = 11,
	EXTLIGHTS_SYSTEM = 12,
	INTLIGHTS_SYSTEM = 13,
	EKRAN = 14,
	INPUT_PANEL = 15,
	CLOCK = 16,
	BAROMETRIC_ALTIMETER = 17,
	VVI_TURN_SLIP = 18,
	IAS = 19,
	TAS = 20,
	AOA_G_METER = 21,
	HSI = 22,
	ADI = 23,
	COMBINED_PRESSURE = 24,
	BRAKE_PRESSURE = 25,
	FUEL_INDICATOR = 26,
	RPM_INDICATOR = 27,
	EXHAUST_GAS_LEFT = 28,
	EXHAUST_GAS_RIGHT = 29,
	RAMP_POS_INDICATOR = 30,
	VOLTMETER = 31,
	STANDBY_COMPASS = 32,
	RADALT = 33,
	INS = 34,
	HOTAS = 35,
	CPT_MECH = 36,
	HEAD_WRAPPER = 37,
	MUX = 38,
	NAV = 39,
	CP = 40,
	WP = 41,
	DP = 42,
	HMS = 43,
	QOLS = 44,
	RADAR = 45,
	WEAPONS = 46,
	L006LM = 47,
	HMD = 48,
	HUD = 49,
	HDD = 50,
	VHF_UHF_R862 = 51,
	VHF_R855UM = 52,
	MRP = 53,
	ARK = 54,
	RSBN = 55,
	VIWAS = 56,
	INTERCOM = 57,
	MACROS = 58,
	KNEEBOARD = 59,
	CREW_ANIMATION = 60,
	VISOR = 61,
	TRANSPONDER = 62,
	INTERROGATOR = 63,
	SO69 = 64,
}

local function cabinTempSwitchIntValue(arg_value)
	if arg_value < 0.075 then
		return 0
	elseif arg_value < 0.30 then
		return 1
	elseif arg_value < 0.60 then
		return 2
	else
		return 3
	end
end

function MiG_29A:defineCabinTempSwitch(identifier, device_id, arg_number, category, description)
	local alloc = self:allocateInt(3)
	self:addExportHook(function(dev0)
		local val = cabinTempSwitchIntValue(dev0:get_argument_value(arg_number))
		alloc:setValue(val)
	end)

	local control = Control:new(category, ControlType.toggle_switch, identifier, description, {
		SetStateInput:new(3, "set the switch position"),
		FixedStepInput:new("switch to previous or next state"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "switch position -- 0 = Middle, 1 = UP , 2 = LEFT, 3 = RIGHT"),
	})
	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		local currentState = cabinTempSwitchIntValue(GetDevice(0):get_argument_value(arg_number))
		local new_state

		if toState == "INC" then
			if currentState >= 3 then
				return
			end
			new_state = currentState + 1
		elseif toState == "DEC" then
			if currentState <= 0 then
				return
			end
			new_state = currentState - 1
		else
			new_state = tonumber(toState)
		end

		if new_state == 0 then -- OFF
			dev:performClickableAction(3001, 0)
		elseif new_state == 1 then -- AUTO
			dev:performClickableAction(3002, 0.15)
		elseif new_state == 2 then -- HOT
			dev:performClickableAction(3003, 0.45)
		elseif new_state == 3 then -- COLD
			dev:performClickableAction(3004, 0.75)
		end
	end)
end

-- Stick

-- Throttle

-- Pedals

-- Control & Test pannel

-- Electrical power pannel

-- System power pannel

-- Engine & APU start pannel

-- AFT lightning control panel

-- FWD lightning control pane

-- Lights controls (external)

-- AOA

-- Master caution

-- Air speed

-- Altimiter

-- Flaps / Landing gear indicator

-- ADI

-- HSI

-- Combined indicator (VVI/Turn/Slip indicator)

-- TAS indicator

-- Clock

-- ADF mode toggle switch

-- Nose wheel brake

-- Radar altimiter

-- Counter measure pannel

-- Gas temperature meters

-- Fuel flow indicator

-- Combined oxygen indicator

-- Combined pressure indicator

-- Air duct ramp indicator

-- RPM indicator

-- Voltmeter

-- Hydrolique pressure

-- SPO-15 RWR

-- Canopy jettison

-- Canopy indicator

-- Cabine air controls

-- Tally light pannel

-- A-323 Navigation control pannel

-- Lower center console

-- Oxygen system
local O2_SYSTEM = "Oxygen System"

MiG_29A:defineToggleSwitch("OXYGEN_FLOW_VALVE", devices.AIR_INTERFACE, 3017, 106, O2_SYSTEM, "Oxygen Flow Valve")
MiG_29A:defineToggleSwitch("OXYGEN_MIX_SWITCH", devices.AIR_INTERFACE, 3018, 115, O2_SYSTEM, "Oxygen Mixture Switch")
MiG_29A:defineToggleSwitch("OXYGEN_EMERGENCY_SWITCH", devices.AIR_INTERFACE, 3020, 117, O2_SYSTEM, "Oxygen Emergency Switch")
MiG_29A:defineToggleSwitch("OXYGEN_VENT_HELMET_SWITCH", devices.AIR_INTERFACE, 3022, 119, O2_SYSTEM, "Oxygen Vent Helmet Switch")
MiG_29A:defineToggleSwitch("OXYGEN_CABIN_EMERGENCY_DECOMPRESSION_SWITCH", devices.AIR_INTERFACE, 3014, 247, O2_SYSTEM, "Cabin Emergency Decompression Switch")

-- Air conditionning
local AIR_CONDITIONING = "Air Conditioning"

MiG_29A:defineToggleSwitch("AIR_CONDITIONING_SUIT_VENTILATION_TOGGLE", devices.AIR_INTERFACE, 3016, 108, AIR_CONDITIONING, "Suit Ventilation (OPEN/CLOSE)")
MiG_29A:definePotentiometer("AIR_CONDITIONING_SUIT_VENTILATION_KNOB", devices.AIR_INTERFACE, 3030, 109, { 0, 0.6 }, AIR_CONDITIONING, "Suit Ventilation Temperature Knob")
MiG_29A:defineToggleSwitch("AIR_CONDITIONING_COCKPIT_BLOW_DISTRIBUTION_LEVER", devices.AIR_INTERFACE, 3010, 254, AIR_CONDITIONING, "Cockpit air distribution lever (OPEN/PILOT)")
MiG_29A:defineToggleSwitch("AIR_CONDITIONING_COCKPIT_AIR_SUPPLY_LEVER", devices.AIR_INTERFACE, 3012, 246, AIR_CONDITIONING, "Cockpit air supply lever (OPEN/CLOSED)")
MiG_29A:definePotentiometer("AIR_CONDITIONING_CABIN_TEMP_CONTROL_KNOB", devices.AIR_INTERFACE, 3007, 114, { 0, 0.5 }, AIR_CONDITIONING, "Cabin Temperature Control Knob (OFF/AUTO/HOT/COLD)")
MiG_29A:defineCabinTempSwitch("AIR_CONDITIONING_CABIN_TEMP_SWITCH", devices.AIR_INTERFACE, 555, AIR_CONDITIONING, "Cabin Temperature Switch (OFF/AUTO/HOT/COLD)")

-- Emergency control pannel

-- Flaps controls

-- R-862 VHF / UHF control pannel

-- ADF control pannel

-- Engine emergency pannel

-- PSR-31 Weapon controls panel

-- AFCS Autopilot control pannel

-- PUR-31 Radar control pannel

-- HUD control pannel (With sun visor controls)

-- HDD control pannel

-- Canopy controls

-- Refueling pannel

-- EKRAN warning system

-- Voice information and warning system (VIWAS) controls

-- Left wall

-- Chut controls

-- Mirrors

-- Emergency landing gear

-- Weapon settings pannel

-- Ejection handle

-- Interior Lights

-- Interior Model

-- Exterior Lights

-- Exterior Model

-- Radios

return MiG_29A
