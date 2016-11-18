/// @description Draw Self && Flag
draw_self();

var col = o_controller.complimentary;
draw_triangle_color(
	x - size, flagy, 
	x, flagy - size / 2, 
	x, flagy + size / 2, 
	col, col, col, false);

if (global.debug)
{
	draw_circle_color(x - size, flagy, 2, c_red, c_red, false);
	draw_circle_color(x, flagy - size / 2, 2, c_green, c_green, false);
	draw_circle_color(x, flagy + size / 2, 2, c_blue, c_blue, false);
}