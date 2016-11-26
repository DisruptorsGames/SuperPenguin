/// @description First Things First
on_ground = physics_test_overlap(x, y, 0, o_wall) 
	|| physics_test_overlap(x, y, 0, o_block);

/*on_ground = place_meeting(bbox_left, bbox_bottom, o_wall)
	|| place_meeting(bbox_right, bbox_bottom, o_wall);*/
	
switch(object_index)
{
	case o_player:
		if (timer > 0)
			timer--;
		else if (timer == 0)
		{
			if (moving && !sliding)
				sfx_play(sfx_walk);
			timer = seconds(t);
		}
		break;
}