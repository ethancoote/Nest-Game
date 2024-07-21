if oControl1.play == false && oControl1.win == false {
	if y > 500 {
		y -= 20;
	}
	var _inst;
	_inst = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);

	if _inst == true {
		sprite_index = sNextWaveHover;
		if mouse_check_button_pressed(mb_left) {
			oControl1.wave += 1;
			oControl1.play = true;
			oControl1.enemies_killed = 0;
			oControl1.enemies_spawned = 0;
		}
	} else {
		sprite_index = sNextWave;
	}
} else {
	if y < 1000 {
		y+= 20;
	}
}




