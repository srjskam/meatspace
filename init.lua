
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



local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/mapgen.lua")
dofile(modpath.."/nodes.lua")

print("[meatspace] done")
