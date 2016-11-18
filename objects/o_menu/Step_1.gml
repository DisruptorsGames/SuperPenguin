/// @description Controls

// select
if (keyboard_check_pressed(vk_up))
{
    // up
    if (selection > 0)
        selection--;
}
else if (keyboard_check_pressed(vk_down))
{
    // down
    if (selection < ds_list_size(menu) - 1)
        selection++;
}
