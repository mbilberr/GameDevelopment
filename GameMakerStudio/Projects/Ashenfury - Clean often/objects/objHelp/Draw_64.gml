if (!global.help) exit;

var gwidth = global.view_width,
    gheight = global.view_height;

//Draw Pause Menu "Back"
var c = c_black;
draw_rectangle_color(0, 0, gwidth, gheight, c, c, c, c, false);

//Draw elements on left side of menu
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

 draw_text_color(100, 100, string(global.view_height), c, c, c, c, 1);

//Draw Dividing Line
draw_line(start_x, start_y - y_buffer, start_x, lty + y_buffer);


draw_set_valign(fa_top);