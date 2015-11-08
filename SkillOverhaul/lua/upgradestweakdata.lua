--Tamper with this file to cheat and I'll kill you

Hooks:PostHook(UpgradesTweakData, "_init_pd2_values", "SkillOverhaulUpgradeValues", function(self)

	self.values.player.melee_kill_always_snatch_pager = {true}
	
	self.values.trip_mine.quantity_1 = {3}
	self.values.trip_mine.quantity_3 = {7}

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

end)