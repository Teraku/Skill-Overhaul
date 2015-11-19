--Tamper with this file to cheat and I'll kill you

Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "SkillOverhaulUpgradeValues", function(self)

	self.values.player.melee_kill_always_snatch_pager = {true}
    self.values.player.electric_bullets_while_tased = {true}
    self.values.player.threat_intimidate = {true}
	
    if not SkillOverhaul.MenuData.SC then
        self.values.trip_mine.quantity_1 = {4}
        self.values.trip_mine.quantity_3 = {6}
        self.values.player.long_dis_revive = {0.50, 1}
    end
    
	self.taser_malfunction_max = 5
    
    self.values.lmg.damage_multiplier = {1.2}
    
    self.values.weapon.hip_fire_spread_index_addend = {2}
    self.values.shotgun.hip_fire_spread_index_addend = {2}
    
    self.values.first_aid_kit.downs_restore_chance = {0.2}
    
    self.values.temporary.overkill_damage_reduction = {{0.8, 5}}

end)

Hooks:PostHook(UpgradesTweakData, "_player_definitions", "SkillOverhaulPlayerDefinitions", function(self)

	self.definitions.player_melee_kill_always_snatch_pager = {
		category = "feature",
		name_id = "menu_player_melee_kill_always_snatch_pager",
		upgrade = {
			category = "player",
			upgrade = "melee_kill_always_snatch_pager",
			value = 1
		}
	}
    
	self.definitions.player_electric_bullets_while_tased = {
		category = "feature",
		name_id = "menu_player_eletric_bullets_while_tased",
		upgrade = {
			category = "player",
			upgrade = "electric_bullets_while_tased",
			value = 1
		}
	}
    
    self.definitions.player_threat_intimidate = {
		category = "feature",
		name_id = "menu_player_threat_intimidate",
		upgrade = {
			category = "player",
			upgrade = "threat_intimidate",
			value = 1
		}
	}
    
	self.definitions.lmg_damage_multiplier = {
		category = "feature",
		name_id = "menu_lmg_damage_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
    
    self.definitions.player_overkill_damage_reduction = {
        category = "temporary",
        name_id = "menu_player_overkill_damage_reduction",
        upgrade = {
            category = "temporary",
            upgrade = "overkill_damage_reduction",
            value = 1
        }
    }

end)