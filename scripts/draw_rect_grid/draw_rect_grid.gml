function draw_rect_grid(x1,y1,x2,y2,grid_size) {
	for (var xx = x1+grid_size-1; xx <= x2-grid_size; xx += grid_size) { draw_line(xx,y1-1,xx,y2-1) }
	for (var yy = y1+grid_size-1; yy <= y2-grid_size; yy += grid_size) { draw_line(x1-1,yy,x2-1,yy) }
}