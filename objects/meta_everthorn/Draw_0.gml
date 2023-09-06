/// @description
draw_sprite_tiled_ext(spr_background,0,VIEW_X,VIEW_Y,1/global.camera_scale,1/global.camera_scale,style.background,1.0)

// grid
draw_set_color(c_dkgray)
for (var xx = -global.cam_frac_x; xx < 1024-1; xx += 128) {
	for (var yy = -global.cam_frac_y; yy < 512-1; yy += 128) {
		draw_rectangle(xx,yy,xx+127,yy+127,true)
	}
}
draw_reset()

// rooms
if (global.pico_data_loaded) {
	var _rooms = global.pico_data.levels[global.level_selected].rooms
	
	for (var i = 0; i < array_length(_rooms); i++) {
		var _room = _rooms[i]
		var _selected = global.room_selected == _room
		var _room_x = _room.x - global.cam_frac_x
		var _room_y = _room.y - global.cam_frac_y
		
		// draw room
		_room.begin_draw()
		
		draw_clear_alpha(c_white, _selected ? 0.2 : 0)
		_room.tilemap_draw(global.pico_data.spritesheet,0,0,1.0,1.0,0, _selected ? c_white : c_dkgray, 1.0)
		
		_room.end_draw()
		
		// render room
		_room.draw(_room_x,_room_y)
	}
}
