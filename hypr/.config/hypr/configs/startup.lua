--- Start up applications on Hyprland


hl.on("hyprland.start", function()
	hl.exec_cmd("pkill hyprpaper; hyprpaper")
	hl.exec_cmd("pkill waybar; waybar")
end)
