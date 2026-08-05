-- Config location
local config_dir = "configs_lua"

require(config_dir + ".env_vars")  -- Environment variables
require(config_dir + ".startup")  -- GUI applications on start
require(config_dir + ".monitors")  -- Monitor configuration
require(config_dir + ".settings")  -- Compositor settings
require(config_dir + ".keybinds")  -- Keybindings for various actions
