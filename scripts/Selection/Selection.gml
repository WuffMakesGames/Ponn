function Selection(x,y,width,height) constructor {
	
	// variables
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	
	// setters
	static set_rectangle = function(x,y,width,height) {
		self.x = x
		self.y = y
		self.width = width
		self.height = height
	}
	
	// getters
	static get_tile = function(x,y) {
		return (self.x+x) + (self.y+y)*16
	}
	
}