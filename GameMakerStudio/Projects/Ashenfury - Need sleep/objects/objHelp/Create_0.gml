draw_set_font(fnt_text);												// Menu font

global.help		= false;											// Variable for weather menu is shown or not
global.view_width	= camera_get_view_width(view_camera[0]);			// Get current width
global.view_height	= camera_get_view_height(view_camera[0]);			// Get current height

global.key_revert	= ord("X");											// Keybinds
global.key_enter	= vk_enter;
global.key_left		= vk_left;
global.key_right	= vk_right;
global.key_up		= vk_up;
global.key_down		= vk_down;

display_set_gui_size(global.view_width, global.view_height);			// Set menu to global height/width

//display help text and boxes here

inputting = false;