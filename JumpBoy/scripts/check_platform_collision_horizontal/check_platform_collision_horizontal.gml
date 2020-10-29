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