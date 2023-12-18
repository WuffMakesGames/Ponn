function file_open_pico_parse(filename) {
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
	
	// code
	data.lua = array_to_string(struct_get_default(sections, "lua", ["-- pico 8 project"])) 
	
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
	
	// return
	show_debug_message("> PICO-8 - Finished!")
	show_debug_message(data)
	return data
}
