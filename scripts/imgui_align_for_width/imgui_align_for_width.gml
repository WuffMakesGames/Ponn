function imgui_align_for_width(width,alignment=0.5) {
	
	var region = imgui.GetContentRegionAvailX()
	var offset = (region - width) * alignment
	if (offset > 0) imgui.SetCursorPosX(imgui.GetCursorPosX() + offset)
	
}