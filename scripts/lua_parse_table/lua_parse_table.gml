/// @desc Simple Lua parser that returns a struct with all a tables values
function lua_parse_table(lua) {
	var output = {
		keys: [],
		values: []
	}
	
	// format
	lua = string_copy(lua, string_pos("{",lua), string_last_pos("}",lua))
	show_debug_message(lua)
	
	// parse
	var pos = 1
	var index = 1
	var state = ""
	
	var current_key = ""
	var current_value = ""
	var temp_value = ""
	
	var in_string = false
	var string_started_with = ""
	var in_comment = false
	var comment_started_width = ""
	
	var escape_code = false
	
	while (pos < string_length(lua) && pos > 0) {
		var char = string_copy(lua,pos,1)
		
		// escape code
		if (escape_code) {
			pos += 1
			escape_code = false
			continue;
		}
		
		// checkers
		switch (char) {
			// escape code
			case "\\":
				pos += 1
				escape_code = true
				continue;
			
			// continue
			case ",":
				index += 1
				pos += 1
				
				// finalize
				if (current_key != "") {
					output.keys[index] = current_key
				}
				output.values[index] = current_value
				
				continue;
			
			// string
			case "\"":
			case "'":
				if (!in_string) { // entering string
					in_string = true
					pos += 1
					continue;
					
				} else if (char == string_started_with) { // exiting string
					in_string = false
					pos += 1
					continue;
					
				}
				
				break;
				
		}
		
		// update values
		switch (state) {
			case "key":
				
				break;
				
			case "value":
				
				break;
				
			default:
				
				if (!in_string && !in_comment && char == "=") {
					state = "value"
				}
				
				break;
		}
		
		// continue
		pos += 1
	}
	
	// reformat
	
	
	// return
	return output
}