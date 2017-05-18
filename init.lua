
--https://forum.minetest.net/viewtopic.php?f=47&t=11936
local function on_generated(minp, maxp, blockseed)
   print ("---- on_generated (minp="..minetest.pos_to_string(minp)..", maxp="..minetest.pos_to_string(maxp)..", blockseed="..tostring(blockseed)..")")
end
minetest.register_on_generated(on_generated)
local pseudo = PseudoRandom(13)
minetest.register_node("meatspace:regenerator", {
   description = "Use to regenerate.",
   tiles = {"default_clay.png^bubble.png"},
   on_use = function(itemstack, user, pointed_thing)
      
      local pos = user:getpos()
      local minp = {x=pos.x-100, y=pos.y-100, z=pos.z+100}
      local maxp = {x=pos.x+100, y=pos.y+100, z=pos.z+100}
      local newSeed = pseudo:next()
      print ("---- deleting (minp="..minetest.pos_to_string(minp)..", maxp="..minetest.pos_to_string(maxp)..", seed="..tostring(newSeed))
      minetest.set_mapgen_params({seed=newSeed})
      minetest.delete_area(minp, maxp)
   end,
})
minetest.register_on_newplayer(function(player)
   player:get_inventory():add_item('main', 'meatspace:regenerator')
end)



local worldpath=minetest.get_worldpath()
local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/nodes.lua")

if minetest.setting_getbool("meatspace_override_mapgen") then
    print("[meatspace] mapgen enabled")
	dofile(modpath.."/mapgen.lua")
end

mobs:register_mob("meatspace:leucocyte", {
	type = "monster",
	collisionbox = {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3},
	hp_max = 12,
	hp_min = 7,
	visual = "mesh",
	mesh = "leucocyte.x",
	textures = {{"leucocyte.png","leucocyte.png", "meat.png^[colorize:#D4D:100"}},
	fly = true,
	fly_in = "meatspace:blood",
	visual_size = {x=2, y=2},
	makes_footstep_sound = false,
	view_range = 13,
	walk_velocity = 1,
	reach =1.5,
	run_velocity = 2,
	damage = 2,
	jump = false,
	armor = 100,
	drawtype = "front",
	water_damage = 0,
	fear_height = 5,
	floats = 0,
	lava_damage = 5,
	light_damage = 0,
	group_attack=true,
	attack_animals=true,
	knock_back=5,
	blood_texture="meat.png",
	on_rightclick = nil,
	attack_type = "dogfight",
	animation = {
		speed_normal = 15,
		speed_run = 25,
		stand_start = 1,
		stand_end = 100,
		walk_start = 1,
		walk_end = 100,
		run_start = 1,
		run_end = 100,
		punch_start = 1,
		punch_end = 100,
	}
	--pathfinding = 1,
})
mobs:spawn({
	name = "meatspace:leucocyte",
	nodes = {"meatspace:blood"},
	interval = 1,
	chance = 2,
})

print("[meatspace] done")
