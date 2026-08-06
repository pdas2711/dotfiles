---- Workspace Assignment for defined monitors


-- Function to check if a monitor exists. Returns the monior if exists, else, returns nil
local function monitor_exists(monitor_list, monitor)
	for _, hl_obj in ipairs(monitor_list) do
		if hl_obj.name == monitor then
			return monitor
		end
	end
	return nil
end

local function set_workspaces()
	local monitors = { "DP-1", "DP-2" }
	local ws_count = 1

	local found_monitors = hl.get_monitors()
	local ws_per_monitor = 9 // #monitors
	local rem_monitor = 9 % #monitors
	local monitor_default = true

	for _, each_monitor in ipairs(monitors) do
		if monitor_exists(found_monitors, each_monitor) then
			for i = 1, ws_per_monitor do
				hl.print(ws_count)
				if monitor_default then
					hl.workspace_rule({ workspace = tostring(ws_count), monitor = each_monitor, default = true })
					monitor_default = false
				else
					hl.workspace_rule({ workspace = tostring(ws_count), monitor = each_monitor, default = false})
				end
				ws_count = ws_count + 1
			end
			if rem_monitor ~= 0 then
				for i = 1, rem_monitor do
					hl.workspace_rule({ workspace = tostring(ws_count), monitor = each_monitor, default = false})
					ws_count = ws_count + 1
				end
				rem_monitor = 0
			end
		end
		monitor_default = true
	end
end

hl.on("hyprland.start", function() set_workspaces() end)
