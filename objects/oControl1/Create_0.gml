//window_set_fullscreen(true);
tm1 = layer_tilemap_get_id("Terrain");

// wave controls
wave = 0;
enemies_killed = 0;
wave_enemies = [0, 10, 25, 50, 100, 200];
enemies_spawned = 0;
min_spawn_spd = [1, 200, 170, 150, 110, 80];
max_spawn_spd = [0, 150, 90, 70, 40, 20];
top_spd = 0.6 + (wave/5);
wave_fade_frames = 20;
wave_stay_frames = 190;
wave_timer = 0;
wave_alpha = 0;
wave_show = false;
round_start = false;
protect_alpha = 0;
upgrades_open = true;


// game state
win = false;
play = false;
just_won = false;





