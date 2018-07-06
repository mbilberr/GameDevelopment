if(keyboard_check_pressed(ord("I"))) { show_inventory = !show_inventory; }

if(!show_inventory) exit;

#region Mouse

mousex = device_mouse_x_to_gui(0);										// Get mouse x/y in viewport
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (cell_size+x_buffer)*1;								// Changed scale to 1
var cell_ybuff = (cell_size+x_buffer)*1;								// Changed scale to 1

var i_mousex = mousex - slots_x;										//
var i_mousey = mousey - slots_y;

var nx = i_mousex div cell_xbuff;										// Get slot number use div instead of / to get whole numbers
var ny = i_mousey div cell_ybuff;

//draw_text_color(100,100, "cell_xbuff" + cell_xbuff + "i_mousex" + i_mousex + "nx" + nx + "m_slotx" + m_slotx, c, c,c,c,1)

if( nx >= 0 and nx < inv_slots_width and ny >= 0 and ny < inv_slots_height and i_mousey > 0 and i_mousex > 0){
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_xbuff);
	
	if((sx < cell_size * 1) and (sy < cell_size * 1)){					// replaced scale with 1
		m_slotx = nx;													// Slot x/y coordinates for mouse hover
		m_sloty = ny;

	}
}

selected_slot = min(inv_slots - 1, m_slotx + (m_sloty*inv_slots_width));	// Set selected slot to mouse position

#endregion

#region Inventory stacking

// pickup item
var inv_grid = ds_inventory;
var ss_item = inv_grid[# 0, selected_slot];								// Get selected_item from inventory grid

if(pickup_slot != -1){
	if(mouse_check_button_pressed(mb_left)){
		if(ss_item == item.none){
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];	// stacking logic
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			inv_grid[# 0, pickup_slot] = item.none;
			inv_grid[# 1, pickup_slot] = 0;
			pickup_slot = -1;
		} else if (ss_item == inv_grid[# 0, pickup_slot]) {
			if(selected_slot != pickup_slot){
				inv_grid[# 1, selected_slot] += inv_grid[# 1, pickup_slot];	// Stacking
				inv_grid[# 0, pickup_slot] = item.none;
				inv_grid[# 1, pickup_slot] = 0;
			}
			pickup_slot = -1;
		} else {
			var ss_item_num = inv_grid[# 1, selected_slot];				// Swapping
			inv_grid[# 0, selected_slot] = inv_grid[# 0, pickup_slot];	
			inv_grid[# 1, selected_slot] = inv_grid[# 1, pickup_slot];
			inv_grid[# 0, pickup_slot] = ss_item;
			inv_grid[# 1, pickup_slot] = ss_item_num;
			//pickup_slot = -1;
		}
	}
}
else if(ss_item != item.none){
	if(mouse_check_button_pressed(mb_middle)){							// Put item in gameworld
		inv_grid[# 1, selected_slot] -= 1;
		if(inv_grid[# 1, selected_slot] == 0) {
			inv_grid[# 0, selected_slot] = item.none;
		}
		// create the item
		var inst = instance_create_layer(objPlayer.x, objPlayer.y, "Instances", objItem);
		with(inst){
			item_num = ss_item;
			x_frame = item_num mod (spr_width/cell_size);
			x_frame = item_num div (spr_width/cell_size);
		}
		show_debug_message("Item dropped.");
	}
	if(keyboard_check_pressed(ord("E"))){								// Drop pickup item into new slow
		pickup_slot = selected_slot;
	}
}
#endregion