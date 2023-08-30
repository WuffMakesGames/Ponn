function OkaComponentSprite() : OkaComponentAbstract() constructor {
	var style = oka_get_theme()
	
	// variables
	static_width = 32
	static_height = 32
	
	sprite_index = -1
	spritevar_width = 0
	spritevar_height = 0
	
	spritevar_index = 0
	spritevar_speed = 1
	spritevar_number = 0
	
	sprite_quad = -1
	
	// @Public
	static set_sprite = function(sprite) {
		sprite_index = sprite
		spritevar_number = sprite_get_number(sprite)
		spritevar_width = sprite_get_width(sprite)
		spritevar_height = sprite_get_height(sprite)
		return self
	}
	static set_quad = function(left,top,width,height) {
		sprite_quad = [left,top,width,height]
		return self
	}
	
	static set_image_index = function(subimg) {
		spritevar_index = subimg
		return self
	}
	static set_image_speed = function(speed) {
		spritevar_speed = speed
		return self
	}
	
	static get_sprite = function() { return sprite_index }
	static get_quad = function() { return sprite_quad }
	
	// @Private
	static __update = function() {
		if (!sprite_index) {
			draw_rectangle(x,y,width,height,false)
			return;
		}
		
		// animation
		var _sprite_speed = sprite_get_speed(sprite_index)
		var _speed_type = sprite_get_speed_type(sprite_index)
		
		switch (_speed_type) {
			case spritespeed_framespersecond:
				spritevar_index += (_sprite_speed / game_get_speed(gamespeed_fps))*spritevar_speed
				break;
			case spritespeed_framespergameframe:
				spritevar_index += (_sprite_speed / game_get_speed(gamespeed_microseconds))*spritevar_speed
				break;
		}
		
		spritevar_index = spritevar_index % spritevar_number
	}
	
	static __render = function() {
		if (!sprite_index) {
			draw_rectangle(x,y,width,height,false)
			return;
		}
		
		if (sprite_quad != -1) {
			draw_sprite_part_ext(
				sprite_index,spritevar_index,sprite_quad[0],sprite_quad[1],sprite_quad[2],sprite_quad[3],
				x,y,width/sprite_quad[2],height/sprite_quad[3],blend_color,alpha)
		} else {
			draw_sprite_ext(
				sprite_index,spritevar_index,x,y,spritevar_width/width,spritevar_height/height, 
				0,blend_color,alpha)
		}
	}
}