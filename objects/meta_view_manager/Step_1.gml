/// @description Window Resize
var width = max(window_get_width(), 10)
var height = max(window_get_height(), 10)

var last_width = global.view_width
var last_height = global.view_height

global.view_width = width
global.view_height = height

// update
if (last_width != global.view_width || last_height != global.view_height) {
	event_dispatch("window_resized",[last_width,last_height,width,height])
	event_user(0)
}
