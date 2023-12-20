function pico_parse_levels(data) {
	
	var levels = []
	var everthorn = everthorn_parse_levels(data)
	var everhorn = everhorn_parse_levels(data)
	
	// default
	if (everthorn != -1) levels = everthorn
	if (everhorn != -1) array_push(levels, everhorn)
	
	show_debug_message(levels)
	
	// empty level data
	if (everthorn == -1 && everhorn == -1) {
		var level = new EverthornLevel()
		array_push(levels, level)
		
		var new_room = new EverthornRegion(0,0,128,64)
		
		for (var tx = 0; tx < 128; tx++) {
			for (var ty = 0; ty < 64; ty++) {
				new_room.set_tile(tx,ty,data.map[tx][ty])
			}
		}
		
		level.add_region(new_room)
	}
	
	return levels
}