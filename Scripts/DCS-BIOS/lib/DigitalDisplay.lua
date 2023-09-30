module("DigitalDisplay", package.seeall)

--- @class DigitalDisplay
DigitalDisplay = {}

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

---Gets the display lines for a DCS display
---@param dcsDisplay table The DCS display to parse
---@param displayIndicatorData table The data from the json file containing information about the display
---@param getDisplayPage function Gets the current display page
---@param replaceSymbolMap table Map of symbols to replace from -> to
---@return table displayLines The lines of the display (bios id -> txt)
function DigitalDisplay.GetDisplayItems(dcsDisplay, displayIndicatorData, getDisplayPage, replaceSymbolMap)
    local displayLines = {}

    local displayPage = nil
    if getDisplayPage then
         displayPage = getDisplayPage()
    end

    for k, v in pairs(dcsDisplay) do
        -- "k": {
        --     "pages": [
        --         "MAIN" // list of pages that this item can appear on
        --     ],
        --     "biosId": "ARC210_COMSEC_MODE", // bios id to use
        --     "description": "COMSEC Mode", // the name/description displayed in the reference tool
        --     "maxLength": 11, // max length of the string
        --     "alignment": "LEFT" // optional alignment for string padding (LEFT, RIGHT, CENTER)
        --     "type": "TEXT" // the type of the item, which indicates how it should be parsed and generated
        -- },
        local candidates = displayIndicatorData[k]
        if candidates then
            local render_instructions = nil
            if displayPage then
                for _, ri in pairs(candidates) do
                    for _, page in pairs(ri.pages) do
                        if displayPage == page then
                            render_instructions = ri
                            break
                        end
                    end
                end
            else
                render_instructions = candidates[1]
            end
            if render_instructions then
                if replaceSymbolMap then
                    v = replaceSymbols(v, replaceSymbolMap)
                end
                local ri = render_instructions
                if (ri.type == "TEXT") then
                    local txt = v;
                    local max_len = ri.maxLength
                    txt = v:sub(1, max_len)

                    if ri.alignment == "LEFT" then
                        txt = txt .. string.rep(" ", max_len - #txt)
                    elseif ri.alignment == "RIGHT" then
                        txt = string.rep(" ", max_len - #txt) .. txt
                    elseif ri.alignment == "CENTER" then
                        local half = #txt/2
                        txt = string.rep(" ", max_len - math.floor(half)) .. txt .. string.rep(" ", max_len - math.ceil(half))
                    end

                    displayLines[ri.biosId] = txt
                end
            end
        end
    end

    return displayLines
end

return DigitalDisplay
