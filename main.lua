distanceBetween = require('calculateDistance')

function love.load()
  love.mouse.setVisible(false)
  gameFont = love.graphics.newFont(40)

  score = 0
  timer = 0
  gameState = 1

  target = {
    x = love.graphics.getWidth() / 2,
    y = 150,
    initialRadius = 50,
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
    love.timer.sleep(0.25)
    timer = 0
    gameState = 1
    target.radius = target.initialRadius
  end
end

function love.draw()
  love.graphics.draw(sprites.sky, 0, 0)

  if gameState == 2 then
    love.graphics.draw(
      sprites.target,
      target.x - target.radius,
      target.y - target.radius,
      0,
      target.radius / target.initialRadius
    )
  end

  if gameState == 1 then
    love.graphics.printf(
      'Click anywhere to begin!',
      0,
      250,
      love.graphics.getWidth(),
      'center'
    )
  end

  love.graphics.draw(
    sprites.crosshairs,
    love.mouse.getX() - 20,
    love.mouse.getY() - 20
  )

  love.graphics.setFont(gameFont)
  love.graphics.setColor(1, 1, 1)
  love.graphics.print('Score: '..score, 5, 5)
  love.graphics.print('Time: '..math.ceil(timer), 400, 5)
end

function love.mousepressed(x, y, button, isTouch, presses)
  local mouseDistanceToCircle = distanceBetween(x, y, target.x, target.y)

  if gameState == 1 then
    gameState = 2
    timer = 10
    score = 0
  end

  if (
    button > 1 or
    mouseDistanceToCircle > target.radius or
    gameState ~= 2
  ) then return end

  score = score + 1
  target.x = math.random(
    target.radius, love.graphics.getWidth() - target.radius
  )
  target.y = math.random(
    target.radius, love.graphics.getHeight() - target.radius
  )
  target.radius = target.radius - 1
  timer = timer + 0.3
end
