/// @description Load Pico-8 Data
var _data = global.pico_data
global.pico_data_loaded = is_struct(_data)

if (!global.pico_data_loaded) return

// reset
global.levels = []
levels_list.destroy_children()

// load levels
var _levels = _data.levels
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
