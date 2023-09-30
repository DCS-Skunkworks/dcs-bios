---@meta

--- @class lfs 
--- DCS Local File System
lfs = {}

--- @return string Returns the root location of DCS location in user folder
function lfs.writedir()
    return "";
end

---@class CockpitDevice
--- DCS Cockpit Device
CockpitDevice = {}

--- @func Updates device's arguments
function CockpitDevice:update_arguments() end

--- @func Sets command for a device
--- @param command_id integer
--- @param value integer
function CockpitDevice:SetCommand(command_id, value) end

--- @func Sets a device's argument?
--- @param argument_id integer
--- @param value integer
function CockpitDevice:set_argument_value(argument_id, value) end

--- @func Sets a device's frequency
--- @param frequency number
function CockpitDevice:set_frequency(frequency) end

--- @func Gets a device's frequency
--- @return number
function CockpitDevice:get_frequency() end

--- @func Gets a device based on the device ID as specified in devices.lua
--- @param argument_id integer
--- @return number The current value of the CockpitDevice
function CockpitDevice:get_argument_value(argument_id) end

--- @func Makes the device perform an action
--- @param command_id integer
--- @param argument number
function CockpitDevice:performClickableAction(command_id, argument)

end


--- @func Gets a device based on the device ID as specified in devices.lua
--- @param device_id integer
--- @return CockpitDevice
function GetDevice(device_id) end

--- @func Gets the draw value for a certain animation
--- @param draw_argument_id integer
--- @return number
function LoGetAircraftDrawArgumentValue(draw_argument_id) end



--- Contains Postions and Altitude
--- @class LatLongAlt
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Lat number 
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Long number 
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Alt number Altitude in meters
LatLongAlt = {}

--- Contains Aircraft Data
--- @class AicraftData
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Name string
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Heading number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field LatLongAlt LatLongAlt
AicraftData = {}

--- @func Returns SelfData that holds information about the aircraft
--- @return AicraftData
function LoGetSelfData() end

--- @func Returns the simulation time
--- @return number
function LoGetModelTime() end


--- @func Returns the mission start time
--- @return number
function LoGetMissionStartTime() end

--- @func Returns whether own ships/aircraft data can be exported.
--- @return boolean 
function LoIsOwnshipExportAllowed() end

--- @func Returns pilot's name
--- @return string 
function LoGetPilotName() end

--- @func Returns indicated airspeed
--- @return number 
function LoGetIndicatedAirSpeed() end

--- Contains acceleration info for all dimensions
--- @class AccelerationUnit
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field x number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field y number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field z number
AccelerationUnit = {}

--- @func Returns G Load 
--- @return AccelerationUnit 
function LoGetAccelerationUnits() end

--- @func Returns ADI pitch, band, yaw
--- @return number
function LoGetADIPitchBankYaw()
    return unpack({0, 0, 0});
end

--- @class CounterMeasures
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field chaff number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field flare number
CounterMeasures = {}

--- @func Returns information about countermeasures
--- @return CounterMeasures 
function LoGetSnares() end

--- @func Returns a list of strings for a cockpit indicator (screen)
--- @return string
function list_indication(indicator_id) end

CockpitPage = ""

--- @func Returns a list of pages (cockpit screens)
--- @return string[]
function list_cockpit_params() end

--- @func Returns  altitude above sea level
--- @return number
function LoGetAltitudeAboveSeaLevel() end

--- @func Returns  altitude above ground level
--- @return number
function LoGetAltitudeAboveGroundLevel() end

--- @func Returns vertical velocity
--- @return number
function LoGetVerticalVelocity() end

--- @func Returns true air speed
--- @return number
function LoGetTrueAirSpeed() end

--- @func Returns mach number
--- @return number
function LoGetMachNumber() end

--- @func Returns angle of attack
--- @return number
function LoGetAngleOfAttack() end

--- @func Returns glide deviation
--- @return number
function LoGetGlideDeviation() end

--- @func Returns side deviation
--- @return number
function LoGetSideDeviation() end

--- @func Returns slip ball position
--- @return number
function LoGetSlipBallPosition() end


--- @class EngineSide
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field right number 
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field left number
EngineSide = {}

--- @class EngineInformation
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field RPM EngineSide
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field Temperature EngineSide
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field HydraulicPressure EngineSide
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field FuelConsumption EngineSide
EngineInformation = {}

--- @func Returns engine information
--- @return EngineInformation
function LoGetEngineInfo() end

--- @class GearValue
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field right number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field left number
GearValue = {}

--- @class MechanicalInformation
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field gear GearValue
MechanicalInformation = {}

--- @func Returns mechanical information
--- @return MechanicalInformation
function LoGetMechInfo() end



