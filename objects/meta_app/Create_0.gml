/// @description 
imgui.__Initialize()
imgui.ConfigFlagToggle(ImGuiConfigFlags.DockingEnable)

// globals
global.app_style = new AppStyle()
global.app_state = new AppState()

global.app_history = [global.app_state.save_state()]
global.app_history_notes = ["App Opened"]
global.app_history_pos = 0

global.app_history_can_undo = false
global.app_history_can_redo = false
global.app_history_updated = false

global.interaction_state = INTERACTION_STATE.free
global.ui_hover = false

global.spritesheet_surface = -1
global.spritesheet_selection = new Selection(0,0,1,1)
global.tool_selected = TOOL_ID.brush

// instances
instance_create_depth(0,0,0,meta_shortcuts_manager)
instance_create_depth(0,0,0,cam_editor)
instance_create_depth(0,0,0,meta_room_manager)

// font
font_renogare = imgui.AddFontFromFile("fonts/Renogare-Regular.otf", 18)

// windows
window_panels_flags = ImGuiWindowFlags.AlwaysAutoResize

window_level_open = false
window_settings_open = false
window_tilemap_open = false
window_triggers_open = false
window_history_open = false

// variables
style = global.app_style

inspector_tab_id = INSPECTOR_TAB.tilemap
show_style_editor = false
