/// @description Score!
sfx_play(sfx_coin);
score += 10;
var effect = ef_star;
if (score > o_controller.game.oneup)
{
	if (lives < o_controller.game.max_lives)
		lives++;
	else
		score += 40;
	effect = ef_spark;
	o_controller.game.oneup += o_controller.game.level * 100;
}
effect_create_above(effect, x, y, 0, make_color_elm());
with (other) { instance_destroy(); }
