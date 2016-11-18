/// @description Final Actions
if (stomped)
{
	image_yscale -= 0.25;
	if (image_yscale <= 0)
	{
		score += 5;
		instance_destroy(); 
	}
}