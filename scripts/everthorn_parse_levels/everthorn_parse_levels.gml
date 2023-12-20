function everthorn_parse_levels(data) {
	var lua = data.lua
	var levels = []
	
	// search for everthorn data
	var flag_config = string_pos("-- @conf",lua)
	var flag_begin = string_pos("-- @begin",lua)
	var flag_end = string_pos("-- @end",lua)
	
	if !(flag_begin && flag_end) return levels
	
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
		var rooms = level_table[i]
		for (var ii = 0; ii < array_length(rooms); ii++) {
			level_table[i][ii] = split(rooms[ii],",")
		}
	}
	
	// generate levels/rooms
	for (var i = 0; i < array_length(level_table); i++) {
		var level = pico_generate_rooms(data,level_table[i],mapdata_table)
		array_push(levels, level)
	}
	
	return levels
}