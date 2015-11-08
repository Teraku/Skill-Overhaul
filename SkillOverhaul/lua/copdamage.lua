Hooks:PostHook(CopDamage, "damage_melee", "SkillOverhaulSnatchPager", function(self, attack_data)

	if managers.groupai:state():whisper_mode() and self._unit:unit_data().has_alarm_pager and attack_data.attacker_unit == managers.player:player_unit() and self._dead then
		--Check if player has pager snatch
		--[[
		local has_upgrade = false
		if player:base().is_local_player then
			has_upgrade = managers.player:has_category_upgrade("player", "melee_kill_always_snatch_pager")
		else
			has_upgrade = player:base():upgrade_value("player", "melee_kill_always_snatch_pager")
		end
		]]
		
		--If player has pager snatch, instantly answer pager
		if managers.player:has_category_upgrade("player", "melee_kill_always_snatch_pager") then	
			--self._unit:interaction():interact(managers.player:player_unit())
			if managers.groupai:state():get_nr_successful_alarm_pager_bluffs() < 4 then
				self._unit:unit_data().is_snatched = true
			end
		end
	end
end)