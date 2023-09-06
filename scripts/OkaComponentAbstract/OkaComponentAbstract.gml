function OkaComponentAbstract() constructor {
	style = oka_get_theme()
	
	// variables
	element_variables = {}
	children = []
	
	align_x = OKA_ALIGN_X.LEFT
	align_y = OKA_ALIGN_Y.TOP
	static_x = 0
	static_y = 0
	x = 0
	y = 0
	
	offset_x = 0
	offset_y = 0
	
	static_width = 100
	static_height = 100
	width = 100
	height = 100
	
	parent = noone
	can_hover = true
	
	blend_color = c_white
	alpha = 1.0
	visible = true
	
	// callbacks
	static foo = function() {}
	
	on_mouse_enter		= foo
	on_mouse_exit		= foo
	on_mouse_click		= foo
	on_mouse_release	= foo
	on_resize			= foo
	on_step				= foo
	
	__on_destroy		= foo
	
	#region @Public	
	static destroy = function() {
		oka_remove_component(self)
		__on_destroy()
		remove_parent()
		destroy_children()
	}
	static destroy_children = function() {
		for (var i = 0; i < array_length(children); i++) {
			show_debug_message("destroying child...")
			children[i].destroy()
		}
		children = []
	}
	static remove_parent = function() {
		if (!parent) return
		for (var i = 0; i < array_length(parent.children); i ++) {
			if (parent.children[i] == self) {
				array_delete(parent.children,i,1)
				break;
			}
		}
	}
	static check_hover = function(mx,my) {
		return can_hover && component_check_can_hover() && point_in_rectangle(mx,my,x,y,x+width,y+height)
	}
	static component_check_can_hover = function() {
		return visible && (parent == noone ? true : parent.component_check_can_hover())
	}
	#endregion
	
	#region @Setters
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
	
	static set_color = function(color) {
		self.blend_color = color
		return self
	}
	static set_alpha = function(alpha) {
		self.alpha = alpha
		return self
	}
	static set_visible = function(visible) {
		self.visible = visible
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
	static set_custom_var = function(name,value) {
		variable_struct_set(element_variables,name,value)
		return self
	}
	
	#endregion
	
	#region @Getters
	static get_x = function() { return x }
	static get_y = function() { return y }
	static get_width = function() { return width }
	static get_height = function() { return height }
	static get_align_x = function() { return align_x }
	static get_align_y = function() { return align_y }
	
	static get_color = function() { return blend_color }
	static get_alpha = function() { return alpha }
	static get_visible = function() { return visible }
	
	static get_hover = function() {
		var manager = oka_get_manager()
		return manager.component_hover_previous == self && check_hover(OKA_MOUSE_X,OKA_MOUSE_Y)
	}
	static get_custom_var = function(name,value) {
		return variable_struct_get(element_variables,name)
	}
	
	#endregion
	
	// @Private
	static __update_component = function() {
		if (on_step) on_step(self)
		__update_pos()
		__update()
		__update_children()
		
	}
	static __update_children = function() {
		for (var i = 0; i < array_length(children); i++) {
			var comp = children[i]
			comp.__update_component()
		}
	}
	static __render_component = function() {
		if (!visible) return;
		draw_set_color(blend_color)
		draw_set_alpha(alpha)
		__render()
		__render_children()
	}
	static __render_children = function() {
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i]
			draw_set_color(_child.blend_color)
			draw_set_alpha(_child.alpha)
			_child.__render_component()
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