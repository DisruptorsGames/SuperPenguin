/// @function change_state
/// @param game_state
/// @param message
/// @param cooldown
var game = o_controller.game;
game.status = argument0;
game.message = argument1;
game.countdown = argument2 == -1 
	? o_controller.cooldown 
	: argument2;
// ToDo: add bosses?
if (game.status == game_state.win)
	game.level++;
