function imgui_triggers(window_flags) {
	var open = imgui.Begin("Triggers",1,window_flags,ImGuiReturnMask.Both)
	
	
	
	// return
	imgui.End()
	return imgui_return_window(open);
}