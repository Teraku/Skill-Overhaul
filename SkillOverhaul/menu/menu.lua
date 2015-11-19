--Save menu data
function SkillOverhaul:SaveMenu()
    local file = io.open(self.ModPath .. "/menu/save.txt", "w+")
	if file then
		file:write(json.encode(self.MenuData))
		file:close()
	end
end

--Load menu data
function SkillOverhaul:LoadMenu()
	local file = io.open(self.ModPath .. "/menu/save.txt", "r")
	if file then
		self.MenuData = json.decode(file:read("*all"))
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