
// settings
#macro TILESET_BUTTON_SIZE 32
#macro TILESET_BUTTON_PADDING 2

function imgui_tilemap(window_flags) {
	
	var open = imgui.Begin("Tilemap",1,window_flags,ImGuiReturnMask.Both)
	
	// methods
	static make_tool = function(name,tool) {
		if (imgui.RadioButton(name, global.tool_selected == tool)) global.tool_selected = tool
	}
	
	// tools
	imgui.Text("Tools:")
	make_tool("Brush", TOOL_ID.brush) imgui.SameLine()
	make_tool("Picker", TOOL_ID.picker) imgui.SameLine()
	make_tool("Fill", TOOL_ID.fill) imgui.SameLine()
	make_tool("Rectangle", TOOL_ID.rectangle) imgui.SameLine()
	make_tool("Selection", TOOL_ID.selection)
	imgui.Spacing()
	
	// tileset
	var surface = global.spritesheet_surface
	var left = imgui.GetCursorScreenPosX()
	var top = imgui.GetCursorScreenPosY()
	
	var list = imgui.GetBackgroundDrawList()
	
	if (surface_exists(surface)) {
		var width = surface_get_width(surface)
		var height = surface_get_height(surface)
		//imgui.DrawListPushClipRect(list,left,top,left+width,top+height,false)
		
		//imgui.DrawListAddRect(list,left,top,left+width,top+height,c_white,5)
		
		//imgui.DrawListPopClipRect(list)
		
		imgui.Surface(surface)
	
		if (imgui.IsItemHovered() && MOUSE_LEFT) {
			var cell_size = TILEMAP_CELL_SIZE
			var cell_padding = TILEMAP_PADDING
			var real_size = cell_size + cell_padding
			
			var cursor_x = MOUSE_GUI_X - left
			var cursor_y = MOUSE_GUI_Y - top
			var tile_x = clamp(floor(cursor_x / real_size), 0, 15)
			var tile_y = clamp(floor(cursor_y / real_size), 0, 7)
			
			global.spritesheet_selection.set_rectangle(tile_x,tile_y,1,1)
		}
	}
	
	// brushes
	imgui.Spacing()
	imgui.Text("Brushes")
	
	// return
	imgui.End()
	return imgui_return_window(open);
}