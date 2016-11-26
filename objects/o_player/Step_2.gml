/// @description Powerup Effects
size = abs(sprite_width * scale);
if (power_time > 0)
{
	power_time--;
	
	switch (powerup)
	{
		// scale down
		case power_type.shrink:
			phy_active = false;
			if (scale > 0.5)
				scale -= 0.005;
			break;
		// scale up
		case power_type.large:
			phy_active = false;
			if (scale < 1)
				scale += 0.005;
			break;
		case power_type.fire:
			if (red < 255)
				red += 4.25;
			image_blend = make_color_rgb(red, 0, 0);
			break;
	}
}
else if (power_time == 0)
{
	// resize
	if (powerup == power_type.large || powerup == power_type.shrink)
	{
		physics_remove_fixture(self, fixture);
		var fix = physics_fixture_create_ext(scale, -1, -1, -1, -1);
		physics_fixture_set_box_shape(fix, size / (box * scale), size / (box / 2 * scale));
		fixture = physics_fixture_bind(fix, self);
		physics_fixture_delete(fix);
		jump_amount = phy_mass * jump_spd;
		powerup = power_type.null;
		phy_active = true;
	}
	
	// clear shirnk
	if (powerup == power_type.shrink)
		powerup = power_type.null;
		
	power_time = -1;
}