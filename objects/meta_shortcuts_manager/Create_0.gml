/// @description Create Shortcuts

shortcuts_init()

// shortcuts
shortcuts_add("file_open", ord("O"), true, false, false)
shortcuts_add("file_save", ord("S"), true, false, false)
shortcuts_add("file_save_as", ord("S"), true, false, true)

shortcuts_add("undo", ord("Z"), true, false, false)
shortcuts_add("redo", ord("Y"), true, false, false)

shortcuts_add("new_level", ord("1"), false, true, false)
shortcuts_add("new_room", ord("2"), false, true, false)
