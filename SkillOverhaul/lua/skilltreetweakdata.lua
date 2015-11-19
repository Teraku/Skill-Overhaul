--Tamper with this file to cheat and I'll kill you

Hooks:PostHook(SkillTreeTweakData, "init", "SkillOverhaulSkillTrees", function(self) 

    --MASTERMIND
    ----------------------------------------------------------------------
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
    
	self.skills.dominator = {
		["name_id"] = "menu_dominator",
		["desc_id"] = "menu_dominator_rokk_desc",
		["icon_xy"] = {2, 8},
		[1] = {
			upgrades = {
				"player_intimidate_enemies"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {
				"player_intimidate_range_mul",
				"player_intimidate_aura",
                "player_threat_intimidate"
			},
			cost = self.costs.pro
		}
	}    
    ----------------------------------------------------------------------

    --ENFORCER
    ----------------------------------------------------------------------
    if not SkillOverhaul.MenuData.SC then
        self.skills.from_the_hip = {
            ["name_id"] = "menu_from_the_hip",
            ["desc_id"] = "menu_from_the_hip_rokk_desc",
            ["icon_xy"] = {4, 1},
            [1] = {
                upgrades = {
                    "shotgun_hip_fire_spread_index_addend",
                    "weapon_hip_fire_spread_index_addend"
                },
                cost = self.costs.hightier
            },
            [2] = {
                upgrades = {
                    "lmg_reload_speed_multiplier",
                    "lmg_damage_multiplier"
                },
                cost = self.costs.hightierpro
            }
        }
    end
    
	self.skills.overkill = {
		["name_id"] = "menu_overkill",
		["desc_id"] = "menu_overkill_rokk_desc",
		["icon_xy"] = {3, 2},
		[1] = {
			upgrades = {
				"player_overkill_damage_multiplier"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_overkill_all_weapons",
                "player_overkill_damage_reduction"
			},
			cost = self.costs.hightierpro
		}
	}
    
    --TECHNICIAN
    ----------------------------------------------------------------------
    if not SkillOverhaul.MenuData.TechRework and not SkillOverhaul.MenuData.SC then
        --Switch shaped charges basic and ace
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
        
        --Positions of skills
        self.trees[3].tiers[4] = {
            "sentry_targeting_package",
            "mag_plus",
            "silent_drilling"
        }
        self.trees[3].tiers[6] = {
            "sentry_gun_2x",
            "blast_radius",
            "iron_man"
        }
    end
    
    --Your bullets are electrified while tased
	self.skills.insulation = {
		["name_id"] = "menu_insulation",
		["desc_id"] = "menu_insulation_rokk_desc",
		["icon_xy"] = {3, 5},
		[1] = {
			upgrades = {
				"player_taser_malfunction"
			},
			cost = self.costs.hightier
		},
		[2] = {
			upgrades = {
				"player_taser_self_shock",
                "player_electric_bullets_while_tased"
			},
			cost = self.costs.hightierpro
		}
	}
    
    --Compatibility with Tech Rework
    if SkillOverhaul.MenuData.TechRework then
        self.skills.t_right5 = {
            ["name_id"] = "t_right5",
            ["desc_id"] = "t_right5_desc",
            ["icon_xy"] = {3, 5},
            [1] = {
                upgrades = {
                    "player_taser_malfunction"
                },
                cost = self.costs.hightier
            },
            [2] = {
                upgrades = {
                    "player_taser_self_shock",
                    "player_electric_bullets_while_tased"
                },
                cost = self.costs.hightierpro
            }
        }
    end
    
    ----------------------------------------------------------------------    
    
    --FUGITIVE
    ----------------------------------------------------------------------
	--Daredevil replaced with Daredevil + Moving Target
	if not SkillOverhaul.MenuData.SC then
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
    
    --Brother's Keeper Ace gives a 10% chance to restore downs with first aid   
	self.skills.cell_mates = {
		["name_id"] = "menu_cell_mates",
		["desc_id"] = "menu_cell_mates_rokk_desc",
		["icon_xy"] = {4, 11},
		[1] = {
			upgrades = {
				"player_gangster_damage_dampener_1",
                "player_gangster_damage_dampener_2"
			},
			cost = self.costs.default
		},
		[2] = {
			upgrades = {            
                "first_aid_kit_downs_restore_chance"
			},
			cost = self.costs.pro
		}
	}
    ----------------------------------------------------------------------
	
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