/// @description 
oka_init()
style = oka_get_theme()
style.border_radius_x = 16
style.border_radius_y = 16

draw_set_font(font_editor)
//show_debug_overlay(true)

window_set_caption("Everthorn")

// variables
global.level_selected_id = -1
global.levels = []

window_width = 0
window_height = 0

global.time_military = false
global.cursor_image = cr_arrow

menubar_height = 32
menubar_margin = 2
app_sidepanels_top = menubar_height + menubar_margin

// camera
camera = view_camera[0]
camera_scale = 1.0

camera_x = 0
camera_y = 0
camera_offset_x = 0
camera_offset_y = 0

camera_drag = false
camera_drag_x = 0
camera_drag_y = 0

// filedata
global.pico_data = false

// Generate Elements
event_user(0)
event_user(1)
event_user(2)
//event_user(3)

event_user(15)
event_user(15)
event_user(15)
event_user(15)
event_user(15)

alarm[0] = 4

show_debug_message("string thing: {0}",)
