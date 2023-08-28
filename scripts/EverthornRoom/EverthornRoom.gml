function EverthornRoom(x,y,width,height) constructor {
	
	// variables
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	
	tilemap = []
	for (var ty = 0; ty < height; ty++) {
		tilemap[ty] = []
		for (var tx = 0; tx < width; tx++) {
			tilemap[ty][tx] = 0
		}
	}
	
	// @public
	static set_tile = function(x,y,tile) {
		tilemap[y][x] = tile
	}
	static get_tile = function(x,y) {
		return tilemap[y][x]
	}
	
	static tilemap_draw = function(spritesheet,x,y) {
		for (var ty = 0; ty < height; ty++) {
			for (var tx = 0; tx < width; tx++) {
				var _tile = get_tile(tx,ty)
				if (_tile == 0) continue;
		
				var _left = (_tile % 16) * 8
				var _top = floor(_tile / 16) * 8
				draw_sprite_part(spritesheet,0,_left,_top,8,8,x+tx*8,y+ty*8)
			}
		}
	}
	static draw = function(spritesheet,x,y) {
		// tilemap
		tilemap_draw(spritesheet,x,y)
		
		// bounds
		draw_set_color(c_red)
		draw_rectangle(x,y,x+width*8-1,y+height*8-1,true)
		
		// reset
		draw_set_alpha(1.0) draw_set_color(c_white)
	}
}