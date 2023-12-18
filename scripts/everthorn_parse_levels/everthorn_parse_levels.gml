function everthorn_parse_levels(data) {
	var lua = data.lua
	var levels = []
	
	// search for everthorn data
	var levels, rooms, mapdata, camera_triggers;
	var flag_begin = string_pos("@et-begin",lua), flag_end = string_pos("@et-end",lua)
	var format_exists = flag_begin && flag_end
	
	// exit
	if (!format_exists) return -1
	
	// load data
	
	
	return levels
}