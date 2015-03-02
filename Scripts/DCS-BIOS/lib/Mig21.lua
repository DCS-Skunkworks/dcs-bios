BIOS.protocol.beginModule("MiG-21Bis", 0x2200)
BIOS.protocol.setExportModuleAircrafts({"MiG-21Bis"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineFixedStepInput = BIOS.util.defineFixedStepInput
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch

dofile(lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/devices.lua")
dofile(lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/command_defs.lua")

defineToggleSwitch("BAT_PWR", devices.DC_BUS, device_commands.BatteryOn, 165, "Electrical Panel", "Battery Power Switch")

devices = nil
device_commands = nil

BIOS.protocol.endModule()