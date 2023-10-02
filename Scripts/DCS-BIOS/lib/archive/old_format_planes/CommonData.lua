BIOS.protocol.beginModule("CommonData", 0x400)
BIOS.protocol.setExportModuleAircrafts(BIOS.ALL_PLAYABLE_AIRCRAFT)

local defineString = BIOS.util.defineString
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

local latDeg, latSec
local latFractionalSec = 0
local lonDeg, lonSec
local lonFractionalSec = 0
local altFt = 0
local hdgDeg
local hdgDegFrac = 0
local iasDisp
local startTimeLow = 0
local startTimeHigh = 0
local modTimeLow = 0
local modTimeHigh = 0

local playerName
local startTime
local modtime

local iasEU
local iasUS

local gLoad -- string

local latDir
local lonDir

local function LoGetGLoad()
	local au = LoGetAccelerationUnits()
	if au == nil then return end
	return au.y
end

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	if not LoIsOwnshipExportAllowed() then return end -- skip this data if ownship export is disabled

	playerName = LoGetPilotName()
	if playerName == nil then playerName = "XXX" end

	startTime = LoGetMissionStartTime() or 0
	startTimeLow = startTime%65536
	startTimeHigh = (startTime - startTimeLow)/65536

	local modTimeFloat = LoGetModelTime() or 0
	modtime = string.format("%5.0f", modTimeFloat)
	local modTimeHundredth = math.floor (modTimeFloat*100)
	modTimeLow = modTimeHundredth%65536
	modTimeHigh = (modTimeHundredth - modTimeLow) / 65536

	iasDisp = LoGetIndicatedAirSpeed()
	if iasDisp == nil then iasDisp = "0000" end

	iasEU = string.format("%4d", math.floor(0.5 + iasDisp * 3.6))           -- km/h
	iasUS = string.format("%4d", math.floor(0.5 + iasDisp * 1.94384449))	-- knots

    local gload = LoGetGLoad() or 0

	if math.abs(gload) > 10 then gLoad = string.format(" %2d ", gload)
	else gLoad = string.format("%4.1f", gload) end

	local selfData = LoGetSelfData()
	if selfData == nil then return end
		if selfData.LatLongAlt == nil then return end
	altFt = selfData.LatLongAlt.Alt / 0.3048
	local lat = "0"
	local lat = selfData.LatLongAlt.Lat
		if lat < 0 then lat = 0 - lat
						latDir = "S"
		else lat = lat
			 latDir = "N" end
	local lon = selfData.LatLongAlt.Long
		if lon < 0 then lon = 0 - lon
						lonDir	= "W"
		else lon = lon
		     lonDir = "E" end

	latDeg = math.floor(lat)
	local lat1 = (lat - latDeg) * 60 -- to sec
	latSec = math.floor(lat1)
	latFractionalSec = lat1 - latSec

	lonDeg = math.floor(lon)
	local lon1 = (lon - lonDeg) * 60 -- to sec
	lonSec = math.floor(lon1)
	lonFractionalSec = lon1 - lonSec

	if selfData.Heading ~= nil then
		local hdgDegValue = selfData.Heading / (2 * math.pi) * 360
		hdgDeg = math.floor(hdgDegValue)
		hdgDegFrac = hdgDegValue - hdgDeg
	end
end

local function misstime()
  local mtseconds = tonumber(startTime)

  if mtseconds <= 0 then
    return "00:00:00";
  else
	local mtsec = string.format("%02.f", math.floor(mtseconds or 0));
    local mthours = string.format("%02.f", math.floor(mtseconds/3600));
    local mtmins = string.format("%02.f", math.floor(mtseconds/60 - (mthours*60)));
	return mthours .. ":" .. mtmins .. ":" .. mtsec
  end
end

local function getVersion()
	return "0.7.50"
end
defineString("DCS_BIOS", getVersion, 6,  "Metadata" , "DCS Bios Version")

defineString("PILOTNAME", function() return playerName end, 24, "Metadata", "Pilot Name")

defineString("LAT_Z_DIR", function() return latDir or "N" end, 1, "Position", "Latitude Direction")
defineIntegerFromGetter("LAT_DEG", function() return latDeg end, 90, "Position", "Latitude Degrees")
defineIntegerFromGetter("LAT_SEC", function() return latSec end, 59, "Position", "Latitude Seconds")
defineIntegerFromGetter("LAT_SEC_FRAC", function()
	if not LoIsOwnshipExportAllowed() then return nil end
	return math.floor(latFractionalSec*65535)
end, 65535, "Position", "Latitude Fractional Seconds (divide by 65535)")

defineString("IAS_EU", function() return iasEU end, 4, "Speed", "Indicated Airspeed KM H")
defineString("IAS_US", function() return iasUS end, 4, "Speed", "Indicated Airspeed KNT")
defineIntegerFromGetter("IAS_EU_INT", function()
	if not LoIsOwnshipExportAllowed() then return nil end
	return iasDisp * 3.6
end, 65535, "Speed", "Indicated Airspeed KM H (Int)")
defineIntegerFromGetter("IAS_US_INT", function()
	if not LoIsOwnshipExportAllowed() then return nil end
	return iasDisp * 1.94384449
end, 65535, "Speed", "Indicated Airspeed KNT (Int)")

defineString("LON_Z_DIR", function() return lonDir or "E" end, 1, "Position", "Longitude Direction")
defineIntegerFromGetter("LON_DEG", function() return lonDeg end, 180, "Position", "Longitude Degrees")
defineIntegerFromGetter("LON_SEC", function() return lonSec end, 59, "Position", "Longitude Seconds")
defineIntegerFromGetter("LON_SEC_FRAC", function()
	if not LoIsOwnshipExportAllowed() then return nil end
	return math.floor(lonFractionalSec*65535)
end, 65535, "Position", "Longitude Fractional Seconds (divide by 65535)")

defineIntegerFromGetter("ALT_MSL_FT", function()
	if not LoIsOwnshipExportAllowed() then return nil end
	return math.floor(altFt)
end, 65535, "Altitude", "Altitude MSL (ft)")

defineIntegerFromGetter("HDG_DEG", function() return hdgDeg end, 360, "Heading", "Heading (Degrees)")
defineIntegerFromGetter("HDG_DEG_FRAC", function()
	if not LoIsOwnshipExportAllowed() then return nil end
	return hdgDegFrac * 127
end, 127, "Heading", "Heading (Fractional Degrees, divide by 127)")

defineString("MISS_TIME",  misstime, 8, "Time", "Mission Start Time")
defineString("MOD_TIME", function() return modtime or "00000" end, 6, "Time", "Model Time in sec")

defineIntegerFromGetter("TIME_START_HIGH", function() return startTimeHigh end, 65535, "Time", "Start time high bits in seconds")
defineIntegerFromGetter("TIME_START_LOW", function() return startTimeLow end, 65535, "Time", "Start time low bits in seconds")
defineIntegerFromGetter("TIME_MODEL_HIGH", function() return modTimeHigh end, 65535, "Time", "Model time high bits in hundredth of a second")
defineIntegerFromGetter("TIME_MODEL_LOW", function() return modTimeLow end, 65535, "Time", "Model time low bits in hundredth of a second")

defineString("G_LOAD", function() return gLoad or "0000" end, 4, "Speed", "G Load")

BIOS.protocol.endModule()