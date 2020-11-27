distanceBetween = require('calculateDistance')

function love.load()
  love.mouse.setVisible(false)
  gameFont = love.graphics.newFont(40)

  score = 0
  timer = 10
  gameState = 1

  target = {
    x = 50,
    y = 50,
    radius = 50
  }

  sprites = {
    sky = love.graphics.newImage('assets/sky.png'),
    crosshairs = love.graphics.newImage('assets/crosshairs.png'),
    target = love.graphics.newImage('assets/target.png')
  }
end

function love.update(deltaTime)
  if timer > 0 then
    timer = timer - deltaTime
  end
  if timer < 0 then
    timer = 0
  end
end

function love.draw()
  love.graphics.draw(sprites.sky, 0, 0)

  if gameState == 2 then
    love.graphics.draw(
      sprites.target,
      target.x - target.radius,
      target.y - target.radius
    )
  end

  love.graphics.draw(
    sprites.crosshairs,
    love.mouse.getX() - 20,
    love.mouse.getY() - 20
  )

  love.graphics.setFont(gameFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print('Score: '..score, 0, 0)
  love.graphics.print('Timer: '..math.ceil(timer), 400, 0)
end

function love.mousepressed(x, y, button, isTouch, presses)
  local mouseDistanceToCircle = distanceBetween(x, y, target.x, target.y)

  if (
    button > 1 or
    mouseDistanceToCircle > target.radius or
    gameState == 1
  ) then return end

  score = score + 1
  target.x = math.random(
    target.radius, love.graphics.getWidth() - target.radius
  )
  target.y = math.random(
    target.radius, love.graphics.getHeight() - target.radius
  )
end
