module("lfs", package.seeall)

---@diagnostic disable-next-line: lowercase-global
lfs = {}

---@diagnostic disable-next-line: duplicate-set-field
lfs.writedir = function()
	return "./"
end

---@diagnostic disable-next-line: duplicate-set-field
lfs.attributes = function (filepath, request_name) end

return lfs
