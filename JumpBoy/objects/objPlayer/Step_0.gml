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
horizontal_speed = hspeed;
//friction
/*if(place_meeting(x, y + 1, objWall) || place_meeting(x, y - 1, objWall)){
	if(hspeed > decel){
		hspeed -= decel;
	}else if(hspeed < - decel){
		hspeed += decel
	} else{
		hspeed = 0;
		initialHorizontalSpeed = 0;
	}
}*/

//collision wall
//collision platform
var platformHorizontalCollision = false
if(place_meeting(x+hspeed, y, objMovingPlatform)){
	while(!place_meeting(x+sign(hspeed), y, objMovingPlatform)){
		x += sign(hspeed);
	}
	hspeed = (sign(objMovingPlatform.hspeed) * abs(speed_gain_after_hitting_moving_platform) + 3*objMovingPlatform.hspeed)
	initialHorizontalSpeed = hspeed
	platformHorizontalCollision = true
	isJump = false;
}

//collision lava
if(place_meeting(x+hspeed, y, objLava)){
	while(!place_meeting(x+sign(hspeed), y, objLava)){
		x += sign(hspeed);
	}
	var randomDirection = random_range(90, 270);
	if(place_meeting(x-1, y, objLava)){
		randomDirection -= 180
	}
	speed = speed_gain_afteR_explosion*speed;
	direction = randomDirection
	initialHorizontalSpeed = speed;
	isExploding = true;
	isJump = false;
}


#endregion

#region VERTICAL MOVEMENT
//collision wall
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

//collision platform
if(place_meeting(x, y + vspeed, objMovingPlatform)){
	while(!place_meeting(x, y+sign(vspeed), objMovingPlatform)){
		y += sign(vspeed);
	}
	vspeed = 0;
	if(onTopPlatForm == true && platformHorizontalCollision != true){
		hspeed = objMovingPlatform.hspeed
	}
}
//collision lava
if(place_meeting(x, y + vspeed, objLava)){
	while(!place_meeting(x, y+sign(vspeed), objLava)){
		y += sign(vspeed);
	}
	var randomDirection = random_range(0, 180);
	if(place_meeting(x, y - 1, objLava)){
		randomDirection += 180
	}
	speed = speed_gain_afteR_explosion*speed;
	direction = randomDirection
	initialHorizontalSpeed = speed;
	isExploding = true;
}

#endregion
wall_collision(objPlayer);
if(isFalling && (sprite_index == spriteRightFall || sprite_index == spriteLeftFall)){
	if(image_index == image_number - 1){
		image_speed = 0;
		image_index = image_number - 1;
	}
}