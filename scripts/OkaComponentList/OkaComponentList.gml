function OkaComponentList() : OkaComponentAbstract() constructor {
	
	// variables
	list_direction = OKA_LIST_DIRECTION.HORIZONTAL
	padding = 0
	component_align_x = OKA_ALIGN_X.LEFT
	component_align_y = OKA_ALIGN_Y.TOP
	components_width = 0
	components_height = 0
	
	// @Public
	static add_component = function(component) {
		component.parent = self
		array_push(children,component)
		__update_elements_pos()
		return self
	}
	static set_list_direction = function(list_direction) {
		self.list_direction = list_direction
		__update_elements_pos()
		return self
	}
	static set_padding = function(val) {
		padding = val
		return self
	}
	
	static set_component_align_x = function(val) {
		component_align_x = val
		return self
	}
	static set_component_align_y = function(val) {
		component_align_y = val
		return self
	}
	
	// @Private
	static __update_elements_pos = function() {
		var _padding = __oka_parse_value(padding,list_direction == OKA_LIST_DIRECTION.VERTICAL ? height : width)
		var _offset_x = 0
		var _offset_y = 0
		var _width = 0
		var _height = 0
		
		// sort children
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i]
			
			switch (list_direction) {
				case OKA_LIST_DIRECTION.VERTICAL:
					_child.offset_y = _offset_y
					_offset_y += _child.height + (i < array_length(children)-1 ? _padding : 0)
					
					_width = max(_child.width, _width)
					break;
				
				case OKA_LIST_DIRECTION.HORIZONTAL:
				default:
					_child.offset_x = _offset_x
					_offset_x += _child.width + (i < array_length(children)-1 ? _padding : 0)
					
					_height = max(_child.height, _height)
					break;
			}
		}
		
		components_width = max(_offset_x, _width)
		components_height = max(_offset_y, _height)
		
		// components align
		_width = width - components_width
		_height = height - components_height
		
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i]
			
			// horizontal alignment
			switch (component_align_x) {
				case OKA_ALIGN_X.MIDDLE:
					_child.offset_x += _width*0.5
					break;
				case OKA_ALIGN_X.RIGHT:
					_child.offset_x += _width
					break;
			}
			
			// vertical alignment
			switch (component_align_y) {
				case OKA_ALIGN_Y.MIDDLE:
					_child.offset_y += _height*0.5
					break;
				case OKA_ALIGN_Y.BOTTOM:
					_child.offset_y += _height
					break;
			}
		}
	}
	
	static __update = function() {
		__update_elements_pos()
	}
	
	static __render = function() {
		for (var i = 0; i < array_length(children); i++) {
			var _child = children[i]
			_child.__render()
		}
		//draw_set_color(c_white)
		//draw_rectangle(x,y,x+components_width,y+components_height,true)
	}
	
}