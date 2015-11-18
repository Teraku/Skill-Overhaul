local playerdamage_orig = PlayerDamage.damage_bullet

function PlayerDamage:damage_bullet(attack_data)  
    attack_data.damage = attack_data.damage * managers.player:temporary_upgrade_value("temporary", "overkill_damage_reduction", 1)    
    return playerdamage_orig(self, attack_data)
end