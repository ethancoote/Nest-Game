// wave end
if enemies_killed == wave_enemies[wave] {
	if wave > 0 && play == true {
		just_won = true;
		
	}
	play = false;	
} else {
	play = true;
}

if enemies_killed == wave_enemies[array_length(wave_enemies)-1] {
	play = false;
	win = true;
	oWinMenu.appear = true;
}

top_spd = 0.6 + (wave/5);

// showing wave text
if round_start == false && play == true {
	wave_show = true;
	wave_timer = wave_stay_frames;
	round_start = true;
}

if play == false {
	round_start = false;
}

if wave_show == true && protect_alpha <= 0{
	if wave_alpha < 1 {
		wave_alpha += (1/wave_fade_frames);
	}
	wave_timer--;
	if wave_timer == 0 {
		wave_show = false;
	}
	
} else if wave_show == false && wave_timer == 0{
	if wave_alpha > 0 {
		wave_alpha -= (1/wave_fade_frames);
	}
}

if wave == 0 {
	if protect_alpha < 1 {
		protect_alpha += (1/(wave_fade_frames*2));
	}
} else {
	if protect_alpha > 0 {
		protect_alpha -= (1/(wave_fade_frames*2));
	}
}



