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