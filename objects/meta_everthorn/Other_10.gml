/// @description Load Pico-8 Data

var data = load_pico8(global.pico_data_filepath)
if (!is_struct(data)) {
	show_debug_message("Error loading file...")
	exit;
}

// update
global.pico_data = data
global.pico_data_loaded = true

// window title
var _cartname = string_copy(global.pico_data_filepath, string_last_pos("\\",global.pico_data_filepath)+1, string_length(global.pico_data_filepath))
window_set_caption(EVERTHORN_VERSION_NAME + " - " + _cartname)

// reset
global.levels = []
levels_list.destroy_children()

// load levels
var _levels = data.levels
global.levels = []

for (var i = 0; i < array_length(_levels); i++) {
	var _level = _levels[i]
	everthorn_add_level(_level)
}

// reload
everthorn_load_level(0)
global.levels = _levels

// update tileset buttons
for (var i = 0; i < array_length(global.tile_buttons); i++) {
	var _button = global.tile_buttons[i]
	_button.set_sprite(global.pico_data.spritesheet)
}
