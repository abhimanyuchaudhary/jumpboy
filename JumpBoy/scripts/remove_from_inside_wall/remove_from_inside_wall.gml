//argument playerTemp, wallTemp
playerTemp = argument0
wallTemp = argument1
if(place_meeting(playerTemp.x, playerTemp.y, wallTemp)){
	for(var index = 0; index < 1000; index++){
		if(!place_meeting(playerTemp.x+index, playerTemp.y, wallTemp)){
			playerTemp.x = playerTemp.x+index
			break;
		}
		if(!place_meeting(playerTemp.x-index, playerTemp.y, wallTemp)){
			playerTemp.x = playerTemp.x-index
			break;
		}
		if(!place_meeting(playerTemp.x, playerTemp.y+index, wallTemp)){
			playerTemp.y = playerTemp.y+index
			break;
		}
		if(!place_meeting(playerTemp.x, playerTemp.y-index, wallTemp)){
			playerTemp.y = playerTemp.y-index
			break;
		}
		if(!place_meeting(playerTemp.x+index, playerTemp.y+index, wallTemp)){
			playerTemp.x = playerTemp.x+index
			playerTemp.y = playerTemp.y+index
			break;
		}
		if(!place_meeting(playerTemp.x+index, playerTemp.y-index, wallTemp)){
			playerTemp.x = playerTemp.x+index
			playerTemp.y = playerTemp.y-index
			break;
		}
		if(!place_meeting(playerTemp.x-index, playerTemp.y+index, wallTemp)){
			playerTemp.x = playerTemp.x-index
			playerTemp.y = playerTemp.y+index
			break;
		}
		if(!place_meeting(playerTemp.x-index, playerTemp.y-index, wallTemp)){
			playerTemp.x = playerTemp.x-index
			playerTemp.y = playerTemp.y-index
			break;
		}
	}
}