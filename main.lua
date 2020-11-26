function love.load()
  gameFont = love.graphics.newFont(40)

  target = {
    x = 150,
    y = 150,
    radius = 50
  }

  score = 0
  timer = 0
end

function love.update(deltaTime)
end

function love.draw()
  love.graphics.setFont(gameFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print('Score: '..score, 0, 0)

  love.graphics.setColor(0.8, 0.2, 0.2)
  love.graphics.circle('fill', target.x, target.y, target.radius)
end

function love.mousepressed(x, y, button, isTouch, presses)
  local actions = {
    function() score = score + 1 end,
    function() score = score - 1 end
  }

  if actions[button] ~= nil then actions[button]() end
end
