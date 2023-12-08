-- world.lua

local begin_contact_callback = function(fixture_a, fixture_b, contact)
  local entity_a = fixture_a:getUserData()
  local entity_b = fixture_b:getUserData()
  if entity_a.begin_contact then entity_a:begin_contact() end
  if entity_b.begin_contact then entity_b:begin_contact() end
end

local world = love.physics.newWorld(0, 9.81 * 32)

world:setCallbacks(begin_contact_callback, nil, nil, nil)

return world
