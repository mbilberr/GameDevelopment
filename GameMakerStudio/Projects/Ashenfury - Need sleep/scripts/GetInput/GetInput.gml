/// Defines input keys
XAxis	= keyboard_check(ord("D")) - keyboard_check(ord("A"));
YAxis	= keyboard_check(ord("S")) - keyboard_check(ord("W"));

Sprint	= keyboard_check(vk_lshift);

Melee	= mouse_check_button(mb_left);
Attack	= mouse_check_button(mb_right);

if (keyboard_check_pressed(vk_f1))game_end();
if (keyboard_check_pressed(vk_f3))show_debug_overlay(true);
show_help_screen = keyboard_check_pressed(vk_f4);

if (keyboard_check_pressed(vk_f2)){
	fuck_you = 1;
}