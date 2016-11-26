/// @description Game HUD

if (!underground)
	effect_create_above(ef_snow, x, y, 0, c_white);

var color = o_controller.complimentary, 
	lifecolor = instance_exists(o_player) ? o_player.image_blend : c_white;

// countdown
if (!instance_exists(o_player) && countdown > 0)
{
    var time = round(countdown / room_speed);
    draw_banner(message, "(" + string(time) + ")", o_controller.darker, color, 64);
}

// lives
for (var i = 0; i < lives; i++)
{
	var scale = 0.5, size = sprite_get_width(s_player) * scale,
		col = merge_color(c_red, lifecolor, lives / max_lives);
	draw_sprite_ext(s_player, 0, 16 + size / 2 + i * (size + 2), size, scale, scale, 0, col, 1);
}

// saved powerup
var cx = vw / 2, size = sprite_get_width(s_powerup) * 2;
for (var i = 0; i < 8; i++)
{
	draw_rectangle_color(cx + i, 16 + i, cx + size - i, 16 + size - i, color, color, color, color, true);
}
if (saved_powerup != power_type.null)
	draw_sprite_ext(s_powerup, 0, cx + size / 2, 16 + size / 2, 2, 2, 0, color, 0.75);

draw_set_font(f_hud);

// game time
var game_time = "TIME\n" + string(round(timer / room_speed));
draw_text_color(vw / 2 + string_width(game_time) + 16, 16, game_time, color, color, color, color, 1);

// score
var total_coins = "X" + string_replace_all(string_format(score, 4, 0), " ", "0"),
	zone = "World: " + string(world) + "x" + string(level);
draw_sprite_ext(s_coin, 0, vw - string_width(total_coins) - 32, 24 + sprite_get_height(s_coin) / 2, 2, 2, 0, c_white, 1);
draw_set_halign(fa_right);
draw_text_color(vw - 16, 16, total_coins, color, color, color, color, 1);
draw_text_color(vw - 16, 16 + string_height(zone) + 4, zone, color, color, color, color, 1);
draw_set_halign(-1);

draw_set_font(-1);