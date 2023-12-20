function everhorn_parse_levels(data) {
	var lua = data.lua
	
	// search for everhorn/newlestehorn data - don't load config, we don't support it
	var flag_config = string_pos("--@conf",lua)
	var flag_begin = string_pos("--@begin",lua)
	var flag_end = string_pos("--@end",lua)
	
	if !(flag_begin && flag_end) return -1
	
	// sandbox data
	var sandbox = lua_state_create()
	lua_add_code(sandbox, string_copy(lua,flag_begin,flag_end-flag_begin))
	
	lua_add_code(sandbox,@"
	function fill_mapdata()
		if not mapdata then mapdata = {} end
		for i = 1,#levels do
			if not mapdata[i] then mapdata[i] = -1 end
		end
	end")
	lua_call(sandbox,"fill_mapdata")
	
	var level_table = lua_global_get(sandbox,"levels")
	var mapdata_table = lua_global_get(sandbox,"mapdata")
	
	// load data
	for (var i = 0; i < array_length(mapdata_table); i++) {
		var mapdata = mapdata_table[i], output = []
		
		if (!is_string(mapdata)) continue;
		for ( var pos = 1; pos < string_length(mapdata)-1; pos += 2) {
			array_push(output, from_hex(string_copy(mapdata,pos,2)))
		}
		mapdata_table[i] = output
	}
	for (var i = 0; i < array_length(level_table); i++) {
		level_table[i] = split(level_table[i],",")
	}
	
	// generate rooms
	var level = pico_generate_rooms(data,level_table,mapdata_table)
	return level
}