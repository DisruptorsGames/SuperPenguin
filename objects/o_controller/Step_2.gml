/// @description Zoom & Scale

// zoom
if (mouse_wheel_up())
	zoom -= rate;
else if (mouse_wheel_down())
	zoom += rate;

zoom = clamp(zoom, 0.10, room_height / rate);

// manual camera control
if (keyboard_check(vk_left))
	camx -= cam_spd;
else if (keyboard_check(vk_right))
	camx += cam_spd;
if (keyboard_check(vk_up))
	camy -= cam_spd;
else if (keyboard_check(vk_down))
	camy += cam_spd;

// calculations
var max_w = display_get_width(), max_h = display_get_height(),
    aspect = window_get_fullscreen() ? (max_w / max_h) : (base_w / base_h),
	target = instance_exists(o_generator) ? o_generator : o_player;
//	
width = aspect > 1 ? min(base_w, max_w) : (height * aspect);
height = aspect > 1 ? min(base_h, max_h) : (width / aspect);	
// camera
if (width != surface_get_width(application_surface) 
	|| height != surface_get_height(application_surface))
{
	display_set_gui_size(width, height);
	surface_resize(application_surface, width, height);
}
// view
if (camera_get_view_width(view_camera[0] != width)
	|| camera_get_view_height(view_camera[0] != height))
{
	camera_set_view_size(view_camera[0], 
		floor(overview ? room_width : width) * zoom,
		floor(overview ? room_height : height) * zoom);
}
// target
if (camera_get_view_target(view_camera[0]) != target)
	camera_set_view_target(view_camera[0], manual ? noone : target);
// port
if (view_wport != max_w || view_hport[0] != max_h)
{
	view_wport[0] = max_w;
	view_hport[0] = max_h;
}









