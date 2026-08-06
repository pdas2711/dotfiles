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

-- Generic check for finding a given monitor in a list of monitors
local function check_pinned_monitor(pinned_monitor_list, monitor)
	for _, each_monitor in ipairs(pinned_monitor_list) do
		if each_monitor == monitor then
			return true
		end
	end
	return false
end

local function set_workspaces()
	local pinned_monitors = { "DP-1", "DP-2" }

	local ws_count = 1
	local found_monitors = hl.get_monitors()
	local ws_per_monitor = 9 // #found_monitors
	local rem_monitor = 9 % #found_monitors

	local monitor_default = true

	for _, each_monitor in ipairs(pinned_monitors) do
		if monitor_exists(found_monitors, each_monitor) then
			for i = 1, ws_per_monitor do
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

	for _, each_monitor in ipairs(found_monitors) do
		if not check_pinned_monitor(each_monitor.name) then
			for i = 1, ws_per_monitor do
				if monitor_default then
					hl.workspace_rule({ workspace = tostring(ws_count), monitor = each_monitor.name, default = true })
					monitor_default = false
				else
					hl.workspace_rule({ workspace = tostring(ws_count), monitor = each_monitor.name, default = false})
				end
				ws_count = ws_count + 1
			end
			monitor_default = true
		end
	end
end

hl.on("monitor.added", function() set_workspaces() end)
