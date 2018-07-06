switch(argument0){
	case 0:
		window_set_size(640, 360);
		display_set_gui_size(global.view_width, global.view_height);			// Set menu to global height/width
		global.view_width	= camera_get_view_width(view_camera[0]);			// Get current width
		global.view_height	= camera_get_view_height(view_camera[0]);			// Get current height
	break;
	case 1:
		window_set_size(1280, 720);
		display_set_gui_size(global.view_width, global.view_height);			// Set menu to global height/width
		global.view_width	= camera_get_view_width(view_camera[0]);			// Get current width
		global.view_height	= camera_get_view_height(view_camera[0]);			// Get current height
	break;
	case 2:
		window_set_size(1920,1080);
		display_set_gui_size(global.view_width, global.view_height);			// Set menu to global height/width
		global.view_width	= camera_get_view_width(view_camera[0]);			// Get current width
		global.view_height	= camera_get_view_height(view_camera[0]);			// Get current height
	break;
	case 3:
		window_set_size(2560, 1440);
		display_set_gui_size(global.view_width, global.view_height);			// Set menu to global height/width
		global.view_width	= camera_get_view_width(view_camera[0]);			// Get current width
		global.view_height	= camera_get_view_height(view_camera[0]);			// Get current height
	break;
	case 4:
		window_set_size(3840, 2160);
		display_set_gui_size(global.view_width, global.view_height);			// Set menu to global height/width
		global.view_width	= camera_get_view_width(view_camera[0]);			// Get current width
		global.view_height	= camera_get_view_height(view_camera[0]);			// Get current height
	break;
}