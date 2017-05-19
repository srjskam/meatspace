

--- sticks

for _,material in ipairs({"nail", "bone"}) do
    minetest.register_craftitem("meatspace:"..material.."_stick", {
	    description = material.." stick",
	    inventory_image = material..".png^[mask:stick_mask.png^[makealpha:0,0,0",
	    groups = {stick = 1},
    })
    minetest.register_craft({
	    output = "meatspace:"..material.."_stick",
	    recipe = {{"meatspace:"..material},}
    })
end


--tools

for _,pair in ipairs({ {"nail",0.3}, {"bone",0.5}, {"enamel",1} }) do
    material = pair[1]
    hardness = pair[2]
    --- picks
    minetest.register_tool("meatspace:pick_"..material, {
        description = material.." pick",
        inventory_image = "meatspace_tool_pick_"..material..".png",
        tool_capabilities = {
            max_drop_level=1,
            groupcaps= {
                cracky={times={[1]=4.00/hardness, [2]=1.50/hardness, [3]=1.00/hardness}, uses=200*hardness, maxlevel=1}
            }
        }
    })
    minetest.register_craft({
	    output = 'meatspace:pick_'..material,
	    recipe = {
		    {'meatspace:'..material, 'meatspace:'..material, 'meatspace:'..material},
		    {'', 'group:stick', ''},
		    {'', 'group:stick', ''},
	    }
    })
    --- shovels
    minetest.register_tool("meatspace:shovel_"..material, {
        description = material.." axe",
        inventory_image = "meatspace_tool_shovel_"..material..".png",
        tool_capabilities = {
            max_drop_level=1,
            groupcaps= {
            	crumbly = {times={[1]=1.10/hardness, [2]=0.50/hardness, [3]=0.30/hardness}, uses=30200*hardness, maxlevel=1},
            }
        }
    })
    minetest.register_craft({
	    output = 'meatspace:shovel_'..material,
	    recipe = {
	    		{'meatspace:'..material},
		        {'group:stick'},
		        {'group:stick'},
	    }
    })
    --- axes
    minetest.register_tool("meatspace:axe_"..material, {
        description = material.." axe",
        inventory_image = "meatspace_tool_axe_"..material..".png",
        tool_capabilities = {
            max_drop_level=1,
            groupcaps= {
			    choppy={times={[1]=2.10/hardness, [2]=0.90/hardness, [3]=0.50/hardness}, uses=200*hardness, maxlevel=1},
			}
        }
    })
    minetest.register_craft({
	    output = 'meatspace:axe_'..material,
	    recipe = {
		    {'meatspace:'..material, 'meatspace:'..material},
		    {'meatspace:'..material, 'group:stick'},
		    {'', 'group:stick'},
	    }
    })
    --- swords
    minetest.register_tool("meatspace:sword_"..material, {
        description = material.." axe",
        inventory_image = "meatspace_tool_sword_"..material..".png",
        tool_capabilities = {
            max_drop_level=1,
            groupcaps= {
            	snappy={times={[1]=1.90/hardness, [2]=0.90/hardness, [3]=0.30/hardness}, uses=200*hardness, maxlevel=1},
            }
        }
    })
    minetest.register_craft({
	    output = 'meatspace:sword_'..material,
	    recipe = {
		    {'meatspace:'..material},
		    {'meatspace:'..material},
		    {'group:stick'},
	    }
    })    

end

