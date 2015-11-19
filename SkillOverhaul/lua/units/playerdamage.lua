local playerdamage_bullet_orig = PlayerDamage.damage_bullet

function PlayerDamage:damage_bullet(attack_data)  
    attack_data.damage = attack_data.damage * managers.player:temporary_upgrade_value("temporary", "overkill_damage_reduction", 1)    
    return playerdamage_bullet_orig(self, attack_data)
end

local playerdamage_cheatdeath_orig = PlayerDamage._chk_cheat_death
function PlayerDamage:_chk_cheat_death()
	if Application:digest_value(self._revives, false) > 1 and not self._check_berserker_done and managers.player:has_category_upgrade("player", "cheat_death_chance") then
		local r = math.rand(1)
		if Application:digest_value(self._revives, false) > 4 or r <= managers.player:upgrade_value("player", "cheat_death_chance", 0) then
			self._auto_revive_timer = 1
		end
	end
end