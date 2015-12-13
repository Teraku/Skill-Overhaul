Hooks:PostHook(PlayerBleedOut, "on_civ_revive_completed", "SkillOverhaulCivGiveAmmo", function(self, sympathy_civ)
    --Give more ammo on revive
	if managers.player:has_category_upgrade("player", "civilian_gives_ammo") then
        for i=1, 4, 1 do
            managers.game_play_central:spawn_pickup({
                name = "ammo",
                position = sympathy_civ:position(),
                rotation = Rotation()
            })
        end
	end
end)

--Converts can now revive players
--Fun fact: This took two weeks, most of which was hunting down a single typo.
function PlayerBleedOut:call_civilian(line, t, no_gesture, skip_alert, revive_SO_data)
    
	if not managers.player:has_category_upgrade("player", "civilian_reviver") or revive_SO_data and revive_SO_data.sympathy_civ then
		return
	end
    
	local detect_only = false
	local voice_type, plural, prime_target = self:_get_unit_intimidation_action(true, true, false, false, false, 0, true, detect_only)
	if prime_target then
        
        if not prime_target.unit:brain()._logic_data.is_converted and not CopDamage.is_civilian(prime_target.unit:base()._tweak_table) then
            return
        end
        
		if detect_only then
			if not prime_target.unit:sound():speaking(t) then
				prime_target.unit:sound():say("_a01x_any", true)
			end
		else
			if not prime_target.unit:sound():speaking(t) then
				prime_target.unit:sound():say("stockholm_syndrome", true)
			end
			local queue_name = line .. "e_plu"
			self:_do_action_intimidate(t, not no_gesture and "cmd_come" or nil, queue_name, skip_alert)
			if Network:is_server() then
				if prime_target.unit:brain():is_available_for_assignment({type = "revive"}) then
					local followup_objective = {
						type = "free",
						interrupt_dis = -1,
						interrupt_health = 1,
						action = {
							type = "idle",
							body_part = 1,
							sync = true
						}
					}
					local objective = {
						type = "act",
						haste = "run",
						destroy_clbk_key = false,
						nav_seg = self._unit:movement():nav_tracker():nav_segment(),
						pos = self._unit:movement():nav_tracker():field_position(),
						fail_clbk = callback(PlayerBleedOut, PlayerBleedOut, "on_civ_revive_failed", revive_SO_data),
						complete_clbk = callback(PlayerBleedOut, PlayerBleedOut, "on_civ_revive_completed", revive_SO_data),
						action_start_clbk = callback(PlayerBleedOut, PlayerBleedOut, "on_civ_revive_started", revive_SO_data),
						action = {
							type = "act",
							variant = "revive",
							body_part = 1,
							blocks = {
								action = -1,
								walk = -1,
								light_hurt = -1,
								hurt = -1,
								heavy_hurt = -1,
								aim = -1
							},
							align_sync = true
						},
						action_duration = tweak_data.interaction.revive.timer,
						followup_objective = followup_objective
					}
					revive_SO_data.sympathy_civ = prime_target.unit
					prime_target.unit:brain():set_objective(objective)
				end
			end
		end
	end
end