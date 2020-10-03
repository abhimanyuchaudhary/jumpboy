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
	if(objPlayer.x <= mouse_x){
		sprite_index = spriteRightPreJump;
	}else if(objPlayer.x > mouse_x){
		sprite_index = spriteLeftPreJump;
	}
}
if(mouse_check_button_released(mb_left) and isMoving == false){
	dis = point_distance(x, y, mouse_x, mouse_y)
	dir = point_direction(x, y, mouse_x, mouse_y);
	dis = min(dis, 300)
	x_push = lengthdir_x(dis, dir);
	y_push = lengthdir_y(dis, dir);
	x_multiplier = .1;
	y_multiplier = .1;
	vspeed = vspeed + y_push * y_multiplier;
	hspeed = hspeed + x_push * x_multiplier;
	isJump = true;
		//var xx = x + random_range(-16, 16);
		//var yy = y + random_range(12, 18);
		var obj = instance_create_layer(x, y, "DustEffects", objJumpingDust)
		obj.image_xscale = 1.5;
		obj.image_yscale = 1.5;
		obj.add_movement = true;
		obj.delay = 0;
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
if(place_meeting(x+hspeed, y, objWall)){
	while(!place_meeting(x+sign(hspeed), y, objWall)){
		x += sign(hspeed);
	}
	if(isExploding == true){
		hspeed = -initialHorizontalSpeed
	}
	else{
		var ColSide = sign(hspeed)
		hspeed = -initialHorizontalSpeed;
		isFalling = true;
		isJump = false;
		repeat(4){
			var xx = x + random_range(-16, 16);
			var yy = y //+ random_range(12, 18);
			var obj = instance_create_layer(xx, yy, "DustEffects", objCollisionDust)
			obj.image_xscale = 1.5;
			obj.image_yscale = 1.5;
			obj.side = ColSide+1
			obj.add_movement = true;
			obj.delay = 0;
		}
		if(sprite_index == spriteRightJump){
		sprite_index = spriteLeftJump;
		}else if(sprite_index == spriteLeftJump){
			sprite_index = spriteRightJump;
		}
	}
	
	initialHorizontalSpeed = 0;
}
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
if(place_meeting(x, y + vspeed, objWall)){
	while(!place_meeting(x, y+sign(vspeed), objWall)){
		y += sign(vspeed);
		if(sign(vspeed)==-1){
			vspeed=0;
			hspeed=0;
			isFalling=false;
			break;
		}
	}
	if(vspeed > grav and !isFalling){
		//var xx = x + random_range(-16, 16);
		//var yy = y + random_range(12, 18);
		var obj = instance_create_layer(x, y+25, "DustEffects", objLandingDust)
		obj.image_xscale = 2;
		obj.image_yscale = 2;
		obj.add_movement = true;
		obj.delay = 0;
		isJump = false;
		if(sprite_index == spriteRightJump){
			sprite_index = spriteRightIdle;
		}else if(sprite_index == spriteLeftJump){
			sprite_index = spriteLeftIdle;
		}
	}
	else if(isFalling){
		var obj = instance_create_layer(x, y, "DustEffects", objJumpingDust)
		obj.image_xscale = 0.8;
		obj.image_yscale = 0.8;
		obj.add_movement = true;
		obj.delay = 0;
	}
	vspeed = 0;
	if(abs(hspeed)<0.5){
		bounce = 0;
		hspeed = 0;
		vspeed = 0;
		isFalling = false;
	}else if(abs(hspeed)<=5 && abs(hspeed)>=0.5){
		if(bounce == 1){
		bounce = 0;
		hspeed = 0;
		isFalling = false;
		}
	}else if(abs(hspeed)<=16 && abs(hspeed)>5){
		if(bounce == 2){
			bounce = 1;
			hspeed = 0;
			isFalling = false;
		}
	}else if(abs(hspeed)>16){
		if(bounce == 3){
			bounce = 1;
			hspeed = 0;
			isFalling = false;
		}
	}
	if(isFalling){
		hspeed = hspeed/coefCollision;
		vspeed = -15/(bounce + 1);
		bounce ++;
		if(bounce>3){
			bounce=0;
			isFalling = false;
		}
	}
	if(sprite_index == spriteRightJump){
			sprite_index = spriteRightIdle;
		}else if(sprite_index == spriteLeftJump){
			sprite_index = spriteLeftIdle;
		}
	else{
		hspeed = 0;
	}
}
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