
/// @ignore
function __oka_new_wrapper(type,parent=noone) {
	var _component = new type()
	
	if (parent) array_push(parent.children,_component)
	oka_add_component(_component)
	
	_component.parent = parent
	return _component
}

/// @desc Creates and returns a new Panel Component
function oka_new_panel(parent=noone) {
	var _component = __oka_new_wrapper(OkaComponentPanel,parent)
	return _component
}

/// @desc Creates and returns a new List component
function oka_new_list(parent=noone) {
	var _component = __oka_new_wrapper(OkaComponentList,parent)
	return _component
}

/// @desc Creates and returns a new Text component
function oka_new_text(parent=noone) {
	var _component = __oka_new_wrapper(OkaComponentText,parent)
	return _component
}

/// @desc Creates and returns a new Sprite component
function oka_new_sprite(parent=noone) {
	var _component = __oka_new_wrapper(OkaComponentSprite,parent)
	return _component
}

function oka_new_canvas(parent=noone,width=32,height=32) {
	var _component = new OkaComponentCanvas(width,height)
	
	if (parent) array_push(parent.children,_component)
	oka_add_component(_component)
	
	_component.parent = parent
	return _component
}
