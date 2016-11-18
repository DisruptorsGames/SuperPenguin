/// @description Death!
if (state != player_state.alive)
{
	lives--;

	if (lives == 0)
		change_state(game_state.lose, choose("GAME OVER!", "gg", "Better luck next time"), seconds(5));
	else
	{
		var text = "";
		switch(state)
		{
			case player_state.falling:
				text = choose("Oh Snap!", "Watch out!", "Be careful!", "REKT!", "RIP");
				break;
			case player_state.oot:
				text = choose("Times up!", "Run faster next time", "Go go go!");
				break;
			case player_state.dead:
				text = choose("Dont hug monsters!", "Watch it bub!");
				break;
		}
		change_state(game_state.respawn, text, -1);
	}
}