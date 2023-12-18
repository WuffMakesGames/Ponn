function event_manager_initialize() {
	global.event_registry = ds_map_create()
}

/// @function		event_subscribe(event_name, listener, callback_method)
/// @desc			Creates a listener to a specific event.
function event_subscribe(event_name,listener,callback_method) {
	var _event_list
	
	// create event
	if (!ds_map_exists(global.event_registry, event_name)) {
		_event_list = ds_list_create()
		ds_map_add(global.event_registry, event_name, _event_list)
	} else {
		_event_list = ds_map_find_value(global.event_registry, event_name)
	}
	
	// create listener
	var _listener = {
		object: listener,
		callback: callback_method,
	}
	
	ds_list_add(_event_list, _listener)
}

/// @function		event_unsubscribe(event_name, listener)
/// @desc			Removes a listener to a specific event.
function event_unsubscribe(event_name,listener_object) {
	var _event_list = ds_map_find_value(global.event_registry, event_name)
	if (is_undefined(_event_list)) return;
	
	// find listener
	for (var i = 0; i < ds_list_size(_event_list); i++) {
		var _listener = _event_list[| i]
		if (_listener.object == listener_object) {
			ds_list_delete(_event_list, i)
			break;
		}
	}
}

/// @function		event_destroy_listener(listener)
/// @desc			Removes a listener from the event registry.
function event_destroy_listener(listener_object) {
	var _event_keys = ds_map_keys_to_array(global.event_registry)
	for (var i = 0; i < array_length(_event_keys); i++) {
		event_unsubscribe(_event_keys[i],listener_object)
	}
}

/// @function		event_dispatch(event_name, event_argument)
/// @desc			Trigger an event and notify all listeners. Returns the number of objects that responded to the event
/// @return {Real}
function event_dispatch(event_name,event_argument) {
	var _event_list = ds_map_find_value(global.event_registry, event_name)
	if (is_undefined(_event_list)) {
		show_debug_message("No listeners for event {0}",event_name)
		return 0;
	}
	
	if (!is_array(event_argument)) event_argument = [event_argument]
	
	// trigger event
	var _listener_count = 0
	
	for (var i = 0; i < ds_list_size(_event_list); i++) {
		var _listener = _event_list[| i]
		var _listener_object = _listener.object
		var _listener_callback = _listener.callback
		
		if (!instance_exists(_listener_object)) continue;
		if (is_string(_listener_callback)) _listener_callback = variable_instance_get_default(_listener_object,_listener_callback,false)
		
		if (script_exists(_listener_callback)) {
			with (_listener_object) { script_execute_ext(_listener_callback, event_argument) }
			_listener_count++;
		}
		
	}
	
	// return
	return _listener_count
}
