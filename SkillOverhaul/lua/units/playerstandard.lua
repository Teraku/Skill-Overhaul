--Steel sighting at enemies may dominate them
--Temporarily disabled due to lack of testing
Hooks:PostHook(PlayerStandard, "_update_fwd_ray", "SkillOverhaulUpdateRay", function(self)
     
    if self._state_data.in_steelsight and self._fwd_ray and self._fwd_ray.unit and managers.player:has_category_upgrade("player", "threat_intimidate") then
        if not self._fwd_ray.unit:unit_data().attempted_auto_intimidate and self._fwd_ray.unit:brain() and self._fwd_ray.unit:brain()._logics and self._fwd_ray.unit:brain()._logics.intimidated then
            		
            local suppression_ratio = math.floor(self._equipped_unit:base()._suppression * 20)
            if not managers.groupai:state():is_enemy_special(self._fwd_ray.unit) and suppression_ratio > math.random(5, 5000) then
                self._fwd_ray.unit:brain():set_logic("intimidated")
            else
                self._fwd_ray.unit:brain():on_intimidated(tweak_data.player.long_dis_interaction.intimidate_strength, self._unit)
            end
            --Mark unit to prevent multiple attempts at auto-intimidation
            self._fwd_ray.unit:unit_data().attempted_auto_intimidate = true
            
        end
    end
    
end)
