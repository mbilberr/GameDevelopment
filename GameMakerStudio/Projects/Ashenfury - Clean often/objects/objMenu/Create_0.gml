draw_set_font(fnt_text);												// Menu font

global.pause		= false;											// Variable for weather menu is shown or not
global.view_width	= camera_get_view_width(view_camera[0]);			// Get current width
global.view_height	= camera_get_view_height(view_camera[0]);			// Get current height

global.key_revert	= ord("X");											// Keybinds
global.key_enter	= vk_enter;
global.key_left		= vk_left;
global.key_right	= vk_right;
global.key_up		= vk_up;
global.key_down		= vk_down;

display_set_gui_size(global.view_width, global.view_height);			// Set menu to global height/width

enum menu_page {
	main,																// 0
	settings,															// 1
	audio,																// 2
	difficulty,															// 3
	graphics,															// 4
	controls,															// 5
	height																// 6
}

enum menu_element_type {
	script_runner,														// 1
	page_transfer,														// 2
	slider,																// 3
	shift,																// 4
	toggle,																// 5
	input																// 6
}

// Menu pages
ds_menu_main = create_menu_page(
	["RESUME",		menu_element_type.script_runner,	resume_game], 
	["SETTINGS",	menu_element_type.page_transfer,	menu_page.settings],
	["EXIT",		menu_element_type.script_runner,	exit_game]
);

ds_settings = create_menu_page(
	["AUDIO",		menu_element_type.page_transfer,	menu_page.audio],
	["DIFFICULTY",	menu_element_type.page_transfer,	menu_page.difficulty], 
	["GRAPHICS",	menu_element_type.page_transfer,	menu_page.graphics], 
	["CONTROLS",	menu_element_type.page_transfer,	menu_page.controls], 
	["BACK",		menu_element_type.page_transfer,	menu_page.main]
);

ds_menu_audio = create_menu_page(
	["MASTER",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["SOUNDS",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["MUSIC",		menu_element_type.slider,			change_volume,			1,		[0,1]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_difficulty = create_menu_page(
	["ENEMIES",		menu_element_type.shift,			change_difficulty,		0,		["HARMLESS","NORMAL", "TERRIBLE"]], 
	["ALLIES",		menu_element_type.shift,			change_difficulty,		0,		["DIM-WITTED", "NORMAL", "HELPFUL"]],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_graphics = create_menu_page(
	["RESOLUTION",	menu_element_type.shift,			change_resolution,		0,		["384 x 216", "768 x 432", "1152 x 648", "1536 x 874", "1920 x 1080"]],
	["WINDOW MODE",	menu_element_type.toggle,			change_window_mode,		1,		["FULLSCREEN", "WINDOWED"]], 
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

ds_menu_controls = create_menu_page(
	["UP",			menu_element_type.input,			"key_up",				vk_up],
	["LEFT",		menu_element_type.input,			"key_left",				vk_left],
	["RIGHT",		menu_element_type.input,			"key_right",			vk_right],
	["DOWN",		menu_element_type.input,			"key_down",				vk_down],
	["BACK",		menu_element_type.page_transfer,	menu_page.settings]
);

// Draw page 0 and load the others
page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_menu_audio, ds_menu_difficulty, ds_menu_graphics, ds_menu_controls]

// Display selected page (I think)
var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false;

audio_group_load(audiogroup_music);
audio_group_load(audiogroup_soundfx);