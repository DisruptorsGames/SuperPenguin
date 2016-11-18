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

var max_w = display_get_width(), max_h = display_get_height(),
    aspect = window_get_fullscreen() ? (max_w / max_h) : (base_w / base_h);
// camera
width = aspect > 1 ? min(base_w, max_w) : (height * aspect);
height = aspect > 1 ? min(base_h, max_h) : (width / aspect);
// gui
display_set_gui_size(width, height);
// surface
surface_resize(application_surface, width, height);
// view
camera_set_view_size(view_camera[0], 
	floor(overview ? room_width : width) * zoom,
	floor(overview ? room_height : height) * zoom);
view_wport[0] = max_w;
view_hport[0] = max_h;

var target = instance_exists(o_generator) ? o_generator : o_player;
camera_set_view_target(view_camera[0], manual ? noone : target);
camera_set_view_pos(view_camera[0], manual ? camx : vx, manual ? camy : vy);









