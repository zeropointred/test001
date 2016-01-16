ents = {}
ents.objects = {}
ents.objpath = "entities/"
local register = {}
local id = 0

function ents.Startup()
	register["demon"] = love.filesystem.load(ents.objpath .. "demon.lua")
	register["skeleton"] = love.filesystem.load(ents.objpath .. "skeleton.lua")
	register["orc"] = love.filesystem.load(ents.objpath .. "orc.lua")
end

function ents.Derive(name)
	return love.filesystem.load(ents.objpath .. name .. ".lua")()
end

function ents.Create(name, x, y)
	if not x then
		x = 0
	end

	if not y then
		y = 0
	end

	if register[name] then
		id = id + 1
		local ent = register[name]()
		ent:load()
		ent.type = name
		ent:setPos(x, y)
		ent.id = id
		ents.objects[#ents.objects + 1] = ent
		return ents.objects[#ents.objects]
	else
		print("Error: Entity" .. name .. " does not exist!")
		return false
	end
end

function ents.Destroy(id)
	if ents.objects[id] then
		if ents.objects[id].Die then
			ents.objects[id]:Die()
		end
		ents.objects[id] = nil
	end
end

function ents:update(dt)
	for i, ent in pairs(ents.objects) do
		if ent.update then
			ent:update(dt)
		end
	end
end

function ents:draw()
	for i, ent in pairs(ents.objects) do
		if ent.draw then
			ent:draw()
		end
	end
end

function ents.attack(x, y)
	for i, ent in pairs(ents.objects) do
		if ent.Die == true then
			if ent.type == "demon" then
				local hit = insideBox(x, y, ent.x, ent.y, 256, 128)
				if hit == true then
					print("Demon hit!")
				end
			end
		end
	end
end
