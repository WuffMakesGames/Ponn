function everhorn_parse_levels(data) {
	var lua = data.lua
	var level = new EverthornLevel()
	
	// search for everhorn/newlestehorn data - don't load config, we don't support it
	var mapdata, camera_triggers;
	var flag_begin = string_pos("@begin",lua), flag_end = string_pos("--@end",lua)
	var format_exists = flag_begin && flag_end
	
	// exit
	if (!format_exists) return -1
	
	// load data
	var region_data = []
	camera_triggers = []
		
	// load levels table
	var codestring = string_copy(lua,flag_begin,flag_end-flag_begin)
		
	var level_table = string_pos("levels={",codestring)
	var level_table_end = string_pos_ext("}",codestring,level_table)+1
		
	if (level_table) {
		var level_string = string_copy(codestring,level_table,level_table_end-level_table)
		var pos = string_pos_ext("\"",level_string,1)+1
			
		while (pos <= string_length(level_string) && pos > 1) {
			var line_end = string_pos_ext("\"",level_string,pos+1)
			var line = string_replace_all(string_copy(level_string,pos,line_end-pos), "\"", "")
				
			pos = string_pos_ext("\"",level_string,line_end+2)+1
			array_push(region_data,split(line))
		}
	}
	
	// load mapdata
	var mapdata_table = string_pos("mapdata={",codestring)
	var mapdata_table_end = string_pos_ext("}",codestring,mapdata_table)+1
	mapdata = array_create(array_length(region_data),-1)
		
	if (mapdata_table) {
		var mapstring = string_copy(codestring,mapdata_table,mapdata_table_end-mapdata_table)
		mapstring = string_replace_all(mapstring," ","")
		mapstring = string_replace_all(mapstring,"\t","")
		mapstring = string_replace_all(mapstring,"\n","")
		mapstring = string_replace(mapstring,"mapdata={","")
		mapstring = string_replace(mapstring,"}","")
			
		// parse data
		var lines = split(mapstring,",")
		for (var i = 0; i < array_length(lines); i++) {
			var line = lines[i]
			var index = i
				
			var is_hex = true
			var hex = ""
				
			// parse line
			if (line == "nil") continue;
			if (string_starts_with(line,"[")) {
				index = real(string_copy(line,2,string_pos("]",line)-2))-1
			}
				
			// find data
			var string_start = string_pos("\"",line)+1
			var string_end = string_last_pos("\"",line)
				
			// parse hex data
			if (is_hex) {
				mapdata[index] = []
				hex = string_copy(line,string_start,string_end-string_start)
				for (var j = 1; j < string_length(hex); j += 2) {
					array_push(mapdata[index], from_hex(string_copy(hex,j,2)))
				}
			}
		}
	}
		
	// convert data to rooms
	for (var i = 0; i < array_length(region_data); i++) {
		var current_data = region_data[i]
		var width = current_data[2]*16, height = current_data[3]*16
			
		var left = current_data[0]*16
		var top = current_data[1]*16
		var right = left + width
		var bottom = top + height
			
		var region = new EverthornRegion(left,top,width,height)
			
		// load mapdata
		if (mapdata[i] != -1) {
			for (var j = 0; j < array_length(mapdata[i]); j++) {
				var tile_x = j % width
				var tile_y = floor(j / width)
				region.set_tile(tile_x,tile_y,mapdata[i][j])
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