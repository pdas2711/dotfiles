---- Monitor Configuration


-- Disable HDR

hl.config({
	render = {
		cm_auto_hdr = 0
	}
})

-- Monitors

hl.monitor({  -- Primary Monitor
	output = "DP-1",
	mode = "2560x1440@144",
	position = "1920x0",
	scale = 1
})

hl.monitor({  -- Secondary Monitor
	output = "DP-2",
	mode = "1920x1080@60",
	position = "4480x0",
	scale = 1
})

hl.monitor({  -- TV
	output = "HDMI-A-1",
	mode = "3840x2160@60",
	position = "0x0",
	scale = 2
})

hl.monitor({
	output = "HDMI-A-2",
	disabled = true
})

hl.monitor({  -- Generic Rule
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1
})
