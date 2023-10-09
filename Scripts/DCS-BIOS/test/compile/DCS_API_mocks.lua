---@diagnostic disable: duplicate-set-field

---@class CockpitDevice
--- DCS Cockpit Device
CockpitDevice = {}

loadfile = loadfile

--- Sets command for a device
--- @param command_id integer
--- @param value integer
function CockpitDevice:SetCommand(command_id, value) end

--- Sets a device's argument?
--- @param argument_id integer
--- @param value integer
function CockpitDevice:set_argument_value(argument_id, value) end

--- Sets a device's frequency
--- @param frequency number
function CockpitDevice:set_frequency(frequency) end

--- Gets a device's frequency
--- @return number
function CockpitDevice:get_frequency()
	return 0
end

--- Gets a device based on the device ID as specified in devices.lua
--- @param argument_id integer
--- @return number The current value of the CockpitDevice
function CockpitDevice:get_argument_value(argument_id)
	return 0
end

--- Makes the device perform an action
--- @param command_id integer
--- @param argument number
function CockpitDevice:performClickableAction(command_id, argument) end

--- Gets a device based on the device ID as specified in devices.lua
--- @param device_id integer
--- @return CockpitDevice
function GetDevice(device_id)
	return CockpitDevice
end

--- Gets the draw value for a certain animation
--- @param draw_argument_id integer
--- @return number
function LoGetAircraftDrawArgumentValue(draw_argument_id)
	return 0
end

--- Contains Postions and Altitude
--- @class LatLongAlt
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Lat number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Long number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Alt number Altitude in meters
LatLongAlt = { Lat = 0, Long = 0, Alt = 0 }

--- Contains Aircraft Data
--- @class AicraftData
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Name string
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Heading number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field LatLongAlt LatLongAlt
AicraftData = { Name = "Test", Heading = 0, LatLongAlt }

--- Returns SelfData that holds information about the aircraft
--- @return AicraftData
function LoGetSelfData()
	return AicraftData
end

--- Returns the simulation time
--- @return number
function LoGetModelTime()
	return 0
end

--- Returns the mission start time
--- @return number
function LoGetMissionStartTime()
	return 0
end

--- Returns whether own ships/aircraft data can be exported.
--- @return boolean
function LoIsOwnshipExportAllowed()
	return true
end

--- Returns pilot's name
--- @return string
function LoGetPilotName()
	return "Neil Armstrong"
end

--- Returns indicated airspeed
--- @return number
function LoGetIndicatedAirSpeed()
	return 0
end

--- Contains acceleration info for all dimensions
--- @class AccelerationUnit
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field x number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field y number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field z number
AccelerationUnit = { x = 0, y = 0, z = 0 }

--- Returns G Load
--- @return AccelerationUnit
function LoGetAccelerationUnits()
	return AccelerationUnit
end

--- Returns ADI pitch, band, yaw
--- @return number
function LoGetADIPitchBankYaw()
	return unpack({ 0, 0, 0 })
end

--- @class CounterMeasures
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field chaff number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field flare number
CounterMeasures = { chaff = 0, flare = 0 }

--- Returns information about countermeasures
--- @return CounterMeasures
function LoGetSnares()
	return CounterMeasures
end

--- Returns a string for a cockpit indicator (screen)
--- @return string
function list_indication(indicator_id)
	return "A"
end

--- Returns a list of pages (cockpit screens)
--- @return string
function list_cockpit_params()
	return ""
end

--- Maps value to from input_range to output_range
--- @param argument_value number
--- @param input_range table
--- @param output_range table
--- @return number
function ValueConvert(argument_value, input_range, output_range)
	return 0
end

--- Returns  altitude above sea level
--- @return number
function LoGetAltitudeAboveSeaLevel()
	return 0
end

--- Returns  altitude above ground level
--- @return number
function LoGetAltitudeAboveGroundLevel()
	return 0
end

--- Returns vertical velocity
--- @return number
function LoGetVerticalVelocity()
	return 0
end

--- Returns true air speed
--- @return number
function LoGetTrueAirSpeed()
	return 0
end

--- Returns mach number
--- @return number
function LoGetMachNumber()
	return 0
end

--- Returns angle of attack
--- @return number
function LoGetAngleOfAttack()
	return 0
end

--- Returns glide deviation
--- @return number
function LoGetGlideDeviation()
	return 0
end

--- Returns side deviation
--- @return number
function LoGetSideDeviation()
	return 0
end

--- Returns slip ball position
--- @return number
function LoGetSlipBallPosition()
	return 0
end

--- @class EngineSide
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field right number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field left number
EngineSide = { right = 0, left = 0 }

--- @class EngineInformation
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field RPM EngineSide
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Temperature EngineSide
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field HydraulicPressure EngineSide
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field FuelConsumption EngineSide
EngineInformation = { RPM = EngineSide, Temperature = EngineSide, HydraulicPressure = EngineSide, FuelConsumption = EngineSide }

--- Returns engine information
--- @return EngineInformation
function LoGetEngineInfo()
	return EngineInformation
end

--- @class GearValue
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field right number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field left number
GearValue = { right = 0, left = 0 }

--- @class MechanicalInformation
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field gear GearValue
MechanicalInformation = { gear = GearValue }

--- Returns mechanical information
--- @return MechanicalInformation
function LoGetMechInfo()
	return MechanicalInformation
end
