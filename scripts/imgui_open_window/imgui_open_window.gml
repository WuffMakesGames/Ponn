function imgui_open_window(opened,window) {
	if (opened) opened = window(window_panels_flags)
	return opened
}