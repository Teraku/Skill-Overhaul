function PlayerManager:activate_temporary_upgrade(category, upgrade)
	local upgrade_value = self:upgrade_value(category, upgrade)
	if upgrade_value == 0 then
		return
	end
	local time = upgrade_value[2]
	self._temporary_upgrades[category] = self._temporary_upgrades[category] or {}
	self._temporary_upgrades[category][upgrade] = {}
	self._temporary_upgrades[category][upgrade].expire_time = Application:time() + time
end