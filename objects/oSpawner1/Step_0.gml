// spawn enemies
if spawn_timer == 0 
   && oControl1.play == true
   && oControl1.win == false
   && oControl1.enemies_spawned < oControl1.wave_enemies[oControl1.wave] {
	   
	oControl1.enemies_spawned += 1;
	spawn_timer = spawn_inter;
	instance_create_depth(x, y, 0, oEnemy1);
	
} else if spawn_timer == 0 {
	spawn_timer = spawn_inter;
} else {
	spawn_timer--;
}






