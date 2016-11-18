/// @description Game HUD

var lighter = o_controller.lighter, 
	lifecolor = instance_exists(o_player) ? o_player.image_blend : c_white;

// countdown
if (!instance_exists(o_player) && countdown > 0)
{
    var time = round(countdown / room_speed);
    draw_banner(message, "(" + string(time) + ")", c_black, lighter, 64);
}

// lives
for (var i = 0; i < lives; i++)
{
	var scale = 0.5, size = sprite_get_width(s_player)  * scale,
		col = merge_color(c_red, lifecolor, lives / max_lives);
	draw_sprite_ext(s_player, 0, 16 + size / 2 + i * (size + 2), size, scale, scale, 0, col, 1);
}

// saved powerup
var cx = vw / 2, size = sprite_get_width(s_powerup);
draw_rectangle_color(cx, 16, cx + size, 16 + size, lighter, lighter, lighter, lighter, true);
if (saved_powerup != power_type.null)
	draw_sprite_ext(s_powerup, 0, cx + size / 2, 16 + size / 2, 1, 1, 0, c_white, 1);

// game time
var game_time = "TIME\n" + string(round(timer / room_speed));
draw_text_color(vw / 2 + string_width(game_time), 16, game_time, lighter, lighter, lighter, lighter, 1);

// score
var text = "X" + string(string_format(score, 4, 0)) + "\nW: " + string(level);
draw_sprite_ext(s_coin, 0, vw - 64, 0, 0.25, 0.25, 0, c_white, 1);
draw_set_halign(fa_right);
draw_text_color(vw - string_width(text), 16, text, lighter, lighter, lighter, lighter, 1);
draw_set_halign(-1);
