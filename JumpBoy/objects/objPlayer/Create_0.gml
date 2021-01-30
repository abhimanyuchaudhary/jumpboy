/// @description Insert description here
// You can write your code in this editor

onTopWall = true;
isMoving = false;
isFalling = false;
isJump = false;

playerStartPosition = objPlayer.y
sprite_index = spriteRightIdle
max_speed = 12;
acel = 4;
decel = 100;

coefCollision = 1.5;
grav = 1;

vertical_speed = 0;
horizontal_speed = 0;

bounce = 0;

currState = states.standing
prevState = states.standing
vsp = 0;
hsp = 0;