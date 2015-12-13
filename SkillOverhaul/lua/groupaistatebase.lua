--Increase domination limit to 4
function GroupAIStateBase:has_room_for_police_hostage()
	return 4 > self._police_hostage_headcount + table.size(self._converted_police)
end

--Gameover now happens after ~30 seconds instead of 10 seconds, allowing Stockholm Syndrome and Pistol Messiah to function correctly
function GroupAIStateBase:check_gameover_conditions()
	if not Network:is_server() or managers.platform:presence() ~= "Playing" or setup:has_queued_exec() then
		return false
	end
	if game_state_machine:current_state().game_ended and game_state_machine:current_state():game_ended() then
		return false
	end
	if Global.load_start_menu or Application:editor() then
		return false
	end
	local plrs_alive = false
	local plrs_disabled = true
	for u_key, u_data in pairs(self._player_criminals) do
		plrs_alive = true
		if u_data.status ~= "dead" and u_data.status ~= "disabled" then
			plrs_disabled = false
		else
		end
	end
	local ai_alive = false
	local ai_disabled = true
	for u_key, u_data in pairs(self._ai_criminals) do
		ai_alive = true
		if u_data.status ~= "dead" and u_data.status ~= "disabled" then
			ai_disabled = false
		else
		end
	end
	local gameover = false
	if not plrs_alive and not self:is_ai_trade_possible() then
		gameover = true
	elseif plrs_disabled and not ai_alive then
		gameover = true
	elseif plrs_disabled and ai_disabled then
		gameover = true
	end
	if gameover then
		if not self._gameover_clbk then
			self._gameover_clbk = callback(self, self, "_gameover_clbk_func")
			managers.enemy:add_delayed_clbk("_gameover_clbk", self._gameover_clbk, Application:time() + 29)
		end
	elseif self._gameover_clbk then
		managers.enemy:remove_delayed_clbk("_gameover_clbk")
		self._gameover_clbk = nil
	end
	return gameover
end