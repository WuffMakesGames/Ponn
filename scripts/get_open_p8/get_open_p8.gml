function get_open_p8() {
	var filename = get_open_filename("PICO-8 File|*.p8","")
	if (filename != "") {
		global.app_state.project_loaded_data = file_open_pico_parse(filename)
		global.app_state.project_levels = pico_parse_levels(global.app_state.project_loaded_data)
		global.app_state.project_spritesheet = global.app_state.project_loaded_data.spritesheet
	}
}