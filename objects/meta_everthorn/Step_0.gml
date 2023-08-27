/// @description 

// drop files
var array = file_dropper_get_files(".p8")
file_dropper_flush()

if (array_length(array) > 0) {
    global.pico_data = load_pico8(array[0])
}

// update cursor
if (global.cursor_image != window_get_cursor()) {
	window_set_cursor(global.cursor_image)
}
global.cursor_image = cr_arrow

// Drag
var _mouse_x = OKA_MOUSE_X / camera_scale
var _mouse_y = OKA_MOUSE_Y / camera_scale

if (camera_drag) {
	camera_x = camera_drag_x - _mouse_x
	camera_y = camera_drag_y - _mouse_y
	camera_drag = mouse_check_button(mb_middle)
} else if (mouse_check_button_pressed(mb_middle) && !oka_get_hover()) {
	camera_drag_x = camera_x + _mouse_x
	camera_drag_y = camera_y + _mouse_y
	camera_drag = true
}

// camera
camera_set_view_pos(
	camera, 
	floor(camera_x+camera_offset_x-camera_get_view_width(camera)*0.5), 
	floor(camera_y+camera_offset_y-camera_get_view_height(camera)*0.5)
)
