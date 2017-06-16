
-- adapted from http://stackoverflow.com/questions/16505905/walk-a-line-between-two-points-in-a-3d-voxel-space-visiting-all-cells
function drawLine(g0, g1, visitor)
	
	local gx0idx = math.floor(g0.x);
	local gy0idx = math.floor(g0.y);
	local gz0idx = math.floor(g0.z);
	
	local gx1idx = math.floor(g1.x);
	local gy1idx = math.floor(g1.y);
	local gz1idx = math.floor(g1.z);
    
    local sx = gx1idx > gx0idx and 1 or (gx1idx < gx0idx and -1 or 0);
    local sy = gy1idx > gy0idx and 1 or (gy1idx < gy0idx and -1 or 0);
    local sz = gz1idx > gz0idx and 1 or (gz1idx < gz0idx and -1 or 0);
        
	local gx = gx0idx;
	local gy = gy0idx;
	local gz = gz0idx;
	
	--Planes for each axis that we will next cross
    local gxp = gx0idx + (gx1idx > gx0idx and 1 or 0);
    local gyp = gy0idx + (gy1idx > gy0idx and 1 or 0);
    local gzp = gz0idx + (gz1idx > gz0idx and 1 or 0);
	
	--Only used for multiplying up the error margins
	local vx = g1.x == g0.x and 1 or g1.x - g0.x;
	local vy = g1.y == g0.y and 1 or g1.y - g0.y;
	local vz = g1.z == g0.z and 1 or g1.z - g0.z;
	
    --Error is normalized to vx * vy * vz so we only have to multiply up
    local vxvy = vx * vy;
    local vxvz = vx * vz;
    local vyvz = vy * vz;
	
	--Error from the next plane accumulators, scaled up by vx*vy*vz
	local errx = (gxp - g0.x) * vyvz;
	local erry = (gyp - g0.y) * vxvz;
	local errz = (gzp - g0.z) * vxvy;
	
	local derrx = sx * vyvz;
	local derry = sy * vxvz;
	local derrz = sz * vxvy;
    
    local testEscape = 100;
    while (testEscape>0) do
        testEscape = testEscape - 1;
        visitor(gx, gy, gz);
		
		if (gx == gx1idx and gy == gy1idx and gz == gz1idx) then break end

        --Which plane do we cross first?
		local xr = math.abs(errx);
		local yr = math.abs(erry);
		local zr = math.abs(errz);
        	
		if (sx ~= 0 and (sy == 0 or xr < yr) and (sz == 0 or xr < zr)) then
			gx = gx+sx;
			errx = errx+derrx;
		elseif (sy ~= 0 and (sz == 0 or yr < zr)) then
			gy = gy+sy;
			erry = erry+derry;
		elseif (sz ~= 0) then
			gz = gz+sz;
			errz = errz+derrz;
		end
	end --while
end --function



local worldpath=minetest.get_worldpath()
local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/nodes.lua")
dofile(modpath.."/crafting.lua")

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
