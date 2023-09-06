/// @desc Creates and generates ui for a new Levelelement
function everthorn_create_new_level() {
	if (!is_struct(global.pico_data)) {
		return false
	}
	
	var _index = array_length(global.levels)
	var level = everthorn_add_level(new EverthornLevel())
	everthorn_load_level(_index)
	return true
}

function everthorn_add_level(data) {
	if (!is_struct(global.pico_data)) {
		return noone
	}
	
	var _index = array_length(global.levels)
	array_push(global.levels, data)
	
	everthorn_create_level_button(_index)
	return data
}

function everthorn_create_level_button(index) {
	levels_list.add_component(everthorn_button(noone,"90%","32px","level "+string(index),-1)
		.set_x("50%")
		.set_align_x(OKA_ALIGN_X.MIDDLE)
		.set_custom_var("index",index)
		.set_on_step(function(c) {
			var _selected = global.level_selected == c.get_custom_var("index")
			var _color = _selected ? style.background : (c.get_hover() ? style.background_menu : style.background_secondary)
			c.set_color(_color)
		})
		.set_on_mouse_click(function(c) {
			everthorn_load_level(c.get_custom_var("index"))
		})
	)
}

function everthorn_create_room_button(parent,room_data,index=0) {
	everthorn_button(parent,"33%","32px","room "+string(index),-1)
	.set_custom_var("index",room_data)
	.set_on_step(function(c) {
		var _selected = global.room_selected == c.get_custom_var("index")
		var _color = _selected ? style.background : (c.get_hover() ? style.background_menu : style.background_secondary)
		c.set_color(_color)
	})
	.set_on_mouse_click(function(c) {
		everthorn_select_room(c.get_custom_var("index"))
	})
}

/// @desc Creates and generates ui for a new Room
function everthorn_create_new_room() {
	//if (!is_struct(global.pico_data)) {
	//	return false
	//}
	
	//var _index = array_length(global.levels)
	//var level = new EverthornLevel()
	//array_push(global.levels, level)
	
	//everthorn_create_room_button(_index)
	//everthorn_load_level(_index)
	//return true
}

/// @desc Loads a level into the editor
function everthorn_load_level(level_id) {
	if (level_id == global.level_selected) return;
	global.level_selected = level_id
	
	// generate rooms
	rooms_list.destroy_children()
	var _rooms = global.pico_data.levels[level_id].rooms
	var _length = array_length(_rooms)
	
	for (var i = 0; i < _length; i += 1) {
		//var _list = oka_new_list(rooms_list)
		//.set_list_direction(OKA_LIST_DIRECTION.HORIZONTAL)
		//.set_width("100%")
		//.set_height(32)
		//.set_padding(2)
		
		everthorn_create_room_button(rooms_list,_rooms[i],i)
		//for (var j = i; j < min(i+3, _length); j++) {
		//	everthorn_create_room_button(_list,_rooms[j],j)
		//}
		//if (i < _length-1) everthorn_create_room_button(_list,_rooms[i+1],i+1)
	}
	
}

function everthorn_select_room(room_data) {
	var _rooms = global.pico_data.levels[global.level_selected].rooms
	if (room_data) {
		for (var i = 0; i < array_length(_rooms); i++) {
			if (_rooms[i] == room_data) {
				array_delete(_rooms,i,1)
				_rooms[array_length(_rooms)] = room_data
				break;
			}
		}
	}
	global.room_selected = room_data
}
