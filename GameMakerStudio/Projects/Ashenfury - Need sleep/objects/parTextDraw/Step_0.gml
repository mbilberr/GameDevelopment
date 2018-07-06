// If you want to interact further away from the target you can use collision_rectangle instead:
//radius = 32; //you could put this in the Create event of NPCs
//collision_rectangle(x-radius, y-radius, x+radius, y+radius, your_npc_obj_name, false, true);﻿

if (place_meeting(x, y, objPlayer)) {
    // only 1 text box
	if(keyboard_check_pressed(vk_space)){
    if (myTextbox == noone) {
        myTextbox = instance_create_layer(x, y, "Text", objTextBox);
        myTextbox.text = myText;
		myTextbox.creator = self;
		myTextbox.name = myName;
    }
	}
} else {
    if (myTextbox != noone) {
        instance_destroy(myTextbox);
        myTextbox = noone;
    }
}