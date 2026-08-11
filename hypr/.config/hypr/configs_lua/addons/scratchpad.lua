---- Minimize windows to and from a global or local workspace


local function move_to_ws(ws_name, client_addr)
	hl.dispatch(hl.dsp.window.move({ workspace = ws_name, window = "address:" .. client_addr, follow = false }))
end

local module = {}
function module.global_scratchpad(action)
	if action == "minimize" then
		local client = hl.get_active_window()
		if client.workspace.special then
			move_to_ws("+0", client.address)
		else
			move_to_ws("special", client.address)
		end
	end
end

return module
