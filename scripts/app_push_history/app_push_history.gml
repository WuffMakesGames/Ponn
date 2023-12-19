
function app_push_history(note="") {
	var state = global.app_state.save_state()
	var length = array_length(global.app_history)
	
	if (state != global.app_history[global.app_history_pos]) {
		
		global.app_history_pos += 1
		show_debug_message("Project State Saved. Position: {0}/{1}",global.app_history_pos,length)
		
		array_delete(global.app_history, global.app_history_pos, array_length(global.app_history))
		global.app_history[global.app_history_pos] = state
		global.app_history_notes[global.app_history_pos] = note
	}
}

function app_load_history_position(index) {
	global.app_history_pos = index
	global.app_state.load_state(global.app_history[index])
	show_debug_message("Project State Loaded. Position: {0}/{1}",index,array_length(global.app_history))
}

function app_undo() {
	if (global.app_history_can_undo) app_load_history_position(global.app_history_pos - 1)
}

function app_redo() {
	if (global.app_history_can_redo) app_load_history_position(global.app_history_pos + 1)
}
