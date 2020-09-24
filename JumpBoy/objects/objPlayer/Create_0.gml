/// @description Insert description here
// You can write your code in this editor
key_left = ord("A")
key_right = ord("D")
key_up = ord("W")
key_down = ord("S")

onTopWall = true;
onTopPlatForm = false;
onTopLava = false;
isMoving = false;
isExploding = false;
isFalling = false;

max_speed = 12;
acel = 4;
decel = 1;

coefCollision = 3;
grav = 1;

vertical_speed = 0;
horizontal_speed = 0;

speed_gain_after_hitting_moving_platform = 7;
speed_gain_afteR_explosion = 1;