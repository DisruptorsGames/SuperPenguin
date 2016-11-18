/// @description Show Physics World
if (global.debug)
{
    physics_world_draw_debug(flags);
	
    // camera
    draw_rectangle_color(vx, vy, vx + vw, vy + vh, c_red, c_red, c_red, c_red, true);
    // port
    var xx = view_xport[0], yy = view_yport[0], w = view_wport[0], h = view_hport[0];
    draw_rectangle_color(xx, yy, xx + w, yy + h, c_green, c_green, c_green, c_green, true);
}
