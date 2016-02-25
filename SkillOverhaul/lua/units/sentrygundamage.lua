--Fix sentry guns taking too much damage.
--Code made by YaPh1l.

local _SentryGunDamage_init = SentryGunDamage.init
function SentryGunDamage:init(unit)
    _SentryGunDamage_init(self, unit)
    
    if self._unit:base():get_name_id() == "sentry_gun" then
        self._HEALTH_GRANULARITY = CopDamage._HEALTH_GRANULARITY
    end
end


local _SentryGunDamage__apply_damage = SentryGunDamage._apply_damage
function SentryGunDamage:_apply_damage(damage, dmg_shield, dmg_body, is_local)
    _SentryGunDamage__apply_damage(self, damage, dmg_shield, dmg_body, is_local)
    
    if self._unit:base():get_name_id() == "sentry_gun" then
        self._sync_dmg_leftover = 0
    end
end