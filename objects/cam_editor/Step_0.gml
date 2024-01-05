/// @description 
var cursor_x = device_mouse_x_to_gui(0) / cam_zoom
var cursor_y = device_mouse_y_to_gui(0) / cam_zoom

// panning
if !(global.ui_hover || cam_dragging_mode) && global.interaction_state == INTERACTION_STATE.free {
	
	if (MOUSE_PRESSED_MIDDLE) cam_dragging_mode = 1
	else if (keyboard_check(vk_space)) {
		if (MOUSE_PRESSED_LEFT) cam_dragging_mode = 2
		global.cursor = cr_drag
	}
	
	if (cam_dragging_mode) {
		cam_drag_x = global.camera_x + cursor_x
		cam_drag_y = global.camera_y + cursor_y
		global.interaction_state = INTERACTION_STATE.camera
	}
	
} else if (cam_dragging_mode) {
	global.cursor = cr_drag
	
	global.camera_x = cam_drag_x - cursor_x
	global.camera_y = cam_drag_y - cursor_y
	
	// cancel
	switch (cam_dragging_mode) {
		case 1: if !(MOUSE_MIDDLE) cam_dragging_mode = 0 break;
		case 2: if !(keyboard_check(vk_space) && MOUSE_LEFT) cam_dragging_mode = 0 break;
	}
	
	if (!cam_dragging_mode) {
		global.interaction_state = INTERACTION_STATE.free
	}
}

// zooming
var mouse_wheel = mouse_wheel_down() - mouse_wheel_up()
var last_zoom = cam_zoom

if (mouse_wheel != 0 && !global.ui_hover) {
	cam_zoom -= (mouse_wheel * 0.25) * cam_zoom
	cam_zoom = clamp(cam_zoom, cam_zoom_min, cam_zoom_max)
}

global.camera_zoom = floor(cam_zoom / 0.25) * 0.25
camera_set_view_size(CAM_DEFAULT, global.view_width/global.camera_zoom, global.view_height/global.camera_zoom)

// update camera
var camera_x = global.camera_x - VIEW_WIDTH*0.5
var camera_y = global.camera_y - VIEW_HEIGHT*0.5

camera_set_view_pos(CAM_DEFAULT, camera_x, camera_y)

global.camera_frac_x = frac(camera_x)
global.camera_frac_y = frac(camera_y)
