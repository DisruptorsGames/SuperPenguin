/// @description Init
t = 3;
timer = seconds(irandom(t));
on_ground = false;
stomped = false;

image_speed = 0;
sprite_index = irandom(100) < o_controller.game.difficulty * 2 ? s_polarbear : s_goomba;

var fix = physics_fixture_create_ext(1, -1, -1, -1, -1);
physics_fixture_set_box_shape(fix, sprite_width / 3, sprite_height / 3);
fixture = physics_fixture_bind(fix, self);
physics_fixture_delete(fix);

spd = phy_mass * 10;

phy_fixed_rotation = true;