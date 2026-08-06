---- Config location

config_dir = "configs_lua"

require(config_dir .. ".env_vars")  -- Environment variables
require(config_dir .. ".misc")
require(config_dir .. ".startup")  -- GUI applications on start
require(config_dir .. ".monitors")  -- Monitor configuration
require(config_dir .. ".keybinds")  -- Keybindings for various actions
require(config_dir .. ".input")
require(config_dir .. ".decorations")
