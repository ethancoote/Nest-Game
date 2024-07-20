// move towards chicken
if x < oChicken.x {
	x_spd = spd;
	face = 1;
} else if x > oChicken.x {
	x_spd = -spd;
	face = -1;
}

// stop and attack
if (abs(x - oChicken.x) < dist_stop_left && face == 1) || (abs(x - oChicken.x) < dist_stop_right && face == -1){
	x_spd = 0;
	attack = true;
} else {
	attack = false;
}

// attack
if attack == true {
	if attack_timer > 0 {
		attack_timer--;
	} else {
		attack_timer = attack_frames;
		oChicken.hp -= damage;
		oChicken.damage_timer = oChicken.damage_frames;
	}
}

// gravity
if grounded == false {
	y_spd += grav;
}

// got hit
var _egg_instance = instance_place(x, y, oEgg);
if _egg_instance != noone && damage_timer == 0 {
	if !array_contains(egg_instances, _egg_instance) {
		hitstun_timer = oPlayer.hitstun;
		damage_timer = damage_frames;
		hp -= oPlayer.damage;
		array_push(egg_instances, _egg_instance);
	}
	
}

if hitstun_timer > 0 {
	x_spd = 0;
	hitstun_timer--;
	sprite_index = sEnemy1Stand;
} else {
	sprite_index = sEnemy1;
}

if damage_timer > 0 {
	damage_timer--;
	sprite_index = sEnemy1Hurt;
}

// y collision
var _sub_pixel = .5;
if place_meeting(x, y+y_spd, oControl1.tm1) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, oControl1.tm1) {
		y += _pixel_check;
	}
	y_spd = 0;
	grounded = true;
} else {
	grounded = false;
}

y += y_spd;

// x collision
if place_meeting(x + x_spd, y, oControl1.tm1) {
	var _pixel_check = _sub_pixel * sign(x_spd);
	
	while !place_meeting(x + _pixel_check, y, oControl1.tm1) {
		x += _pixel_check;
	}
	
	x_spd = 0;
}

x += x_spd;

// health bar
hp_bar.image_xscale = hp/100;
hp_back.x = x+hp_x_pos;
hp_back.y = y+hp_y_pos;
hp_bar.x = x+hp_x_pos;
hp_bar.y = y+hp_y_pos;

// death 
if hp <= 0 {
	instance_destroy(hp_back);
	instance_destroy(hp_bar);
	instance_destroy();
	// add death animation
}


