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
        ["menu_stockholm_syndrome_rokk_desc"] = "BASIC: ##$basic##\nNearby civilians and converted enemies will revive you if you interact with them.\n\nThe first bullet shot at a civilian will do no damage.\n\nACE: ##$pro##\nCivilians reviving you will give you ammo.",
        ["menu_dominator_rokk_desc"] = "BASIC: ##$basic##\nYou can intimidate a non-special enemy into a hostage.\n\nACE: ##$pro##\nThe range of your intimidation is increased by ##50%##.\n\nIntimidated civilians around you will remain on the ground.\n\nThere is a small chance that aiming at enemies will intimidate them. This chance increases with your weapon's threat level.",
        ["menu_control_freak_rokk_desc"] = "BASIC: ##$basic##\nHaving a converted enemy increases your movement speed by ##10%##.\n\nYour converted enemies take ##40%## less damage.\n\nYou can now convert ##2## enemies at once.\n\nACE: ##$pro##\nHaving a converted enemy increases your health by ##20%##.\n\nYour converted enemies take an additional ##40%## less damage.",
        
        --Enforcer
        ["menu_shotgun_cqb_rokk_desc"] = "BASIC: ##$basic##\nIncreases your shotgun reload speed by ##50%##.\n\nACE: ##$pro##\nYour shotgun steelsight speed is increased by ##125%##.\n\nYour fire rate with shotguns is increased by ##50%##.",
        ["menu_tough_guy_desc"] = "BASIC: ##$basic##\nReduces your camera shake when taking damage by ##50%##.\n\nACE: ##$pro##\nYour bleedout health is increased by ##150%##.",
        ["menu_overkill_rokk_desc"] = "BASIC: ##$basic##\nAfter killing an enemy, your shotgun and saw damage is increased by ##75%## for ##5## seconds.\n\nACE: ##$pro##\nThe damage boost now applies to all weapons.\n\nKilling an enemy gives you a ##20%## damage reduction for ##5## seconds.",
        ["menu_oppressor_rokk_desc"] = "BASIC: ##$basic##\nYour weapons are ##75%## more effective at threatening enemies.\n\nACE: ##$pro##\nYour shots have a chance to spread panic among your enemies. Higher threat stats will increase this chance.",
        
        --Technician
        ["menu_insulation_rokk_desc"] = "BASIC: ##$basic##\nTaser shock attacks on you backfire, knocking back the Taser.\n\nACE: ##$pro##\nInteracting with an enemy Taser while he is electrocuting you will electrocute him, dealing ##50%## damage to his health.\n\nWhile being tased, your bullets shock enemies.",
        --Fix for Naviaux's tech tweak
        ["t_right5_desc"] = "BASIC: ##$basic##\nTaser shock attacks on you backfire, knocking back the Taser.\n\nACE: ##$pro##\nInteracting with an enemy Taser while he is electrocuting you will electrocute him, dealing ##50%## damage to his health.\n\nWhile being tased, your bullets shock enemies.",	
        
        --Ghost
        ["menu_nine_lives_desc"] = "BASIC: ##$basic##\nYou gain the ability to go into bleedout ##1## more time before going into custody.\n\nACE: ##$pro##\nWhen you get downed for the first time, you get right back up. Subsequent downs have a ##35%## chance to instantly revive you.",
        
        --Fugitive
        ["menu_freedom_call_rokk_desc"] = "BASIC: ##$basic##\nYour climbing speed is increased by ##20%##.\n\nYour dodge chance on ziplines is increased by ##15%##.\n\nACE: ##$pro##\nYou can sprint in any direction.",
        ["menu_cell_mates_rokk_desc"] = "BASIC: ##$basic##\nThe damage thugs deal to you is reduced by ##35%##.\n\nACE: ##$pro##\nYour First Aid Kits have a ##20%## chance to restore a single down.",
    
		--Armor Overhaul Compatibility
        ["menu_stockholm_syndrome_rokk_arm_desc"] = "BASIC: ##$basic##\nUnlocks Lifa Vest. Nearby civilians and converted enemies will revive you if you interact with them.\nThe first bullet shot at a civilian will do no damage.\n\nACE: ##$pro##\nImproves your Lifa Vest, which now regenerates ##3## HP per second. Civilians reviving you will give you ammo.",
        ["menu_moving_target_rokk_arm_desc"] = "BASIC: ##$basic##\nUnlocks the Thin Vest. You gain ##2%## extra movement speed for every ##3## points of detection risk under ##35##, up to ##20%##.\n\nACE: ##$pro##\nYour Thin Vest's dodge value is increased by ##15%##. You gain ##2%## extra movement speed for every ##1## point of detection risk under ##35##, up to ##30%##."
     })
	
    if not SkillOverhaul.MenuData.SC then
        LocalizationManager:add_localized_strings({
            ["menu_inspire_desc"] = "BASIC: ##$basic##\nYou revive crew members ##50%## faster.\n\nYou can shout at crew members to make them move and reload ##20%## faster.\n\nACE: ##$pro##\nThere is a ##50%## chance you can revive crew members from a distance by shouting at them.",
            ["menu_moving_target_rokk_desc"] = "BASIC: ##$basic##\nYou gain ##2%## extra movement speed for every ##3## points of detection risk under ##35##, up to ##20%##.\n\nACE: ##$pro##\nYou gain ##2%## extra movement speed for every ##1## point of detection risk under ##35##, up to ##30%##.",
            
            ["menu_from_the_hip_rokk_desc"] = "BASIC: ##$basic##\nIncreases accuracy of all weapons by ##8## when firing from the hip.\n\nACE: ##$pro##\nYou do ##20%## more damage with Light Machine Guns.\n\nYou reload Light Machine Guns ##25%## faster.",
            
            ["menu_smg_master_rokk_desc"] = "BASIC: ##$basic##\nYour reload speed with SMG's is increased by ##35%##.\n\nACE: ##$pro##\nYour damage with SMG's is increased by ##20%##.",
            
            --Rogue and crook
            ["menu_deck4_1_desc"] = "Your chance to dodge is increased by ##10%##.",
            ["menu_deck6_1_desc"] = "Your chance to dodge is increased by ##10%##.",
            
            --Muscle
            ["menu_deck2_7_desc"] = "You regenerate ##3.5%## of your maximum health every ##5## seconds.",
            ["menu_deck2_9_desc"] = "You gain an additional ##40%## more health.\n\nDeck completion bonus: your chance of getting an infamous item from a card drop is increased by ##10%##."
        })
    end

    if not SkillOverhaul.MenuData.SC and not SkillOverhaul.MenuData.DisableTripmineTweaks then
        LocalizationManager:add_localized_strings({
            ["menu_shaped_charge_rokk_desc"] = "BASIC: ##$basic##\nYour tripmines can be converted into shaped charges, used to blow open safes and doors.\n\nACE: ##$pro##\nYou get ##7## more tripmines."        
        })
    end
end)