/// @description Draw Coins (DEBUG)
draw_self();

if (global.debug)
{
	var text = string(coins)
		+ "\n" + string(timer);
	draw_text_color(x, y, text, c_black, c_black, c_black, c_black, 1);
}