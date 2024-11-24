module("CommonData", package.seeall)

local AircraftList = require("Scripts.DCS-BIOS.lib.AircraftList")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class CommonData: Module
local CommonData = Module:new("CommonData", 0x0400, AircraftList.ALL_PLAYABLE_AIRCRAFT)
CommonData.dev0_required = false

local latDeg = 0
local latSec = 0
local latFractionalSec = 0
local lonDeg = 0
local lonSec = 0
local lonFractionalSec = 0
local altFt = 0
local hdgDeg = 0
local hdgDegFrac = 0

local latDir = "N"
local lonDir = "E"

local angular_velocity_x = "0"
local angular_velocity_y = "0"
local angular_velocity_z = "0"
local angular_max_length = 6

local function updatePosition()
	if not LoIsOwnshipExportAllowed() then
		return
	end -- skip this data if ownship export is disabled

	local selfData = LoGetSelfData()
	if selfData == nil or selfData.LatLongAlt == nil then
		return
	end

	altFt = math.floor(selfData.LatLongAlt.Alt / 0.304)
	local lat = selfData.LatLongAlt.Lat
	if lat < 0 then
		lat = 0 - lat
		latDir = "S"
	else
		lat = lat
		latDir = "N"
	end
	local lon = selfData.LatLongAlt.Long
	if lon < 0 then
		lon = 0 - lon
		lonDir = "W"
	else
		lon = lon
		lonDir = "E"
	end

	latDeg = math.floor(lat)
	local lat1 = (lat - latDeg) * 60 -- to sec
	latSec = math.floor(lat1)
	latFractionalSec = math.floor((lat1 - latSec) * 65535)

	lonDeg = math.floor(lon)
	local lon1 = (lon - lonDeg) * 60 -- to sec
	lonSec = math.floor(lon1)
	lonFractionalSec = math.floor((lon1 - lonSec) * 65535)

	if selfData.Heading ~= nil then
		local hdgDegValue = selfData.Heading / (2 * math.pi) * 360
		hdgDeg = math.floor(hdgDegValue)
		hdgDegFrac = (hdgDegValue - hdgDeg) * 127
	end
end
CommonData:addExportHook(updatePosition)

local function getVersion()
	return "0.8.3"
end
CommonData:defineString("DCS_BIOS", getVersion, 6, "Metadata", "DCS Bios Version")

local function getPlayerName()
	if not LoIsOwnshipExportAllowed() then
		return "XXX"
	end -- skip this data if ownship export is disabled

	return LoGetPilotName() or "XXX"
end

CommonData:defineString("PILOTNAME", getPlayerName, 24, "Metadata", "Pilot Name")

CommonData:defineString("LAT_Z_DIR", function()
	return latDir
end, 1, "Position", "Latitude Direction")
CommonData:defineIntegerFromGetter("LAT_DEG", function()
	return latDeg
end, 90, "Position", "Latitude Degrees")
CommonData:defineIntegerFromGetter("LAT_SEC", function()
	return latSec
end, 59, "Position", "Latitude Seconds")
CommonData:defineIntegerFromGetter("LAT_SEC_FRAC", function()
	return latFractionalSec
end, 65535, "Position", "Latitude Fractional Seconds (divide by 65535)")

local iasKph = 0
local iasKt = 0
local iasEU = ""
local iasUS = ""

local function updateAirspeed()
	if not LoIsOwnshipExportAllowed() then
		return
	end -- skip this data if ownship export is disabled

	local iasDisp = LoGetIndicatedAirSpeed()

	if not iasDisp then
		return
	end
	iasKph = Module.round(iasDisp * 3.6)
	iasKt = Module.round(iasDisp * 1.94384449)

	iasEU = string.format("%4d", iasKph) -- km/h
	iasUS = string.format("%4d", iasKt) -- knots
end
CommonData:addExportHook(updateAirspeed)

CommonData:defineString("IAS_EU", function()
	return iasEU
end, 4, "Speed", "Indicated Airspeed KM H")
CommonData:defineString("IAS_US", function()
	return iasUS
end, 4, "Speed", "Indicated Airspeed KNT")
CommonData:defineIntegerFromGetter("IAS_EU_INT", function()
	return iasKph
end, 65535, "Speed", "Indicated Airspeed KM H (Int)")
CommonData:defineIntegerFromGetter("IAS_US_INT", function()
	return iasKt
end, 65535, "Speed", "Indicated Airspeed KNT (Int)")

CommonData:defineString("LON_Z_DIR", function()
	return lonDir
end, 1, "Position", "Longitude Direction")
CommonData:defineIntegerFromGetter("LON_DEG", function()
	return lonDeg
end, 180, "Position", "Longitude Degrees")
CommonData:defineIntegerFromGetter("LON_SEC", function()
	return lonSec
end, 59, "Position", "Longitude Seconds")
CommonData:defineIntegerFromGetter("LON_SEC_FRAC", function()
	return lonFractionalSec
end, 65535, "Position", "Longitude Fractional Seconds (divide by 65535)")

CommonData:defineIntegerFromGetter("ALT_MSL_FT", function()
	return altFt
end, 65535, "Altitude", "Altitude MSL (ft)")

CommonData:defineIntegerFromGetter("HDG_DEG", function()
	return hdgDeg
end, 360, "Heading", "Heading (Degrees)")
CommonData:defineIntegerFromGetter("HDG_DEG_FRAC", function()
	return hdgDegFrac
end, 127, "Heading", "Heading (Fractional Degrees, divide by 127)")

local missionStartTime = ""
local startTimeLow = 0
local startTimeHigh = 0

local function updateMissionTime()
	if not LoIsOwnshipExportAllowed() then
		return
	end -- skip this data if ownship export is disabled

	local startTime = LoGetMissionStartTime() or 0
	startTimeLow = startTime % 65536
	startTimeHigh = (startTime - startTimeLow) / 65536

	local mtseconds = tonumber(startTime)

	if mtseconds <= 0 then
		missionStartTime = "00:00:00"
	else
		local mtsec = string.format("%02.f", math.floor(mtseconds or 0))
		local mthours = string.format("%02.f", math.floor(mtseconds / 3600))
		local mtmins = string.format("%02.f", math.floor(mtseconds / 60 - (mthours * 60)))
		missionStartTime = mthours .. ":" .. mtmins .. ":" .. mtsec
	end
end
CommonData:addExportHook(updateMissionTime)

local modTime = "00000"
local modTimeLow = 0
local modTimeHigh = 0
local function updateModelTime()
	if not LoIsOwnshipExportAllowed() then
		return
	end -- skip this data if ownship export is disabled

	local modTimeFloat = LoGetModelTime() or 0
	modTime = string.format("%5.0f", modTimeFloat)
	local modTimeHundredth = math.floor(modTimeFloat * 100)
	modTimeLow = modTimeHundredth % 65536
	modTimeHigh = (modTimeHundredth - modTimeLow) / 65536
end
CommonData:addExportHook(updateModelTime)

CommonData:defineString("MISS_TIME", function()
	return missionStartTime
end, 8, "Time", "Mission Start Time")
CommonData:defineString("MOD_TIME", function()
	return modTime
end, 6, "Time", "Model Time in sec")

CommonData:defineIntegerFromGetter("TIME_START_HIGH", function()
	return startTimeHigh
end, 65535, "Time", "Start time high bits in seconds")
CommonData:defineIntegerFromGetter("TIME_START_LOW", function()
	return startTimeLow
end, 65535, "Time", "Start time low bits in seconds")
CommonData:defineIntegerFromGetter("TIME_MODEL_HIGH", function()
	return modTimeHigh
end, 65535, "Time", "Model time high bits in hundredth of a second")
CommonData:defineIntegerFromGetter("TIME_MODEL_LOW", function()
	return modTimeLow
end, 65535, "Time", "Model time low bits in hundredth of a second")

local function LoGetGLoad()
	local au = LoGetAccelerationUnits()
	if au == nil then
		return
	end
	return au.y
end

local function getGLoad()
	if not LoIsOwnshipExportAllowed() then
		return ""
	end -- skip this data if ownship export is disabled

	local gload = LoGetGLoad() or 0

	if math.abs(gload) > 10 then
		return string.format(" %2d ", gload)
	end

	return string.format("%4.1f", gload)
end

CommonData:defineString("G_LOAD", getGLoad, 4, "Speed", "G Load")

CommonData:addExportHook(function()
	if not LoIsOwnshipExportAllowed() then
		return
	end -- skip this data if ownship export is disabled

	local angular_velocity = LoGetAngularVelocity()
	if angular_velocity == nil then
		return
	end

	angular_velocity_x = tostring(angular_velocity.x)
	angular_velocity_y = tostring(angular_velocity.y)
	angular_velocity_z = tostring(angular_velocity.z)
end)

CommonData:defineString("ANGULAR_VELOCITY_X", function()
	return angular_velocity_x
end, angular_max_length, "Speed", "Angular X Velocity")

CommonData:defineString("ANGULAR_VELOCITY_Y", function()
	return angular_velocity_y
end, angular_max_length, "Speed", "Angular Y Velocity")

CommonData:defineString("ANGULAR_VELOCITY_Z", function()
	return angular_velocity_z
end, angular_max_length, "Speed", "Angular Z Velocity")

CommonData:defineIntegerFromGetter("HDG_DEG_MAG", function()
	local magnetic_heading_rad = LoGetMagneticYaw()

	if not magnetic_heading_rad then
		return 0
	end

	local heading = Module.round(magnetic_heading_rad * 180 / math.pi) % 360
	if heading < 0 then -- you'd think this would always be positive, but sometimes radians is negative!
		heading = heading + 360
	end
	return heading
end, 359, "Heading", "Magnetic Heading")

return CommonData
