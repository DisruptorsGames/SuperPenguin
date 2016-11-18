/// @function make_color_elm
/// @description
var h = irandom_range(0, 255), 
    s = irandom_range(51, 255), 
    v = irandom_range(102, 255);
return make_color_hsv(h, s, v);
