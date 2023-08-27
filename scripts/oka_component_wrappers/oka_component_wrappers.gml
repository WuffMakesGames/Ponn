
/// @desc Creates and returns a new Panel Component
function oka_new_panel(parent=noone) {
	var _component = new OkaComponentPanel()
	
	if (parent) array_push(parent.children,_component)
	oka_add_component(_component)
	
	_component.parent = parent
	return _component
}

/// @desc Creates and returns a new List component
function oka_new_list(parent=noone) {
	var _component = new OkaComponentList()
	
	if (parent) array_push(parent.children,_component)
	oka_add_component(_component)
	
	_component.parent = parent
	return _component
}

/// @desc Creates and returns a new Text component
function oka_new_text(parent=noone) {
	var _component = new OkaComponentText()
	
	if (parent) array_push(parent.children,_component)
	oka_add_component(_component)
	
	_component.parent = parent
	return _component
}