/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(fMenu);
	var offset = 2;
	var scoreText = score
	var highScoreText = highScore
	scoreText = string_insert("Score: ", scoreText, 0)
	highScoreText = string_insert("Record: ", highScoreText, 0)
	var col = c_white
	var xx = menu_x;
	var yy = menu_y;
	draw_set_color(c_black);
	draw_text(xx-offset, yy, scoreText );
	draw_text(xx+offset, yy, scoreText );
	draw_text(xx, yy+offset, scoreText );
	draw_text(xx, yy-offset, scoreText );
	draw_set_color(col)
	draw_text(xx, yy, scoreText );
	
	xx = menu_x;
	yy = menu_y + gui_margin;
	draw_set_color(c_black);
	draw_text(xx-offset, yy, highScoreText );
	draw_text(xx+offset, yy, highScoreText);
	draw_text(xx, yy+offset, highScoreText);
	draw_text(xx, yy-offset, highScoreText);
	draw_set_color(col)
	draw_text(xx, yy, highScoreText);
	

