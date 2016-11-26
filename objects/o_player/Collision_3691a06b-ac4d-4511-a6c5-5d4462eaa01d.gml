/// @description Lose Powerup, Kill Enemy OR DIE!
var dir = point_direction(x, y, other.x, other.y);
if (dir > 210 && dir < 330 || sliding)
	other.stomped = true;
else if (powerup != power_type.null)
	powerup = power_type.shrink;
else
{
	state = player_state.dead;
	instance_destroy();
}