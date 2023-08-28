/// @description

style = oka_get_theme()
style.border_radius_x = 16
style.border_radius_y = 16

// camera
instance_create_depth(0,0,0,cam_editor)

// variables
global.level_selected_id = -1
global.levels = []

// window
global.window_resized = true
global.window_width = max(100, WINDOW_WIDTH)
global.window_height = max(100, WINDOW_HEIGHT)

// editor
global.time_military = false
global.cursor_image = cr_arrow

menubar_height = 32
menubar_margin = 2
app_sidepanels_top = menubar_height + menubar_margin

// filedata
global.pico_data = false

// Generate Elements
ui_generate_levels_panel()
ui_populate_levels_panel()

ui_generate_inspector_panel()
ui_populate_inspector_panel()

ui_generate_toolbar()
ui_populate_toolbar()

alarm[0] = 4
