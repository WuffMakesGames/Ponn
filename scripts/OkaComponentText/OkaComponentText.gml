function OkaComponentText() : OkaComponentAbstract() constructor {
	
	// variables
	text = ""
	color = style.high_emphasis
	
	// @Public
	static set_text = function(text) {
		self.text = text
		static_width = string_width(text)
		static_height = string_height(text)
		return self
	}
	static set_color = function(color) {
		self.color = color
		return self
	}
	
	// @Private
	static __update = function() {
		
	}
	
	static __render = function() {
		draw_set_color(color)
		draw_set_alpha(alpha)
		draw_text(x,y,text)
	}
	
}