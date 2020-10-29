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
		add_dust_effects(objPlayer, objLandingDust, 2, 0, 22)
		isJump = false;
	}
	else if(isFalling){
		add_dust_effects(objPlayer, objLandingDust, 0.8, 0, 0)
	}
	if(sprite_index == spriteRightJump){
		sprite_index = spriteRightIdle;
		while(place_meeting(x, y, objWall)){
			y += -1;
		}
	}else if(sprite_index == spriteLeftJump){
		sprite_index = spriteLeftIdle;
		while(place_meeting(x, y, objWall)){
			y += -1;
		}
	}
	vspeed = 0;
	if(abs(hspeed)<0.5){
		bounce = 0;
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
	else{
		hspeed = 0;
		if(sprite_index == spriteRightFall){
			sprite_index = spriteRightIdle;
			while(place_meeting(x, y, objWall)){
				y += -1;
			}
		}else if(sprite_index == spriteLeftFall){
			sprite_index = spriteLeftIdle;
			while(place_meeting(x, y, objWall)){
				y += -1;
			}
		}
	}
	
}