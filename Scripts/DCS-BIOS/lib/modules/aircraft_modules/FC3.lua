module("FC3", package.seeall)

local AircraftList = require("Scripts.DCS-BIOS.lib.AircraftList")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class FC3: Module
local FC3 = Module:new("FC3", 0x6000, AircraftList.FLAMING_CLIFFS_AIRCRAFT)
FC3.dev0_required = false

local altitude = " -- "
local altitude_ground_level = " ---- "
local _altitude_sea_level = " ---- "
local radar_altitude = 0

local vertical_velocity = " -- "
local indicated_airspeed = " -- "
local true_air_speed = " -- "
local mach_number = " -- "
local vvi_bar = 8

local angle_of_attack = " -- "

local fuel_bar = 0
local fuel_percentage = " -- "

local gload = 0
local gload_bar = 0

local adi_bank = 0.0
local adi_pitch = 0.0
local adi_yaw = 0.0

local glide_deviation
local side_deviation
local slip_ball_position

local chaffs
local flares

local gear_status
local left_rpm = "----"
local right_rpm = "----"
local left_temp = "----"
local right_temp = "----"
local left_hydraulic = "---"
local right_hydraulic = "---"
local left_fuel_consumption = "----"
local right_fuel_consumption = "----"

local function GetPlaneName()
	local selfdata = LoGetSelfData()
	if selfdata == nil then
		return "XXX"
	end
	return selfdata.Name
end

local function LoGetFuelAll()
	local engine = LoGetEngineInfo()
	if engine == nil then
		return
	end
	return engine.fuel_internal + engine.fuel_external
end

local function BarFuel(fuel, plane)
	local maxFuel = 1000

	if plane == "A-10A" then
		maxFuel = 5029
	elseif plane == "F-15C" then
		maxFuel = 6103
	elseif plane == "MiG-29A" or plane == "MiG-29G" then
		maxFuel = 3380
	elseif plane == "MiG-29S" then
		maxFuel = 3500
	elseif plane == "Su-25" then
		maxFuel = 2835
	elseif plane == "Su-25T" then
		maxFuel = 3790
	elseif plane == "Su-27" or plane == "Su-33" or plane == "J-11A" then
		maxFuel = 9400
	end

	local barf = math.ceil((fuel / maxFuel) * 16)
	if barf > 16 then
		barf = 16
	end
	return barf
end

local function BarGLoad(raw_gload)
	local barg = math.floor((raw_gload / 11) * 16)

	if barg < 0 then
		barg = 0
	elseif barg > 16 then
		barg = 16
	end

	return barg
end

local function BarVVI(vvi, plane)
	local divide = 150

	if plane == "A-10A" or plane == "F-15C" then
		divide = 30
	end
	local bar = (vvi / divide) * 8
	if bar < -8 then
		bar = -8
	elseif bar < 0 then
		bar = math.floor(bar)
	elseif bar > 8 then
		bar = 8
	elseif bar > 0 then
		bar = math.ceil(bar)
	end

	return bar + 8
end

local function allowMach(plane)
	return plane ~= "A-10A" and plane ~= "Su-25T"
end

local function allowTAS(plane)
	return plane == "Su-25" or plane == "Su-25T"
end

FC3:addExportHook(function()
	--[[ Altitude ]]
	local plane = GetPlaneName()
	local alt_sea = LoGetAltitudeAboveSeaLevel() or 0
	local alt_ground = LoGetAltitudeAboveGroundLevel() or 0
	local alt = alt_sea or 0

	--[[ US PLANES ]]
	--
	if plane == "A-10A" or plane == "F-15C" or plane == "MiG-29G" then
		alt = alt * 3.2808399 -- feets
		alt_sea = alt_sea * 3.2808399 -- feets
		alt_ground = alt_ground * 3.2808399 -- feets

		--[[ RADAR ALTIMITER ]]
		--
		if plane == "A-10A" or plane == "MiG-29G" then
			radar_altitude = 1
			if alt_ground > 5000 then
				radar_altitude = 0
			end
		end

	--[[ RU PLANES ]]
	--
	elseif plane == "MiG-29A" or plane == "MiG-29S" or plane == "Su-25" or plane == "Su-25T" or plane == "Su-27" or plane == "Su-33" or plane == "J-11A" then
		alt = math.floor(alt * 0.1) * 10
		if alt_ground > 1500 then
			radar_altitude = 0
		else
			radar_altitude = 1
		end

		if radar_altitude == 0 then
			alt = math.floor(alt / 10) * 10
		end
	end

	if radar_altitude == 1 then
		alt = alt_ground
	end

	if alt >= 10000 then
		alt = math.floor(alt / 100)
		altitude = string.format("%3d ", alt)
	else
		altitude = string.format("%4d", alt)
	end

	altitude_ground_level = string.format("%6d", alt_ground)
	_altitude_sea_level = string.format("%6d", alt_sea)
end)

FC3:addExportHook(function()
	--[[ Speed ]]
	local plane = GetPlaneName()
	local vvi = LoGetVerticalVelocity() or 0
	vvi_bar = BarVVI(vvi, plane) or 0
	local ias = LoGetIndicatedAirSpeed() or 0
	local tas = LoGetTrueAirSpeed() or 0
	local mach = LoGetMachNumber() or 0

	--[[ US PLANES ]]
	--
	if plane == "A-10A" or plane == "F-15C" or plane == "MiG-29G" then
		ias = ias * 1.94384449 -- knots
		tas = tas * 1.94384449 -- knots
		vvi = vvi * 196.850394 -- feets per minute

		if vvi > 6000 then
			vvi = 6000
		elseif vvi < -6000 then
			vvi = -6000
		end
		vvi = vvi / 1000

	--[[ RU PLANES ]]
	--
	elseif plane == "MiG-29A" or plane == "MiG-29S" or plane == "Su-25" or plane == "Su-25T" or plane == "Su-27" or plane == "Su-33" or plane == "J-11A" then
		ias = math.floor(ias * 0.36) * 10
		tas = math.floor(tas * 0.36) * 10
		if tas < 400 then
			tas = 400
		end
	end

	indicated_airspeed = string.format("%4d", ias)

	-- MACH NUMBER
	if allowMach(plane) then
		if mach < 0.5 then
			mach = 0.5
		end
		mach_number = string.format("%4.2f", mach)
	end

	-- TAS
	if allowTAS(plane) then
		true_air_speed = string.format("%4d", tas)
	end

	if vvi >= 100 then
		vertical_velocity = string.format("%4d", vvi)
	elseif vvi >= 10 then
		vertical_velocity = string.format("%3d ", vvi)
	elseif vvi <= -10 then
		vertical_velocity = string.format("%3d ", vvi)
	else
		vertical_velocity = string.format("%4.1f", vvi)
	end
end)

FC3:addExportHook(function()
	--[[ Fuel ]]
	local plane = GetPlaneName()
	local fuel_all = LoGetFuelAll() or 0
	fuel_bar = BarFuel(fuel_all, plane) or 0
	local engineInfo = LoGetEngineInfo()

	if engineInfo ~= nil then
		left_fuel_consumption = string.format("%4.0d", (engineInfo.FuelConsumption.left * 7936.641))
		right_fuel_consumption = string.format("%4.0d", (engineInfo.FuelConsumption.right * 7936.641))
	end

	--[[ US PLANES ]]
	--
	if plane == "A-10A" or plane == "F-15C" or plane == "MiG-29G" then
		fuel_all = math.floor(fuel_all * 0.022) * 100
		fuel_all = fuel_all / 100
		fuel_percentage = string.format("%3.1f", math.floor(fuel_all))

	--[[ RU PLANES ]]
	--
	elseif plane == "MiG-29A" or plane == "MiG-29S" or plane == "Su-25" or plane == "Su-25T" or plane == "Su-27" or plane == "Su-33" or plane == "J-11A" then
		fuel_all = math.floor(fuel_all / 10) * 10
	end

	if fuel_all > 100 then
		fuel_percentage = string.format("%4d", fuel_all)
	else
		fuel_percentage = string.format("%4.1f", fuel_all)
	end
end)

FC3:addExportHook(function()
	--[[Angle of attack]]
	local plane = GetPlaneName()
	local aoa = LoGetAngleOfAttack() or 0

	if plane == "A-10A" or plane == "F-15C" or plane == "MiG-29G" then
		aoa = aoa + 10
	end

	if plane == "A-10A" then
		if aoa < 0 then
			aoa = 0
		elseif aoa > 30 then
			aoa = 30
		end
	elseif plane == "F-15C" then
		if aoa < 0 then
			aoa = 0
		elseif aoa > 45 then
			aoa = 45
		end
	else
		if aoa < -10 then
			aoa = -10
		elseif aoa > 40 then
			aoa = 40
		end
	end

	if math.abs(aoa) >= 10 then
		angle_of_attack = string.format(" %2d ", aoa)
	else
		angle_of_attack = string.format("%4.1f", aoa)
	end
end)

FC3:addExportHook(function()
	--[[Engine & Mechanical]]
	local engineInfo = LoGetEngineInfo()
	local mech = LoGetMechInfo()

	if engineInfo ~= nil then
		left_rpm = string.format("%3.0d", engineInfo.RPM.left)
		right_rpm = string.format("%3.0d", engineInfo.RPM.right)
		left_temp = string.format("%4.0d", engineInfo.Temperature.left)
		right_temp = string.format("%4.0d", engineInfo.Temperature.right)
		left_hydraulic = string.format(engineInfo.HydraulicPressure.left)
		right_hydraulic = string.format(engineInfo.HydraulicPressure.right)
	end

	gear_status = mech and mech.gear.value or 0
end)

FC3:addExportHook(function()
	--[[Deviation and Slipball]]

	glide_deviation = LoGetGlideDeviation()
	side_deviation = LoGetSideDeviation()
	slip_ball_position = LoGetSlipBallPosition()
end)

FC3:addExportHook(function()
	--[[Countermeasures]]
	local counter_measures = LoGetSnares()

	if counter_measures ~= nil and type(counter_measures) == "table" then
		chaffs = string.format("%3.0d", counter_measures.chaff)
		flares = string.format("%3.0d", counter_measures.flare)
	else
		chaffs = "---"
		flares = "---"
	end
end)

FC3:addExportHook(function()
	--[[G Load]]
	local plane = GetPlaneName()
	local acceleration_units = LoGetAccelerationUnits()
	gload = acceleration_units and acceleration_units.y or 0
	gload_bar = BarGLoad(gload) or 0

	-- G LOAD
	if plane == "A-10A" then
		if gload < -5 then
			gload = -5
		elseif gload > 10 then
			gload = 10
		end
	end
end)

FC3:addExportHook(function()
	--[[Pitch Bank Yaw]]
	adi_pitch, adi_bank, adi_yaw = LoGetADIPitchBankYaw()
end)

--Altitude
FC3:defineString("FC3_ALTITUDE", function()
	return altitude or "000000"
end, 6, "Altitude", "Altitude")
FC3:defineString("FC3_ALTITUDE_GROUND", function()
	return altitude_ground_level or "000000"
end, 6, "Altitude", "Altitude above Ground")
FC3:defineString("FC3_ALTITUDE_SEA", function()
	return _altitude_sea_level or "000000"
end, 6, "Altitude", "Altitude above Sea Level")
FC3:defineString("FC3_ANGLE_OF_ATTACK", function()
	return angle_of_attack or "0000"
end, 4, "String", "Angle of Attack")
FC3:defineString("FC3_FUEL_ALL", function()
	return fuel_percentage or "00000"
end, 5, "Engine", "Fuel Remaining")
FC3:defineString("FC3_INDICATED_AIRSPEED", function()
	return indicated_airspeed or "0000"
end, 4, "Speed", "Indicated Airspeed")
FC3:defineString("FC3_MACH_NUMBER", function()
	return mach_number or "0000"
end, 4, "Speed", "Mach Number")
FC3:defineString("FC3_TRUE_AIRSPEED", function()
	return true_air_speed or "0000"
end, 4, "Speed", "True Airspeed")
FC3:defineString("FC3_VERTICAL_VELOCITY", function()
	return vertical_velocity or "0000"
end, 4, "Speed", "Vertical Velocity")
FC3:defineIntegerFromGetter("FC3_RADAR_ALTITUDE", function()
	return radar_altitude
end, 3, "Altitude", "Radar Altitude")

--Engine
FC3:defineString("FC3_RPM_L", function()
	return left_rpm
end, 3, "Engine", "RPM Left Engine")
FC3:defineString("FC3_RPM_R", function()
	return right_rpm
end, 3, "Engine", "RPM Right Engine")
FC3:defineString("FC3_TEMP_L", function()
	return left_temp
end, 4, "Engine", "Temperature Left Engine")
FC3:defineString("FC3_TEMP_R", function()
	return right_temp
end, 4, "Engine", "Temperature Right Engine")
FC3:defineString("FC3_HYDPRESS_L", function()
	return left_hydraulic
end, 10, "Engine", "Hydraulic Pressure Left Engine")
FC3:defineString("FC3_HYDPRESS_R", function()
	return right_hydraulic
end, 10, "Engine", "Hydraulic Pressure Right Engine")
FC3:defineString("FC3_FUEL_CON_L", function()
	return left_fuel_consumption
end, 10, "Engine", "Fuel Consumption Left Engine")
FC3:defineString("FC3_FUEL_CON_R", function()
	return right_fuel_consumption
end, 10, "Engine", "Fuel Consumption Right Engine")

--Mechanical
FC3:defineIntegerFromGetter("FC3_GEAR", function()
	return gear_status
end, 1, "Mechanical", "Gear Status")

--Countermeasures
FC3:defineString("FC3_CHAFF", function()
	return chaffs
end, 3, "Countermeasures", "Chaff Counter")
FC3:defineString("FC3_FLARE", function()
	return flares
end, 3, "Countermeasures", "Flare Counter")

--Bar
FC3:defineIntegerFromGetter("FC3_FUEL_BAR", function()
	return fuel_bar
end, 16, "Bar", "Fuel Bar")
FC3:defineIntegerFromGetter("FC3_G_LOAD_BAR", function()
	return gload_bar
end, 16, "Bar", "G Load Bar")
FC3:defineIntegerFromGetter("FC3_VVI_BAR", function()
	return vvi_bar
end, 16, "Bar", "Vertical Velocity Bar")

--Float

FC3:define8BitFloatFromGetter("FC3_ADI_BANK", function()
	return adi_bank or 0
end, { -1, 1 }, "Float", "ADI Bank")

FC3:define8BitFloatFromGetter("FC3_ADI_PITCH", function()
	return adi_pitch or 0
end, { -1, 1 }, "Float", "ADI Pitch")

FC3:define8BitFloatFromGetter("FC3_ADI_YAW", function()
	return adi_yaw or 0
end, { -1, 1 }, "Float", "ADI Yaw")

FC3:define8BitFloatFromGetter("FC3_GLIDE_DEVIATION", function()
	return glide_deviation or 0
end, { -1, 1 }, "Float", "Glide Deviation")

FC3:define8BitFloatFromGetter("FC3_SIDE_DEVIATION", function()
	return side_deviation or 0
end, { -1, 1 }, "Float", "Side Deviation")

FC3:define8BitFloatFromGetter("FC3_SLIP_BALL_POSITION", function()
	return slip_ball_position or 0
end, { -1, 1 }, "Float", "Slip Ball Position")

--Externals
FC3:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_RIGHT", 182, "External Aircraft Model", "Right Speed Brake")
FC3:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_LEFT", 184, "External Aircraft Model", "Left Speed Brake")
FC3:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
FC3:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
FC3:defineBitFromDrawArgument("EXT_STROBE", 192, "External Aircraft Model", "Strobe Light")
FC3:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
FC3:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
FC3:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

return FC3
