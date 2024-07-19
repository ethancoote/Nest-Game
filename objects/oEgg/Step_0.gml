// destory timer
if destroy_timer > 0 {
	destroy_timer--;
} else if destroy_timer == 0 {
	instance_destroy();
} 

if x > x_attack - 5 && x < x_attack + 5 && y > y_attack - 5 && y < y_attack + 5 {
	// this should explode
	instance_destroy();
}

move_towards_point(x_attack, y_attack, egg_spd);







