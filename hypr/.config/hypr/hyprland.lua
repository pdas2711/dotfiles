---- Config location


config_dir = "configs_lua"

require(config_dir .. ".env_vars")  -- Environment variables
require(config_dir .. ".misc")
require(config_dir .. ".startup")  -- GUI applications on start
require(config_dir .. ".monitors")  -- Monitor configuration
require(config_dir .. ".keybinds")  -- Keybindings for various actions
require(config_dir .. ".input")
require(config_dir .. ".decorations")

-- Workspace Assignment

local workspace_assign = require(config_dir .. ".workspace_assign")
hl.on("monitor.added", function() workspace_assign.set_workspaces({ "DP-1", "DP-2", "HDMI-A-1" }) end)

debug = {
	disable_logs = false,
	enable_stdout_logs = true,
	gl_debugging = false
}
