module("TextDisplay", package.seeall)

--- @class TextDisplayItem
--- @field pages string[]
--- @field id string
--- @field static_text boolean
--- @field x integer
--- @field y integer
--- @field index integer?
--- @field alignment string?

--- @class TextDisplay
local TextDisplay = {}

---Replaces all instances of the keys of the provided map with the values in the provided map
---@param s string string to replace values in
---@param map table map of values to replace, where keys are replaced by values
---@return string s the resulting substituted string
local function replaceSymbols(s, map)
	for key, value in pairs(map) do
		s = s:gsub(key, value)
	end

	return s
end

-- this function works by iterating over all of the items in the provided indicatordata table and substituting
-- them in for each line according to their x and y values

---Gets the display lines for a DCS display
---@param dcsDisplay table The DCS display to parse
---@param width number The character width of the screen
---@param height number The lines of text the screen supports
---@param displayIndicatorData { [string]: TextDisplayItem[] } The data from the lua file containing information about the display
---@param displayPage string The current display page
---@param replaceSymbolMap table Map of symbols to replace from -> to
---@param parentMap table? map of pages to their parent pages
---@param force_page_match boolean whether the page name must match in order to display an item, even if only one page is possible
---@return table displayLines The lines of the display
function TextDisplay.GetDisplayLines(dcsDisplay, width, height, displayIndicatorData, displayPage, replaceSymbolMap, parentMap, force_page_match)
	local emptyLine = string.rep(" ", width)

	local displayLines = {}
	for i = 1, height do
		displayLines[i] = emptyLine
	end
	if not dcsDisplay then
		return displayLines
	end

	parentMap = parentMap or {}
	local parentPage = parentMap[displayPage]

	for k, v in pairs(dcsDisplay) do
		local candidates = displayIndicatorData[k]
		if candidates then
			if replaceSymbolMap then
				v = replaceSymbols(v, replaceSymbolMap)
			end
			local render_instructions = nil
			if #candidates == 1 and not force_page_match then
				render_instructions = candidates[1]
			else
				for _, ri in pairs(candidates) do
					local parent_instructions = nil
					for _, page in pairs(ri.pages) do
						if displayPage == page then
							render_instructions = ri
							break
						elseif parentPage == page then
							parent_instructions = ri
						end
					end
					-- if we haven't found anything for this page, let's try the parent page
					if render_instructions == nil then
						render_instructions = parent_instructions
					end
				end
			end
			if render_instructions then
				local ri = render_instructions
				local old_line = displayLines[ri.y]
				local replacements = {}
				if not ri.alignment or ri.alignment == "LFT" then
					for i = 1, v:len(), 1 do
						local c = v:sub(i, i)
						if c ~= " " then
							replacements[ri.x + i - 1] = c
						end
					end
				elseif ri.alignment == "RGHT" then
					for i = 1, v:len(), 1 do
						local c = v:sub(i, i)
						if c ~= " " then
							replacements[ri.x - (v:len() - i)] = c
						end
					end
				end
				local new_line = ""
				for i = 1, width, 1 do
					new_line = new_line .. (replacements[i] or old_line:sub(i, i))
				end
				displayLines[ri.y] = new_line
			end
		end
	end

	return displayLines
end

return TextDisplay
