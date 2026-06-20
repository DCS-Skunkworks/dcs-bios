module("ICommand", package.seeall)

--- @enum ICommand
local ICommand = {
	left_engine_start = 311,
	right_engine_start = 312,
	left_engine_stop = 313,
	right_engine_stop = 314,
	gear_up = 430,
	gear_down = 431,
	flaps_up = 1047,
	flaps_down = 1049,
	flaps_maneuver_from_up = 1568,
	flaps_maneuver_from_down = 1569,
}

return ICommand
