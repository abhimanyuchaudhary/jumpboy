/// @description Insert description here
// You can write your code in this editor

draw_set_font(fMenu);
	var offset = 2;
	var txt = score
	var col = c_white
	var xx = menu_x;
	var yy = menu_y;
	draw_set_color(c_black);
	draw_text(xx-offset, yy, txt);
	draw_text(xx+offset, yy, txt);
	draw_text(xx, yy+offset, txt);
	draw_text(xx, yy-offset, txt);
	draw_set_color(col)
	draw_text(xx, yy, txt);

