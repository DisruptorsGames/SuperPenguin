/// @description DEBUG
draw_self();

if (global.debug)
{
	var s = size / 2;
	draw_line_color(x, y, x + lengthdir_x(s, 210), y + lengthdir_y(s, 210), c_red, c_red);
	draw_line_color(x, y, x + lengthdir_x(s, 330), y + lengthdir_y(s, 330), c_blue, c_blue);
}