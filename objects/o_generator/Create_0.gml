/// @description Init
width = 32;
height = 32;
ground = layer_get_id("Ground");
world = layer_get_id("World");
background = layer_get_id("Background");
clean = false;

offset = width * max(o_controller.game.difficulty, 1);
bottom = vh - height;

data = ds_grid_create(room_width / width, room_height / height);

//room_speed = 10;
alarm[0] = 1;