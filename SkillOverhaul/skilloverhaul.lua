if not _G.SkillOverhaul then
	_G.SkillOverhaul = {}
    SkillOverhaul.Announce = true --You were going to edit this out anyway, may as well give you the option.
	SkillOverhaul.ModPath = ModPath
    SkillOverhaul.SavePath = SavePath
    SkillOverhaul.MenuData = {}
	SkillOverhaul.Hooks = {
		["lib/tweak_data/skilltreetweakdata"] = "lua/skilltreetweakdata.lua",
		["lib/tweak_data/upgradestweakdata"] = "lua/upgradestweakdata.lua",
		["lib/tweak_data/equipmentstweakdata"] = "lua/equipmentstweakdata.lua",
		["lib/tweak_data/interactiontweakdata"] = "lua/interactiontweakdata.lua",
        ["lib/units/beings/player/states/playerstandard"] = "lua/units/playerstandard.lua",
		["lib/units/beings/player/states/playerbleedout"] = "lua/units/playerbleedout.lua",
        ["lib/units/beings/player/playerdamage"] = "lua/units/playerdamage.lua",
		["lib/units/enemies/cop/copdamage"] = "lua/copdamage.lua",
		["lib/units/enemies/cop/copbrain"] = "lua/copbrain.lua",
        ["lib/managers/group_ai_states/groupaistatebase"] = "lua/groupaistatebase.lua",
		["lib/units/weapons/raycastweaponbase"] = "lua/raycastweaponbase.lua",
        ["lib/managers/playermanager"] = "lua/playermanager.lua",
		["lib/managers/localizationmanager"] = "loc/loc.lua",
        ["lib/units/interactions/interactionext"] = "lua/interactionext.lua",
        ["lib/network/handlers/unitnetworkhandler"] = "lua/announcewarning.lua"
	}
end

--Save menu data
function SkillOverhaul:SaveMenu()
    local file = io.open(self.SavePath .. "skilloverhaul.txt", "w+")
	if file then
		file:write(json.encode(SkillOverhaul.MenuData))
		file:close()
	end
end

--Load menu data
function SkillOverhaul:LoadMenu()
	local file = io.open(self.SavePath .. "skilloverhaul.txt", "r")
	if file then
		SkillOverhaul.MenuData = json.decode(file:read("*all"))
		file:close()
	end
end

--Add localized strings for menu
Hooks:Add("LocalizationManagerPostInit", "SkillOverhaul_MenuLocalization", function(loc)
	loc:load_localization_file(SkillOverhaul.ModPath .. "/menu/loc.json")
end)

--Initialize menu
Hooks:Add("MenuManagerInitialize", "SkillOVerhaul_MenuManagerInitialize", function(menu_manager)
        
    MenuCallbackHandler.callback_skilloverhaul_sc_toggle = function(self, item)
        SkillOverhaul.MenuData.SC = (item:value() == "on" and true or false)
        SkillOverhaul:SaveMenu()
    end
    
    MenuCallbackHandler.callback_skilloverhaul_techrework_toggle = function(self, item)
        SkillOverhaul.MenuData.TechRework = (item:value() == "on" and true or false)
        SkillOverhaul:SaveMenu()
    end
        
    SkillOverhaul:LoadMenu()
    
    MenuHelper:LoadFromJsonFile(SkillOverhaul.ModPath .. "/menu/menu.json", SkillOverhaul, SkillOverhaul.MenuData)
    
end)

--Load menu data
SkillOverhaul:LoadMenu()

--Execute script
if RequiredScript then
	local script = RequiredScript:lower()
	if SkillOverhaul.Hooks[script] then
		dofile(SkillOverhaul.ModPath .. SkillOverhaul.Hooks[script])
	end
end