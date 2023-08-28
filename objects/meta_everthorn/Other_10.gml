/// @description Load Pico-8 Data
var _data = global.pico_data
if (!is_struct(_data)) return

global.levels = []
levels_list.destroy_children()
global.levels = []

// load levels
var _levels = _data.levels
for (var i = 0; i < array_length(_levels); i++) {
	var _level = _levels[i]
	everthorn_add_level(_level)
}
everthorn_load_level(0)
global.levels = _levels
