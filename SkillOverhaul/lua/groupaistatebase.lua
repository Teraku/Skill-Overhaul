function GroupAIStateBase:has_room_for_police_hostage()
	return 4 > self._police_hostage_headcount + table.size(self._converted_police)
end