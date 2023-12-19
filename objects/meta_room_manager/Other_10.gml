/// @description Tool Brush
var pressed_any = MOUSE_LEFT || MOUSE_RIGHT

// set tile
if (pressed_any && point_in_rectangle(tile_x,tile_y,0,0,region_selected.width,region_selected.height)) {
	var tile = MOUSE_LEFT ? global.spritesheet_selection.get_tile(0,0) : 0
	region_selected.set_tile(tile_x,tile_y,tile)
}

// reset
if (!pressed_any) {
	app_push_history(HISTORY_NOTE_ROOM_CHANGED)
	global.interaction_state = INTERACTION_STATE.free
}
