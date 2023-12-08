-- entities.lua

local bird = require('entities/bird')
local pipe = require('entities/pipe')
local game_over_text = require('entities/text/game-over')
local pause_text = require('entities/text/pause')
local score_text = require('entities/text/score')
local constants = require('constants')

local pipes = pipe(200, {0, constants.pipe_max_height}, constants.pipe_max_height, constants.spacing)
local p2 = pipe(400, {0, constants.pipe_max_height}, constants.pipe_max_height, constants.spacing)

local entities = { 
  pipes[1],
  pipes[2],
  p2[1],
  p2[2],
  game_over_text(),
  pause_text(),
  score_text(),
  bird(62, 200, 12),
}

return entities
