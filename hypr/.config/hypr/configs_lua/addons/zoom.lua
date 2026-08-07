---- Zoom Control


local module = {}

function module.change_zoom(action)
	local current_zoom = hl.get_config("cursor.zoom_factor")
	local new_zoom = nil
	if action == "increment" then
		new_zoom = current_zoom + 0.2
	elseif action == "decrement" then
		new_zoom = current_zoom - 0.2
		if new_zoom < 1.0 then
			new_zoom = 1.0
		end
	elseif action == "default" then
		new_zoom = 1.0
	end
	hl.config({ cursor = { zoom_factor = new_zoom } })
end

return module
