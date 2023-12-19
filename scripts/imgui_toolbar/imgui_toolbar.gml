function imgui_toolbar_window_toggle(label,enabled) {
	if (imgui.MenuItem(label,"",enabled)) enabled = !enabled
	return enabled
}

function imgui_toolbar(){
	var open_file = false
	var exit_modal = false
	
	imgui.BeginMainMenuBar()

	#region File
	if (imgui.BeginMenu("File")) {
		if (imgui.MenuItem("Open File", get_shortcut_string("file_open"))) get_open_p8()
	
		// saving
		imgui.Separator()
		imgui.MenuItem("Save File", get_shortcut_string("file_save"))
		imgui.MenuItem("Save File As...", get_shortcut_string("file_save_as"))
	
		// app
		imgui.Separator()
		if (imgui.MenuItem("Exit")) exit_modal = true
		imgui.MenuItem(get_time_string())
		
		imgui.EndMenu()
	}
	
	imgui.Spacing()
	#endregion

	#region Edit
	if (imgui.BeginMenu("Edit")) {
		
		// elements
		if (imgui.MenuItem("Undo",get_shortcut_string("undo"),,global.app_history_can_undo)) app_undo()
		if (imgui.MenuItem("Redo",get_shortcut_string("redo"),,global.app_history_can_redo)) app_redo()
		
		imgui.Separator()
		if (imgui.MenuItem("New Level",get_shortcut_string("new_level"))) {
			
		}
		if (imgui.MenuItem("New Room",get_shortcut_string("new_room"))) { 
			
		}
		
		imgui.EndMenu()
	}
	
	imgui.Spacing()
	#endregion

	#region Selection
	if (imgui.BeginMenu("Selection")) {
		imgui.EndMenu()
	}
	
	imgui.Spacing()
	#endregion

	#region View
	if (imgui.BeginMenu("View")) {
		imgui.EndMenu()
	}
	
	imgui.Spacing()
	#endregion

	#region Windows
	if (imgui.BeginMenu("Windows")) {
		window_level_open = imgui_toolbar_window_toggle("Levels",window_level_open)
		window_tilemap_open = imgui_toolbar_window_toggle("Tilemap Editor",window_tilemap_open)
		window_triggers_open = imgui_toolbar_window_toggle("Triggers",window_triggers_open)
		window_settings_open = imgui_toolbar_window_toggle("Settings",window_settings_open)
		window_history_open = imgui_toolbar_window_toggle("History",window_history_open)
	
		imgui.EndMenu()
	}
	#endregion

	imgui.EndMainMenuBar()

	// exit popup
	imgui_exit_popup(exit_modal)
}