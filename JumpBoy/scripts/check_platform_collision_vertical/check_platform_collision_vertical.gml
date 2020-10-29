if(place_meeting(x, y + vspeed, objMovingPlatform)){
	while(!place_meeting(x, y+sign(vspeed), objMovingPlatform)){
		y += sign(vspeed);
	}
	vspeed = 0;
	if(onTopPlatForm == true && platformHorizontalCollision != true){
		hspeed = objMovingPlatform.hspeed
	}
}