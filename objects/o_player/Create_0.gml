/// @description Init
scale = 0.5;
size = sprite_width * scale;
box = 6;
spd = 25;
max_spd = 4;
jump_spd = 30;
on_ground = false;
flip = false;
state = player_state.alive;
moving = false;
running = false;
sliding = false;
red = 0;
powerup = power_type.null;
power_time = 0;

//
t = 0.5;
timer = seconds(t);

// controls
left = ord("A");
right = ord("D");
duck = ord("S");
jump = vk_space;
shoot = ord("E");

// set fixture
var fix = physics_fixture_create_ext(scale, -1, -1, -1, -1);
physics_fixture_set_box_shape(fix, size / (box * scale), size / (box * scale));
fixture = physics_fixture_bind(fix, self);
physics_fixture_delete(fix);

jump_amount = jump_spd * phy_mass;

// ToDo: fix sliding for movement and push of other physics objects
phy_fixed_rotation = true;