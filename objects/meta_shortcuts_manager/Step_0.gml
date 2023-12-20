/// @description 

// files
if (get_shortcut_pressed("file_open")) get_open_p8()
if (get_shortcut_pressed("file_save")) pico_save_file()
if (get_shortcut_pressed("file_save_as")) pico_save_file(true)

// app history
if (get_shortcut_pressed("undo") && global.app_history_can_undo) app_undo()
if (get_shortcut_pressed("redo") && global.app_history_can_redo) app_redo()
