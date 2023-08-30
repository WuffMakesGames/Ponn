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
  
	return oka_new_sprite(list)
	.set_custom_var("index",index)
	.set_width(30)
	.set_height("100%")
	.set_sprite(sprite)
	.set_quad(left,top,8,8)
	.set_on_mouse_click(function(c) {
		global.tile_selected = c.get_custom_var("index")
	})
}
