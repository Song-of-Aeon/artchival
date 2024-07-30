function draw_surface_normal(surface, topleft, topright, bottomleft, bottomright) {
	draw_primitive_begin_texture(pr_trianglestrip, surface_get_texture(surface));
	var i;
	var width = surface_get_height(surface);
	var height = surface_get_height(surface);
	//for (i=0; i<height; i+=imprecision) {
		draw_vertex_texture(topleft.x, topleft.y, 0, 0);
		draw_vertex_texture(topright.x, topright.y, 1, 0);
		draw_vertex_texture(bottomleft.x, bottomleft.y, 0, 1);
		draw_vertex_texture(bottomright.x, bottomright.y, 1, 1);
	//}
	draw_primitive_end();
}