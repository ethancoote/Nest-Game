// controls
function get_controls(){
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_space);
	mouse_pos = device_mouse_x(0);
	mouse_click = device_mouse_check_button_pressed(0, mb_left);
	
}