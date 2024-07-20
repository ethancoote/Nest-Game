if oControl1.play == false && oControl1.win == false {
	image_alpha = 1;
	var _inst;
	_inst = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

	if _inst == true {
		sprite_index = sNextWaveHover;
		if mouse_check_button_pressed(mb_left) {
			oControl1.wave += 1;
			oControl1.play = true;
		}
	} else {
		sprite_index = sNextWave;
	}
} else {
	image_alpha = 0;
}




