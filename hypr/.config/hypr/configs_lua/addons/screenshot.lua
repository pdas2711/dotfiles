---- Screenshot using hyprshot


local module = {}
function module.screenshot(type, destination)
	file = os.date("%Y_%m_%d-%H_%M_%S")
	if type == "window" then
		hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f ${filename}.png -m window")
	elseif type == "region" then
		hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f ${filename}.png -m region")
	elseif type == "monitor" then
		hl.dsp.exec_cmd("hyprshot -o " .. destination .. "/ -f ${filename}.png -m output")
	end
end

return module
