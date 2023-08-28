/// @desc Creates and generates ui for a new room element
function everthorn_create_new_level() {
	if (!is_struct(global.pico_data)) {
		return false
	}
	
	var _index = array_length(global.levels)
	var level = new EverthornLevel()
	array_push(global.levels, level)
	
	everthorn_create_level_button(_index)
	everthorn_load_level(_index)
	return true
}

function everthorn_add_level(data) {
	if (!is_struct(global.pico_data)) {
		return false
	}
	
	var _index = array_length(global.levels)
	array_push(global.levels, data)
	
	everthorn_create_level_button(_index)
	return true
}

function everthorn_create_level_button(index) {
	levels_list.add_component(everthorn_button(noone,"90%","32px","level "+string(index),
		function(c) { everthorn_set_room_id(c.get_custom_var("index")) })
		.set_x("50%")
		.set_align_x(OKA_ALIGN_X.MIDDLE)
		.set_custom_var("index",index)
		.set_on_step(function(c) {
			var _selected = global.level_selected_id == c.get_custom_var("index")
			var _color = _selected ? style.background : (c.get_hover() ? style.background_menu : style.background_secondary)
			c.set_color(_color)
		})
		.set_on_mouse_click(function(c) {
			everthorn_load_level(c.get_custom_var("index"))
		})
	)
}

/// @desc Loads a level into the editor
function everthorn_load_level(level_id) {
	global.level_selected_id = level_id
}
