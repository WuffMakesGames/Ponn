function OkaComponentAbstract() constructor {
	style = oka_get_theme()
	
	// variables
	align_x = OKA_ALIGN_X.LEFT
	align_y = OKA_ALIGN_Y.TOP
	offset_x = 0
	offset_y = 0
	static_x = 0
	static_y = 0
	x = 0
	y = 0
	static_width = 100
	static_height = 100
	width = 100
	height = 100
	children = []
	parent = noone
	element_variables = {}
	can_hover = true
	alpha = 1.0
	
	// callbacks
	on_mouse_enter		= -1
	on_mouse_exit		= -1
	on_mouse_click		= -1
	on_mouse_release	= -1
	on_resize			= -1
	on_step				= -1
	
	// @Public
	static set_x = function(x) {
		static_x = x
		return self
	}
	static set_y = function(y) {
		static_y = y
		return self
	}
	static set_width = function(width) {
		static_width = width
		return self
	}
	static set_height = function(height) {
		static_height = height
		return self
	}
	static set_align_x = function(align) {
		align_x = align
		return self
	}
	static set_align_y = function(align) {
		align_y = align
		return self
	}
	
	static set_on_mouse_enter = function(callback) {
		on_mouse_enter = callback
		return self
	}
	static set_on_mouse_exit = function(callback) {
		on_mouse_exit = callback
		return self
	}
	static set_on_mouse_click = function(callback) {
		on_mouse_click = callback
		return self
	}
	static set_on_mouse_release = function(callback) {
		on_mouse_release = callback
		return self
	}
	
	static set_alpha = function(alpha) {
		self.alpha = alpha
		return self
	}
	
	static set_on_resize = function(callback) {
		on_resize = callback
		return self
	}
	static set_on_step = function(callback) {
		on_step = callback
		return self
	}
	
	static set_can_hover = function(enabled) {
		can_hover = enabled
		return self
	}
	static get_hover = function() {
		var manager = oka_get_manager()
		return manager.component_hover_previous == self && check_hover(OKA_MOUSE_X,OKA_MOUSE_Y)
	}
	static check_hover = function(mx,my) {
		return can_hover && point_in_rectangle(mx,my,x,y,x+width,y+height)
	}
	
	static set_custom_var = function(name,value) {
		variable_struct_set(element_variables,name,value)
		return self
	}
	static get_custom_var = function(name,value) {
		return variable_struct_get(element_variables,name)
	}
	
	// @Private
	static __update_component = function() {
		__update_pos()
		__update()
		__update_children()
		
		if (on_step) on_step(self)
	}
	static __update_children = function() {
		for (var i = 0; i < array_length(children); i++) {
			var comp = children[i]
			comp.__update_component()
		}
	}
	static __update_pos = function() {
		var app_width = surface_get_width(application_surface)
		var app_height = surface_get_height(application_surface)
		
		if (parent) {
			x = __oka_parse_value(static_x,parent.width) + parent.x
			y = __oka_parse_value(static_y,parent.height) + parent.y
			width = __oka_parse_value(static_width,parent.width)
			height = __oka_parse_value(static_height,parent.height)
		} else {
			x = __oka_parse_value(static_x,app_width)
			y = __oka_parse_value(static_y,app_height)
			width = __oka_parse_value(static_width,app_width)
			height = __oka_parse_value(static_height,app_height)
		}
		
		// offset
		x += offset_x
		y += offset_y
		
		// horizontal alignment
		switch (align_x) {
			case OKA_ALIGN_X.MIDDLE:
				x -= width*0.5
				break;
			case OKA_ALIGN_X.RIGHT:
				x -= width
				break;
		}
			
		// vertical alignment
		switch (align_y) {
			case OKA_ALIGN_Y.MIDDLE:
				y -= height*0.5
				break;
			case OKA_ALIGN_Y.BOTTOM:
				y -= height
				break;
		}
	}
	
}