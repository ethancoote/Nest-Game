var _inst;
_inst = instance_position(mouse_x, mouse_y, id);

if _inst != noone {
	sprite_index = sPlayHover;
	if mouse_check_button_pressed(mb_left) {
		room_goto_next();
	}
} else {
	sprite_index = sPlay;
}



