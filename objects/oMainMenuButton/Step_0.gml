if oLoseMenu.appear == true || oWinMenu.appear == true {
	if y < 300 {
		y += 20;
	} 
	var _inst;
	_inst = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

	if _inst == true {
		sprite_index = sMainMenuHover;
		if mouse_check_button_pressed(mb_left) {
			audio_play_sound(pop2, 0, false, 1);
			room_goto(0);
		}
	} else {
		sprite_index = sMainMenu;
	}
} else {
	if y > -200 {
		y -= 20;
	}
}




