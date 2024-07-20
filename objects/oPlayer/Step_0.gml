// movement
get_controls();

//// accel
if grounded {
	accel = ground_accel;
} else {
	accel = air_accel;
}

move_dir = key_right - key_left;
x_spd += move_dir * accel;
if x_spd > move_spd {
	x_spd = move_spd;
} else if x_spd < -move_spd {
	x_spd = -move_spd;
} 

//// stopping
if move_dir == 0 {
	if x_spd <= accel && x_spd >= -accel {
		x_spd = 0;
	}
	if x_spd > 0{
		x_spd -= accel;
	} else if x_spd < 0 {
		x_spd += accel;
	}
}

//// setting face
if mouse_pos > x {
	face = 1;
} else if mouse_pos < x {
	face = -1;
}

//// jump
if key_up {
	jump_buff_timer = jump_buff;
}

if jump_buff_timer > 0 && grounded{
	jump_timer = jump_frames;
	jump_buff_timer = 0;
} else {
	jump_buff_timer--;
}

if jump_timer > 0 {
	y_spd = -jump_pow;
	jump_timer--;
}

//// gravity
y_spd += grav;
if y_spd > term_vel {
	y_spd = term_vel;
}

// egg knockback
if knock_timer > 0 {
	x_spd = lengthdir_x(-knock_pow, point_direction(x, y, knock_x, knock_y));
	y_spd = lengthdir_y(-(knock_pow), point_direction(x, y, knock_x, knock_y));
	knock_timer--;
}

// animations
if x_spd != 0 && grounded {
	sprite_index = sChar1Run;
} else {
	sprite_index = sChar1;
}

// y collision
var _sub_pixel = .5;
if place_meeting(x, y+y_spd, oControl1.tm1) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, oControl1.tm1) {
		y += _pixel_check;
	}
	grounded = true;
	y_spd = 0;
}

if dead == false {
	y += y_spd;
}

// x collision
if place_meeting(x + x_spd, y, oControl1.tm1) {
	var _pixel_check = _sub_pixel * sign(x_spd);
	
	while !place_meeting(x + _pixel_check, y, oControl1.tm1) {
		x += _pixel_check;
	}
	
	x_spd = 0;
}

if dead == false {
	x += x_spd;
}


// hold
if hold == true && dead == false{
	if hold_instance == noone {
		hold_instance = instance_create_depth(x, y, -1, oEggCannon);
	}
	oEggCannon.x = x;
	oEggCannon.y = y - 7;
	oEggCannon.face = face;
	oEggCannon.image_angle = point_direction(x, y, mouse_x, mouse_y);
	
	// shoot egg
	if mouse_click && egg_timer == 0{
		var _egg = instance_create_depth(x, y - 7, 1, oEgg);
		with(_egg) {
			egg_spd = oPlayer.attack_spd;
			x_attack = mouse_x;
			y_attack = mouse_y;
		}
		egg_timer = egg_cooldown;
		knock_timer = knock_frames;
		knock_x = mouse_x;
		knock_y = mouse_y;
	} else if egg_timer > 0 {
		egg_timer--;
	}
}

// got hit
if place_meeting(x, y, oEnemy1) && take_damage_timer == 0{
	take_damage_timer = take_damage_frames;
	hp -= 20;
}

image_alpha = 1;
if take_damage_timer > 0 {
	take_damage_timer--;
	if take_damage_timer%20 == 0 {
		blank_timer = 10;
	} else if blank_timer > 0 {
		image_alpha = 0;
		blank_timer--;
	}
}

// grounded
if (y_spd >= 0 && place_meeting(x, y+1, oControl1.tm1)) {
	grounded = true;
} else {
	grounded = false;
}

if hp <= 0 {
	dead = true;
	oLoseMenu.appear = true;
}

// health bar
// health bar
hp_bar.image_xscale = hp/100;
if hp_bar.image_xscale < 0 {
	hp_bar.image_xscale = 0;
}
hp_back.x = x+hp_x_pos;
hp_back.y = y+hp_y_pos;
hp_bar.x = x+hp_x_pos;
hp_bar.y = y+hp_y_pos;





