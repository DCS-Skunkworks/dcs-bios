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
a("M2000C", true)
a("FA-18C_hornet", true)
a("F-5E-3", true)
a("L-39ZA", true)
a("AV8BNA", true)
a("A-10A", false)
a("F-15C", false)
a("J-11A", false)
a("MiG-29A", false)
a("MiG-29S", false)
a("Su-25", false)
a("Su-25T", false)
a("Su-27", false)
a("Su-33", false)
--a("MB-339PAN", true) --MOD
--a("VSN_F14A", false) --MOD

