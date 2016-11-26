/// @description DEBUG
draw_self();

if (global.debug)
{
	// detect when to stomp vs die
	var s = size / 2, c = on_ground ? c_green : c_red, w = size / 3, h = size / 2;
	draw_line_color(x, y, x + lengthdir_x(s, 210), y + lengthdir_y(s, 210), c_red, c_red);
	draw_line_color(x, y, x + lengthdir_x(s, 330), y + lengthdir_y(s, 330), c_blue, c_blue);
	//
	draw_circle_color(x, bbox_bottom, 2, c, c, false);
}

if (power_time > 0)
{
	var col = o_controller.complimentary;
	draw_healthbar(x - size, y - size - 6, x + size, y - size - 3, power_time / 60 * 100, c_black, col, col, 0, false, false);
}