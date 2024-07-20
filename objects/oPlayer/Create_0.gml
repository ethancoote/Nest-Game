// movement
x_spd = 0;
y_spd = 0;
move_spd = 2;
move_dir = 0;
face = 1;
accel = 0.5;
ground_accel = 0.5;
air_accel = 0.2;

// jump
grav = .4;
term_vel = 3;
jump_pow = 4;
jump_frames = 10;
jump_timer = 0;
jump_buff = 5;
jump_buff_timer = 0;
grounded = true;

// stats
hp = 100;
hold = true;
attack_spd = 5;
hold_instance = noone;
egg_cooldown = 8;
egg_timer = 0;

// gun stats
damage = 35;
hitstun = 30;
knockback = 8;

// shooting knockback
knock_frames = 8;
knock_timer = 0;
knock_pow = 1.8;
knock_x = 0;
knock_y = 0;
target_x = 0;
target_y = 0;

// misc
take_damage_frames = 120;
take_damage_timer = 0;
blank_timer = 0;

// health bar
hp_x_pos = - 5;
hp_y_pos = - 25;
hp_back = instance_create_depth(x + hp_x_pos, y + hp_y_pos, 0, oHealthBack);
hp_bar = instance_create_depth(x + hp_x_pos, y + hp_y_pos, -1, oHealthPlayer);



