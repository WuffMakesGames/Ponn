function get_time_string(military=false) {
	
	var minute = (current_minute < 10 ? "0" : "") + string(current_minute)
	if (military) return string(current_hour) + minute
	
	var hour = current_hour
	var display_hour = (hour + 12) % 12
	var indicator = hour >= 12 ? "PM" : "AM"
	
	if (display_hour == 0) display_hour = 12
	var output = string_concat(display_hour,":",minute," ",indicator)
	
	return output
}