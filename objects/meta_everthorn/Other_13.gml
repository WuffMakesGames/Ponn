/// @description Map


map_panel = oka_new_panel()
.set_color(style.background_menu)
.set_on_step(function(c) {
	var _top = app_sidepanels_top + string_height(" ")
	var _bottom = window_height
	var _left = levels_panel_list.x + levels_panel_list.width
	var _right = inspector_panel.x
	c.set_x(_left)
	c.set_y(_top)
	c.set_width(_right-_left)
	c.set_height(_bottom-_top)
})
