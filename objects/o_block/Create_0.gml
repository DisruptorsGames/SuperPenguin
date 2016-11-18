/// @description Init
has_powerup = irandom(100) < 50;
coins = has_powerup ? 0 : irandom(3);
spd = 4;
phy_ystart = phy_position_y;
cooldown = 30;
timer = 0;