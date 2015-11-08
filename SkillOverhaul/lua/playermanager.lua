function PlayerManager:remove_equipment(equipment_id)
	local equipment, index = self:equipment_data_by_name(equipment_id)
	local new_amount = Application:digest_value(equipment.amount, false) - 1
	equipment.amount = Application:digest_value(new_amount, true)
	local equipments_available = self._global.equipment or {}
	if managers.player:has_category_upgrade("player", "carry_sentry_and_trip") and equipments_available.sentry_gun and equipments_available.trip_mine and new_amount == 0 then
		if equipment.equipment == "trip_mine" and not self:has_equipment("sentry_gun") then
			self:add_equipment({equipment = "sentry_gun"})
			self:select_next_item()
			return
		elseif equipment.equipment == "sentry_gun" and not self:has_equipment("trip_mine") then
			self:add_equipment({equipment = "trip_mine"})
			self:select_next_item()
			return
		end
	end
	managers.hud:set_item_amount(index, new_amount)
	self:update_deployable_equipment_amount_to_peers(equipment.equipment, new_amount)
end