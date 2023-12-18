function draw_pico_tile(idx,spritesheet,x,y,width,height,sprite_width,sprite_height,color=c_white,alpha=1.0) {
	var left = (idx % 16)*8
	var top = floor(idx / 16)*8
	var xscale = sprite_width / (width*8)
	var yscale = sprite_height / (height*8)
	
	draw_sprite_part_ext(spritesheet,0,left,top,width*TILE_SIZE,height*TILE_SIZE,x,y,xscale,yscale,color,alpha)
}