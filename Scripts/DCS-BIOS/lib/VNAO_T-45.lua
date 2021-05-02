BIOS.protocol.beginModule("VNAO_T-45", 0x9000)
BIOS.protocol.setExportModuleAircrafts({"T-45"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local define3PosTumb = BIOS.util.define3PosTumb
local defineTumb = BIOS.util.defineTumb
local defineFloat = BIOS.util.defineFloat
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineToggleSwitch = BIOS.util.defineToggleSwitch

defineTumb("FLAPS_LVR", 19, 3013, 7, 0.5, {0, 1}, nil, false, "General", "Flaps Lever, UP/ 1/2 /DOWN")

--Gauges
--defineFloat("FAN1", 380, {0, 1}, "Gauges", "Fan 1 Spin")




BIOS.protocol.endModule()