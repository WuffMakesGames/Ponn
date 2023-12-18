/// @description 

if (keyboard_check_pressed(vk_escape)) show_style_editor = !show_style_editor
if (show_style_editor) imgui.ShowDemoWindow()

// spritesheet
event_user(15)

// elements
imgui_toolbar()

if (window_level_open) window_level_open = imgui_levels(window_panels_flags)
if (window_settings_open) window_settings_open = imgui_settings(window_panels_flags)
if (window_tilemap_open) window_tilemap_open = imgui_tilemap(window_panels_flags)
if (window_triggers_open) window_triggers_open = imgui_triggers(window_panels_flags)

// editor
global.ui_hover = imgui.WantMouseCapture()
