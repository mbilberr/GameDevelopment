depth = -1;
//scale = 1;

show_inventory = false;														// Show inventory by default

inv_slots = 12;																// Total number of items that can be carried
inv_slots_width = 4;														// Number of columns
inv_slots_height = 3;														// Number of rows

selected_slot = 0;															// Convert mouse position to inventory slot
pickup_slot = -1;

mslot_x = 0;
mslot_y = 0;
m_slotx = 0;
m_sloty = 0;

x_buffer = 4;																// X Distance between slots on inventory UI
y_buffer = 4;																// Y Distance between slots on inventory UI

cell_size = 32;																// Width of item sprites

inv_UI_width = 160;															// Dimensions of inventory UI. I think totals are ok but not positive. !!!!!!!
inv_UI_height = 128;														// Dimensions of inventory UI. I think totals are ok but not positive. !!!!!!!

spr_inv_UI = spr_inventory;
spr_inv_items = spr_inventory_items;
spr_inv_items_columns = sprite_get_width(spr_inventory_items)/cell_size;	// This is calculating the columns and rows based on the sprite of the ITEMS not the UI !!!
spr_inv_items_rows = sprite_get_height(spr_inventory_items)/cell_size;

inv_UI_x = (global.gui_width * 0.5) - (inv_UI_width * 0.5 * 1);					// Changed scale to 1
inv_UI_y = (global.gui_height * 0.5) - (inv_UI_height * 0.5 * 1);					// Changed scale to 1

// Adds misc info like money and name
info_x = inv_UI_x;// + (9 * 1);												// Removed scale and +9 since I dont have the same sprite info_x = inv_UI_x + 9;
info_y = inv_UI_y;// + (9 * 1);												// Removed scale and changed + to minus in order to push words up
slots_x = info_x + (10 * 1);												// Will be used for draw coordinates
slots_y = info_y + (11 * 1);												// Removed scale

ds_player_info = ds_grid_create(2,4);										// Create an empty grid 2 wide 4 high
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Copper";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = 0;
ds_player_info[# 1, 1] = 0;
ds_player_info[# 1, 2] = 0;
ds_player_info[# 1, 3] = "Ashenfury";

ds_inventory = ds_grid_create(2, inv_slots);								// Alias to create a grid with 2 width and 12 height

enum item{
		none		=0,
		skull		=1,
		book		=2,
		herb		=3,
		scroll		=4,
		biscuits	=5,
		hearthstone	=6,
		pipe		=7,
		equipment	=8,
		quest_log	=9,
		headdress	=10,
		totem		=11,
		ear			=12,
		height		=13											// Height should always be last so you can query the list for maxvalue
}

var yy = 0; repeat(11){
	ds_inventory[# 0, yy] = irandom_range(1, item.height-1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);
	show_debug_message(string(yy));
	
	yy += 1;
}

