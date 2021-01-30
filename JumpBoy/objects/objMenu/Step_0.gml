/// @description Insert description here
// You can write your code in this editor

//item ease in 
menu_x = (menu_x_target);

//beyboard controls
if(menu_control)
{

	var mouse_y_gui = device_mouse_y_to_gui(0)
	if(mouse_y_gui < menu_y and mouse_y_gui > menu_top){
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5)
	}
	if(mouse_check_button_pressed(mb_left)){
		menu_x_target = gui_width + 200;
		menu_commited = menu_cursor;
		menu_control = false;
	}
}

if(menu_x > gui_width + 150 and (menu_commited != -1)){
	if(menu_commited == 0){
		game_end()
	}
	else if(menu_commited == 1){
		room_goto_next()
	}
}