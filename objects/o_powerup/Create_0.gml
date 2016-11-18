/// @description Init
type = power_type.large;//choose(power_type.large, power_type.fire, power_type.ice);

physics_apply_impulse(0, 0, choose(-5, 5), 0);

phy_fixed_rotation = true;