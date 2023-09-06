/// @description 

global.window_safe_to_close = true;

// window buttons
window_command_set_active(window_command_close, true);

// hooks
window_command_hook(window_command_close);
