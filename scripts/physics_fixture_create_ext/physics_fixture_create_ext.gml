/// @function physics_fixture_create_ext
/// @param density
/// @param restitution
/// @param angular_damping
/// @param linear_damping
/// @param friction
var density = argument0, restitution = argument1, 
	angular_damping = argument2, linear_damping = argument3,
	fric = argument4, fix = physics_fixture_create();
physics_fixture_set_density(fix, density == -1 ? 0.5 : density);
physics_fixture_set_restitution(fix, restitution == -1 ? 0.1 : restitution);
physics_fixture_set_angular_damping(fix, angular_damping == -1 ? 0.1 : angular_damping);
physics_fixture_set_linear_damping(fix, linear_damping == -1 ? 0.1 : linear_damping);
physics_fixture_set_friction(fix, fric == -1 ? 0.2 : fric);
return fix;
/*fixture = physics_fixture_bind(fix, self);
physics_fixture_delete(fix);
return fixture;*/