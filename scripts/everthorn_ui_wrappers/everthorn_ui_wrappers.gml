/// @desc Creates a button with a background and text
function everthorn_button(parent,width,height,text,callback,autosize=false) {
	
	var _panel = oka_new_panel(parent)
	.set_width(width)
	.set_height(height)
	.set_on_mouse_click(callback)
	.set_on_step(function(c) {
		c.set_color(c.get_hover() ? style.background_menu : style.background_secondary)
	})
	_panel.__update_pos()
	
	var _text = oka_new_text(_panel)
	.set_text(text)
	.set_color(style.high_emphasis)
	.set_x("50%")
	.set_y("50%")
	.set_align_x(OKA_ALIGN_X.MIDDLE)
	.set_align_y(OKA_ALIGN_Y.MIDDLE)
	.set_can_hover(false)
	
	if (autosize) _panel.set_width(_text.static_width+16)
	
	return _panel
}

function everthorn_menubutton(text) {
	
	var _panel = oka_new_panel()
	.set_height("100%")
	.set_y("50%")
	.set_align_y(OKA_ALIGN_Y.MIDDLE)
	.set_on_step(function(c) {
		c.set_color(c.get_hover() ? style.low_emphasis : style.background_menu)
	})
	_panel.__update_pos()
	
	var _text = oka_new_text(_panel)
	.set_text(text)
	.set_color(style.high_emphasis)
	.set_x("50%")
	.set_y("50%")
	.set_align_x(OKA_ALIGN_X.MIDDLE)
	.set_align_y(OKA_ALIGN_Y.MIDDLE)
	.set_can_hover(false)
	
	_panel.set_width(_text.static_width+16)
	
	return _panel
}

function everthorn_tilemap_button(list,sprite,index) {
	var left = (index % 16)*8
	var top = floor(index / 16)*8
	
	var panel = oka_new_panel(list)
	.set_rounding(0).set_interpolation(false)
	.set_width(TILESET_BUTTON_SIZE+2)
	.set_height(TILESET_BUTTON_SIZE+2)
	.set_color(c_white) //oka_get_theme().accent_regular)
	
	return oka_new_sprite(panel)
	.set_custom_var("index",index)
	.set_x("50%")
	.set_y("50%")
	.set_width(TILESET_BUTTON_SIZE)
	.set_height(TILESET_BUTTON_SIZE)
	.set_align_x(OKA_ALIGN_X.MIDDLE)
	.set_align_y(OKA_ALIGN_Y.MIDDLE)
	.set_sprite(sprite)
	.set_quad(left,top,8,8)
	.set_on_mouse_click(function(button) {
		global.tile_selected = button.get_custom_var("index")
	})
	.set_on_step(function(button) {
		var _selected = global.tile_selected == button.get_custom_var("index")
		var _hover = button.get_hover()
		
		button.set_color(_selected ? c_white : (_hover ? c_ltgray : c_gray))
		button.parent.set_alpha(_selected || _hover ? 1.0 : 0.0)
		button.parent.set_color(_selected ? c_aqua : c_white)
	})
}
