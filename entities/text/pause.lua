-- entities/text/pause.lua

local state = require('state')
local colors = require('colors')
local sound = require('sound')

return function()
	local window_width, window_height = love.window.getMode()
	
	local entity = {}

	entity.draw = function(self)
		if state.paused and not state.game_over then
			sound.effect_pause()
      love.graphics.setColor(colors['green-dark'])
			love.graphics.print(
				'PAUSED',
				math.floor(window_width / 2) - 54,
				math.floor(window_height / 2),
				0,
				2,
				2
			)
		end
	end

	return entity
end
