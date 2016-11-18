/// @description Throw Powerup or Coin
if (timer == 0)
{
	if (has_powerup)
	{
		instance_create_layer(x, y - sprite_get_height(s_powerup) / 2, "Instances", o_powerup);
		has_powerup = false;
	}
	else if (coins > 0)
	{
		var coin = instance_create_layer(x, y - sprite_height / 2, "Instances", o_coin);
		with (coin) 
		{
			var r = phy_mass; 
			physics_apply_local_impulse(0, 0, choose(-r, r), -r);
		}
		coins--;
	}
	
	// nothing left!
	if (coins == 0 && !has_powerup)
		image_blend = c_gray;
	
	timer = cooldown;
}
