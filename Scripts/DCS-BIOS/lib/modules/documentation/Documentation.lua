module("Documentation", package.seeall)

local Category = require("Scripts.DCS-BIOS.lib.modules.documentation.Category")

--- @class Documentation: { [string]: Category }
local Documentation = {}

--- TODO
--- @return Documentation
function Documentation:new()
	--- @type Documentation
	local o = {}

	setmetatable(o, self)
	self.__index = self
	return o
end

--- Gets or adds the specified category
--- @param category string the name of the category to get or add
--- @return Category category the new or existing category
function Documentation:getOrAddCategory(category)
	if not self[category] then
		self[category] = Category:new()
	end
	return self[category]
end

return Documentation
