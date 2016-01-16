function love.load()
	require("entities")
	ents.Startup()
	love.graphics.setBackgroundColor(0, 200, 0)

	local demonEnt = ents.Create("demon", 128, 128)
	local skeleEnt = ents.Create("skeleton", 384, 128)
	local orcEnt = ents.Create("orc", 640, 128)
end

function love.draw()
	local x = love.mouse.getX( )
	local y = love.mouse.getY( )

	love.graphics.setColor(0, 155, 0, 255)
	love.graphics.rectangle("fill", 0, 0, 1366, 768)

	ents:draw()
end

function love.update(dt)
	ents:update(dt)
end

--function love.focus(bool)
--end

--function love.keypressed(key, unicode)
--end

--function love.keyreleased(key, unicode)
--end

function love.mousepressed(x, y, button)
	if button == "l" then
		ents.attack(x, y)
	end
end

--function love.mousereleased(x, y, button)
--end

--function love.quit()
--end﻿

function insideBox(px, py, x, y, wx, wy)
	if px > x and px < x + wx then
		if py > y and py < y + wy then
			return true
		end
	else
	return false
	end
end
