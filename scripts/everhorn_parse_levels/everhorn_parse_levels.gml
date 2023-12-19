function everhorn_parse_levels(data) {
	var lua = data.lua
	var level = new EverthornLevel()
	
	// search for everhorn/newlestehorn data - don't load config, we don't support it
	var mapdata, camera_triggers;
	var flag_config = string_pos("--@conf",lua)
	var flag_begin = string_pos("--@begin",lua)
	var flag_end = string_pos("--@end",lua)
	
	var format_exists = flag_begin && flag_end
	
	// exit
	if (!format_exists) return -1
	
	// load data
	var sandbox = lua_state_create()
	lua_add_code(sandbox, string_copy(lua,flag_begin,flag_end-flag_begin))
	
	lua_add_code(sandbox,@"
	function fill_mapdata()
		if not mapdata then return end
		for i = 1,#levels do
			if not mapdata[i] then mapdata[i] = -1 end
		end
	end")
	lua_call(sandbox,"fill_mapdata")
	
	var level_table = lua_global_get(sandbox,"levels")
	var mapdata_table = lua_global_get(sandbox,"mapdata")
	
	// convert data
	for (var i = 0; i < array_length(level_table); i++) {
		level_table[i] = split(level_table[i],",")
	}
	for (var i = 0; i < array_length(mapdata_table); i++) {
		var mapdata = mapdata_table[i]
		var output = []
		var pos = 1
		
		if (!is_string(mapdata)) continue;
		while (pos < string_length(mapdata)-1) {
			array_push(output, from_hex(string_copy(mapdata,pos,2)))
			pos += 2
		}
		mapdata_table[i] = output
	}
	
	// convert data to rooms
	for (var i = 0; i < array_length(level_table); i++) {
		var current_data = level_table[i]
		var width = current_data[2]*16, height = current_data[3]*16
	
		var left = current_data[0]*16
		var top = current_data[1]*16
		var right = left + width
		var bottom = top + height
			
		var region = new EverthornRegion(left,top,width,height)
			
		// load mapdata
		var mapdata = mapdata_table[i]
		if (mapdata != -1) {
			for (var ii = 0; ii < array_length(mapdata); ii++) {
				var tile_x = ii % width
				var tile_y = floor(ii / width)
				region.set_tile(tile_x,tile_y,mapdata[ii])
			}
		
		// take from map
		} else { 
			for (var tx = left; tx < right; tx++) {
				for (var ty = top; ty < bottom; ty++) {
					region.set_tile(tx-left,ty-top,data.map[tx][ty])
				}
			}
		}
			
		level.add_region(region)
	}
	
	return level
}