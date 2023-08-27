function open_file() {
	var _filename = get_open_filename("p8 file|*.p8", "")
	if (_filename != "") {
		return load_pico8(_filename)
	}
	return -1
}