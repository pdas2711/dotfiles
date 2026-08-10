---- Screenshot using hyprshot


local module = {}
function module.capture(type, destination)
	filename = os.date("%Y_%m_%d-%H_%M_%S")
	if type == "window" then
		hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f " .. filename .. ".png -m window")
	elseif type == "region" then
		hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f " .. filename .. ".png -m region")
	elseif type == "monitor" then
		hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f " .. filename .. ".png -m output")
	end
	hl.notification.create({
		text = "Screenshot taken",
		duration = 3000,
		icon = 5,
		color = "rgb(ff1ea3)",
		font_size = 14
	})
end

return module
