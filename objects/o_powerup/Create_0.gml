/// @description Init
image_speed = 0;
image_index = irandom(image_number - 1);
type = power_type.null;
switch (image_index)
{
	// fish / (mushroom)
	case 0:
		type = power_type.large;
		break;
	// krill / (fire flower)
	case 1:
		type = power_type.fire;
		break;	
}