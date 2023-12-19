function EverthornLevel() constructor {
	
	// variables
	regions = []
	regions_ordered = []
	
	// methods
	draw = method(self, _level_draw)
	add_region = method(self, _level_add_region)
	remove_region = method(self, _level_remove_region)
	focus_region = method(self, _level_focus_region)
	
	get_index = method(self, _level_get_index)
	get_region = method(self, _level_get_region)
	
}

// @methods
function _level_draw() {
	for (var i = 0; i < array_length(regions_ordered); i++) {
		var region = regions_ordered[i]
		region.draw(global.app_state.project_spritesheet, global.app_state.region_selected == region)
	}
}
function _level_add_region(region) {
	array_push(regions,region)
	array_push(regions_ordered,region)
}
function _level_remove_region(index) {
	var region = regions[index]
	array_delete(regions,index,1)
		
	for (var i = 0; i < array_length(regions_ordered); i++) {
		if (regions_ordered[i] == region) {
			array_delete(regions_ordered,i,1)
			break;
		}
	}
}
function _level_focus_region(region) {
	if (region) {
		for (var i = 0; i < array_length(regions_ordered); i++) {
			if (regions_ordered[i] == region) {
				array_delete(regions_ordered,i,1)
				array_push(regions_ordered, region)
				break;
			}
		}
	}
	global.app_state.region_selected = region
}

// @getters
function _level_get_index(region) {
	for (var i = 0; i < array_length(regions); i++) {
		if (regions[i] == region) return i
	}
	return -1
}
function _level_get_region(index) {
	return regions[index]
}
