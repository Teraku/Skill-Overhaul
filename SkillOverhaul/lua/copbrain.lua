Hooks:PostHook(CopBrain, "clbk_alarm_pager", "SkillOverhaulSnatchPagerDo", function(self, a, data)

	if self._unit:unit_data().is_snatched then
		self._unit:interaction():interact(managers.player:player_unit())
		return
	end

end)

--Test
function CopBrain:on_intimidated(amount, aggressor_unit)
	local interaction_voice = self:interaction_voice()
	if interaction_voice then
		self:set_objective(self._logic_data.objective.followup_objective)
		return interaction_voice
	else
		self._current_logic.on_intimidated(self._logic_data, amount, aggressor_unit)
	end
end