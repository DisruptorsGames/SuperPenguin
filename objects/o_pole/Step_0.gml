/// @description Lower Flag
if (drop_flag)
{
	if (flagy < y + sprite_height / 2)
		flagy++;
	else if (flagy >= y + sprite_height / 2 - 1)
	{
		change_state(game_state.win, choose("Great Job!", "Nice Moves!", "Gratz!", "w1n!"), seconds(5));
		with (o_player) { instance_destroy(); }
		instance_destroy();
	}
}