/// @description Init
message = "";
countdown = -1;
color = c_white;

// game
saved_powerup = power_type.null;
status = game_state.null;
max_lives = 3;
difficulty = 0;
timer = seconds(300 - difficulty * 10);
level = 1;
oneup = level * 100;
lives = max_lives;
score = 0;

// create invisible walls
var //bottom = physics_fixture_create(), 
	left = physics_fixture_create(),
	right = physics_fixture_create();

//physics_fixture_set_edge_shape(bottom, 0, room_height, room_width, room_height);
physics_fixture_set_edge_shape(left, 0, 0, 0, room_height);
physics_fixture_set_edge_shape(right, room_width, 0, room_width, room_height);

//physics_fixture_bind(bottom, id);
physics_fixture_bind(left, id);
physics_fixture_bind(right, id);

//physics_fixture_delete(bottom);
physics_fixture_delete(left);
physics_fixture_delete(right);