function EverthornRegion(x,y,width,height) constructor {
	
	// variables
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	
	tilemap = ds_map_create()
	
	left = x * TILE_SIZE
	top = y * TILE_SIZE
	pixel_width = width * TILE_SIZE
	pixel_height = height * TILE_SIZE
	
	// public
	static destroy = function() {
		ds_map_destroy(tilemap)
	}
	
	static update = function() {
		
	}
	
	static update_pos = function() {
		left = x * TILE_SIZE
		top = y * TILE_SIZE
		pixel_width = width * TILE_SIZE
		pixel_height = height * TILE_SIZE
	}
	
	static draw = function(spritesheet,focused) {
		var tile_size = TILE_SIZE
		
		// update values
		update_pos()
		
		if (focused) {
			draw_set(c_black)
			draw_rectangle(left,top,left+pixel_width-1,top+pixel_height-1,false)
		}
		
		// tilemap
		draw_set()
		for (var tx = 0; tx < width; tx++) {
			for (var ty = 0; ty < height; ty++) {
				var tile = get_tile(tx,ty)
				
				if (tile != 0) {
					draw_pico_tile(tile,spritesheet,left+tx*tile_size,top+ty*tile_size,1,1,8,8,focused ? c_white : c_dkgray,1.0)
				}
			}
		}
		
		// tile grid
		draw_set(global.app_style.medium_emphasis, 0.25)
		if (focused) draw_rect_grid(left,top,left+pixel_width,top+pixel_height,tile_size)
		draw_set()
		
	}
	
	static resize = function(width,height) {
		self.width = max(width,1)
		self.height = max(height,1)
	}
	
	// setter
	static set_tile = function(x,y,tile) { ds_map_set(tilemap, get_tile_id(x,y), tile) }
	
	// getter
	static get_tile = function(x,y) {
		var tile = ds_map_find_value(tilemap, get_tile_id(x,y))
		return is_undefined(tile) ? 0 : tile
	}
	static get_hover = function(px,py) {
		return point_in_rectangle(px,py,left,top,left+pixel_width,top+pixel_height)
	}
	
	static get_tile_id = function(x,y) {
		return string_concat(x,",",y)
	}
	
}