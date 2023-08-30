/// @description 

global.cursor_can_interact = !oka_get_hover()

// Events
event_user(1) // Manage Rooms
event_user(15) // Keyboard Listener

// files
var array = file_dropper_get_files(".p8")
file_dropper_flush()

if (array_length(array) > 0) {
    global.pico_data = load_pico8(array[0])
	event_user(0)
}

// update cursor
if (global.cursor_image != window_get_cursor()) {
	window_set_cursor(global.cursor_image)
}
global.cursor_image = cr_arrow
