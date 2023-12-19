/// @description 

if (keyboard_check_pressed(vk_escape)) show_style_editor = !show_style_editor
if (show_style_editor) imgui.ShowDemoWindow()

// spritesheet
event_user(15)

// elements
imgui_toolbar()

window_level_open = imgui_open_window(window_level_open,imgui_levels)
window_settings_open = imgui_open_window(window_settings_open,imgui_settings)
window_tilemap_open = imgui_open_window(window_tilemap_open,imgui_tilemap)
window_triggers_open = imgui_open_window(window_triggers_open,imgui_triggers)
window_history_open = imgui_open_window(window_history_open,imgui_history)

// editor
global.ui_hover = imgui.WantMouseCapture()

// history
global.app_history_can_undo = global.app_history_pos >= 1
global.app_history_can_redo = global.app_history_pos < array_length(global.app_history)-1
