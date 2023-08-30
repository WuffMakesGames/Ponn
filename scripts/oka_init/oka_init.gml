// Simple GUI Library for creating tools

// Oka Initialization
function oka_init() {
	static _initialized = false
	if (_initialized) return
	_initialized = true
	
	global.__oka_manager = noone
	global.__oka_debug = false
	instance_create_depth(0,0,0,_oka_controller)
}

function oka_debugmode_enable(enabled) {
	global.__oka_debug = enabled
}

/// @desc Oka Step-Event
function oka_update() {
	var manager = oka_get_manager()
	
	// update components
	manager.component_hover = noone
	for (var i = 0; i < array_length(manager.components); i++) {
		var comp = manager.components[i]
		
		// update
		if (!comp.parent) {
			comp.__update_component()
		}
		
		// hover
		if (comp.check_hover(OKA_MOUSE_X,OKA_MOUSE_Y)) {
			manager.component_hover = comp
		}
	}
	
	// update hover
	with (manager.component_hover) { if (manager.component_hover_previous != self && on_mouse_enter) self.on_mouse_enter(self) }
	with (manager.component_hover_previous) { if (manager.component_hover != self && on_mouse_exit) self.on_mouse_exit(self) }
	
	//if (manager.component_hover != manager.component_hover_previous) {
		manager.component_hover_previous = manager.component_hover
	//}
	
	// update focus
	if (mouse_check_button_pressed(mb_any)) {
		manager.component_focused = manager.component_hover
	}
	
	with (manager.component_focused) {
		if (OKA_MOUSE_PRESSED_LEFT && on_mouse_click) self.on_mouse_click(self)
		else if (OKA_MOUSE_RELEASED_LEFT && on_mouse_release) self.on_mouse_release(self)
	}
}

/// @desc Oka Draw-Event
function oka_render() {
	var manager = oka_get_manager()
	
	// render components
	manager.component_hover = noone
	for (var i = 0; i < array_length(manager.components); i++) {
		var c = manager.components[i]
		if (!c.parent) {
			draw_set_color(c.blend_color)
			draw_set_alpha(c.alpha)
			c.__render()
		}
	}
	
	// reset
	draw_set_color(c_white)
	draw_set_alpha(1.0)
}

/// @desc Returns true if any gui element is hovered
function oka_get_hover() {
	var manager = oka_get_manager()
	if (manager) return manager.component_hover != noone
	return false
}

/// @desc Adds a component to the current Oka Manager
function oka_add_component(component) {
	var manager = oka_get_manager()
	if (manager) {
		array_push(manager.components, component)
	}
}

/// @desc Removes a component from the current Oka Manager
function oka_remove_component(component) {
	var manager = oka_get_manager()
	if (!manager) return;
	
	for (var i = 0; i < array_length(manager.components); i ++) {
		if (manager.components[i] == component) {
			array_delete(manager.components,i,1)
			break;
		}
	}
}

// Managers
function oka_create_manager() constructor {
	components = []
	component_hover = noone
	component_hover_previous = noone
	component_focused = noone
	theme = oka_create_theme()
}

function oka_set_manager(manager) {
	global.__oka_manager = manager
}

function oka_get_manager() {
	return global.__oka_manager
}

function oka_resize(width,height) {
	var manager = oka_get_manager()
	
	// render components
	manager.component_hover = noone
	for (var i = 0; i < array_length(manager.components); i++) {
		var c = manager.components[i]
		if (c.on_resize) c.on_resize(c)
	}
}

// Themes
function oka_create_theme() {
	return { // Default darkmode
		background: #121212,
		background_secondary: #232323,
		background_menu: #323232,
		high_emphasis: #ffffff,
		medium_emphasis: #9d9d9d,
		low_emphasis: #454545,
		accent_regular: #52c139,
		border_radius_x: 0,
		border_radius_y: 0,
	}
}

function oka_get_theme() {
	var manager = oka_get_manager()
	
	if (manager) return manager.theme
	return oka_create_theme()
}
