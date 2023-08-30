/// @description Manage Rooms
if (!global.pico_data_loaded) exit;
var _rooms = global.pico_data.levels[global.level_selected].rooms
var _room_hover = noone
	
for (var i = 0; i < array_length(_rooms); i++) {
	var _room = _rooms[i]
	if (_room.get_hover(mouse_x,mouse_y)) _room_hover = _room
}

// update selection
if (global.cursor_can_interact && OKA_MOUSE_PRESSED_LEFT && global.room_selected != _room_hover) {
	global.room_selected = _room_hover
}



