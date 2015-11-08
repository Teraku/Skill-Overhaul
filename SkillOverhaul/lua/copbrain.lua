Hooks:PostHook(CopBrain, "clbk_alarm_pager", "SkillOverhaulSnatchPagerDo", function(self, a, data)

	if self._unit:unit_data().is_snatched then
		self._unit:interaction():interact(managers.player:player_unit())
		return
	end

end)