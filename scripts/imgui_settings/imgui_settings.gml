function imgui_settings(window_flags) {
	var open = imgui.Begin("Settings",1,window_flags,ImGuiReturnMask.Both)
	
	// load project
	if (!global.app_state.project_loaded_data) {
		imgui.Text(LOAD_PROJECT_TEXT)
		return imgui_return_window(open);
	}
	
	// tabs
	imgui.BeginTabBar("settings_tabs")
	
	if (imgui.BeginTabItem("Level Settings")) {
		imgui_settings_level()
		imgui.EndTabItem()
	}
	if (imgui.BeginTabItem("Room Settings")) {
		imgui_settings_room()
		imgui.EndTabItem()
	}
	
	imgui.EndTabBar()
	
	// return
	imgui.End()
	return imgui_return_window(open);
}