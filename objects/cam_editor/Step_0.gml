/// @description Default Step
var scale = global.camera_scale

var _mouse_x = OKA_MOUSE_X / scale
var _mouse_y = OKA_MOUSE_Y / scale

if (dragging) {
	x = drag_x - _mouse_x
	y = drag_y - _mouse_y
	dragging = mouse_check_button(mb_middle)
} else if (global.cursor_can_interact && mouse_check_button_pressed(mb_middle)) {
	drag_x = x + _mouse_x
	drag_y = y + _mouse_y
	dragging = true
}

// update camera
var scroll = mouse_wheel_down() - mouse_wheel_up()

if (global.cursor_can_interact && scroll != 0) {
	scale = clamp(scale - (scroll*0.25)*scale, 0.5, 10.0)
}
camera_set_view_size(camera, floor(global.window_width/scale) + 1, floor(global.window_height/scale) + 1)

// camera
var _cam_x = x+offset_x - VIEW_WIDTH*0.5
var _cam_y = y+offset_y - VIEW_HEIGHT*0.5
camera_set_view_pos(camera, floor(_cam_x), floor(_cam_y))
global.cam_frac_x = frac(_cam_x)
global.cam_frac_y = frac(_cam_y)

// update
global.camera_scale = scale
