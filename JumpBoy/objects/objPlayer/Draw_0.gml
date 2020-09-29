/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_color(c_white);
if(mouse_check_button(mb_left)){
dir = point_direction(x, y, mouse_x, mouse_y);
dis = point_distance(x, y, mouse_x, mouse_y)
dis = min(dis, 300)
xx = x + lengthdir_x(dis, dir);
yy = y + lengthdir_y(dis, dir);
draw_line(x, y, xx, yy);

}
