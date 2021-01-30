horizontal_speed = hsp;
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
if(place_meeting(x+hsp, y, objWall)){
	while(!place_meeting(x+sign(hsp), y, objWall)){
		x += sign(hsp);
	}

	if(abs(hsp) > 0){ //actually falling
		var ColSide = sign(hsp);
		hsp = -horizontal_speed;
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
	else{
		//Normal Landing
	}

	show_debug_message("Horizontal");
	
	initialHorizontalSpeed = 0;
}