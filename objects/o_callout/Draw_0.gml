/// @description Display Text
if (string_length(text) > 0)
{
	draw_set_halign(fa_center);
	draw_text_color(x, y, text, image_blend, image_blend, image_blend, image_blend, image_alpha);
	draw_set_halign(-1);
}