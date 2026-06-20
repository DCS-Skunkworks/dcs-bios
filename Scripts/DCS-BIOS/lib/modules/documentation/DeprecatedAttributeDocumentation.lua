module("DeprecatedAttributeDocumentation", package.seeall)

--- @class DeprecatedAttributeDocumentation
--- @field since string? when the control was deprecated
--- @field description string? why the control was deprecated
--- @field use_instead string? which control should be used instead of this control
local DeprecatedAttributeDocumentation = {}

--- @param attributes DeprecatedAttributes
--- @return DeprecatedAttributeDocumentation
function DeprecatedAttributeDocumentation:new(attributes)
	assert(attributes ~= nil)

	--- @type DeprecatedAttributeDocumentation
	local o = {
		since = attributes.since,
		description = attributes.description,
		use_instead = attributes.use_instead,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

--- @param attributes DeprecatedAttributes?
--- @return DeprecatedAttributeDocumentation?
function DeprecatedAttributeDocumentation.from_attributes(attributes)
	if attributes == nil then
		return nil
	end

	return DeprecatedAttributeDocumentation:new(attributes)
end

return DeprecatedAttributeDocumentation
