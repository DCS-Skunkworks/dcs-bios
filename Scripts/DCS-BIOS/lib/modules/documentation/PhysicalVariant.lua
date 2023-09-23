module("PhysicalVariant", package.seeall)

--- @enum PhysicalVariant
local PhysicalVariant = {
	three_position_switch = "3_position_switch",
	button_light = "button_light",
	infinite_rotary = "infinite_rotary",
	limited_rotary = "limited_rotary",
	push_button = "push_button",
	rocker_switch = "rocker_switch",
	toggle_switch = "toggle_switch",
}

return PhysicalVariant
