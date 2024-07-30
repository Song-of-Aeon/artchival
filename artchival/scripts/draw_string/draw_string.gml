function draw_string(x, y, str, font=draw_get_font(), scale=1, color=draw_get_color(), angle=0, alpha=draw_get_alpha(), maxwidth=9999, lineseperation=14) {
	x += pi/30;
	y += pi/30;
	//x = round(x);
	//y = round(y);
	var col = draw_get_color();
	var alph = draw_get_alpha();
	draw_set_color(color);
	draw_set_font(font);
	draw_set_alpha(alpha);
	//var height = string_size("O").y*1.2;
	draw_text_ext_transformed(x, y, string(str), lineseperation, maxwidth, scale, scale, angle);
	draw_set_color(col);
	draw_set_alpha(alph);
}

function draw_string_ext(x, y, str, maxwidth=u, lineseperation=u) {
	draw_string(x, y, str, u, u, u, u, u, maxwidth, lineseperation);
}

#macro draw_text draw_string
//#macro draw_text_ext draw_string_ext