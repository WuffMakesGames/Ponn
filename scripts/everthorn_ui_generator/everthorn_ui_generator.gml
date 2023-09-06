function ui_generate_levels_panel() {
	oka_new_panel()
	.set_rounding(0)
	.set_width(180)
	.set_height("110%")
	.set_color(style.background)

	levels_panel_list = oka_new_list()
	.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
	.set_width(180)
	.set_height("100%")
	.set_y(app_sidepanels_top)
	.set_padding(2)
	.add_component(oka_new_text().set_text("Levels").set_x("50%").set_align_x(OKA_ALIGN_X.MIDDLE))
	.set_can_hover(false)

	// Options
	oka_new_list(levels_panel_list)
	.set_width("100%")
	.set_height(32)
	.set_padding(2)
	.set_component_align_x(OKA_ALIGN_X.MIDDLE)
	.add_component(everthorn_button(noone,levels_panel_list.static_width*0.5-1,"100%","Add",function() { everthorn_create_new_level() }))
	.add_component(everthorn_button(noone,levels_panel_list.static_width*0.5-1,"100%","Remove",-1))
	.set_can_hover(false)

	//rooms_panel_list.add_component(everthorn_button(noone,"100%","32px","Rename",-1))
	
	levels_panel = oka_new_panel(levels_panel_list)
	.set_width("100%")
	.set_height("100%")
	.set_color(style.background_secondary)
	.set_on_resize(function(c) {
		c.set_height(global.window_height-c.y)
	})
	
}
function ui_populate_levels_panel() {
	levels_list = oka_new_list(levels_panel)
	.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
	.set_y(8)
	.set_width("100%")
	.set_height("100%")
}

#macro INSPECTOR_WIDTH_MIN 580
#macro INSPECTOR_WIDTH_MAX 944
function ui_generate_inspector_panel() {
	
	oka_new_panel()
	.set_rounding(0)
	.set_width(INSPECTOR_WIDTH_MIN)
	.set_height("110%")
	.set_x("100%")
	.set_align_x(OKA_ALIGN_X.RIGHT)
	.set_color(style.background)

	inspector_panel_list = oka_new_list()
	.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
	.set_x("100%")
	.set_y(app_sidepanels_top)
	.set_width(INSPECTOR_WIDTH_MIN)
	.set_height("100%")
	.set_padding(2)
	.set_align_x(OKA_ALIGN_X.RIGHT)
	.add_component(oka_new_text().set_text("Inspector").set_x("50%").set_align_x(OKA_ALIGN_X.MIDDLE))
	.set_can_hover(false)
	//.set_on_step(function(c) {
	//	if (c.get_custom_var("dragging")) {
	//		c.set_width(clamp(global.window_width-OKA_MOUSE_X, INSPECTOR_WIDTH_MIN, INSPECTOR_WIDTH_MAX))
	//		c.set_custom_var("dragging", mouse_check_button(mb_left))
	//		global.cursor_image = cr_size_we
	//	} else if (point_in_rectangle(OKA_MOUSE_X,OKA_MOUSE_Y,c.x-5,c.y,c.x+5,c.y+c.height)) {
	//		c.set_custom_var("dragging",OKA_MOUSE_PRESSED_LEFT)
	//		global.cursor_image = cr_size_we
	//	}
	//})
}
function ui_populate_inspector_panel() {
	oka_new_list(inspector_panel_list)
	.set_width("100%")
	.set_height(32)
	.set_padding(2)
	//.set_component_align_x(OKA_ALIGN_X.MIDDLE)
	.add_component(everthorn_button(noone,"33%","100%","Tilemap",function() { global.inspector_panel_open = INSPECTOR_TAB.tilemap }))
	.add_component(everthorn_button(noone,"33%","100%","Triggers",function() { global.inspector_panel_open = INSPECTOR_TAB.triggers }))
	.add_component(everthorn_button(noone,"33%","100%","Rooms",function() { global.inspector_panel_open = INSPECTOR_TAB.rooms }))
	.set_can_hover(false)

	// Inspector Panel
	inspector_panel = oka_new_panel(inspector_panel_list)
	.set_width("100%")
	.set_height("100%")
	.set_color(style.background_secondary)
	.set_on_resize(function(component) {
		component.set_height(global.window_height-component.y)
	})
	
	// Tabs
	ui_create_tilemap_tab(inspector_panel)
	ui_create_rooms_tab(inspector_panel)
}
function ui_create_tilemap_tab(panel=noone) {
	#macro TILESET_BUTTON_SIZE 32
	global.tile_buttons = []
	
	var _tilemap_tab = oka_new_list(panel)
	.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
	.set_align_x(OKA_ALIGN_X.MIDDLE)
	.set_x("50%")
	.set_y(8)
	.set_width(TILESET_BUTTON_SIZE*17)
	.set_height("100%")
	.set_padding(8)
	.set_on_step(function(tab) {
		tab.set_visible(global.inspector_panel_open == INSPECTOR_TAB.tilemap)
	})
	
	oka_new_text(_tilemap_tab).set_text("Tilemap").set_x("50%").set_align_x(OKA_ALIGN_X.MIDDLE)
	
	// Tools
	var _sublist = oka_new_list(_tilemap_tab)
	.set_width("100%")
	.set_height(32)
	
	oka_new_list(_sublist)
	.set_width("50%")
	.set_height("100%")
	.add_component(oka_new_text().set_text("Tools:").set_y("50%").set_align_y(OKA_ALIGN_Y.MIDDLE))
	
	var _tool_step = function(tool) {
		var _selected = tool.get_custom_var("tool_id") == global.editor_tool
		tool.set_color(_selected ? style.low_emphasis : (tool.get_hover() ? style.background_menu : style.background_secondary))
	}
	var _tool_click = function(tool) {
		global.editor_tool = tool.get_custom_var("tool_id")
	}
	
	var _list_b = oka_new_list(_sublist)
	.set_width("50%")
	.set_height("100%")
	.set_component_align_x(OKA_ALIGN_X.RIGHT)
	.set_padding(8)
	
	everthorn_button(_list_b,"24%","100%","Brush",_tool_click,true).set_custom_var("tool_id",EDITOR_TOOL.brush).set_on_step(_tool_step)
	everthorn_button(_list_b,"24%","100%","Fill",_tool_click,true).set_custom_var("tool_id",EDITOR_TOOL.fill).set_on_step(_tool_step)
	everthorn_button(_list_b,"24%","100%","Rectangle",_tool_click,true).set_custom_var("tool_id",EDITOR_TOOL.rectangle).set_on_step(_tool_step)
	everthorn_button(_list_b,"24%","100%","Selection",_tool_click,true).set_custom_var("tool_id",EDITOR_TOOL.selection).set_on_step(_tool_step)
	
	// Tileset
	//oka_new_text(_tilemap_tab).set_text("Tiles:")
	
	//var _tilemap_list = oka_new_list(_tilemap_tab)
	//.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
	//.set_custom_var("index", INSPECTOR_TAB.tilemap)
	//.set_x("50%")
	//.set_width("100%")
	//.set_height(TILESET_BUTTON_SIZE*8.5)
	//.set_align_x(OKA_ALIGN_X.MIDDLE)
	//.set_padding(2)
	//.set_on_step(function(list) {
	//	list.set_visible(global.inspector_panel_open == list.get_custom_var("index"))
	//})
	
	// create rows
	//for (var i = 0; i < 8; i++) {
	//	var _list = oka_new_list(_tilemap_list)
	//	.set_width("100%")
	//	.set_height(TILESET_BUTTON_SIZE)
		
	//	// buttons
	//	for (var j = 0; j < 16; j++) {
	//		array_push(global.tile_buttons, everthorn_tilemap_button(_list,spr_pico_spritesheet_empty,j+i*16))
	//	}
	//}
	
	global.tileset_canvas = oka_new_canvas(_tilemap_tab,(TILESET_BUTTON_SIZE+2)*16,(TILESET_BUTTON_SIZE+2)*8)
	.set_on_mouse_click(function(canvas) {
		canvas.set_custom_var("tile_dragging",true)
		canvas.set_custom_var("tile_drag_x",OKA_MOUSE_X-canvas.x)
		canvas.set_custom_var("tile_drag_y",OKA_MOUSE_Y-canvas.y)
	})
	.set_on_step(function(canvas) {
		var _sprite = global.pico_data_loaded ? global.pico_data.spritesheet : spr_pico_spritesheet_empty
		var _size = TILESET_BUTTON_SIZE + 2
		
		// canvas
		canvas.begin_draw()
		drawstate_push()
		draw_clear_alpha(c_black,1.0)
		
		// update selection
		var _selection_hover = -1
		var _mouse_x = OKA_MOUSE_X - canvas.x
		var _mouse_y = OKA_MOUSE_Y - canvas.y
		
		var _tile_x = clamp(floor(_mouse_x / _size), 0, 15)
		var _tile_y = clamp(floor(_mouse_y / _size), 0, 7)
		if (canvas.get_custom_var("tile_dragging")) {
			var _start_x = floor(canvas.get_custom_var("tile_drag_x") / _size)
			var _start_y = floor(canvas.get_custom_var("tile_drag_y") / _size)
			var _min_x = _tile_x < _start_x
			var _min_y = _tile_y < _start_y
			
			global.tile_selection = [
				_min_x ? _tile_x : _start_x, // x1
				_min_y ? _tile_y : _start_y, // y1
				_min_x ? _start_x + 1 : _tile_x + 1, // x2
				_min_y ? _start_y + 1 : _tile_y + 1, // y2
			]
			
			canvas.set_custom_var("tile_dragging", mouse_check_button(mb_left))
		}
		
		// draw selection
		var _selection = global.tile_selection
		var _selection_width = _selection[2] - _selection[0]
		var _selection_height = _selection[3] - _selection[1]
		
		var _selection_x = _selection[0] * _size
		var _selection_y = _selection[1] * _size
		
		draw_set_color(c_aqua)
		if (canvas.get_custom_var("tile_dragging")) draw_gridrect(_selection_x,_selection_y,_selection_x+_selection_width*_size,_selection_y+_selection_height*_size,c_white,1.0)
		else draw_rectangle(_selection_x+1,_selection_y+1,_selection_x+_selection_width*_size-2,_selection_y+_selection_height*_size-2,true)
		
		// draw tiles
		for (var ty = 0; ty < 8; ty++) {
			for (var tx = 0; tx < 16; tx++) {
				var _draw_left = _size * tx+1
				var _draw_top = _size * ty+1
			
				// state
				var _selected = point_in_rectangle(tx,ty,_selection[0],_selection[1],_selection[2]-1,_selection[3]-1)
				var _hover = point_in_rectangle(
					OKA_MOUSE_X,OKA_MOUSE_Y,
					canvas.x + _draw_left, canvas.y + _draw_top,
					canvas.x + _draw_left + TILESET_BUTTON_SIZE,
					canvas.y + _draw_top + TILESET_BUTTON_SIZE,
				)
			
				// draw
				var _color = _selected ? c_white : (_hover ? c_ltgray : c_gray)
				draw_sprite_part_ext(_sprite,0,tx*8,ty*8,8,8,_draw_left,_draw_top,TILESET_BUTTON_SIZE/8,TILESET_BUTTON_SIZE/8,_color,1.0)
			}
		}
		
		canvas.end_draw()
		drawstate_pop()
	})
	
	// Palette
	var _sublist = oka_new_list(_tilemap_tab)
	.set_width("100%")
	.set_height(32)
	
	var _list_a = oka_new_list(_sublist)
	.set_width("50%")
	.set_height("100%")
	
	var _list_b = oka_new_list(_sublist)
	.set_width("50%")
	.set_height("100%")
	.set_component_align_x(OKA_ALIGN_X.RIGHT)
	.set_padding(8)
	
	oka_new_text(_list_a).set_text("Brushes:").set_y("50%").set_align_y(OKA_ALIGN_Y.MIDDLE)
	everthorn_button(_list_b,0,"100%","Add",-1,true)
	everthorn_button(_list_b,0,"100%","Remove",-1,true)
}
function ui_create_rooms_tab(panel=noone) {

	var rooms_tab = oka_new_list(panel)
	.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
	.set_align_x(OKA_ALIGN_X.MIDDLE)
	.set_x("50%")
	.set_y(8)
	.set_width(TILESET_BUTTON_SIZE*17)
	.set_height("100%")
	.set_padding(8)
	.set_on_step(function(tab) {
		tab.set_visible(global.inspector_panel_open == INSPECTOR_TAB.rooms)
	})
	
	oka_new_text(rooms_tab).set_text("Rooms").set_x("50%").set_align_x(OKA_ALIGN_X.MIDDLE)

	// Options
	oka_new_list(rooms_tab)
	.set_width("100%")
	.set_height(32)
	.set_padding(2)
	.set_component_align_x(OKA_ALIGN_X.MIDDLE)
	.add_component(everthorn_button(noone,rooms_tab.static_width*0.5-1,"100%","Add",-1))
	.add_component(everthorn_button(noone,rooms_tab.static_width*0.5-1,"100%","Remove",-1))
	.set_can_hover(false)

	//rooms_tab.add_component(everthorn_button(noone,"100%","32px","Rename",-1))
	
	rooms_list = oka_new_list(rooms_tab)
	.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
	.set_y(8)
	.set_width("100%")
	.set_height("100%")
}

function ui_generate_toolbar() {
	toolbar = oka_new_panel()
	.set_width("100%")
	.set_height("32px")
	
	// toolbar
	toolbar_list = oka_new_list(toolbar)
	.set_x(4)
	.set_width("100%")
	.set_height("100%")
	.set_padding(2)
	.set_can_hover(false)
	
	// widgets
	toolbar_widgets = oka_new_list(toolbar)
	.set_x("100%")
	.set_height("100%")
	.set_align_x(OKA_ALIGN_X.RIGHT)
	.set_component_align_x(OKA_ALIGN_X.RIGHT)
	.set_can_hover(false)
	toolbar_widgets.offset_x = -14
}
function ui_populate_toolbar() {
	toolbar_list.add_component(everthorn_menubutton("File"))
	toolbar_list.add_component(everthorn_menubutton("Level"))
	toolbar_list.add_component(everthorn_menubutton("Selection"))
	toolbar_list.add_component(everthorn_menubutton("View"))
	
	// Clock
	oka_new_text(toolbar_widgets)
	.set_y("50%")
	.set_align_y(OKA_ALIGN_Y.MIDDLE)
	.set_on_step(function(c) {
		c.set_text(get_time_string(global.time_military))
		c.__update_pos()
	})
	.set_on_mouse_click(function(c) {
		global.time_military = !global.time_military
		//c.set_text(get_time_string(global.time_military))
		//c.__update_pos()
	})
	
}
