
// app
#macro APP_NAME "Pönn"
#macro APP_VERSION "v0.0.1"

#macro LOAD_PROJECT_TEXT "No Project Loaded"

#macro HISTORY_NOTE_ROOM_RESIZED "Room resized"
#macro HISTORY_NOTE_ROOM_MOVED "Room moved"
#macro HISTORY_NOTE_ROOM_CHANGED "Room edited"
#macro HISTORY_NOTE_ROOM_SELECTED "Room selected"

// viewport
#macro CAM_DEFAULT view_camera[0]
#macro VIEW_LEFT camera_get_view_x(CAM_DEFAULT)
#macro VIEW_TOP camera_get_view_y(CAM_DEFAULT)
#macro VIEW_WIDTH camera_get_view_width(CAM_DEFAULT)
#macro VIEW_HEIGHT camera_get_view_height(CAM_DEFAULT)

// editor
#macro TILE_SIZE 8

#macro TILEMAP_CELL_SIZE 32
#macro TILEMAP_PADDING 2

// mouse
#macro MOUSE_GUI_X device_mouse_x_to_gui(0)
#macro MOUSE_GUI_Y device_mouse_y_to_gui(0)

#macro MOUSE_LEFT mouse_check_button(mb_left)
#macro MOUSE_PRESSED_LEFT mouse_check_button_pressed(mb_left)
#macro MOUSE_RELEASED_LEFT mouse_check_button_released(mb_left)
#macro MOUSE_MIDDLE mouse_check_button(mb_middle)
#macro MOUSE_PRESSED_MIDDLE mouse_check_button_pressed(mb_middle)
#macro MOUSE_RELEASED_MIDDLE mouse_check_button_released(mb_middle)
#macro MOUSE_RIGHT mouse_check_button(mb_right)
#macro MOUSE_PRESSED_RIGHT mouse_check_button_pressed(mb_right)
#macro MOUSE_RELEASED_RIGHT mouse_check_button_released(mb_right)
