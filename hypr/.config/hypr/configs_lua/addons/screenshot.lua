---- Screenshot using hyprshot


local module = {}
function module.capture(type, destination)
	filename = os.date("%Y_%m_%d-%H_%M_%S") .. ".png"
	if type == "window" then
		hl.dispatch(hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f " .. filename .. " -m window"))
	elseif type == "region" then
		hl.dispatch(hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f " .. filename .. " -m region"))
	elseif type == "monitor" then
		hl.dispatch(hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f " .. filename .. " -m output"))
	end
	hl.notification.create({
		text = "Screenshot of " .. type .. " saved as " .. filename,
		duration = 5000,
		icon = 5,
		color = "rgb(ff1ea3)",
		font_size = 14
	})
end

return module
