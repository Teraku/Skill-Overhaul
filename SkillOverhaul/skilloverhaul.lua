if not SkillOverhaul then
	SkillOverhaul = {}
	SkillOverhaul.SC = false --Set to true if using SC's difficulty overhaul.
    SkillOverhaul.TechTweak = false --Set to true if using Naviaux's technician rework.
	SkillOverhaul.ModPath = ModPath
	SkillOverhaul.Hooks = {
		["lib/tweak_data/skilltreetweakdata"] = "lua/skilltreetweakdata.lua",
		["lib/tweak_data/upgradestweakdata"] = "lua/upgradestweakdata.lua",
		["lib/tweak_data/equipmentstweakdata"] = "lua/equipmentstweakdata.lua",
		["lib/tweak_data/interactiontweakdata"] = "lua/interactiontweakdata.lua",
		["lib/units/beings/player/states/playerbleedout"] = "lua/playerbleedout.lua",
		["lib/units/enemies/cop/copdamage"] = "lua/copdamage.lua",
		["lib/units/enemies/cop/copbrain"] = "lua/copbrain.lua",
		["lib/units/weapons/raycastweaponbase"] = "lua/raycastweaponbase.lua",
		["lib/managers/localizationmanager"] = "loc/loc.lua",
		["lib/managers/playermanager"] = "lua/playermanager.lua",
        ["lib/units/interactions/interactionext"] = "lua/interactionext.lua"
	}
end

if RequiredScript then
	local script = RequiredScript:lower()
	if SkillOverhaul.hooks[script] then
		dofile(SkillOverhaul.ModPath .. SkillOverhaul.Hooks[script])
	end
end