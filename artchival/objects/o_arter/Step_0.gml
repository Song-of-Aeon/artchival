c
magcount += countplusser;
countplusser = lapp(countplusser, 1, .15);

file_dnd_set_files(file_dnd_pattern, file_dnd_allowfiles, file_dnd_allowdirs, file_dnd_allowmulti);
dropped = file_dnd_get_files();
if keyboard_check_pressed(vk_anykey) se_play(se_type, u, .8, .3);
if dropped != savedropped {
	se_play(se_sploosh);
	savedropped = dropped;
	
	
	if art != noone {
		sprite_delete(art.sprite);
	}
	var spr = sprite_add(dropped, 1, false, false, 0, 0);
	
	//log(spr);
	art = new artthing(spr, dropped);
	var i;
	var thename = [];
	for (i=string_length(dropped); i>0; i--) {
		if string_char_at(dropped, i) == "\\" break;
		array_insert(thename, 0, string_char_at(dropped, i));
	}
	var ext = "";
	for (i=string_length(dropped); i>0; i--) {
		array_pop(thename);
		if string_char_at(dropped, i) == "." break;
		ext = string_char_at(dropped, i) + ext;
		
	}
	art.title.text = [thename];
	art.extension = ext;
	var thedate = "";
	/*var realdate = filetime_access(string_replace_all(dropped, "\\", "/"));
	log(dropped);
	log(realdate);
	read realdate out {
		//if string_char_at(realdate, i) == " " break;
		thedate = thedate + string_char_at(realdate, i);
	}
	art.date.text = [[thedate]];*/
	
	sprite_set_offset(art.sprite, sprite_get_width(art.sprite)/2, sprite_get_height(art.sprite)/2);
	countplusser = 14;
}
if art != noone {
	if mouse_check_button_pressed(mb_left) {
		iterate art.order to {
			var thing = art.order[i];
			thing.active = false;
			if mouse_within(thing.x, thing.y, thing.x+thing.width, thing.y+thing.height) {
				thing.active = true;
				se_play(se_select, u, u, .3);
			}
		}
	}
	iterate art.order to {
		art.order[i].step();
	}
}

if mouse_within(100, 100, 400, 400) && mouse_check_button_pressed(mb_left) {
	se_play(se_wobble, u, u, .3);
	countplusser = 14;
}

if mouse_within(250-218/2, 755-78/2, 250+218/2, 755+78/2) && mouse_check_button_pressed(mb_left) {
	se_play(se_yay);
	countplusser = 14;
	var fold = "Archives/"+art.title.gather()+"_data/";
	fold = string_replace(fold, "\n", "");
	//log(fold);
	//log(art.title);
	//log(art.title.gather());
	var file = file_text_open_write(fold+"data.txt");
	file_text_write_string(file, $"Title - {art.title.gather()}\n");
	file_text_write_string(file, $"Artist - {art.author.gather()}\n");
	file_text_write_string(file, $"Date - {art.date.gather()}\n");
	file_text_write_string(file, $"Series - {art.series.gather()}\n");
	file_text_write_string(file, $"Software - {art.software.gather()}\n");
	file_text_write_string(file, $"Hardware - {art.hardware.gather()}\n");
	file_text_write_string(file, $"Description - {art.description.gather()}\n");
	file_text_close(file);
	log(art.path);
	var pats = fold+art.title.gather()+"."+art.extension;
	pats = string_replace(pats, "\n", "");
	log(pats);
	file_copy(art.path, pats);
	//sprite_save(art.sprite, 0, pats);
	art = noone;
}

pressave = mouse_within(250-218/2, 755-78/2, 250+218/2, 755+78/2) && mouse_check_button(mb_left);