function EverthornLevel() constructor {
	
	// variables
	regions = []
	regions_ordered = []
	
	// public
	static draw = function() {
		for (var i = 0; i < array_length(regions_ordered); i++) {
			var region = regions_ordered[i]
			region.draw(global.app_state.project_spritesheet, global.app_state.region_selected == region)
		}
	}
	
	// methods
	static add_region = function(region) {
		array_push(regions,region)
		array_push(regions_ordered,region)
	}
	static remove_region = function(index) {
		var region = regions[index]
		array_delete(regions,index,1)
		
		for (var i = 0; i < array_length(regions_ordered); i++) {
			if (regions_ordered[i] == region) {
				array_delete(regions_ordered,i,1)
				break;
			}
		}
	}
	
	static focus_region = function(region) {
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
	
	// setters
	
	
	// getters
	static get_index = function(region) {
		for (var i = 0; i < array_length(regions); i++) {
			if (regions[i] == region) return i
		}
		return -1
	}
	static get_region = function(index) { return regions[index] }
	
}