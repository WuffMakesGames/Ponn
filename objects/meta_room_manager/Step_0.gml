/// @description 
if (global.app_state.project_loaded_data == -1) exit;

var level = global.app_state.project_levels[global.app_state.level_selected]
var regions = level.regions_ordered
var hovered = noone

// find hovered region
for (var i = 0; i < array_length(regions); i++) {
	var region = regions[i]
	if (region.get_hover(mouse_x,mouse_y)) hovered = region
}

// interact
region_selected = global.app_state.region_selected

if (region_selected) {
	tile_x = floor((mouse_x - region_selected.x*TILE_SIZE) / TILE_SIZE)
	tile_y = floor((mouse_y - region_selected.y*TILE_SIZE) / TILE_SIZE)
}

switch (global.interaction_state) {
	case INTERACTION_STATE.free:
		if (global.ui_hover) break;
		
		if (keyboard_check(vk_alt)) global.tool_selected = TOOL_ID.picker
		if (keyboard_check_released(vk_alt)) global.tool_selected = TOOL_ID.brush
		
		if (region_selected != hovered && MOUSE_PRESSED_LEFT) {
			level.focus_region(hovered)
			app_push_history(HISTORY_NOTE_ROOM_SELECTED)
		} else if (region_selected) {
			var editing = false
			
			// tool selection
			switch (global.tool_selected) {
				case TOOL_ID.brush:
					editing = MOUSE_PRESSED_LEFT || MOUSE_PRESSED_RIGHT
					break;
				default:
					editing = MOUSE_PRESSED_LEFT
			}
			if (editing) global.interaction_state = INTERACTION_STATE.editing
		}
		break;
	
	// edit rooms
	case INTERACTION_STATE.editing:
		switch (global.tool_selected) {
			case TOOL_ID.brush: event_user(0) break;
			case TOOL_ID.picker: event_user(1) break;
		}
		break;
}
