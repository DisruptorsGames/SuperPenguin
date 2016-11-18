/// @description Debug Speed
draw_self();

if (global.debug)
{
	var text = string(phy_mass);
	draw_text_color(x, y, text, c_red, c_red, c_red, c_red, 1);
}