draw_set_alpha(1);
draw_rectangle_color(0, 0, room_width, room_height, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
draw_self();

draw_set_font(font_yuan);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_transformed(302, 55, string(level_passed), 25, 1920, 1.5, 1.5, 0);

var level_name = ["古堡初探", "古堡一障", "古堡二子", "古堡三轮", "古堡四影", "古堡五崩", "古堡六阶", "古堡终破"];
var k = 0;

//绘制关卡
for(var j = 0; j < 2; j++){
	for(var i = 0 ; i< 4; i++){
		if k >= level_unlocked {
			draw_sprite_ext(spr_mod_cs_level, 0, x-608+405*i, y-170+400*j, 1.8, 1.8, 0, c_gray, 1);
			draw_sprite_ext(spr_gods_hall_reward, 0, 239+405*i, 314+400*j, 1.8, 1.8, 0, c_gray, 1);
			//draw_sprite_ext(spr_gods_hall_reward, 3, 346+405*i, 314+400*j, 1.8, 1.8, 0, c_gray, 1);
			//draw_sprite_ext(spr_gods_hall_reward, 5, 453+405*i, 314+400*j, 1.8, 1.8, 0, c_gray, 1);
			draw_set_font(font_hei);
			draw_set_color(c_black);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_ext_transformed(233+405*i, 202+400*j, level_name[k], 25, 1920, 1, 1, 0);
			draw_sprite_ext(spr_star_slot, 7+k, 508+405*i, 204+400*j, 1.8, 1.8, 0, c_gray, 1);
			draw_sprite_ext(spr_mod_cs_level_icon, 0, 228+405*i, 478+400*j, 1.2, 1.2, 0, c_gray, 1);
			 // 绘制黑色描边
	        draw_set_alpha(1);
	        draw_set_color(c_black);
	        draw_roundrect(
	            228+405*i-67,
	            478+400*j-67,
	            228+405*i+65,
	            478+400*j+65,
	            true // 绘制轮廓
	        );
			draw_set_font(font_yuan);
			draw_set_color(c_ltgray);
			draw_text_ext_transformed(312+405*i, 390+400*j, "通过以下关卡后开启：", 25, 1920, 1.2, 1.2, 0);
			draw_set_font(font_hei);
			draw_set_color(c_black);
			draw_text_ext_transformed(412+405*i, 422+400*j, level_name[k-1], 25, 1920, 1, 1, 0);
			//draw_set_color(c_black)
			//draw_set_alpha(0.5)
			//draw_rectangle(x-608+405*i-202, y-170+400*j-200, x-608+405*i+202, y-170+400*j+200, false)
		} else {
			draw_sprite_ext(spr_mod_cs_level, 0, x-608+405*i, y-170+400*j, 1.8, 1.8, 0, c_white, 1);
			draw_sprite_ext(spr_gods_hall_reward, 0, 239+405*i, 314+400*j, 1.8, 1.8, 0, c_white, 1);
			//draw_sprite_ext(spr_gods_hall_reward, 3, 346+405*i, 314+400*j, 1.8, 1.8, 0, c_white, 1);
			//draw_sprite_ext(spr_gods_hall_reward, 5, 453+405*i, 314+400*j, 1.8, 1.8, 0, c_white, 1);
			draw_set_font(font_hei);
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_ext_transformed(233+405*i, 202+400*j, level_name[k], 25, 1920, 1, 1, 0);
			draw_sprite_ext(spr_star_slot, 7+k, 508+405*i, 204+400*j, 1.8, 1.8, 0, c_white, 1);
			draw_sprite_ext(spr_mod_cs_level_icon, 0, 228+405*i, 478+400*j, 1.2, 1.2, 0, c_white, 1);
			 // 绘制黑色描边
	        draw_set_alpha(1);
	        draw_set_color(c_dkgrey);
	        draw_roundrect(
	            228+405*i-67,
	            478+400*j-67,
	            228+405*i+65,
	            478+400*j+65,
	            true // 绘制轮廓
	        );
		}
		k++;
	}
}