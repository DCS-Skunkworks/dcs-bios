module("MB-339", package.seeall)

local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local ICommand = require("Scripts.DCS-BIOS.lib.modules.ICommand")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

--- @class MB_339: Module
local MB_339 = Module:new("MB-339", 0x8200, { "MB-339A", "MB-339APAN" })

--by WarLord v1.1

-- remove Arg# Pilot 1000 / Copilot 1002

--- Adds a new indicator light control which will enable the LED when the argument value is greater than or equal to 0.3
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function MB_339:defineIndicatorLight08(identifier, arg_number, category, description)
	return self:defineGatedIndicatorLight(identifier, arg_number, 0.5, 0.9, category, description)
end

--- Adds a new control specifically for the flaps selector
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function MB_339:defineFlapsControl(identifier, arg_number, category, description)
	local alloc = self:allocateInt(2, identifier)

	local control = Control:new(category, ControlType.action, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(2, "set position"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "selector position"),
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(action)
		-- 0 = DOWN / 0.5 = TAKE OFF / 1 = UP
		local current_state = Module.round(GetDevice(0):get_argument_value(arg_number) * 2)

		if current_state == 0 then
			if action == "1" or action == "INC" then
				LoSetCommand(ICommand.flaps_maneuver_from_down)
			elseif action == "2" then
				LoSetCommand(ICommand.flaps_up)
			end
		elseif current_state == 1 then
			if action == "0" or action == "DEC" then
				LoSetCommand(ICommand.flaps_down)
			elseif action == "2" or action == "INC" then
				LoSetCommand(ICommand.flaps_up)
			end
		else -- 2
			if action == "1" or action == "DEC" then
				LoSetCommand(ICommand.flaps_maneuver_from_up)
			elseif action == "0" then
				LoSetCommand(ICommand.flaps_down)
			end
		end
	end)

	self:addExportHook(function(dev0)
		alloc:setValue(Module.round(dev0:get_argument_value(arg_number) * 2))
	end)

	return control
end

-- pulled from command_defs.lua
-- this isn't a pattern we normally follow, but IFE changes these values so often it's easier to just copy the file contents over
local COMMANDS = {
	BatterySwitch = 3095,
	Generator1Switch = 3096,
	Generator1ResetSwitch = 3097,
	Generator2Switch = 3098,
	Generator2ResetSwitch = 3099,
	AcPwrEmergSwitch = 3100,
	BusResetSwitch = 3101,
	BusResetGuard = 3102,
	AnemometerKnob = 3103,
	FwdAltimeterKnob = 3104,
	AftAltimeterKnob = 3105,
	FwdGmeterReset = 3106,
	AftGmeterReset = 3107,
	FwdChronoButton = 3108,
	FwdChronoKnobPull = 3109,
	FwdChronoKnobTurn = 3110,
	AftChronoButton = 3111,
	AftChronoKnobPull = 3112,
	AftChronoKnobTurn = 3113,
	FwdAdiPitchAdj = 3114,
	AftAdiPitchAdj = 3115,
	FwdAiKnobPull = 3116,
	FwdAiKnobRotate = 3117,
	AftAiKnobPull = 3118,
	AftAiKnobRotate = 3119,
	FwdHsiHeadingKnob = 3120,
	FwdHsiCourseKnob = 3121,
	AftHsiHeadingKnob = 3122,
	AftHsiCourseKnob = 3123,
	FwdFltDirHdg = 3124,
	FwdFltDirArm = 3125,
	FwdFltDirStby = 3126,
	FwdFltDirRadioNav = 3127,
	FwdFltDirGs = 3128,
	FwdFltDirAltHold = 3129,
	AftFltDirHdg = 3130,
	AftFltDirArm = 3131,
	AftFltDirStby = 3132,
	AftFltDirRadioNav = 3133,
	AftFltDirGs = 3134,
	AftFltDirAltHold = 3135,
	FwdFuelQtyKnob = 3136,
	FwdFuelQtyTest = 3137,
	AftFuelQtyKnob = 3138,
	AftFuelQtyTest = 3139,
	FwdFuelShutoffSwitch = 3140,
	FwdFuelShutoffGuard = 3141,
	AftFuelShutoffSwitch = 3142,
	AftFuelShutoffGuard = 3143,
	FuelTransferSwitch = 3144,
	FwdFuelDumpKnob = 3145,
	AftFuelDumpKnob = 3146,
	FwdAntiSkidOnOff = 3147,
	AftAntiSkidOnOff = 3148,
	ParkingBrakePull = 3149,
	ParkingBrakeLock = 3150,
	EmergLandingGear = 3151,
	FwdLandingGearOverride = 5000,
	AftLandingGearOverride = 5001,
	FwdTrimLeftRudder = 3152,
	FwdTrimRightRudder = 3153,
	AftTrimLeftRudder = 3154,
	AftTrimRightRudder = 3155,
	LandingGearLever = 5002,
	TaxiLandingLight = 3156,
	FormationLigths = 3157,
	FwdBrtInst = 3158,
	FwdFloodLight = 3159,
	FwdBrtConsolle = 3160,
	AftBrtInst = 3161,
	AftFloodLight = 3162,
	AftBrtConsolle = 3163,
	FlashLightIn = 3164,
	FlashLight = 3165,
	NavLightFlashSteady = 3167,
	NavLightBrtDim = 3168,
	BcnLightOnOff = 3169,
	FwdWarnLightBrtDim = 3170,
	AftWarnLightBrtDim = 3171,
	WarningTestButton = 3172,
	MasterCautionReset = 3173,
	WarningSilence = 3177,
	EngineMasterSwitch = 3178,
	EngineJptLimiterSwitch = 3179,
	StartEngineButton = 3180,
	FwdCanopyLockUnlock = 5004,
	CanopyHook = 5005,
	CanopyUnlock = 5006,
	CanopyHandle = 3181,
	AftCanopyLockUnlock = 5008,
	LockFlyControls = 5009,
	MirrorToggle = 3183,
	FwdGuardAilServo = 3189,
	FwdAilServo = 3190,
	AftGuardAilServo = 3191,
	AftAilServo = 3192,
	RamAirScoop = 3193,
	PressurizationSwitch = 3194,
	CabinPressureGuard = 3195,
	CabinTemp = 3196,
	SmokeMasterSwitch = 3197,
	SmokeWhiteSwitch = 3198,
	SmokeColorSwitch = 3199,
	EngineAntiIceSwitch = 3200,
	FrontPitotAntiIceSwitch = 3201,
	RearPitotAntiIceSwitch = 3202,
	WindshieldDemistSwitch = 3203,
	WindshieldRainRmvlSwitch = 3204,
	SeatFiringHandle = 3205,
	AdjSeatUp = 3207,
	AdjSeatDown = 3208,
	SeatPinToCanopy = 3209,
	SeatPinToSeat = 3210,
	FwdSeveranceHandle = 3211,
	FwdSeverancePin = 3212,
	AftSeveranceHandle = 3213,
	AftSeverancePin = 3214,
	FwdHsiTACAN = 3215,
	FwdHsiVor = 3216,
	FwdHsiRnav = 3217,
	AftHsiTACAN = 3218,
	AftHsiVor = 3219,
	AftHsiRnav = 3220,
	FwdControlShiftTacan = 3221,
	FwdControlShiftVorIls = 3222,
	FwdControlShiftNav = 3223,
	AftControlShiftTacan = 3224,
	AftControlShiftVorIls = 3225,
	AftControlShiftNav = 3226,
	FwdControlShiftComm1 = 3227,
	FwdControlShiftComm2 = 3228,
	FwdControlShiftAdf = 3229,
	AftControlShiftComm1 = 3230,
	AftControlShiftComm2 = 3231,
	AftControlShiftAdf = 3232,
	GpsPowerSwitch = 3233,
	FwdCduRow1Sel = 3234,
	FwdCduRow2Sel = 3235,
	FwdCduRow3Sel = 3236,
	FwdCduRow4Sel = 3237,
	FwdCduMark = 3238,
	FwdCduSet = 3239,
	FwdCduBrt = 3240,
	FwdCduDec = 3241,
	FwdCduInc = 3242,
	FwdCduN1 = 3243,
	FwdCduN2 = 3244,
	FwdCduN3 = 3245,
	FwdCduN4 = 3246,
	FwdCduN5 = 3247,
	FwdCduN6 = 3248,
	FwdCduN7 = 3249,
	FwdCduN8 = 3250,
	FwdCduN9 = 3251,
	FwdCduN0 = 3252,
	FwdCduClr = 3253,
	FwdCduEnt = 3254,
	FwdCduMode = 3255,
	FwdCduSteer = 3257,
	FwdCduFix = 3258,
	FwdCduFltPln = 3259,
	AftCduRow1Sel = 3260,
	AftCduRow2Sel = 3261,
	AftCduRow3Sel = 3262,
	AftCduRow4Sel = 3263,
	AftCduMark = 3264,
	AftCduSet = 3265,
	AftCduBrt = 3266,
	AftCduDec = 3267,
	AftCduInc = 3268,
	AftCduN1 = 3269,
	AftCduN2 = 3270,
	AftCduN3 = 3271,
	AftCduN4 = 3272,
	AftCduN5 = 3273,
	AftCduN6 = 3274,
	AftCduN7 = 3275,
	AftCduN8 = 3276,
	AftCduN9 = 3277,
	AftCduN0 = 3278,
	AftCduClr = 3279,
	AftCduEnt = 3280,
	AftCduMode = 3281,
	AftCduSteer = 3282,
	AftCduFix = 3283,
	AftCduFltPln = 3284,
	GroundFireGuard = 3285,
	MasterArmamentSwitch = 3286,
	SalvoJettison = 3287,
	SelectiveJettison = 3288,
	BombFuzeSelector = 3289,
	WeaponSequence = 3290,
	WeaponStation1 = 3291,
	WeaponStation2 = 3292,
	WeaponStation3 = 3293,
	WeaponStation4 = 3294,
	WeaponStation5 = 3295,
	WeaponStation6 = 3296,
	GroundFireSwitch = 3297,
	GuardMasterArmInib = 3298,
	MasterArmInib = 3299,
	GunsightPower = 3300,
	GunsightMode = 3301,
	GunsightBrt = 3302,
	GunsightTest = 3303,
	GunsightXxx = 3304,
	GunsightxXx = 3305,
	GunsightxxX = 3306,
	GunsightRepeaterPower = 3307,
	GunsightRepeaterBrt = 3308,
	FwdVorIls1MhzKnob = 3309,
	FwdVorIls50KhzKnob = 3310,
	FwdVorIlsTestButton = 3311,
	FwdVorIlsPowerSwitch = 3312,
	AftVorIls1MhzKnob = 3313,
	AftVorIls50KhzKnob = 3314,
	AftVorIlsTestButton = 3315,
	AftVorIlsPowerSwitch = 3316,
	FwdTacanMode = 3317,
	FwdTacanChannelXY = 3318,
	FwdTacanChannelUnit = 3319,
	FwdTacanChannelTens = 3320,
	FwdTacanTestButton = 3321,
	AftTacanMode = 3322,
	AftTacanChannelXY = 3323,
	AftTacanChannelUnit = 3324,
	AftTacanChannelTens = 3325,
	AftTacanTestButton = 3326,
	FwdComm1Function = 3327,
	FwdComm1Mode = 3328,
	FwdComm1FreqxxxxX = 3329,
	FwdComm1FreqxxxXx = 3330,
	FwdComm1FreqxxXxx = 3331,
	FwdComm1FreqxXxxx = 3332,
	FwdComm1FreqXxxxx = 3333,
	FwdComm1Squelch = 3334,
	FwdComm1Tone = 3335,
	FwdComm1Mem = 3336,
	FwdComm1SetChannel = 3337,
	AftComm1Function = 3338,
	AftComm1Mode = 3339,
	AftComm1FreqxxxxX = 3340,
	AftComm1FreqxxxXx = 3341,
	AftComm1FreqxxXxx = 3342,
	AftComm1FreqxXxxx = 3343,
	AftComm1FreqXxxxx = 3344,
	AftComm1Squelch = 3345,
	AftComm1Tone = 3346,
	AftComm1Mem = 3347,
	AftComm1SetChannel = 3348,
	FwdComm2Mode = 3349,
	FwdComm2Function = 3350,
	FwdComm2Brightness = 3351,
	FwdComm2ChannelxXDw = 3352,
	FwdComm2ChannelxXUp = 3353,
	FwdComm2ChannelXxDw = 3354,
	FwdComm2ChannelXxUp = 3355,
	FwdComm2FreqxxxxXDw = 3356,
	FwdComm2FreqxxxxXUp = 3357,
	FwdComm2FreqxxxXxDw = 3358,
	FwdComm2FreqxxxXxUp = 3359,
	FwdComm2FreqxxXxxDw = 3360,
	FwdComm2FreqxxXxxUp = 3361,
	FwdComm2FreqxXxxxDw = 3362,
	FwdComm2FreqxXxxxUp = 3363,
	FwdComm2FreqXxxxxDw = 3364,
	FwdComm2FreqXxxxxUp = 3365,
	FwdComm2Squelch = 3366,
	FwdComm2Modulation = 3368,
	FwdComm2Tod = 3369,
	AftComm2Mode = 3370,
	AftComm2Function = 3371,
	AftComm2Brightness = 3372,
	AftComm2ChannelxXDw = 3373,
	AftComm2ChannelxXUp = 3374,
	AftComm2ChannelXxDw = 3375,
	AftComm2ChannelXxUp = 3376,
	AftComm2FreqxxxxXDw = 3377,
	AftComm2FreqxxxxXUp = 3378,
	AftComm2FreqxxxXxDw = 3379,
	AftComm2FreqxxxXxUp = 3380,
	AftComm2FreqxxXxxDw = 3381,
	AftComm2FreqxxXxxUp = 3382,
	AftComm2FreqxXxxxDw = 3383,
	AftComm2FreqxXxxxUp = 3384,
	AftComm2FreqXxxxxDw = 3385,
	AftComm2FreqXxxxxUp = 3386,
	AftComm2Squelch = 3387,
	AftComm2Modulation = 3389,
	AftComm2Tod = 3390,
	FwdIcsComm1Switch = 3391,
	FwdIcsComm1Volume = 3392,
	FwdIcsComm2Switch = 3393,
	FwdIcsComm2Volume = 3394,
	FwdIcsTacanSwitch = 3395,
	FwdIcsTacanVolume = 3396,
	FwdIcsVorLocSwitch = 3397,
	FwdIcsVorLocVolume = 3398,
	FwdIcsAdfSwitch = 3399,
	FwdIcsAdfVolume = 3400,
	FwdIcsMkrSwitch = 3401,
	FwdIcsMkrVolume = 3402,
	FwdIcsIntSwitch = 3403,
	FwdIcsIntVolume = 3404,
	FwdIcsVolume = 3405,
	FwdIcsCallSwitch = 3406,
	FwdIcsCommSelector = 3407,
	AftIcsComm1Switch = 3408,
	AftIcsComm1Volume = 3409,
	AftIcsComm2Switch = 3410,
	AftIcsComm2Volume = 3411,
	AftIcsTacanSwitch = 3412,
	AftIcsTacanVolume = 3413,
	AftIcsVorLocSwitch = 3414,
	AftIcsVorLocVolume = 3415,
	AftIcsAdfSwitch = 3416,
	AftIcsAdfVolume = 3417,
	AftIcsMkrSwitch = 3418,
	AftIcsMkrVolume = 3419,
	AftIcsIntSwitch = 3420,
	AftIcsIntVolume = 3421,
	AftIcsVolume = 3422,
	AftIcsCallSwitch = 3423,
	AftIcsCommSelector = 3424,
	FwdOxigenOnOffSwitch = 3425,
	FwdOxigenNormal100 = 3426,
	FwdOxigenEmergency = 3427,
	AftOxigenOnOffSwitch = 3428,
	AftOxigenNormal100 = 3429,
	AftOxigenEmergency = 3430,
	FwdGloveCompartment = 3431,
	AftGloveCompartment = 3432,
	CurtainHandle = 3433,
	EltSwitch = 3434,
	IffMaster = 3436,
	IffCode = 3437,
	AntSwitch = 3438,
	M4Switch = 3439,
	Mode4AudioSwitch = 3440,
	RadSwitch = 3441,
	M1Switch = 3442,
	M2Switch = 3443,
	M3ASwitch = 3444,
	MCSwitch = 3445,
	IdentMicSwitch = 3446,
	CodeSwitchXxxxxx = 3448,
	CodeSwitchxXxxxx = 3449,
	CodeSwitchxxXxxx = 3450,
	CodeSwitchxxxXxx = 3451,
	CodeSwitchxxxxXx = 3452,
	CodeSwitchxxxxxX = 3453,
	PressToTestGo = 3454,
	PressToTestNoGo = 3455,
	PressToTestReply = 3456,
	AltimeterPressDec = 3457,
	AltimeterPressInc = 3458,
	EngineRelightDown = 3459,
	EngineRelightUp = 3460,
	EngineStopRelesed = 3461,
	EngineStopSwitch = 3462,
	EngineStopToggle = 3463,
	FlashLightToggle = 3464,
	GunsightPowerSwDownKey = 3465,
	GunsightPowerSwUpKey = 3466,
	GunsightTestToggleDown = 3467,
	GunsightTestToggleUp = 3468,
	GunsightModeToggle = 3469,
	ToggleParkingBrakeKey = 3470,
	SmokeColorStick = 3471,
	SmokeWhiteStick = 3472,
	ToggleEmergLandingGearKey = 3473,
	ToggleCommandMenu = 3474,
	TimeFwdDcsReal = 3475,
	ToggleCommandMenuComm1 = 3476,
	ToggleCommandMenuComm2 = 3477,
	GearDownSignalButton = 3478,
	ToggleMasterArmSwitchKey = 3479,
	BatterySwitchKey = 3480,
	Generator1SwitchKey = 3481,
	Generator1OnSwitchKey = 3482,
	Generator1OffSwitchKey = 3483,
	Generator1ResetSwitchKey = 3484,
	Generator2SwitchKey = 3485,
	Generator2OnSwitchKey = 3486,
	Generator2OffSwitchKey = 3487,
	Generator2ResetSwitchKey = 3488,
	AcEmergSwitchKey = 3489,
	EngineMasterSwitchKey = 3490,
	EngineJptLimiterSwitchKey = 3491,
	ToggleNoseTailSafe = 3492,
	ToggleTailOnlySafe = 3493,
	SalvoJettisonKey = 3494,
	SelectiveJettisonDownKey = 3495,
	SelectiveJettisonUpKey = 3496,
	LockFlyControlsKey = 3497,
	WeaponSequenceKey = 3498,
	WeaponStation1Key = 3499,
	WeaponStation2Key = 3500,
	WeaponStation3Key = 3501,
	WeaponStation4Key = 3502,
	WeaponStation5Key = 3503,
	WeaponStation6Key = 3504,
	FwdFuelDumpKnobKey = 3505,
	AftFuelDumpKnobKey = 3506,
	StartEngineButtonPressKey = 3507,
	StartEngineButtonUpKey = 3508,
	GunsightModeKey = 3509,
	ToggleFwdAntiSkidKey = 3510,
	ToggleAftAntiSkidKey = 3511,
	ToggleFuelTransferKey = 3512,
	ToggleFwdFuelShutOffKey = 3513,
	ToggleAftFuelShutOffKey = 3514,
	ToggleAhrGpsOnOffKey = 3515,
	ToggleEngineAntiIceKey = 3516,
	ToggleFwdAoaAntiIceKey = 3517,
	ToggleAftAoaAntiIceKey = 3518,
	ToggleWindShieldDemistKey = 3519,
	ToggleRainRmlvKey = 3520,
	ToggleMasterArmInibKey = 3521,
	ToggleBcnLightSwitchKey = 3522,
	ToggleFlashLightSwitchKey = 3523,
	ToggleNavLightOffToBrt = 3524,
	ToggleNavLightOffToDimm = 3525,
	ToggleTaxiLightOnOff = 3526,
	ToggleLandingLightOnOff = 3527,
	MasterCautionResetDownKey = 3528,
	MasterCautionResetUpKey = 3529,
	--FlapsDownPositionKey = 3530,
	--HotasFlapsUpPositionKey = 3531,
	--HotasFlapsTakeOffPositionKey = 3532,
	--HotasFlapsDownPositionKey = 3533,
	AirBrakeLeverStopped = 3534,
	AirBrakeLeverOn = 3535,
	AirBrakeLeverOff = 3536,
	ToggleAirBrakeLever = 3537,
	FwdCduRow1SelKey = 3538,
	FwdCduRow2SelKey = 3539,
	FwdCduRow3SelKey = 3540,
	FwdCduRow4SelKey = 3541,
	FwdCduMarkKey = 3542,
	FwdCduSetKey = 3543,
	FwdCduBrtKey = 3544,
	FwdCduDecKey = 3545,
	FwdCduIncKey = 3546,
	FwdCduN1Key = 3547,
	FwdCduN2Key = 3548,
	FwdCduN3Key = 3549,
	FwdCduN4Key = 3550,
	FwdCduN5Key = 3551,
	FwdCduN6Key = 3552,
	FwdCduN7Key = 3553,
	FwdCduN8Key = 3554,
	FwdCduN9Key = 3555,
	FwdCduN0Key = 3556,
	FwdCduClrKey = 3557,
	FwdCduEntKey = 3558,
	FwdCduModeKey = 3559,
	FwdCduSteerKey = 3560,
	FwdCduFixKey = 3561,
	FwdCduFltPlnKey = 3562,
	AftCduRow1SelKey = 3563,
	AftCduRow2SelKey = 3564,
	AftCduRow3SelKey = 3565,
	AftCduRow4SelKey = 3566,
	AftCduMarkKey = 3567,
	AftCduSetKey = 3568,
	AftCduBrtKey = 3569,
	AftCduDecKey = 3570,
	AftCduIncKey = 3571,
	AftCduN1Key = 3572,
	AftCduN2Key = 3573,
	AftCduN3Key = 3574,
	AftCduN4Key = 3575,
	AftCduN5Key = 3576,
	AftCduN6Key = 3577,
	AftCduN7Key = 3578,
	AftCduN8Key = 3579,
	AftCduN9Key = 3580,
	AftCduN0Key = 3581,
	AftCduClrKey = 3582,
	AftCduEntKey = 3583,
	AftCduModeKey = 3584,
	AftCduSteerKey = 3585,
	AftCduFixKey = 3586,
	AftCduFltPlnKey = 3587,
	FwdHsiTacanDownKey = 3588,
	FwdHsiTacanUpKey = 3589,
	FwdHsiVorDownKey = 3590,
	FwdHsiVorUpKey = 3591,
	FwdHsiRnavDownKey = 3592,
	FwdHsiRnavUpKey = 3593,
	AftHsiTacanDownKey = 3594,
	AftHsiTacanUpKey = 3595,
	AftHsiVorDownKey = 3596,
	AftHsiVorUpKey = 3597,
	AftHsiRnavDownKey = 3598,
	AftHsiRnavUpKey = 3599,
	StickPttSrs = 3600,
	Comm1PttSrs = 3601,
	Comm2PttSrs = 3602,
	StickPttVoip = 3603,
	Comm1PttVoip = 3604,
	Comm2PttVoip = 3605,
}

-- circuit breakers don't appear in command_defs.lua
--Breakers
MB_339:defineToggleSwitch("CB_IFF", 1, 3911, 1114, "Circuit Breakers", "C/B IFF")
MB_339:defineToggleSwitch("CB_HYD_PRESS", 1, 3912, 1115, "Circuit Breakers", "C/B Hyd Press")
MB_339:defineToggleSwitch("CB_OIL_PRESS", 1, 3913, 1116, "Circuit Breakers", "C/B Oil Press")
-- MB_339:defineToggleSwitch("CB_HSI", 1, 3914, 1121, "Circuit Breakers", "C/B HSI")
MB_339:reserveIntValue(1)
MB_339:defineToggleSwitch("CB_ADI", 1, 3915, 1122, "Circuit Breakers", "C/B ADI")
-- MB_339:defineToggleSwitch("CB_FD_CMPTR", 1, 3916, 1123, "Circuit Breakers", "C/B F/D Cmptr")
MB_339:reserveIntValue(1)
MB_339:defineToggleSwitch("CB_SIGHT", 1, 3917, 1124, "Circuit Breakers", "C/B Sight")
MB_339:defineToggleSwitch("CB_AHR_GPS", 1, 3918, 1125, "Circuit Breakers", "C/B AHR/GPS")
-- MB_339:defineToggleSwitch("CB_HSI_COMD", 1, 3919, 1126, "Circuit Breakers", "C/B HSI/COMD")
MB_339:reserveIntValue(1)
-- MB_339:defineToggleSwitch("CB_VOR_ILS", 1, 3920, 1127, "Circuit Breakers", "C/B VOR ILS")
MB_339:reserveIntValue(1)
-- MB_339:defineToggleSwitch("CB_UTIL_PW", 1, 3921, 1131, "Circuit Breakers", "C/B Util Pwr")
MB_339:reserveIntValue(1)
-- MB_339:defineToggleSwitch("CB_TACAN", 1, 3922, 1132, "Circuit Breakers", "C/B TACAN")
MB_339:reserveIntValue(1)
MB_339:defineToggleSwitch("CB_FORM_LT", 1, 3923, 1134, "Circuit Breakers", "C/B Form Lt")
MB_339:defineToggleSwitch("CB_AHR_GPS2", 1, 3924, 1135, "Circuit Breakers", "C/B AHR/GPS")
-- MB_339:defineToggleSwitch("CB_ADF", 1, 3925, 1136, "Circuit Breakers", "C/B ADF")
MB_339:reserveIntValue(1)
-- MB_339:defineToggleSwitch("CB_TACAN2", 1, 3926, 1132, "Circuit Breakers", "C/B TACAN")
MB_339:reserveIntValue(1)
MB_339:defineToggleSwitch("CB_STBY_ATT_FWD", 1, 3929, 1213, "Circuit Breakers", "C/B Fwd Stby Att Ind")
MB_339:defineToggleSwitch("CB_STBY_ATT_AFT", 1, 3930, 1214, "Circuit Breakers", "C/B Aft Stby Att Ind")
MB_339:defineToggleSwitch("CB_COMM2", 1, 3931, 1215, "Circuit Breakers", "C/B COMM2")
MB_339:defineToggleSwitch("CB_IFF_2", 1, 3933, 1217, "Circuit Breakers", "C/B IFF 2")
MB_339:defineToggleSwitch("CB_WING_FLAP", 1, 3934, 1221, "Circuit Breakers", "C/B Wing Flap")
MB_339:defineToggleSwitch("CB_SPD_BRAKE", 1, 3935, 1222, "Circuit Breakers", "C/B Spd Brake")
MB_339:defineToggleSwitch("CB_POS_IND", 1, 3936, 1223, "Circuit Breakers", "C/B Pos Ind")
MB_339:defineToggleSwitch("CB_LG", 1, 3937, 1224, "Circuit Breakers", "C/B LG")
MB_339:defineToggleSwitch("CB_LG_DN_MON", 1, 3938, 1225, "Circuit Breakers", "C/B LG Down Mon")
MB_339:defineToggleSwitch("CB_FUEL_QTY", 1, 3939, 1226, "Circuit Breakers", "C/B Fuel Qty")
MB_339:defineToggleSwitch("CB_JPT_IND", 1, 3940, 1227, "Circuit Breakers", "C/B Jpt Ind")
MB_339:defineToggleSwitch("CB_AIR_COND", 1, 3941, 1231, "Circuit Breakers", "C/B Air Cond")
MB_339:defineToggleSwitch("CB_ENG_START", 1, 3942, 1232, "Circuit Breakers", "C/B Eng Start")
MB_339:defineToggleSwitch("CB_DUMP_OFF", 1, 3946, 1236, "Circuit Breakers", "C/B Dump Shut-Off")
MB_339:defineToggleSwitch("CB_OXY_PRESS", 1, 3949, 1242, "Circuit Breakers", "C/B Oxy Press")
MB_339:defineToggleSwitch("CB_ARMT_SEL", 1, 3950, 1243, "Circuit Breakers", "C/B Armt Sel")
MB_339:defineToggleSwitch("CB_FUEL_PUMP", 1, 3951, 1244, "Circuit Breakers", "C/B Fuel Pump")
MB_339:defineToggleSwitch("CB_STORE_JETT", 1, 3952, 1245, "Circuit Breakers", "C/B Store Jett")
MB_339:defineToggleSwitch("CB_INV_MAIN", 1, 3953, 1246, "Circuit Breakers", "C/B Main Inv")
MB_339:defineToggleSwitch("CB_INV_STBY", 1, 3954, 1247, "Circuit Breakers", "C/B Stby Inv")
MB_339:defineToggleSwitch("CB_TRIM_A_E", 1, 3955, 1251, "Circuit Breakers", "C/B Ail & Elev Trim")
MB_339:defineToggleSwitch("CB_AIL_SERVO", 1, 3956, 1252, "Circuit Breakers", "C/B Ail Servo")
MB_339:defineToggleSwitch("CB_CAUTION_L", 1, 3957, 1253, "Circuit Breakers", "C/B Caution Lt")
MB_339:defineToggleSwitch("CB_INV_CONTR_MAIN", 1, 3959, 1255, "Circuit Breakers", "C/B Main Inv Contr")
MB_339:defineToggleSwitch("CB_INV_CONTR_STBY", 1, 3961, 1257, "Circuit Breakers", "C/B Stby Inv Contr")
MB_339:defineToggleSwitch("CB_ANTI_SKID", 1, 3962, 1411, "Circuit Breakers", "C/B Anti-Skid")
MB_339:defineToggleSwitch("CB_AC_PRI_BUS", 1, 3963, 1412, "Circuit Breakers", "C/B AC Pri Bus")
MB_339:defineToggleSwitch("CB_LDG_L_MTR", 1, 3965, 1414, "Circuit Breakers", "C/B Ldg Lt Mtr")
MB_339:defineToggleSwitch("CB_BCN", 1, 3966, 1415, "Circuit Breakers", "C/B Bcn")
MB_339:defineToggleSwitch("CB_NAV_L", 1, 3967, 1416, "Circuit Breakers", "C/B Nav Lt")
MB_339:defineToggleSwitch("CB_AOA", 1, 3973, 1431, "Circuit Breakers", "C/B AOA")
MB_339:defineToggleSwitch("CB_NW_STEER", 1, 3974, 1432, "Circuit Breakers", "C/B NW Steer")
MB_339:defineToggleSwitch("CB_JPT_LIMIT", 1, 3975, 1433, "Circuit Breakers", "C/B JPT Limiter")
MB_339:defineToggleSwitch("CB_FUEL_FLOW_IND", 1, 3977, 1435, "Circuit Breakers", "C/B Fuel Flow ind")
MB_339:defineToggleSwitch("CB_FUEL_TRANS", 1, 3978, 1436, "Circuit Breakers", "C/B Fuel Trans")
MB_339:defineToggleSwitch("CB_TRIM_R", 1, 3979, 1437, "Circuit Breakers", "C/B Rud Trim")
MB_339:defineToggleSwitch("CB_TAXI_L", 1, 3982, 1445, "Circuit Breakers", "C/B Taxi Lt")
MB_339:defineToggleSwitch("CB_LDG_L", 1, 3983, 1446, "Circuit Breakers", "C/B Ldg Lt")
MB_339:defineToggleSwitch("CB_PITOT_FWD", 1, 3984, 1452, "Circuit Breakers", "C/B Fwd Pitot")
MB_339:defineToggleSwitch("CB_PITOT_AFT", 1, 3985, 1453, "Circuit Breakers", "C/B Aft Pitot")
MB_339:defineToggleSwitch("CB_ENG_ANTI_ICE", 1, 3986, 1454, "Circuit Breakers", "C/B Engine Anti-Ice")
MB_339:defineToggleSwitch("CB_WHSLD_DEM", 1, 3987, 1455, "Circuit Breakers", "C/B Whsld Dem")
MB_339:defineToggleSwitch("CB_ICE_DETR", 1, 3988, 1456, "Circuit Breakers", "C/B Ice Detr")
MB_339:defineToggleSwitch("CB_SIGHT2", 1, 3989, 1457, "Circuit Breakers", "C/B Sight")
MB_339:defineToggleSwitch("CB_CDU_FWD", 1, 3990, 1511, "Circuit Breakers", "C/B Fwd Cdu")
MB_339:defineToggleSwitch("CB_CDU_AFT", 1, 3991, 1512, "Circuit Breakers", "C/B Aft Cdu")
MB_339:defineToggleSwitch("CB_AHR_GPS3", 1, 3992, 1513, "Circuit Breakers", "C/B AHR/GPS")
MB_339:defineToggleSwitch("CB_COMM_RDU", 1, 3995, 1522, "Circuit Breakers", "C/B COMM RDU")

--Electrical
MB_339:defineToggleSwitch("BATTERY_SW", 1, COMMANDS.BatterySwitch, 300, "Electrical", "Battery Switch")
MB_339:reserveIntValue(1) -- MB_339:defineToggleSwitch("GEN1_SW", 1, COMMANDS.Generator1Switch, 301, "Electrical", "Generator 1 Switch")
MB_339:reserveIntValue(1) -- MB_339:defineToggleSwitch("GEN2_SW", 1, COMMANDS.Generator2Switch, 302, "Electrical", "Generator 2 Switch")
MB_339:defineToggleSwitch("AC_PW_SW", 1, COMMANDS.AcPwrEmergSwitch, 303, "Electrical", "AC Power Switch")
MB_339:defineToggleSwitch("BUS_RESET_SW", 1, COMMANDS.BusResetSwitch, 231, "Electrical", "Bus Reset Switch")
MB_339:defineToggleSwitch("BUS_RESET_CV", 1, COMMANDS.BusResetGuard, 233, "Electrical", "Bus Reset Cover")

--Simple avionics
MB_339:defineRotary("FW_SET_INDEX", 1, COMMANDS.AnemometerKnob, 541, "Avionics FW", "Forward Set Index")
MB_339:defineRotary("FW_ALT_KNOB", 1, COMMANDS.FwdAltimeterKnob, 241, "Avionics FW", "Forward Altimeter Pressure Setting")
MB_339:definePushButton("FW_G_RESET", 1, COMMANDS.FwdGmeterReset, 259, "Avionics FW", "Forward Reset Min/Max G")

MB_339:defineRotary("AFT_ALTIMETER_KNOB", 1, COMMANDS.AftAltimeterKnob, 570, "Avionics AFT", "Aft Altimeter Pressure Setting")
MB_339:definePushButton("AFT_G_RESET", 1, COMMANDS.AftGmeterReset, 691, "Avionics AFT", "Aft Reset Min/Max G")

MB_339:defineFloat("FW_AIRSPEED_IND_G", 8, { 0, 1 }, "Avionics Gauges", "Forward Mach Airspeed Indicator")
MB_339:defineFloat("FW_AIRSPEED_ARROW_O_G", 542, { 0, 1 }, "Avionics Gauges", "Forward Mach Airspeed Outer Arrow")
MB_339:defineFloat("FW_AIRSPEED_DISC_G", 543, { 0, 1 }, "Avionics Gauges", "Forward Mach Airspeed Disc")
MB_339:defineFloat("FW_AIRSPEED_ARROW_I_G", 544, { 0, 1 }, "Avionics Gauges", "Forward Mach Airspeed Inner Arrow")
MB_339:defineFloat("FW_ADI_PITCH_G", 9, { -1, 1 }, "Avionics Gauges", "Forward ADI Pitch")
MB_339:defineFloat("FW_ADI_BANK_G", 10, { -1, 1 }, "Avionics Gauges", "Forward ADI Bank")
MB_339:defineFloat("FW_ADI_GS_G", 11, { -1, 1 }, "Avionics Gauges", "Forward ADI Glide Slope Indicator")
MB_339:defineFloat("FW_ADI_GS_WARN_G", 22, { 0, 1 }, "Avionics Gauges", "Forward ADI Glide Slope Warning Flag")
MB_339:defineFloat("FW_ADI_FD_FLAG_G", 23, { 0, 1 }, "Avionics Gauges", "Forward ADI Flight Director Flag")
MB_339:defineFloat("FW_ALT_100_G", 50, { 0, 1 }, "Avionics Gauges", "Forward Altimeter 100 ft count & Needle")
MB_339:defineFloat("FW_ALT_1000_G", 52, { 0, 1 }, "Avionics Gauges", "Forward Altimeter 1000 ft count")
MB_339:defineFloat("FW_ALT_10000_G", 53, { 0, 1 }, "Avionics Gauges", "Forward Altimeter 10000 ft count")
MB_339:defineFloat("FW_VVI_G", 208, { -1, 1 }, "Avionics Gauges", "Forward Vertical Velocity Indicator")
MB_339:defineFloat("FW_ALT_PRESS_1000_G", 242, { 0, 1 }, "Avionics Gauges", "Forward Altimeter Pressure 1000")
MB_339:defineFloat("FW_ALT_PRESS_100_G", 243, { 0, 1 }, "Avionics Gauges", "Forward Altimeter Pressure 100")
MB_339:defineFloat("FW_ALT_PRESS_10_G", 244, { 0, 1 }, "Avionics Gauges", "Forward Altimeter Pressure 10")
MB_339:defineFloat("FW_ALT_PRESS_1_G", 245, { 0, 1 }, "Avionics Gauges", "Forward Altimeter Pressure 1")
MB_339:defineFloat("FW_COMP_UD_G", 299, { -1, 1 }, "Avionics Gauges", "Forward Compassrose Up/Down")
MB_339:defineFloat("FW_COMP_NS_G", 305, { 0, 1 }, "Avionics Gauges", "Forward Compassrose N/S")
MB_339:defineFloat("FW_ALT_OFF_G", 311, { 0, 1 }, "Avionics Gauges", "Forward Altimeter CODE OFF Flag")
MB_339:defineFloat("FW_ACCEL_G", 6, { -1, 1 }, "Avionics Gauges", "Forward Accelerometer")
MB_339:defineFloat("FW_ACCEL_MIN", 320, { 0, 1 }, "Avionics Gauges", "Forward Accelerometer Min Pointer")
MB_339:defineFloat("FW_ACCEL_MAX", 349, { 0, 1 }, "Avionics Gauges", "Forward Accelerometer Max Pointer")
MB_339:defineFloat("AFT_ACCEL_G", 688, { -1, 1 }, "Avionics Gauges", "Aft Accelerometer")
MB_339:defineFloat("AFT_ACCEL_MIN", 690, { 0, 1 }, "Avionics Gauges", "Aft Accelerometer Min Pointer")
MB_339:defineFloat("AFT_ACCEL_MAX", 689, { 0, 1 }, "Avionics Gauges", "Aft Accelerometer Max Pointer")
MB_339:defineFloat("AFT_ADI_GS_G", 12, { -1, 1 }, "Avionics Gauges", "Aft ADI Glide Slope Indicator")
MB_339:defineFloat("AFT_ADI_TURN_G", 13, { -1, 1 }, "Avionics Gauges", "Aft ADI Rate-of-Turn Indicator")
MB_339:defineFloat("AFT_ALT_CFLAG_G", 19, { 0, 1 }, "Avionics Gauges", "Aft Altimeter CODE OFF Flag")
MB_339:defineFloat("AFT_ALT_100_G", 530, { 0, 1 }, "Avionics Gauges", "Aft Altimeter 100 ft count & Needle")
MB_339:defineFloat("AFT_ALT_1000_G", 531, { 0, 1 }, "Avionics Gauges", "Aft Altimeter 1000 ft count")
MB_339:defineFloat("AFT_ALT_10000_G", 532, { 0, 1 }, "Avionics Gauges", "Aft Altimeter 10000 ft count")
MB_339:defineFloat("AFT_ALT_PRESS_1000_G", 533, { 0, 1 }, "Avionics Gauges", "Aft Altimeter Pressure 1000")
MB_339:defineFloat("AFT_ALT_PRESS_100_G", 534, { 0, 1 }, "Avionics Gauges", "Aft Altimeter Pressure 100")
MB_339:defineFloat("AFT_ALT_PRESS_10_G", 535, { 0, 1 }, "Avionics Gauges", "Aft Altimeter Pressure 10")
MB_339:defineFloat("AFT_ALT_PRESS_1_G", 536, { 0, 1 }, "Avionics Gauges", "Aft Altimeter Pressure 1")
MB_339:defineFloat("AFT_AIRSPEED_IND_G", 545, { 0, 1 }, "Avionics Gauges", "Aft Mach Airspeed Indicator")
MB_339:defineFloat("AFT_AIRSPEED_ARROW_O_G", 549, { 0, 1 }, "Avionics Gauges", "Aft Mach Airspeed Outer Arrow")
MB_339:defineFloat("AFT_AIRSPEED_DISC_G", 547, { 0, 1 }, "Avionics Gauges", "Aft Mach Airspeed Disc")
MB_339:defineFloat("AFT_AIRSPEED_ARROW_I_G", 548, { 0, 1 }, "Avionics Gauges", "Aft Mach Airspeed Inner Arrow")
MB_339:defineFloat("AFT_VVI_G", 692, { -1, 1 }, "Avionics Gauges", "Aft Vertical Velocity Indicator")
MB_339:defineFloat("FLAP_G", 1, { 0, 1 }, "Avionics Gauges", "Flaps Position Indicator")
MB_339:defineFloat("SPEED_BRK_G", 2, { 0, 1 }, "Avionics Gauges", "Speed Brake Position Indicator")
MB_339:defineFloat("LONG_TRIM_G", 3, { -1, 1 }, "Avionics Gauges", "Longitudinal Trim Indicator")
MB_339:defineFloat("FLAP_LVR_G", 7, { 0, 1 }, "Avionics Gauges", "Flaps Lever")
MB_339:defineFloat("TACHO_RPM_G", 16, { 0, 1 }, "Avionics Gauges", "Tachometer Percent RPM")
MB_339:defineFloat("ADI_OFF_G", 21, { 0, 1 }, "Avionics Gauges", "ADI OFF Flag")
MB_339:defineFloat("TACHO_G", 33, { 0, 1 }, "Avionics Gauges", "Tachometer")
MB_339:defineFloat("HYD_PRESS_MAIN_G", 150, { 0, 1 }, "Avionics Gauges", "Main Hydraulic Pressure Gauge")
MB_339:defineFloat("HYD_PRESS_EMERG_G", 151, { 0, 1 }, "Avionics Gauges", "Emergency Hydraulic Pressure Gauge")
MB_339:defineFloat("OIL_PRESS_G", 152, { 0, 1 }, "Avionics Gauges", "Oil Pressure Gauge")
MB_339:defineFloat("OXY_PRESS_G", 153, { 0, 1 }, "Avionics Gauges", "Oxygen Pressure Gauge")
MB_339:defineFloat("AOA_OFF_G", 310, { 0, 1 }, "Avionics Gauges", "AOA OFF Flag")
MB_339:defineFloat("AOA_G", 315, { 0, 1 }, "Avionics Gauges", "AOA Gauge")
MB_339:defineFloat("CABIN_PRESS_G", 319, { 0, 1 }, "Avionics Gauges", "Cabin Pressure Gauge")
MB_339:defineFloat("LOADM_GEN1_G", 380, { 0, 1 }, "Avionics Gauges", "GEN 1 Loadmeter Gauge")
MB_339:defineFloat("LOADM_GEN2_G", 381, { 0, 1 }, "Avionics Gauges", "GEN 2 Loadmeter Gauge")

--Chrono
MB_339:definePushButton("FW_CLOCK_BTN", 1, COMMANDS.FwdChronoButton, 44, "Clock FW", "Forward Clock Start/Stop/Reset")
MB_339:defineToggleSwitch("FW_CLOCK_SET_PULL", 1, COMMANDS.FwdChronoKnobPull, 45, "Clock FW", "Forward Clock Set Pull")
MB_339:defineRotary("FW_CLOCK_SET_KNOB", 1, COMMANDS.FwdChronoKnobTurn, 51, "Clock FW", "Forward Clock Set Rotate")

MB_339:definePushButton("AFT_CLOCK_BTN", 1, COMMANDS.AftChronoButton, 28, "Clock AFT", "Aft Clock Start/Stop/Reset")
MB_339:defineToggleSwitch("AFT_CLOCK_SET_PULL", 1, COMMANDS.AftChronoKnobPull, 29, "Clock AFT", "Aft Clock Set Pull")
MB_339:defineRotary("AFT_CLOCK_SET_KNOB", 1, COMMANDS.AftChronoKnobTurn, 30, "Clock AFT", "Aft Clock Set Rotate")

MB_339:defineFloat("FW_CLOCK_M_G", 46, { 0, 1 }, "Clock Gauges", "Forward Clock Minutes Indicator")
MB_339:defineFloat("FW_CLOCK_H_G", 47, { 0, 1 }, "Clock Gauges", "Forward Clock Hours Indicator")
MB_339:defineFloat("FW_CLOCK_S_G", 48, { 0, 1 }, "Clock Gauges", "Forward Clock Seconds Indicator")
MB_339:defineFloat("FW_CLOCK_SET_G", 49, { 0, 1 }, "Clock Gauges", "Forward Clock Set Indicator")
MB_339:defineFloat("AFT_CLOCK_M_G", 24, { 0, 1 }, "Clock Gauges", "Aft Clock Minutes Indicator")
MB_339:defineFloat("AFT_CLOCK_H_G", 25, { 0, 1 }, "Clock Gauges", "Aft Clock Hours Indicator")
MB_339:defineFloat("AFT_CLOCK_S_G", 26, { 0, 1 }, "Clock Gauges", "Aft Clock Seconds Indicator")
MB_339:defineFloat("AFT_CLOCK_SET_G", 27, { 0, 1 }, "Clock Gauges", "Aft Clock Set Indicator")

-- ADI
MB_339:definePotentiometer("FW_ADI_PITCH", 1, COMMANDS.FwdAdiPitchAdj, 15, { 0, 1 }, "ADI FW", "Forward ADI Pitch Adjustment")
MB_339:defineToggleSwitch("FW_ATT_CAGE", 1, COMMANDS.FwdAiKnobPull, 403, "ADI FW", "Forward Attitude Indicator Cage")
MB_339:definePotentiometer("FW_ATT_ADJUST", 1, COMMANDS.FwdAiKnobRotate, 401, { -1, 1 }, "ADI FW", "Forward Attitude Indicator Adjust")

MB_339:definePotentiometer("AFT_ADI_PITCH", 1, COMMANDS.AftAdiPitchAdj, 388, { 0, 1 }, "ADI AFT", "Aft ADI Pitch Adjustment")
MB_339:defineToggleSwitch("AFT_ATT_CAGE", 1, COMMANDS.AftAiKnobPull, 404, "ADI AFT", "Aft Attitude Indicator Cage")
MB_339:definePotentiometer("AFT_ATT_ADJUST", 1, COMMANDS.AftAiKnobRotate, 402, { -1, 1 }, "ADI AFT", "Aft Attitude Indicator Adjust")

MB_339:defineFloat("FW_ADI_SLIP_G", 371, { -1, 1 }, "ADI Gauges", "Forward ADI Slipball")
MB_339:defineFloat("FW_ADI_STEER_B_BANK_G", 372, { -1, 1 }, "ADI Gauges", "Forward ADI Bank Steering Bar")
MB_339:defineFloat("FW_ADI_STEER_B_PITCH_G", 373, { -1, 1 }, "ADI Gauges", "Forward ADI Pitch Steering Bar")
MB_339:defineFloat("FW_ATT_PITCH_G", 389, { -1, 1 }, "ADI Gauges", "Forward Attitude Indicator Pitch")
MB_339:defineFloat("FW_ATT_BANK_G", 390, { -1, 1 }, "ADI Gauges", "Forward Attitude Indicator Bank")
MB_339:defineFloat("FW_ATT_OFF_G", 405, { 0, 1 }, "ADI Gauges", "Forward Attitude Indicator OFF Flag")
MB_339:defineFloat("AFT_ADI_PITCH_G", 386, { -1, 1 }, "ADI Gauges", "Aft ADI Pitch")
MB_339:defineFloat("AFT_ADI_BANK_G", 387, { -1, 1 }, "ADI Gauges", "Aft ADI Bank")
MB_339:defineFloat("AFT_ADI_OFF_G", 393, { 0, 1 }, "ADI Gauges", "Aft ADI OFF Flag")
MB_339:defineFloat("AFT_ADI_GLIDE_WARN_G", 394, { 0, 1 }, "ADI Gauges", "Aft ADI Glide Slope Warning Flag")
MB_339:defineFloat("AFT_ADI_CRS_WARN_G", 395, { 0, 1 }, "ADI Gauges", "Aft ADI Course Warning Flag")
MB_339:defineFloat("AFT_ADI_STEER_B_BANK_G", 396, { -1, 1 }, "ADI Gauges", "Aft ADI Bank Steering Bar")
MB_339:defineFloat("AFT_ADI_STEER_B_PITCH_G", 397, { -1, 1 }, "ADI Gauges", "Aft ADI Pitch Steering Bar")
MB_339:defineFloat("AFT_ADI_SLIP_G", 397, { -1, 1 }, "ADI Gauges", "Aft ADI Slipball")
MB_339:defineFloat("AFT_ATT_PITCH_G", 391, { -1, 1 }, "ADI Gauges", "Aft Attitude Indicator Pitch")
MB_339:defineFloat("AFT_ATT_BANK_G", 392, { -1, 1 }, "ADI Gauges", "Aft Attitude Indicator Bank")
MB_339:defineFloat("AFT_ATT_OFF_G", 406, { -1, 1 }, "ADI Gauges", "Aft Attitude Indicator OFF Flag")
MB_339:defineFloat("ADI_TURN_G", 687, { -1, 1 }, "ADI Gauges", "ADI Rate of Turn Indicator")

--HSI
MB_339:defineRotary("FW_HSI_HDG", 1, COMMANDS.FwdHsiHeadingKnob, 362, "HSI FW", "Forward HSI Heading Set")
MB_339:defineRotary("FW_HSI_CRS", 1, COMMANDS.FwdHsiCourseKnob, 353, "HSI FW", "Forward HSI Course Set")
MB_339:definePushButton("FW_HSI_TCN", 1, COMMANDS.FwdHsiTACAN, 346, "HSI FW", "Forward HSI TACAN")
MB_339:definePushButton("FW_HSI_VOR", 1, COMMANDS.FwdHsiVor, 347, "HSI FW", "Forward HSI VOR")
MB_339:definePushButton("FW_HSI_RNAV", 1, COMMANDS.FwdHsiRnav, 348, "HSI FW", "Forward HSI RNAV")

MB_339:defineRotary("AFT_HSI_HDG", 1, COMMANDS.AftHsiHeadingKnob, 196, "HSI AFT", "Aft HSI Heading Set")
MB_339:defineRotary("AFT_HSI_CRS", 1, COMMANDS.AftHsiCourseKnob, 187, "HSI AFT", "Aft HSI Course Set")
MB_339:definePushButton("AFT_HSI_TCN", 1, COMMANDS.AftHsiTACAN, 57, "HSI AFT", "Aft HSI TACAN")
MB_339:definePushButton("AFT_HSI_VOR", 1, COMMANDS.AftHsiVor, 58, "HSI AFT", "Aft HSI VOR")
MB_339:definePushButton("AFT_HSI_RNAV", 1, COMMANDS.AftHsiRnav, 59, "HSI AFT", "Aft HSI RNAV")

MB_339:defineFloat("FW_HSI_CRS_1_G", 350, { 0, 1 }, "HSI Gauges", "Forward HSI Course Drum 1")
MB_339:defineFloat("FW_HSI_CRS_10_G", 351, { 0, 1 }, "HSI Gauges", "Forward HSI Course Drum 10")
MB_339:defineFloat("FW_HSI_CRS_100_G", 352, { 0, 1 }, "HSI Gauges", "Forward HSI Course Drum 100")
MB_339:defineFloat("FW_HSI_CRS_A_G", 354, { 0, 1 }, "HSI Gauges", "Forward HSI Course Arrow")
MB_339:defineFloat("FW_HSI_OFF_G", 355, { 0, 1 }, "HSI Gauges", "Forward HSI OFF Flag")
MB_339:defineFloat("FW_HSI_DIST_G", 356, { 0, 1 }, "HSI Gauges", "Forward HSI Distance Bar")
MB_339:defineFloat("FW_HSI_DIST_1_G", 357, { 0, 1 }, "HSI Gauges", "Forward HSI Distance Drum 1")
MB_339:defineFloat("FW_HSI_DIST_10_G", 358, { 0, 1 }, "HSI Gauges", "Forward HSI Distance Drum 10")
MB_339:defineFloat("FW_HSI_DIST_100_G", 359, { 0, 1 }, "HSI Gauges", "Forward HSI Distance Drum 100")
MB_339:defineFloat("FW_HSI_CRS_DEV_G", 360, { -1, 1 }, "HSI Gauges", "Forward HSI Course Deviation Bar")
MB_339:defineFloat("FW_HSI_COMP_G", 361, { 0, 1 }, "HSI Gauges", "Forward HSI Compass Rose")
MB_339:defineFloat("FW_HSI_SEL_HD_G", 363, { 0, 1 }, "HSI Gauges", "Forward HSI Selected Heading Indicator")
MB_339:defineFloat("FW_HSI_POINT_1_G", 364, { 0, 1 }, "HSI Gauges", "Forward HSI Bearing Pointer 1")
MB_339:defineFloat("FW_HSI_POINT_2_G", 365, { 0, 1 }, "HSI Gauges", "Forward HSI Bearing Pointer 2")
MB_339:defineFloat("FW_HSI_DEV_G", 366, { 0, 1 }, "HSI Gauges", "Forward HSI Deviation Flag")
MB_339:defineFloat("FW_HSI_ARROW_UP_G", 367, { 0, 1 }, "HSI Gauges", "Forward HSI Arrow UP")
MB_339:defineFloat("FW_HSI_ARROW_DN_G", 368, { 0, 1 }, "HSI Gauges", "Forward HSI Arrow DN")

MB_339:defineFloat("AFT_HSI_CRS_1_G", 184, { 0, 1 }, "HSI Gauges", "Aft HSI Course Drum 1")
MB_339:defineFloat("AFT_HSI_CRS_10_G", 185, { 0, 1 }, "HSI Gauges", "Aft HSI Course Drum 10")
MB_339:defineFloat("AFT_HSI_CRS_100_G", 186, { 0, 1 }, "HSI Gauges", "Aft HSI Course Drum 100")
MB_339:defineFloat("AFT_HSI_CRS_A_G", 188, { 0, 1 }, "HSI Gauges", "Aft HSI Course Arrow")
MB_339:defineFloat("AFT_HSI_OFF_G", 189, { 0, 1 }, "HSI Gauges", "Aft HSI OFF Flag")
MB_339:defineFloat("AFT_HSI_DIST_G", 190, { 0, 1 }, "HSI Gauges", "Aft HSI Distance Bar")
MB_339:defineFloat("AFT_HSI_DIST_1_G", 191, { 0, 1 }, "HSI Gauges", "Aft HSI Distance Drum 1")
MB_339:defineFloat("AFT_HSI_DIST_10_G", 192, { 0, 1 }, "HSI Gauges", "Aft HSI Distance Drum 10")
MB_339:defineFloat("AFT_HSI_DIST_100_G", 193, { 0, 1 }, "HSI Gauges", "Aft HSI Distance Drum 100")
MB_339:defineFloat("AFT_HSI_CRS_DEV_G", 194, { -1, 1 }, "HSI Gauges", "Aft HSI Course Deviation Bar")
MB_339:defineFloat("AFT_HSI_COMP_G", 195, { 0, 1 }, "HSI Gauges", "Aft HSI Compass Rose")
MB_339:defineFloat("AFT_HSI_SEL_HD_G", 197, { 0, 1 }, "HSI Gauges", "Aft HSI Selected Heading Indicator")
MB_339:defineFloat("AFT_HSI_POINT_1_G", 198, { 0, 1 }, "HSI Gauges", "Aft HSI Bearing Pointer 1")
MB_339:defineFloat("AFT_HSI_POINT_2_G", 199, { 0, 1 }, "HSI Gauges", "Aft HSI Bearing Pointer 2")
MB_339:defineFloat("AFT_HSI_DEV_G", 200, { 0, 1 }, "HSI Gauges", "Aft HSI Deviation Flag")
MB_339:defineFloat("AFT_HSI_ARROW_UP_G", 201, { 0, 1 }, "HSI Gauges", "Aft HSI Arrow UP")
MB_339:defineFloat("AFT_HSI_ARROW_DN_G", 202, { 0, 1 }, "HSI Gauges", "Aft HSI Arrow DN")

MB_339:defineIndicatorLight08("FW_HSI_TCN_L", 369, "HSI Lights", "Forward HSI TACAN Light (green)")
MB_339:defineIndicatorLight08("FW_HSI_VOR_L", 370, "HSI Lights", "Forward HSI VOR Light (green)")
MB_339:defineIndicatorLight08("FW_HSI_RNAV_L", 383, "HSI Lights", "Forward HSI RNAV Light (green)")

MB_339:defineIndicatorLight08("AFT_HSI_TCN_L", 54, "HSI Lights", "Aft HSI TACAN Light (green)")
MB_339:defineIndicatorLight08("AFT_HSI_VOR_L", 55, "HSI Lights", "Aft HSI VOR Light (green)")
MB_339:defineIndicatorLight08("AFT_HSI_RNAV_L", 56, "HSI Lights", "Aft HSI RNAV Light (green)")

--Flight dir
MB_339:definePushButton("FW_FD_HDG", 1, COMMANDS.FwdFltDirHdg, 333, "Flight Dir FW", "Forward F/D HDG")
MB_339:definePushButton("FW_FD_GS_ARM", 1, COMMANDS.FwdFltDirArm, 334, "Flight Dir FW", "Forward F/D GS ARM")
MB_339:definePushButton("FW_FD_STBY", 1, COMMANDS.FwdFltDirStby, 335, "Flight Dir FW", "Forward F/D STBY")
MB_339:definePushButton("FW_FD_RADIO_NAV", 1, COMMANDS.FwdFltDirRadioNav, 336, "Flight Dir FW", "Forward F/D RADIO NAV")
MB_339:definePushButton("FW_FD_GS", 1, COMMANDS.FwdFltDirGs, 337, "Flight Dir FW", "Forward F/D GS")
MB_339:definePushButton("FW_FD_ALT_HOLD", 1, COMMANDS.FwdFltDirAltHold, 338, "Flight Dir FW", "Forward F/D ALT HOLD")

MB_339:definePushButton("AFT_FD_HDG", 1, COMMANDS.AftFltDirHdg, 693, "Flight Dir AFT", "Aft F/D HDG")
MB_339:definePushButton("AFT_FD_GS_ARM", 1, COMMANDS.AftFltDirArm, 695, "Flight Dir AFT", "Aft F/D GS ARM")
MB_339:definePushButton("AFT_FD_STBY", 1, COMMANDS.AftFltDirStby, 697, "Flight Dir AFT", "Aft F/D STBY")
MB_339:definePushButton("AFT_FD_RADIO_NAV", 1, COMMANDS.AftFltDirRadioNav, 699, "Flight Dir AFT", "Aft F/D RADIO NAV")
MB_339:definePushButton("AFT_FD_GS", 1, COMMANDS.AftFltDirGs, 701, "Flight Dir AFT", "Aft F/D GS")
MB_339:definePushButton("AFT_FD_ALT_HOLD", 1, COMMANDS.AftFltDirAltHold, 703, "Flight Dir AFT", "Aft F/D ALT HOLD")

MB_339:defineIndicatorLight08("FW_FD_HDG_L", 339, "Flight Dir Lights", "Forward F/D HDG Light (green)")
MB_339:defineIndicatorLight08("FW_FD_GS_ARM_L", 340, "Flight Dir Lights", "Forward F/D GS ARM Light (green)")
MB_339:defineIndicatorLight08("FW_FD_STBY_L", 341, "Flight Dir Lights", "Forward F/D STBY Light (green)")
MB_339:defineIndicatorLight08("FW_FD_RADIO_NAV_L", 342, "Flight Dir Lights", "Forward F/D RADIO NAV Light (green)")
MB_339:defineIndicatorLight08("FW_FD_GS_L", 343, "Flight Dir Lights", "Forward F/D GS Light (green)")
MB_339:defineIndicatorLight08("FW_FD_ALT_HOLD_L", 344, "Flight Dir Lights", "Forward F/D ALT HOLD Light (green)")
MB_339:defineIndicatorLight08("AFT_FD_HDG_L", 694, "Flight Dir Lights", "Aft F/D HDG Light (green)")
MB_339:defineIndicatorLight08("AFT_FD_GS_ARM_L", 696, "Flight Dir Lights", "Aft F/D GS ARM Light (green)")
MB_339:defineIndicatorLight08("AFT_FD_STBY_L", 698, "Flight Dir Lights", "Aft F/D STBY Light (green)")
MB_339:defineIndicatorLight08("AFT_FD_RADIO_NAV_L", 700, "Flight Dir Lights", "Aft F/D RADIO NAV Light (green)")
MB_339:defineIndicatorLight08("AFT_FD_GS_L", 702, "Flight Dir Lights", "Aft F/D GS Light (green)")
MB_339:defineIndicatorLight08("AFT_FD_ALT_HOLD_L", 704, "Flight Dir Lights", "Aft F/D ALT HOLD Light (green)")

--Fuel
MB_339:defineMultipositionSwitch("FW_FUEL_TANK_SEL", 1, COMMANDS.FwdFuelQtyKnob, 257, 5, 0.25, "Fuel FW", "Forward Fuel Tank Selector")
MB_339:definePushButton("FW_FUEL_TEST", 1, COMMANDS.FwdFuelQtyTest, 258, "Fuel FW", "Forward Fuel Quantity Test")
MB_339:defineToggleSwitch("FW_FUEL_OFF_SW", 1, COMMANDS.FwdFuelShutoffSwitch, 248, "Fuel FW", "Foreward Fuel Shut-Off Switch")
MB_339:defineToggleSwitch("FW_FUEL_OFF_CVR", 1, COMMANDS.FwdFuelShutoffGuard, 237, "Fuel FW", "Foreward Fuel Shut-Off Guard")
MB_339:defineToggleSwitch("FW_FUEL_TRANS", 1, COMMANDS.FuelTransferSwitch, 249, "Fuel FW", "Foreward Fuel Transfer")
MB_339:defineToggleSwitch("FW_FUEL_DUMP", 1, COMMANDS.FwdFuelDumpKnob, 593, "Fuel FW", "Foreward Fuel Dump")

MB_339:defineMultipositionSwitch("AFT_FUEL_TANK_SEL", 1, COMMANDS.AftFuelQtyKnob, 328, 5, 0.25, "Fuel AFT", "Aft Fuel Tank Selector")
MB_339:definePushButton("AFT_FUEL_TEST", 1, COMMANDS.AftFuelQtyTest, 374, "Fuel AFT", "Aft Fuel Quantity Test")
MB_339:defineToggleSwitch("AFT_FUEL_OFF_SW", 1, COMMANDS.AftFuelShutoffSwitch, 516, "Fuel AFT", "Aft Fuel Shut-Off Switch")
MB_339:defineToggleSwitch("AFT_FUEL_OFF_CVR", 1, COMMANDS.AftFuelShutoffGuard, 517, "Fuel AFT", "Aft Fuel Shut-Off Guard")
MB_339:defineToggleSwitch("AFT_FUEL_DUMP", 1, COMMANDS.AftFuelDumpKnob, 160, "Fuel AFT", "Aft Fuel Dump")

MB_339:defineFloat("FW_FUEL_G", 312, { 0, 1 }, "Fuel Gauge", "Foreward Fuel Gauge")
MB_339:defineFloat("AFT_FUEL_G", 329, { 0, 1 }, "Fuel Gauge", "Aft Fuel Gauge")
MB_339:defineFloat("FUEL_FLOW_G", 313, { 0, 1 }, "Fuel Gauge", "Fuel Flow Gauge")
MB_339:defineFloat("AFT_FUEL_TRANS_G", 520, { 0, 1 }, "Fuel Gauge", "Aft Fuel Transfer Drum")

--L/G & Ground
-- LandingGearLever (5002) should work and is present in clickabledata.lua, but the control seems to glitch out when attempting to use it
MB_339:defineLoSetCommand2PosToggle("FW_LG_GEAR_LVR", ICommand.gear_up, ICommand.gear_down, 4, "Gear FW", "Foreward Gear Lever")
MB_339:defineToggleSwitch("FW_LG_ASKID", 1, COMMANDS.FwdAntiSkidOnOff, 250, "Gear FW", "Foreward Anti-Skid")
MB_339:definePotentiometer("FW_LG_PBRAKE", 1, COMMANDS.ParkingBrakePull, 266, { 0, 1 }, "Gear FW", "Forward Parking Brake Pull")
MB_339:defineToggleSwitch("FW_LG_PBRAKE_LOCK", 1, COMMANDS.ParkingBrakeLock, 263, "Gear FW", "Foreward Parking Brake Lock")
MB_339:defineToggleSwitch("FW_LG_EMERG_GEAR", 1, COMMANDS.EmergLandingGear, 681, "Gear FW", "Foreward Emergency Landing Gear")
MB_339:definePushButton("FW_LG_DL_OVERRIDE", 1, COMMANDS.FwdLandingGearOverride, 379, "Gear FW", "Foreward Down-Lock Override")
MB_339:defineSpringloaded_3PosTumb("FW_RUDDER_TRIM", 1, COMMANDS.FwdTrimLeftRudder, COMMANDS.FwdTrimRightRudder, 540, "Gear FW", "Foreward Rudder Trim")

MB_339:defineLoSetCommand2PosToggle("AFT_LG_GEAR_LVR", ICommand.gear_up, ICommand.gear_down, 106, "Gear AFT", "Aft Gear Lever")
MB_339:defineToggleSwitch("AFT_LG_ASKID", 1, COMMANDS.AftAntiSkidOnOff, 518, "Gear AFT", "Aft Anti-Skid")
MB_339:definePushButton("AFT_LG_DL_OVERRIDE", 1, COMMANDS.AftLandingGearOverride, 14, "Gear AFT", "Aft Down-Lock Override")
MB_339:defineSpringloaded_3PosTumb("AFT_RUDDER_TRIM", 1, COMMANDS.AftTrimLeftRudder, COMMANDS.AftTrimRightRudder, 519, "Gear AFT", "Aft Rudder Trim")

MB_339:defineIndicatorLight08("NOSE_GEAR_L", 20, "Gear Lights", "Nose Gear Light (green)")
MB_339:defineIndicatorLight08("RIGHT_GEAR_L", 31, "Gear Lights", "Right Gear Light (green)")
MB_339:defineIndicatorLight08("LEFT_GEAR_L", 32, "Gear Lights", "Left Gear Light (green)")
MB_339:defineIndicatorLight08("GEAR_HND_L", 42, "Gear Lights", "Gear Handle Light (red)")
MB_339:defineIndicatorLight08("TRIM_RUD_L", 251, "Gear Lights", "Takeoff Trim Rudder Light (green)")
MB_339:defineIndicatorLight08("TRIM_AIL_L", 252, "Gear Lights", "Takeoff Trim Aileron Light (green)")

--Lights
MB_339:define3PosTumb("FW_LIGHT_TAXI_LAND", 1, COMMANDS.TaxiLandingLight, 321, "Lights FW", "Forward Taxi/Landing Lights")
MB_339:definePotentiometer("FW_LIGHT_FORMATION", 1, COMMANDS.FormationLigths, 502, { 0, 1 }, "Lights FW", "Forward Formation Lights")
MB_339:definePotentiometer("FW_LIGHT_INSTRUMENT", 1, COMMANDS.FwdBrtInst, 503, { 0, 1 }, "Lights FW", "Forward Instruments Lights")
MB_339:definePotentiometer("FW_LIGHT_FLOOD", 1, COMMANDS.FwdFloodLight, 504, { 0, 1 }, "Lights FW", "Forward Flood Lights")
MB_339:definePotentiometer("FW_LIGHT_CONSOLE", 1, COMMANDS.FwdBrtConsolle, 505, { 0, 1 }, "Lights FW", "Forward Console Lights")
MB_339:defineToggleSwitch("FW_LIGHT_NAV_FLASH", 1, COMMANDS.BcnLightOnOff, 41, "Lights FW", "Forward Nav Lights Flash/Steady")
MB_339:define3PosTumb("FW_LIGHT_NAV_BRIGHT", 1, COMMANDS.NavLightBrtDim, 40, "Lights FW", "Forward Nav Lights Bright/Dim")
MB_339:defineToggleSwitch("FW_LIGHT_BEACON", 1, COMMANDS.BcnLightOnOff, 685, "Lights FW", "Forward Beacon Lights")
MB_339:defineToggleSwitch("FW_LIGHT_WARN_BRIGHT", 1, COMMANDS.FwdWarnLightBrtDim, 322, "Lights FW", "Forward Warn Lights Bright/Dim")

MB_339:definePotentiometer("AFT_LIGHT_INSTRUMENT", 1, COMMANDS.AftBrtInst, 510, { 0, 1 }, "Lights AFT", "Aft Instruments Lights")
MB_339:definePotentiometer("AFT_LIGHT_FLOOD", 1, COMMANDS.AftFloodLight, 512, { 0, 1 }, "Lights AFT", "Aft Flood Lights")
MB_339:definePotentiometer("AFT_LIGHT_CONSOLE", 1, COMMANDS.AftBrtConsolle, 511, { 0, 1 }, "Lights AFT", "Aft Console Lights")
MB_339:defineToggleSwitch("AFT_LIGHT_WARN_BRIGHT", 1, COMMANDS.AftWarnLightBrtDim, 107, "Lights AFT", "Aft Warn Lights Bright/Dim")

MB_339:defineFloat("FW_LIGHT_INST_BACK_L", 507, { 0, 1 }, "Lights", "Foreward Instrument Backlights (white)")
MB_339:defineFloat("FW_LIGHT_PANEL_BACK_L", 508, { 0, 1 }, "Lights", "Foreward Panel Backlights (white)")
MB_339:defineFloat("FW_LIGHT_FLOOD_L", 508, { 0, 1 }, "Lights", "Foreward Flood Lights (red)")
MB_339:defineFloat("AFT_LIGHT_INST_BACK_L", 513, { 0, 1 }, "Lights", "Aft Instrument Backlights (white)")
MB_339:defineFloat("AFT_LIGHT_PANEL_BACK_L", 514, { 0, 1 }, "Lights", "Aft Panel Backlights (white)")
MB_339:defineFloat("AFT_LIGHT_FLOOD_L", 515, { 0, 1 }, "Lights", "Aft Flood Lights (red)")

--Warning panel
MB_339:definePushButton("WARN_L_TEST", 1, COMMANDS.WarningTestButton, 304, "Warning Panel", "Warn Lights Test")
MB_339:definePushButton("FW_MASTER_CAUTION", 1, COMMANDS.MasterCautionReset, 591, "Warning Panel", "Forward Master Caution Reset")
MB_339:definePushButton("AFT_MASTER_CAUTION", 1, COMMANDS.MasterCautionReset, 592, "Warning Panel", "Aft Master Caution Reset")
MB_339:definePushButton("WARN_SILENT", 1, COMMANDS.WarningSilence, 382, "Warning Panel", "Warning Silence")

MB_339:defineIndicatorLight08("MASTER_CAUTION_L", 209, "Warning Panel Light", "Master Caution Light (yellow)")
MB_339:defineIndicatorLight08("MCP_DC_GEN1_L", 210, "Warning Panel Light", "NO 1 DC GEN Light (yellow)")
MB_339:defineIndicatorLight08("MCP_DC_GEN2_L", 211, "Warning Panel Light", "NO 2 DC GEN Light (yellow)")
MB_339:defineIndicatorLight08("MCP_BATT1_L", 212, "Warning Panel Light", "NO 1 BATT Light (yellow)")
MB_339:defineIndicatorLight08("MCP_BATT2_L", 213, "Warning Panel Light", "NO 2 BATT Light (yellow)")
MB_339:defineIndicatorLight08("MCP_BATT_HOT_L", 214, "Warning Panel Light", "BATT HOT Light (yellow)")
MB_339:defineIndicatorLight08("MCP_AC_ESS_BUS_L", 215, "Warning Panel Light", "AC ESS BUS Light (yellow)")
MB_339:defineIndicatorLight08("MCP_AC_SEC_BUS_L", 216, "Warning Panel Light", "AC SEC BUS Light (yellow)")
MB_339:defineIndicatorLight08("MCP_CKT_BKR_L", 217, "Warning Panel Light", "CKT BKR Light (yellow)")
MB_339:defineIndicatorLight08("MCP_AIL_SERVO_L", 218, "Warning Panel Light", "AIL SERVO Light (yellow)")
MB_339:defineIndicatorLight08("MCP_OXY_LOW_L", 219, "Warning Panel Light", "OXY LOW Light (yellow)")
MB_339:defineIndicatorLight08("MCP_DUCT_AICE_L", 220, "Warning Panel Light", "DUCT ANTI-ICE Light (yellow)")
MB_339:defineIndicatorLight08("MCP_TK_EMPTY_L", 221, "Warning Panel Light", "PYL TK EMPTY Light (yellow)")
MB_339:defineIndicatorLight08("MCP_FUEL_TRANS_L", 222, "Warning Panel Light", "FUEL TRANSF Light (yellow)")
MB_339:defineIndicatorLight08("MCP_TK_UNBAL_L", 223, "Warning Panel Light", "TIP TK UNBAL Light (yellow)")
MB_339:defineIndicatorLight08("MCP_FUEL_LOW_L", 224, "Warning Panel Light", "FUEL LOW Light (yellow)")
MB_339:defineIndicatorLight08("MCP_FUEL_PRESS_L", 225, "Warning Panel Light", "FUEL PRESS Light (yellow)")
MB_339:defineIndicatorLight08("MCP_OIL_PRESS_L", 226, "Warning Panel Light", "OLI PRESS Light (yellow)")
MB_339:defineIndicatorLight08("MCP_ICE_L", 227, "Warning Panel Light", "ICE Light (yellow)")
MB_339:defineIndicatorLight08("MCP_JPT_LMTR_L", 228, "Warning Panel Light", "JPT LMTR Light (yellow)")
MB_339:defineIndicatorLight08("MCP_IFF_L", 229, "Warning Panel Light", "IFF Light (yellow)")
MB_339:defineIndicatorLight08("MCP_IFF_M4_L", 230, "Warning Panel Light", "IFF MODE 4 Light (yellow)")
MB_339:defineIndicatorLight08("FIRE_L", 253, "Warning Panel Light", "Fire Light (red)")
MB_339:defineIndicatorLight08("STEER_L", 254, "Warning Panel Light", "STEER Light (green)")
MB_339:defineIndicatorLight08("ASKIT_L", 255, "Warning Panel Light", "A/SKIT Light (yellow)")
MB_339:defineIndicatorLight08("OVERHEAT_L", 256, "Warning Panel Light", "OVERHEAT Light (yellow)")
MB_339:defineIndicatorLight08("CANOPY_L", 399, "Warning Panel Light", "CANOPY Light (red)")
MB_339:defineFloat("MCP_BRIGHT_L", 746, { 0, 1 }, "Warning Panel Light", "Warning Panel Brightness")

--Engine
MB_339:defineToggleSwitch("ENG_MASTER", 1, COMMANDS.EngineMasterSwitch, 238, "Engine", "Engine Master")
MB_339:defineToggleSwitch("ENG_JPT_LIMIT", 1, COMMANDS.EngineJptLimiterSwitch, 240, "Engine", "JPT Limiter")
MB_339:definePushButton("ENG_START", 1, COMMANDS.StartEngineButton, 239, "Engine", "Engine Start")

MB_339:defineFloat("ENG_TEMP_G", 314, { 0, 1 }, "Engine Gauges", "Engine Temperature Gauge")

--Flight Controls
MB_339:definePushButton("FW_FC_CANOPY_LOCK", 1, COMMANDS.FwdCanopyLockUnlock, 182, "Flight Controls FW", "Forward Canopy LOCK/UNLOCK")
MB_339:definePushButton("FW_FC_CANOPY_HOOK", 1, COMMANDS.CanopyHook, 183, "Flight Controls FW", "Forward Partial Opening Hook")
MB_339:definePushButton("FW_FC_CANOPY_UNLOCK", 1, COMMANDS.CanopyUnlock, 582, "Flight Controls FW", "Forward Canopy UNLOCK")
MB_339:defineToggleSwitch("FW_FC_CANOPY_HND", 1, COMMANDS.CanopyHandle, 750, "Flight Controls FW", "Forward Canopy Handle")
MB_339:defineToggleSwitch("FW_FC_LOCK", 1, COMMANDS.LockFlyControls, 232, "Flight Controls FW", "Forward Flight Controls LOCK/UNLOCK")
MB_339:defineToggleSwitch("FW_FC_MIRRORS", 1, COMMANDS.MirrorToggle, 400, "Flight Controls FW", "Forward Mirrors OPEN/CLOSE")
MB_339:defineToggleSwitch("FW_FC_AILERON_SERVO_CV", 1, COMMANDS.FwdGuardAilServo, 235, "Flight Controls FW", "Forward Aileron Servo Guard")
MB_339:defineToggleSwitch("FW_FC_AILERON_SERVO", 1, COMMANDS.FwdAilServo, 260, "Flight Controls FW", "Forward Aileron Servo Switch")

MB_339:definePushButton("AFT_FC_CANOPY_LOCK", 1, COMMANDS.AftCanopyLockUnlock, 43, "Flight Controls AFT", "Aft Canopy LOCK/UNLOCK")
MB_339:defineToggleSwitch("AFT_FC_MIRRORS", 1, COMMANDS.MirrorToggle, 594, "Flight Controls AFT", "Aft Mirrors OPEN/CLOSE")
MB_339:defineToggleSwitch("AFT_FC_AILERON_SERVO_CV", 1, COMMANDS.AftGuardAilServo, 288, "Flight Controls AFT", "Aft Aileron Servo Guard")
MB_339:defineToggleSwitch("AFT_FC_AILERON_SERVO", 1, COMMANDS.AftAilServo, 289, "Flight Controls AFT", "Aft Aileron Servo Switch")

MB_339:defineIndicatorLight("FW_FC_MARK_BEACON_L", 165, "Flight Controls Light", "Forward Marker Beacon Light (red)")
MB_339:defineIndicatorLight("AFT_FC_MARK_BEACON_L", 167, "Flight Controls Light", "Aft Marker Beacon Light (red)")

--Pressurisation
MB_339:defineToggleSwitch("PRESS_RAMAIR_SCOOP", 1, COMMANDS.RamAirScoop, 590, "Pressurisation", "Ram Air Scoop")
MB_339:defineToggleSwitch("PRESS_CABIN_PRESS", 1, COMMANDS.PressurizationSwitch, 264, "Pressurisation", "Cabin Pressure Switch")
MB_339:defineToggleSwitch("PRESS_CABIN_PRESS_CVR", 1, COMMANDS.CabinPressureGuard, 234, "Pressurisation", "Cabin Pressure Switch Guard")
MB_339:definePotentiometer("PRESS_CABIN_TEMP", 1, COMMANDS.CabinTemp, 179, { 0, 1 }, "Pressurisation", "Cabin Temp")

--Smoke
MB_339:defineToggleSwitch("SMOKE_MASTER", 1, COMMANDS.SmokeMasterSwitch, 330, "Smoke", "Smoke Master Switch")
MB_339:defineToggleSwitch("SMOKE_WHITE", 1, COMMANDS.SmokeWhiteSwitch, 331, "Smoke", "Smoke White Switch")
MB_339:defineToggleSwitch("SMOKE_COLOR", 1, COMMANDS.SmokeColorSwitch, 332, "Smoke", "Smoke Color Switch")

--Anti Ice
MB_339:define3PosTumb("AI_ENG_AICE", 1, COMMANDS.EngineAntiIceSwitch, 262, "Anti Ice", "Engine Anti-Ice")
MB_339:define3PosTumb("AI_FW_PITOT_AICE", 1, COMMANDS.FrontPitotAntiIceSwitch, 261, "Anti Ice", "Front Pitot Anti-Ice")
MB_339:define3PosTumb("AI_AFT_PITOT_AICE", 1, COMMANDS.RearPitotAntiIceSwitch, 149, "Anti Ice", "Rear Pitot Anti-Ice")
MB_339:define3PosTumb("AI_WS_DEMIST", 1, COMMANDS.WindshieldDemistSwitch, 178, "Anti Ice", "Windshield Demist")
MB_339:define3PosTumb("AI_WS_RAIN", 1, COMMANDS.WindshieldRainRmvlSwitch, 177, "Anti Ice", "Windshield Rain RMVL")

MB_339:defineFloat("AI_AOA_G", 528, { 0, 1 }, "Anti Ice Gauges", "Anti-Ice AOA Drum")
MB_339:defineFloat("AI_PITOT_G", 709, { 0, 1 }, "Anti Ice Gauges", "Anti-Ice PITOT Drum")
MB_339:defineFloat("AI_ENG_G", 529, { 0, 1 }, "Anti Ice Gauges", "Anti-Ice ENG Drum")

--Ejection seat
MB_339:defineToggleSwitch("SEAT_FIRE", 1, COMMANDS.SeatFiringHandle, 205, "Seat", "Seat Firing Handle")
MB_339:defineSpringloaded_3PosTumb("SEAT_ADJ", 1, COMMANDS.AdjSeatUp, COMMANDS.AdjSeatDown, 323, "Seat", "Adj Seat UP/DOWN")
MB_339:defineToggleSwitch("SEAT_PIN_CANOPY", 1, COMMANDS.SeatPinToCanopy, 377, "Seat", "Ejection Safety Pin to Canopy")
MB_339:defineToggleSwitch("SEAT_PIN_SEAT", 1, COMMANDS.SeatPinToSeat, 376, "Seat", "Ejection Safety Pin to Seat")

--Control shift
MB_339:definePushButton("FW_CONTROL_TCN", 1, COMMANDS.FwdControlShiftTacan, 324, "Control Shift FW", "Forward TACAN Control Shift")
MB_339:definePushButton("FW_CONTROL_ILS", 1, COMMANDS.FwdControlShiftVorIls, 326, "Control Shift FW", "Forward VOR-ILS Control Shift")
MB_339:definePushButton("FW_CONTROL_NAV", 1, COMMANDS.FwdControlShiftNav, 384, "Control Shift FW", "Forward NAV Control Shift")
MB_339:definePushButton("FW_CONTROL_COM1", 1, COMMANDS.FwdControlShiftComm1, 307, "Control Shift FW", "Forward COMM1 Control Shift")
MB_339:definePushButton("FW_CONTROL_COM2", 1, COMMANDS.FwdControlShiftComm2, 309, "Control Shift FW", "Forward COMM2 Control Shift")
MB_339:definePushButton("FW_CONTROL_ADF", 1, COMMANDS.FwdControlShiftAdf, 317, "Control Shift FW", "Forward ADF Control Shift")

MB_339:definePushButton("AFT_CONTROL_TCN", 1, COMMANDS.AftControlShiftTacan, 273, "Control Shift AFT", "Aft TACAN Control Shift")
MB_339:definePushButton("AFT_CONTROL_ILS", 1, COMMANDS.AftControlShiftVorIls, 275, "Control Shift AFT", "Aft VOR-ILS Control Shift")
MB_339:definePushButton("AFT_CONTROL_NAV", 1, COMMANDS.AftControlShiftNav, 277, "Control Shift AFT", "Aft NAV Control Shift")
MB_339:definePushButton("AFT_CONTROL_COM1", 1, COMMANDS.AftControlShiftComm1, 267, "Control Shift AFT", "Aft COMM1 Control Shift")
MB_339:definePushButton("AFT_CONTROL_COM2", 1, COMMANDS.AftControlShiftComm2, 269, "Control Shift AFT", "Aft COMM2 Control Shift")
MB_339:definePushButton("AFT_CONTROL_ADF", 1, COMMANDS.AftControlShiftAdf, 271, "Control Shift AFT", "Aft ADF Control Shift")

MB_339:defineIndicatorLight08("FW_CONTROL_TCN_L", 325, "Control Shift Lights", "Forward TACAN Control Shift Light (green)")
MB_339:defineIndicatorLight08("FW_CONTROL_ILS_L", 327, "Control Shift Lights", "Forward VOR-ILS Control Shift Light (green)")
MB_339:defineIndicatorLight08("FW_CONTROL_NAV_L", 385, "Control Shift Lights", "Forward NAV Control Shift Light (green)")
MB_339:defineIndicatorLight08("FW_CONTROL_COM1_L", 308, "Control Shift Lights", "Forward COMM1 Control Shift Light (green)")
MB_339:defineIndicatorLight08("FW_CONTROL_COM2_L", 316, "Control Shift Lights", "Forward COMM2 Control Shift Light (green)")
MB_339:defineIndicatorLight08("FW_CONTROL_ADF_L", 318, "Control Shift Lights", "Forward ADF Control Shift Light (green)")
MB_339:defineIndicatorLight08("AFT_CONTROL_TCN_L", 274, "Control Shift Lights", "Aft TACAN Control Shift Light (green)")
MB_339:defineIndicatorLight08("AFT_CONTROL_ILS_L", 276, "Control Shift Lights", "Aft VOR-ILS Control Shift Light (green)")
MB_339:defineIndicatorLight08("AFT_CONTROL_NAV_L", 278, "Control Shift Lights", "Aft NAV Control Shift Light (green)")
MB_339:defineIndicatorLight08("AFT_CONTROL_COM1_L", 268, "Control Shift Lights", "Aft COMM1 Control Shift Light (green)")
MB_339:defineIndicatorLight08("AFT_CONTROL_COM2_L", 270, "Control Shift Lights", "Aft COMM2 Control Shift Light (green)")
MB_339:defineIndicatorLight08("AFT_CONTROL_ADF_L", 272, "Control Shift Lights", "Aft ADF Control Shift Light (green)")

--CDU
MB_339:defineToggleSwitch("FW_CDU_GPS_PW", 1, COMMANDS.GpsPowerSwitch, 345, "CDU FW", "Forward CDU AHRS/GPS System")
MB_339:definePushButton("FW_CDU_ROW1", 1, COMMANDS.FwdCduRow1Sel, 600, "CDU FW", "Forward CDU Row 1")
MB_339:definePushButton("FW_CDU_ROW2", 1, COMMANDS.FwdCduRow2Sel, 601, "CDU FW", "Forward CDU Row 2")
MB_339:definePushButton("FW_CDU_ROW3", 1, COMMANDS.FwdCduRow3Sel, 602, "CDU FW", "Forward CDU Row 3")
MB_339:definePushButton("FW_CDU_ROW4", 1, COMMANDS.FwdCduRow4Sel, 603, "CDU FW", "Forward CDU Row 4")
MB_339:definePushButton("FW_CDU_MARK", 1, COMMANDS.FwdCduMark, 605, "CDU FW", "Forward CDU MARK")
MB_339:definePushButton("FW_CDU_SET", 1, COMMANDS.FwdCduSet, 609, "CDU FW", "Forward CDU SET")
MB_339:definePushButton("FW_CDU_BRT", 1, COMMANDS.FwdCduBrt, 610, "CDU FW", "Forward CDU BRT")
MB_339:definePushButton("FW_CDU_INC", 1, COMMANDS.FwdCduDec, 611, "CDU FW", "Forward CDU +")
MB_339:definePushButton("FW_CDU_DEC", 1, COMMANDS.FwdCduInc, 612, "CDU FW", "Forward CDU -")
MB_339:definePushButton("FW_CDU_N1", 1, COMMANDS.FwdCduN1, 613, "CDU FW", "Forward CDU N. 1")
MB_339:definePushButton("FW_CDU_N2", 1, COMMANDS.FwdCduN2, 614, "CDU FW", "Forward CDU N. 2")
MB_339:definePushButton("FW_CDU_N3", 1, COMMANDS.FwdCduN3, 615, "CDU FW", "Forward CDU N. 3")
MB_339:definePushButton("FW_CDU_N4", 1, COMMANDS.FwdCduN4, 616, "CDU FW", "Forward CDU N. 4")
MB_339:definePushButton("FW_CDU_N5", 1, COMMANDS.FwdCduN5, 617, "CDU FW", "Forward CDU N. 5")
MB_339:definePushButton("FW_CDU_N6", 1, COMMANDS.FwdCduN6, 618, "CDU FW", "Forward CDU N. 6")
MB_339:definePushButton("FW_CDU_N7", 1, COMMANDS.FwdCduN7, 619, "CDU FW", "Forward CDU N. 7")
MB_339:definePushButton("FW_CDU_N8", 1, COMMANDS.FwdCduN8, 620, "CDU FW", "Forward CDU N. 8")
MB_339:definePushButton("FW_CDU_N9", 1, COMMANDS.FwdCduN9, 621, "CDU FW", "Forward CDU N. 9")
MB_339:definePushButton("FW_CDU_N0", 1, COMMANDS.FwdCduN0, 622, "CDU FW", "Forward CDU N. 0")
MB_339:definePushButton("FW_CDU_CLR", 1, COMMANDS.FwdCduClr, 623, "CDU FW", "Forward CDU CLR")
MB_339:definePushButton("FW_CDU_ENT", 1, COMMANDS.FwdCduEnt, 624, "CDU FW", "Forward CDU ENT")
MB_339:definePushButton("FW_CDU_MODE", 1, COMMANDS.FwdCduMode, 606, "CDU FW", "Forward CDU MODE")
MB_339:definePushButton("FW_CDU_STEER", 1, COMMANDS.FwdCduSteer, 607, "CDU FW", "Forward CDU STEER")
MB_339:definePushButton("FW_CDU_FIX", 1, COMMANDS.FwdCduFix, 604, "CDU FW", "Forward CDU FIX")
MB_339:definePushButton("FW_CDU_FLT_PLN", 1, COMMANDS.FwdCduFltPln, 608, "CDU FW", "Forward CDU FLT PLN")

MB_339:definePushButton("AFT_CDU_ROW1", 1, COMMANDS.AftCduRow1Sel, 625, "CDU AFT", "Aft CDU Row 1")
MB_339:definePushButton("AFT_CDU_ROW2", 1, COMMANDS.AftCduRow2Sel, 626, "CDU AFT", "Aft CDU Row 2")
MB_339:definePushButton("AFT_CDU_ROW3", 1, COMMANDS.AftCduRow3Sel, 627, "CDU AFT", "Aft CDU Row 3")
MB_339:definePushButton("AFT_CDU_ROW4", 1, COMMANDS.AftCduRow4Sel, 628, "CDU AFT", "Aft CDU Row 4")
MB_339:definePushButton("AFT_CDU_MARK", 1, COMMANDS.AftCduMark, 630, "CDU AFT", "Aft CDU MARK")
MB_339:definePushButton("AFT_CDU_SET", 1, COMMANDS.AftCduSet, 634, "CDU AFT", "Aft CDU SET")
MB_339:definePushButton("AFT_CDU_BRT", 1, COMMANDS.AftCduBrt, 635, "CDU AFT", "Aft CDU BRT")
MB_339:definePushButton("AFT_CDU_INC", 1, COMMANDS.AftCduDec, 636, "CDU AFT", "Aft CDU +")
MB_339:definePushButton("AFT_CDU_DEC", 1, COMMANDS.AftCduInc, 637, "CDU AFT", "Aft CDU -")
MB_339:definePushButton("AFT_CDU_N1", 1, COMMANDS.AftCduN1, 638, "CDU AFT", "Aft CDU N. 1")
MB_339:definePushButton("AFT_CDU_N2", 1, COMMANDS.AftCduN2, 639, "CDU AFT", "Aft CDU N. 2")
MB_339:definePushButton("AFT_CDU_N3", 1, COMMANDS.AftCduN3, 640, "CDU AFT", "Aft CDU N. 3")
MB_339:definePushButton("AFT_CDU_N4", 1, COMMANDS.AftCduN4, 641, "CDU AFT", "Aft CDU N. 4")
MB_339:definePushButton("AFT_CDU_N5", 1, COMMANDS.AftCduN5, 642, "CDU AFT", "Aft CDU N. 5")
MB_339:definePushButton("AFT_CDU_N6", 1, COMMANDS.AftCduN6, 643, "CDU AFT", "Aft CDU N. 6")
MB_339:definePushButton("AFT_CDU_N7", 1, COMMANDS.AftCduN7, 644, "CDU AFT", "Aft CDU N. 7")
MB_339:definePushButton("AFT_CDU_N8", 1, COMMANDS.AftCduN8, 645, "CDU AFT", "Aft CDU N. 8")
MB_339:definePushButton("AFT_CDU_N9", 1, COMMANDS.AftCduN9, 646, "CDU AFT", "Aft CDU N. 9")
MB_339:definePushButton("AFT_CDU_N0", 1, COMMANDS.AftCduN0, 647, "CDU AFT", "Aft CDU N. 0")
MB_339:definePushButton("AFT_CDU_CLR", 1, COMMANDS.AftCduClr, 648, "CDU AFT", "Aft CDU CLR")
MB_339:definePushButton("AFT_CDU_ENT", 1, COMMANDS.AftCduEnt, 649, "CDU AFT", "Aft CDU ENT")
MB_339:definePushButton("AFT_CDU_MODE", 1, COMMANDS.AftCduMode, 631, "CDU AFT", "Aft CDU MODE")
MB_339:definePushButton("AFT_CDU_STEER", 1, COMMANDS.AftCduSteer, 632, "CDU AFT", "Aft CDU STEER")
MB_339:definePushButton("AFT_CDU_FIX", 1, COMMANDS.AftCduFix, 629, "CDU AFT", "Aft CDU FIX")
MB_339:definePushButton("AFT_CDU_FLT_PLN", 1, COMMANDS.AftCduFltPln, 633, "CDU AFT", "Aft CDU FLT PLN")

--Weapons
MB_339:defineToggleSwitch("WP_GND_FIRE_CVR", 1, COMMANDS.GroundFireGuard, 236, "Weapons", "Ground Fire Guard")
MB_339:defineToggleSwitch("WP_MASTER_ARM", 1, COMMANDS.MasterArmamentSwitch, 475, "Weapons", "Master Armament")
MB_339:definePushButton("WP_JETT_SALVO", 1, COMMANDS.SalvoJettison, 473, "Weapons", "Salvo Jettison")
MB_339:definePushButton("WP_JETT_SEL", 1, COMMANDS.SelectiveJettison, 70, "Weapons", "Selective Jettison")
MB_339:define3PosTumb("WP_BOMB_FUZE", 1, COMMANDS.BombFuzeSelector, 494, "Weapons", "Bomb Fuze")
MB_339:defineToggleSwitch("WP_SEQUENCE", 1, COMMANDS.WeaponSequence, 495, "Weapons", "Sequence Ripple/Single")
MB_339:defineToggleSwitch("WP_STAT1", 1, COMMANDS.WeaponStation1, 488, "Weapons", "Station 1")
MB_339:defineToggleSwitch("WP_STAT2", 1, COMMANDS.WeaponStation2, 489, "Weapons", "Station 2")
MB_339:defineToggleSwitch("WP_STAT3", 1, COMMANDS.WeaponStation3, 490, "Weapons", "Station 3")
MB_339:defineToggleSwitch("WP_STAT4", 1, COMMANDS.WeaponStation4, 491, "Weapons", "Station 4")
MB_339:defineToggleSwitch("WP_STAT5", 1, COMMANDS.WeaponStation5, 492, "Weapons", "Station 5")
MB_339:defineToggleSwitch("WP_STAT6", 1, COMMANDS.WeaponStation6, 493, "Weapons", "Station 6")
MB_339:defineToggleSwitch("WP_GND_FIRE", 1, COMMANDS.GroundFireSwitch, 506, "Weapons", "Ground Fire")
MB_339:defineToggleSwitch("WP_MASTER_ARM_INIB_CVR", 1, COMMANDS.GuardMasterArmInib, 169, "Weapons", "Master Arm Inib Guard")
MB_339:defineToggleSwitch("WP_MASTER_ARM_INIB", 1, COMMANDS.MasterArmInib, 170, "Weapons", "Master Arm Inib")

MB_339:defineFloat("WP_STAT1_G", 69, { 0, 1 }, "Weapons Gauges", "Station 1 Drum")
MB_339:defineFloat("WP_STAT2_G", 68, { 0, 1 }, "Weapons Gauges", "Station 2 Drum")
MB_339:defineFloat("WP_STAT3_G", 67, { 0, 1 }, "Weapons Gauges", "Station 3 Drum")
MB_339:defineFloat("WP_STAT4_G", 66, { 0, 1 }, "Weapons Gauges", "Station 4 Drum")
MB_339:defineFloat("WP_STAT5_G", 65, { 0, 1 }, "Weapons Gauges", "Station 5 Drum")
MB_339:defineFloat("WP_STAT6_G", 64, { 0, 1 }, "Weapons Gauges", "Station 6 Drum")
MB_339:defineFloat("WP_SEQU_G", 161, { 0, 1 }, "Weapons Gauges", "Sequence Drum")
MB_339:defineFloat("WP_BOMB_FUZE_G", 162, { -1, 1 }, "Weapons Gauges", "Bomb Fuze Drum")

MB_339:defineIndicatorLight("WP_MASTER_ARM_L", 163, "Weapons Lights", "Master Arm Light (red)")
MB_339:defineIndicatorLight("WP_STAT1_L", 496, "Weapons Lights", "Station 1 Light (green)")
MB_339:defineIndicatorLight("WP_STAT2_L", 497, "Weapons Lights", "Station 2 Light (green)")
MB_339:defineIndicatorLight("WP_STAT3_L", 498, "Weapons Lights", "Station 3 Light (green)")
MB_339:defineIndicatorLight("WP_STAT4_L", 499, "Weapons Lights", "Station 4 Light (green)")
MB_339:defineIndicatorLight("WP_STAT5_L", 500, "Weapons Lights", "Station 5 Light (green)")
MB_339:defineIndicatorLight("WP_STAT6_L", 501, "Weapons Lights", "Station 6 Light (green)")

--Gunsight
MB_339:define3PosTumb("GUN_PWR", 1, COMMANDS.GunsightPower, 478, "Gunsight", "Gunsight Power")
MB_339:definePotentiometer("GUN_BRIGHT", 1, COMMANDS.GunsightBrt, 479, { 0, 1 }, "Gunsight", "Gunsight Brightness")
MB_339:definePushButton("GUN_TEST", 1, COMMANDS.GunsightTest, 480, "Gunsight", "Gunsight Test")
MB_339:defineToggleSwitch("GUN_DEP_100", 1, COMMANDS.GunsightXxx, 481, "Gunsight", "Gunsight Depression reticle x 100")
MB_339:reserveIntValue(7) -- MB_339:defineMultipositionSwitch("GUN_DEP_100", 1, COMMANDS.GunsightXxx, 481, 10, 0.1, "Gunsight", "Gunsight Depression reticle x 100")
MB_339:defineMultipositionSwitch("GUN_DEP_10", 1, COMMANDS.GunsightxXx, 482, 10, 0.1, "Gunsight", "Gunsight Depression reticle x 10")
MB_339:defineMultipositionSwitch("GUN_DEP_1", 1, COMMANDS.GunsightxxX, 483, 10, 0.1, "Gunsight", "Gunsight Depression reticle x 1")

MB_339:defineIndicatorLightInverted("FW_GUN_PRE_G", 477, "Gunsight Gauges", "Forward Gunsight Present")
MB_339:defineFloat("FW_CAM_IND_G", 708, { 0, 1 }, "Gunsight Gauges", "Forward Camera Indicator")
MB_339:defineIndicatorLight08("FW_CAM_PRE_G", 954, "Gunsight Gauges", "Forward Camera Present")

--VOR
MB_339:definePotentiometer("FW_VOR_FREQU_1MHZ", 1, COMMANDS.FwdVorIls1MhzKnob, 563, { 0, 1 }, "VOR FW", "Forward VOR Frequency 1MHz")
MB_339:definePotentiometer("FW_VOR_FREQU_50KHZ", 1, COMMANDS.FwdVorIls50KhzKnob, 564, { 0, 1 }, "VOR FW", "Forward VOR Frequency 50 kHz")
MB_339:definePushButton("FW_VOR_TEST", 1, COMMANDS.FwdVorIlsTestButton, 561, "VOR FW", "Forward VOR Frequency Test")
MB_339:defineToggleSwitch("FW_VOR_PW", 1, COMMANDS.FwdVorIlsPowerSwitch, 562, "VOR FW", "Forward VOR Frequency Power Switch")

MB_339:definePotentiometer("AFT_VOR_FREQU_1MHZ", 1, COMMANDS.AftVorIls1MhzKnob, 539, { 0, 1 }, "VOR AFT", "Aft VOR Frequency 1MHz")
MB_339:definePotentiometer("AFT_VOR_FREQU_50KHZ", 1, COMMANDS.AftVorIls50KhzKnob, 34, { 0, 1 }, "VOR AFT", "Aft VOR Frequency 50 kHz")
MB_339:definePushButton("AFT_VOR_TEST", 1, COMMANDS.AftVorIlsTestButton, 537, "VOR AFT", "Aft VOR Frequency Test")
MB_339:defineToggleSwitch("AFT_VOR_PW", 1, COMMANDS.AftVorIlsPowerSwitch, 538, "VOR AFT", "Aft VOR Frequency Power Switch")

MB_339:defineFloat("FW_VOR_1000", 565, { 0, 1 }, "VOR Gauges", "Forward VOR Frequency 1000")
MB_339:defineFloat("FW_VOR_100", 566, { 0, 1 }, "VOR Gauges", "Forward VOR Frequency 100")
MB_339:defineFloat("FW_VOR_10", 567, { 0, 1 }, "VOR Gauges", "Forward VOR Frequency 10")
MB_339:defineFloat("FW_VOR_1", 568, { 0, 1 }, "VOR Gauges", "Forward VOR Frequency 1")

MB_339:defineFloat("AFT_VOR_1000", 35, { 0, 1 }, "VOR Gauges", "Aft VOR Frequency 1000")
MB_339:defineFloat("AFT_VOR_100", 36, { 0, 1 }, "VOR Gauges", "Aft VOR Frequency 100")
MB_339:defineFloat("AFT_VOR_10", 37, { 0, 1 }, "VOR Gauges", "Aft VOR Frequency 10")
MB_339:defineFloat("AFT_VOR_1", 38, { 0, 1 }, "VOR Gauges", "Aft VOR Frequency 1")

--TACAN
MB_339:defineMultipositionSwitch("FW_TCN_MODE", 1, COMMANDS.FwdTacanMode, 569, 5, 0.25, "TACAN FW", "Forward TACAN Mode")
MB_339:defineToggleSwitch("FW_TCN_XY", 1, COMMANDS.FwdTacanChannelXY, 552, "TACAN FW", "Forward TACAN X/Y Switch")
MB_339:defineMultipositionSwitch("FW_TCN_1", 1, COMMANDS.FwdTacanChannelUnit, 553, 10, 0.1, "TACAN FW", "Forward TACAN Units")
MB_339:defineMultipositionSwitch("FW_TCN_10", 1, COMMANDS.FwdTacanChannelTens, 554, 13, 0.08333, "TACAN FW", "Forward TACAN Tens")
MB_339:definePushButton("FW_TCN_TEST", 1, COMMANDS.FwdTacanTestButton, 555, "TACAN FW", "Forward TACAN Test")

MB_339:defineMultipositionSwitch("AFT_TCN_MODE", 1, COMMANDS.AftTacanMode, 571, 5, 0.25, "TACAN AFT", "Aft TACAN Mode")
MB_339:defineToggleSwitch("AFT_TCN_XY", 1, COMMANDS.AftTacanChannelXY, 572, "TACAN AFT", "Aft TACAN X/Y Switch")
MB_339:defineMultipositionSwitch("AFT_TCN_1", 1, COMMANDS.AftTacanChannelUnit, 573, 10, 0.1, "TACAN AFT", "Aft TACAN Units")
MB_339:defineMultipositionSwitch("AFT_TCN_10", 1, COMMANDS.AftTacanChannelTens, 574, 13, 0.08333, "TACAN AFT", "Aft TACAN Tens")
MB_339:definePushButton("AFT_TCN_TEST", 1, COMMANDS.AftTacanTestButton, 575, "TACAN AFT", "Aft TACAN Test")

MB_339:defineIndicatorLight("FW_TCN_TEST_L", 556, "TACAN Lights", "Forward TACAN Test Light (red)")
MB_339:defineIndicatorLight("AFT_TCN_TEST_L", 576, "TACAN Lights", "Aft TACAN Test Light (red)")

MB_339:defineFloat("FW_TCN_XY_G", 557, { 0, 1 }, "TACAN Gauges", "Forward TACAN X/Y Drum")
MB_339:defineFloat("FW_TCN_1_G", 558, { 0, 1 }, "TACAN Gauges", "Forward TACAN 1 Drum")
MB_339:defineFloat("FW_TCN_10_G", 559, { 0, 1 }, "TACAN Gauges", "Forward TACAN 10 Drum")
MB_339:defineFloat("FW_TCN_100_G", 560, { 0, 1 }, "TACAN Gauges", "Forward TACAN 100 Drum")
MB_339:defineFloat("AFT_TCN_XY_G", 577, { 0, 1 }, "TACAN Gauges", "Aft TACAN X/Y Drum")
MB_339:defineFloat("AFT_TCN_1_G", 578, { 0, 1 }, "TACAN Gauges", "Aft TACAN 1 Drum")
MB_339:defineFloat("AFT_TCN_10_G", 579, { 0, 1 }, "TACAN Gauges", "Aft TACAN 10 Drum")
MB_339:defineFloat("AFT_TCN_100_G", 580, { 0, 1 }, "TACAN Gauges", "Aft TACAN 100 Drum")

--Comm1
MB_339:defineMultipositionSwitch("FW_COM1_FUNC", 1, COMMANDS.FwdComm1Function, 664, 4, 0.33, "Comm1 FW", "Forward Comm 1 Function")
MB_339:defineMultipositionSwitch("FW_COM1_MODE", 1, COMMANDS.FwdComm1Mode, 665, 3, 0.50, "Comm1 FW", "Forward Comm 1 Mode")
MB_339:defineMultipositionSwitch("FW_COM1_FREQU_1", 1, COMMANDS.FwdComm1FreqxxxxX, 678, 4, 0.33, "Comm1 FW", "Forward Comm 1 Frequency xxxx1")
MB_339:defineMultipositionSwitch("FW_COM1_FREQU_10", 1, COMMANDS.FwdComm1FreqxxxXx, 677, 10, 0.111, "Comm1 FW", "Forward Comm 1 Frequency xxx1x")
MB_339:defineMultipositionSwitch("FW_COM1_FREQU_100", 1, COMMANDS.FwdComm1FreqxxXxx, 676, 10, 0.111, "Comm1 FW", "Forward Comm 1 Frequency xx1xx")
MB_339:defineMultipositionSwitch("FW_COM1_FREQU_1000", 1, COMMANDS.FwdComm1FreqxXxxx, 675, 10, 0.111, "Comm1 FW", "Forward Comm 1 Frequency x1xxx")
MB_339:defineMultipositionSwitch("FW_COM1_FREQU_10000", 1, COMMANDS.FwdComm1FreqXxxxx, 674, 2, 1, "Comm1 FW", "Forward Comm 1 Frequency 1xxxx")
MB_339:defineToggleSwitch("FW_COM1_SQUELCH", 1, COMMANDS.FwdComm1Squelch, 173, "Comm1 FW", "Forward Comm 1 Squelch")
MB_339:definePushButton("FW_COM1_TONE", 1, COMMANDS.FwdComm1Tone, 175, "Comm1 FW", "Forward Comm 1 Tone")
MB_339:definePushButton("FW_COM1_MEM", 1, COMMANDS.FwdComm1Mem, 679, "Comm1 FW", "Forward Comm 1 Mem")
MB_339:defineMultipositionSwitch("FW_COM1_CHAN", 1, COMMANDS.FwdComm1SetChannel, 673, 20, 0.0526, "Comm1 FW", "Forward Comm 1 Channel")

MB_339:defineMultipositionSwitch("AFT_COM1_FUNC", 1, COMMANDS.AftComm1Function, 279, 4, 0.33, "Comm1 AFT", "Aft Comm 1 Function")
MB_339:defineMultipositionSwitch("AFT_COM1_MODE", 1, COMMANDS.AftComm1Mode, 280, 3, 0.50, "Comm1 AFT", "Aft Comm 1 Mode")
MB_339:defineMultipositionSwitch("AFT_COM1_FREQU_1", 1, COMMANDS.AftComm1FreqxxxxX, 526, 4, 0.33, "Comm1 AFT", "Aft Comm 1 Frequency xxxx1")
MB_339:defineMultipositionSwitch("AFT_COM1_FREQU_10", 1, COMMANDS.AftComm1FreqxxxXx, 525, 10, 0.111, "Comm1 AFT", "Aft Comm 1 Frequency xxx1x")
MB_339:defineMultipositionSwitch("AFT_COM1_FREQU_100", 1, COMMANDS.AftComm1FreqxxXxx, 524, 10, 0.111, "Comm1 AFT", "Aft Comm 1 Frequency xx1xx")
MB_339:defineMultipositionSwitch("AFT_COM1_FREQU_1000", 1, COMMANDS.AftComm1FreqxXxxx, 523, 10, 0.111, "Comm1 AFT", "Aft Comm 1 Frequency x1xxx")
MB_339:defineMultipositionSwitch("AFT_COM1_FREQU_10000", 1, COMMANDS.AftComm1FreqXxxxx, 522, 2, 1, "Comm1 AFT", "Aft Comm 1 Frequency 1xxxx")
MB_339:defineToggleSwitch("AFT_COM1_SQUELCH", 1, COMMANDS.AftComm1Squelch, 174, "Comm1 AFT", "Aft Comm 1 Squelch")
MB_339:definePushButton("AFT_COM1_TONE", 1, COMMANDS.AftComm1Tone, 176, "Comm1 AFT", "Aft Comm 1 Tone")
MB_339:definePushButton("AFT_COM1_MEM", 1, COMMANDS.AftComm1Mem, 527, "Comm1 AFT", "Aft Comm 1 Mem")
MB_339:defineMultipositionSwitch("AFT_COM1_CHAN", 1, COMMANDS.AftComm1SetChannel, 521, 20, 0.0526, "Comm1 AFT", "Aft Comm 1 Channel")

--Comm2
MB_339:defineMultipositionSwitch("FW_COM2_MODE", 1, COMMANDS.FwdComm2Mode, 650, 5, 0.25, "Comm2 FW", "Forward Comm 2 Mode")
MB_339:defineMultipositionSwitch("FW_COM2_FUNC", 1, COMMANDS.FwdComm2Function, 651, 5, 0.25, "Comm2 FW", "Forward Comm 2 Function")
MB_339:definePotentiometer("FW_COM2_BRIGHT", 1, COMMANDS.FwdComm2Brightness, 652, { 0, 1 }, "Comm2 FW", "Forward Comm 2 Brightness")
MB_339:defineSpringloaded_3PosTumb("FW_COM2_CHN_1", 1, COMMANDS.FwdComm2ChannelxXDw, COMMANDS.FwdComm2ChannelxXUp, 654, "Comm2 FW", "Forward Comm 2 Channel x1")
MB_339:defineSpringloaded_3PosTumb("FW_COM2_CHN_10", 1, COMMANDS.FwdComm2ChannelXxDw, COMMANDS.FwdComm2ChannelXxUp, 655, "Comm2 FW", "Forward Comm 2 Channel 1x")
MB_339:defineSpringloaded_3PosTumb("FW_COM2_FREQU_1", 1, COMMANDS.FwdComm2FreqxxxxXDw, COMMANDS.FwdComm2FreqxxxxXUp, 656, "Comm2 FW", "Forward Comm 2 Frequency xxxx1")
MB_339:defineSpringloaded_3PosTumb("FW_COM2_FREQU_10", 1, COMMANDS.FwdComm2FreqxxxXxDw, COMMANDS.FwdComm2FreqxxxXxUp, 657, "Comm2 FW", "Forward Comm 2 Frequency xxx1x")
MB_339:defineSpringloaded_3PosTumb("FW_COM2_FREQU_100", 1, COMMANDS.FwdComm2FreqxxXxxDw, COMMANDS.FwdComm2FreqxxXxxUp, 658, "Comm2 FW", "Forward Comm 2 Frequency xx1xx")
MB_339:defineSpringloaded_3PosTumb("FW_COM2_FREQU_1000", 1, COMMANDS.FwdComm2FreqxXxxxDw, COMMANDS.FwdComm2FreqxXxxxUp, 659, "Comm2 FW", "Forward Comm 2 Frequency x1xxx")
MB_339:defineSpringloaded_3PosTumb("FW_COM2_FREQU_10000", 1, COMMANDS.FwdComm2FreqXxxxxDw, COMMANDS.FwdComm2FreqXxxxxUp, 660, "Comm2 FW", "Forward Comm 2 Frequency 1xxxx")
MB_339:defineSpringloaded_3PosTumb("FW_COM2_SQUELCH", 1, COMMANDS.FwdComm2Squelch, COMMANDS.FwdComm2Squelch, 662, "Comm2 FW", "Forward Comm 2 Squelch")
MB_339:defineToggleSwitch("FW_COM2_MOD", 1, COMMANDS.FwdComm2Modulation, 661, "Comm2 FW", "Forward Comm 2 Modulation")
MB_339:defineToggleSwitch("FW_COM2_TOD", 1, COMMANDS.FwdComm2Tod, 663, "Comm2 FW", "Forward Comm 2 TOD")

MB_339:defineMultipositionSwitch("AFT_COM2_MODE", 1, COMMANDS.AftComm2Mode, 290, 5, 0.25, "Comm2 AFT", "Aft Comm 2 Mode")
MB_339:defineMultipositionSwitch("AFT_COM2_FUNC", 1, COMMANDS.AftComm2Function, 291, 5, 0.25, "Comm2 AFT", "Aft Comm 2 Function")
MB_339:definePotentiometer("AFT_COM2_BRIGHT", 1, COMMANDS.AftComm2Brightness, 292, { 0, 1 }, "Comm2 AFT", "Aft Comm 2 Brightness")
MB_339:defineSpringloaded_3PosTumb("AFT_COM2_CHN_1", 1, COMMANDS.AftComm2ChannelxXDw, COMMANDS.AftComm2ChannelxXUp, 294, "Comm2 AFT", "Aft Comm 2 Channel x1")
MB_339:defineSpringloaded_3PosTumb("AFT_COM2_CHN_10", 1, COMMANDS.AftComm2ChannelXxDw, COMMANDS.AftComm2ChannelXxUp, 295, "Comm2 AFT", "Aft Comm 2 Channel 1x")
MB_339:defineSpringloaded_3PosTumb("AFT_COM2_FREQU_1", 1, COMMANDS.AftComm2FreqxxxxXDw, COMMANDS.AftComm2FreqxxxxXUp, 296, "Comm2 AFT", "Aft Comm 2 Frequency xxxx1")
MB_339:defineSpringloaded_3PosTumb("AFT_COM2_FREQU_10", 1, COMMANDS.AftComm2FreqxxxXxDw, COMMANDS.AftComm2FreqxxxXxUp, 297, "Comm2 AFT", "Aft Comm 2 Frequency xxx1x")
MB_339:defineSpringloaded_3PosTumb("AFT_COM2_FREQU_100", 1, COMMANDS.AftComm2FreqxxXxxDw, COMMANDS.AftComm2FreqxxXxxUp, 154, "Comm2 AFT", "Aft Comm 2 Frequency xx1xx")
MB_339:defineSpringloaded_3PosTumb("AFT_COM2_FREQU_1000", 1, COMMANDS.AftComm2FreqxXxxxDw, COMMANDS.AftComm2FreqxXxxxUp, 155, "Comm2 AFT", "Aft Comm 2 Frequency x1xxx")
MB_339:defineSpringloaded_3PosTumb("AFT_COM2_FREQU_10000", 1, COMMANDS.AftComm2FreqXxxxxDw, COMMANDS.AftComm2FreqXxxxxUp, 156, "Comm2 AFT", "Aft Comm 2 Frequency 1xxxx")
MB_339:defineSpringloaded_3PosTumb("AFT_COM2_SQUELCH", 1, COMMANDS.AftComm2Squelch, COMMANDS.AftComm2Squelch, 158, "Comm2 AFT", "Aft Comm 2 Squelch")
MB_339:defineToggleSwitch("AFT_COM2_MOD", 1, COMMANDS.AftComm2Modulation, 157, "Comm2 AFT", "Aft Comm 2 Modulation")
MB_339:defineToggleSwitch("AFT_COM2_TOD", 1, COMMANDS.AftComm2Tod, 159, "Comm2 AFT", "Aft Comm 2 TOD")

MB_339:defineIndicatorLight("FW_COM2_FAIL_L", 653, "Comm2 Lights", "Forward Comm 2 FAIL Light (red)")
MB_339:defineIndicatorLight("AFT_COM2_FAIL_L", 293, "Comm2 Lights", "Aft Comm 2 FAIL Light (red)")

--ICS
MB_339:defineToggleSwitch("FW_ICS_COM1_SW", 1, COMMANDS.FwdIcsComm1Switch, 115, "ICS FW", "Forward ICS COM1 Switch")
MB_339:definePotentiometer("FW_ICS_COM1_VOL", 1, COMMANDS.FwdIcsComm1Volume, 116, { 0, 1 }, "ICS FW", "Forward ICS COM1 Volume")
MB_339:defineToggleSwitch("FW_ICS_COM2_SW", 1, COMMANDS.FwdIcsComm2Switch, 117, "ICS FW", "Forward ICS COM2 Switch")
MB_339:definePotentiometer("FW_ICS_COM2_VOL", 1, COMMANDS.FwdIcsComm2Volume, 118, { 0, 1 }, "ICS FW", "Forward ICS COM2 Volume")
MB_339:defineToggleSwitch("FW_ICS_TCN_SW", 1, COMMANDS.FwdIcsTacanSwitch, 119, "ICS FW", "Forward ICS TACAN Switch")
MB_339:definePotentiometer("FW_ICS_TCN_VOL", 1, COMMANDS.FwdIcsTacanVolume, 120, { 0, 1 }, "ICS FW", "Forward ICS TACAN Volume")
MB_339:defineToggleSwitch("FW_ICS_VORLOC_SW", 1, COMMANDS.FwdIcsVorLocSwitch, 121, "ICS FW", "Forward ICS VOR/LOC Switch")
MB_339:definePotentiometer("FW_ICS_VORLOC_VOL", 1, COMMANDS.FwdIcsVorLocVolume, 122, { 0, 1 }, "ICS FW", "Forward ICS VOR/LOC Volume")
MB_339:defineToggleSwitch("FW_ICS_ADF_SW", 1, COMMANDS.FwdIcsAdfSwitch, 123, "ICS FW", "Forward ICS ADF Switch")
MB_339:definePotentiometer("FW_ICS_ADF_VOL", 1, COMMANDS.FwdIcsAdfVolume, 124, { 0, 1 }, "ICS FW", "Forward ICS ADF Volume")
MB_339:defineToggleSwitch("FW_ICS_MARK_SW", 1, COMMANDS.FwdIcsMkrSwitch, 125, "ICS FW", "Forward ICS Markers Switch")
MB_339:definePotentiometer("FW_ICS_MARK_VOL", 1, COMMANDS.FwdIcsMkrVolume, 126, { 0, 1 }, "ICS FW", "Forward ICS Markers Volume")
MB_339:defineToggleSwitch("FW_ICS_INTPH_SW", 1, COMMANDS.FwdIcsIntSwitch, 127, "ICS FW", "Forward ICS Interphone Switch")
MB_339:definePotentiometer("FW_ICS_INTPH_VOL", 1, COMMANDS.FwdIcsIntVolume, 128, { 0, 1 }, "ICS FW", "Forward ICS Interphone Volume")
MB_339:definePotentiometer("FW_ICS_MASTER_VOL", 1, COMMANDS.FwdIcsVolume, 129, { 0, 1 }, "ICS FW", "Forward ICS Master Volume")
MB_339:definePushButton("FW_ICS_CALL", 1, COMMANDS.FwdIcsCallSwitch, 130, "ICS FW", "Forward ICS Call Switch")
MB_339:defineToggleSwitch("FW_ICS_RADIO_SEL", 1, COMMANDS.FwdIcsCommSelector, 131, "ICS FW", "Forward ICS COM1/COM2 TX Selector")

MB_339:defineToggleSwitch("AFT_ICS_COM1_SW", 1, COMMANDS.AftIcsComm1Switch, 132, "ICS AFT", "Aft ICS COM1 Switch")
MB_339:definePotentiometer("AFT_ICS_COM1_VOL", 1, COMMANDS.AftIcsComm1Volume, 133, { 0, 1 }, "ICS AFT", "Aft ICS COM1 Volume")
MB_339:defineToggleSwitch("AFT_ICS_COM2_SW", 1, COMMANDS.AftIcsComm2Switch, 134, "ICS AFT", "Aft ICS COM2 Switch")
MB_339:definePotentiometer("AFT_ICS_COM2_VOL", 1, COMMANDS.AftIcsComm2Volume, 135, { 0, 1 }, "ICS AFT", "Aft ICS COM2 Volume")
MB_339:defineToggleSwitch("AFT_ICS_TCN_SW", 1, COMMANDS.AftIcsTacanSwitch, 136, "ICS AFT", "Aft ICS TACAN Switch")
MB_339:definePotentiometer("AFT_ICS_TCN_VOL", 1, COMMANDS.AftIcsTacanVolume, 137, { 0, 1 }, "ICS AFT", "Aft ICS TACAN Volume")
MB_339:defineToggleSwitch("AFT_ICS_VORLOC_SW", 1, COMMANDS.AftIcsVorLocSwitch, 138, "ICS AFT", "Aft ICS VOR/LOC Switch")
MB_339:definePotentiometer("AFT_ICS_VORLOC_VOL", 1, COMMANDS.AftIcsVorLocVolume, 139, { 0, 1 }, "ICS AFT", "Aft ICS VOR/LOC Volume")
MB_339:defineToggleSwitch("AFT_ICS_ADF_SW", 1, COMMANDS.AftIcsAdfSwitch, 140, "ICS AFT", "Aft ICS ADF Switch")
MB_339:definePotentiometer("AFT_ICS_ADF_VOL", 1, COMMANDS.AftIcsAdfVolume, 141, { 0, 1 }, "ICS AFT", "Aft ICS ADF Volume")
MB_339:defineToggleSwitch("AFT_ICS_MARK_SW", 1, COMMANDS.AftIcsMkrSwitch, 142, "ICS AFT", "Aft ICS Markers Switch")
MB_339:definePotentiometer("AFT_ICS_MARK_VOL", 1, COMMANDS.AftIcsMkrVolume, 143, { 0, 1 }, "ICS AFT", "Aft ICS Markers Volume")
MB_339:defineToggleSwitch("AFT_ICS_INTPH_SW", 1, COMMANDS.AftIcsIntSwitch, 144, "ICS AFT", "Aft ICS Interphone Switch")
MB_339:definePotentiometer("AFT_ICS_INTPH_VOL", 1, COMMANDS.AftIcsIntVolume, 145, { 0, 1 }, "ICS AFT", "Aft ICS Interphone Volume")
MB_339:definePotentiometer("AFT_ICS_MASTER_VOL", 1, COMMANDS.AftIcsVolume, 146, { 0, 1 }, "ICS AFT", "Aft ICS Master Volume")
MB_339:definePushButton("AFT_ICS_CALL", 1, COMMANDS.AftIcsCallSwitch, 147, "ICS AFT", "Aft ICS Call Switch")
MB_339:defineToggleSwitch("AFT_ICS_RADIO_SEL", 1, COMMANDS.AftIcsCommSelector, 148, "ICS AFT", "Aft ICS COM1/COM2 TX Selector")

--Oxygen
MB_339:defineToggleSwitch("FW_OXY_PW", 1, COMMANDS.FwdOxigenOnOffSwitch, 587, "Oxygen FW", "Forward Oxygen Power Supply")
MB_339:defineToggleSwitch("FW_OXY_DILUIT", 1, COMMANDS.FwdOxigenNormal100, 589, "Oxygen FW", "Forward Oxygen Diluiter Lever (Normal / 100%)")
MB_339:defineToggleSwitch("FW_OXY_EMERG", 1, COMMANDS.FwdOxigenEmergency, 588, "Oxygen FW", "Forward Oxygen Emergency Lever")

MB_339:defineToggleSwitch("AFT_OXY_PW", 1, COMMANDS.AftOxigenOnOffSwitch, 113, "Oxygen AFT", "Aft Oxygen Power Supply")
MB_339:defineToggleSwitch("AFT_OXY_DILUIT", 1, COMMANDS.AftOxigenOnOffSwitch, 113, "Oxygen AFT", "Aft Oxygen Diluiter Lever (Normal / 100%)")
MB_339:defineToggleSwitch("AFT_OXY_EMERG", 1, COMMANDS.AftOxigenEmergency, 111, "Oxygen AFT", "Aft Oxygen Emergency Lever")

MB_339:defineFloat("FW_OXY_FLOW_G", 306, { 0, 1 }, "Oxygen Gauges", "Forward Oxygen Indicator")
MB_339:defineFloat("AFT_OXY_FLOW_G", 180, { 0, 1 }, "Oxygen Gauges", "Aft Oxygen Indicator")

--Cockpit
MB_339:definePushButton("FW_GLOVE_COMP", 1, COMMANDS.FwdGloveCompartment, 206, "Cockpit", "Forward Glove Compartment")
MB_339:defineToggleSwitch("FW_CANOPY_SEVERANCE_LVR", 1, COMMANDS.FwdSeveranceHandle, 583, "Cockpit", "Forward Canopy Severance Handle")
MB_339:defineToggleSwitch("FW_CANOPY_SEVERANCE_PIN", 1, COMMANDS.FwdSeverancePin, 584, "Cockpit", "Forward Canopy Severance Safety Pin")

MB_339:definePushButton("AFT_GLOVE_COMP", 1, COMMANDS.AftGloveCompartment, 207, "Cockpit", "Aft Glove Compartment")
MB_339:defineToggleSwitch("AFT_CANOPY_SEVERANCE_LVR", 1, COMMANDS.AftSeveranceHandle, 741, "Cockpit", "Aft Canopy Severance Handle")
MB_339:defineToggleSwitch("AFT_CANOPY_SEVERANCE_PIN", 1, COMMANDS.AftSeverancePin, 742, "Cockpit", "Aft Canopy Severance Safety Pin")

MB_339:defineToggleSwitch("CURTAIN_HANDLE", 1, COMMANDS.CurtainHandle, 1999, "Cockpit", "Curtain Handle")

MB_339:defineFloat("CANOPY_POS_G", 181, { 0, 1 }, "Cockpit Gauges", "Canopy Position")
MB_339:defineFloat("FW_MIRROR_POS_G", 400, { 0, 1 }, "Cockpit Gauges", "Forward Mirror Position")
MB_339:defineFloat("AFT_MIRROR_POS_G", 594, { 0, 1 }, "Cockpit Gauges", "Aft Mirror Position")
MB_339:defineIndicatorLight("CURTAIN_G", 1998, "Cockpit Gauges", "Curtain Present")
MB_339:defineFloat("CURTAIN_POS_G", 1999, { 0, 1 }, "Cockpit Gauges", "Curtain Position")

--ELT
MB_339:defineSpringloaded_3PosTumb("ELT_SW", 1, COMMANDS.EltSwitch, COMMANDS.EltSwitch, 727, "ELT", "ELT Switch")

MB_339:defineIndicatorLight("ELT_L", 740, "ELT Lights", "ELT Light (red)")

--IFF
MB_339:defineMultipositionSwitch("IFF_MASTER", 1, COMMANDS.IffMaster, 714, 5, 0.25, "IFF", "IFF Master")
MB_339:defineMultipositionSwitch("IFF_CODE", 1, COMMANDS.IffCode, 713, 5, 0.25, "IFF", "IFF Code")
MB_339:define3PosTumb("IFF_ANT", 1, COMMANDS.AntSwitch, 715, "IFF", "IFF ANT Switch")
MB_339:define3PosTumb("IFF_M4_CONT", 1, COMMANDS.M4Switch, 710, "IFF", "IFF Mode 4 Control")
MB_339:define3PosTumb("IFF_M4_AUDIO", 1, COMMANDS.Mode4AudioSwitch, 711, "IFF", "IFF Mode 4 Audio")
MB_339:definePushButton("IFF_RAD", 1, COMMANDS.RadSwitch, 716, "IFF", "IFF RAD Switch")
MB_339:define3PosTumb("IFF_M1_CONT", 1, COMMANDS.M1Switch, 720, "IFF", "IFF Mode 1 Control")
MB_339:define3PosTumb("IFF_M2_CONT", 1, COMMANDS.M2Switch, 719, "IFF", "IFF Mode 2 Control")
MB_339:define3PosTumb("IFF_M3A_CONT", 1, COMMANDS.M3ASwitch, 718, "IFF", "IFF Mode 3/A Control")
MB_339:define3PosTumb("IFF_M3C_CONT", 1, COMMANDS.MCSwitch, 717, "IFF", "IFF Mode 3/C Control")
MB_339:defineSpringloaded_3PosTumb("IFF_IDENT_MIC", 1, COMMANDS.IdentMicSwitch, COMMANDS.IdentMicSwitch, 712, "IFF", "IFF IDENT-MIC Switch")
MB_339:definePushButton("IFF_CODE_SW_1", 1, COMMANDS.CodeSwitchXxxxxx, 734, "IFF", "IFF Code Switch 1")
MB_339:definePushButton("IFF_CODE_SW_2", 1, COMMANDS.CodeSwitchxXxxxx, 735, "IFF", "IFF Code Switch 2")
MB_339:definePushButton("IFF_CODE_SW_3", 1, COMMANDS.CodeSwitchxxXxxx, 736, "IFF", "IFF Code Switch 3")
MB_339:definePushButton("IFF_CODE_SW_4", 1, COMMANDS.CodeSwitchxxxXxx, 737, "IFF", "IFF Code Switch 4")
MB_339:definePushButton("IFF_CODE_SW_5", 1, COMMANDS.CodeSwitchxxxxXx, 738, "IFF", "IFF Code Switch 5")
MB_339:definePushButton("IFF_CODE_SW_6", 1, COMMANDS.CodeSwitchxxxxxX, 739, "IFF", "IFF Code Switch 6")
MB_339:definePushButton("IFF_TEST_GO", 1, COMMANDS.PressToTestGo, 743, "IFF", "IFF Test Switch GO")
MB_339:definePushButton("IFF_TEST_NOGO", 1, COMMANDS.PressToTestNoGo, 744, "IFF", "IFF Test Switch NOGO")
MB_339:definePushButton("IFF_TEST_REPLY", 1, COMMANDS.PressToTestReply, 745, "IFF", "IFF Test Switch REPLY")

MB_339:defineFloat("IFF_MODE_10_G", 728, { 0, 1 }, "IFF Gauges", "IFF Mode 10 Drum")
MB_339:defineFloat("IFF_MODE_1_G", 729, { 0, 1 }, "IFF Gauges", "IFF Mode 1 Drum")
MB_339:defineFloat("IFF_MODE3A_1000_G", 730, { 0, 1 }, "IFF Gauges", "IFF Mode 3/A 1000 Drum")
MB_339:defineFloat("IFF_MODE3A_100_G", 731, { 0, 1 }, "IFF Gauges", "IFF Mode 3/A 100 Drum")
MB_339:defineFloat("IFF_MODE3A_10_G", 732, { 0, 1 }, "IFF Gauges", "IFF Mode 3/A 10 Drum")
MB_339:defineFloat("IFF_MODE3A_1_G", 733, { 0, 1 }, "IFF Gauges", "IFF Mode 3/A 1 Drum")

MB_339:defineIndicatorLight("IFF_TEST_GO_L", 724, "IFF Lights", "IFF Test Switch GO Light (green)")
MB_339:defineIndicatorLight("IFF_TEST_NOGO_L", 725, "IFF Lights", "IFF Test Switch NOGO Light (red)")
MB_339:defineIndicatorLight("IFF_TEST_REPLY_L", 726, "IFF Lights", "IFF Test Switch REPLY Light (green)")
MB_339:defineIndicatorLight("IFF_ALT_L", 724, "IFF Lights", "IFF ALT Light (red)")
MB_339:defineIndicatorLight("IFF_KIT_L", 725, "IFF Lights", "IFF KIT Light (red)")
MB_339:defineIndicatorLight("IFF_ANT_L", 726, "IFF Lights", "IFF ANT Light (red)")

--Externals
MB_339:defineFloatFromDrawArgument("EXT_SPEED_BRAKE", 21, "External Aircraft Model", "Speed Brake")
MB_339:defineBitFromDrawArgument("EXT_POSITION_LIGHTS", 191, "External Aircraft Model", "Position Lights (red+green)")
MB_339:defineBitFromDrawArgument("EXT_STROBE_TAIL", 192, "External Aircraft Model", "Tail Strobe Light (red)")
MB_339:defineFloatFromDrawArgument("EXT_FORMATION_LIGHTS", 200, "External Aircraft Model", "Formation Lights (light green)")
MB_339:defineBitFromDrawArgument("EXT_BOTTOM_LIGHT", 201, "External Aircraft Model", "Middle Bottom Light (white)")
MB_339:defineBitFromDrawArgument("EXT_TOP_LIGHT", 202, "External Aircraft Model", "Top Light (white)")
MB_339:defineBitFromDrawArgument("EXT_TAIL_LIGHT", 203, "External Aircraft Model", "Tail Light (white)")
MB_339:defineBitFromDrawArgument("EXT_FRONT_LANDLIGHT", 208, "External Aircraft Model", "Front Landing Light (white)")
MB_339:defineBitFromDrawArgument("EXT_WING_LANDLIGHT", 209, "External Aircraft Model", "Wing Landing Light (white)")
MB_339:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
MB_339:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
MB_339:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

MB_339:defineReadWriteRadio("FWD_COMM1", 6, 7, 3, 1000, "Forward COMM1")
MB_339:defineReadWriteRadio("FWD_COMM2", 7, 7, 3, 1000, "Forward COMM2")
MB_339:defineReadWriteRadio("AFT_COMM1", 9, 7, 3, 1000, "Aft COMM1")
MB_339:defineReadWriteRadio("AFT_COMM2", 10, 7, 3, 1000, "Aft COMM2")

-- GunsightRepeater
MB_339:define3PosTumb("GUN_REP_PWR", 1, COMMANDS.GunsightRepeaterPower, 409, "Gunsight Repeater", "Gunsight Repeater Power")
MB_339:definePotentiometer("GUN_REP_BRIGHT", 1, COMMANDS.GunsightRepeaterBrt, 408, { 0, 1 }, "Gunsight Repeater", "Gunsight Repeater Brightness")

-- generator switches updated from 2pos to 3pos
MB_339:defineSpringloaded_3PosTumb("GEN1_SW", 1, COMMANDS.Generator1ResetSwitch, COMMANDS.Generator1Switch, 301, "Electrical", "Generator 1 Switch")
MB_339:defineSpringloaded_3PosTumb("GEN2_SW", 1, COMMANDS.Generator2ResetSwitch, COMMANDS.Generator2Switch, 302, "Electrical", "Generator 2 Switch")

-- right now, these are technically the same control
MB_339:defineFlapsControl("FW_FLAPS_LVR", 7, "Flaps FW", "Forward Flaps Lever (DOWN/TAKE OFF/UP)")
MB_339:defineFlapsControl("AFT_FLAPS_LVR", 7, "Flaps AFT", "Aft Flaps Lever (DOWN/TAKE OFF/UP)")

return MB_339
