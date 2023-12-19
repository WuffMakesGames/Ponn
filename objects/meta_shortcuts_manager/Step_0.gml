/// @description 

// files
if (get_shortcut_pressed("file_open")) get_open_p8()
if (get_shortcut_pressed("file_save")) file_write_p8(global.app_state, global.file_name)
if (get_shortcut_pressed("file_save_as")) {
	var filename = get_save_filename("PICO-8 File|*.p8","")
	if (filename) file_write_p8(global.app_state,filename)
}

// app history
if (get_shortcut_pressed("undo") && global.app_history_can_undo) app_undo()
if (get_shortcut_pressed("redo") && global.app_history_can_redo) app_redo()
