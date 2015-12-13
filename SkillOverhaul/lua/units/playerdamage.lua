--Apply Overkill Ace damage reduction.
--I will be reworking this ugly hack later on.
local playerdamage_bullet_orig = PlayerDamage.damage_bullet
function PlayerDamage:damage_bullet(attack_data)  
    attack_data.damage = attack_data.damage * managers.player:temporary_upgrade_value("temporary", "overkill_damage_reduction", 1)    
    return playerdamage_bullet_orig(self, attack_data)
end

--Always revive on first down with Nine Lives Ace
local playerdamage_cheatdeath_orig = PlayerDamage._chk_cheat_death
function PlayerDamage:_chk_cheat_death()
	if Application:digest_value(self._revives, false) > 1 and not self._check_berserker_done and managers.player:has_category_upgrade("player", "cheat_death_chance") then
		local r = math.rand(1)
		if Application:digest_value(self._revives, false) > 4 or r <= managers.player:upgrade_value("player", "cheat_death_chance", 0) then
			self._auto_revive_timer = 1
		end
	end
end

--Only consume Ex-President health if you lost health.
function PlayerDamage:set_armor(armor)   
	if self._armor and self:get_real_armor() == 0 and armor ~= 0 and self:health_ratio() < 1 then
		self:consume_armor_stored_health()
	end
	self._armor = Application:digest_value(math.clamp(armor, 0, self:_max_armor()), true)
end