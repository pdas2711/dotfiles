---- Miscellaneous settings


-- Default wallpaper
hl.config({
	misc = {
		force_default_wallpaper = 0,  -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true  -- If true disables the random hyprland logo / anime girl background
	}
})

-- Dwindle Layout
hl.config({
	general = {
		layout = "dwindle"
	},
	dwindle = {
		preserve_split = true,
		special_scale_factor = 0.92
	}
})
