function imgui_levels(window_flags) {
	var open = imgui.Begin("Levels",true,window_flags,ImGuiReturnMask.Both)
	
	if (!global.app_state.project_loaded_data) {
		imgui.Text(LOAD_PROJECT_TEXT)
		return imgui_return_window(open);
	}
	
	for (var i = 0; i < array_length(global.app_state.project_levels); i++) {
		var level = global.app_state.project_levels[i]
		
		// drop down
		if (imgui.CollapsingHeader("Level " + string(i))) {
			var regions = level.regions
			
			for (var ii = 0; ii < array_length(regions); ii++) {
				var region = regions[ii]
				var label = "Region " + string_concat(i,"-",ii)
				
				imgui.Spacing()
				imgui_align_for_width(192)
				if (imgui.Selectable(label, global.app_state.region_selected == region, ImGuiSelectableFlags.None, 192)) {
					// focus
					if (global.app_state.region_selected == region) {
						global.camera_x = region.x + region.width*TILE_SIZE*0.5
						global.camera_y = region.y + region.height*TILE_SIZE*0.5
					} else {
						level.focus_region(region)
					}
				}
			}
		}
	}
	
	// complete
	imgui.End()
	return imgui_return_window(open);
}