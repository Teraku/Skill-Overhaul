local orig_available = CivilianLogicSurrender.is_available_for_assignment

function CivilianLogicSurrender.is_available_for_assignment(data, objective)
	if objective and objective.forced then
		return true
	end
	--if objective and objective.type == "revive" and data.unit:anim_data().tied then
	--	return true --Allow Stockholm Syndrome to work on tied civilians
	--else
		return not data.unit:anim_data().tied and (objective and objective.type == "revive" or data.t - data.internal_data.state_enter_t > 5 and data.internal_data.submission_meter / data.internal_data.submission_max < 0.95)
	--end
end