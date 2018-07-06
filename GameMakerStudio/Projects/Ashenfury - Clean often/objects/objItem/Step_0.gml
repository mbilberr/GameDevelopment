if (drop_move) {
    x = lerp(x, goal_x, 0.1);
    y = lerp(y, goal_x, 0.1);
    if (abs(x - goal_x) < 1 and abs(y - goal_y) < 1) {
        drop_move = false;
    }
} else {
	
	//if(!keyboard_check(ord("O"))) exit;
	
    var px = objPlayer.x;
    var py = objPlayer.y;
    var r = 32;

    if (point_in_rectangle(px, py, x - r, y - r, x + r, y + r)) {
        r = 5;
        if (!point_in_rectangle(px, py, x - r, y - r, x + r, y + r)) {
            // move toweards player
            x = lerp(x, px, 0.1);
            y = lerp(y, py, 0.1);
        } else { // pickup item
            var in = item_num;
            with(objInventory) {
                //check if it already exists
                var ds_inv = ds_inventory;
                var picked_up = false;
                //check if item exists
                var yy = 0;
                repeat(inv_slots) {
                    if (ds_inv[#0, yy] == in ) {
                        ds_inv[#1, yy] += 1;
                        picked_up = true;
                        break;
                    } else {
                        yy += 1;
                    }
                }
                // otherwise add item to an empty slot 
                if (!picked_up) {
                    yy = 0;
                    repeat(inv_slots) {
                        if (ds_inv[#0, yy] == item.none) {
                            ds_inv[#0, yy] = in ;
                            ds_inv[#1, yy] += 1;
                            picked_up = true;
                            break;
                        } else {
                            yy += 1;
                        }
                    }
                }
            }
            if (picked_up) {
                instance_destroy();
                show_debug_message("Picked up an item (gameworld destroyed)");
            }

        }
    }
}