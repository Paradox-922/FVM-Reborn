if (global.is_paused) {
	image_speed = 0;
    exit;

}

image_speed = 0.5;

// 物理运动规律
x += move_speed;
y -= cvspeed;
cvspeed -= cgravity;

if (x > 2200 || y > 1200 || x < -200 || y < -200) {
    instance_destroy();
}

// ==========================================
// 落地引爆逻辑 (包含目标死亡、以及空弹洗地)
// ==========================================
// cvspeed < 0 意味着子弹越过了抛物线最高点，正在下落
// y >= thrower_y 意味着子弹回到了投手所在的地平线高度
if (cvspeed < 0 && y >= thrower_y) {
    
    // 如果它碰巧还没撞到任何僵尸，但砸到了地上
    if (!hit_enemy) {
        // 创建砸地特效 (替换为你自己的特效名字)
            var inst = instance_create_depth(x, y, depth, obj_iceeggboilerpult_bullet_effect);
	        if shape == 3{
	           inst.sprite_index = spr_ymir_bullet_effect
	        }
	        if shape == 2{
	           inst.sprite_index = spr_ymir_bullet_effect_1
	        }
	        if shape == 1{
	           inst.sprite_index = spr_ymir_bullet_effect_2
        	}
	        if shape == 0{
	           inst.sprite_index = spr_ymir_bullet_effect_3
         	}
			audio_play_sound(snd_egg_bullet, 0, 0);
            instance_destroy();
    }
}