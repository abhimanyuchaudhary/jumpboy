/// @description Insert description here
// You can write your code in this editor
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = gui_width; //+ 200;
menu_y = gui_height/2;
menu_x_target = gui_width/2
menu_speed = 25;
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_commited = -1;
menu_control = true;

menu[1] = "Start";
menu[0] = "Quit";

menu_items = array_length_1d (menu)
menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items)
menu_cursor = 1