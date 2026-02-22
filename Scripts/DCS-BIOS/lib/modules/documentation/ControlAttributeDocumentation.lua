module("ControlAttributeDocumentation", package.seeall)

local DeprecatedAttributeDocumentation = require("Scripts.DCS-BIOS.lib.modules.documentation.DeprecatedAttributeDocumentation")

--- @class ControlAttributeDocumentation
--- @field deprecated DeprecatedAttributeDocumentation? whether the control has been deprecated
--- @field positions string[]? descriptions of each position of the control
local ControlAttributeDocumentation = {}

--- @param deprecated DeprecatedAttributeDocumentation? whether the control has been deprecated
--- @param positions string[]? descriptions of each position of the control
--- @return ControlAttributeDocumentation
function ControlAttributeDocumentation:new(deprecated, positions)
	--- @type ControlAttributeDocumentation
	local o = {
		deprecated = deprecated,
		positions = positions,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

--- @param base_attributes BaseControlAttributes?
--- @return ControlAttributeDocumentation?
function ControlAttributeDocumentation.from_base_attributes(base_attributes)
	if base_attributes == nil then
		return nil
	end

	return ControlAttributeDocumentation:new(DeprecatedAttributeDocumentation.from_attributes(base_attributes.deprecated))
end

--- @param switch_attributes SwitchAttributes?
--- @return ControlAttributeDocumentation?
function ControlAttributeDocumentation.from_switch_attributes(switch_attributes)
	if switch_attributes == nil then
		return nil
	end

	return ControlAttributeDocumentation:new(DeprecatedAttributeDocumentation.from_attributes(switch_attributes.deprecated), switch_attributes.positions)
end

--- @param led_attributes LedAttributes?
--- @return ControlAttributeDocumentation?
function ControlAttributeDocumentation.from_led_attributes(led_attributes)
	if led_attributes == nil then
		return nil
	end

	return ControlAttributeDocumentation:new(DeprecatedAttributeDocumentation.from_attributes(led_attributes.deprecated), { "Off", led_attributes.color })
end

return ControlAttributeDocumentation
