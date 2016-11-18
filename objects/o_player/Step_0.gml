/// @description Controls & Calculations

// calculations
size = abs(sprite_width * scale);
running = abs(phy_speed_x) >= max_spd;
image_speed = keyboard_check(left) || keyboard_check(right) ? 0.75 : 0;
image_xscale = flip ? -scale : scale;
image_yscale = scale;

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
else if (on_ground)
{
	// ToDo: fix issue with rotation while sliding
	if (abs(phy_speed_x) > max_spd / 2 && !keyboard_check(vk_anykey))
		phy_rotation = flip ? 270 : 90;
	else if (phy_speed < 1)
		phy_speed_x = 0;
	else
		phy_rotation = 0;
}
	
phy_speed_x = clamp(phy_speed_x, -max_spd, max_spd);

if (keyboard_check_pressed(jump) && on_ground)
	physics_apply_local_impulse(0, 0, 0, running ? (-jump_amount * 1.25) : -jump_amount);

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









