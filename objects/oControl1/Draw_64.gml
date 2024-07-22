draw_set_font(fnImpact);
draw_text_ext_color(802, 23, string(enemies_killed) + " / " + string(wave_enemies[wave]),1,1000,c_white, c_white, c_gray, c_gray, 1);

draw_set_font(fnWave);
draw_text_ext_color(350, 96, "W A V E    " + string(wave),1,400,c_white, c_white, c_gray, c_gray, wave_alpha);
draw_text_ext_color(64, 96, "P R O T E C T    T H E    N E S T    ",1,1000,c_white, c_white, c_gray, c_gray, protect_alpha);

