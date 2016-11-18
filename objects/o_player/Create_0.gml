/// @description Init
scale = 0.5;
size = sprite_width * scale;
spd = 50;
max_spd = 6;
jump_spd = 30;
on_ground = false;
flip = false;
state = player_state.alive;
running = false;
//
powerup = o_controller.game.saved_powerup;
o_controller.game.saved_powerup = power_type.null;

// controls
left = ord("A");
right = ord("D");
duck = ord("S");
jump = vk_space;

// set fixture
var fix = physics_fixture_create_ext(scale, -1, -1, -1, -1);
physics_fixture_set_box_shape(fix, size / 3, size / 3);
fixture = physics_fixture_bind(fix, self);
physics_fixture_delete(fix);

jump_amount = jump_spd * phy_mass;

// ToDo: fix sliding for movement and push of other physics objects
phy_fixed_rotation = true;