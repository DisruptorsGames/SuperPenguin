/// @description Generator
if (clean)
{
	var elm = layer_get_all_elements(background);
	// remove all tiles
	for (var i = 0; i < array_length_1d(elm); i++)
	{
		if (layer_get_element_type(elm[i]) == layerelementtype_sprite)
	      layer_sprite_destroy(elm[i]);
	}
	// remove assets
	elm = layer_get_all_elements(ground);
	for (var i = 0; i < array_length_1d(elm); i++)
	{
		if (layer_get_element_type(elm[i]) == layerelementtype_sprite)
			layer_sprite_destroy(elm[i]);
	}
	elm = layer_get_all_elements(world);
	for (var i = 0; i < array_length_1d(elm); i++)
	{
		if (layer_get_element_type(elm[i]) == layerelementtype_sprite)
			layer_sprite_destroy(elm[i]);
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

var diff = o_controller.game.difficulty,
	under = o_controller.game.underground,
	mud = make_color_dpk(o_controller.complimentary, 0.25, under 
		? (irandom(0.75) + 0.25)
		: (irandom(0.25) + 0.75)),
	snow = merge_color(mud, c_white, 0.75);
if (x + width < room_width)
{
	var sw = sprite_get_width(s_wall) / 2, sh = sprite_get_height(s_wall) / 2,
		by = bottom / width, xx = x / height,
		on_ground = (random(100) > diff * 10 || x < offset) 
			&& place_free(x + sw, bottom + sh);
	
	// walls
	if (on_ground)
	{
	    var bg = layer_sprite_create_ext(background, x, bottom, s_tiles, 0, 0, under ? o_controller.darker : snow),
			fg = layer_sprite_create_ext(ground, x, bottom, s_tiles, 2, 0, mud);
		
		instance_create_depth(x + sw, bottom + sh, depth, o_wall);
		
		if (!under)
		{
			// clouds
			if (irandom(100) < 15)
			{
				var ind = irandom(sprite_get_number(s_cloud) - 1),
					cloud = layer_sprite_create_ext(world, x + sw, random_range(0, bottom - height * 4), s_cloud, ind, 0, snow);
				layer_sprite_xscale(cloud, random(3) + 1);
				layer_sprite_yscale(cloud, random(3) + 1);
				layer_sprite_alpha(cloud, random(0.5) + 0.50);
			}
			// trees
			if (irandom(100) < 10)
			{
				var ind = irandom(sprite_get_number(s_tree) - 1);
				layer_sprite_create_ext(world, x + sw, bottom + 4, s_tree, ind, 0, snow);
			}
		}
		
		// create end pole
		if (x > room_width - offset * 1.5 && !instance_exists(o_pole))
			instance_create_layer(x + sprite_get_width(s_pole) / 2, bottom - sprite_get_height(s_pole) / 2, "Instances", o_pole);
	}
	// fill
	ds_grid_set_region(data, xx, on_ground ? (by + 1) : by, xx, room_height, on_ground ? 1 : -1);
	ds_grid_set_region(data, xx, 0, xx, by - 1, -1);
	
	// blocks
	if (random(100) < 2.5)
		instance_create_layer(x - sprite_get_width(s_block) / 2, irandom_range(bottom - height * 3, bottom - height * 4), "Instances", o_block);
	// on ground
    if (random(100) < 15)
	{
        var c = instance_create_layer(x - sprite_get_width(s_coin) / 2, bottom - height, "Instances", o_coin);
		c.image_blend = mud;
	}
	if (random(100) < diff * 2)
		instance_create_layer(x, bottom - height, "Instances", o_enemy);

	// move builder randomly
	var c = data[# xx - 3, by] == -1 
		&& choose(true, irandom(100) < diff * 6);
	if (c && bottom > sprite_get_height(s_player))
		bottom -= height;
	else if (bottom + height < room_height)
		bottom += height;

    x += width;
    alarm[0] = 1;
}
else
{
	if (!under)
	{
		// mountains
		var w = sprite_get_width(s_mountain), h = sprite_get_height(s_mountain);
		for (var i = 0; i < room_width / w; i++)
		{
			if (irandom(100) < 15)
				layer_sprite_create_ext(world, i * w, vh + random(h / 4), s_mountain, 0, 0, snow); 
		}
	}
	// fill tiles
	for (var i = 0; i < ds_grid_width(data); i++)
	{
	    for (var j = 0; j < ds_grid_height(data); j++)
	    {
			var value = ds_grid_get(data, i, j);
			// dirt
			if (value == 1)
				layer_sprite_create_ext(ground, i * width, j * height, s_tiles, irandom_range(4, 8), 0, mud);
			else if (value == -1)
			{
				// cave
				if (under)
					layer_sprite_create_ext(background, i * width, j * height, s_tiles, 0, 0, make_color_dpk(o_controller.darker, 0.75, random(1)));
				// sky
				else
					layer_sprite_create_ext(background, i * width, j * height, s_tiles, 0, 0, make_color_dpk(c_blue, 0.25, random(0.25) + 0.75));
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










