if(place_meeting(x, y + vsp, objWall)){
	while(!place_meeting(x, y+sign(vsp), objWall)){
		y += sign(vsp);
	}
	if(sign(vsp)==-1){
		show_debug_message("Vertical");
		show_debug_message(place_meeting(x, y + vsp, objWall))
		vsp=0;
		return
	}
	//Landing cases
	if(vspeed > grav and !isFalling){
		add_dust_effects(objPlayer, objLandingDust, 2, 0, 22)
		isJump = false;
	}
	else if(isFalling){
		add_dust_effects(objPlayer, objLandingDust, 0.8, 0, 0)
	}
	
	
	if(sprite_index == spriteRightJump){
		sprite_index = spriteRightIdle;
	}else if(sprite_index == spriteLeftJump){
		sprite_index = spriteLeftIdle;
	}
	vsp = 0;
	
	if(isFalling){
		hsp = hsp/coefCollision;

		vsp = -15/(bounce + 1);
		bounce ++;
		if(bounce>3){
			bounce=0;
			isFalling = false;
		}
		
	}
	else{
		hsp = 0;
		if(sprite_index == spriteRightFall){
			sprite_index = spriteRightIdle;
		}else if(sprite_index == spriteLeftFall){
			sprite_index = spriteLeftIdle;
		}
	}
	
}