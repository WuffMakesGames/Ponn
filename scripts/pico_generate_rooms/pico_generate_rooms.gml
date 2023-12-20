function pico_generate_level(data,table,mapdata) {
	var level = new EverthornLevel()
	
	for (var i = 0; i < array_length(table); i++) {
		var current_data = table[i]
		var width = current_data[2]*16, height = current_data[3]*16
	
		var x1 = current_data[0]*16, y1 = current_data[1]*16
		var x2 = x1 + width, y2 = y1 + height
		var region = new EverthornRegion(x1,y1,width,height)
			
		// load mapdata
		var hex = mapdata[i]
		if (hex != -1) {
			for (var ii = 0; ii < array_length(hex); ii++) {
				var tile_x = ii % width
				var tile_y = floor(ii / width)
				region.set_tile(tile_x,tile_y,hex[ii])
			}
		
		// take from map
		} else { 
			for (var tx = x1; tx < x2; tx++) {
				for (var ty = y1; ty < y2; ty++) {
					region.set_tile(tx-x1,ty-y1,data.map[tx][ty])
				}
			}
		}
			
		level.add_region(region)
	}
	
	// return
	return level
}