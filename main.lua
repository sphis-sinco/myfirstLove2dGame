function love.load()
        anim8 = require 'libs/anim8'
        sti = require 'libs/sti'
        camlib = require 'libs/hump/camera'
        love.graphics.setDefaultFilter('nearest', 'nearest')

        gameMap = sti('maps/testMap.lua')
        cam = camlib()

        player = {}
        player.speed = 1
        player.x = 400
        player.y = 200

        player.sprite = love.graphics.newImage('sprites/player.png')
        player.grid = anim8.newGrid(16, 16, player.sprite:getWidth(), player.sprite:getHeight())
        player.animations = {}
        player.animations.down = anim8.newAnimation(player.grid('1-3', 1), 0.2)
        player.animations.side = anim8.newAnimation(player.grid('1-3', 2), 0.2)
        player.animations.up = anim8.newAnimation(player.grid('1-3', 3), 0.2)

        player.anim = player.animations.down
end

function love.update(dt)
        local playerMoving = false

        if love.keyboard.isDown('right') then
                playerMoving = true
                player.anim = player.animations.side
                player.x = player.x + player.speed
        end

        if love.keyboard.isDown('left') then
                playerMoving = true
                player.anim = player.animations.side
                player.x = player.x - player.speed
        end

        if love.keyboard.isDown('down') then
                playerMoving = true
                player.anim = player.animations.down
                player.y = player.y + player.speed
        end

        if love.keyboard.isDown('up') then
                playerMoving = true
                player.anim = player.animations.up
                player.y = player.y - player.speed
        end

        if playerMoving then
                player.anim:update(dt)
        else
                player.anim:gotoFrame(2)
        end

        cam:lookAt(player.x, player.y)

        local w = love.graphics.getWidth()
        local h = love.graphics.getHeight()

        if cam.x < w / 2 then
                cam.x = w / 2
        end
        if cam.y < h / 2 then
                cam.y = h / 2
        end

        local mapW = gameMap.width * gameMap.tilewidth
        local mapH = gameMap.height * gameMap.tileheight

        if cam.x > (mapW - w/2) then
                cam.x = (mapW - w/2)
        end
        if cam.y > (mapH - h/2) then
                cam.y = (mapH - h/2)
        end
end

function love.draw()
        cam:attach()
                gameMap:drawLayer(gameMap.layers['Tile Layer 1'])
                player.anim:draw(player.sprite, player.x, player.y, nil, 2, 2, 8, 8)
        cam:detach()
end
