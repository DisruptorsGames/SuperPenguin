/// @description Score!
score += 10;
var effect = ef_star, size = 1;
if (score > o_controller.game.oneup)
{
	if (lives < o_controller.game.max_lives)
		lives++;
	else
		score += 40;
	effect = ef_firework;
	size = 0;
	o_controller.game.oneup += o_controller.game.level * 100;
}
effect_create_above(effect, x, y, size, make_color_elm());
with (other) { instance_destroy(); }
