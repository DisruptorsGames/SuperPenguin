/// @function draw_banner
/// @param title
/// @param message
/// @param background
/// @param foreground
/// @param size
/// @param description
var title = argument0, message = argument1, 
    background = argument2, foreground = argument3, 
    size = argument4;

var xcenter = vw / 2, ycenter = vh / 2,
    offset = font_get_size(f_title) + font_get_size(f_title) / 2,
    iy = ycenter - offset;
    
draw_rectangle_color(0, ycenter - size, vw, ycenter + size, background, background, background, background, false);
draw_rectangle_color(0, ycenter - size, vw, ycenter + size, foreground, foreground, foreground, foreground, true);

draw_set_font(f_title);
draw_text_color((vw - string_width(title)) / 2, iy, title, foreground, foreground, c_gray, c_gray, 1);
draw_set_font(f_menu);
draw_text_color((vw - string_width(message)) / 2, iy + offset, message, c_gray, c_gray, foreground, foreground, 1);
draw_set_font(-1);
