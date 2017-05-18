minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

minetest.register_alias("mapgen_stone", "meatspace:meat")
minetest.register_alias("mapgen_dirt", "air")
minetest.register_alias("mapgen_dirt_with_grass", "air")
minetest.register_alias("mapgen_sand", "air")
minetest.register_alias("mapgen_water_source", "air")
minetest.register_alias("mapgen_river_water_source", "air")
minetest.register_alias("mapgen_lava_source", "air")
minetest.register_alias("mapgen_gravel", "air")
minetest.register_alias("mapgen_desert_stone", "air")
minetest.register_alias("mapgen_desert_sand", "air")
minetest.register_alias("mapgen_dirt_with_snow", "air")
minetest.register_alias("mapgen_snowblock", "air")
minetest.register_alias("mapgen_snow", "air")
minetest.register_alias("mapgen_ice", "air")
minetest.register_alias("mapgen_sandstone", "air")

minetest.register_alias("mapgen_tree", "air")
minetest.register_alias("mapgen_leaves", "air")
minetest.register_alias("mapgen_apple", "air")
minetest.register_alias("mapgen_jungletree", "air")
minetest.register_alias("mapgen_jungleleaves", "air")
minetest.register_alias("mapgen_junglegrass", "air")
minetest.register_alias("mapgen_pine_tree", "air")
minetest.register_alias("mapgen_pine_needles", "air")


--minetest.register_on_mapgen_init(function(mgparams)
--	minetest.set_mapgen_params({mgname="v6", mg_flags={"nodungeons", "notrees", "caves"}, mgv6_spflags={"mudflow", "nosnowbiomes", "notrees", "nojungles"}, "water_level=-5"})
--end)

minetest.register_on_mapgen_init(function(mgparams)
	minetest.set_mapgen_params({mgname="v7", seed=1232131132, mg_flags={"nodungeons", "notrees", "caves","nodecorations"}, "water_level=-5"})
end)

--------------------------------------------------------------- biomes


minetest.register_biome({
		name = "normalskin",
		node_dust = "air",
		node_top = "meatspace:skin",
		depth_top = 2,
		node_filler = "meatspace:fat",
		depth_filler = 5,
		node_stone = "meatspace:meat",
		--node_water_top = "",
		--depth_water_top = ,
		node_water = "air",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = -31000,
		y_max = 31000,
		heat_point = 30,
		humidity_point = 20,
})

minetest.register_biome({
		name = "rawmeat",
		node_dust = "air",
		node_top = "meatspace:meat",
		depth_top = 1,
		node_filler = "meatspace:meat",
		depth_filler = 2,
		node_stone = "meatspace:meat",
		--node_water_top = "",
		--depth_water_top = ,
		node_water = "meatspace:blood",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = -31000,
		y_max = 100,
		heat_point = 80,
		humidity_point = 50,
})

minetest.register_biome({
		name = "mouth",
		node_dust = "air",
		node_top = "meatspace:mucous_membrane",
		depth_top = 1,
		node_filler = "meatspace:meat",
		depth_filler = 2,
		node_stone = "meatspace:meat",
		--node_water_top = "",
		--depth_water_top = ,
		node_water = "meatspace:liquid",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = -31000,
		y_max = 200,
		heat_point = 60,
		humidity_point = 80,
})
--------------------------------------------------------------- ores


--liver
minetest.register_ore({ 
	ore_type         = "blob",
	ore              = "meatspace:liver",
	wherein          = "meatspace:meat",
	clust_scarcity   = 32*32*32,
	clust_size       = 35,
	y_min            = -400,
	y_max            = 400,
	noise_threshold = 0.5,
	noise_params     = {
		offset=0,
		scale=1,
		spread={x=77, y=47, z=77},
		seed=484,
		octaves=3,
		persist=0.8
	},
})

--fat
minetest.register_ore({ 
	ore_type         = "blob",
	ore              = "meatspace:fat",
	wherein          = "meatspace:meat",
	clust_scarcity   = 33^3,
	clust_size       = 22,
	y_min            = 0,
	y_max            = 100,
	noise_threshold = 0.5,
	noise_params     = {
		offset=0,
		scale=1,
		spread={x=99, y=33, z=99},
		seed=12394,
		octaves=5,
		persist=0.8
	},
})

--nerves
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "meatspace:nerve",
	wherein        = {"meatspace:meat", "meatspace:bone"},
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 9,
	clust_size     = 4,
	y_min          = -10000,
	y_max          = 2000,
})

--blood
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "meatspace:blood",
	wherein        = "meatspace:meat",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 20,
	clust_size     = 4,
	y_min          = -10000,
	y_max          = 3100,
})

--pores
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "air",
	wherein        = "meatspace:skin",
	clust_scarcity = 8 * 8 * 8,
	clust_num_ores = 1,
	clust_size     = 4,
	y_min          = -10000,
	y_max          = 3100,
})

--hair
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "meatspace:hair",
	wherein        = "meatspace:skin",
	clust_scarcity = 32 * 32 * 32,
	clust_num_ores = 80,
	clust_size     = 16,
	y_min          = -10000,
	y_max          = 3100,
})

-- grow hair -not
if false then
minetest.register_abm{
    label = "grow hair",
	nodenames = {"meatspace:hair"},
	--neighbors = {"air"},
	interval = 1,
	chance = 10,
	action = function(pos)
		minetest.set_node({x = pos.x, y = pos.y + 1, z = pos.z}, {name = "meatspace:hair"})
	end,
}
end

minetest.register_decoration({
	deco_type = "simple",
	decoration = "meatspace:tooth_seed",
	place_on = "meatspace:mucous_membrane",
	--sidelen = 16,
	fill_ratio = 0.0005,
	biomes = {"mouth"},
})

minetest.register_decoration({
	deco_type = "simple",
	decoration = "meatspace:filiform_papilla",
	place_on = "meatspace:mucous_membrane",
	fill_ratio = 0.1,
	biomes = {"mouth"},
})
minetest.register_decoration({
	deco_type = "simple",
	decoration = "meatspace:fungiform_papilla",
	place_on = "meatspace:mucous_membrane",
	fill_ratio = 0.05,
	biomes = {"mouth"},
})
--------------------------------------------------------------- trees


local treedef_hair = {
	trunk_type = "single",

	iterations = 8,
	trunk = "meatspace:hair",
	random_level = 4,
	angle = 30,
	
	axiom = "A",
	rules_a = "TTTTTTTdc+a",
	rules_b = "",
	rules_c = "******d",
	rules_d = "**c",
	
	fruit = "",
	thin_branches = true,
	leaves2_chance = "",
	leaves2 = "",
	leaves = "meatspace:hair",
	fruit_chance = 0,
	name = "hair",
}       

local treedef_nail = {
    name = "nail", 
    trunk_type = "single", 
    thin_branches = true, 
    angle = 45, 
    iterations = 7, 
    random_level = 1, 
    trunk = "meatspace:nail", 
    leaves = "meatspace:nail", 
    axiom = "[&&a][****&&a]Dddddddddddd", 
    rules_a = "f[^^Dddddddddddd]f[^^Dddddddddddd]bcbca", 
    rules_b = "+", 
    rules_c = "-", 
    rules_d = "T",

    fruit_chance = 0, 
    fruit = "", 
    leaves2_chance = "", 
    leaves2 = "", 
}
   
                 
biome_lib:register_generate_plant({surface="meatspace:skin", rarity=90, max_count = 20}, treedef_hair)
biome_lib:register_generate_plant({surface="meatspace:skin", rarity=93, max_count = 10}, treedef_nail)

--------------------------------------------------------------- register_on_generated
--thanks, caverealms

local perlin_bone = {
	offset = 0,
	scale = 1,
	spread = {x=16, y=64, z=16}, 
	seed = 59033,
	octaves = 2,
	persist = 0.63
}

local perlin_enamel = {
	offset = 0,
	scale = 1,
	spread = {x=16, y=16, z=16}, 
	seed = 3456356,
	octaves = 2,
	persist = 0.5
}
local urinenoise ={
		offset=0,
		scale=1,
		spread={x=33, y=33, z=33},
		seed=45675345678,
		octaves=2,
		persist=0.8
	}
local bilenoise ={
		offset=0,
		scale=1,
		spread={x=23, y=13, z=23},
		seed=45645678,
		octaves=2,
		persist=0.8
	}
	
function randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end
minetest.register_on_generated(function(minp, maxp, seed)

	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()

	local cid_air = minetest.get_content_id("air")	
	local cid_meat = minetest.get_content_id("meatspace:meat")	
	local cid_nerve = minetest.get_content_id("meatspace:nerve")	
	local cid_bone = minetest.get_content_id("meatspace:bone")
	local cid_bone_matrix = minetest.get_content_id("meatspace:bone_matrix")
	local cid_enamel = minetest.get_content_id("meatspace:enamel")
	local cid_urine = minetest.get_content_id("meatspace:urine")
	local cid_bile = minetest.get_content_id("meatspace:bile")
	local cid_mucous_membrane = minetest.get_content_id("meatspace:mucous_membrane")
	local cid_tooth_seed = minetest.get_content_id("meatspace:tooth_seed")	

	--mandatory values
	local sidelen = x1 - x0 + 1 --length of a mapblock
	local chulens = {x=sidelen, y=sidelen, z=sidelen} --table of chunk edges
	local minposxyz = {x=x0, y=y0, z=z0} --bottom corner
	local minposxz = {x=x0, y=z0} --2D bottom corner

	local nvals_perlin_bone = minetest.get_perlin_map(perlin_bone, chulens):get3dMap_flat(minposxyz)
	local nvals_perlin_enamel = minetest.get_perlin_map(perlin_enamel, chulens):get3dMap_flat(minposxyz)
	local nvals_urinenoise = minetest.get_perlin_map(urinenoise, chulens):get3dMap_flat(minposxyz)
	local nvals_bilenoise = minetest.get_perlin_map(bilenoise, chulens):get3dMap_flat(minposxyz)


	local nixyz = 1 --3D node index

	for z = z0, z1 do -- for each xy plane progressing northwards
		for y = y0, y1 do -- for each x row progressing upwards
			local vi = area:index(x0, y, z) --current node index
			for x = x0, x1 do -- for each node do
				-- bones
				local fadetosky = 1
				if y > 0 then fadetosky =  math.max(0, 1-(y/100)) end 
				if fadetosky*nvals_perlin_bone[nixyz] > 0.95 then 
					data[vi] = cid_bone_matrix 
				elseif fadetosky*nvals_perlin_bone[nixyz] > 0.8 then
					data[vi] = cid_bone 
				end

				--bladders
				if data[vi] == cid_meat or data[vi] == cid_nerve then
					if nvals_urinenoise[nixyz] > 0.9 then 
						data[vi] = cid_urine
					elseif nvals_urinenoise[nixyz] > 0.8 then
						data[vi] = cid_mucous_membrane 
					end
					if nvals_bilenoise[nixyz] > 0.9 then 
						data[vi] = cid_bile
					elseif nvals_bilenoise[nixyz] > 0.8 then
						data[vi] = cid_mucous_membrane 
					end
				end

				--teeth
				if data[vi] == cid_tooth_seed then
					local height = math.random(15, 80)					
					local radius = math.floor(math.random(0.05*height, 0.25*height))
					local depth = math.floor(math.random(0.33*height, 0.8*height))--into ground		
					local squarity = randomFloat(2,3) --2=round

					for xx = x-radius, x+radius do
						for zz = z-radius, z+radius do
							local distance = math.pow( math.pow(math.abs(x-xx), squarity)
													 + math.pow(math.abs(z-zz), squarity), 1/squarity)
							--local distance = math.sqrt((x-xx)^2+(z-zz)^2)
							for yy = y-depth, y-depth + height  do
								local bulge = -(((yy-y+depth)/height*0.75)*2-1)^2+1
								if  distance < bulge*radius*0.66 then
									data[area:index(xx,yy,zz)] = cid_bone
								elseif  distance < bulge*radius then
									data[area:index(xx,yy,zz)] = cid_enamel
								end
								data[area:index(x,yy,z)] = cid_nerve
							end--yy
							-- cap
							if distance < .75*radius then
								data[area:index(xx,y-depth+height+1,zz)] = cid_enamel 
							end
						end--zz
					end--xx
				end--every tooth seed

				--increment indices
				nixyz = nixyz + 1
				vi = vi + 1
			end--x
		end--y
	end--z

	--send data back to voxelmanip
	vm:set_data(data)
	--calc lighting
	vm:set_lighting({day=0, night=0})
	vm:calc_lighting()
	--write it to world
	vm:write_to_map()

end)


