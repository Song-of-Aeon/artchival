file_dnd_set_enabled(true);
global.plpos = new vec2((500-329)/2, 480);
artthing = function(sprite_, path_) constructor {
	sprite = sprite_;
	path = path_;
	var pos = global.plpos;
	var dif = 20;
	title = new textfield(pos.x+35, pos.y+5, 260, 32, u, u, ft_big);
	author = new textfield(pos.x+35, pos.y+45, 160, 16);
	var bud = environment_get_variable("USERNAME");
	var name = [];
	read bud out {
		array_push(name, string_char_at(bud, i));
	}
	author.text = [name];
	date = new textfield(pos.x+210, pos.y+45, 85, 16);
	series = new textfield(pos.x+35, pos.y+45+dif*1, 200, 16);
	software = new textfield(pos.x+35, pos.y+45+dif*2, 200, 16);
	hardware = new textfield(pos.x+35, pos.y+45+dif*3, 200, 16);
	description = new textfield(pos.x+35, pos.y+45+dif*4, 260, 16*5.5);
	order = [title, author, date, series, software, hardware, description];
}

music_set(mus.sonic, u, u, u, .55);

art = noone;
count = 0;
magcount = 0;
dropped = false;
countplusser = 1;

lowmotion = false;
muted = false;
pressave = false;


file_dnd_set_hwnd(hwnd_main);
file_dnd_set_enabled(true);
dropped = "";
savedropped = "";
file_dnd_pattern = "*.png;*.jpg;*.jpeg;*.gif;*.bmp";
file_dnd_allowmulti = false;
file_dnd_allowdirs = false;
file_dnd_allowfiles = true;