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