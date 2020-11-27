distanceBetween = require('calculateDistance')

function love.load()
  gameFont = love.graphics.newFont(40)

  target = {
    x = 50,
    y = 50,
    radius = 50
  }

  score = 0
  timer = 10
end

function love.update(deltaTime)
end

function love.draw()
  love.graphics.setColor(0.8, 0.2, 0.2)
  love.graphics.circle('fill', target.x, target.y, target.radius)

  love.graphics.setFont(gameFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print('Score: '..score, 0, 0)
end

function love.mousepressed(x, y, button, isTouch, presses)
  local mouseDistanceToCircle = distanceBetween(x, y, target.x, target.y)
  
  if button > 1 then return end
  if mouseDistanceToCircle > target.radius then return end
  
  score = score + 1
  target.x = math.random(
    target.radius, love.graphics.getWidth() - target.radius
  )
  target.y = math.random(
    target.radius, love.graphics.getHeight() - target.radius
  )
end
