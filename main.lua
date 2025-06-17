function love.load()

    redBalls = {}
   --[[ redBalls.x = 1
    redBalls.y = 1
    redBalls.speed = 50
    redBalls.alive = true
    ]]

    whiteBalls = {}
   --[[ whiteBalls.x = 0
    whiteBalls.y = 0
    whiteBalls.speed = 50
    whiteBalls.alive = true
    ]]
    



end

function love.update(dt)

    for i, r in ipairs(redBalls) do
        r.x = r.x + r.speed * dt 
    
    end

     for i, w in ipairs(whiteBalls) do
        w.x = w.x - w.speed * dt 
     end

    ---collision
    for i, r in ipairs(redBalls)do
        for i, w in ipairs(whiteBalls) do
            if distanceBetween (r.x, r.y, w.x, w.y ) < 19 then
                r.dead = true
                w.dead = true
            end
        end

    end
    ---dead states
    for i=#redBalls, 1, -1 do
        local z = redBalls[i] 
        if z.dead == true then
            table.remove(redBalls, i)
        end
    end
    
    for i=#whiteBalls, 1, -1 do
        local z = whiteBalls[i]
        if z.dead == true then
            table.remove(whiteBalls, i)
        end 
    end

    


end

function love.draw()
--red balls drawing
  for i,r in ipairs(redBalls) do
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", r.x, r.y, 20, 20)
  end
  
  for i,w in ipairs(whiteBalls) do
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", w.x, w.y, 20, 20)
  end

end


function redBallsSpawner()
    local redball = {}
    redball.x =  100 --math.random(0, love.graphics.getWidth()) 
    redball.y = math.random(0, love.graphics.getHeight())
    redball.speed = 100
    redball.dead = false
    table.insert(redBalls, redball) 

    

end
function whiteBallsSpawner()
    local whiteball = {}
    whiteball.x = 700  --math.random(0, love.graphics.getWidth()) 
    whiteball.y = math.random(0, love.graphics.getHeight() )
    whiteball.speed = 100
    whiteball.dead = false
    table.insert(whiteBalls, whiteball) 
    

    

end

--keyboard test

function love.keypressed ( key )
    if key == "space" then
        redBallsSpawner()
        whiteBallsSpawner()
    end
end

function distanceBetween(x1, y1, x2, y2)
  return math.sqrt((x2 - x1)^2 + (y2 - y1)^2) 
end

