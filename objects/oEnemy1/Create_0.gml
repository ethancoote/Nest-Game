// movement
x_spd = 0;
y_spd = 0;
spd = random_range(0.4, oControl1.top_spd);
grav = 0.4;
grounded = true;
face = 1;
dist_stop_left = random_range(15, 40);
dist_stop_right = random_range(45, 65);

// stats
hp = 100;
attack_frames = 120;
attack_timer = 60;
attack = false;
damage = 50;

// misc
egg_instances = [];
hitstun_timer = 0;
damage_timer = 0;
damage_frames = 8;

// healthbar
hp_x_pos = - 5;
hp_y_pos = - random_range(15, 20);
hp_back = instance_create_depth(x + hp_x_pos, y + hp_y_pos, 0, oHealthBack);
hp_bar = instance_create_depth(x + hp_x_pos, y + hp_y_pos, -1, oHealthEnemy);

// audio
audio_emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_exponent_distance);

