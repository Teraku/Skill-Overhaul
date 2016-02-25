if not SkillOverhaul.MenuData.SC then
    Hooks:PostHook(WeaponTweakData, "init", "SkillOverhaulPanicChance", function(self)

        for i, weapon in pairs(self) do
            if weapon and weapon.panic_suppression_chance then
                weapon.panic_suppression_chance = 0.05
            end
        end

    end)
end