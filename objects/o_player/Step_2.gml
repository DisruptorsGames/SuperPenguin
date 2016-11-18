/// @description Powerup Effects
switch (powerup)
{
	case power_type.shrink:
		phy_active = false;
		if (scale > 0.5)
			scale -= 0.01;
		break;
	case power_type.large:
		phy_active = false;
		if (scale < 1)
			scale += 0.01;
		break;
}
if (powerup != power_type.null && scale == 1 || scale == 0.5)
{
	physics_remove_fixture(self, fixture);
	var fix = physics_fixture_create_ext(scale, -1, -1, -1, -1);
	physics_fixture_set_box_shape(fix, size / 3, size / 3);
	fixture = physics_fixture_bind(fix, self);
	physics_fixture_delete(fix);
	jump_amount = phy_mass * jump_spd;
	powerup = power_type.null;
	phy_active = true;
}