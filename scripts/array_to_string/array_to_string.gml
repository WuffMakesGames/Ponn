function array_to_string(array) {
	var str = ""
	var length = array_length(array)
	
	for (var i = 0; i < length; i++) {
		str = str + string(array[i])
		if (i < length-1) str = str + "\n"
	}
	
	return str
}