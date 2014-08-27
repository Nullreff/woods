-- Love test game
-- by Ryan Mendivil

-- Colors
BLACK = {0, 0, 0, 255}
WHITE = {255, 255, 255, 255}
TRANSPARENT = {0, 0, 0, 0}

function love.load()
    width, height = love.graphics.getDimensions()

    player = {
        x = 0,
        y = height - 15,
        speed = 0,
    }

    local background_image = love.graphics.newImage("assets/woods.png")
    background = {
        image = background_image,
        scale = height / background_image:getHeight(),
        offset = 0
    }
    love.graphics.setNewFont(12)
    love.graphics.setBackgroundColor(255,255,255)
end

SPEED_MAX = 5
SPEED_GAIN = 1
function love.update(dt)
    if love.keyboard.isDown("left") then
        player.speed = player.speed - SPEED_GAIN
    elseif love.keyboard.isDown("right") then
        player.speed = player.speed + SPEED_GAIN
    elseif player.speed > 0 then
        player.speed = player.speed - SPEED_GAIN
    elseif player.speed < 0 then
        player.speed = player.speed + SPEED_GAIN
    end

    if player.speed > SPEED_MAX then
        player.speed = SPEED_MAX
    end
    if player.speed < -SPEED_MAX then
        player.speed = -SPEED_MAX
    end

    player.x = player.x + player.speed

    if player.x > (width - 10) then
        player.x = (width - 10)
    end
    if player.x < 0 then
        player.x = 0
    end
end

function love.draw()
    love.graphics.setColor(WHITE)
    love.graphics.draw(background.image, 0, 0, 0, background.scale, background.scale)
    love.graphics.setColor(BLACK)
    love.graphics.print('P', player.x, player.y)
end
