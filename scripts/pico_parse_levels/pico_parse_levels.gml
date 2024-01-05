function pico_parse_levels(data) {
	
	var levels = []
	var everthorn = everthorn_parse_levels(data)
	var everhorn = everhorn_parse_levels(data)
	
	// default
	if (everthorn != -1) levels = everthorn
	if (everhorn != -1) array_push(levels, everhorn)
	
	if (everthorn != -1 || everhorn != -1) return levels
	
	// generate level from map
	var level = new EverthornLevel()
	var new_room = new EverthornRegion(0,0,128,64)
	
	for (var tx = 0; tx < 128; tx++) {
		for (var ty = 0; ty < 64; ty++) {
			new_room.set_tile(tx,ty,data.map[tx][ty])
		}
	}
	level.add_region(new_room)
	
	array_push(levels, level)
	return levels
}