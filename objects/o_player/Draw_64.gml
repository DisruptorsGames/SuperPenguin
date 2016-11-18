/// @description HUD

// speed
for (var i = 0; i < max_spd; i++)
{
	// only draw arrow if moving
	var col = o_controller.complimentary;
	if (abs(phy_speed_x) > i)
	{
		// calculate start position
		var s = 32, o = 4, cx = (vw - max_spd * s) / 2,
			ix = cx + i * (s + o), iy = vh - s - o,
			c = running && i == max_spd - 1 ? make_color_elm() : col;
		draw_triangle_color(ix + s, iy, ix, iy - s / 2, ix, iy + s / 2, c, c, c, false);
	}
}