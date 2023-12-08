-- entities/pipe.lua

local world = require('world')
local state = require('state')
local colors = require('colors')
local sound = require('sound')

getHeights = function(height, spacing)
  local h = love.math.random(0, height - spacing)
  return {h, (height - h - spacing)}
end

return function(pos_x, pos_y, height, spacing)
  local upper, lower = {}, {}
  local entities = {upper, lower}

  local h = getHeights(height, spacing)
  local y = {height-(h[1]/2), h[2]/2}

  for i, e in ipairs(entities) do
    e.type = 'pipe'
    e.body = love.physics.newBody(world, pos_x, y[i], "kinematic")
    e.shape = love.physics.newRectangleShape(54, h[i])
    e.fixture = love.physics.newFixture(e.body, e.shape)
    e.fixture:setUserData(e)
    e.draw = function(self)
      love.graphics.setColor(colors['green'])
      love.graphics.polygon('fill', self.body:getWorldPoints(self.shape:getPoints()))
    end
    e.update = function(self, dt)
      self.body:setLinearVelocity(-100, 0)
    end
    e.begin_contact = function(self)
    sound.effect_collision()
      state.game_over = true
    end
  end
    
  return entities
end
