function pico_save_file(save_as=false) {
	if (save_as) {
		var filename = get_save_filename("PICO-8 File|*.p8","")
		if (filename != "") file_write_p8(global.app_state,filename)
		return
	}
	file_write_p8(global.app_state, global.app_state.file_name)
}