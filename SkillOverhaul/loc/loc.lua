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
        
        "",
        ]]
        
        --Mastermind
        ["menu_stockholm_syndrome_rokk_desc"] = "BASIC: ##$basic##\nNearby civilians will revive you if you interact with them.\n\nThe first bullet shot at a civilian will do no damage.\n\nACE: ##$pro##\nCivilians reviving you will give you ammo.",
        
        --Enforcer
        ["menu_overkill_rokk_desc"] = "BASIC: ##$basic##\nAfter killing an enemy, your shotgun and saw damage is increased by ##75%## for ##5## seconds.\n\nACE: ##$pro##\nThe damage boost now applies to all weapons.\n\nKilling an enemy gives you a ##20%## damage reduction for ##5## seconds.",
        
        --Technician
        ["menu_insulation_rokk_desc"] = "BASIC: ##$basic##\nTaser shock attacks on you backfire, knocking back the Taser.\n\nACE: ##$pro##\nInteracting with an enemy Taser while he is electrocuting you will electrocute him, dealing ##50%## damage to his health.\n\nWhile being tased, your bullets shock enemies.",
        --Fix for Naviaux's tech tweak
        ["t_right5_desc"] = "BASIC: ##$basic##\nTaser shock attacks on you backfire, knocking back the Taser.\n\nACE: ##$pro##\nInteracting with an enemy Taser while he is electrocuting you will electrocute him, dealing ##50%## damage to his health.\n\nWhile being tased, your bullets shock enemies.",	
        
        --Fugitive
        ["menu_moving_target_rokk_desc"] = "BASIC: ##$basic##\nYour climbing speed is increased by ##20%##.\n\nYour dodge chance on ziplines is increased by ##15%##.\n\nACE: ##$pro##\nYou can sprint in any direction.",
        ["menu_cell_mates_rokk_desc"] = "BASIC: ##$basic##\nThe damage thugs deal to you is reduced by ##35%##.\n\nACE: ##$pro##\nYour First Aid Kits have a ##20%## chance to restore a single down."
    })
	
    if not SkillOverhaul.SC then
        LocalizationManager:add_localized_strings({
            ["menu_inspire_desc"] = "BASIC: ##$basic##\nYou revive crew members ##50%## faster.\n\nYou can shout at crew members to make them move and reload ##20%## faster.\n\nACE: ##$pro##\nThere is a ##50%## chance you can revive crew members from a distance by shouting at them.",
            
            ["menu_from_the_hip_rokk_desc"] = "BASIC: ##$basic##\nIncreases accuracy of all weapons by ##8## when firing from the hip.\n\nACE: ##$pro##\nYou do ##20%## more damage with Light Machine Guns.\n\nYou reload Light Machine Guns ##25%## faster."
        })
    end

    if not SkillOverhaul.SC and not SkillOverhaul.TechTweak then
        LocalizationManager:add_localized_strings({
            ["menu_shaped_charge_rokk_desc"] = "BASIC: ##$basic##\nYour tripmines can be converted into shaped charges, used to blow open safes and doors.\n\nACE: ##$pro##\nYou get ##7## more tripmines."        
        })
    end
end)