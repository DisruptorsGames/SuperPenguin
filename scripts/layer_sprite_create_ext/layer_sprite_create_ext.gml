/// @function layer_sprite_create_ext
/// @param layer_id
/// @param x
/// @param y
/// @param sprite
/// @param image_index
/// @param image_speed
/// @param image_blend
var spr = layer_sprite_create(argument0, argument1, argument2, argument3);
layer_sprite_index(spr, argument4);
layer_sprite_speed(spr, argument5);
layer_sprite_blend(spr, argument6);
return spr;