module("Category", package.seeall)

--- @class Category: { [string]: Control }
local Category = {}

--- TODO
--- @return Category
function Category:new()
	--- @type Category
	local o = {}

	setmetatable(o, self)
	self.__index = self
	return o
end

--- Adds a new control
--- @param control Control
function Category:addControl(control)
	self[control.identifier] = control
end

return Category
