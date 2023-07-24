BIOS.protocol.beginModule("C-130", 0x9800)
BIOS.protocol.setExportModuleAircrafts({"C-130J"})
--by WarLord
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local defineFloat = BIOS.util.defineFloat
local define3PosTumb = BIOS.util.define3PosTumb
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

BIOS.protocol.endModule()