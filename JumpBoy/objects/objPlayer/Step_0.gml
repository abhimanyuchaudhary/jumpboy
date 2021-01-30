/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x, y, objWall)){
	for(var index = 0; index < 1000; index++){
		if(!place_meeting(x+index, y, objWall)){
			objPlayer.x = x+index
			break;
		}
		if(!place_meeting(x-index, y, objWall)){
			objPlayer.x = x-index
			break;
		}
		if(!place_meeting(x, y+index, objWall)){
			objPlayer.y = y+index
			break;
		}
		if(!place_meeting(x, y-index, objWall)){
			objPlayer.y = y-index
			break;
		}
		if(!place_meeting(x+index, y+index, objWall)){
			objPlayer.x = x+index
			objPlayer.y = y+index
			break;
		}
		if(!place_meeting(x+index, y-index, objWall)){
			objPlayer.x = x+index
			objPlayer.y = y-index
			break;
		}
		if(!place_meeting(x-index, y+index, objWall)){
			objPlayer.x = x-index
			objPlayer.y = y+index
			break;
		}
		if(!place_meeting(x-index, y-index, objWall)){
			objPlayer.x = x-index
			objPlayer.y = y-index
			break;
		}
	}
}

if(hsp != 0 or vsp!=0){
	isMoving = true;
}
else{
	isMoving = false;
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
	vsp = vsp + y_push * y_multiplier;
	hsp = hsp + x_push * x_multiplier;
	isJump = true;
	add_dust_effects(objPlayer, objJumpingDust, 1.5, 0, 0)
	if(sign(hspeed)==1){
		sprite_index = spriteRightJump;
	}else if(sign(hspeed)==-1){
		sprite_index = spriteLeftJump;
	}
}

y = y + vsp;
x = x + hsp;

initialHorizontalSpeed = hsp;

#endregion

#region HORIZONTAL MOVEMENT
//collision wall
check_wall_collision_horizontal()


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


vsp += grav
//collision wall
check_wall_collision_vertical()

#endregion
if(isFalling && (sprite_index == spriteRightFall || sprite_index == spriteLeftFall)){
	if(image_index == image_number - 1){
		image_speed = 0;
		image_index = image_number - 1;
	}
}