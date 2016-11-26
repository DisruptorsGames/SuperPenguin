/// @description Throw Powerup or Coin
if (timer == 0)
{
	var inst = noone;
	if (has_powerup)
	{
		inst = instance_create_layer(x, y - sprite_get_height(s_powerup) / 2, "Instances", o_powerup);
		has_powerup = false;
	}
	else if (coins > 0)
	{
		inst = instance_create_layer(x, y - sprite_height / 2, "Instances", o_coin);
		coins--;
	}
	
	with (inst) 
	{
		var r = phy_mass * 5; 
		physics_apply_local_impulse(0, 0, choose(-r, r), -r);
	}
	
	// nothing left!
	if (coins == 0 && !has_powerup)
		image_blend = c_gray;
	
	timer = cooldown;
}
