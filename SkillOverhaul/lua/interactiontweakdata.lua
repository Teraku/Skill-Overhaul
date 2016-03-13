if not SkillOverhaul.MenuData.SC and not SkillOverhaul.MenuData.DisableTripmineTweaks then
    Hooks:PostHook(InteractionTweakData, "init", "SkillOverhaulInteractionTweakData", function(self)
        --"Sharge" is actually a typo from Overkill, not me
        self.shaped_sharge.deployable_consume_double = true
        self.shaped_charge_single.deployable_consume_double = true
    end)
end