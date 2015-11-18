Hooks:PostHook(CopDamage, "damage_melee", "SkillOverhaulSnatchPager", function(self, attack_data)
	if managers.groupai:state():whisper_mode() and self._unit:unit_data().has_alarm_pager and attack_data.attacker_unit == managers.player:player_unit() and self._dead then
		--If player has pager snatch, mark guard for snatching
		if managers.player:has_category_upgrade("player", "melee_kill_always_snatch_pager") then	
			if managers.groupai:state():get_nr_successful_alarm_pager_bluffs() < 4 then
				self._unit:unit_data().is_snatched = true
			end
		end
	end
end)

--Apply Overkill Ace damage reduction
Hooks:PostHook(CopDamage, "damage_bullet", "SkillOverhaulApplyOverkill", function(self, attack_data)
    if attack_data.attacker_unit == managers.player:player_unit() and attack_data.result and attack_data.result.type == "death" and not self.is_civilian(self._unit:base()._tweak_table) and managers.player:has_category_upgrade("temporary", "overkill_damage_reduction") and not attack_data.weapon_unit:base().thrower_unit then
        managers.player:activate_temporary_upgrade("temporary", "overkill_damage_reduction")
    end
end)

function CopDamage:damage_tase(attack_data)
	if self._dead or self._invulnerable then
		return
	end
	if PlayerDamage.is_friendly_fire(self, attack_data.attacker_unit) then
		return "friendly_fire"
	end
	if self._tase_effect then
		World:effect_manager():fade_kill(self._tase_effect)
	end
	self._tase_effect = World:effect_manager():spawn(self._tase_effect_table)
    
	local result
	local body_index = self._unit:get_body_index(attack_data.col_ray.body:name())
	local head = self._head_body_name and attack_data.col_ray.body and attack_data.col_ray.body:name() == self._ids_head_body_name
	local damage = attack_data.damage
	if self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET then
		damage = math.min(damage, self._unit:base():char_tweak().DAMAGE_CLAMP_BULLET)
	end
	damage = damage * (self._marked_dmg_mul or 1)
	if self._unit:movement():cool() then
		damage = self._HEALTH_INIT
	end
	local headshot_multiplier = 1
	if attack_data.attacker_unit == managers.player:player_unit() then
		local critical_hit, crit_damage = self:roll_critical_hit(damage)
		if critical_hit then
			managers.hud:on_crit_confirmed()
			damage = crit_damage
		else
			managers.hud:on_hit_confirmed()
		end
		headshot_multiplier = managers.player:upgrade_value("weapon", "passive_headshot_damage_multiplier", 1)
		if tweak_data.character[self._unit:base()._tweak_table].priority_shout then
			damage = damage * managers.player:upgrade_value("weapon", "special_damage_taken_multiplier", 1)
		end
		if head then
			managers.player:on_headshot_dealt()
		end
	end
	if self._damage_reduction_multiplier then
		damage = damage * self._damage_reduction_multiplier
	elseif head then
		if self._char_tweak.headshot_dmg_mul then
			damage = damage * self._char_tweak.headshot_dmg_mul * headshot_multiplier
		else
			damage = self._health * 10
		end
	end 
 
	damage = self:_apply_damage_reduction(damage)
	damage = math.clamp(damage, 0, self._HEALTH_INIT)
	local damage_percent = math.ceil(damage / self._HEALTH_INIT_PRECENT)
	damage = damage_percent * self._HEALTH_INIT_PRECENT
	damage, damage_percent = self:_apply_min_health_limit(damage, damage_percent)
	if damage >= self._health then
		attack_data.damage = self._health
		result = {type = "death", variant = "bullet"}
		self:die(attack_data)
		self:chk_killshot(attack_data.attacker_unit, "tase")
	else
		attack_data.damage = damage
		local type = "taser_tased"
		result = {
			type = type,
			variant = attack_data.variant
		}
		self:_apply_damage_to_health(damage)
	end
	attack_data.result = result
	attack_data.pos = attack_data.col_ray.position
	local head
	if self._head_body_name then
		head = attack_data.col_ray.body and self._head_body_key and attack_data.col_ray.body:key() == self._head_body_key
		local body = self._unit:body(self._head_body_name)
		self:_spawn_head_gadget({
			position = body:position(),
			rotation = body:rotation(),
			dir = -attack_data.col_ray.ray
		})
	end
	local attacker = attack_data.attacker_unit
	if not attacker or attacker:id() == -1 then
		attacker = self._unit
	end
	if result.type == "death" then
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			owner = attack_data.owner,
			weapon_unit = attack_data.weapon_unit,
			variant = attack_data.variant,
			head_shot = head
		}
		managers.statistics:killed_by_anyone(data)
		local attacker_unit = attack_data.attacker_unit
		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			data.weapon_unit = attack_data.attacker_unit
		end
		if attacker_unit == managers.player:player_unit() then
			if alive(attacker_unit) then
				self:_comment_death(attacker_unit, self._unit:base()._tweak_table)
			end
			self:_show_death_hint(self._unit:base()._tweak_table)
			managers.statistics:killed(data)
			if CopDamage.is_civilian(self._unit:base()._tweak_table) then
				managers.money:civilian_killed()
			end
			self:_check_damage_achievements(attack_data, false)
		end
	end
	if alive(attacker) and attacker:base() and attacker:base().add_damage_result then
		attacker:base():add_damage_result(self._unit, result.type == "death", damage_percent)
	end
	local variant = result.variant == "heavy" and 1 or 0
	self:_send_tase_attack_result(attack_data, damage_percent, variant)
	self:_on_damage_received(attack_data)
	return result
end

function CopDamage:sync_damage_tase(attacker_unit, damage_percent, variant, death)
	if self._dead then
		return
	end
	if self._tase_effect then
		World:effect_manager():fade_kill(self._tase_effect)
	end
	self._tase_effect = World:effect_manager():spawn(self._tase_effect_table)
	local damage = damage_percent * self._HEALTH_INIT_PRECENT
	local attack_data = {}
	local result
	if death then
		result = {type = "death", variant = "bullet"}
		self:die("bullet")
		self:chk_killshot(attacker_unit, "tase")
		local data = {
			name = self._unit:base()._tweak_table,
			stats_name = self._unit:base()._stats_name,
			head_shot = false,
			variant = "melee"
		}
		managers.statistics:killed_by_anyone(data)
	else
		result = {
			type = "taser_tased",
			variant = 5
		}
		self:_apply_damage_to_health(damage)
	end
	attack_data.variant = result.variant
	attack_data.attacker_unit = attacker_unit
	attack_data.result = result
	attack_data.damage = damage
	local attack_dir
	if attacker_unit then
		attack_dir = self._unit:position() - attacker_unit:position()
		mvector3.normalize(attack_dir)
	else
		attack_dir = -self._unit:rotation():y()
	end
	attack_data.attack_dir = attack_dir
	attack_data.pos = self._unit:position()
	mvector3.set_z(attack_data.pos, attack_data.pos.z + math.random() * 180)
	self:_send_sync_tase_attack_result(attack_data)
	self:_on_damage_received(attack_data)
end