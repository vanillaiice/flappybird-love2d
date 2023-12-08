-- sound.lua

function playFromSource(source)
  love.audio.play(love.audio.newSource(source, 'static'))
end

return {
  effect_collision = function() playFromSource('sound/collision.mp3') end,
  effect_game_over = function() playFromSource('sound/game-over.mp3') end,
  effect_pause = function() playFromSource('sound/pause.mp3') end,
  effect_jump = function() playFromSource('sound/jump.mp3') end,
  effect_score_up = function() playFromSource('sound/score-up.mp3') end
}
