/// @desc Creates a global list of shortcuts.
function shortcuts_init() { global.shortcuts = ds_map_create() }

/// @desc Returns a shortcut object.
function get_shortcut(index) { return ds_map_find_value(global.shortcuts, index) }

/// @desc Returns if a specified shortcut has pressed
function get_shortcut_pressed(index) { return get_shortcut(index).check_pressed() }

/// @desc Returns a string that displays the shortcut combo
function get_shortcut_string(index) { return get_shortcut(index).to_string() }

/// @desc Adds a shortcut to a global map.
/// Shortcuts can be accessed with get_shortcut()
function shortcuts_add(index,key,mod_ctrl=false,mod_alt=false,mod_shift=false) {
	var shortcut = new Shortcut(key,mod_ctrl,mod_alt,mod_shift)
	ds_map_add(global.shortcuts,index,shortcut)
	
	return shortcut
}
