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
	y_spd = lengthdir_y(-(knock_pow*0.5), point_direction(x, y, knock_x, knock_y));
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
if place_meeting(x, y+y_spd, tsTerrain) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, tsTerrain) {
		y += _pixel_check;
	}
	grounded = true;
	y_spd = 0;
}

y += y_spd;

// x collision
if place_meeting(x + x_spd, y, tsTerrain) {
	var _pixel_check = _sub_pixel * sign(x_spd);
	
	while !place_meeting(x + _pixel_check, y, tsTerrain) {
		x += _pixel_check;
	}
	
	x_spd = 0;
}

x += x_spd;

// hold
if hold == true {
	if hold_instance == noone {
		hold_instance = instance_create_depth(x, y, -1, oEggCannon);
	}
	oEggCannon.x = x;
	oEggCannon.y = y - 8;
	oEggCannon.face = face;
	oEggCannon.image_angle = point_direction(x, y, mouse_x, mouse_y);
	
	// shoot egg
	if mouse_click && egg_timer == 0{
		var _egg = instance_create_depth(x, y - 8, 1, oEgg);
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

// grounded
if (y_spd >= 0 && place_meeting(x, y+1, tsTerrain)) {
	grounded = true;
} else {
	grounded = false;
}





