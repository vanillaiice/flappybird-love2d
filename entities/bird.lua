-- entities/bird.lua

local state = require('state')
local world = require('world')
local colors = require('colors')
local sound = require('sound')

return function(pos_x, pos_y, radius)
  local entity = {}

  entity.body = love.physics.newBody(world, pos_x, pos_y, "dynamic")
  entity.shape = love.physics.newCircleShape(radius)
  entity.fixture = love.physics.newFixture(entity.body, entity.shape)
	entity.fixture:setUserData(entity)
	
  entity.draw = function(self)
		local self_x, self_y = self.body:getWorldCenter()
    love.graphics.setColor(colors['yellow'])
		love.graphics.circle('fill', self_x, self_y, self.shape:getRadius())
  end

  entity.update = function(self)
    if self.body:getY() > 389 then state.game_over = true end
    if state.apply_force then
      sound.effect_jump()
      entity.body:applyForce(0, -3000)
      state.apply_force = false
    end
  end

  return entity
end
