-- input.lua

local state = require('state')
local entities = require('entities')

local press_functions = {
	escape = function()
		love.event.quit()
	end,
	space = function()
		state.apply_force = true
	end,
	backspace = function()
		love.event.quit("restart")
	end
}

press_functions['return'] = function()
	state.paused = not state.paused
end

return {
	press = function(pressed_key)
		if press_functions[pressed_key] then
			press_functions[pressed_key]()
		end
	end,
	toggle_focus = function(focused)
		if not focused then
			state.paused = true
		end
	end
}
