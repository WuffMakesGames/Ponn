function split(str,separator=",",convert_numbers=true) {
	if (!string_ends_with(str,separator)) str = str + separator
	var pos = 1
	var array = []
	
	while (pos < string_length(str)) {
		var pos_end = string_pos_ext(separator,str,pos+1)
		var value = string_copy(str,pos,pos_end-pos)
		
		array_push(array,convert_numbers && string_count(".",value) <= 1 && digits(value) == value ? real(value) : value)
		pos = pos_end + 1
	}
	return array
}

function digits(str) {
	var _digits = split("0,1,2,3,4,5,6,7,8,9,.",",",false)
	var _string = ""
	
	for (var i = 1; i <= string_length(str); i++) {
		var _char = string_copy(str,i,1)
		if (array_contains(_digits,_char)) {
			_string = _string + _char
		}
	}
	
	return _string
}
