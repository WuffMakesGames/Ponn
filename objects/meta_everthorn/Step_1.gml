/// @description 
global.window_resized = false

// get values
var _last_width = global.window_width
var _last_height = global.window_height

global.window_width = max(100, WINDOW_WIDTH)
global.window_height = max(100, WINDOW_HEIGHT)

// update
var _width = global.window_width
var _height = global.window_height

if (_last_width != _width || _last_height != _height) {
	surface_resize(application_surface,_width,_height)
	display_set_gui_size(_width,_height)
	oka_resize(_width,_height)
	
	global.window_resized = true
}
