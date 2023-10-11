module("InputType", package.seeall)

--- @enum InputType
local InputType = {
	action = "action",
	fixed_step = "fixed_step",
	set_state = "set_state",
	variable_step = "variable_step",
	string = "string",
}

return InputType
