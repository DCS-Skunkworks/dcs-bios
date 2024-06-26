return {
	std = "lua51",
	max_line_length = false, -- handled by stylua
	exclude_files = { "**/test/**/*.lua", "**/*API_defs.lua", "**/ext/*.lua" },
	globals = { "LuaExportStart", "LuaExportStop", "LuaExportBeforeNextFrame", "LuaExportAfterNextFrame" }, -- provided by dcs environment
	read_globals = {
		"lfs", -- module provided by dcs
		"GetDevice", -- all below functions are dcs globals
		"LoGetAircraftDrawArgumentValue",
		"LoGetSelfData",
		"LoGetModelTime",
		"LoGetMissionStartTime",
		"LoGetControlPanel_HSI",
		"LoGetPayloadInfo",
		"LoGetMagneticYaw",
		"LoGetMCPState",
		"LoGetTWSInfo",
		"LoGetBasicAtmospherePressure",
		"LoGetNavigationInfo",
		"LoIsOwnshipExportAllowed",
		"LoGetPilotName",
		"LoGetIndicatedAirSpeed",
		"LoGetRoute",
		"LoGetWingInfo",
		"LoGetVectorWindVelocity",
		"LoGetAngularVelocity",
		"LoGetFMData",
		"LoGetRadioBeaconsStatus",
		"LoGetVectorVelocity",
		"LoSetCommand",
		"LoSetCommand",
		"LoGetAngleOfSideSlip",
		"LoGetRadarAltimeter",
		"LoIsObjectExportAllowed",
		"LoIsSensorExportAllowed",
		"LoGetObjectById",
		"LoGetWorldObjects",
		"LoGetTargetInformation",
		"LoGetLockedTargetInformation",
		"LoGetF15_TWS_Contacts",
		"LoGetSightingSystemInfo",
		"LoGetWingTargets",
		"LoGetPlayerPlaneId",
		"LoGetAltitude",
		"LoGetNameByType",
		"LoGeoCoordinatesToLoCoordinates",
		"LoCoordinatesToGeoCoordinates",
		"LoGetAccelerationUnits",
		"LoGetADIPitchBankYaw",
		"LoGetSnares",
		"list_indication",
		"list_cockpit_params",
		"ValueConvert",
		"LoGetAltitudeAboveSeaLevel",
		"LoGetAltitudeAboveGroundLevel",
		"LoGetVerticalVelocity",
		"LoGetTrueAirSpeed",
		"LoGetMachNumber",
		"LoGetAngleOfAttack",
		"LoGetGlideDeviation",
		"LoGetSideDeviation",
		"LoGetSlipBallPosition",
		"LoGetEngineInfo",
		"LoGetMechInfo",
	},
}
