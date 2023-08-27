function get_time_string(military=false) {
	var _string = string(military ? current_hour : (current_hour-1) % 12 + 1) + ":"
	_string = _string + (current_minute < 10 ? "0" : "") + string(current_minute)
	if (!military) _string = _string + (current_hour > 12 ? " PM" : " AM")
	
	return _string
}