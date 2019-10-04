BIOS.protocol.beginModule("F-16C_50", 0x4400)
BIOS.protocol.setExportModuleAircrafts({"F-16C_50"})

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication


local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local define3PosTumb = BIOS.util.define3PosTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineElectricallyHeldSwitch = BIOS.util.defineElectricallyHeldSwitch
local defineFloat = BIOS.util.defineFloat
local define8BitFloat = BIOS.util.define8BitFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter


--Control Interface
defineToggleSwitch("DIGI_BAK_SW", 2, 3001, 566, "Control Interface", "DIGITAL BACKUP Switch, OFF/BACKUP")
defineToggleSwitch("ALT_FLAPS_SW", 2, 3002, 567, "Control Interface", "ALT FLAPS Switch, NORM/EXTEND")
defineToggleSwitch("BIT_SW", 2, 3003, 574, "Control Interface", "BIT Switch, OFF/BIT")
defineToggleSwitch("FLCS_RESET_SW", 2, 3004, 573, "Control Interface", "FLCS RESET Switch, OFF/RESET")
defineToggleSwitch("LE_FLAPS_SW", 2, 3005, 572, "Control Interface", "LE FLAPS Switch, AUTO/LOCK")
defineToggleSwitch("TRIM_AP_DISC_SW", 2, 3006, 564, "Control Interface", "TRIM/AP DISC Switch, DISC/NORM")
definePotentiometer("ROLL_TRIM", 2, 3007, 560, nil, "Control Interface", "ROLL TRIM Wheel")
definePotentiometer("PITCH_TRIM", 2, 3008, 562, nil, "Control Interface", "PITCH TRIM Wheel")
definePotentiometer("YAW_TRIM", 2, 3009, 565, nil, "Control Interface", "YAW TRIM Knob")
defineToggleSwitch("MANUAL_PITCH_SW", 2, 3010, 425, "Control Interface", "MANUAL PITCH Override Switch, OVRD/NORM")
defineToggleSwitch("STORES_CONFIG_SW", 2, 3011, 358, "Control Interface", "STORES CONFIG Switch, CAT III/CAT I")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

-- defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
-- end, 65535, "External Aircraft Model", "Formation Lights")


-- defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	-- if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Left Position Light (red)")
-- defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	-- if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Right Position Light (green)")


-- defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	-- if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Tail Strobe Light")
-- defineIntegerFromGetter("EXT_STROBE_LEFT", function()
	-- if LoGetAircraftDrawArgumentValue(195) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Left Strobe Light")
-- defineIntegerFromGetter("EXT_STROBE_RIGHT", function()
	-- if LoGetAircraftDrawArgumentValue(196) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Right Strobe Light")


BIOS.protocol.endModule()