/// @description Tool Picker

var tile = region_selected.get_tile(tile_x,tile_y)

if (MOUSE_LEFT) {
	global.spritesheet_selection.set_rectangle(tile%16,floor(tile/16),1,1)
} else if (!keyboard_check(vk_alt)) {
	global.tool_selected = TOOL_ID.brush
	global.interaction_state = INTERACTION_STATE.free
}
