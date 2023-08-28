/// @description 
draw_clear(style.background)

// grid
draw_set_alpha(0.25)
draw_set_color(c_white)
for (var xx = 0; xx < 1024-1; xx += 128) {
	for (var yy = 0; yy < 512-1; yy += 128) {
		draw_rectangle(xx,yy,xx+127,yy+127,true)
	}
}
draw_set_alpha(1.0)

// rooms
if (is_struct(global.pico_data)) {
	var _data = global.pico_data
	var _rooms = _data.levels[global.level_selected_id].rooms
	
	for (var i = 0; i < array_length(_rooms); i++) {
		var _room = _rooms[i]
		_room.draw(_data.spritesheet,_room.x*8,_room.y*8)
	}
}
