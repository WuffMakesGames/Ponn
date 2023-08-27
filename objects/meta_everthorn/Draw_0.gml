/// @description 
draw_clear(style.background)

if (!is_struct(global.pico_data)) exit;
var data = global.pico_data

for (var ty = 0; ty < 64; ty++) {
	for (var tx = 0; tx < 128; tx++) {
		var _tile = data.map[tx][ty]
		if (_tile == 0) continue;
		
		var _left = (_tile % 16) * 8
		var _top = floor(_tile / 16) * 8
		draw_sprite_part(data.spritesheet,0,_left,_top,8,8,tx*8,ty*8)
	}
}

// grid
draw_set_alpha(0.5)
for (var xx = 0; xx < 1024-1; xx += 128) {
	for (var yy = 0; yy < 512-1; yy += 128) {
		draw_rectangle(xx,yy,xx+127,yy+127,true)
	}
}
draw_set_alpha(1.0)
