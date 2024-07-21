//window_set_fullscreen(true);
tm1 = layer_tilemap_get_id("Terrain");

// wave controls
wave = 0;
enemies_killed = 0;
wave_enemies = [0, 20, 35, 60, 120, 500];
enemies_spawned = 0;
min_spawn_spd = [1, 230, 190, 150, 100, 40];
max_spawn_spd = [0, 150, 100, 60, 30, 5];
top_spd = 0.6 + (wave/5);

// game state
win = false;
play = false;





