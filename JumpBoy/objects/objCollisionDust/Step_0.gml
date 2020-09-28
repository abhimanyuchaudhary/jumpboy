/// @description Insert description here
// You can write your code in this editor
image_index = random_range(side, side+1)
if(delay > 0){
	delay --;
}
else{
	image_xscale -= random_range(0.001, 0.1);
	image_yscale = image_xscale
	if(add_movement){
		x += random_range(-1, 1);
		y -= random_range(.25, 1);
	}
	if(image_xscale <= 0){
		instance_destroy();
	}
}