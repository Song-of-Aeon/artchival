draw_spr(-count*.85*!lowmotion, -count*.85*!lowmotion, s_arcade, u, u, u, u, u, u, u, 1, 1);

draw_spr(global.plpos.x, global.plpos.y, s_plaque);




if art == noone {
	var spr = s_paint;
	//draw_string(10, 10, "but nobody came.");
} else {
	var spr = art.sprite;
	draw_set_halign(fa_right);
	//draw_string(art.title.x, art.title.y, "title");
	draw_string(global.plpos.x-8, art.author.y, "Artist");
	draw_set_halign(fa_left);
	draw_string(global.plpos.x+8+329, art.date.y, "Date");
	draw_set_halign(fa_right);
	draw_string(global.plpos.x-8, art.series.y, "Series");
	draw_string(global.plpos.x-8, art.software.y, "Software");
	draw_string(global.plpos.x-8, art.hardware.y, "Hardware");
	draw_string(global.plpos.x-8, art.description.y, "Desc");
	iterate art.order to {
		art.order[i].draw();
	}
	
	
	
	
	
}






var duration = 7 sec;
var magnitudineity = 20;
var z=0;
	
var center = new vec2(250, 220);
var maxsize = 170;
var size = new vec2(sprite_get_width(spr), sprite_get_height(spr));
while size.x > maxsize {
	size.y *= maxsize/size.x;
	size.x *= maxsize/size.x;
		
}
if size.y > maxsize {
	size.x *= maxsize/size.y;
	size.y *= maxsize/size.y;
}


draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(s_paint, 0));
	
var varier = easemult(ac_sin, (magcount+(duration/(4*++z)))*!lowmotion, duration, magnitudineity);
draw_vertex_texture(center.x-size.x*1.15-varier, center.y-size.y*1.10-varier, 0, 0);
	
varier = easemult(ac_sin, (magcount+(duration/(4*++z)))*!lowmotion, duration, magnitudineity);
draw_vertex_texture(center.x+size.x*.9+varier, center.y-size.y*1.10-varier, 1, 0);
	
varier = easemult(ac_sin, (magcount+(duration/(4*++z)))*!lowmotion, duration, magnitudineity);
draw_vertex_texture(center.x-size.x*1.15-varier, center.y+size.y*1.28+varier, 0, 1);
	
varier = easemult(ac_sin, (magcount+(duration/(4*++z)))*!lowmotion, duration, magnitudineity);
draw_vertex_texture(center.x+size.x*.9+varier, center.y+size.y*1.28+varier, 1, 1);
	
draw_primitive_end();





draw_spr(40, 800-40, s_options, muted*2, 2, 2);
draw_spr(500-40, 800-40, s_options, 1+lowmotion, 2, 2);


if mouse_within(40-32, 800-40-32, 40+32, 800-40+32) && mouse_check_button_pressed(mb_left) {
	global.volume = muted*100;
	global.music = muted*100;
	muted = !muted;
	audio_stop_all();
	music_set(mus.sonic);
}

if mouse_within(500-40-32, 800-40-32, 500-40+32, 800-40+32) && mouse_check_button_pressed(mb_left) {
	lowmotion = !lowmotion;
}




if art != noone || pressave draw_spr(250, 755, s_ave, pressave);



if spr == s_paint exit;



z=0;
size.x -= 20;
size.y -= 20;
	
draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(spr, 0));
	
var varier = easemult(ac_sin, (magcount+(duration/(4*++z)))*!lowmotion, duration, magnitudineity);
draw_vertex_texture(center.x-size.x-varier, center.y-size.y-varier, 0, 0);
	
varier = easemult(ac_sin, (magcount+(duration/(4*++z)))*!lowmotion, duration, magnitudineity);
draw_vertex_texture(center.x+size.x+varier, center.y-size.y-varier, 1, 0);
	
varier = easemult(ac_sin, (magcount+(duration/(4*++z)))*!lowmotion, duration, magnitudineity);
draw_vertex_texture(center.x-size.x-varier, center.y+size.y+varier, 0, 1);
	
varier = easemult(ac_sin, (magcount+(duration/(4*++z)))*!lowmotion, duration, magnitudineity);
draw_vertex_texture(center.x+size.x+varier, center.y+size.y+varier, 1, 1);
	
draw_primitive_end();










