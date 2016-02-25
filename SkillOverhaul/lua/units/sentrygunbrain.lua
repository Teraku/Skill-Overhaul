--Thanks to LazyOzzy from UnknownCheats for the code.
--Sentries no longer target shields.
local _select_focus_attention_original = SentryGunBrain._select_focus_attention
local _upd_fire_original = SentryGunBrain._upd_fire

function SentryGunBrain:_select_focus_attention(...)
    local is_criminal = self._unit:movement():team().id == "criminal1"
    local all_targets = self._detected_attention_objects
    if is_criminal then
        local valid_targets = {}
        local obstructed_targets = {}
        all_targets = {}
        for key, data in pairs(self._detected_attention_objects) do
            all_targets[key] = data
            if self._unit:weapon():check_lof(data.unit, data.handler:get_attention_m_pos()) then
                valid_targets[key] = data
            else
                obstructed_targets[key] = data
            end
        end
        if next(valid_targets) ~= nil then
            self._fire_at_will = true
            self._detected_attention_objects = valid_targets
        else
            self._fire_at_will = false
            self._detected_attention_objects = obstructed_targets
        end
    end
    _select_focus_attention_original(self, ...)
    self._detected_attention_objects = all_targets
end

function SentryGunBrain:_upd_fire(...)
    if self._fire_at_will or self._fire_at_will == nil then
        _upd_fire_original(self, ...)
    elseif self._firing then
        self._unit:weapon():stop_autofire()
        self._firing = false
    end
end