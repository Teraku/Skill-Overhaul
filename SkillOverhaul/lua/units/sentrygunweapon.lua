--Code by LazyOzzy from Unknown Cheats.
function SentryGunWeapon:check_lof(target, target_position)
    local from_pos = self._effect_align[self._interleaving_fire]:position()
    local col_ray = World:raycast("ray", from_pos, target_position, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)
    return col_ray and alive(col_ray.unit) and (col_ray.unit:key() == target:key())
end