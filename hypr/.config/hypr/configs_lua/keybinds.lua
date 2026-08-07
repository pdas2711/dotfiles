---- Keybindings


-- Leader Key

main_mod = "SUPER"

require(config_dir .. ".audio_controls")
local zoom = require(config_dir .. ".addons.zoom")

-- Some general keybindings

hl.bind(main_mod .. " + SHIFT + Q", hl.dsp.exit())  -- Exit Hyprland
hl.bind(main_mod .. " + RETURN", hl.dsp.exec_cmd(terminal))  -- Launch terminal
hl.bind(main_mod .. " + D", hl.dsp.window.close())  -- Close window
hl.bind(main_mod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))  -- Toggle between floating and tiling
hl.bind(main_mod .. " + SLASH", hl.dsp.layout("togglesplit"))  -- Toggle between window splits in Dwindle
hl.bind(main_mod .. " + C", hl.dsp.exec_cmd("bemenu-run --fb '#1e1e2e' --ff '#cdd6f4' --nb '#1e1e2e' --nf '#cdd6f4' --tb '#1e1e2e' --hb '#1e1e2e' --tf '#f38ba8' --hf '#f9e2af' --af '#cdd6f4' --ab '#1e1e2e'"))  -- Launch bemenu with specific color profile

hl.bind(main_mod .. " + SEMICOLON", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ 1; " .. lockscreen))  -- Mute audio then lock

-- Switch between windows

hl.bind(main_mod .. " + TAB", hl.dsp.focus({ last = true }))  -- Switch to last focused window

-- Fullscreen toggles

hl.bind(main_mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))  -- Maximize windows
hl.bind(main_mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))  -- True fullscreen windows

-- Moving focus along windows

hl.bind(main_mod .. " + LEFT",  hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + UP",    hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + DOWN",  hl.dsp.focus({ direction = "down" }))
hl.bind(main_mod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + J",  hl.dsp.focus({ direction = "down" }))

-- Move windows along the tile

hl.bind(main_mod .. " + SHIFT + LEFT", hl.dsp.window.move({ direction = "left" }))
hl.bind(main_mod .. " + SHIFT + RIGHT", hl.dsp.window.move({ direction = "right" }))
hl.bind(main_mod .. " + SHIFT + UP", hl.dsp.window.move({ direction = "up" }))
hl.bind(main_mod .. " + SHIFT + DOWN", hl.dsp.window.move({ direction = "down" }))
hl.bind(main_mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(main_mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(main_mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(main_mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Create groups, cycle between windows, and move windows in a group forwards or backwards

hl.bind(main_mod .. " + W", hl.dsp.group.toggle())  -- Toggle current window into a group
hl.bind(main_mod .. " + S", hl.dsp.group.next())  -- Cycle through windows in a group
hl.bind(main_mod .. " + ALT + LEFT", hl.dsp.group.move_window({ forward = false }))  -- Move backwards
hl.bind(main_mod .. " + ALT + RIGHT", hl.dsp.group.move_window({ forward = true }))  -- Move forwards
hl.bind(main_mod .. " + ALT + H", hl.dsp.group.move_window({ forward = false }))  -- Move backwards
hl.bind(main_mod .. " + ALT + L", hl.dsp.group.move_window({ forward = true }))  -- Move forwards

-- Move/resize windows with LMB/RMB and dragging

hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Scroll through workspaces using the mouse wheel

hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e+1" }))

-- Switch workspaces and move active window to the corresponding workspace

for i = 1, 9 do
	hl.bind(main_mod .. " + " .. i, hl.dsp.focus({ workspace = i}))
	hl.bind(main_mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Brightness Control

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { locked = true, repeating = true })  -- Increase brightness by 5%
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })  -- Decrease brightness by 5%

-- Zoom

hl.bind(main_mod .. " + CTRL + 0", function() zoom.change_zoom("default") end)
hl.bind(main_mod .. " + CTRL + MINUS", function() zoom.change_zoom("decrement") end)
hl.bind(main_mod .. " + CTRL + EQUAL", function() zoom.change_zoom("increment") end)
