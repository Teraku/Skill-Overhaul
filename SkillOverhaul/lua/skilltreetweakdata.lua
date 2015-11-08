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
				
			},
			cost = self.costs.hightierpro
		}
	}

 end)

--[[
TODO: Insert this function into lib/units/beings/player/states/playerbleedout to make civ drop 5 ammo pickups instead of one

function PlayerBleedOut:on_civ_revive_completed(revive_SO_data, sympathy_civ)
	if sympathy_civ ~= revive_SO_data.sympathy_civ then
		debug_pause_unit(sympathy_civ, "[PlayerBleedOut:on_civ_revive_completed] idiot thinks he is reviving", sympathy_civ)
		return
	end
	revive_SO_data.sympathy_civ = nil
	revive_SO_data.unit:character_damage():revive(sympathy_civ)
	if managers.player:has_category_upgrade("player", "civilian_gives_ammo") then
		for local i = 0, 5, 1 do
			managers.game_play_central:spawn_pickup({
				name = "ammo",
				position = sympathy_civ:position(),
				rotation = Rotation()
			})
		end
	end
end
]]