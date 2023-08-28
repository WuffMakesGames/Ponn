/// @description Default Step

var _mouse_x = OKA_MOUSE_X / camera_scale
var _mouse_y = OKA_MOUSE_Y / camera_scale

if (dragging) {
	x = drag_x - _mouse_x
	y = drag_y - _mouse_y
	dragging = mouse_check_button(mb_middle)
} else if (mouse_check_button_pressed(mb_middle) && !oka_get_hover()) {
	drag_x = x + _mouse_x
	drag_y = y + _mouse_y
	dragging = true
}

// update camera
var scroll = mouse_wheel_down() - mouse_wheel_up()
if (scroll != 0 && !oka_get_hover()) {
	camera_scale = clamp(camera_scale - (scroll*0.25)*camera_scale, 0.5, 10.0)
}
camera_set_view_size(camera, global.window_width/camera_scale, global.window_height/camera_scale)

// camera
camera_set_view_pos(
	camera, 
	floor(x+offset_x-camera_get_view_width(camera)*0.5), 
	floor(y+offset_y-camera_get_view_height(camera)*0.5)
)
