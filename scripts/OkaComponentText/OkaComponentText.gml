function OkaComponentText() : OkaComponentAbstract() constructor {
	
	// variables
	font = draw_get_font()
	text = ""
	blend_color = style.high_emphasis
	
	// @Public
	static set_text = function(text) {
		self.text = text
		
		var _font = draw_get_font()
		draw_set_font(font)
		
		static_width = string_width(text)
		static_height = string_height(text)
		
		draw_set_font(_font)
		return self
	}
	static set_font = function(font) {
		self.font = font
		set_text(text)
		return self
	}
	
	// @Private
	static __update = function() {
		
	}
	
	static __render = function() {
		draw_set_font(font)
		draw_text(x,y,text)
	}
	
}