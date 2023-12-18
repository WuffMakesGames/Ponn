function imgui_exit_popup(appear=false) {
	//if (appear) imgui.OpenPopup("Exit?")
	
	if (appear) {
		var quit = show_question("Are you sure you want to exit?")
		if (quit) game_end()
	}
	
	//imgui.SetNextWindowPos(window_get_width() / 2, window_get_height () / 2, ImGuiCond.Appearing, 0.5, 0.5);
	//if (imgui.BeginPopupModal("Exit?", undefined, ImGuiWindowFlags.NoResize | ImGuiWindowFlags.NoMove)) {
	//	imgui.Text("Are you sure you want to exit?")
	//	imgui.Separator()
	//	if (imgui.Button("Yes")) game_end()
	//	imgui.SameLine()
	//	if (imgui.Button("Nevermind")) imgui.CloseCurrentPopup()
	//	imgui.EndPopup()
	//}
}