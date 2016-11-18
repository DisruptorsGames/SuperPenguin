/// @description Countdown && Block Animation
if (timer > 0)
{
	if (phy_position_y > phy_ystart - sprite_height)
		phy_position_y -= spd;
	
	timer--;
}
else if (timer == 0 && phy_position_y < phy_ystart)
	phy_position_y += spd;