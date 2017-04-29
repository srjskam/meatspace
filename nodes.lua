

minetest.register_node("meatspace:tooth_seed", {
	description = "tooth_seed",
	node_box={type = "regular"},
	tiles = {"bubble.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})

minetest.register_node("meatspace:meat", {
	description = "Meat",
	node_box={type = "regular"},
	tiles = {"meat.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})

minetest.register_node("meatspace:skin", {
	description = "Skin",
	node_box={type = "regular"},
	tiles = {"skin.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})


minetest.register_node("meatspace:fat", {
	description = "Fat",
	node_box={type = "regular"},
	tiles = {"fat.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})

minetest.register_node("meatspace:mucous_membrane", {
	description = "Mucous Membrane",
	node_box={type = "regular"},
	tiles = {"mucous_membrane.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})

minetest.register_node("meatspace:bone", {
	description = "Bone",
	node_box={type = "regular"},
	tiles = {"bone.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})

minetest.register_node("meatspace:bone_matrix", {
	description = "Bone matrix",
	node_box={type = "regular"},
	tiles = {"bone_matrix.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})

minetest.register_node("meatspace:enamel", {
	description = "Enamel",
	node_box={type = "regular"},
	tiles = {"enamel.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})

minetest.register_node("meatspace:liver", {
	description = "Liver",
	node_box={type = "regular"},
	tiles = {"liver.png"},
	is_ground_content = true,
	groups = {cracky = 2,oddly_breakable_by_hand=1},
})

minetest.register_node("meatspace:nerve", {
	description = "Nerve",
	tiles = {"nerve_top.png", "nerve_top.png", "nerve.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	--sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("meatspace:hair", {
	description = "hair",
	tiles = {"hair_top.png", "hair_top.png", "hair.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree = 1, choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
	--sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("meatspace:filiform_papilla", {
	description = "Filiform papilla",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"filiform_papilla.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=3,flora=1,attached_node=1},
})
minetest.register_node("meatspace:fungiform_papilla", {
	description = "Fungiform papilla",
	drawtype = "plantlike",
	waving = 1,
	tiles = {"fungiform_papilla.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy=3,flammable=3,flora=1,attached_node=1},
})


--------------------liquids

minetest.register_node("meatspace:liquid", {
	description = "Mystery liquid",
	drawtype = "liquid",
	tiles = {"liquid.png"},
	special_tiles = {"liquid.png"},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "meatspace:liquid_flowing",
	liquid_alternative_source = "meatspace:liquid",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 70},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	--sounds = default.node_sound_water_defaults(),
})


minetest.register_node("meatspace:liquid_flowing", {
	description = "Mystery liquid flowing",
	drawtype = "flowingliquid",
	tiles = {"liquid.png"},
	special_tiles = {"liquid.png"},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "meatspace:liquid_flowing",
	liquid_alternative_source = "meatspace:liquid",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 4,
	post_effect_color = {a = 103, r = 30, g = 60, b = 70},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	--sounds = default.node_sound_water_defaults(),
})

minetest.register_node("meatspace:bile", {
	description = "Bile",
	drawtype = "liquid",
	tiles = {"bile.png"},
	special_tiles = {"bile.png"},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "meatspace:bile_flowing",
	liquid_alternative_source = "meatspace:bile",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 60, g = 60, b = 40},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	--sounds = default.node_sound_water_defaults(),
})
minetest.register_node("meatspace:bile_flowing", {
	description = "Bile flowing",
	drawtype = "flowingliquid",
	tiles = {"bile.png"},
	special_tiles = {"bile.png"},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "meatspace:bile_flowing",
	liquid_alternative_source = "meatspace:bile",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 2,
	post_effect_color = {a = 103, r = 60, g = 60, b = 40},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("meatspace:urine", {
	description = "Urine",
	drawtype = "liquid",
	tiles = {"urine.png"},
	special_tiles = {"urine.png"},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "meatspace:urine_flowing",
	liquid_alternative_source = "meatspace:urine",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 60, g = 60, b = 30},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})
minetest.register_node("meatspace:urine_flowing", {
	description = "Urine flowing",
	drawtype = "flowingliquid",
	tiles = {"urine.png"},
	special_tiles = {"urine.png"},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "meatspace:urine_flowing",
	liquid_alternative_source = "meatspace:urine",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 4,
	post_effect_color = {a = 103, r = 60, g = 60, b = 30},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})

minetest.register_node("meatspace:blood", {
	description = "blood",
	drawtype = "liquid",
	tiles = {"blood.png"},
	special_tiles = {"blood.png"},
	alpha = 160,
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_alternative_flowing = "meatspace:blood_flowing",
	liquid_alternative_source = "meatspace:blood",
	liquid_viscosity = 1,
	post_effect_color = {a = 200, r = 90, g = 20, b = 30},
	groups = {water = 3, liquid = 3, puts_out_fire = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})


minetest.register_node("meatspace:blood_flowing", {
	description = "Blood flowing",
	drawtype = "flowingliquid",
	tiles = {"blood.png"},
	special_tiles = {"blood.png"},
	alpha = 160,
	paramtype = "light",
	paramtype2 = "flowingliquid",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "flowing",
	liquid_alternative_flowing = "meatspace:blood_flowing",
	liquid_alternative_source = "meatspace:blood",
	liquid_viscosity = 1,
	liquid_renewable = false,
	liquid_range = 3,
	post_effect_color = {a = 200, r = 90, g = 20, b = 30},
	groups = {water = 3, liquid = 3, puts_out_fire = 1,
		not_in_creative_inventory = 1, cools_lava = 1},
	sounds = default.node_sound_water_defaults(),
})
