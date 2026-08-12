---- Behavior for input devices


-- Mouse and touchpad
hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = -0.95,  -- -1.0 to 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = false
		}
	}
})

-- Swipe gesture on a touchpad
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace"
})
