---@meta

---@class lfs 
--- DCS Lua File System
lfs = {}

---@return string Returns the root location of DCS location in user folder
function lfs.writedir()
    return "";
end

---@class CockpitDevice
--- DCS Cockpit Device
CockpitDevice = {}


--- @func Sets command for a device
--- @param command_id integer
--- @param value integer
function CockpitDevice:SetCommand(command_id, value)    
end

--- @func Sets a device's argument?
--- @param argument_id integer
--- @param value integer
function CockpitDevice:set_argument_value(argument_id, value)    
end

--- @func Sets a device's frequency
--- @param frequency number
function CockpitDevice:set_frequency(frequency)    
end

--- @func Gets a device's frequency
--- @return number
function CockpitDevice:get_frequency()
    return 0
end

--- @func Gets a device based on the device ID as specified in devices.lua
--- @param argument_id integer
--- @return number The current value of the CockpitDevice
function CockpitDevice:get_argument_value(argument_id)
    return 0;
end

--- @func Makes the device perform an action
--- @param command_id integer
--- @param argument number
function CockpitDevice:performClickableAction(command_id, argument)

end


--- @func Gets a device based on the device ID as specified in devices.lua
--- @param device_id integer
--- @return CockpitDevice
function GetDevice(device_id)
    return CockpitDevice;
end

--- @func Gets the draw value for a certain animation
--- @param draw_argument_id integer
--- @return number
function LoGetAircraftDrawArgumentValue(draw_argument_id)
    return 0;
end



--- @class LatLongAlt
--- Contains Postions Information and Altitude
--- @field Lat number 
--- @field Long number 
--- @field Alt number Altitude in meters
LatLongAlt = {
    Lat = 0,
    Long = 0,
    Alt = 0
}

--- @class AicraftData
--- Contains Aircraft Data
--- @field Name string
--- @field Heading number
--- @field LatLongAlt LatLongAlt
AicraftData = {
    Name = "",
    Heading = 0,
    LatLongAlt
}

--- @func Returns SelfData that holds information about the aircraft
--- @return AicraftData
function LoGetSelfData()
    return AicraftData;
end

--- @func Returns the simulation time
--- @return number
function LoGetModelTime()
    return 0;
end

--- @func Returns the mission start time
--- @return number
function LoGetMissionStartTime()
    return 0;
end

--- @func Returns whether own ships/aircraft data can be exported.
--- @return boolean 
function LoIsOwnshipExportAllowed()
    return true;
end

--- @func Returns pilot's name
--- @return string 
function LoGetPilotName()
    return "";
end

--- @func Returns indicated airspeed
--- @return number 
function LoGetIndicatedAirSpeed()
    return 0;
end

--- @class AccelerationUnit
--- Contains acceleration info for all dimensions
--- @field x number
--- @field y number
--- @field z number
AccelerationUnit = {
    x = 0,
    y = 0,
    z = 0
}

--- @func Returns G Load 
--- @return AccelerationUnit 
function LoGetAccelerationUnits()
    return AccelerationUnit;
end

--- @func Returns ADI pitch, band, yaw
--- @return number 
function LoGetADIPitchBankYaw()
    return unpack({0, 0, 0});
end

--- @class CounterMeasures
--- @field chaff number
--- @field flare number
CounterMeasures = {
    chaff = 0,
    flare = 0
}

--- @func Returns information about countermeasures
--- @return CounterMeasures 
function LoGetSnares()
    return CounterMeasures;
end

--- @func Returns a list of strings for a cockpit indicator (screen)
--- @return string
function list_indication(indicator_id)
    return "";
end

--- @class CockpitPage
--- @field sub string
CockpitPage = {}

--- @func Searches for matches in CockpitPage
--- @param search_value string
--- @return CockpitPage
function CockpitPage:match(search_value)
    return CockpitPage;
end

--- @func sub? CockpitPage
--- @param index integer
--- @return string
function CockpitPage:sub(index)
    return "";
end

--- @func Returns a list of pages (cockpit screens)
--- @return CockpitPage
function list_cockpit_params()
    return CockpitPage;
end

--- @func Returns something and does something
--- @param argument_value number
--- @param input_range table
--- @param output_range table
--- @return number
function ValueConvert(argument_value, input_range, output_range)
end

--- @func Returns  altitude above sea level
--- @return number
function LoGetAltitudeAboveSeaLevel()
    return 0;
end

--- @func Returns  altitude above ground level
--- @return number
function LoGetAltitudeAboveGroundLevel()
    return 0;
end

--- @func Returns vertical velocity
--- @return number
function LoGetVerticalVelocity()
    return 0;
end

--- @func Returns true air speed
--- @return number
function LoGetTrueAirSpeed()
    return 0;
end

--- @func Returns mach number
--- @return number
function LoGetMachNumber()
    return 0;
end

--- @func Returns angle of attack
--- @return number
function LoGetAngleOfAttack()
    return 0;
end

--- @func Returns glide deviation
--- @return number
function LoGetGlideDeviation()
    return 0;
end

--- @func Returns side deviation
--- @return number
function LoGetSideDeviation()
    return 0;
end

--- @func Returns slip ball position
--- @return number
function LoGetSlipBallPosition()
    return 0;
end


--- @class EngineSide
--- @field right number
--- @field left number
EngineSide = {
    right = 0,
    left = 0
}

--- @class EngineInformation
--- @field RPM EngineSide
--- @field Temperature EngineSide
--- @field HydraulicPressure EngineSide
--- @field FuelConsumption EngineSide
EngineInformation = {
    RPM = EngineSide,
    Temperature = EngineSide,
    HydraulicPressure = EngineSide,
    FuelConsumption = EngineSide
}

--- @func Returns engine information
--- @return EngineInformation
function LoGetEngineInfo()
    return EngineInformation;
end

--- @class GearValue
--- @field right number
--- @field left number
GearValue = {
    value = 0
}

--- @class MechanicalInformation
--- @field gear GearValue
MechanicalInformation = {
    gear = GearValue
}

--- @func Returns mechanical information
--- @return MechanicalInformation
function LoGetMechInfo()
    return MechanicalInformation;
end



