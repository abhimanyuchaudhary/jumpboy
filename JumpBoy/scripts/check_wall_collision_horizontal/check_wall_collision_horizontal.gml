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
		var ColSide = sign(hspeed);
		hspeed = -initialHorizontalSpeed;
		isFalling = true;
		isJump = false;
		repeat(2){
			add_dust_effects(objPlayer, objCollisionDust, 1.5, ColSide*(25), 0)
		}
		var frameIndex = 0;
		if(sprite_index == spriteRightFall){
			frameIndex = image_index;
			sprite_index = spriteLeftFall;
			image_index = frameIndex;
		}else if(sprite_index == spriteLeftFall){
			frameIndex = image_index;
			sprite_index = spriteRightFall;
			image_index = frameIndex;
		}
		if(sprite_index == spriteRightJump){
			sprite_index = spriteRightFall;
		}else if(sprite_index == spriteLeftJump){
			sprite_index = spriteLeftFall;
		}
		
	}
	
	initialHorizontalSpeed = 0;
}