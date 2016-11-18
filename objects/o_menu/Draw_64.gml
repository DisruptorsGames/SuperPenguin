/// @description Menu

// get offset and center
var offset = 24;
if (!is_undefined(menu[| 0]))
    offset = font_get_size(f_title)/*string_height(menu[| 0])*/;

var ycenter = vh / 2;

// title
draw_set_font(f_title);
draw_text_color((vw - string_width(title)) / 2, ycenter - (ds_list_size(menu) + 2) * offset, title, c_black, c_black, c_black, c_black, 1);
draw_set_font(f_menu);
draw_text_color((vw - string_width(title)) / 2, ycenter - (ds_list_size(menu) + 2) * offset, title, c_lime, c_lime, c_gray, c_gray, 1);
// menu
for (var i = 0; i < ds_list_size(menu); i++)
{
    var item = menu[| i],
        color = i == selection ? c_white : c_ltgray,
        ix = (vw - string_width(item)) / 2,
        iy = ycenter - (ds_list_size(menu) - 1) * offset;
    draw_text_color(ix, iy + i * offset, item, color, color, color, color, 1);
    // selection
    if (i == selection)
        draw_text_color(ix - string_width(indicator) - 4, iy + i * offset, indicator, color, color, color, color, 1);
}
draw_set_font(-1);
