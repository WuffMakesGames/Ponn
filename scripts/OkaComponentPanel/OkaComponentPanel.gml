function OkaComponentPanel() : OkaComponentAbstract() constructor {
	var style = oka_get_theme()
	
	// variables
	static_width = 240
	static_height = 124
	round_x = style.border_radius_x
	round_y = style.border_radius_y
	
	blend_color = style.background_menu
	
	// @Public
	static set_round_x = function(val) {
		round_x = val
		return self
	}
	static set_round_y = function(val) {
		round_y = val
		return self
	}
	
	// @Private
	static __update = function() {
		
		
	}
	
	static __render = function() {
		if (round_x&round_y > 0) {
			draw_roundrect_ext(x-1,y-1,x+width-1,y+height-1,round_x,round_y,false)
		} else draw_sprite_stretched_ext(oka_sprite_panel,0,x,y,width,height,blend_color,alpha)
		
		// children
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i]
			_child.__render()
		}
	}
	
}