/// @description 

var map_width = 1024
var map_height = 512
var grid_size = 128

// background
draw_sprite_tiled_ext(spr_background,0,VIEW_LEFT,VIEW_TOP,1/global.camera_zoom,1/global.camera_zoom,style.background,1.0)

// grid
draw_set(#303030)
draw_rect_grid(0,0,map_width,map_height,grid_size)
draw_set()

// rooms
if (array_length(global.app_state.project_levels) > global.app_state.level_selected) {
	var level = global.app_state.project_levels[global.app_state.level_selected]
	level.draw()
}

// border
draw_set(#606060)
draw_rectangle(0,0,map_width-1,map_height-1,true)
draw_set()
