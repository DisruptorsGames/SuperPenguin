/// @description Controls & Calculations
moving = keyboard_check(left) || keyboard_check(right);
running = abs(phy_speed_x) >= max_spd - 1;
sliding = running || (abs(phy_speed_x) > 0 && sliding);
image_index = sliding ? 3 : (image_index > 2 ? 0 : image_index);
image_speed = moving && !sliding ? 1 : 0;
image_xscale = flip ? -scale : scale;
image_yscale = scale;
phy_speed_x = clamp(phy_speed_x, -max_spd, max_spd);

// movement
if (keyboard_check(left) && phy_active)
{
	physics_apply_local_force(spd, 0, -spd * phy_mass, 0);
	flip = true;
}
else if (keyboard_check(right) && phy_active)
{
	physics_apply_local_force(-spd, 0, spd * phy_mass, 0);
	flip = false;
}
else if (on_ground && phy_speed < 0.75 && !sliding)
{
	image_index = 0;
	phy_speed_x = 0;
}

// jump
if (keyboard_check_pressed(jump) && on_ground)
{
	sfx_play(sfx_jump);
	physics_apply_local_impulse(0, 0, 0, running ? (-jump_amount * 1.15) : -jump_amount);
}

// CHEAT (move player to mouse)
if (o_controller.manual && global.debug)
{
	if (mouse_check_button_pressed(mb_left))
	{
		phy_position_x = mouse_x;
		phy_position_y = mouse_y;
	}
	else if(mouse_check_button_pressed(mb_right))
		instance_create_layer(mouse_x, mouse_y, "Instances", o_enemy);
}









