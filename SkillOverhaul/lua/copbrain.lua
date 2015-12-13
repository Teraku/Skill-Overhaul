Hooks:PostHook(CopBrain, "clbk_alarm_pager", "SkillOverhaulSnatchPagerDo", function(self, a, data)

	if self._unit:unit_data().is_snatched then
		self._unit:interaction():interact(managers.player:player_unit())
		return
	end

end)

Hooks:PostHook(CopBrain, "convert_to_criminal", "SkillOverhaulCopBrainDoConvert", function(self)
    
    self._unit:unit_data().is_convert = true
    
    --Ugly hack to be able to call converts
    --Kill me now
    if not SkillOverhaul._converts then
        SkillOverhaul._converts = {}
    end   
    table.insert(SkillOverhaul._converts, self._unit)
    
end)