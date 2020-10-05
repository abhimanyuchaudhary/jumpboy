/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_white);
if(mouse_check_button(mb_left) and isMoving == false){
dir = point_direction(x, y, mouse_x, mouse_y);
dis = point_distance(x, y, mouse_x, mouse_y)
dis = min(dis, 350)
time_addition = 3
time = time_addition;
x_push = lengthdir_x(dis, dir) * 0.1;
y_push = lengthdir_y(dis, dir) * 0.1;
var num_dots = 4;
	for(var i = 0; i < num_dots; i++){
		xx1 = x + x_push*time;
		yy1 = y + y_push*time + ((time*time)/2);
		time += time_addition
		if(i < num_dots-1){
			draw_sprite(spriteDirectionDot, -1, xx1, yy1)
		}
		else{
			xxnew = x + x_push*time;
			yynew = y + y_push*time + ((time*time)/2);
			arrow_dir = point_direction(xx1, yy1, xxnew, yynew)
			draw_sprite_ext(spriteDirectionArrow, 01, xx1, yy1, 1, 1, arrow_dir-90 ,c_white, 1)
		}
		
	}

}
