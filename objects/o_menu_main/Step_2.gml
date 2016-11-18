/// @description Controls
if (keyboard_check(vk_enter) && !keyboard_check(vk_alt))
{
    var value = ds_list_find_value(menu, selection);
    switch (value)
    {
        case "Arcade":
            //var lvl = room_duplicate(r_level);
            room_set_background_color(room, o_controller.darker, true);
            room_goto(r_level);
            break;
        case "High Scores":
            //room_goto(r_highscores);
            break;
        case "Quit":
            game_end();
            break;
    }
}
