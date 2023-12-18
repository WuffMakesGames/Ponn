function Shortcut(key,mod_ctrl=false,mod_alt=false,mod_shift=false) constructor {
	
	// variables
	self.key = key
	
	control = mod_ctrl
	alt = mod_alt
	shift = mod_shift
	
	// @public
	static check_pressed = function() {
		if (!keyboard_check(vk_control) && control) return false
		if (!keyboard_check(vk_alt) && alt) return false
		if (!keyboard_check(vk_shift) && shift) return false
		
		return keyboard_check_pressed(key)
	}
	
	static to_string = function(sep="+") {
		var output = ""
		if (control) output += "Ctrl" + sep
		if (alt) output += "Alt" + sep
		if (shift) output += "Shift" + sep
		output += chr(key)
		
		return output
	}
	
}