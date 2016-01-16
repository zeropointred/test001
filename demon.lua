local ent = ents.Derive("base")

function ent:setPos(x, y)
	self.x = x
	self.y = y
	self.fixed_y = y
end

function ent:load(x, y)
	self:setPos(x, y)
	self.image = love.graphics.newImage("textures/demon.png")
	self.birth = love.timer.getTime() + math.random(0, 128)
	self.size = math.random(0.9, 1.1)
end

function ent:update(dt)
	--[Insert AI stuff here]
	self.y = self.fixed_y + math.sin(love.timer.getTime() - self.birth)*(self.size*10)
	self.x = self.x
end

function ent:Die()
	return true
end

function ent:draw()
	love.graphics.setColor(255,255,255,255)
	love.graphics.draw(self.image, self.x, self.y, 0, self.size, self.size, 0, 0)
end

return ent;
