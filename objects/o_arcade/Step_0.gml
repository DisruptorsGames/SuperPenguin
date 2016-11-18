/// @description World Time & Countdown
if (instance_exists(o_player))
{
	if (timer > 0)
		timer--;
	
	var falling = o_player.y > room_height;
	if (timer == 0 || falling)
	{
		o_player.state = falling ? player_state.falling : player_state.dead;
		with (o_player) { instance_destroy(); }
		timer = seconds(300 - difficulty * 10);
	}
}

if (countdown > 0)
	countdown--;
else if (countdown == 0)
{
	switch (status)
	{
		case game_state.respawn:
			var inst = instance_create_layer(16, vw / 2, "Instances", o_player)
			camera_set_view_target(view_camera[0], inst);
			break;
		case game_state.win:
			o_controller.zoom = 1;
			var inst = instance_create_depth(0, 0, 50, o_generator);
			inst.clean = true;
			camera_set_view_target(view_camera[0], inst);
			win = false;
			break;
		case game_state.lose:
			o_controller.zoom = 1;
			room_goto(r_menu_main);
			break;
	}

	countdown = -1;
}
