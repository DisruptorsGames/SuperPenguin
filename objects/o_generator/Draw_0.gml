/// @description Draw World

if (global.debug)
{
    // builders
    draw_rectangle_color(x, bottom, x + width, bottom + height, c_blue, c_blue, c_blue, c_blue, true);
	draw_circle_color(x, bottom, 2, c_red, c_red, false);
	
	// draw room transparent
	draw_set_alpha(0.25);
	draw_rectangle_color(0, 0, room_width, room_height, c_yellow, c_yellow, c_yellow, c_yellow, false);
	draw_set_alpha(1);
	
    // draw reference point
    draw_rectangle_color(x, 0, x, vh, c_red, c_red, c_red, c_red, false);
	
	// draw grid data (-1, 0, etc)
	for (var i = 0; i < ds_grid_width(data); i++)
	{
	    for (var j = 0; j < ds_grid_height(data); j++)
	    {
	        // get grid real world x/y
	        var ix = i * width, iy = j * height,
	            value = ds_grid_get(data, i, j);
		
			if (value == -1)
				draw_text_color(ix, iy, string(value), c_white, c_white, c_white, c_white, 0.45);
	    }
	}
}
