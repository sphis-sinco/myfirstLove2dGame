function love.load()
        player = {}

        player.speed = 5

        player.x = 400
        player.y = 200
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
        love.graphics.setColor(0,255,0,255)
        love.graphics.rectangle('fill', 0, 0, 1280, 720)

        love.graphics.setColor(255,255,255,255)
        love.graphics.circle('fill', player.x, player.y, 100)
end