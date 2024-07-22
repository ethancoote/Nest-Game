var _inst;
_inst = position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id);
if oControl1.play == false && oControl1.win == false {
	if menu_song == false {
		audio_play_sound(menuSong2, 99, true);
		audio_stop_sound(fightSong1);
		menu_song = true;
	}
	if y > 500 {
		y -= 20;
	}
	
	if _inst != noone {
		sprite_index = sNextWaveHover;
		if mouse_check_button_pressed(mb_left) {
			oControl1.wave += 1;
			oControl1.play = true;
			oControl1.enemies_killed = 0;
			oControl1.enemies_spawned = 0;
			audio_stop_sound(menuSong2);
			audio_play_sound(fightSong1, 99, true);
			menu_song = false;
		}
	} else {
		sprite_index = sNextWave;
		
	}
} else {
	if y < 1000 {
		y+= 20;
	}
	
}




