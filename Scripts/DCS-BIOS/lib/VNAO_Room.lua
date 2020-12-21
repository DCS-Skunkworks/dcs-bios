BIOS.protocol.beginModule("VNAO_Room", 0x0500)
BIOS.protocol.setExportModuleAircrafts({"VNAO_Ready_Room"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineToggleSwitch = BIOS.util.defineToggleSwitch

definePushButton("SLIDE_PREV", 2, 10001, 0, "Systems", "Previous Slide")	
definePushButton("SLIDE_NEXT", 2, 10002, 0, "Systems", "Next Slide")
defineToggleSwitch("LIGHTS", 6, 10003, 387, "Systems", "Light Switch")
definePotentiometer("LIGHT_DIM", 6, 10004, 387, {0, 1}, "Systems", "Light Dimming")

--Gauges
defineFloat("FAN1", 380, {0, 1}, "Gauges", "Fan 1 Spin")
defineFloat("FAN2", 381, {0, 1}, "Gauges", "Fan 2 Spin")
defineFloat("FAN3", 382, {0, 1}, "Gauges", "Fan 3 Spin")
defineFloat("FAN4", 11, {0, 1}, "Gauges", "Fan 4 Spin")
defineFloat("CLOCK_H", 385, {0, 1}, "Gauges", "Clock Hour")
defineFloat("CLOCK_M", 383, {0, 1}, "Gauges", "Clock Minutes")
defineFloat("CLOCK_S", 384, {0, 1}, "Gauges", "Clock Seconds")
defineFloat("LIGHTS_INT", 387, {0, 1}, "Gauges", "Lights Intensity")
defineFloat("INSTRUCTOR", 400, {0, 1}, "Gauges", "Instructor")
defineFloat("PILOT_01", 401, {0, 1}, "Gauges", "Pilot 01")
defineFloat("PILOT_02", 402, {0, 1}, "Gauges", "Pilot 02")
defineFloat("PILOT_03", 403, {0, 1}, "Gauges", "Pilot 03")
defineFloat("PILOT_04", 404, {0, 1}, "Gauges", "Pilot 04")
defineFloat("PILOT_05", 405, {0, 1}, "Gauges", "Pilot 05")
defineFloat("PILOT_06", 406, {0, 1}, "Gauges", "Pilot 06")
defineFloat("PILOT_07", 407, {0, 1}, "Gauges", "Pilot 07")
defineFloat("PILOT_08", 408, {0, 1}, "Gauges", "Pilot 08")
defineFloat("PILOT_09", 409, {0, 1}, "Gauges", "Pilot 09")
defineFloat("PILOT_10", 410, {0, 1}, "Gauges", "Pilot 10")
defineFloat("PILOT_11", 411, {0, 1}, "Gauges", "Pilot 11")
defineFloat("PILOT_12", 412, {0, 1}, "Gauges", "Pilot 12")
defineFloat("PILOT_13", 413, {0, 1}, "Gauges", "Pilot 13")
defineFloat("PILOT_14", 414, {0, 1}, "Gauges", "Pilot 14")
defineFloat("PILOT_15", 415, {0, 1}, "Gauges", "Pilot 15")
defineFloat("PILOT_16", 416, {0, 1}, "Gauges", "Pilot 16")
defineFloat("PILOT_17", 417, {0, 1}, "Gauges", "Pilot 17")
defineFloat("PILOT_18", 418, {0, 1}, "Gauges", "Pilot 18")
defineFloat("PILOT_19", 419, {0, 1}, "Gauges", "Pilot 19")
defineFloat("PILOT_20", 420, {0, 1}, "Gauges", "Pilot 20")
defineFloat("PILOT_21", 421, {0, 1}, "Gauges", "Pilot 21")
defineFloat("PILOT_22", 422, {0, 1}, "Gauges", "Pilot 22")
defineFloat("PILOT_23", 424, {0, 1}, "Gauges", "Pilot 23")



BIOS.protocol.endModule()