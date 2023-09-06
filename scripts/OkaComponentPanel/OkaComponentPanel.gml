function OkaComponentPanel() : OkaComponentAbstract() constructor {
	var style = oka_get_theme()
	
	// variables
	static_width = 240
	static_height = 124
	rounding = style.border_radius
	
	use_interpolate = true
	blend_color = style.background_menu
	border_color = false
	border_thickness = 0
	
	// @Public
	static set_rounding = function(val) {
		rounding = val
		return self
	}
	static set_border_color = function(color) {
		border_color = color
		return self
	}
	static set_border_thickness = function(thickness) {
		border_thickness = thickness
		return self
	}
	
	static set_interpolation = function(enabled) {
		use_interpolate = enabled
		return self
	}
	
	// @Private
	static __update = function() {}
	static __render = function() {
		if (use_interpolate) { // Clean Shapes
			var _rectangle = CleanRectangle(x-1,y-1,x+width,y+height).Rounding(rounding)
			if (border_color != false) _rectangle.Border(border_thickness,border_color,alpha)
			_rectangle.Draw()
		} else {
			draw_sprite_stretched_ext(oka_sprite_panel,0,x,y,width,height,blend_color,alpha)
		}
		
		//if (border_color != false) {
		//	draw_set_color(border_color)
		//	if (round_x&round_y > 0) draw_roundrect_ext(x-1,y-1,x+width-1,y+height-1,round_x,round_y,true)
		//	else draw_sprite_stretched_ext(oka_sprite_panel,1,x,y,width,height,border_color,alpha)
		//}
	}
	
}
