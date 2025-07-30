function love.load()
        anim8 = require 'libs/anim8'
        love.graphics.setDefaultFilter('nearest', 'nearest')

        player = {}
        player.speed = 1
        player.x = 400
        player.y = 200

        player.sprite = love.graphics.newImage('sprites/player.png')
        player.grid = anim8.newGrid(16, 16, player.sprite:getWidth(), player.sprite:getHeight())
        player.animations = {}
        player.animations.down = anim8.newAnimation( player.grid('1-3', 1), 0.2)
end

function love.update(dt)
        if love.keyboard.isDown('right') then
                player.x = player.x + player.speed
        end

        if love.keyboard.isDown('left') then
                player.x = player.x - player.speed
        end

        if love.keyboard.isDown('down') then
                player.y = player.y + player.speed
        end

        if love.keyboard.isDown('up') then
                player.y = player.y - player.speed
        end
end

function love.draw()
        love.graphics.setColor(0, 255, 0, 255)
        love.graphics.rectangle('fill', 0, 0, 1280, 720)
        love.graphics.setColor(255, 255, 255, 255)

        player.animations.down:draw(player.sprite, player.x, player.y, nil, 2)
end
