/// @description Powerup
if (powerup != power_type.null)
	o_controller.game.saved_powerup = other.type;
else
	powerup = other.type;
	
with (other) { instance_destroy(); }
// munch!
repeat(3)
{
	var callout = instance_create_layer(x, y - sprite_height / 2, "Instances", o_callout);
	callout.type = callout_type.food;
	callout.image_blend = make_color_elm();
	callout.text = "NOM!?!?";
}

power_time = seconds(1);