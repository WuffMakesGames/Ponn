function imgui_history(window_flags) {
	var open = imgui.Begin("History",1,window_flags,ImGuiReturnMask.Both)
	
	for (var i = 0; i < array_length(global.app_history); i++) {
		if (i > global.app_history_pos) imgui.PushStyleColor(ImGuiCol.Button, global.app_style.background, 1.0)
		
		if (imgui.Button(string(i)+" - "+string(global.app_history_notes[i]), 180)) {
			app_load_history_position(i)
		}
		
		if (i > global.app_history_pos) imgui.PopStyleColor()
	}
	
	// return
	imgui.End()
	return imgui_return_window(open);
}