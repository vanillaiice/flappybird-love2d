-- entities/text/game-over.lua

local state = require('state')
local colors = require('colors')
local sound = require('sound')

return function()
  local window_width, window_height = love.window.getMode()

  local entity = {}

  entity.draw = function()
    if state.game_over then
      sound.effect_game_over()
      love.graphics.setColor(colors['red'])
      love.graphics.print(
        'GAME OVER',
        math.floor(window_width / 2) - 75,
        math.floor(window_height / 2),
        0,
        2,
        2
      )
    end
  end

  return entity
end
