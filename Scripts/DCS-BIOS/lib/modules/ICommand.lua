module("ICommand", package.seeall)

--- @enum ICommand
local ICommand = {
	left_engine_start = 311,
	right_engine_start = 312,
	left_engine_stop = 313,
	right_engine_stop = 314,
}

return ICommand
