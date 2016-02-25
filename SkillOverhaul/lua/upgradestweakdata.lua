--Tamper with this file to cheat and I'll kill you

Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "SkillOverhaulUpgradeValues", function(self)

    -- ;)
	self.values.player.melee_kill_always_snatch_pager = {true}

    --Dominator ace
    self.values.player.threat_intimidate = {true}
	
    --Tripmine and perk deck stuff
    if not SkillOverhaul.MenuData.SC then
        self.values.trip_mine.quantity_1 = {4}
        self.values.trip_mine.quantity_3 = {6}
        self.values.player.long_dis_revive = {0.50, 1}        
        self.values.player.passive_dodge_chance = {
            0.1,
            0.2,
            0.3
        }
        self.values.smg.damage_multiplier = {1.2}
        
        self.values.player.perk_armor_loss_multiplier = {
            1,
            1,
            1,
            1
        }
    end
    
    --Shockproof Ace
	self.taser_malfunction_max = 5
    self.values.player.electric_bullets_while_tased = {true}
    
    --Shotgun CQB Ace
    self.values.shotgun.fire_rate_multiplier = {1.5}
    
    --Hard Boiled Ace
    self.values.lmg.damage_multiplier = {1.2}
    
    --Hard Boiled Basic
    self.values.weapon.hip_fire_spread_index_addend = {2}
    self.values.shotgun.hip_fire_spread_index_addend = {2}
    
    --Brother's Keeper
    self.values.first_aid_kit.downs_restore_chance = {0.2}
    
    --Overkill
    self.values.temporary.overkill_damage_reduction = {{0.8, 5}}
    
    --Moving Target
	self.values.player.detection_risk_add_movement_speed = {
		{
			0.02,
			3,
			"below",
			35,
			0.2
		},
		{
			0.02,
			1,
			"below",
			35,
			0.3
		}
	}
    
    --Trigger Happy    
    self.values.akimbo.stacking_hit_damage_multiplier = {0.1}
    self.values.akimbo.stacking_hit_expire_t = {2, 8}

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
    
    self.definitions.shotgun_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_rof_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "fire_rate_multiplier",
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
    
    if not SkillOverhaul.MenuData.SC then
    
        self.definitions.player_detection_risk_add_movement_speed_1 = {
            category = "feature",
            name_id = "menu_player_detection_risk_add_movement_speed",
            upgrade = {
                category = "player",
                upgrade = "detection_risk_add_movement_speed",
                value = 1
            }
        }
        
        self.definitions.player_detection_risk_add_movement_speed_2 = {
            category = "feature",
            name_id = "menu_player_detection_risk_add_movement_speed",
            upgrade = {
                category = "player",
                upgrade = "detection_risk_add_movement_speed",
                value = 2
            }
        }
        
        self.definitions.smg_damage_multiplier_1 = {
            category = "feature",
            name_id = "menu_smg_damage_multiplier_1",
            upgrade = {
                category = "smg",
                upgrade = "damage_multiplier",
                value = 1
            }
        }
    
    end
    
	self.definitions.akimbo_stacking_hit_damage_multiplier = {
		category = "feature",
		name_id = "menu_pistol_stacking_hit_damage_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "stacking_hit_damage_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_stacking_hit_expire_t_1 = {
		category = "feature",
		name_id = "menu_akimbo_stacking_hit_expire_t",
		upgrade = {
			category = "akimbo",
			upgrade = "stacking_hit_expire_t",
			value = 1
		}
	}
	self.definitions.akimbo_stacking_hit_expire_t_2 = {
		category = "feature",
		name_id = "menu_akimbo_stacking_hit_expire_t",
		upgrade = {
			category = "akimbo",
			upgrade = "stacking_hit_expire_t",
			value = 2
		}
	}

end)