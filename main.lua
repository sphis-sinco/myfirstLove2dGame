function love.load()
        
end

function love.update(dt)
end

function love.draw()
        love.graphics.setColor(0,255,0,255)
        love.graphics.rectangle('fill', 0, 0, 1280, 720)
        love.graphics.setColor(255,255,255,255)
        love.graphics.print('Hello World!' 400, 300)
end