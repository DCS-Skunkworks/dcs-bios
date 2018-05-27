BIOS.ALL_PLAYABLE_AIRCRAFT = {}
BIOS.CLICKABLE_COCKPIT_AIRCRAFT = {}
BIOS.FLAMING_CLIFFS_AIRCRAFT = {}
local function a(name, hasClickableCockpit)
	BIOS.ALL_PLAYABLE_AIRCRAFT[#BIOS.ALL_PLAYABLE_AIRCRAFT+1] = name
	if hasClickableCockpit then
		BIOS.CLICKABLE_COCKPIT_AIRCRAFT[#BIOS.CLICKABLE_COCKPIT_AIRCRAFT+1] = name
	else
		BIOS.FLAMING_CLIFFS_AIRCRAFT[#BIOS.FLAMING_CLIFFS_AIRCRAFT+1] = name
	end
end

a("A-10C", true)
a("Ka-50", true)
a("Mi-8MT", true)
a("P-51D", true)
a("Su-25T", false)
a("TF-51D", true)
a("UH-1H", true)
a("MiG-21Bis", true)
a("F-86F Sabre", true)
a("FW-190D9", true)
a("Bf-109K-4", true)
a("SpitfireLFMkIX", true)
a("AJS37", true)
a("SA342L", true)
a("SA342M", true)
a("SA342Mistral", true)
a("SA342Minigun", true)
