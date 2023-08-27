/// @description 

// Update Surface
var _last_width = window_width
var _last_height = window_height

window_width = max(100,window_get_width())
window_height = max(100,window_get_height())

if (_last_width != window_width || _last_height != window_height) {
	surface_resize(application_surface,window_width,window_height)
	display_set_gui_size(window_width,window_height)
	
	camera_offset_x = (window_width - 512)*0.5 + 240
	camera_offset_y = 32
	camera_x -= camera_x/camera_scale
	
	oka_resize(window_width,window_height)
}

// update camera
var scroll = mouse_wheel_down() - mouse_wheel_up()
if (scroll != 0 && !oka_get_hover()) {
	camera_scale = clamp(camera_scale - scroll*0.25, 0.5, 4.0)
}
camera_set_view_size(camera,window_width/camera_scale,window_height/camera_scale)
