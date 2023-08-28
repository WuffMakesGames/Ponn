function ui_generate_levels_panel() {
	oka_new_panel()
	.set_round_x(0).set_round_y(0)
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
	.add_component(everthorn_button(noone,levels_panel_list.static_width*0.5-1,"100%","Add",function() {
		everthorn_create_new_level()
	}))
	.add_component(everthorn_button(noone,levels_panel_list.static_width*0.5-1,"100%","Remove",-1))
	.set_can_hover(false)

	//levels_panel_list.add_component(everthorn_button(noone,"100%","32px","Rename",-1))
	
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

function ui_generate_inspector_panel() {
	oka_new_panel()
	.set_round_x(0).set_round_y(0)
	.set_width(512)
	.set_height("110%")
	.set_x("100%")
	.set_align_x(OKA_ALIGN_X.RIGHT)
	.set_color(style.background)

	inspector_panel_list = oka_new_list()
	.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
	.set_x("100%")
	.set_y(app_sidepanels_top)
	.set_width(512)
	.set_height("100%")
	.set_padding(2)
	.set_align_x(OKA_ALIGN_X.RIGHT)
	.add_component(oka_new_text().set_text("Inspector").set_x("50%").set_align_x(OKA_ALIGN_X.MIDDLE))
	.set_can_hover(false)
	//.set_on_step(function(c) {
	//	if (c.get_custom_var("dragging")) {
	//		c.set_width(clamp(window_width-OKA_MOUSE_X, 512, 912))
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
	.set_component_align_x(OKA_ALIGN_X.MIDDLE)
	.add_component(everthorn_button(noone,"33%","100%","Tilemap",-1))
	.add_component(everthorn_button(noone,"33%","100%","Camera Triggers",-1))
	.add_component(everthorn_button(noone,"33%","100%","Rooms",-1))
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
}
function ui_create_tilemap_tab(panel=noone) {
	
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
