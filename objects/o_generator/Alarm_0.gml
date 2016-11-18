/// @description Generator
if (clean)
{
	var elm = layer_get_all_elements(assets);
	// remove all tiles
	for (var i = 0; i < array_length_1d(elm); i++)
	{
		if (layer_get_element_type(elm[i]) == layerelementtype_sprite)
	      layer_sprite_destroy(elm[i])
	}
	// remove all walls and fruit
	for (var i = 0; i < instance_count; i++)
	{
		var inst = instance_id[i];
		if (instance_exists(inst) && (inst.object_index == o_wall 
			|| inst.object_index == o_coin 
			|| inst.object_index == o_enemy
			|| inst.object_index == o_block))
		{
			instance_destroy(inst);
		}
	}
	// new theme
	o_controller.theme = make_color_elm();
	make_color_shades(o_controller.theme);
	// stop cleaning...
	clean = false;
}

if (x + width < room_width)
{
	var diff = o_controller.game.difficulty,
		by = bottom / width, xx = x / height,
		owall = instance_nearest(x, bottom, o_wall),
		ground = (random(100) > diff * 10 || x < offset);
	
	// walls
	if (ground)
	{
	    var sw = sprite_get_width(s_wall) / 2, sh = sprite_get_height(s_wall) / 2,
			wall = instance_create_depth(x + sw, bottom + sh, depth, o_wall),
			color = make_color_dpk(o_controller.complimentary, random(1), random(1)),
			background = layer_sprite_create_ext(assets, x, bottom, s_tiles, 0, 0, o_controller.darker),
			foreground = layer_sprite_create_ext(assets, x, bottom, s_tiles, 2, 0, c_white),
			within_range = x > room_width - offset * 1.5;
			
		// create end pole
		if (within_range && !instance_exists(o_pole))
		{
			instance_create_layer(x + sprite_get_width(s_pole) / 2, bottom - sprite_get_height(s_pole) / 2, "Instances", o_pole);
			layer_sprite_blend(foreground, c_red);
		}
	}
	// fill
	ds_grid_set_region(data, xx, ground ? (by + 1) : by, xx, room_height, ground ? 1 : -1);
	ds_grid_set_region(data, xx, 0, xx, by - 1, -1);
	
	// blocks
	if (random(100) < 8/*2.5*/)
		instance_create_layer(x - sprite_get_width(s_block) / 2, irandom_range(bottom - height * 3, bottom - height * 6), "Instances", o_block);
	// on ground
    if (random(100) < 15)
        instance_create_layer(x - sprite_get_width(s_coin) / 2, bottom - height, "Instances", o_coin);
	/*if (random(100) < diff * 2)
		instance_create_layer(x, bottom - height, "Instances", o_enemy);*/

	// move builder randomly
	/*var c = data[# xx - 3, by] == -1 
		&& choose(true, irandom(100) < diff * 6);
	if (c && bottom > sprite_get_height(s_player))
		bottom -= height;
	else if (bottom + height < room_height)
		bottom += height;*/

    x += width;
    alarm[0] = 1;
}
else
{
	// fill the grid
	for (var i = 0; i < ds_grid_width(data); i++)
	{
	    for (var j = 0; j < ds_grid_height(data); j++)
	    {
			var value = ds_grid_get(data, i, j), col = c_white;
			
			// create actual asset
			if (value == -1 || value == 1)
			{
				var index = value == 1 ? irandom_range(4, 8) : 0,
					col = value == 1 ? c_white : make_color_dpk(o_controller.darker, 0.75, random(1));
				layer_sprite_create_ext(assets, i * width, j * height, s_tiles, index, 0, col);
			}
		}
	}

	//room_speed = 60; // DEBUG (REMOVE ME!)
	room_set_background_color(r_level, o_controller.darker, true); // DOES THIS WORK??
	physics_world_gravity(0, 50);
	if (instance_exists(o_player))
		o_player.phy_active = true;
	else
	{
		var inst = instance_create_layer(32, vh / 2, "Instances", o_player);
		camera_set_view_target(view_camera[0], inst);
	}
	instance_destroy();
}










