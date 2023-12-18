function imgui_settings_level(){
	imgui.Spacing()
	var level = global.app_state.project_levels[global.app_state.level_selected]
		
	if (!level) {
		imgui.Text("Select a level")
		return;
	}

	if (imgui.Button("New Level",150)) {}
	imgui.SameLine()
	if (imgui.Button("Delete Level",150)) {}
}