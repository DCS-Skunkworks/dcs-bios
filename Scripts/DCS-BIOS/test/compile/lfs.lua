module("lfs", package.seeall)

---@diagnostic disable-next-line: lowercase-global
lfs = {}

---@diagnostic disable-next-line: duplicate-set-field
lfs.writedir = function()
	return "./"
end

return lfs
