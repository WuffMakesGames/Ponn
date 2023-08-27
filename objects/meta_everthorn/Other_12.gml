/// @description Menu Bar

// Toolbar
toolbar = oka_new_panel()
.set_width("100%")
.set_height("32px")

toolbar_list = oka_new_list(toolbar)
.set_x(4)
.set_width("100%")
.set_height("100%")
.set_can_hover(false)
toolbar_list.add_component(everthorn_menubutton("File"))
toolbar_list.add_component(everthorn_menubutton("Level"))
toolbar_list.add_component(everthorn_menubutton("Selection"))
toolbar_list.add_component(everthorn_menubutton("View"))

// Clock
oka_new_text(toolbar)
.set_x("100%")
.set_y("50%")
.set_align_x(OKA_ALIGN_X.RIGHT)
.set_align_y(OKA_ALIGN_X.MIDDLE)
.set_on_step(function(c) {
	c.set_text(get_time_string(global.time_military))
})
.set_on_mouse_click(function(c) {
	global.time_military = !global.time_military
	c.set_text(get_time_string(global.time_military))
	c.__update_pos()
})
.offset_x = -14

