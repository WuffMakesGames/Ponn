/// @description 
if (global.app_state.project_loaded_data == -1) exit;

// increment room
if (global.app_state.project_loaded_data) {
	var level = global.app_state.project_levels[global.app_state.level_selected]
	var regions = level.regions
	var index = level.get_index(global.app_state.region_selected)
	var last_index = index
	
	switch (keyboard_lastkey) {
		case vk_down:
			index += 1
			break;
			
		case vk_up:
			index -= 1
			break;
	}
	
	if (last_index != last_index) {
		var region = regions[wrap(index,0,array_length(regions)-1)]
		level.focus_region(region)
		//global.camera_x = region.x + region.width*TILE_SIZE*0.5
		//global.camera_y = region.y + region.height*TILE_SIZE*0.5
	}
}
keyboard_lastkey = -1
