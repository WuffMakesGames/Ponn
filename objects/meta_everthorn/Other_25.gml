/// @description Keyboard Listener
if (!keyboard_check(vk_anykey)) exit;

var _char = keyboard_lastchar
var _key = keyboard_lastkey

// reset
keyboard_lastchar = ""
keyboard_lastkey = vk_nokey

// Keys - Control
if (KEY_MODIFIER_CTRL) {
	switch (_key) {
		case ord("O"): // Open File
			var filename = open_file()
			if (filename != "") {
				global.pico_data_filepath = filename
				event_user(0)
			}
		break;
	}
	exit;
}

// Keys - Regular
//var _selection = global.tile_selection
//var _selection_width = _selection[2] - _selection[0]
//var _selection_height = _selection[3] - _selection[1]

//switch (_char) {
	//case "[": // Tile selected
	//	global.tile_selection[0] = wrap(global.tile_selection[0] - _selection_width, _selection_width, 16-_selection_width)
	//	break;
	//case "]": // Tile selected
	//	global.tile_selection[0] = wrap(global.tile_selection[0] + _selection_width, _selection_width, 16-_selection_width)
	//	break;
//}

switch (_key) {
	
	// Tool shortcuts
	case ord("D"):
		global.editor_tool = EDITOR_TOOL.brush
		break;
	case ord("F"):
		global.editor_tool = EDITOR_TOOL.fill
		break;
	case ord("R"):
		global.editor_tool = EDITOR_TOOL.rectangle
		break;
	case ord("M"):
		global.editor_tool = EDITOR_TOOL.selection
		break;
}
