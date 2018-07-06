//debug = false;

// Randomize
randomize();

// Skip splash screen for now
room_goto_next();

blackAlpha = 0;
//spawnRoom = -1;
//spawnPlayerFacing = -1;
//doTransition = false;

enum dir {
	right = 0,
	up = 90,
	left = 180,
	down = 270,
}

// Delta Time
global.DeltaTime = 0;

global.gui_width = display_get_gui_width();
global.gui_height = display_get_gui_height();

//global.view_width	= camera_get_view_width(view_camera[0]);			// This should be here but it doesn't run globally for some reason
//global.view_height	= camera_get_view_height(view_camera[0]);		// So i left it in objmenu until I can figure it out

global.SpawnX = x;
global.SpawnY = y;

//instance_create_depth(global.SpawnX,global.SpawnY,0,objPlayer);
//instance_create_depth(inst_62DD02FD.x, inst_62DD02FD.y, 0, objPlayer);

// Window size
var _windowW = 1920;
var _windowH = 1080;
window_set_size(_windowW, _windowH);

// Center game window on screen
window_set_position(display_get_width() / 2 - _windowW / 2, display_get_height() / 2 - _windowH / 2);