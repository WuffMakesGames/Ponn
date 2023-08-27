function OkaComponentPanel() : OkaComponentAbstract() constructor {
	var style = oka_get_theme()
	
	// variables
	static_width = 240
	static_height = 124
	color = style.background_menu
	round_x = style.border_radius_x
	round_y = style.border_radius_y
	
	// @Public
	static set_color = function(color) {
		self.color = color
		return self
	}
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
		if (round_x > 0 || round_y > 0) {
			draw_set_color(color)
			draw_set_alpha(alpha)
			draw_roundrect_ext(x-1,y-1,x+width-1,y+height-1,round_x,round_y,false)
		} else draw_sprite_stretched_ext(oka_sprite_panel,0,x,y,width,height,color,alpha)
		
		// children
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i]
			_child.__render()
		}
	}
	
}