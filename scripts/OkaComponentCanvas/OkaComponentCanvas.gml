function OkaComponentCanvas(width=32,height=32) : OkaComponentAbstract() constructor {
	var style = oka_get_theme()
	
	// variables
	canvas_width = max(width,1)
	canvas_height = max(height,1)
	surface = surface_create(canvas_width,canvas_height)
	
	static_width = canvas_width
	static_height = canvas_height
	
	// @Public
	static begin_draw = function() {
		if (!surface_exists(surface)) surface = surface_create(canvas_width,canvas_height)
		surface_last = surface_get_target()
		if (surface_exists(surface_last)) surface_reset_target()
		surface_set_target(surface)
	}
	static end_draw = function() {
		surface_reset_target()
		if (surface_exists(surface_last)) surface_set_target(surface_last)
	}
	
	static set_canvas_size = function(width,height) {
		canvas_width = max(width,1)
		canvas_height = max(height,1)
		if (surface_exists(surface)) surface_resize(surface,canvas_width,canvas_height)
	}
	
	// @Private
	static __update = function() {}
	static __render = function() {
		if (surface_exists(surface)) {
			draw_surface_ext(surface,x,y,width/canvas_width,height/canvas_height,0,blend_color,alpha)
		}
	}
	static __on_destroy = function() {
		surface_free(surface)
	}
	
}
