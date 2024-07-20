// wave end
if enemies_killed == wave_enemies[wave] {
	play = false;
} else {
	play = true;
}

if enemies_killed == wave_enemies[array_length(wave_enemies)-1] {
	play = false;
	win = true;
	oWinMenu.appear = true;
}




