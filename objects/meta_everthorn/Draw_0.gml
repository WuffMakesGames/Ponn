/// @description
draw_sprite_tiled_ext(spr_background,0,VIEW_X,VIEW_Y,1/global.camera_scale,1/global.camera_scale,style.background,1.0)

// grid
draw_set_color(c_dkgray)
for (var xx = -global.cam_frac_x; xx < 1024-1; xx += 128) {
	for (var yy = -global.cam_frac_y; yy < 512-1; yy += 128) {
		draw_rectangle(xx,yy,xx+127,yy+127,true)
	}
}
draw_set_color(c_white)

// rooms
if (global.pico_data_loaded) {
	var _rooms = global.pico_data.levels[global.level_selected].rooms
	
	for (var i = 0; i < array_length(_rooms); i++) {
		var _room = _rooms[i]
		_room.draw(
			global.pico_data.spritesheet,
			_room.x-global.cam_frac_x,
			_room.y-global.cam_frac_y,
			1.0, 1.0, 0, 
			global.room_selected == _room ? c_white : c_dkgray,
			1.0
		)
	}
}
