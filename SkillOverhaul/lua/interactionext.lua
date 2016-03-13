if not SkillOverhaul.MenuData.SC and not SkillOverhaul.MenuData.DisableTripmineTweaks then
    Hooks:PostHook(MissionDoorDeviceInteractionExt, "result_place_mission_door_device", "SkillOverhaulInteractDoor", function(self, placed)
        --Consume two shaped charges
        if placed and self._tweak_data.deployable_consume_double then
            managers.player:remove_equipment(self._tweak_data.required_deployable)
        end
    end)

    local can_interact_orig = BaseInteractionExt.can_interact
    function BaseInteractionExt:can_interact(player)
        if self._tweak_data.deployable_consume_double and managers.player:get_equipment_amount(self._tweak_data.required_deployable) < 2 then
            return false
        else
            return can_interact_orig(self, player)
        end
    end
end