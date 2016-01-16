playerents = {}
playerents.objects = {}
playerents.objpath = "entities/"
local register = {}
local id = 0

function playerents.Startup()
	register["player"] = love.filesystem.load(ents.objpath .. "player.lua")
end

function playerents.Derive(name)
	return love.filesystem.load(ents.objpath .. name .. ".lua")()
end

function playerents.Create(name, x, y)
	if not x then
		x = 0
	end

	if not y then
		y = 0
	end

	if register[name] then
		id = id + 1
		local playerent = register[name]()
		playerent:load()
		playerent.type = name
		playerent:setPos(x, y)
		playerent.id = id
		playerents.objects[#ents.objects + 1] = ent
		return playerents.objects[#ents.objects]
	else
		print("Error: Entity" .. name .. " does not exist!")
		return false
	end
end

function playerents.Destroy(id)
	if playerents.objects[id] then
		if playerents.objects[id].Die then
			playerents.objects[id]:Die()
		end
		playerents.objects[id] = nil
	end
end

function playerents:update(dt)
	for i, playerent in pairs(ents.objects) do
		if playerent.update then
			playerent:update(dt)
		end
	end
end

function playerents:draw()
	for i, playerent in pairs(playerents.objects) do
		if playerent.draw then
			playerent:draw()
		end
	end
end

function playerents.attack(x, y)
	for i, playerent in pairs(playerents.objects) do
		if playerent.Die == true then
			if playerent.type == "demon" then
				local hit = insideBox(x, y, ent.x, ent.y, 256, 128)
				if hit == true then
					print("Demon hit!")
				end
			end
		end
	end
end
