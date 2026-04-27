if ds_list_find_index(hitted_enemy,other.id) == -1{

    if other.hp > 0 
    && (row == other.grid_row - 1 || row == other.grid_row || row == other.grid_row + 1)
    && can_hit(target_type,other.target_type)
    {
        with(other){
            audio_play_sound(hit_sound,0,0);

            // 20% 概率定身 2 秒（120帧）
            if(random(100) < 20) {
                if(stun_timer < 120) {
                    stun_timer = 120;
                }
            }

            // 20% 概率暴击：伤害翻倍 + 播放暴击动画
            var is_crit = false;
            if(random(100) < 20) {
                is_crit = true;
                // 播放暴击动画（把 obj_crit_effect 换成你自己的暴击特效）
                instance_create_depth(x, y - 30, depth + 10, obj_sh_b_3_e);
            }

            // 计算最终伤害：暴击则翻倍
            var final_damage = other.damage;
            if(is_crit) final_damage *= 2;

            // 扣血逻辑
            if (hp > final_damage) {
                hp -= final_damage;
                event_user(0);
            } else {
                if special_ash{
                    var inst = instance_create_depth(x,y-20,depth,obj_mouse_ash_death);
                    inst.special_ash = true;
                    inst.sprite_index = sprite_index;
                    inst.image_index = image_index;
                }
                else{
                    instance_create_depth(x,y-20,depth,obj_mouse_ash_death);
                }
                instance_destroy();
            }
        }
        ds_list_add(hitted_enemy,other.id);
    }
}
