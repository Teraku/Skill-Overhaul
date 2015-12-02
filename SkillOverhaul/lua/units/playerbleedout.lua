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