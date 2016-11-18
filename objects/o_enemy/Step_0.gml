/// @description Think
if (timer > 0)
	timer--;
else if (timer == 0)
{
	var dir = choose(-spd, spd);
	physics_apply_local_impulse(0, 0, dir, 0);
	image_xscale = dir < 0 ? -1 : 1;
	timer = seconds(irandom(t));
}

phy_active = !stomped;
image_speed = phy_speed > 0.25 ? 0.75 : 0;