-- entities/text/score.lua

local state = require('state')
local colors = require('colors')

return function()
  local entity = {}

  entity.draw = function()
    love.graphics.print(
      {colors['black'], state.score},
      5,
      0,
      0,
      2,
      2
    )
  end

  return entity
end
