--Tamper with this file to cheat and I'll kill you

Hooks:PostHook(SkillTreeTweakData, "init", "SkillOverhaulSkillTrees", function(self) 

	--Daredevil replaced with Daredevil + Moving Target
	if not SkillOverhaul.SC then
		self.skills.freedom_call = {
			["name_id"] = "menu_moving_target",
			["desc_id"] = "menu_moving_target_rokk_desc",
			["icon_xy"] = {2, 4},
			[1] = {
				upgrades = {
					"player_climb_speed_multiplier_1",
					"player_on_zipline_dodge_chance"
				},
				cost = self.costs.default
			},
			[2] = {
				upgrades = {
					"player_can_strafe_run",
					"player_can_free_run"
				},
				cost = self.costs.pro
			}
		}
	end

	--Stockholm Syndrome prevents bullets killing civilians on first shot.
	self.skills.stockholm_syndrome = {
		["name_id"] = "menu_stockholm_syndrome",
		["desc_id"] = "menu_stockholm_syndrome_rokk_desc",
		["icon_xy"] = {3, 8},
		[1] = {
			upgrades = {
				"player_civilian_reviver",
				"player_civ_harmless_bullets"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_civilian_gives_ammo"
			},
			cost = self.costs.hightierpro
		}
	}
    
	self.skills.shaped_charge = {
		["name_id"] = "menu_shaped_charge",
		["desc_id"] = "menu_shaped_charge_rokk_desc",
		["icon_xy"] = {0, 7},
		[1] = {
			upgrades = {
				"player_trip_mine_shaped_charge"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
                "trip_mine_quantity_increase_3"				
			},
			cost = self.costs.hightierpro
		}
	}
	
	--Unfinished
	self.skills.swift_feet_rokk = {
		["name_id"] = "menu_swift_feet_rokk",
		["desc_id"] = "menu_swift_feet_desc",
		["icon_xy"] = {2, 4},
		[1] = {
			upgrades = {
				"player_melee_kill_always_snatch_pager"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_detection_always_like_crouched"
			},
			cost = self.costs.hightierpro
		}
	}

 end)