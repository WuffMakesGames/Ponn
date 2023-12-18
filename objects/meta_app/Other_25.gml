/// @description Spritesheet Surface
var cell_size = TILEMAP_CELL_SIZE
var cell_padding = TILEMAP_PADDING
var surface_width = (cell_size+cell_padding) * 16
var surface_height = (cell_size+cell_padding) * 8

if (!surface_exists(global.spritesheet_surface)) {
	global.spritesheet_surface = surface_create(surface_width,surface_height)
}
surface_set_target(global.spritesheet_surface)
draw_clear_alpha(c_black, 0)

// Outline
var selection = global.spritesheet_selection
var outline_left = selection.x * (cell_size + cell_padding)
var outline_top = selection.y * (cell_size + cell_padding)

draw_set(c_aqua)
draw_rectangle(outline_left,outline_top,outline_left+cell_size+1,outline_top+cell_size+1,false)
draw_set()

// Tiles
for (var xx = 0; xx < 16; xx++) {
	for (var yy = 0; yy < 8; yy++) {
		var idx = xx + yy*16
		var left = xx * (cell_size + cell_padding) + cell_padding*0.5
		var top = yy * (cell_size + cell_padding) + cell_padding*0.5
		
		draw_pico_tile(idx,global.app_state.project_spritesheet,left,top,1,1,cell_size,cell_size)
	}
}
surface_reset_target()
