function draw_spr(x, y, thing, index=0, xscale=1, yscale=1, angle=0, color=c_white, alpha=draw_get_alpha(), antialiased=false, tilex=false, tiley=false) {
	/*switch typeof(thing) {
		case "string":
		case "array":
		case "struct":
			if !parameter parameter = u;
			draw_string(x, y, thing, parameter, scale, angle, color);
			exit;
		default:
			
	}*/
	//exit;
	/*if thing == s_mistake || thing == s_regret && alpha > .1 {
		
	}*/
	if antialiased gpu_set_tex_filter(true);
	if tilex || tiley {
		var spr = {
			width: sprite_get_width(thing),
			height: sprite_get_height(thing),
		}
		var surf = {
			width: surface_get_width(surface_get_target()),
			height: surface_get_height(surface_get_target()),
		}
		var i, j;
		var offset = {
			x: x%spr.width,
			y: y%spr.height,
		}
		var positions = [];
		if tilex && !tiley {
			for (i=-offset.x-300; i<=surf.width+spr.width; i+=spr.width) {
				array_push(positions, new vec2(i, y));
			}
		} else if tiley && !tilex {
			for (i=-offset.y-300; i<=surf.height+spr.height; i+=spr.height) {
				array_push(positions, new vec2(x, i));
			}
		} else {
			for (i=-offset.x-300; i<=surf.width+spr.width; i+=spr.width) {
				for (j=-offset.y-300; j<=surf.height+spr.height; j+=spr.height) {
					array_push(positions, new vec2(i, j));
				}
			}
		}
		iterate positions to {
			draw_sprite_ext(thing, index, positions[i].x, positions[i].y, xscale, yscale, angle, color, alpha);
		}
	} else {
		draw_sprite_ext(thing, index, x, y, xscale, yscale, angle, color, alpha);
	}
	if antialiased gpu_set_tex_filter(false);
}