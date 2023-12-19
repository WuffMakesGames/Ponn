function EverthornRegion(x,y,width,height) constructor {
	
	// variables
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	
	tilemap = {}
	
	left = x * TILE_SIZE
	top = y * TILE_SIZE
	pixel_width = width * TILE_SIZE
	pixel_height = height * TILE_SIZE
	
	// public
	update = method(self, _region_update)
	draw = method(self, _region_draw)
	update_pos = method(self, _region_update_pos)
	
	shift_position = method(self, _region_shift_pos)
	
	set_position = method(self, _region_set_pos)
	set_size = method(self, _region_set_size)
	set_x = method(self, _region_set_x)
	set_y = method(self, _region_set_y)
	set_width = method(self, _region_set_width)
	set_height = method(self, _region_set_height)
	set_tile = method(self, _region_set_tile)
	
	get_tile = method(self, _region_get_tile)
	get_tile_id = method(self, _region_get_tile_id)
	get_hover = method(self, _region_get_hover)
	
}

// @methods
function _region_update() {
}
function _region_update_pos() {
	left = x * TILE_SIZE
	top = y * TILE_SIZE
	pixel_width = width * TILE_SIZE
	pixel_height = height * TILE_SIZE
}
function _region_draw(spritesheet,focused) {
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
function _region_shift_pos(x=0,y=0) {
	if (x == 0 && y == 0) return;
	self.x += x
	self.y += y
	app_push_history(HISTORY_NOTE_ROOM_MOVED)
}

// @setters
function _region_set_tile(x,y,tile) {
	struct_set(tilemap, get_tile_id(x,y), tile)
}
function _region_set_pos(x,y) {
	if (self.x == x && self.y == y) return;
	self.x = x
	self.y = y
	app_push_history(HISTORY_NOTE_ROOM_MOVED)
}
function _region_set_x(x) {
	if (self.x == x) return;
	self.x = x
	app_push_history(HISTORY_NOTE_ROOM_MOVED)
}
function _region_set_y(y) {
	if (self.y == y) return;
	self.y = y
	app_push_history(HISTORY_NOTE_ROOM_MOVED)
}
function _region_set_size(width,height) {
	if (width == self.width && height == self.height) return;
	self.width = max(width,1)
	self.height = max(height,1)
	app_push_history(HISTORY_NOTE_ROOM_RESIZED)
}
function _region_set_width(width) {
	if (width == self.width) return;
	self.width = max(width,1)
	app_push_history(HISTORY_NOTE_ROOM_RESIZED)
}
function _region_set_height(height) {
	if (height == self.height) return;
	self.height = max(height,1)
	app_push_history(HISTORY_NOTE_ROOM_RESIZED)
}

// @getters
function _region_get_tile(x,y) {
	var tile = struct_get(tilemap, get_tile_id(x,y))
	return is_undefined(tile) ? 0 : tile
}
function _region_get_hover(px,py) {
	return point_in_rectangle(px,py,left,top,left+pixel_width,top+pixel_height)
}
function _region_get_tile_id(x,y) {
		return string_concat(x,"_",y)
}
