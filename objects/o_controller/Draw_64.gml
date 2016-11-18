/// @description Debug Info
show_debug_overlay(global.debug);

if (global.debug)
{
    // basic data + ship data
    var general = "GENERAL" 
        + "\nCamera: " + string(vw) + "x" + string(vh) + " (" + string(vx) + "," + string(vy) + ")"
		+ "\nTarget: " + string(vt)
		+ "\nView: " + string(camera_get_view_width(view_camera[0])) + "x" + string(camera_get_view_height(view_camera[0]))        + "\nPort: " + string(view_wport[0]) + "x" + string(view_hport[0])
		+ "\nO: " + string(overview) + " Z: " + string(zoom) + + " M: " + string(manual)
		+ "\nI: " + string(layer_get_depth("Instances"))
			+ " A: " + string(layer_get_depth("Assets"))
			+ " B: " + string(layer_get_depth("Background"))
		+ "\nGame State: " + string(game != noone ? game.status : "???")
		+ "\nDifficulty: " + string(game != noone ? game.difficulty : "???")
		+ "\nOn Ground: " + string(instance_exists(o_player) ? o_player.on_ground : "???")
		+ "\nScale: " + string(instance_exists(o_player) ? o_player.scale : "???")
		+ "\nState: " + string(instance_exists(o_player) ? o_player.state : "???");
	
	var gen = "";
	if (instance_exists(o_generator))
		gen = "\nGENERATOR" 
			+ "\nX: " + string(x) 
			+ "\nB: " + string(o_generator.bottom);
    draw_set_halign(fa_right);
    draw_text_color(vw - 16, 4, general + gen, c_white, c_white, c_white, c_white, 0.75);
    draw_set_halign(-1);	

    // center lines
    draw_line_color(vw / 2, 0, vw / 2, vh, complimentary, complimentary);
    draw_line_color(0, vh / 2, vw, vh / 2, complimentary, complimentary);
}

// fps
/*if (!global.debug)
{
	var FPS = string(round(fps));
	draw_set_font(f_title);
	draw_text_color(vw - string_width(FPS) - 16, 16, FPS, complimentary, complimentary, complimentary, complimentary, 0.75);
	draw_set_font(-1);
}*/

// draw theme colors
/*var size = 16;
for (var i = 0; i < 4; i++)
{
    var color = c_white;
    switch(i)
    {
        case 0: color = theme break;
        case 1: color = lighter break;
        case 2: color = darker break;
        case 3: color = complimentary break;
    }
    var ix = 16 + i * (size + 2), iy = 16;
    draw_rectangle_color(ix, iy, ix + size, iy + size, color, color, color, color, false);
    draw_rectangle_color(ix, iy, ix + size, iy + size, c_black, c_black, c_black, c_black, true);
}*/