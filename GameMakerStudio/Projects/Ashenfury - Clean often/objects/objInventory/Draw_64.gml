var info_grid = ds_player_info;
#region Top info bar
var info_grid = ds_player_info;
var x1,x2,y1,y2;										// Draw rectangle for currency and clock
x1 = camera_get_view_x(0);								// Rectangle leftmost draw position
x2 = x1 + camera_get_view_width(0);						// Rectangle rightmost x position
y1 = camera_get_view_y(0);								// Ractangle top y position
y2 = y1 + global.gui_height * 0.05;						// Rectangle bottom y position (height)
draw_set_color(c_black);								// Set draw color
draw_set_alpha(0.8);									// Add some transparency
draw_rectangle(x1,y1,x2,y2,0);							// Draw rectangle
draw_set_alpha(1);										// Back to full opacity

draw_set_font(fnt_text);								// Set font
var c = c_yellow;										// Font color

draw_text_color(										// Prints name in rectangle
	global.gui_width * 0.05,							// x
	y2 - string_height(info_grid),						// y
	info_grid[# 0, 3] + ": " + info_grid[# 1, 3],		// string
	c,c,c,c,											// c,c,c,c
	1													// alpha
);

draw_set_font(fnt_text);								// Set font

var yy = 0; repeat(3){									// Repeat 3x for each currency (gold/silver/copper)
	draw_text_color(info_x + (192*1) + ((15+18)*1*yy),	// Text draw x
	y2 - string_height(info_grid),						// Text draw y
	string(info_grid[# 1, yy]),							// Text draw string
	c,c,c,c,											// c,c,c,c
	1);													// Alpha
	yy += 1;
}

var c = c_black;										// Font color back to normal
draw_set_color(c_white);								// Set draw color

#endregion;

#region Show inventory
if(!show_inventory) exit;								// Toggles inventory

// Draw inventory background
draw_sprite_part_ext(									// draw_sprite(spr_inv_UI, 0, inv_UI_x, inv_UI_y);
	spr_inv_UI,											// Sprite
	0,													// Subimage
	0,													// Left
	0,													// Top
	inv_UI_width, inv_UI_height,						// Width, height
	inv_UI_x, inv_UI_y,									// X, Y
	1, 1,												// X scale, Y scale
	c_white, 1											// Color, alpha
);

//var info_grid = ds_player_info;

// Inventory calculations/draw
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;		// ii = current item index, ix/iy = cell of inventory, sx/sy are sprite coordinates on the tiled page
ii = 0; ix = 0; iy = 0; inv_grid = ds_inventory;

repeat(inv_slots){										// XY Coords for inventory slots
	xx = slots_x + ((cell_size+x_buffer)*ix*1);			// Calculates XY coords to print items into inventory slots. Not sure what ix/iy is doing.
	yy = slots_y + ((cell_size+y_buffer)*iy*1);			// Replaced scale with 1
	
	//Item
	iitem = inv_grid[# 0, ii];							// Dynamically reads item from enum. iitem 
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	
	//Draw Slot and Item
	draw_sprite_part_ext(spr_inv_UI, 0, 9, 8, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);

	switch(ii){
		case selected_slot:
			if(iitem > 0){
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
				gpu_set_blendmode(bm_add);
				draw_sprite_part_ext(spr_inv_UI, 0, 9, 8, cell_size, cell_size, xx, yy, 1, 1, c_white, 0.3);				// Draws white highlight
				gpu_set_blendmode(bm_normal);
			}
		break;
		
		case pickup_slot:
			if(iitem > 0){
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 0.5);
			}
		break;
		
		default:
			if (iitem > 0){
				draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1);
			}
		break;
	}
	
	//if(iitem > 0) draw_sprite_part_ext(spr_inv_items, ii, sx, sy, cell_size, cell_size, xx, yy, 1, 1, c_white, 1); // Replaced scale with 1
	
	//Draw item Number
	if(iitem > 0){
		var number = inv_grid[# 1, ii];
		draw_text_color(xx, yy, string(number), c,c,c,c, 1);
	}
	
	//Increment
	ii += 1;
	ix = ii mod inv_slots_width;				// ii divided by inv_slots_width. This is calculating where in the inventory to draw
	iy = ii div inv_slots_width;				// remainders
}

if(pickup_slot != -1){
	iitem = inv_grid[# 0, pickup_slot];							// Dynamically reads item from enum. Recycled from above
	sx = (iitem mod spr_inv_items_columns)*cell_size;
	sy = (iitem div spr_inv_items_columns)*cell_size;
	draw_sprite_part_ext(spr_inv_items, 0, sx, sy, cell_size, cell_size, mousex, mousey, 1, 1, c_white, 0.2);	// draw item on mouse cursor
	var inum = inv_grid[# 1, pickup_slot];
	draw_text_color(mousex + (cell_size * 1), mousey + (cell_size * 1), string(inum), c,c,c,c, 1);		// draw item count (replaced scale)
}

#endregion

/*debug_flag = 1;
if(debug_flag == 1){
	draw_text_color(100,100,"objInv debug: number =" + number,c,c,c,c,1);
	draw_text_color(100,120,"objInv debug: iitem =" + iitem,c,c,c,c,1);
	draw_text_color(100,140,"objInv debug: ssitem =" + ss_item,c,c,c,c,1);
	draw_text_color(100,160,"objInv debug: ss_item_num =" + ss_item_num,c,c,c,c,1);
}