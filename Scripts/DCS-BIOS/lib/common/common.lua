function GetJSON()
    local json = loadfile([[Scripts\JSON.lua]])
    if(json == nil) then
        DCS_INSTALLATION_ROOT = DCS_INSTALLATION_ROOT or ""
        json = loadfile(DCS_INSTALLATION_ROOT.."\\Scripts"..[[\JSON.lua]])
    end

    return json
end
