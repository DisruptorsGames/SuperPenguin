/// @function make_colour_comp
/// @param color
/// @description
var color = argument0, 
    h = color_get_hue(color), 
    s = color_get_saturation(color),
    v = color_get_value(color);

return make_color_hsv(lengthdir_x(s, h + 180), s, v);
