/// @description 

// Window Close Event
if (window_command_check(window_command_close)) {
	if (global.window_safe_to_close) {
		game_end()
	} else {
		if (show_question("Are you sure you want to exit?")) game_end()
	}
}
