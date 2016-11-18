/// @description Init
#macro vw o_controller.width
#macro vh o_controller.height
#macro vx camera_get_view_x(view_camera[0])
#macro vy camera_get_view_y(view_camera[0])
#macro vt camera_get_view_target(view_camera[0])

enum game_state { null, win, lose, respawn }
enum player_state { dead, alive, falling, oot }
enum power_type { null, shrink, large, fire, ice }

global.debug = false;

//flags = phy_debug_render_coms | phy_debug_render_shapes;
flags = phy_debug_render_coms 
    | phy_debug_render_aabb 
    | phy_debug_render_collision_pairs 
    | phy_debug_render_obb;

randomize();

game = noone;
cooldown = seconds(3);
// camera
base_w = 1024;
base_h = 768;
width = base_w;
height = base_h;
zoom = 1;
rate = 0.1;
overview = false;
manual = false;
camx = 0;
camy = 0;
cam_spd = 8;
//
theme = make_color_elm();
make_color_shades(theme);

var sw = sprite_get_width(s_player), 
	sh = sprite_get_height(s_player);
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, width, height, 0, o_generator, -1, -1, (width - sw) / 2, (height - sh) / 2);
//
switch(room)
{
	case r_menu_main:
		instance_create_depth(0, 0, 0, o_menu_main);
		break;
	case r_level:
		game = instance_create_depth(0, 0, 0, o_arcade);
		instance_create_depth(0, 0, 50, o_generator);
		break;
}








