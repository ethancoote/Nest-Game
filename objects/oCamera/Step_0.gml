// camera controls

cam_x = oPlayer.x - cam_width/2;

camera_set_view_pos(view_camera[0], cam_x, cam_y -20);

back_spd = oPlayer.x_spd * 0.8;
back_spd1 = oPlayer.x_spd * 0.4;
back_spd2 = oPlayer.x_spd * -1;
layer_hspeed(lay_id, back_spd);
layer_hspeed(lay_id1, back_spd1);
layer_hspeed(lay_id2, back_spd2);
