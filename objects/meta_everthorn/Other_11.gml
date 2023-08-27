/// @description Inspector
inspector_panel_top = app_sidepanels_top + 42

oka_new_panel()
.set_width(512)
.set_height("110%")
.set_x("100%")
.set_align_x(OKA_ALIGN_X.RIGHT)
.set_color(style.background)
//.set_alpha(0.9)

inspector_panel_list = oka_new_list()
.set_list_direction(OKA_LIST_DIRECTION.VERTICAL)
.set_x("100%")
.set_width(512)
.set_height("100%")
.set_y(app_sidepanels_top)
.set_padding(2)
.set_align_x(OKA_ALIGN_X.RIGHT)
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

// Inspector
//inspector_label = oka_new_panel(inspector_panel_list)
//.set_width("100%")
//.set_height(32)
//.set_color(style.background)

oka_new_text(inspector_panel_list)
.set_text("Inspector")
.set_x("50%")
.set_align_x(OKA_ALIGN_X.MIDDLE)

// Pages
oka_new_list(inspector_panel_list)
.set_width("100%")
.set_height(32)
.set_padding(2)
.set_component_align_x(OKA_ALIGN_X.MIDDLE)
.add_component(everthorn_button(noone,"33%","100%","Tilemap",-1))
.add_component(everthorn_button(noone,"33%","100%","Camera Triggers",-1))
.add_component(everthorn_button(noone,"33%","100%","Room Bounds",-1))
.set_can_hover(false)

// Inspector Panel
inspector_panel = oka_new_panel(inspector_panel_list)
.set_width("100%")
.set_height("100%")
.set_color(style.background_secondary)
.set_on_resize(function(component) {
	component.set_height(window_height-component.y)
})
