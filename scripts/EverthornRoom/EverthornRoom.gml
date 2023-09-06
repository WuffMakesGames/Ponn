function EverthornRoom(x,y,width,height) constructor {
	cell_size = 8
	
	// variables
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	
	// default variables
	surface = -1
	
	// tilemap
	tilemap = []
	for (var ty = 0; ty < height; ty++) {
		tilemap[ty] = []
		for (var tx = 0; tx < width; tx++) {
			tilemap[ty][tx] = 0
		}
	}
	
	// @public
	static get_hover = function(x,y) {
		return point_in_rectangle(x,y,self.x,self.y,self.x+width*8,self.y+height*8)
	}
	
	static resize = function(width,height) {
		if (surface_exists(surface)) surface_resize(surface,width*cell_size,height*cell_size)
		self.width = width
		self.height = height
		return self
	}
	static move = function(x,y) {
		self.x = x
		self.y = y
		return self
	}
	
	static set_tile = function(x,y,tile) {
		tilemap[y][x] = tile
		return self
	}
	static get_tile = function(x,y) {
		return tilemap[y][x]
	}
	static tilemap_draw = function(spritesheet,x,y,xscale=1.0,yscale=1.0,rot=0,col=c_white,alpha=1.0) {
		for (var ty = 0; ty < height; ty++) {
			for (var tx = 0; tx < width; tx++) {
				var _tile = get_tile(tx,ty)
				if (_tile == 0) continue;
		
				var _left = (_tile % 16) * cell_size
				var _top = floor(_tile / 16) * cell_size
				draw_sprite_part_ext(spritesheet,0,_left,_top,cell_size,cell_size,x+tx*cell_size,y+ty*cell_size,xscale,yscale,col,alpha)
			}
		}
	}
	
	static begin_draw = function() {
		surface = __get_surface(width,height)
		surface_set_target(surface)
	}
	static end_draw = function() {
		surface_reset_target()
	}
	
	static draw = function(x,y,xscale=1.0,yscale=1.0,rot=0,col=c_white,alpha=1.0) {
		// tilemap
		//tilemap_draw(spritesheet,x,y,xscale,yscale,rot,col,alpha)
		
		// bounds
		//draw_set_color(c_red)
		//draw_rectangle(x,y,x+width*8-1,y+height*8-1,true)
		
		// reset
		//draw_set_alpha(1.0) draw_set_color(c_white)
		if (surface_exists(surface)) {
			draw_surface_ext(surface,x,y,xscale,yscale,rot,col,alpha)
			surface_free(surface)
		}
	}
	
	// @Private
	static __get_surface = function (width,height) {
		if (!surface_exists(surface)) {
			surface = surface_create(width*cell_size, height*cell_size)
		}
		return surface
	}
	
}