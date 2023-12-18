function window_reset(scale=1.0) {
	window_set_size(global.view_default_width*scale, global.view_default_height*scale)
	return call_later(0.5, time_source_units_seconds, window_center)
}