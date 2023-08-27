/// @description Open File
if (KEY_MODIFIER_CTRL) {
	var data = open_file()
	if (is_struct(data)) global.pico_data = data
}
