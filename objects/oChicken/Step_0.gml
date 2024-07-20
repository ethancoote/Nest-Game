if damage_timer > 0 {
	sprite_index = sChickenHurt;
	damage_timer--;
} else {
	sprite_index = sChicken;
}

if hp <= 0 {
	oPlayer.dead = true;
	oLoseMenu.appear = true;
}




