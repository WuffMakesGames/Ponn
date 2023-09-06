
#macro EVERTHORN_NAME "Everthorn"
#macro EVERTHORN_VERSION_ID "v0.0.1"
#macro EVERTHORN_VERSION_NAME EVERTHORN_NAME + " " + EVERTHORN_VERSION_ID
#macro Debug:EVERTHORN_NAME "Everthorn Debug Build"

// Keyboard
#macro KEY_MODIFIER_CTRL keyboard_check(vk_control)

// Window
#macro WINDOW_WIDTH window_get_width()
#macro WINDOW_HEIGHT window_get_height()

// Viewport
#macro VIEW_CAMERA_DEFAULT view_camera[0]
#macro VIEW_X camera_get_view_x(VIEW_CAMERA_DEFAULT)
#macro VIEW_Y camera_get_view_y(VIEW_CAMERA_DEFAULT)
#macro VIEW_WIDTH camera_get_view_width(VIEW_CAMERA_DEFAULT)
#macro VIEW_HEIGHT camera_get_view_height(VIEW_CAMERA_DEFAULT)
