Hooks:Add("LocalizationManagerPostInit", "SkillOverhaulLocalization", function(loc)
	LocalizationManager:add_localized_strings({
    --[[    
    Format is [""] = "",
    Remove trailing comma for the last entry
	
	Use \n for newlines.
	
	Use $basic to make a skill indicate that you own basic
	Use $pro to make a skill indicate that you own ace
	
	Surround with double # signs to highlight values.
	
	Example format is as follows:
	
    BASIC: ##$basic##\nYou can do foo.\n\nACE: ##$pro##\nYou get a ##bar## multiplier.	
	]]
	
	["menu_moving_target_rokk_desc"] = "BASIC: ##$basic##\nYour climbing speed is increased by ##20%##.\n\nYour dodge chance on ziplines is increased by ##15%##.\n\nACE: ##$pro##\nYou can sprint in any direction.",
	["menu_stockholm_syndrome_rokk_desc"] = "BASIC: ##$basic##\nNearby civilians will revive you if you interact with them.\n\nThe first bullet shot at a civilian will do no damage.\n\nACE: ##$pro##\nCivilians reviving you will give you ammo."
    
    ["menu_shaped_charge_rokk_desc"] = "BASIC: ##$basic##\nYour tripmines can be converted into shaped charges, used to blow open safes and doors.\n\nACE: ##$pro##\nYou get ##7 more tripmines.##"
	
    })
end)