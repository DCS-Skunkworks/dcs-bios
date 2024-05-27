---@meta

--- @class lfs
--- DCS Local File System
lfs = {}

--- @return string Returns the root location of DCS location in user folder
function lfs.writedir()
	return ""
end

---@class CockpitDevice
--- DCS Cockpit Device
CockpitDevice = {}

--- Updates device's arguments (mainpanel device 0)
function CockpitDevice:update_arguments() end

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
function CockpitDevice:get_frequency() end

--- Gets a device based on the device ID as specified in devices.lua
--- @param argument_id integer
--- @return number The current value of the CockpitDevice
function CockpitDevice:get_argument_value(argument_id) end

--- Makes the device perform an action
--- @param command_id integer
--- @param value number
function CockpitDevice:performClickableAction(command_id, value) end

--- Gets a device based on the device ID as specified in devices.lua
--- @param device_id integer
--- @return CockpitDevice?
function GetDevice(device_id) end

--- Gets the draw value for a certain animation
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

--- Returns SelfData that holds information about the aircraft
--- @return AicraftData
function LoGetSelfData() end

--- Returns the simulation time
--- @return number
function LoGetModelTime() end

--- Returns the mission start time
--- @return number
function LoGetMissionStartTime() end

--- Returns HSI data
--- @return number
function LoGetControlPanel_HSI() end

--- Returns payload information
--- @return number
function LoGetPayloadInfo() end

--- Returns magnetic yaw
--- @return number
function LoGetMagneticYaw() end

--- Returns mode control panel state
--- @return number
function LoGetMCPState() end

--- Returns track while scan information
--- @return number
function LoGetTWSInfo() end

--- Returns atmospheric pressure
--- @return number
function LoGetBasicAtmospherePressure() end

--- Returns navigational information
--- @return number
function LoGetNavigationInfo() end

--- Returns whether own ships/aircraft data can be exported.
--- @return boolean
function LoIsOwnshipExportAllowed() end

--- Returns pilot's name
--- @return string
function LoGetPilotName() end

--- Returns indicated airspeed
--- @return number
function LoGetIndicatedAirSpeed() end

--- Returns route information
--- @return table
function LoGetRoute() end

--- Returns information on wingman
--- @return table
function LoGetWingInfo() end

--- Returns wind velocity
--- @return table
function LoGetVectorWindVelocity() end

--- Returns angular velocity
--- @return table
function LoGetAngularVelocity() end

--- Returns FM data
--- @return table
function LoGetFMData() end

--- Returns radio beacon status
--- @return table
function LoGetRadioBeaconsStatus() end

--- Returns vector velocity
--- @return integer
function LoGetVectorVelocity() end

--- Set command using keyboard iCommand
--- @param iCommand integer from DCS keyboard export list
--- @return number
function LoSetCommand(iCommand) end

--- Set command using keyboard iCommand
--- @param iCommand integer from DCS keyboard export list
--- @param new_value integer for the iCommand
--- @return number
function LoSetCommand(iCommand, new_value) end

--- Returns side slip angle
--- @return number
function LoGetAngleOfSideSlip() end

--- Returns radar altitude
--- @return number
function LoGetRadarAltimeter() end

--- Returns whether object export is allowed
--- @return boolean
function LoIsObjectExportAllowed() end

--- Returns whether sensor export is allowed
--- @return boolean
function LoIsSensorExportAllowed() end

--- Returns object
--- @param object_id integer
--- @return table
function LoGetObjectById(object_id) end

--- Returns all world objects
--- @return table
function LoGetWorldObjects() end

--- Returns target information
--- @return table
function LoGetTargetInformation() end

--- Returns locked target information
--- @return table
function LoGetLockedTargetInformation() end

--- Returns F-15 TWS contacts
--- @return table
function LoGetF15_TWS_Contacts() end

--- Returns Sighting system information
--- @return table
function LoGetSightingSystemInfo() end

--- Returns wing's targets
--- @return table
function LoGetWingTargets() end

--- Returns player's aircraft id
--- @return string
function LoGetPlayerPlaneId() end

--- Returns altitude
--- @return number
function LoGetAltitude() end

--- Returns name by type
--- @param weapon_level1 integer
--- @param weapon_level2 integer
--- @param weapon_level3 integer
--- @param weapon_level4 integer
--- @return string
function LoGetNameByType(weapon_level1, weapon_level2, weapon_level3, weapon_level4) end

--- Converts lat long to x y z
--- @param longitude_degrees number
--- @param latitude_degrees number
--- @return number, number, number
function LoGeoCoordinatesToLoCoordinates(longitude_degrees, latitude_degrees) end

--- Converts x, z to lat long
--- @param x number
--- @param z number
--- @return number, number
function LoCoordinatesToGeoCoordinates(x, z) end

--- Contains acceleration info for all dimensions
--- @class AccelerationUnit
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field x number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field y number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field z number
AccelerationUnit = {}

--- Returns G Load. May be null when the user has the Game Master slot selected.
--- @return AccelerationUnit?
function LoGetAccelerationUnits() end

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
CounterMeasures = {}

--- Returns information about countermeasures
--- @return CounterMeasures
function LoGetSnares() end

--- Returns a string with values separated by -----------------------------------------\n
--- for a cockpit screen or device
--- @return string
function list_indication(indicator_id) end

--- Returns a list of pages (cockpit screens)
--- @return string
function list_cockpit_params() end

--- Maps value to from input_range to output_range
--- @param argument_value number
--- @param input_range table
--- @param output_range table
--- @return number
function ValueConvert(argument_value, input_range, output_range) end

--- Returns  altitude above sea level
--- @return number
function LoGetAltitudeAboveSeaLevel() end

--- Returns  altitude above ground level
--- @return number
function LoGetAltitudeAboveGroundLevel() end

--- Returns vertical velocity
--- @return number
function LoGetVerticalVelocity() end

--- Returns true air speed
--- @return number
function LoGetTrueAirSpeed() end

--- Returns mach number
--- @return number
function LoGetMachNumber() end

--- Returns angle of attack
--- @return number
function LoGetAngleOfAttack() end

--- Returns glide deviation
--- @return number
function LoGetGlideDeviation() end

--- Returns side deviation
--- @return number
function LoGetSideDeviation() end

--- Returns slip ball position
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
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field fuel_internal number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field fuel_external number
EngineInformation = {}

--- Returns engine information
--- @return EngineInformation
function LoGetEngineInfo() end

--- @class GearValue
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field right number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field left number
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field value number Gear status
GearValue = {}

--- @class MechanicalInformation
--- @diagnostic disable-next-line: duplicate-doc-field
--- @field gear GearValue
MechanicalInformation = {}

--- Returns mechanical information
--- @return MechanicalInformation
function LoGetMechInfo() end
