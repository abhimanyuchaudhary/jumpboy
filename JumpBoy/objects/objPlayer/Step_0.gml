/// @description Insert description here
// You can write your code in this editor


if(speed != 0 and !onTopPlatForm){
	isMoving = true;
}
else{
	isMoving = false;
}
if(speed == 0){
	isExploding = false;
}

#region MOUSE MOVEMENT
initialHorizontalSpeed = 0;
if(mouse_check_button(mb_left) && isMoving == false){
	image_speed = 1;
	if(objPlayer.x <= mouse_x){
		sprite_index = spriteRightPreJump;
		while(place_meeting(x, y, objWall)){
			y += -1;
		}
	}else if(objPlayer.x > mouse_x){
		sprite_index = spriteLeftPreJump;
		while(place_meeting(x, y, objWall)){
			y += -1;
		}
	}
}
if(mouse_check_button_released(mb_left) and isMoving == false){
	dis = point_distance(x, y, mouse_x, mouse_y)
	dir = point_direction(x, y, mouse_x, mouse_y);
	dis = min(dis, 350)
	x_push = lengthdir_x(dis, dir);
	y_push = lengthdir_y(dis, dir);
	x_multiplier = .1
	y_multiplier = .1;
	vspeed = vspeed + y_push * y_multiplier;
	hspeed = hspeed + x_push * x_multiplier;
	isJump = true;
	add_dust_effects(objPlayer, objJumpingDust, 1.5, 0, 0)
	if(sign(hspeed)==1){
		sprite_index = spriteRightJump;
	}else if(sign(hspeed)==-1){
		sprite_index = spriteLeftJump;
	}
}




initialHorizontalSpeed = hspeed;

#endregion

#region HORIZONTAL MOVEMENT
//collision wall
check_wall_collision_horizontal()
//collision platform
check_platform_collision_horizontal()

//collision lava
check_lava_collision_horizontal()


#endregion

#region VERTICAL MOVEMENT
//checking if player is on top of something
var instanceWall = instance_place(x, y + 1, objWall)
if(instanceWall != noone){
		onTopWall = true
}
else{
	onTopWall = false
}
var instanceMovingPlatform = instance_place(x, y + 1, objMovingPlatform)
if(instanceMovingPlatform != noone){
		onTopPlatForm = true
}
else{
	onTopPlatForm = false
}
var instanceLava = instance_place(x, y + 1, objLava)
if(instanceLava != noone){
		onTopLava = true
}
else{
	onTopLava = false
}

vspeed += grav
//collision wall
check_wall_collision_vertical()
//collision platform
check_platform_collision_vertical()
//collision lava
check_lava_collision_vertical()

#endregion
if(isFalling && (sprite_index == spriteRightFall || sprite_index == spriteLeftFall)){
	if(image_index == image_number - 1){
		image_speed = 0;
		image_index = image_number - 1;
	}
}