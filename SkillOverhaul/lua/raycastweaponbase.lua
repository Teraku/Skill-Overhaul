local give_impact_damage_orig = InstantBulletBase.give_impact_damage

function InstantBulletBase:give_impact_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing)
    if managers.player:has_category_upgrade("player", "electric_bullets_while_tased") and user_unit == managers.player:player_unit() and managers.player:current_state() == "tased" then
        local action_data = {}
        action_data.variant = "bullet"
        action_data.electric = true
        action_data.damage = damage
        action_data.weapon_unit = weapon_unit
        action_data.attacker_unit = user_unit
        action_data.col_ray = col_ray
        action_data.armor_piercing = armor_piercing
        return col_ray.unit:character_damage():damage_tase(action_data)
    else
        return give_impact_damage_orig(self, col_ray, weapon_unit, user_unit, damage, armor_piercing)
    end
end