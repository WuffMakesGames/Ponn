/// @description Keyboard Listener
if (!keyboard_check(vk_anykey)) exit;

// Keys - Control
if (KEY_MODIFIER_CTRL) {
	switch (keyboard_lastkey) {
		case ord("O"): // Open File
			var data = open_file()
			if (is_struct(data)) {
				global.pico_data = data
				event_user(0)
			}
		break;
	}

// Keys - Regular
} else {
	
}



