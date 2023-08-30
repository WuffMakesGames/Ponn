function load_pico8(filename) {
	var data = {}
	show_debug_message("Importing PICO-8 data...")
	
	// palette
	data.palette = [
		#000000, #1D2B53, #7E2553, #008751,
		#AB5236, #5F574F, #C2C3C7, #FFF1E8,
		#FF004D, #FFA300, #FFEC27, #00E436,
		#29ADFF, #83769C, #FF77A8, #FFCCAA,
	]
	
	// loading sections
	var current_section = "", sections = {}
	var file = file_text_open_read(filename)
	
	while (!file_text_eof(file)) {
		var line = string_replace_all(file_text_readln(file),"\n","")
		var length = string_length(line)
		
		if (length > 2 && string_starts_with(line,"__")) {
			current_section = string_copy(line,3,string_pos_ext("__",line,3)-3)
			sections[$ current_section] = []
		} else if (current_section != "") {
			array_push(sections[$ current_section], line)
		}
	}
	show_debug_message("> PICO-8 - Data loaded: {0}",struct_get_names(sections))
	file_text_close(file)
	
	// generate spritesheet
	var spritesheet_data = surface_create(128,128)
	surface_set_target(spritesheet_data)
	
	show_debug_message("> PICO-8 - Generating spritesheet...")
	for (var py = 0; py < 128; py++) {
		var line_exists = variable_struct_exists(sections,"gfx") && array_length(variable_struct_get(sections,"gfx")) > py
		var line = line_exists ? variable_struct_get(sections,"gfx")[py] : string_replace_all(string_format(0,128,0)," ","0")
		
		for (var px = 0; px < 128; px++) {
			var index = from_hex(string_copy(line,px+1,1))
			var color = data.palette[index]
			draw_point_color(px,py,color)
		}
	}
	
	data.spritesheet = sprite_create_from_surface(spritesheet_data,0,0,128,128,false,false,0,0)
	surface_reset_target()
	surface_free(spritesheet_data)
	
	// generate tilemap
	show_debug_message("> PICO-8 - Generating map...")
	data.map = []
	for (var tx = 0; tx < 128; tx++) {
		data.map[tx] = []
		
		// map data
		for (var ty = 0; ty < 32; ty++) {
			var line_exists = variable_struct_exists(sections,"map") && array_length(variable_struct_get(sections,"map")) > ty
			var line = line_exists ? variable_struct_get(sections,"map")[ty] : string_replace_all(string_format(0,256,0)," ","0")
			data.map[tx][ty] = from_hex(string_copy(line,1+2*tx,2))
		}
		
		// shared data
		for (var ty = 32; ty < 64; ty++) {
			var index = tx % 64
			var pos = tx >= 64 ? ty*2+1 : ty*2
			
			var line_exists = variable_struct_exists(sections,"gfx") && array_length(variable_struct_get(sections,"gfx")) > pos
			var line = line_exists ? variable_struct_get(sections,"gfx")[pos] : string_replace_all(string_format(0,128,0)," ","0")
			data.map[tx][ty] = from_hex_swapnibbles(string_copy(line, 1+2*index, 2))
		}
	}
	
	// generate rooms
	var code = variable_struct_exists(sections,"lua") ? array_to_string(variable_struct_get(sections,"lua")) : ""
	show_debug_message("> PICO-8 - Generating Rooms/Levels...")
	data.levels = []
	
	#region Everthorn Data
	// search for everthorn data
	var levels, rooms, mapdata, camera_triggers;
	var flag_begin = string_pos("@et-begin",code), flag_end = string_pos("@et-end",code)
	var has_format = flag_begin && flag_end
	
	if (has_format) {
		
	}
	
	#endregion
	#region Everhorn Data
	// search for everhorn/newlestehorn data - don't load config, we don't support it
	var rooms, mapdata, camera_triggers;
	var old_flag_begin = string_pos("@begin",code), old_flag_end = string_pos("--@end",code)
	var format_old = old_flag_begin && old_flag_end
	
	if (format_old) {
		var roomdata = []
		camera_triggers = []
		
		// load levels table
		var codestring = string_copy(code,old_flag_begin,old_flag_end-old_flag_begin)
		
		var level_table = string_pos("levels={",codestring)
		var level_table_end = string_pos_ext("}",codestring,level_table)+1
		
		if (level_table) {
			var pos = string_pos_ext("\"",codestring,level_table)+1
			
			while (pos < level_table_end && pos > level_table) {
				var line_end = string_pos_ext("\"",codestring,pos+1)
				var line = string_replace_all(string_copy(codestring,pos,line_end-pos), "\"", "")
				
				pos = string_pos_ext("\"",codestring,line_end+2)+1
				array_push(roomdata,split(line))
			}
		}
	
		// load mapdata
		var mapdata_table = string_pos("mapdata={",codestring)
		var mapdata_table_end = string_pos_ext("}",codestring,mapdata_table)+1
		
		mapdata = array_create(array_length(roomdata),-1)
		
		if (mapdata_table) {
			
		}
		
		// convert data to rooms
		var level = new EverthornLevel()
		data.levels[0] = level
		
		for (var i = 0; i < array_length(roomdata); i++) {
			var room_data = roomdata[i]
			var width = room_data[2]*16, height = room_data[3]*16
			
			var left = room_data[0]*16
			var top = room_data[1]*16
			var right = left + width
			var bottom = top + height
			
			var new_room = new EverthornRoom(left*8,top*8,width,height)
			
			// load mapdata
			if (mapdata[i]) {
				show_debug_message("what")
			} else { // take from map
				for (var tx = left; tx < right; tx++) {
					for (var ty = top; ty < bottom; ty++) {
						new_room.set_tile(tx-left,ty-top,data.map[tx][ty])
					}
				}
			}
			
			level.add_room(new_room)
		}
	}
	
	#endregion
	#region No Data, copy from map
	if (array_length(data.levels) == 0) {
		var level = new EverthornLevel()
		data.levels[0] = level
		
		var new_room = new EverthornRoom(0,0,128,64)
		
		for (var tx = 0; tx < 128; tx++) {
			for (var ty = 0; ty < 64; ty++) {
				new_room.set_tile(tx,ty,data.map[tx][ty])
			}
		}
		
		level.add_room(new_room)
	}
	
	#endregion
	
	// return
	show_debug_message("> PICO-8 - Finished!")
	return data
}
