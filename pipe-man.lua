-- pipe-man.lua

local pipe = require('entities/pipe')
local state = require('state')
local entities = require('entities')
local sound = require('sound')
local constants = require('constants')

local pipe_destroyed = 0

return function(entity, index)
  if entity.type ~= 'pipe' then return end

  local pipe_x = entity.body:getX()
  
  if pipe_x <= 0 then
    pipe_destroyed = pipe_destroyed + 1 
    table.remove(entities, index)
    entity.fixture:destroy()
  end

  if pipe_destroyed == 2 then
    local pipes = pipe(400, {0, constants.pipe_max_height}, constants.pipe_max_height, constants.spacing)
    table.insert(entities, 1, pipes[1])
    table.insert(entities, 1, pipes[2])
    
    pipe_destroyed = 0
    state.score = state.score + 1
    sound.effect_score_up()
  end    
end
