vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'
vim.opt.cursorline = true
vim.wo.number = true

local is_tty = vim.fn.system {
	'tty', '|', 'grep', '-o', '"tty"'
}
local tty_env = os.getenv("IS_TTY")
if (tty == "tty" or tty_env == "1") then
	vim.cmd.colorscheme "default"
else
	vim.cmd.colorscheme "catppuccin-mocha"
end
-- vim.wo.relativenumber = true

-- Clipboard
--vim.api.nvim_set_option("clipboard","unnamedplus")
vim.g.clipboard = {
	name = "wltmux",
	copy = {
		["*"] = "tmux load-buffer -",
		["+"] = "wl-copy"
	},
	paste = {
		["*"] = "tmux save-buffer -",
		["+"] = "wl-paste"
	},
	cache_enabled = true
}
