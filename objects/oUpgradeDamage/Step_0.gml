// check mouse interaction
var _inst = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

if _inst != noone {
	sprite_index = sUpgradeLight;
	image_blend = c_white;
	if mouse_check_button(mb_left) {
		sprite_index = sUpgrade;
		image_blend = c_gray;
	}
} else {
	sprite_index = sUpgrade;
	image_blend = c_white;
}

// following upgrade menu position
x = oUpgradeMenu.x - 124;
y = oUpgradeMenu.y - 40;




