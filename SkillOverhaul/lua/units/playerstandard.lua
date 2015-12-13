--Steel sighting at enemies may dominate them
Hooks:PostHook(PlayerStandard, "_update_fwd_ray", "SkillOverhaulUpdateRay", function(self)
     
    if self._state_data.in_steelsight and self._fwd_ray and self._fwd_ray.unit and managers.player:has_category_upgrade("player", "threat_intimidate") then
        if not self._fwd_ray.unit:unit_data().attempted_auto_intimidate and self._fwd_ray.unit:brain() and self._fwd_ray.unit:brain()._logics and self._fwd_ray.unit:brain()._logics.intimidated then
            		
            local suppression_ratio = math.floor(self._equipped_unit:base()._suppression * 20)
            if not managers.groupai:state():is_enemy_special(self._fwd_ray.unit) and suppression_ratio > math.random(5, 5000) then
                self._fwd_ray.unit:brain():set_logic("intimidated")
            else
                self._fwd_ray.unit:brain():on_intimidated(tweak_data.player.long_dis_interaction.intimidate_strength, self._unit)
            end
            --Mark unit to prevent multiple attempts at auto-intimidation
            self._fwd_ray.unit:unit_data().attempted_auto_intimidate = true
            
        end
    end
    
end)

--Allow converts to revive you
function PlayerStandard:_get_unit_intimidation_action(intimidate_enemies, intimidate_civilians, intimidate_teammates, only_special_enemies, intimidate_escorts, intimidation_amount, primary_only, detect_only)
	local char_table = {}
	local unit_type_enemy = 0
	local unit_type_civilian = 1
	local unit_type_teammate = 2
	local unit_type_camera = 3
	local unit_type_turret = 4
	local cam_fwd = self._ext_camera:forward()
	local my_head_pos = self._ext_movement:m_head_pos()
	local range_mul = managers.player:upgrade_value("player", "intimidate_range_mul", 1) * managers.player:upgrade_value("player", "passive_intimidate_range_mul", 1)
	local intimidate_range_civ = tweak_data.player.long_dis_interaction.intimidate_range_civilians * range_mul
	local intimidate_range_ene = tweak_data.player.long_dis_interaction.intimidate_range_enemies * range_mul
	local highlight_range = tweak_data.player.long_dis_interaction.highlight_range * range_mul
	if intimidate_enemies then
		local enemies = managers.enemy:all_enemies()
		for u_key, u_data in pairs(enemies) do
			if self._unit:movement():team().foes[u_data.unit:movement():team().id] and not u_data.unit:anim_data().hands_tied and not u_data.unit:anim_data().long_dis_interact_disabled and (u_data.char_tweak.priority_shout or not only_special_enemies) then
				if managers.groupai:state():whisper_mode() then
					if u_data.char_tweak.silent_priority_shout and u_data.unit:movement():cool() then
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, highlight_range, false, false, 0.01, my_head_pos, cam_fwd)
					elseif not u_data.unit:movement():cool() then
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, intimidate_range_ene, false, false, 100, my_head_pos, cam_fwd)
					end
				elseif u_data.char_tweak.priority_shout then
					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, highlight_range, false, false, 0.01, my_head_pos, cam_fwd)
				else
					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_enemy, intimidate_range_ene, false, false, 100, my_head_pos, cam_fwd)
				end
			end
		end
	end
	if intimidate_civilians then
		local civilians = managers.enemy:all_civilians()
		for u_key, u_data in pairs(civilians) do
			if u_data.unit:in_slot(21) and not u_data.unit:movement():cool() and not u_data.unit:anim_data().long_dis_interact_disabled then
				local is_escort = u_data.char_tweak.is_escort
				if not is_escort or intimidate_escorts then
					local dist = is_escort and 300 or intimidate_range_civ
					local prio = is_escort and 100000 or 0.001
					self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_civilian, dist, false, false, prio, my_head_pos, cam_fwd)
				end
			end
		end
        
        if SkillOverhaul._converts then
            for u_key, u_data in pairs(SkillOverhaul._converts) do
                if not u_data:movement():cool() and not u_data:anim_data().long_dis_interact_disabled then
                    self:_add_unit_to_char_table(char_table, u_data, unit_type_enemy, highlight_range, false, false, 100, my_head_pos, cam_fwd)
                end
            end
        end
        
	end
	if intimidate_teammates and not managers.groupai:state():whisper_mode() then
		local criminals = managers.groupai:state():all_char_criminals()
		for u_key, u_data in pairs(criminals) do
			local added
			if u_key ~= self._unit:key() then
				local rally_skill_data = self._ext_movement:rally_skill_data()
				if rally_skill_data and rally_skill_data.long_dis_revive and rally_skill_data.range_sq > mvector3.distance_sq(self._pos, u_data.m_pos) then
					local needs_revive
					if u_data.unit:base().is_husk_player then
						needs_revive = u_data.unit:interaction():active() and u_data.unit:movement():need_revive() and u_data.unit:movement():current_state_name() ~= "arrested"
					else
						needs_revive = u_data.unit:character_damage():need_revive()
					end
					if needs_revive then
						added = true
						self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, 100000, true, true, 5000, my_head_pos, cam_fwd)
					end
				end
			end
			if not added and not u_data.is_deployable and not u_data.unit:movement():downed() and not u_data.unit:base().is_local_player and not u_data.unit:anim_data().long_dis_interact_disabled then
				self:_add_unit_to_char_table(char_table, u_data.unit, unit_type_teammate, 100000, true, true, 0.01, my_head_pos, cam_fwd)
			end
		end
	end
	if intimidate_enemies then
		if managers.groupai:state():whisper_mode() then
			for _, unit in ipairs(SecurityCamera.cameras) do
				if alive(unit) and unit:enabled() and not unit:base():destroyed() then
					local dist = 2000
					local prio = 0.001
					self:_add_unit_to_char_table(char_table, unit, unit_type_camera, dist, false, false, prio, my_head_pos, cam_fwd, {unit})
				end
			end
		end
		local turret_units = managers.groupai:state():turrets()
		if turret_units then
			for _, unit in pairs(turret_units) do
				if alive(unit) and unit:movement():team().foes[self._ext_movement:team().id] then
					self:_add_unit_to_char_table(char_table, unit, unit_type_turret, 2000, false, false, 0.01, my_head_pos, cam_fwd, {unit})
				end
			end
		end
	end
	local prime_target = self:_get_interaction_target(char_table, my_head_pos, cam_fwd)
	return self:_get_intimidation_action(prime_target, char_table, intimidation_amount, primary_only, detect_only)
end