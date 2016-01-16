local playerbase = {}

playerbase.x = 0
playerbase.y = 0
playerbase.health = 100

function playerbase:setPos(x, y)
	playerbase.x = x
	playerbase.y = y
end

function playerbase:getPos()
	return playerbase.x, playerbase.y;
end

function playerbase:load()
end

return playerbase;
