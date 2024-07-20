// spawn enemies
if spawn_timer == 0 {
	spawn_timer = spawn_inter;
	instance_create_depth(x, y, 0, oEnemy1);
} else {
	spawn_timer--;
}




