
/// @desc Resets the current drawstate
function draw_reset() {
	draw_set_alpha(1.0)
	draw_set_color(c_white)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

/// @desc Sets a new drawstate, reset drawstate with drawstate_pop
function drawstate_push() {
	global.__drawstate_current = []
	array_push(global.__drawstate_current, draw_get_alpha())
	array_push(global.__drawstate_current, draw_get_color())
	array_push(global.__drawstate_current, draw_get_font())
	array_push(global.__drawstate_current, draw_get_halign())
	array_push(global.__drawstate_current, draw_get_valign())
	draw_reset()
}

/// @desc Resets the current pushed drawstate. For use with drawstate_push.
function drawstate_pop() {
	if (!variable_global_exists("__drawstate_current")) {
		show_debug_message("Drawstate not set!")
		return;
	}
	
	// reset
	draw_set_valign			(array_pop(global.__drawstate_current))
	draw_set_halign			(array_pop(global.__drawstate_current))
	draw_set_font			(array_pop(global.__drawstate_current))
	draw_set_color			(array_pop(global.__drawstate_current))
	draw_set_alpha			(array_pop(global.__drawstate_current))
}

/// @desc Draws a dotted rectangle outline.
function draw_gridrect(x1,y1,x2,y2,col=draw_get_color(),alpha=draw_get_alpha()) {
	draw_sprite_stretched_ext(spr_gridrect,current_time*0.025,x1,y1,x2-x1,y2-y1,col,alpha)
}
