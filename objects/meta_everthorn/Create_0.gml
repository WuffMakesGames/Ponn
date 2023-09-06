/// @description

style = oka_get_theme()
style.border_radius = 8

// camera
instance_create_depth(0,0,0,cam_editor)

// editor gui
global.time_military = false
global.cursor_image = cr_arrow
global.cursor_interaction_blocked = false

global.tile_buttons = []
global.inspector_panel_open = INSPECTOR_TAB.tilemap

menubar_height = 32
menubar_margin = 2
app_sidepanels_top = menubar_height + menubar_margin

// editor variables
global.pico_data_loaded = false
global.pico_data = false

global.levels = []
global.level_selected = -1
global.room_selected = noone

global.tile_selection = [0,0,1,1]
global.editor_tool = EDITOR_TOOL.brush

// Generate Elements
ui_generate_levels_panel()
ui_populate_levels_panel()

ui_generate_inspector_panel()
ui_populate_inspector_panel()

ui_generate_toolbar()
ui_populate_toolbar()
