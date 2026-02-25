module("Control", package.seeall)

--- @class Control
--- @field category string the category the control is in
--- @field control_type ControlType the type of the control
--- @field identifier string the identifier of the control
--- @field description string
--- @field inputs Input[] any inputs the control supports
--- @field outputs Output[] any outputs the control supports
--- @field api_variant ApiVariant? TODO
--- @field deprecated DeprecatedAttributeDocumentation? whether the control has been deprecated
--- @field positions string[]? descriptions of each position of the control
--- @field color string? the color of the led, if any
local Control = {}

--- TODO
--- @param category string the category the control is in
--- @param controlType ControlType the type of the control
--- @param identifier string the identifier of the control
--- @param inputs Input[] any inputs the control supports
--- @param outputs Output[] any outputs the control supports
--- @param apiVariant ApiVariant? TODO
--- @param attributes ControlAttributeDocumentation? additional control attributes
--- @return Control
function Control:new(category, controlType, identifier, description, inputs, outputs, apiVariant, attributes)
	assert(category ~= nil)
	assert(controlType ~= nil)
	assert(identifier ~= nil)
	assert(description ~= nil)
	assert(inputs ~= nil)
	assert(outputs ~= nil)

	--- @type Control
	local o = {
		category = category,
		control_type = controlType,
		identifier = identifier,
		description = description,
		inputs = inputs,
		outputs = outputs,
		api_variant = apiVariant,
	}

	if attributes ~= nil then
		o.deprecated = attributes.deprecated
		o.positions = attributes.positions
		o.color = attributes.color
	end

	setmetatable(o, self)
	self.__index = self
	return o
end

return Control
