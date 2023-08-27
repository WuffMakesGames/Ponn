
function __oka_parse_value(val,percentage_value) {
	if (is_real(val)) {
		return val
	}
	
	// Types
	if (is_string(val)) {
		var _length = string_length(val)
		var _is_percent = string_ends_with(val,"%")
		var _is_pixel = string_ends_with(val,"px")
		
		if (_is_percent) {
			return percentage_value * (real(string_copy(val,1,_length-1)) / 100)
		}
		if (_is_pixel) {
			return real(string_copy(val,1,_length-2))
		}
	}
	
	return real(val)
}
