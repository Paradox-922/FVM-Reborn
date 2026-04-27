// 从网格数据中移除
if hp < max_hp && !invincible{
	obj_task_manager.card_loss ++
}
card_destroyed(id);

// 注销增伤源
var idx = ds_list_find_index(global.buff_sources, id);
if (idx != -1) {
    ds_list_delete(global.buff_sources, idx);
}
global.buff_dirty = true; // 驱动增伤系统更新

// 创建死亡特效
var effect_inst = instance_create_depth(x, y, depth, obj_aurora_dead_explode);
effect_inst.shape_dead = shape;
if (shape == 0) {
    effect_inst.sprite_index = spr_aurora_dead;  // 假设有对应的精灵，根据 shape 设置
} else if (shape == 1) {
    effect_inst.sprite_index = spr_aurora_dead_1;
} else if (shape == 2) {
    effect_inst.sprite_index = spr_aurora_dead_2;
} else {
    effect_inst.sprite_index = spr_aurora_dead_3;
}

// 3x3 灰烬伤害效果（仅当 shape >= 2）
if (shape >= 2) {
    with (obj_enemy_parent) {
        // 检查是否在 3x3 网格范围内（基于 aurora 的 grid_row 和 grid_col）
        if (grid_row >= other.grid_row - 1 && grid_row <= other.grid_row + 1 &&
            grid_col >= other.grid_col - 1 && grid_col <= other.grid_col + 1) {
            
            // 是否属于“可触发灰烬”的类型
            var can_ash = !immune_to_ash;
            
            // 记录伤害前血量
            var _prev_hp = hp;
            
            // 扣血 900
            hp -= 900;
            
            // 受伤表现
            event_user(0);
            
            // 只有“允许灰烬”的单位才可能触发
            if (can_ash) {
                // 且必须是“这一下打死的”
                if (_prev_hp > 0 && hp <= 0) {
                    if (special_ash) {
                        var inst = instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
                        inst.special_ash = true;
                        inst.sprite_index = sprite_index;
                        inst.image_index = image_index;
                    } else {
                        instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
                    }
                    
                    // 销毁敌人
                    instance_destroy();
                }
            }
        }
    }
	audio_play_sound(snd_coke_bomb_explode, 0, false);
}