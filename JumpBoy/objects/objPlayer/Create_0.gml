/// @description Insert description here
// You can write your code in this editor

onTopWall = true;
onTopPlatForm = false;
onTopLava = false;
isMoving = false;
isExploding = false;
isFalling = false;
isJump = false;

playerStartPosition = objPlayer.y

max_speed = 12;
acel = 4;
decel = 100;

coefCollision = 1.5;
grav = 1;

vertical_speed = 0;
horizontal_speed = 0;

speed_gain_after_hitting_moving_platform = 7;
speed_gain_afteR_explosion = 1;

bounce = 0;

state = states.jumping