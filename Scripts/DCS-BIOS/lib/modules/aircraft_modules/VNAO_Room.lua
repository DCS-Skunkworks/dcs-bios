module("VNAO_Room", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class VNAO_Room: Module
local VNAO_Room = Module:new("VNAO_Room", 0x0500, { "VNAO_Ready_Room" })

--by WarLord

VNAO_Room:definePushButton("SLIDE_PREV", 2, 10001, 0, "Systems", "Previous Slide")
VNAO_Room:definePushButton("SLIDE_NEXT", 2, 10002, 0, "Systems", "Next Slide")
VNAO_Room:defineToggleSwitch("LIGHTS", 6, 10003, 387, "Systems", "Light Switch")
VNAO_Room:definePotentiometer("LIGHT_DIM", 6, 10004, 387, { 0, 1 }, "Systems", "Light Dimming")

--Gauges
VNAO_Room:defineFloat("FAN1", 380, { 0, 1 }, "Gauges", "Fan 1 Spin")
VNAO_Room:defineFloat("FAN2", 381, { 0, 1 }, "Gauges", "Fan 2 Spin")
VNAO_Room:defineFloat("FAN3", 382, { 0, 1 }, "Gauges", "Fan 3 Spin")
VNAO_Room:defineFloat("FAN4", 11, { 0, 1 }, "Gauges", "Fan 4 Spin")
VNAO_Room:defineFloat("CLOCK_H", 385, { 0, 1 }, "Gauges", "Clock Hour")
VNAO_Room:defineFloat("CLOCK_M", 383, { 0, 1 }, "Gauges", "Clock Minutes")
VNAO_Room:defineFloat("CLOCK_S", 384, { 0, 1 }, "Gauges", "Clock Seconds")
VNAO_Room:defineFloat("LIGHTS_INT", 387, { 0, 1 }, "Gauges", "Lights Intensity")
VNAO_Room:defineFloat("INSTRUCTOR", 400, { 0, 1 }, "Gauges", "Instructor")
VNAO_Room:defineFloat("PILOT_01", 401, { 0, 1 }, "Gauges", "Pilot 01")
VNAO_Room:defineFloat("PILOT_02", 402, { 0, 1 }, "Gauges", "Pilot 02")
VNAO_Room:defineFloat("PILOT_03", 403, { 0, 1 }, "Gauges", "Pilot 03")
VNAO_Room:defineFloat("PILOT_04", 404, { 0, 1 }, "Gauges", "Pilot 04")
VNAO_Room:defineFloat("PILOT_05", 405, { 0, 1 }, "Gauges", "Pilot 05")
VNAO_Room:defineFloat("PILOT_06", 406, { 0, 1 }, "Gauges", "Pilot 06")
VNAO_Room:defineFloat("PILOT_07", 407, { 0, 1 }, "Gauges", "Pilot 07")
VNAO_Room:defineFloat("PILOT_08", 408, { 0, 1 }, "Gauges", "Pilot 08")
VNAO_Room:defineFloat("PILOT_09", 409, { 0, 1 }, "Gauges", "Pilot 09")
VNAO_Room:defineFloat("PILOT_10", 410, { 0, 1 }, "Gauges", "Pilot 10")
VNAO_Room:defineFloat("PILOT_11", 411, { 0, 1 }, "Gauges", "Pilot 11")
VNAO_Room:defineFloat("PILOT_12", 412, { 0, 1 }, "Gauges", "Pilot 12")
VNAO_Room:defineFloat("PILOT_13", 413, { 0, 1 }, "Gauges", "Pilot 13")
VNAO_Room:defineFloat("PILOT_14", 414, { 0, 1 }, "Gauges", "Pilot 14")
VNAO_Room:defineFloat("PILOT_15", 415, { 0, 1 }, "Gauges", "Pilot 15")
VNAO_Room:defineFloat("PILOT_16", 416, { 0, 1 }, "Gauges", "Pilot 16")
VNAO_Room:defineFloat("PILOT_17", 417, { 0, 1 }, "Gauges", "Pilot 17")
VNAO_Room:defineFloat("PILOT_18", 418, { 0, 1 }, "Gauges", "Pilot 18")
VNAO_Room:defineFloat("PILOT_19", 419, { 0, 1 }, "Gauges", "Pilot 19")
VNAO_Room:defineFloat("PILOT_20", 420, { 0, 1 }, "Gauges", "Pilot 20")
VNAO_Room:defineFloat("PILOT_21", 421, { 0, 1 }, "Gauges", "Pilot 21")
VNAO_Room:defineFloat("PILOT_22", 422, { 0, 1 }, "Gauges", "Pilot 22")
VNAO_Room:defineFloat("PILOT_23", 424, { 0, 1 }, "Gauges", "Pilot 23")

return VNAO_Room
