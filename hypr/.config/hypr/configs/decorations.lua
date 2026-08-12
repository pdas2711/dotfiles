---- Decorations


-- Gaps and Borders
hl.config({
	general = {  -- Non-grouped Windows
		gaps_in = 5,
		gaps_out = 7,
		border_size = 7,
		col = {
			active_border = {
				colors = { "rgba(bd4bffff)", "rgba(bd4bffff)" },
				angle = 45
			},
			inactive_border = "rgba(595959aa)"
		}
	},
	group = {  -- Grouped Windows
		col = {
			border_active = "rgba(00d7d7ff)",
			border_inactive = "rgba(595959aa)",
			border_locked_active = "rgba(ff6000ff)",
			border_locked_inactive = "rgba(595959aa)"
		}
	}
})

-- Animations
hl.config({
	animations = {
		enabled = false
	}
})
