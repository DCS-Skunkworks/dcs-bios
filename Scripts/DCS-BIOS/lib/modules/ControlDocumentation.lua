--- @class DeprecatedAttributes
--- @field since string? when the control was deprecated
--- @field description string? why the control was deprecated
--- @field use_instead string? which control should be used instead of this control

--- @class BaseControlAttributes
--- @field deprecated DeprecatedAttributes? deprecation information for the control

--- @class LedAttributes: BaseControlAttributes
--- @field color string? the color of the LED

--- @class SwitchAttributes: BaseControlAttributes
--- @field positions string[]? the names of each position of the control
