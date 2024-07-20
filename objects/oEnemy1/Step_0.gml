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
	// attack
}

// gravity
if grounded == false {
	y_spd += grav;
}

// death 
if hp <= 0 {
	instance_destroy();
	// add death animation
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
}

if damage_timer > 0 {
	damage_timer--;
}

// y collision
var _sub_pixel = .5;
if place_meeting(x, y+y_spd, tsTerrain) {
	var _pixel_check = _sub_pixel * sign(y_spd);
	
	while !place_meeting(x, y + _pixel_check, tsTerrain) {
		y += _pixel_check;
	}
	y_spd = 0;
	grounded = true;
} else {
	grounded = false;
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


