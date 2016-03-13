if not SkillOverhaul.MenuData.SC and not SkillOverhaul.MenuData.DisableTripmineTweaks then
    Hooks:PostHook(EquipmentsTweakData, "init", "SkillOverhaulEquipmentInit", function(self)

        self.trip_mine.quantity = 2	
        self.max_amount.trip_mine = 12

    end)
end