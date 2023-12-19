function imgui_settings_room(){
	imgui.Spacing()
	var region = global.app_state.region_selected
		
	if (!region) {
		imgui.Text("Select a room")
		return;
	}
			
	if (imgui.Button("New Room",150)) {}
	imgui.SameLine()
	if (imgui.Button("Delete Room",150)) {}
			
	// x position
	imgui.PushButtonRepeat(true)
	if (imgui.ArrowButton("rm_x_minus",ImGuiDir.Left)) region.shift_position(-1,0) imgui.SameLine()
	if (imgui.ArrowButton("rm_x_plus",ImGuiDir.Right)) region.shift_position(1,0) imgui.SameLine()
	imgui.PopButtonRepeat()
			
	imgui.SetNextItemWidth(150)
	var input_x = imgui.InputInt("X Position",region.x,0,0)
	region.set_x(input_x)
	
	// y position
	imgui.PushButtonRepeat(true)
	if (imgui.ArrowButton("rm_y_minus",ImGuiDir.Left)) region.shift_position(0,-1) imgui.SameLine()
	if (imgui.ArrowButton("rm_y_plus",ImGuiDir.Right)) region.shift_position(0,1) imgui.SameLine()
	imgui.PopButtonRepeat()
	
	imgui.SetNextItemWidth(150)
	var input_y = imgui.InputInt("Y Position",region.y,0,0)
	region.set_y(input_y)
			
	// width
	imgui.PushButtonRepeat(true)
	if (imgui.ArrowButton("rm_w_minus",ImGuiDir.Left)) region.set_size(region.width-1,region.height) imgui.SameLine()
	if (imgui.ArrowButton("rm_w_plus",ImGuiDir.Right)) region.set_size(region.width+1,region.height) imgui.SameLine()
	imgui.PopButtonRepeat()
			
	imgui.SetNextItemWidth(150)
	var input_w = imgui.InputInt("Width",region.width)
	region.set_size(input_w,region.height)
			
	// height
	imgui.PushButtonRepeat(true)
	if (imgui.ArrowButton("rm_h_minus",ImGuiDir.Left)) region.set_height(region.height-1) imgui.SameLine()
	if (imgui.ArrowButton("rm_h_plus",ImGuiDir.Right)) region.set_height(region.height+1) imgui.SameLine()
	imgui.PopButtonRepeat()
			
	imgui.SetNextItemWidth(150)
	var input_h = imgui.InputInt("Height",region.height)
	region.set_height(input_h)
			
	// settings
	for (var i = 0; i < array_length(global.app_state.room_parameters); i++) {
		var parameter = global.app_state.room_parameters[i]
		imgui.InputText(parameter.label,"Undefined")
	}
}