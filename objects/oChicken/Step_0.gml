var _pitch = random_range(0.85, 1.15);

if damage_timer > 0 {
	sprite_index = sChickenHurt;
	if hit == false && oLoseMenu.appear == false {
		audio_play_sound(hit1, 0, false, 1, 0, _pitch);
		hit = true
	}
	damage_timer--;
} else {
	sprite_index = sChicken;
	hit = false;
}

if hp <= 0 {
	oPlayer.dead = true;
	oLoseMenu.appear = true;
}




