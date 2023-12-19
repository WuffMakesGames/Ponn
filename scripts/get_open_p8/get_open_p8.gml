function get_open_p8() {
	var filename = get_open_filename("PICO-8 File|*.p8","")
	if (filename != "") {
		
		try {
			global.app_state.project_loaded_data = file_open_pico_parse(filename)
			global.app_state.project_levels = pico_parse_levels(global.app_state.project_loaded_data)
			global.app_state.project_spritesheet = global.app_state.project_loaded_data.spritesheet
			global.file_name = filename
			app_push_history("Loaded project")
		} catch(error) {
			global.app_state.project_loaded_data = -1
			global.app_state.project_levels = []
			global.app_state.project_spritesheet = static_default_spritesheet
			global.file_name = ""
			show_debug_message(error.longMessage)
			show_debug_message("Project failed to open")
		}
		
	}
}