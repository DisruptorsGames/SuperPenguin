/// @description Float & Disappear
if (timer > 0)
	timer--;
else if (timer == 0)
{
	switch(type)
	{
		case callout_type.food:
			sfx_play(sfx_eat);
			break;
	}

	var xx = string_width(text) / 4, 
		yy = string_height(text) / 2;
	y -= irandom(yy);
	x += irandom(choose(-xx, xx));
	image_alpha -= random(0.15) + 0.10;
	timer = t;
}

if (image_alpha <= 0)
	instance_destroy();