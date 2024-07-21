if !grounded && y_spd < 0 {
	sprite_index = sChar1Jump;
} else if !grounded && y_spd > 0 {
	sprite_index = sChar1Fall;
}

draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * face, image_yscale, image_angle, image_blend, image_alpha);




