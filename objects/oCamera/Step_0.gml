// camera controls
var _cam_width = camera_get_view_width(view_camera[0]);
var _cam_height = camera_get_view_height(view_camera[0]);

var _cam_x = oPlayer.x - _cam_width/2;
var _cam_y = oPlayer.y - _cam_height/2;

camera_set_view_pos(view_camera[0], _cam_x, _cam_y - 10);