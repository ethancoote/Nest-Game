// destory timer
if destroy_timer > 0 {
	destroy_timer--;
} else if destroy_timer == 0 {
	instance_destroy();
} 

if ((x > x_attack - 5 && x < x_attack + 5 && y > y_attack - 5 && y < y_attack + 5) || place_meeting(x, y, tsTerrain)) && explode_dest = false {
	explode_timer = explode_frames;
	explode_dest = true;
	sprite_index = sSparks;
	image_xscale = 0.5;
	image_yscale = 0.5;
}

if explode_timer > 0 {
	explode_timer--;
} else if explode_timer == 0 && explode_dest == true {
	instance_destroy();
}

if explode_dest == false {
	move_towards_point(x_attack, y_attack, egg_spd);
} else {
	speed = 0;
}








