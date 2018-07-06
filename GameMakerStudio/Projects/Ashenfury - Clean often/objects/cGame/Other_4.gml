if (!instance_exists(objPlayer))
    instance_create_depth(global.SpawnX, global.SpawnY, 0, objPlayer);

// Set the camera 
view_visible[0] = true;
view_wport[0] = 640; // actual camera resolution
view_hport[0] = 360; // actual camera resolution
camera_set_view_size(view_camera[0], view_wport[0], view_hport[0]);
camera_set_view_target(view_camera[0], objPlayer); //follow the player
camera_set_view_border(view_camera[0], view_wport[0] / 2, view_hport[0] / 2); // keep player centered

