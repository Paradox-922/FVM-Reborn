if global.menu_screen{
	draw_set_alpha(0.5);
	draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);
}
draw_self()
draw_set_font(font_yuan)
draw_set_color(c_white)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_transformed(x,y-325,"信息编辑",0,900,2,2,0)

// 绘制标签
draw_set_font(font_yuan);
draw_set_halign(fa_left);
draw_text(x - 320, y - 175, "角色名:");
draw_text(x - 320, y - 95, "存档槽位:");