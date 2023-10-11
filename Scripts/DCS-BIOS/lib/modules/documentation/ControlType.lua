module("ControlType", package.seeall)

--- @enum ControlType
local ControlType = {
	two_pos_two_command_switch_open_close = "2Pos_2Command_Switch_OpenClose",
	three_pos_two_command_switch_open_close = "3Pos_2Command_Switch_OpenClose",
	action = "action",
	analog_dial = "analog_dial",
	analog_gauge = "analog_gauge",
	discrete_dial = "discrete_dial",
	display = "display",
	electrically_held_switch = "electrically_held_switch",
	emergency_parking_brake = "emergency_parking_brake",
	fixed_step_dial = "fixed_step_dial",
	frequency = "frequency",
	led = "led",
	limited_dial = "limited_dial",
	metadata = "metadata",
	mission_computer_switch = "mission_computer_switch",
	multi = "Multi",
	radio = "radio",
	selector = "selector",
	toggle_switch = "toggle_switch",
	variable_step_dial = "variable_step_dial",
}

return ControlType
