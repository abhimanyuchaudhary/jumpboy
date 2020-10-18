//arguments [player]
x=argument0.x;
y=argument0.y;
hspeed=argument0.hspeed;
vspeed=argument0.vspeed;

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