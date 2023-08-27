/// @description Add Room
var _index = array_length(global.levels)

// Create Room
var _room = new EverthornLevel()
array_push(global.levels, _room)

// Create Button
levels_list.add_component(everthorn_button(
	noone,"90%","32px","level "+string(_index),
	function(c) { everthorn_set_room_id(c.get_custom_var("index")) }
)
.set_x("50%")
.set_align_x(OKA_ALIGN_X.MIDDLE)
.set_custom_var("index",_index)
.set_on_step(function(c) {
	var _selected = global.level_selected_id == c.get_custom_var("index")
	var _color = _selected ? style.background : (c.get_hover() ? style.background_menu : style.background_secondary)
	c.set_color(_color)
	//c.children[0].set_color(_selected ? style.accent_regular : style.high_emphasis)
}))
