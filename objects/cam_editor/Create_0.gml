/// @description 

global.camera_x = global.view_width*0.5
global.camera_y = global.view_height*0.5
global.camera_zoom = 1.0
global.camera_zoom_target = 1.0

// camera variables
cam_zoom = 1.0

cam_zoom_speed = 0.6
cam_zoom_min = 0.5
cam_zoom_max = 12.0

cam_dragging_mode = 0
cam_drag_x = 0
cam_drag_y = 0

event_subscribe("window_resized",self,function(width,height,new_width,new_height) {
	var dif_x = new_width - width
	var dif_y = new_height - height
	
	//global.camera_x += dif_x*0.5
	//global.camera_y += dif_y*0.5
})
