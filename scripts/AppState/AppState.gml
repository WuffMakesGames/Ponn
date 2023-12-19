function AppState() constructor {
	
	// variables
	file_name = ""
	project_loaded_data = -1
	room_parameters = []

	level_selected = 0
	region_selected = noone
	region_selected_id = -1
	
	project_levels = []
	project_spritesheet = static_default_spritesheet
	
	// public
	function save_state() {
		var region = region_selected
		self.region_selected_id = region_selected ? project_levels[level_selected].get_index(region_selected) : -1
		self.region_selected = -1
		
		// json
		var json = json_stringify(self,false)
		
		region_selected = region
		
		return json
	}
	
	function load_state(json) {
		var state = json_parse(json)
		
		file_name = state.file_name
		project_loaded_data = state.project_loaded_data
		room_parameters = state.room_parameters
		
		level_selected = state.level_selected
		region_selected_id = state.region_selected_id
		
		project_levels = state.project_levels
		project_spritesheet = state.project_spritesheet
		
		// regenerate levels
		for (var i = 0; i < array_length(project_levels); i++) {
			var level = project_levels[i]
			var new_level = new EverthornLevel()
			
			// regenerate rooms
			for (var ii = 0; ii < array_length(level.regions); ii++) {
				var region = level.regions[ii]
				var new_region = new EverthornRegion(region.x,region.y,region.width,region.height)
				
				new_region.tilemap = region.tilemap
				new_level.add_region(new_region)
			}
			
			project_levels[i] = new_level
		}
		
		if (state.region_selected_id != -1) {
			region_selected = project_levels[level_selected].regions[region_selected_id]
		}
	}
}